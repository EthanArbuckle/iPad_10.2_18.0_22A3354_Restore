void sub_100002EE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(v5, "beginSupressingLivePhoto");
    objc_msgSend(v5, "setMediaOrigin:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v5, "removeSidecarObjectForKey:", *(_QWORD *)(a1 + 32));
    v23 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v23));
    v9 = v23;
    if (!v8)
    {
      v10 = os_log_create("com.apple.camera", "CameraMessagesApp");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10000ACD0((uint64_t)v9, v10, v11);

    }
    +[CMAMessagesExtensionStorageHelper markFilesPurgeableForAsset:](CMAMessagesExtensionStorageHelper, "markFilesPurgeableForAsset:", *(_QWORD *)(a1 + 40));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003108;
    block[3] = &unk_100014550;
    v22 = *(_BYTE *)(a1 + 81);
    v17 = *(id *)(a1 + 48);
    v18 = v8;
    v21 = *(_QWORD *)(a1 + 72);
    v19 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 64);
    v12 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_13:
    goto LABEL_14;
  }
  if (v6)
  {
    v13 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000AC44(v7, v13);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100003414;
    v14[3] = &unk_100014578;
    v15 = *(id *)(a1 + 64);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    v9 = v15;
    goto LABEL_13;
  }
LABEL_14:

}

uint64_t sub_100003108(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  uint64_t v11;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "_insertAssetArchive:completionHandler:", *(_QWORD *)(a1 + 40), &stru_100014508);
    v2 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v3;
    v4 = "Called _insertAssetArchive on %{public}@";
    goto LABEL_9;
  }
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 > 4)
    v6 = 6;
  else
    v6 = qword_100012E70[v5];
  objc_msgSend(*(id *)(a1 + 48), "reportPayloadSentFromSource:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_sendAssetArchive:completionHandler:", *(_QWORD *)(a1 + 40), &stru_100014528);
  v2 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v7;
    v4 = "Called _sendAssetArchive on %{public}@";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v10, 0xCu);
  }
LABEL_10:

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v8);
  return result;
}

