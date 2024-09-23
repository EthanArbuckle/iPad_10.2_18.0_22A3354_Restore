@implementation PhotosNotificationsUpdatesViewController

- (void)loadView
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PhotosNotificationsUpdatesViewController setView:](self, "setView:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PhotosNotificationsUpdatesViewController;
  -[PhotosNotificationsUpdatesViewController viewWillAppear:](&v5, "viewWillAppear:");
  -[PUOneUpPresentationHelper presentingViewControllerViewWillAppear:](self->_oneUpPresentationHelper, "presentingViewControllerViewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PhotosNotificationsUpdatesViewController;
  -[PhotosNotificationsUpdatesViewController viewDidAppear:](&v5, "viewDidAppear:");
  -[PUOneUpPresentationHelper presentingViewControllerViewDidAppear:](self->_oneUpPresentationHelper, "presentingViewControllerViewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PhotosNotificationsUpdatesViewController;
  -[PhotosNotificationsUpdatesViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  -[PUOneUpPresentationHelper presentingViewControllerViewWillDisappear:](self->_oneUpPresentationHelper, "presentingViewControllerViewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PhotosNotificationsUpdatesViewController;
  -[PhotosNotificationsUpdatesViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  -[PUOneUpPresentationHelper presentingViewControllerViewDidDisappear:](self->_oneUpPresentationHelper, "presentingViewControllerViewDidDisappear:", v3);
  -[PhotosNotificationsUpdatesViewController _dismissOneUpViewController](self, "_dismissOneUpViewController");
}

- (id)_photosDataSourceForAssetUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", a3));
  v16 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHFetchOptions px_standardFetchOptions](PHFetchOptions, "px_standardFetchOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection transientAssetCollectionWithAssetFetchResult:title:](PHAssetCollection, "transientAssetCollectionWithAssetFetchResult:title:", v6, 0));
  v15 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHCollectionList transientCollectionListWithCollections:title:](PHCollectionList, "transientCollectionListWithCollections:title:", v8, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHFetchOptions px_standardFetchOptions](PHFetchOptions, "px_standardFetchOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHCollectionList fetchCollectionsInCollectionList:options:](PHCollectionList, "fetchCollectionsInCollectionList:options:", v9, v10));

  v12 = objc_msgSend(objc_alloc((Class)PXPhotosDataSourceConfiguration), "initWithCollectionListFetchResult:options:", v11, 0);
  v13 = objc_msgSend(objc_alloc((Class)PXPhotosDataSource), "initWithPhotosDataSourceConfiguration:", v12);

  return v13;
}

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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosNotificationsUpdatesViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = 0.0;
  if (width > 0.0)
    v9 = floor(height * (v8 / width));
  -[PhotosNotificationsUpdatesViewController preferredContentSize](self, "preferredContentSize");
  if (v11 != v8 || v10 != v9)
    -[PhotosNotificationsUpdatesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v9);
}

- (void)_presentOneUpViewControllerForAssetUUID:(id)a3
{
  PUOneUpPresentationHelper *v4;
  PUOneUpPresentationHelper *oneUpPresentationHelper;
  void *v6;
  UIViewController *v7;
  UIViewController *previewViewController;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[PhotosNotificationsUpdatesViewController _photosDataSourceForAssetUUID:](self, "_photosDataSourceForAssetUUID:", a3));
  v4 = (PUOneUpPresentationHelper *)objc_msgSend(objc_alloc((Class)PUOneUpPresentationHelper), "initWithPhotosDataSource:", v16);
  oneUpPresentationHelper = self->_oneUpPresentationHelper;
  self->_oneUpPresentationHelper = v4;

  -[PUOneUpPresentationHelper setDelegate:](self->_oneUpPresentationHelper, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "indexPathForFirstAsset"));
  v7 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[PUOneUpPresentationHelper previewViewControllerForItemAtIndexPath:allowingActions:](self->_oneUpPresentationHelper, "previewViewControllerForItemAtIndexPath:allowingActions:", v6, 0));
  previewViewController = self->_previewViewController;
  self->_previewViewController = v7;

  -[PhotosNotificationsUpdatesViewController addChildViewController:](self, "addChildViewController:", self->_previewViewController);
  -[UIViewController preferredContentSize](self->_previewViewController, "preferredContentSize");
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_previewViewController, "view"));
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosNotificationsUpdatesViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosNotificationsUpdatesViewController view](self, "view"));
  objc_msgSend(v15, "addSubview:", v13);

  -[UIViewController didMoveToParentViewController:](self->_previewViewController, "didMoveToParentViewController:", self);
  -[PhotosNotificationsUpdatesViewController _updatePreferredContentSizeForPreferredPreviewSize:](self, "_updatePreferredContentSizeForPreferredPreviewSize:", v10, v12);

}

- (void)_dismissOneUpViewController
{
  void *v3;
  UIViewController *previewViewController;
  PUOneUpPresentationHelper *oneUpPresentationHelper;

  -[UIViewController willMoveToParentViewController:](self->_previewViewController, "willMoveToParentViewController:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_previewViewController, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self->_previewViewController, "removeFromParentViewController");
  previewViewController = self->_previewViewController;
  self->_previewViewController = 0;

  -[PUOneUpPresentationHelper setDelegate:](self->_oneUpPresentationHelper, "setDelegate:", 0);
  oneUpPresentationHelper = self->_oneUpPresentationHelper;
  self->_oneUpPresentationHelper = 0;

}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 38;
}

- (void)_likeAssetWithCloudAssetUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetWithUUID:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
  v13 = 0;
  v7 = +[PLPhotoSharingHelper canSetUserCloudSharedLiked:forAssets:error:](PLPhotoSharingHelper, "canSetUserCloudSharedLiked:forAssets:error:", 1, v6, &v13);
  v8 = v13;

  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000239C;
    v11[3] = &unk_1000041B0;
    v12 = v5;
    objc_msgSend(v4, "performTransaction:", v11);
    v9 = v12;
  }
  else
  {
    v10 = PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Cannot like asset with UUID: \"%@\", Error: %@", buf, 0x16u);
    }
  }

}

- (void)_sendComment:(id)a3 toAssetWithCloudAssetUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002378;
    v9[3] = &unk_1000041D8;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetWithUUID:", v6));
    v11 = v5;
    v8 = v10;
    objc_msgSend(v7, "performTransaction:", v9);

  }
}

- (void)didReceiveNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kNotificationKeyAssetUUID));
  v8 = PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received notification for asset UUID: \"%@\", buf, 0xCu);
  }

  if (v7)
  {
    -[PhotosNotificationsUpdatesViewController _presentOneUpViewControllerForAssetUUID:](self, "_presentOneUpViewControllerForAssetUUID:", v7);
    global_queue = dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000022EC;
    block[3] = &unk_1000041B0;
    v13 = v6;
    dispatch_async(v11, block);

  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  id v6;

  v6 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  PLProcessNotificationResponse(v6);
  v5[2](v5, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_oneUpPresentationHelper, 0);
}

@end
