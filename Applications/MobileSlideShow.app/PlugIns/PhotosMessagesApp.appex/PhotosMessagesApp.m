void sub_100002A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a34);
  _Unwind_Resume(a1);
}

void sub_100003574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003D38(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100005984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005BF8(uint64_t a1, int a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a2)
  {
    v3 = PUPickerAssetPreparationOptionsFromAdditionalSelectionState(*(_QWORD *)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue(v3);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_finishPicking:withPreparationOptions:", *(_QWORD *)(a1 + 40), v8);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objects"));
    v6 = PXMap(v5, &stru_10000C980);
    v8 = (id)objc_claimAutoreleasedReturnValue(v6);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pickerCoordinator"));
    objc_msgSend(v7, "deselectAssetsWithIdentifiers:", v8);

  }
}

id sub_100005CA0(id a1, PHAsset *a2)
{
  return -[PHAsset localIdentifier](a2, "localIdentifier");
}

void sub_100005CA8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "loadingStatusManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PhotosMessagesExtensionProgressTrackingIDKey")));
  objc_msgSend(*(id *)(a1 + 40), "fractionCompleted");
  objc_msgSend(v4, "didUpdateLoadOperationWithTrackingID:withProgress:", v3);

}

void sub_100005D28(id a1, PXMutableMessagesExtensionViewModel *a2)
{
  -[PXMutableMessagesExtensionViewModel clearSelection](a2, "clearSelection");
}

id sub_100005D30(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 32))
    v2 = 10;
  else
    v2 = 15;
  return objc_msgSend(a2, "setEdgesWithoutContentMargins:", v2);
}

void sub_100005D4C(id a1, PXMutableMessagesExtensionViewModel *a2)
{
  PXMutableMessagesExtensionViewModel *v2;

  v2 = a2;
  -[PXMutableMessagesExtensionViewModel setSelectedMessageText:](v2, "setSelectedMessageText:", 0);
  -[PXMutableMessagesExtensionViewModel setSelectedMessageDate:](v2, "setSelectedMessageDate:", 0);

}

void sub_100005D84(id a1, PXMutableMessagesExtensionViewModel *a2)
{
  PXMutableMessagesExtensionViewModel *v2;

  v2 = a2;
  -[PXMutableMessagesExtensionViewModel clearSelection](v2, "clearSelection");
  -[PXMutableMessagesExtensionViewModel setDrawerActive:](v2, "setDrawerActive:", 0);

}

void sub_100005DB8(id a1, PXMutableMessagesExtensionViewModel *a2)
{
  -[PXMutableMessagesExtensionViewModel setDrawerActive:](a2, "setDrawerActive:", 1);
}

void sub_100005DC4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSelectedMessageText:", v3);
  objc_msgSend(v4, "setSelectedMessageDate:", *(_QWORD *)(a1 + 40));

}

void sub_100005E0C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  objc_msgSend(v5, "setSelectedURL:", v4);

  objc_msgSend(v5, "setSelectedActivityType:", *(_QWORD *)(a1 + 40));
}

void sub_100005E6C(id a1, PXMutableMessagesExtensionViewModel *a2)
{
  -[PXMutableMessagesExtensionViewModel clearSelection](a2, "clearSelection");
}

void sub_100005E74(id a1, PXMutableMessagesExtensionViewModel *a2)
{
  -[PXMutableMessagesExtensionViewModel setPresentedViewController:](a2, "setPresentedViewController:", 0);
}

id sub_100005E80(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresentedViewController:", *(_QWORD *)(a1 + 32));
}