void sub_100003264(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  CAMSignpostWithIDAndArgs(10013, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v3 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Staging complete: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_10000333C(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  CAMSignpostWithIDAndArgs(10011, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v3 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Send complete: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t sub_100003414(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100003490(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100003594(id a1)
{
  size_t v1;
  int v2[2];

  *(_QWORD *)v2 = 0x1800000006;
  v1 = 8;
  sysctl(v2, 2u, &qword_10001A538, &v1, 0, 0);
}

uint64_t sub_100003680(uint64_t a1)
{
  uint64_t result;

  result = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "_deviceMemorySize");
  byte_10001A548 = result > 1610612736;
  return result;
}

id sub_100003CFC()
{
  if (qword_10001A560 != -1)
    dispatch_once(&qword_10001A560, &stru_1000147D0);
  return (id)qword_10001A568;
}

void sub_100003D3C(id a1)
{
  CAMSignpostWithIDAndArgs(29, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (!qword_10001A570)
    qword_10001A570 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CameraEffectsKit.framework/CameraEffectsKit", 2);
  CAMSignpostWithIDAndArgs(30, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void sub_100003DB8(uint64_t a1)
{
  CFAbsoluteTime Current;
  void *v3;
  void *v4;
  _QWORD v5[5];

  Current = CFAbsoluteTimeGetCurrent();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_regularCameraViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistenceController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003E4C;
  v5[3] = &unk_100014640;
  *(CFAbsoluteTime *)&v5[4] = Current;
  objc_msgSend(v4, "emptyLocalPersistenceStorageWithTimeout:completionHandler:", v5, 0.5);

}

void sub_100003E4C(uint64_t a1)
{
  double Current;
  double v3;
  NSObject *v4;
  int v5;
  double v6;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(double *)(a1 + 32);
  v4 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = Current - v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Emptying local persistence storage took %.3fs", (uint8_t *)&v5, 0xCu);
  }

}

id sub_10000415C(uint64_t a1)
{
  id result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "_didReceiveViewWillAppear");
  if ((result & 1) == 0)
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping camera session that we started in viewDidLoad since we haven't received viewWillAppear within %.3f seconds", (uint8_t *)&v5, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_stopActiveCameraSession");
  }
  return result;
}

id sub_100004A1C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutParametersForReviewBarsModel:viewBounds:orientation:forceLayout:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), 1, 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

id sub_100004F9C()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_10001A578;
  v7 = qword_10001A578;
  if (!qword_10001A578)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100008B40;
    v3[3] = &unk_1000147F8;
    v3[4] = &v4;
    sub_100008B40((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000503C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005DA0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

id sub_100005DAC(uint64_t a1)
{
  return +[CAMMessagesExtensionViewController _removeChildViewController:](CAMMessagesExtensionViewController, "_removeChildViewController:", *(_QWORD *)(a1 + 32));
}

void sub_100006734(id a1)
{
  id v1;
  NSObject *v2;

  v1 = sub_100006768();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  dispatch_async(v2, &stru_100014720);

}

id sub_100006768()
{
  if (qword_10001A580 != -1)
    dispatch_once(&qword_10001A580, &stru_100014818);
  return (id)qword_10001A588;
}

void sub_1000067A8(id a1)
{
  CAMSignpostWithIDAndArgs(29, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (!qword_10001A590)
    qword_10001A590 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AssetExplorer.framework/AssetExplorer", 2);
  CAMSignpostWithIDAndArgs(30, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void sub_10000697C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));
  objc_msgSend(v8, "scale");
  +[CMAMessagesExtensionUtilities shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:](CMAMessagesExtensionUtilities, "shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  +[PUReviewScreenUtilities orientedGeometryForFrame:inBounds:orientation:](PUReviewScreenUtilities, "orientedGeometryForFrame:inBounds:orientation:", *(_QWORD *)(a1 + 80), v11, v13, v15, v17, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 0, 0, 0, 0);
  objc_msgSend(v5, "setControlCenterAlignmentPoint:forceLayout:", *(unsigned __int8 *)(a1 + 88), (unsigned __int128)0);

}

id sub_100006FB0(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
  v2 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dismissing after _transportAsset completion", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "dismiss");
}

void sub_100007138(uint64_t a1, int a2)
{
  NSObject *v2;

  if (a2)
  {
    v2 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_10000AD68();

  }
  else
  {
    +[CMAMessagesExtensionStorageHelper markFilesPurgeableForAsset:](CMAMessagesExtensionStorageHelper, "markFilesPurgeableForAsset:", *(_QWORD *)(a1 + 32));
  }
}

id sub_100007254(uint64_t a1)
{
  return +[CMAMessagesExtensionStorageHelper markFilesPurgeableForAsset:](CMAMessagesExtensionStorageHelper, "markFilesPurgeableForAsset:", *(_QWORD *)(a1 + 32));
}

void sub_100007610(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = objc_alloc_init((Class)PHAssetCreationOptions);
  objc_msgSend(v17, "setUseRecoverableStagingDirectory:", 1);
  objc_msgSend(v17, "setShouldUseAutomaticallyGeneratedOriginalFilename:", 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
  if (v2 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCreationRequest creationRequestForAssetWithUUID:options:](PHAssetCreationRequest, "creationRequestForAssetWithUUID:options:", v8, v17));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "providedFullsizeRenderVideoURL"));
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "providedVideoURL"));
    v12 = v11;

    objc_msgSend(v4, "addResourceWithType:fileURL:options:", 2, v12, 0);
LABEL_15:

    goto LABEL_16;
  }
  if (v2 == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCreationRequest creationRequestForAssetWithUUID:options:](PHAssetCreationRequest, "creationRequestForAssetWithUUID:options:", v3, v17));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "providedFullsizeRenderImageURL"));
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "providedFullsizeImageURL"));
    v12 = v7;

    objc_msgSend(v4, "addResourceWithType:fileURL:options:", 1, v12, 0);
    if (objc_msgSend(*(id *)(a1 + 32), "isLivePhoto"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "providedFullsizeRenderVideoURL"));
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "providedVideoURL"));
      v16 = v15;

      objc_msgSend(v4, "addResourceWithType:fileURL:options:", 9, v16, 0);
    }
    goto LABEL_15;
  }
LABEL_16:

}

