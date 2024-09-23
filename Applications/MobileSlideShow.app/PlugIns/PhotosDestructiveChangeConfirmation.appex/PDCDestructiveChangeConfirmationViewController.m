@implementation PDCDestructiveChangeConfirmationViewController

- (id)_contentViewControllerForUserInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  PDCRemoteAssetPreviewController *v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("previewStyle")));
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("assetLocalIdentifiers")));
    v7 = objc_opt_class(NSString);
    v8 = v6;
    v9 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v13 = v11;
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v11);
          if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), v7) & 1) == 0)
          {
            v13 = 0;
            goto LABEL_16;
          }
        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
          continue;
        break;
      }
      v13 = v11;
    }
LABEL_16:
    v18 = v13;

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("currentAssets")))
    {
      v17 = objc_alloc_init(PDCRemoteAssetPreviewController);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("photoLibraryURLString")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v19));
      -[PDCRemoteAssetPreviewController setPhotoLibraryURL:](v17, "setPhotoLibraryURL:", v20);

      -[PDCRemoteAssetPreviewController setAssetLocalIdentifiers:](v17, "setAssetLocalIdentifiers:", v18);
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)configureWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double y;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCDestructiveChangeConfirmationViewController extensionContext](self, "extensionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inputItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCDestructiveChangeConfirmationViewController _contentViewControllerForUserInfo:](self, "_contentViewControllerForUserInfo:", v8));
  if (v9)
  {
    -[PDCDestructiveChangeConfirmationViewController addChildViewController:](self, "addChildViewController:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCDestructiveChangeConfirmationViewController view](self, "view"));
    y = CGRectZero.origin.y;
    objc_msgSend(v9, "preferredContentSize");
    objc_msgSend(v10, "setFrame:", CGRectZero.origin.x, y, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v14, "setAutoresizingMask:", 18);
    objc_msgSend(v10, "addSubview:", v14);
    objc_msgSend(v9, "didMoveToParentViewController:", self);
    objc_msgSend(v9, "preferredContentSize");
    -[PDCDestructiveChangeConfirmationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    v4[2](v4);

  }
  else
  {
    v15 = PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to load view controller for user info %@", (uint8_t *)&v17, 0xCu);
    }

    -[PDCDestructiveChangeConfirmationViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGSizeZero.width, CGSizeZero.height);
    v4[2](v4);

  }
}

@end