void sub_100005E8C(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unstaging complete: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100005F34(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Staging complete: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100005FDC(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = dispatch_time(0, 300000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006080;
  v3[3] = &unk_10000C788;
  v5 = *(_BYTE *)(a1 + 40);
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
}

void sub_100006080(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "dismiss");

  }
}

void sub_1000060C0(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t sub_1000060F4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100006104(id a1, UIViewController *a2)
{
  void *v2;
  UIViewController *v3;

  v3 = a2;
  -[UIViewController willMoveToParentViewController:](v3, "willMoveToParentViewController:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v3, "view"));
  objc_msgSend(v2, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](v3, "removeFromParentViewController");
}

void sub_100006158(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id sub_10000618C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

id sub_100006194(uint64_t a1, void *a2)
{
  id v3;
  NSSet *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t Log;
  id v14;
  uint8_t buf[4];
  id v16;

  v3 = a2;
  v4 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(AEAssetPackage));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v14 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v5, v3, &v14));

  v7 = v14;
  if (v6)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)));
    -[NSObject setSidecarObject:forKey:](v9, "setSidecarObject:forKey:", v10, AEPackageTransportSidecarProposedOrderKey);

    v11 = -[NSObject copy](v9, "copy");
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    Log = PLAssetExplorerGetLog(v8);
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to unarchive draft asset archive with error: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

void sub_100006334(id a1, PUMutablePickerConfiguration *a2)
{
  -[PUMutablePickerConfiguration setEdgesWithoutContentMargins:](a2, "setEdgesWithoutContentMargins:", 10);
}

NSString *__cdecl sub_100006340(id a1, AEAssetPackage *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetPackage identifier](a2, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v2));

  return (NSString *)v3;
}

void sub_10000638C(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v3 = (CGContext *)objc_msgSend(v9, "CGContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "format"));
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "traitCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedColorWithTraitCollection:", v7));

  }
  v8 = objc_retainAutorelease(v5);
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v8, "CGColor"));

  objc_msgSend(v4, "bounds");
  objc_msgSend(v9, "fillRect:");

}

void sub_100006470(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_contentReadyForDisplayTimeout");

}

void sub_10000649C(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t Log;
  NSObject *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *v27;
  void *v28;
  uint8_t v29[16];

  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "expectedPackageIdentifiers"));
  v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 40));

  if (!v10)
    goto LABEL_19;
  if (v7)
  {
    v12 = objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v12, "setMediaOrigin:", 4);
    v13 = *(void **)(a1 + 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v15 = objc_msgSend(v13, "proposedStagedIndexForPendingIdentifier:", v14);

    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
      objc_msgSend(v12, "setSidecarObject:forKey:", v16, AEPackageTransportSidecarProposedOrderKey);

    }
    objc_msgSend(*(id *)(a1 + 32), "stagePackage:", v12);

    goto LABEL_13;
  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportError:", v8);
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "removePendingPackageIdentifier:", *(_QWORD *)(a1 + 40));
    goto LABEL_13;
  }
  if ((a4 & 1) == 0)
  {
    Log = PLAssetExplorerGetLog(v11);
    v18 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Nil package returned from package generator with no error!", v29, 2u);
    }

    goto LABEL_12;
  }
LABEL_13:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "loadingProgresses"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", *(_QWORD *)(a1 + 40)));
  v22 = v21;
  if (v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "userInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PhotosMessagesExtensionProgressTrackingIDKey")));

    v25 = *(void **)(a1 + 48);
    if (a4)
      objc_msgSend(v25, "didCancelLoadOperationWithTrackingID:", v24);
    else
      objc_msgSend(v25, "didCompleteLoadOperationWithTrackingID:withSuccess:error:", v24, v7 != 0, v8);
    v26 = *(_QWORD *)(a1 + 56);
    v27 = NSStringFromSelector("fractionCompleted");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    objc_msgSend(v22, "removeObserver:forKeyPath:", v26, v28);

    objc_msgSend(v20, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

LABEL_19:
}

NSString *__cdecl sub_1000066DC(id a1, PHAsset *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](a2, "localIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v2));

  return (NSString *)v3;
}

uint64_t sub_100006728(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100006738(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100006748(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Log;
  NSObject *v5;
  _BYTE *v6;
  int v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    Log = PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to stage message with error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v6 = *(_BYTE **)(a1 + 32);
    if (v6[40])
      objc_msgSend(v6, "dismiss");
    v5 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject postNotificationName:object:](v5, "postNotificationName:object:", CFSTR("DidStageBubble"), 0);
  }

}