void sub_1000077CC(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;

  v3 = a2;
  v4 = a3;
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("Success.");
    if (!v3)
      v6 = (const __CFString *)v4;
    v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished updating asset. %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void sub_100008AE0(id a1)
{
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;

  v1 = dispatch_queue_create("com.apple.camera.softlink.CameraEffectsKit", 0);
  v2 = (void *)qword_10001A568;
  qword_10001A568 = (uint64_t)v1;

  v3 = qword_10001A568;
  v4 = camSoftLinkQueue();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  dispatch_set_target_queue(v3, v5);

}

Class sub_100008B40(uint64_t a1)
{
  id v2;
  NSObject *v3;
  Class result;
  _Unwind_Exception *v5;
  _QWORD block[5];
  _QWORD v7[4];

  CAMSignpostWithIDAndArgs(31, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v2 = sub_100003CFC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C6C;
  block[3] = &unk_1000147F8;
  block[4] = v7;
  dispatch_sync(v3, block);

  CAMSignpostWithIDAndArgs(32, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  _Block_object_dispose(v7, 8);
  result = objc_getClass("CFXCameraViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v5 = (_Unwind_Exception *)sub_10000AE90();
    _Block_object_dispose(v7, 8);
    _Unwind_Resume(v5);
  }
  qword_10001A578 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100008C6C(uint64_t a1)
{
  void *result;

  result = (void *)qword_10001A570;
  if (!qword_10001A570)
  {
    result = dlopen("/System/Library/PrivateFrameworks/CameraEffectsKit.framework/CameraEffectsKit", 2);
    qword_10001A570 = (uint64_t)result;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_100008CB4(id a1)
{
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;

  v1 = dispatch_queue_create("com.apple.camera.softlink.AssetExplorer", 0);
  v2 = (void *)qword_10001A588;
  qword_10001A588 = (uint64_t)v1;

  v3 = qword_10001A588;
  v4 = camSoftLinkQueue();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  dispatch_set_target_queue(v3, v5);

}

Class sub_100008D14(uint64_t a1)
{
  Class result;

  sub_100008D68();
  result = objc_getClass("AECameraAssetPackageGenerator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10001A598 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000AEB4();
    return (Class)sub_100008D68();
  }
  return result;
}

uint64_t sub_100008D68()
{
  id v0;
  NSObject *v1;
  uint64_t v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  CAMSignpostWithIDAndArgs(31, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v0 = sub_100006768();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008E60;
  block[3] = &unk_1000147F8;
  block[4] = &v5;
  dispatch_sync(v1, block);

  CAMSignpostWithIDAndArgs(32, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_100008E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100008E60(uint64_t a1)
{
  void *result;

  result = (void *)qword_10001A590;
  if (!qword_10001A590)
  {
    result = dlopen("/System/Library/PrivateFrameworks/AssetExplorer.framework/AssetExplorer", 2);
    qword_10001A590 = (uint64_t)result;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_100008EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_100008D68();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AEChatKitStatisticsManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10001A5A0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)sub_10000AED8();
    sub_100008EFC(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_100008EFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100009700(uint64_t a1)
{
  void *v2;
  __int128 v3;
  double v4;
  void *v5;
  _OWORD v7[2];
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v3;
  v8 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v2, "configureWithShutterButtonSpec:", v7);
  v4 = *(double *)(a1 + 88);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "imageView"));
  objc_msgSend(v5, "setAlpha:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 96), *(double *)(a1 + 104));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

id sub_100009780(id *a1)
{
  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "completeTransition:", objc_msgSend(a1[5], "transitionWasCancelled") ^ 1);
  return objc_msgSend(a1[6], "_finishTransitionWithContext:", a1[5]);
}

void sub_10000989C(id a1, PUMutableReviewScreenBarsModel *a2)
{
  -[PUMutableReviewScreenBarsModel setTransitioningWithCamera:](a2, "setTransitioningWithCamera:", 1);
}

void sub_1000099A0(id a1, PUMutableReviewScreenBarsModel *a2)
{
  -[PUMutableReviewScreenBarsModel setTransitioningWithCamera:](a2, "setTransitioningWithCamera:", 0);
}

void sub_10000AC18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000AC44(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v5 = 138543362;
  v6 = v3;
  sub_100003490((void *)&_mh_execute_header, a2, v4, "CAMAssetTransportController reported an error generating AEMutableAssetPackage: %{public}@", (uint8_t *)&v5);

}

void sub_10000ACD0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = a1;
  sub_100003490((void *)&_mh_execute_header, a2, a3, "Failed to archive package: %{public}@", (uint8_t *)&v3);
}

void sub_10000AD3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008F14();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "Trying to send nil asset from review screen. Dismissing.", v2, v3, v4, v5, v6);
  sub_100008F0C();
}

void sub_10000AD68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008F14();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "Could not take task assertion to mark asset files purgeable", v2, v3, v4, v5, v6);
  sub_100008F0C();
}

void sub_10000AD94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008F14();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "Trying to send assets without an active conversation", v2, v3, v4, v5, v6);
  sub_100008F0C();
}

uint64_t sub_10000ADC0()
{
  char *v0;
  uint64_t v1;

  v0 = dlerror();
  v1 = abort_report_np("%s", v0);
  return sub_10000ADE0(v1);
}

void sub_10000ADE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008F14();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "<Camera> Failed to capture photo, not proceeding with review", v2, v3, v4, v5, v6);
  sub_100008F0C();
}

