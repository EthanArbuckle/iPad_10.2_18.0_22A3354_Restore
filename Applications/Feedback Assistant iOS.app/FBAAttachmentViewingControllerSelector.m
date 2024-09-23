@implementation FBAAttachmentViewingControllerSelector

+ (BOOL)fallbackToOpaqueViewer
{
  return 1;
}

+ (id)controllerForAttachment:(id)a3
{
  id v4;
  FBABugFormFileBrowserTableViewController *v5;
  void *v6;
  FBABugFormFileBrowserTableViewController *v7;
  FBABugFormFileBrowserTableViewController *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "hasGroup"))
  {
    v5 = [FBABugFormFileBrowserTableViewController alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "group"));
    v7 = -[FBABugFormFileBrowserTableViewController initWithGroup:](v5, "initWithGroup:", v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "item"));
    v7 = (FBABugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "controllerForItem:", v6));
  }
  v8 = v7;

  if (!v8)
  {
    if (objc_msgSend(a1, "fallbackToOpaqueViewer"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "item"));
      v8 = (FBABugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_opaqueVCWithItem:", v9));

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (id)controllerForItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100098B00(v6);

    goto LABEL_11;
  }
  if (+[FBAOpaqueFileViewController shouldDisplayItem:](FBAOpaqueFileViewController, "shouldDisplayItem:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_opaqueVCWithItem:", v4));
    if (!v5)
    {
LABEL_9:
      if (objc_msgSend(a1, "fallbackToOpaqueViewer"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_opaqueVCWithItem:", v4));
        goto LABEL_12;
      }
LABEL_11:
      v5 = 0;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attachedPath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "controllerForUrl:useFallback:", v7, 0));

    if (!v5)
      goto LABEL_9;
  }
LABEL_12:

  return v5;
}

+ (id)controllerForUrl:(id)a3
{
  return objc_msgSend(a1, "controllerForUrl:useFallback:", a3, 1);
}

+ (id)controllerForUrl:(id)a3 useFallback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  FBABugFormFileBrowserTableViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  _BOOL4 v23;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appStoryboard"));

  if (+[FBAOSLogViewController canDisplayURL:](FBAOSLogViewController, "canDisplayURL:", v6))
  {
    v9 = (FBABugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", CFSTR("FBAOSLogViewController")));
    -[FBABugFormFileBrowserTableViewController setOSLogURL:](v9, "setOSLogURL:", v6);
    goto LABEL_14;
  }
  if (+[FBASqliteIndexViewController canDisplayURL:](FBASqliteIndexViewController, "canDisplayURL:", v6))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", CFSTR("FBASqliteIndexViewController")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBASqliteIndexViewController dbUrlForMetadataUrl:](FBASqliteIndexViewController, "dbUrlForMetadataUrl:", v6));
    if (v11)
    {
      objc_msgSend(v10, "setDbUrl:", v11);
      v9 = v10;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_14;
  }
  if (+[FBAPowerLogIndexViewController canDisplayURL:](FBAPowerLogIndexViewController, "canDisplayURL:", v6))
  {
    v9 = (FBABugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", CFSTR("FBAPowerLogViewController")));
    -[FBABugFormFileBrowserTableViewController setPowerLogURL:](v9, "setPowerLogURL:", v6);
    goto LABEL_14;
  }
  if (+[FBABugFormAttachmentPreview canPreviewItem:](FBABugFormAttachmentPreview, "canPreviewItem:", v6))
  {
    if (+[FBABugFormAttachmentPreview urlPointsToTextFile:](FBABugFormAttachmentPreview, "urlPointsToTextFile:", v6))
    {
      v12 = objc_claimAutoreleasedReturnValue(+[FBABugFormAttachmentPreview textFileForURL:](FBABugFormAttachmentPreview, "textFileForURL:", v6));

      v6 = (id)v12;
    }
    v9 = (FBABugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue(+[UIDocumentInteractionController interactionControllerWithURL:](UIDocumentInteractionController, "interactionControllerWithURL:", v6));
LABEL_14:
    if (v9)
      goto LABEL_25;
  }
  v19 = 0;
  v13 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v19, NSURLIsDirectoryKey, 0);
  v14 = v19;
  v15 = v14;
  if (v13 && (objc_msgSend(v14, "BOOLValue") & 1) != 0)
  {
    v9 = -[FBABugFormFileBrowserTableViewController initWithUrl:]([FBABugFormFileBrowserTableViewController alloc], "initWithUrl:", v6);

    if (v9)
      goto LABEL_25;
  }
  else
  {

  }
  v16 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v6;
    v22 = 1024;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Cannot display file [%{public}@], will fallback to opaque controller %d", buf, 0x12u);
  }

  if (v4)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[DEDAttachmentItem itemWithURL:](DEDAttachmentItem, "itemWithURL:", v6));
    v9 = (FBABugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_opaqueVCWithItem:", v17));

  }
  else
  {
    v9 = 0;
  }
LABEL_25:

  return v9;
}

+ (id)_opaqueVCWithItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appStoryboard"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "instantiateViewControllerWithIdentifier:", CFSTR("FBAOpaqueFileViewController")));
  objc_msgSend(v6, "setItem:", v3);

  return v6;
}

@end