void sub_100006838(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t Log;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  if (v2)
  {
    Log = PLSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to direct send message with error: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

id sub_1000068E4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecipients:", *(_QWORD *)(a1 + 32));
}

void sub_1000068F0(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler"));
  objc_msgSend(v1, "scheduleDeferredTaskWithQoS:block:", 0, &stru_10000C490);

}

void sub_100006930(id a1)
{
  +[CPAnalytics activateEventQueue](CPAnalytics, "activateEventQueue");
}

void sub_10000693C(id a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  +[CPAnalytics setupWithConfigurationFilename:inBundle:](CPAnalytics, "setupWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-PhotosMessagesApp"), v1);

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  +[CPAnalytics setupSystemPropertyProvidersForLibrary:](CPAnalytics, "setupSystemPropertyProvidersForLibrary:", v2);

  +[CPAnalytics startAppTracking](CPAnalytics, "startAppTracking");
  +[CPAnalytics startViewTracking](CPAnalytics, "startViewTracking");
  +[UIApplication pu_prepareCPAnalytics](UIApplication, "pu_prepareCPAnalytics");
}

void sub_1000069F8(id a1)
{
  void *v1;

  +[PXSettings setSuiteName:](PXSettings, "setSuiteName:", CFSTR("com.apple.mobileslideshow"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v1, "removeObjectForKey:", CFSTR("UIBarsApplyChromelessEverywhere"));

  PXAsynchronousAddDragAndDropFileProviderDomain();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGContext");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__assetCollectionForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetCollectionForURL:");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_auxiliaryConnection");
}

id objc_msgSend__confirmPicking_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_confirmPicking:completionHandler:");
}

id objc_msgSend__contentReadyForDisplayTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contentReadyForDisplayTimeout");
}

id objc_msgSend__dismissDrawerViewControllerWithDesiredState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissDrawerViewControllerWithDesiredState:");
}

id objc_msgSend__finishPicking_withPreparationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finishPicking:withPreparationOptions:");
}

id objc_msgSend__insertAssetArchive_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_insertAssetArchive:completionHandler:");
}

id objc_msgSend__isDrawerViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDrawerViewController");
}

id objc_msgSend__presentChildViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentChildViewController:animated:");
}

id objc_msgSend__presentViewControllerForConversation_presentationStyle_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentViewControllerForConversation:presentationStyle:animated:");
}

id objc_msgSend__recipientsForConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recipientsForConversation:");
}

id objc_msgSend__removeAllChildViewControllersAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeAllChildViewControllersAnimated:");
}

id objc_msgSend__removeAssetArchiveWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeAssetArchiveWithIdentifier:completionHandler:");
}

id objc_msgSend__setAllowsEncodingPolicyModification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAllowsEncodingPolicyModification:");
}

id objc_msgSend__setNeedsUpdateOfSupportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setNeedsUpdateOfSupportedInterfaceOrientations");
}

id objc_msgSend__stageMessageForConversation_withTemplateItem_messageURL_summaryText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stageMessageForConversation:withTemplateItem:messageURL:summaryText:");
}

id objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_strictlyUnarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend__updatePresentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePresentedViewController");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activeConversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeConversation");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPendingPackageIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPendingPackageIdentifier:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_aggregateMediaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregateMediaType");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetCollectionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetCollectionType");
}

id objc_msgSend_assetCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetCount");
}

id objc_msgSend_beginGenerating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginGenerating");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clearSelection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearSelection");
}

id objc_msgSend_confidentialWarningRequiredForAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidentialWarningRequiredForAssets:");
}

id objc_msgSend_confidentialityAlertWithConfirmAction_abortAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidentialityAlertWithConfirmAction:abortAction:");
}

id objc_msgSend_confidentialityCheckRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidentialityCheckRequired");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contact");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentSizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSizeThatFits:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfAssetsWithLocationFromUUIDs_photoLibrary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfAssetsWithLocationFromUUIDs:photoLibrary:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_deleteTemporaryStorageWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteTemporaryStorageWithTimeout:");
}