void sub_10000AE0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008F14();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "<Camera> Failed to capture live photo, not proceeding with review", v2, v3, v4, v5, v6);
  sub_100008F0C();
}

void sub_10000AE38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008F14();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "<Camera> Failed to capture video, not proceeding with review", v2, v3, v4, v5, v6);
  sub_100008F0C();
}

void sub_10000AE64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008F14();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "<CFXCamera> Failed to create review asset for mediaItem, not proceeding with review", v2, v3, v4, v5, v6);
  sub_100008F0C();
}

uint64_t sub_10000AE90()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CFXCameraViewController");
  return sub_10000AEB4(v0);
}

uint64_t sub_10000AEB4()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AECameraAssetPackageGenerator");
  return sub_10000AED8(v0);
}

uint64_t sub_10000AED8()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np("Unable to find class %s", "AEChatKitStatisticsManager");
  return sub_10000AEFC(v0, v1, v2);
}

void sub_10000AEFC(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to mark file purgeable: %{public}@, %{errno}d", (uint8_t *)&v3, 0x12u);
}

void sub_10000AF80(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown media type for CFXMediaItem", v1, 2u);
}

void sub_10000AFC0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_10000AC38();
  sub_10000AC18((void *)&_mh_execute_header, v2, v3, "Unable to create image source for '%{public}@'.", v4, v5, v6, v7, v8);

  sub_10000AC2C();
}

void sub_10000B038(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_10000AC38();
  sub_10000AC18((void *)&_mh_execute_header, v2, v3, "Unable to create AVAsset for '%{public}@'.", v4, v5, v6, v7, v8);

  sub_10000AC2C();
}

void sub_10000B0B0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_10000AC38();
  sub_10000AC18((void *)&_mh_execute_header, v2, v3, "Unable to find valid duration for '%{public}@'.", v4, v5, v6, v7, v8);

  sub_10000AC2C();
}

void sub_10000B128(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_10000AC38();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not generate preview image for %{public}@. Error: %{public}@", v6, 0x16u);

}

id objc_msgSend_AVDevicePositionForCAMDevicePosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AVDevicePositionForCAMDevicePosition:");
}

id objc_msgSend_CAMDevicePositionForAVDevicePosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CAMDevicePositionForAVDevicePosition:");
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__AVFlashModeForCAMTorchMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_AVFlashModeForCAMTorchMode:");
}

id objc_msgSend__CAMTorchModeForAVFlashMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_CAMTorchModeForAVFlashMode:");
}

id objc_msgSend__accessibilitySetInterfaceStyleIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilitySetInterfaceStyleIntent:");
}

id objc_msgSend__activeConversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activeConversation");
}

id objc_msgSend__adoptChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_adoptChildViewController:");
}

id objc_msgSend__assetAdjustmentsFromCFXMediaItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetAdjustmentsFromCFXMediaItem:");
}

id objc_msgSend__avDevicePositionFromUserPreferenceOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_avDevicePositionFromUserPreferenceOverrides:");
}

id objc_msgSend__avFlashModeFromUserPreferenceOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_avFlashModeFromUserPreferenceOverrides:");
}

id objc_msgSend__buttonColorForMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_buttonColorForMode:");
}

id objc_msgSend__cameraButtonShutterSpecForLayoutStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cameraButtonShutterSpecForLayoutStyle:");
}

id objc_msgSend__canCaptureFromMessagesCaptureState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canCaptureFromMessagesCaptureState:");
}

id objc_msgSend__captureMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_captureMode");
}

id objc_msgSend__captureState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_captureState");
}

id objc_msgSend__cfxAspectRatioCropFromUserPreferenceOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cfxAspectRatioCropFromUserPreferenceOverrides:");
}

id objc_msgSend__cfxCameraViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cfxCameraViewController");
}

