void sub_100002280(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1000022A0(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x10000224CLL);
}

void sub_1000022EC(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", kNotificationKeyAlbumCloudGUID));
  if (v4)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "assetsdClient"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "notificationClient"));
    objc_msgSend(v3, "asyncNotifyUserViewedNotificationWithAlbumCloudGUID:", v4);

  }
}

id sub_100002378(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userAddCloudSharedCommentWithText:", *(_QWORD *)(a1 + 40));
}

id sub_10000239C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserCloudSharedLiked:", 1);
}

id objc_msgSend__dismissOneUpViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissOneUpViewController");
}

id objc_msgSend__photosDataSourceForAssetUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_photosDataSourceForAssetUUID:");
}

id objc_msgSend__presentOneUpViewControllerForAssetUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentOneUpViewControllerForAssetUUID:");
}

id objc_msgSend__updatePreferredContentSizeForPreferredPreviewSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePreferredContentSizeForPreferredPreviewSize:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetWithUUID:");
}

id objc_msgSend_assetsdClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetsdClient");
}

id objc_msgSend_asyncNotifyUserViewedNotificationWithAlbumCloudGUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asyncNotifyUserViewedNotificationWithAlbumCloudGUID:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_canSetUserCloudSharedLiked_forAssets_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canSetUserCloudSharedLiked:forAssets:error:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_fetchAssetsWithLocalIdentifiers_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAssetsWithLocalIdentifiers:options:");
}

id objc_msgSend_fetchCollectionsInCollectionList_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchCollectionsInCollectionList:options:");
}

id objc_msgSend_indexPathForFirstAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForFirstAsset");
}

id objc_msgSend_initWithCollectionListFetchResult_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCollectionListFetchResult:options:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithPhotosDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhotosDataSource:");
}

id objc_msgSend_initWithPhotosDataSourceConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhotosDataSourceConfiguration:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localIdentifierWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdentifierWithUUID:");
}

id objc_msgSend_notificationClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationClient");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_performTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performTransaction:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_presentingViewControllerViewDidAppear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewControllerViewDidAppear:");
}

id objc_msgSend_presentingViewControllerViewDidDisappear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewControllerViewDidDisappear:");
}

id objc_msgSend_presentingViewControllerViewWillAppear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewControllerViewWillAppear:");
}

id objc_msgSend_presentingViewControllerViewWillDisappear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewControllerViewWillDisappear:");
}

id objc_msgSend_previewViewControllerForItemAtIndexPath_allowingActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewViewControllerForItemAtIndexPath:allowingActions:");
}

id objc_msgSend_px_standardFetchOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "px_standardFetchOptions");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemPhotoLibrary");
}

id objc_msgSend_transientAssetCollectionWithAssetFetchResult_title_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transientAssetCollectionWithAssetFetchResult:title:");
}

id objc_msgSend_transientCollectionListWithCollections_title_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transientCollectionListWithCollections:title:");
}

id objc_msgSend_userAddCloudSharedCommentWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAddCloudSharedCommentWithText:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}
