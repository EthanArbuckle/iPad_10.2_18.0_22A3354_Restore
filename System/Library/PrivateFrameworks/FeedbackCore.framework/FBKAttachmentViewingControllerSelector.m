@implementation FBKAttachmentViewingControllerSelector

+ (BOOL)fallbackToOpaqueViewer
{
  return 1;
}

+ (id)controllerForAttachment:(id)a3
{
  id v4;
  FBKBugFormFileBrowserTableViewController *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "hasGroup"))
  {
    v5 = [FBKBugFormFileBrowserTableViewController alloc];
    objc_msgSend(v4, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FBKBugFormFileBrowserTableViewController initWithGroup:](v5, "initWithGroup:", v6);
  }
  else
  {
    objc_msgSend(v4, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "controllerForItem:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  if (!v8)
  {
    if (objc_msgSend(a1, "fallbackToOpaqueViewer"))
    {
      objc_msgSend(v4, "item");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_opaqueVCWithItem:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  if (!v4)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[FBKAttachmentViewingControllerSelector controllerForItem:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    goto LABEL_11;
  }
  if (+[FBKOpaqueFileViewController shouldDisplayItem:](FBKOpaqueFileViewController, "shouldDisplayItem:", v4))
  {
    objc_msgSend(a1, "_opaqueVCWithItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_9:
      if (objc_msgSend(a1, "fallbackToOpaqueViewer"))
      {
        objc_msgSend(a1, "_opaqueVCWithItem:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
LABEL_11:
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "attachedPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "controllerForUrl:useFallback:", v14, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_9;
  }
LABEL_12:

  return v5;
}

+ (id)controllerForUrl:(id)a3
{
  return (id)objc_msgSend(a1, "controllerForUrl:useFallback:", a3, 1);
}

+ (id)imageControllerForAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  if ((objc_msgSend(v3, "hasGroup") & 1) != 0)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[FBKAttachmentViewingControllerSelector controllerForItem:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_8;
  }
  v5 = v4;
  objc_msgSend(v4, "attachedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[FBKImageAttachmentViewController canDisplayURL:](FBKImageAttachmentViewController, "canDisplayURL:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEBD9A0], "mainStoryboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", CFSTR("FBKImageAttachmentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachedPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImageUrl:", v10);

  }
  else
  {
    v9 = 0;
  }

LABEL_11:
  return v9;
}

+ (id)controllerForUrl:(id)a3 useFallback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  FBKBugFormFileBrowserTableViewController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEBD9A0], "mainStoryboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[FBKOSLogViewController canDisplayURL:](FBKOSLogViewController, "canDisplayURL:", v6))
  {
    objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", CFSTR("FBKOSLogViewController"));
    v8 = (FBKBugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormFileBrowserTableViewController setOSLogURL:](v8, "setOSLogURL:", v6);
    goto LABEL_14;
  }
  if (+[FBKSqliteIndexViewController canDisplayURL:](FBKSqliteIndexViewController, "canDisplayURL:", v6))
  {
    objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", CFSTR("FBKSqliteIndexViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKSqliteIndexViewController dbUrlForMetadataUrl:](FBKSqliteIndexViewController, "dbUrlForMetadataUrl:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "setDbUrl:", v10);
      v8 = v9;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_14;
  }
  if (+[FBKPowerLogIndexViewController canDisplayURL:](FBKPowerLogIndexViewController, "canDisplayURL:", v6))
  {
    objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", CFSTR("FBKPowerLogViewController"));
    v8 = (FBKBugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue();
    -[FBKBugFormFileBrowserTableViewController setPowerLogURL:](v8, "setPowerLogURL:", v6);
    goto LABEL_14;
  }
  if (+[FBKBugFormAttachmentPreview canPreviewItem:](FBKBugFormAttachmentPreview, "canPreviewItem:", v6))
  {
    if (+[FBKBugFormAttachmentPreview urlPointsToTextFile:](FBKBugFormAttachmentPreview, "urlPointsToTextFile:", v6))
    {
      +[FBKBugFormAttachmentPreview textFileForURL:](FBKBugFormAttachmentPreview, "textFileForURL:", v6);
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v11;
    }
    objc_msgSend(MEMORY[0x24BE8F668], "interactionControllerWithURL:", v6);
    v8 = (FBKBugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    if (v8)
      goto LABEL_25;
  }
  v18 = 0;
  v12 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v18, *MEMORY[0x24BDBCC60], 0);
  v13 = v18;
  v14 = v13;
  if (v12 && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    v8 = -[FBKBugFormFileBrowserTableViewController initWithUrl:]([FBKBugFormFileBrowserTableViewController alloc], "initWithUrl:", v6);

    if (v8)
      goto LABEL_25;
  }
  else
  {

  }
  +[FBKLog appHandle](FBKLog, "appHandle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_INFO, "Cannot display file [%{public}@], will fallback to opaque controller %d", buf, 0x12u);
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE2CA20], "itemWithURL:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_opaqueVCWithItem:", v16);
    v8 = (FBKBugFormFileBrowserTableViewController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
LABEL_25:

  return v8;
}

+ (id)_opaqueVCWithItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEBD9A0];
  v4 = a3;
  objc_msgSend(v3, "mainStoryboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instantiateViewControllerWithIdentifier:", CFSTR("FBKOpaqueFileViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItem:", v4);

  return v6;
}

+ (void)controllerForItem:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "item is nil in _controllerForItem", a5, a6, a7, a8, 0);
}

@end