id objc_msgSend__cfxCaptureModeFromUserPreferenceOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cfxCaptureModeFromUserPreferenceOverrides:");
}

id objc_msgSend__createAndEmbedCFXCameraViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createAndEmbedCFXCameraViewControllerIfNecessary");
}

id objc_msgSend__createAndEmbedRegularCameraViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createAndEmbedRegularCameraViewControllerIfNecessary");
}

id objc_msgSend__currentReviewAssset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentReviewAssset");
}

id objc_msgSend__descriptionForState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_descriptionForState:");
}

id objc_msgSend__deviceMemorySize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceMemorySize");
}

id objc_msgSend__deviceSupportsFunEffects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceSupportsFunEffects");
}

id objc_msgSend__didReceiveViewWillAppear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didReceiveViewWillAppear");
}

id objc_msgSend__dismissReviewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissReviewController");
}

id objc_msgSend__fadeInViewController_overOutgoingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fadeInViewController:overOutgoingViewController:");
}

id objc_msgSend__insertAssetArchive_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_insertAssetArchive:completionHandler:");
}

id objc_msgSend__isReviewControllerPresented(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isReviewControllerPresented");
}

id objc_msgSend__isValidStateTransitionFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isValidStateTransitionFrom:to:");
}

id objc_msgSend__layoutStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_layoutStyle");
}

id objc_msgSend__logReferenceDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logReferenceDescription");
}

id objc_msgSend__logReferenceTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logReferenceTime");
}

id objc_msgSend__messageLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_messageLabel");
}

id objc_msgSend__nextStateForCaptureTransitionFromState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nextStateForCaptureTransitionFromState:");
}

id objc_msgSend__photoReviewAssetFromCFXMediaItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_photoReviewAssetFromCFXMediaItem:");
}

id objc_msgSend__portraitOrientedSizeForSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_portraitOrientedSizeForSize:");
}

id objc_msgSend__preheatCFXCameraFromUserPreferenceOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preheatCFXCameraFromUserPreferenceOverrides:");
}

id objc_msgSend__prepareTransitionWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareTransitionWithContext:");
}

id objc_msgSend__presentReviewControllerForAsset_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentReviewControllerForAsset:source:");
}

id objc_msgSend__previewImageKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_previewImageKey");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_referenceBounds");
}

id objc_msgSend__regularCameraViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_regularCameraViewController");
}

id objc_msgSend__removeChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeChildViewController:");
}

id objc_msgSend__reviewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reviewController");
}

id objc_msgSend__reviewViewControllerForAsset_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reviewViewControllerForAsset:source:");
}

id objc_msgSend__saveAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveAsset:");
}

id objc_msgSend__sendAssetArchive_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendAssetArchive:completionHandler:");
}

id objc_msgSend__sendButtonShutterSpecForSendBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendButtonShutterSpecForSendBounds:");
}

id objc_msgSend__sendGeometryForReferenceBounds_orientation_screenScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendGeometryForReferenceBounds:orientation:screenScale:");
}

id objc_msgSend__sendImageTransformOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendImageTransformOrientation:");
}

id objc_msgSend__setCaptureState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCaptureState:");
}

id objc_msgSend__setCurrentReviewAssset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCurrentReviewAssset:");
}

id objc_msgSend__setDidReceiveViewWillAppear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDidReceiveViewWillAppear:");
}

id objc_msgSend__setLogReferenceDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLogReferenceDescription:");
}

id objc_msgSend__setLogReferenceTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLogReferenceTime:");
}

id objc_msgSend__setReviewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setReviewController:");
}

id objc_msgSend__setStateChangeReferenceTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setStateChangeReferenceTime:");
}

id objc_msgSend__setUserPreferenceOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUserPreferenceOverrides:");
}

id objc_msgSend__shouldShowFunEffects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowFunEffects");
}

id objc_msgSend__shutterGeometryForReferenceBounds_orientation_screenScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shutterGeometryForReferenceBounds:orientation:screenScale:");
}

id objc_msgSend__startActiveCameraSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startActiveCameraSession");
}

id objc_msgSend__startCFXCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startCFXCamera");
}

id objc_msgSend__startCFXCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startCFXCamera:");
}

id objc_msgSend__startRegularCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startRegularCamera");
}

id objc_msgSend__startRegularCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startRegularCamera:");
}

id objc_msgSend__stateChangeReferenceTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stateChangeReferenceTime");
}