id objc_msgSend_deselectAssetsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectAssetsWithIdentifiers:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCancelLoadOperationWithTrackingID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCancelLoadOperationWithTrackingID:");
}

id objc_msgSend_didCompleteLoadOperationWithTrackingID_withSuccess_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCompleteLoadOperationWithTrackingID:withSuccess:error:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didUpdateLoadOperationWithTrackingID_withProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didUpdateLoadOperationWithTrackingID:withProgress:");
}

id objc_msgSend_directSendMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directSendMessages");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_draftAssetArchives(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "draftAssetArchives");
}

id objc_msgSend_expectedPackageIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedPackageIdentifiers");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fetchAssetsWithLocalIdentifiers_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAssetsWithLocalIdentifiers:options:");
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchedObjects");
}

id objc_msgSend_fillRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fillRect:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "format");
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fractionCompleted");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_incrementShareCountAndLogAnalyticsForStagedAssetIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incrementShareCountAndLogAnalyticsForStagedAssetIDs:");
}

id objc_msgSend_initWithAddress_nameComponents_recipientKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAddress:nameComponents:recipientKind:");
}

id objc_msgSend_initWithAlternateLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAlternateLayout:");
}

id objc_msgSend_initWithAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAsset:");
}

id objc_msgSend_initWithAssetCollection_activityType_sourceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetCollection:activityType:sourceType:");
}

id objc_msgSend_initWithOids_photoLibrary_fetchType_fetchPropertySets_identifier_registerIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:");
}

id objc_msgSend_initWithPHPickerConfiguration_connection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPHPickerConfiguration:connection:");
}

id objc_msgSend_initWithPUConfiguration_coordinatorActionHandler_loadingStatusManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPUConfiguration:coordinatorActionHandler:loadingStatusManager:");
}

id objc_msgSend_initWithPhotoLibraryAndOnlyReturnsIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhotoLibraryAndOnlyReturnsIdentifiers:");
}

id objc_msgSend_initWithPhotoLibraryURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhotoLibraryURL:");
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSet:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithURL_isSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:isSender:");
}

id objc_msgSend_insertMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertMessage:completionHandler:");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_invalidAddressString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidAddressString");
}

id objc_msgSend_isDrawerActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDrawerActive");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToOrderedSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToOrderedSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPending");
}

id objc_msgSend_isSender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSender");
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "librarySpecificFetchOptions");
}

id objc_msgSend_loadingProgresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadingProgresses");
}

id objc_msgSend_loadingStatusManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadingStatusManager");
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdentifier");
}

id objc_msgSend_localIdentifierWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdentifierWithUUID:");
}

id objc_msgSend_localParticipantIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localParticipantIdentifier");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objects");
}

id objc_msgSend_orderedStagedIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedStagedIdentifiers");
}

id objc_msgSend_performChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performChanges:");
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoLibrary");
}

id objc_msgSend_pickerCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pickerCoordinator");
}

id objc_msgSend_pl_redactedShareURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pl_redactedShareURL");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preselectedAssetIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preselectedAssetIdentifiers");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationStyle");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_preview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preview");
}

id objc_msgSend_previewImageData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewImageData");
}

id objc_msgSend_previouslySelectedObjectIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previouslySelectedObjectIDs");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_proposedStagedIndexForPendingIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proposedStagedIndexForPendingIdentifier:");
}

id objc_msgSend_px_deprecated_appPhotoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "px_deprecated_appPhotoLibrary");
}

id objc_msgSend_px_presentOverTopmostPresentedViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "px_presentOverTopmostPresentedViewController:animated:completion:");
}

id objc_msgSend_recipientAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipientAddresses");
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipients");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redColor");
}

id objc_msgSend_registerChangeObserver_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerChangeObserver:context:");
}

id objc_msgSend_removeAllExpectedPackagesWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllExpectedPackagesWithIdentifiers:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePendingPackageIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePendingPackageIdentifier:");
}

