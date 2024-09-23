@implementation PhotosMemoriesNotificationsUpdatesViewController

- (void)_updatePreferredContentSizeForPreferredPreviewSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMemoriesNotificationsUpdatesViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = 0.0;
  if (width > 0.0)
    v9 = floor(height * (v8 / width));
  -[PhotosMemoriesNotificationsUpdatesViewController preferredContentSize](self, "preferredContentSize");
  if (v11 != v8 || v10 != v9)
    -[PhotosMemoriesNotificationsUpdatesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v9);
}

- (void)_presentViewControllerForMemoryUUID:(id)a3 photoLibraryURLString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  UIViewController *v18;
  UIViewController *previewViewController;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  void *v32;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosMemoriesNotificationsUpdatesViewController.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memoryUUID"));

  }
  if (self->_previewViewController)
    -[PhotosMemoriesNotificationsUpdatesViewController _dismissOneUpViewController](self, "_dismissOneUpViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHMemory localIdentifierWithUUID:](PHMemory, "localIdentifierWithUUID:", v7));
  v10 = objc_alloc((Class)PHPhotoLibrary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
  v12 = objc_msgSend(v10, "initWithPhotoLibraryURL:", v11);

  if (!objc_msgSend(v12, "openAndWaitWithUpgrade:error:", 0, 0))
    goto LABEL_8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "librarySpecificFetchOptions"));
  objc_msgSend(v13, "setIncludePendingMemories:", 1);
  v32 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v14, v13));

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PXPhotosDetailsContext photosDetailsContextForMemory:](PXPhotosDetailsContext, "photosDetailsContextForMemory:", v16));
    v18 = (UIViewController *)objc_msgSend(objc_alloc((Class)PXPhotosDetailsUIViewController), "initWithContext:options:", v17, 8);
    previewViewController = self->_previewViewController;
    self->_previewViewController = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMemoriesNotificationsUpdatesViewController view](self, "view"));
    objc_msgSend(v20, "bounds");
    v22 = v21;
    v24 = v23;

    -[UIViewController setPreferredContentSize:](self->_previewViewController, "setPreferredContentSize:", v22, v24);
    -[PhotosMemoriesNotificationsUpdatesViewController addChildViewController:](self, "addChildViewController:", self->_previewViewController);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_previewViewController, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMemoriesNotificationsUpdatesViewController view](self, "view"));
    objc_msgSend(v26, "bounds");
    objc_msgSend(v25, "setFrame:");

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMemoriesNotificationsUpdatesViewController view](self, "view"));
    objc_msgSend(v27, "addSubview:", v25);

    -[UIViewController didMoveToParentViewController:](self->_previewViewController, "didMoveToParentViewController:", self);
    -[UIViewController preferredContentSize](self->_previewViewController, "preferredContentSize");
    -[PhotosMemoriesNotificationsUpdatesViewController _updatePreferredContentSizeForPreferredPreviewSize:](self, "_updatePreferredContentSizeForPreferredPreviewSize:");

  }
  else
  {
LABEL_8:
    v28 = PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No memory was fetchable with memory UUID: \"%@\", hence can't present detail view context for that memory.", buf, 0xCu);
    }
  }

}

- (void)_dismissOneUpViewController
{
  void *v3;
  UIViewController *previewViewController;

  -[UIViewController willMoveToParentViewController:](self->_previewViewController, "willMoveToParentViewController:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_previewViewController, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self->_previewViewController, "removeFromParentViewController");
  previewViewController = self->_previewViewController;
  self->_previewViewController = 0;

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PhotosMemoriesNotificationsUpdatesViewController;
  -[PhotosMemoriesNotificationsUpdatesViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[PhotosMemoriesNotificationsUpdatesViewController _dismissOneUpViewController](self, "_dismissOneUpViewController");
}

- (void)didReceiveNotification:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kNotificationKeyMemoryUUID));
  if (!v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosMemoriesNotificationsUpdatesViewController.m"), 107, CFSTR("Missing memory UUID for Memories Notification."));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kNotificationKeyPhotoLibraryURLString));
  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosMemoriesNotificationsUpdatesViewController.m"), 110, CFSTR("Missing photoLibraryURLString for Memories Notification."));

  }
  -[PhotosMemoriesNotificationsUpdatesViewController _presentViewControllerForMemoryUUID:photoLibraryURLString:](self, "_presentViewControllerForMemoryUUID:photoLibraryURLString:", v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewViewController, 0);
}

@end