id objc_msgSend__statisticsManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_statisticsManager");
}

id objc_msgSend__stopActiveCameraSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopActiveCameraSession");
}

id objc_msgSend__stopAndReleaseCFXCameraViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopAndReleaseCFXCameraViewController");
}

id objc_msgSend__stopAndReleaseRegularCameraViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopAndReleaseRegularCameraViewController");
}

id objc_msgSend__stopCFXCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopCFXCamera");
}

id objc_msgSend__stopCFXCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopCFXCamera:");
}

id objc_msgSend__stopRegularCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopRegularCamera");
}

id objc_msgSend__stopRegularCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopRegularCamera:");
}

id objc_msgSend__toWindowOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_toWindowOrientation");
}

id objc_msgSend__transitionIfPossibleToNextCaptureState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transitionIfPossibleToNextCaptureState:");
}

id objc_msgSend__transportAsset_forCompletionAction_sourceType_suppressLivePhoto_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transportAsset:forCompletionAction:sourceType:suppressLivePhoto:completion:");
}

id objc_msgSend__updateFonts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateFonts");
}

id objc_msgSend__updateLayoutParametersForReviewBarsModel_viewBounds_orientation_forceLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateLayoutParametersForReviewBarsModel:viewBounds:orientation:forceLayout:");
}

id objc_msgSend__userPreferenceOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userPreferenceOverrides");
}

id objc_msgSend__userPreferenceOverridesFromCFXCamera_baseUserPreferenceOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userPreferenceOverridesFromCFXCamera:baseUserPreferenceOverrides:");
}

id objc_msgSend__userPreferenceOverridesFromRegularCamera_baseUserPreferenceOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userPreferenceOverridesFromRegularCamera:baseUserPreferenceOverrides:");
}

id objc_msgSend__videoReviewAssetFromCFXMediaItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_videoReviewAssetFromCFXMediaItem:");
}

id objc_msgSend__windowInterfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_windowInterfaceOrientation");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeConversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeConversation");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addResourceWithType_fileURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addResourceWithType:fileURL:options:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_adjustmentsData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustmentsData");
}

id objc_msgSend_alignmentRectForShutterControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alignmentRectForShutterControl");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateIfNeededWithDuration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateIfNeededWithDuration:options:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_aspectRatioCrop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aspectRatioCrop");
}

id objc_msgSend_assetExplorerReviewScreenViewController_canPerformActionType_onAsset_inAssetCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetExplorerReviewScreenViewController:canPerformActionType:onAsset:inAssetCollection:");
}

id objc_msgSend_assetWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetWithURL:");
}

id objc_msgSend_availableControlsCountForReviewTransition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableControlsCountForReviewTransition:");
}

id objc_msgSend_beginSupressingLivePhoto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSupressingLivePhoto");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_cam_screenPixelSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cam_screenPixelSize");
}

id objc_msgSend_cameraBottomBarFrameForReferenceBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraBottomBarFrameForReferenceBounds:");
}

id objc_msgSend_cameraViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraViewController");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capabilities");
}

id objc_msgSend_captureDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDevice");
}

id objc_msgSend_captureFlashModeForFlashMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureFlashModeForFlashMode:");
}

id objc_msgSend_captureMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureMode");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_completeTransition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeTransition:");
}

id objc_msgSend_configureWithShutterButtonSpec_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureWithShutterButtonSpec:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerView");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_copyCGImageAtTime_actualTime_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCGImageAtTime:actualTime:error:");
}

id objc_msgSend_creationRequestForAssetWithUUID_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationRequestForAssetWithUUID:options:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_devicePosition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicePosition");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_doneButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneButton");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_emptyLocalPersistenceStorageWithTimeout_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emptyLocalPersistenceStorageWithTimeout:completionHandler:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flashMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flashMode");
}

id objc_msgSend_flashModeForCaptureFlashMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flashModeForCaptureFlashMode:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_funCamViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "funCamViewController");
}

id objc_msgSend_generatePackageFromReviewAsset_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePackageFromReviewAsset:withCompletionHandler:");
}

id objc_msgSend_handleVolumeButtonPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleVolumeButtonPressed");
}

id objc_msgSend_handleVolumeButtonReleased(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleVolumeButtonReleased");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageView");
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithCGImage:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_initWithAVAsset_audioMix_width_height_captureDate_duration_previewImage_videoURL_adjustments_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAVAsset:audioMix:width:height:captureDate:duration:previewImage:videoURL:adjustments:identifier:");
}