id objc_msgSend_reportError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportError:");
}

id objc_msgSend_requestPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPresentationStyle:");
}

id objc_msgSend_requestResize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestResize");
}

id objc_msgSend_resignSearchBarAsFirstResponder_110426547(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignSearchBarAsFirstResponder_110426547");
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolvedColorWithTraitCollection:");
}

id objc_msgSend_retrieveGeneratedPackageWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveGeneratedPackageWithCompletion:");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_scheduleDeferredTaskWithQoS_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleDeferredTaskWithQoS:block:");
}

id objc_msgSend_selectedActivityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedActivityType");
}

id objc_msgSend_selectedMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedMessage");
}

id objc_msgSend_selectedURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedURL");
}

id objc_msgSend_sendEvent_withPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:withPayload:");
}

id objc_msgSend_sendMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:completionHandler:");
}

id objc_msgSend_senderParticipantIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "senderParticipantIdentifier");
}

id objc_msgSend_setAdditionalSafeAreaInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalSafeAreaInsets:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCaption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaption:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisabledCapabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisabledCapabilities:");
}

id objc_msgSend_setDrawerActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrawerActive:");
}

id objc_msgSend_setEdgesWithoutContentMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEdgesWithoutContentMargins:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLayout:");
}

id objc_msgSend_setLoadingProgresses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoadingProgresses:");
}

id objc_msgSend_setLoadingStatusManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoadingStatusManager:");
}

id objc_msgSend_setMediaOrigin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaOrigin:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPickerCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPickerCoordinator:");
}

id objc_msgSend_setPreparationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreparationOptions:");
}

id objc_msgSend_setPreselectedAssetIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreselectedAssetIdentifiers:");
}

id objc_msgSend_setPreviouslySelectedObjectIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviouslySelectedObjectIDs:");
}

id objc_msgSend_setReadyForDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReadyForDisplay");
}

id objc_msgSend_setRecipients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecipients:");
}

id objc_msgSend_setSelectedActivityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedActivityType:");
}

id objc_msgSend_setSelectedMessageDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedMessageDate:");
}

id objc_msgSend_setSelectedMessageText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedMessageText:");
}

id objc_msgSend_setSelectedURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedURL:");
}

id objc_msgSend_setSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelection:");
}

id objc_msgSend_setSelectionLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectionLimit:");
}

id objc_msgSend_setSidecarObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSidecarObject:forKey:");
}

id objc_msgSend_setSourceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceType:");
}

id objc_msgSend_setSubcaption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubcaption:");
}

id objc_msgSend_setSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuiteName:");
}

id objc_msgSend_setSummaryText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSummaryText:");
}

id objc_msgSend_setTouchDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchDelegate:");
}

id objc_msgSend_setTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransport:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUserInfoObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfoObject:forKey:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupSystemPropertyProvidersForLibrary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSystemPropertyProvidersForLibrary:");
}

id objc_msgSend_setupWithConfigurationFilename_inBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupWithConfigurationFilename:inBundle:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedRootViewModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedRootViewModel");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_stagePackage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagePackage:");
}

id objc_msgSend_stagePackages_andNotify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagePackages:andNotify:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAppTracking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAppTracking");
}

id objc_msgSend_startViewTracking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startViewTracking");
}

id objc_msgSend_supportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedInterfaceOrientations");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemPhotoLibraryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemPhotoLibraryURL");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transport");
}

id objc_msgSend_unstagePackageWithIdentifier_andNotify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unstagePackageWithIdentifier:andNotify:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_useDebugColors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useDebugColors");
}

id objc_msgSend_useNavBarAnimatedTransition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useNavBarAnimatedTransition");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_uuidFromLocalIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuidFromLocalIdentifier:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewController");
}

id objc_msgSend_willBeginLoadOperationWithItemIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willBeginLoadOperationWithItemIdentifier:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}

id objc_msgSend_workflowViewControllerWithContext_embedInNavigationControllerOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowViewControllerWithContext:embedInNavigationControllerOfClass:");
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "yellowColor");
}
