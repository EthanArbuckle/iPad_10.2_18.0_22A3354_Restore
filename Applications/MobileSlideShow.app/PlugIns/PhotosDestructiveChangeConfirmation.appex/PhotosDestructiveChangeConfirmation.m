void sub_100001E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001EA0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100001EB0(uint64_t a1)
{

}

void sub_100001EB8(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeliveryMode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](PHImageManager, "defaultManager"));
    v6 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100001F7C;
    v9[3] = &unk_1000041E8;
    v9[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, v6, v8, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
}

void sub_100001F7C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1000025F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002614(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002624(uint64_t a1)
{

}

void sub_10000262C(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeliveryMode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](PHImageManager, "defaultManager"));
    v6 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002740;
    v9[3] = &unk_1000041E8;
    v9[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, v6, v8, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
}

intptr_t sub_1000026F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(+[PLVideoTranscoder generatePosterFrameForAVAsset:maxSize:error:](PLVideoTranscoder, "generatePosterFrameForAVAsset:maxSize:error:", a2, 0, *(double *)(a1 + 48), *(double *)(a1 + 56)));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100002740(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__contentViewControllerForUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contentViewControllerForUserInfo:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_assetLocalIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetLocalIdentifiers");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fetchAssetsWithLocalIdentifiers_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAssetsWithLocalIdentifiers:options:");
}

id objc_msgSend_fetchOptionsWithInclusiveDefaultsForPhotoLibrary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_generatePosterFrameForAVAsset_maxSize_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePosterFrameForAVAsset:maxSize:error:");
}

id objc_msgSend_generatePosterFrameForVideoAtURL_maxSize_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePosterFrameForVideoAtURL:maxSize:error:");
}

id objc_msgSend_imageForAsset_targetSize_contentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageForAsset:targetSize:contentMode:");
}

id objc_msgSend_imagesWithTargetSize_contentMode_maximumCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imagesWithTargetSize:contentMode:maximumCount:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_maximumNumberOfVisibleImagesForStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumNumberOfVisibleImagesForStyle:");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaType");
}

id objc_msgSend_numberOfVisibleItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfVisibleItems");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openPhotoLibraryWithURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openPhotoLibraryWithURL:options:error:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_photoLibraryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoLibraryURL");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_renderedContentURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderedContentURLs");
}

id objc_msgSend_requestAVAssetForVideo_options_resultHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAVAssetForVideo:options:resultHandler:");
}

id objc_msgSend_requestImageForAsset_targetSize_contentMode_options_resultHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestImageForAsset:targetSize:contentMode:options:resultHandler:");
}

id objc_msgSend_setAssetLocalIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetLocalIdentifiers:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setDeliveryMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeliveryMode:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setImage_forItemAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:forItemAtIndex:");
}

id objc_msgSend_setNumberOfVisibleItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfVisibleItems:");
}

id objc_msgSend_setPhotoDecoration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhotoDecoration:");
}

id objc_msgSend_setPhotoLibraryURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhotoLibraryURL:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setStackOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStackOffset:");
}

id objc_msgSend_setStackPerspectiveInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStackPerspectiveInsets:");
}

id objc_msgSend_setStackPerspectiveOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStackPerspectiveOffset:");
}

id objc_msgSend_setStackSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStackSize:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSynchronous_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSynchronous:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_stackPerspectiveOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackPerspectiveOffset");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}