id objc_msgSend_initWithAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAsset:");
}

id objc_msgSend_initWithCaptureMode_devicePosition_flashMode_aspectRatioCrop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCaptureMode:devicePosition:flashMode:aspectRatioCrop:");
}

id objc_msgSend_initWithConversation_packageGeneratorClass_statisticsManagerClass_previewImageKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConversation:packageGeneratorClass:statisticsManagerClass:previewImageKey:");
}

id objc_msgSend_initWithDataSourceManager_mediaProvider_reviewAssetProvider_initialIndexPath_initialSelectedAssetUUIDs_initialDisabledLivePhotoAssetUUIDs_sourceType_reviewBarsModel_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:sourceType:reviewBarsModel:options:");
}

id objc_msgSend_initWithFormatIdentifier_formatVersion_data_baseVersion_editorBundleID_renderTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOverrides:");
}

id objc_msgSend_initWithOverrides_initialLayoutStyle_privateOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOverrides:initialLayoutStyle:privateOptions:");
}

id objc_msgSend_initWithPhoto_mediaSubtypes_width_height_captureDate_metadata_burstIdentifier_representedCount_fullsizeImageURL_fullsizeUnadjustedImageURL_assetAdjustments_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhoto:mediaSubtypes:width:height:captureDate:metadata:burstIdentifier:representedCount:fullsizeImageURL:fullsizeUnadjustedImageURL:assetAdjustments:identifier:");
}

id objc_msgSend_initWithReferenceBounds_shutterIntrinsicSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReferenceBounds:shutterIntrinsicSize:");
}

id objc_msgSend_initWithReviewDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReviewDataSource:");
}

id objc_msgSend_innerCircle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "innerCircle");
}

id objc_msgSend_insertAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertAsset:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intrinsicContentSize");
}

id objc_msgSend_isAnimated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAnimated");
}

id objc_msgSend_isCTMSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCTMSupported");
}

id objc_msgSend_isCapturingLivePhoto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCapturingLivePhoto");
}

id objc_msgSend_isCapturingPhoto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCapturingPhoto");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLivePhoto(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLivePhoto");
}

id objc_msgSend_isPreventingAdditionalCaptures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPreventingAdditionalCaptures");
}

id objc_msgSend_isRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecording");
}

id objc_msgSend_isSplitScreenSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSplitScreenSupported");
}

id objc_msgSend_isTemporaryPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTemporaryPlaceholder");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_markFilePurgeableAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markFilePurgeableAtURL:");
}

id objc_msgSend_markFilesPurgeableForAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markFilesPurgeableForAsset:");
}

id objc_msgSend_mediaSubtypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaSubtypes");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaType");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "naturalSize");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orientedGeometryForFrame_inBounds_orientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientedGeometryForFrame:inBounds:orientation:");
}

id objc_msgSend_originalAssetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalAssetURL");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_performChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performChanges:");
}

id objc_msgSend_performChanges_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performChanges:completionHandler:");
}

id objc_msgSend_performExpiringActivityWithReason_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performExpiringActivityWithReason:usingBlock:");
}

id objc_msgSend_persistenceController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistenceController");
}

id objc_msgSend_photoModeAspectRatioCrop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoModeAspectRatioCrop");
}

id objc_msgSend_populateFromReviewAsset_withSourceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateFromReviewAsset:withSourceType:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContentSizeCategory");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredTransform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredTransform");
}

id objc_msgSend_preheatWithWindow_captureMode_devicePosition_aspectRatioCrop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preheatWithWindow:captureMode:devicePosition:aspectRatioCrop:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_providedFullsizeImageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providedFullsizeImageURL");
}

id objc_msgSend_providedFullsizeRenderImageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providedFullsizeRenderImageURL");
}

id objc_msgSend_providedFullsizeRenderVideoURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providedFullsizeRenderVideoURL");
}

id objc_msgSend_providedVideoURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providedVideoURL");
}

id objc_msgSend_publish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publish");
}

id objc_msgSend_registerActivityAttribution(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerActivityAttribution");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeSidecarObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSidecarObjectForKey:");
}

id objc_msgSend_reportPayloadSentFromSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportPayloadSentFromSource:");
}

id objc_msgSend_resumeCameraSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeCameraSession");
}

