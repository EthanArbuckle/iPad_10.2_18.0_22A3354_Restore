void sub_100005710(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", PHImageErrorKey));
  if (a2)
  {
    v6 = *(void **)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000588C;
    v9[3] = &unk_100008338;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "_saveImageRef:toURL:completionHandler:", a2, v7, v9);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Fetching image for asset failed with error: %@ (progress: %@)", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 100);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10000588C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setCompletedUnitCount:", 100);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id sub_1000058F8(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 48), "_replaceAssetAtURL:withItemAtURL:completionHandler:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  else
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_10000591C(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 48), "_replaceAssetAtURL:withItemAtURL:completionHandler:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  else
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_1000060D0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addChild:withPendingUnitCount:", a2, 100);
}

void sub_1000060E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else if (v5)
  {
    (*(void (**)(_QWORD, id))(v6 + 16))(*(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("PFPAssetRequestErrorDomain"), 0, 0));
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "unpublish");

}

void sub_10000619C(id a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  +[CPAnalytics setupWithConfigurationFilename:inBundle:](CPAnalytics, "setupWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-PhotosFileProvider"), v1);

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  +[CPAnalytics setupSystemPropertyProvidersForLibrary:](CPAnalytics, "setupSystemPropertyProvidersForLibrary:", v2);

  +[CPAnalytics activateEventQueue](CPAnalytics, "activateEventQueue");
  byte_10000C610 = 1;
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingPathExtension");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend__exportThumbnailForAsset_thumbnailSize_fileProviderURL_progress_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_exportThumbnailForAsset:thumbnailSize:fileProviderURL:progress:completion:");
}

id objc_msgSend__markURLAsPurgable_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_markURLAsPurgable:completionHandler:");
}

id objc_msgSend__saveImageRef_toURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveImageRef:toURL:completionHandler:");
}

id objc_msgSend_activateEventQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateEventQueue");
}

id objc_msgSend_analyticsActivityTypeFromFileProviderURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "analyticsActivityTypeFromFileProviderURL:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_configurationWithQueryItems_possibleContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithQueryItems:possibleContentType:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_documentStorageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "documentStorageURL");
}

id objc_msgSend_enableMultiLibraryMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMultiLibraryMode");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exportAsset_configuration_progress_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportAsset:configuration:progress:completion:");
}

id objc_msgSend_exportAssetsInContainer_configuration_progress_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportAssetsInContainer:configuration:progress:completion:");
}

id objc_msgSend_exportConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportConfiguration");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithFileProviderURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileProviderURL:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdentifier");
}

id objc_msgSend_localIdentifierWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdentifierWithUUID:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_markPurgeableForFileAtURL_withUrgency_outInode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markPurgeableForFileAtURL:withUrgency:outInode:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openPhotoLibraryWithWellKnownIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openPhotoLibraryWithWellKnownIdentifier:error:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoLibrary");
}

id objc_msgSend_progressWithTotalUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressWithTotalUnitCount:");
}

id objc_msgSend_publish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publish");
}

id objc_msgSend_px_deprecated_appPhotoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "px_deprecated_appPhotoLibrary");
}

id objc_msgSend_px_fetchObjectWithLocalIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "px_fetchObjectWithLocalIdentifier:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItems");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:");
}

id objc_msgSend_requestFileForPhotosFileProviderURL_progressCreation_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestFileForPhotosFileProviderURL:progressCreation:completion:");
}

id objc_msgSend_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:");
}

id objc_msgSend_setActivityTypeForAssetExportAnalytics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityTypeForAssetExportAnalytics:");
}

id objc_msgSend_setCancellable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancellable:");
}

id objc_msgSend_setCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedUnitCount:");
}

id objc_msgSend_setDeliveryMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeliveryMode:");
}

id objc_msgSend_setKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKind:");
}

id objc_msgSend_setNetworkAccessAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkAccessAllowed:");
}

id objc_msgSend_setPausable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPausable:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setTimeMachineExclusionAttribute_url_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeMachineExclusionAttribute:url:error:");
}

id objc_msgSend_setUserInfoObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfoObject:forKey:");
}

id objc_msgSend_setupSystemPropertyProvidersForLibrary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSystemPropertyProvidersForLibrary:");
}

id objc_msgSend_setupWithConfigurationFilename_inBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupWithConfigurationFilename:inBundle:");
}

id objc_msgSend_sharedMomentSharePhotoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedMomentSharePhotoLibrary");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_thumbnailSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailSize");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_typeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithFilenameExtension:");
}

id objc_msgSend_unpublish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpublish");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}