id objc_msgSend_reviewAssetForAVAsset_audioMix_properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reviewAssetForAVAsset:audioMix:properties:");
}

id objc_msgSend_reviewAssetForLivePhoto_withProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reviewAssetForLivePhoto:withProperties:");
}

id objc_msgSend_reviewAssetForPhoto_withProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reviewAssetForPhoto:withProperties:");
}

id objc_msgSend_reviewAssetFromCFXMediaItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reviewAssetFromCFXMediaItem:");
}

id objc_msgSend_reviewBarsModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reviewBarsModel");
}

id objc_msgSend_reviewScreenControlBarFrameForReferenceBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reviewScreenControlBarFrameForReferenceBounds:");
}

id objc_msgSend_reviewViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reviewViewController");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screen");
}

id objc_msgSend_sendAsset_suppressLivePhoto_mediaOrigin_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAsset:suppressLivePhoto:mediaOrigin:completion:");
}

id objc_msgSend_sendButtonAlignmentRectInHorizontalBounds_relativeCenterAlignmentPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendButtonAlignmentRectInHorizontalBounds:relativeCenterAlignmentPoint:");
}

id objc_msgSend_sendButtonAlignmentRectInVerticalBounds_relativeCenterAlignmentPoint_controlsCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendButtonAlignmentRectInVerticalBounds:relativeCenterAlignmentPoint:controlsCount:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAppliesPreferredTrackTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppliesPreferredTrackTransform:");
}

id objc_msgSend_setAspectRatioCrop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAspectRatioCrop:");
}

id objc_msgSend_setAutomaticallyManagesCameraSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticallyManagesCameraSession:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCameraSessionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraSessionDelegate:");
}

id objc_msgSend_setCameraViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraViewController:");
}

id objc_msgSend_setCaptureDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureDelegate:");
}

id objc_msgSend_setCaptureDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureDevice:");
}

id objc_msgSend_setCaptureMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureMode:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setControlCenterAlignmentPoint_forceLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControlCenterAlignmentPoint:forceLayout:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCreativeCameraDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCreativeCameraDelegate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredDynamicRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredDynamicRange:");
}

id objc_msgSend_setDisablingAdditionalCaptures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisablingAdditionalCaptures:");
}

id objc_msgSend_setDisablingMultipleCaptureFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisablingMultipleCaptureFeatures:");
}

id objc_msgSend_setFlashMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlashMode:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFunCamViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFunCamViewController:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setMaximumSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumSize:");
}

id objc_msgSend_setMediaOrigin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaOrigin:");
}

id objc_msgSend_setMessagesTransitionState_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessagesTransitionState:animated:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setPersistenceBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistenceBehavior:");
}

id objc_msgSend_setPresentationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentationDelegate:");
}

id objc_msgSend_setReviewViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReviewViewController:");
}

id objc_msgSend_setShouldUseAutomaticallyGeneratedOriginalFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldUseAutomaticallyGeneratedOriginalFilename:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTorchMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTorchMode:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitionDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionDirection:");
}

id objc_msgSend_setTransitionState_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionState:animated:");
}

id objc_msgSend_setTransitioningDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitioningDelegate:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUberDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUberDelegate:");
}

id objc_msgSend_setUseRecoverableStagingDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseRecoverableStagingDirectory:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPhotoLibrary");
}

id objc_msgSend_shutterButtonAlignmentRectForReferenceBounds_layoutStyle_screenScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:");
}

id objc_msgSend_shutterButtonAlignmentRectInBounds_forLayoutStyle_traitCollection_safeAreaInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:");
}

id objc_msgSend_shutterButtonSpecForLayoutStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutterButtonSpecForLayoutStyle:");
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceType");
}

id objc_msgSend_stageAsset_suppressLivePhoto_mediaOrigin_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageAsset:suppressLivePhoto:mediaOrigin:completion:");
}

id objc_msgSend_startCaptureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCaptureSession");
}

id objc_msgSend_stopCaptureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCaptureSession");
}

id objc_msgSend_suspendCameraSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspendCameraSession");
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemYellowColor");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_torchMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "torchMode");
}

id objc_msgSend_tracksWithMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tracksWithMediaType:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_traitCollectionWithDisplayScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithDisplayScale:");
}

id objc_msgSend_transitionDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionDirection");
}

id objc_msgSend_transitionWasCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionWasCancelled");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewForKey:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
