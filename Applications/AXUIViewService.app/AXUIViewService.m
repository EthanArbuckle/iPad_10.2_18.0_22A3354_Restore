void sub_100003A24(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");
  objc_msgSend(v1, "invalidate");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100024720);

}

void sub_100003A70(id a1)
{
  objc_msgSend(UIApp, "terminateWithSuccess");
}

void sub_100003D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004028(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000040A0(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");

}

void sub_100004590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000045A8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v0 = off_10002E748;
  v9 = off_10002E748;
  if (!off_10002E748)
  {
    v1 = (void *)sub_100004710();
    v0 = dlsym(v1, "CACLogAccessibility");
    v7[3] = (uint64_t)v0;
    off_10002E748 = v0;
  }
  _Block_object_dispose(&v6, 8);
  if (!v0)
  {
    v5 = (_Unwind_Exception *)sub_10001343C();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  v3 = ((uint64_t (*)(uint64_t))v0)(v2);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

Class sub_1000046BC(uint64_t a1)
{
  Class result;

  sub_100004710();
  result = objc_getClass("CACCustomCommandEditorViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10002E720 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1000136BC();
    return (Class)sub_100004710();
  }
  return result;
}

uint64_t sub_100004710()
{
  uint64_t v0;
  char *v1;
  char *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10002E728)
  {
    v4 = off_100024790;
    v5 = 0;
    qword_10002E728 = _sl_dlopen(&v4, &v3);
  }
  v0 = qword_10002E728;
  v1 = v3;
  if (!qword_10002E728)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }
  if (v3)
LABEL_7:
    free(v1);
  return v0;
}

Class sub_1000047C0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_100004710();
  result = objc_getClass("CACSpokenCommandItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10002E730 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_1000136E0();
    return (Class)sub_100004814(v3);
  }
  return result;
}

Class sub_100004814(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_100004710();
  result = objc_getClass("CACPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10002E738 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_100013704();
    return (Class)sub_100004868(v3);
  }
  return result;
}

void sub_100004868(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  os_log_t v4;
  const char *v5;

  sub_100004710();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CACRecordedUserActionFlow");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10002E750 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)sub_100013728();
    sub_1000048BC(v2, v3, v4, v5);
  }
}

void sub_1000048BC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000048D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1000056D0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100005710(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sub_100005734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_opt_class(a1, a2, a3, a4);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;

  v4 = objc_autoreleasePoolPush();
  v8 = (objc_class *)objc_opt_class(AppDelegate, v5, v6, v7);
  v9 = NSStringFromClass(v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  v11 = UIApplicationMain(a1, a2, 0, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

void sub_100005EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005FE4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "popoverPresentingViewController"));
  objc_msgSend(v2, "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));

}

void sub_1000060B4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "popoverPresentingViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void sub_100006114(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");

}

void sub_1000063EC(uint64_t a1)
{
  sub_100006440();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CACCorrectionsCollectionViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10002E758 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100013A18();
    sub_100006440();
  }
}

void sub_100006440()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_10002E760)
  {
    v2 = off_1000247F8;
    v3 = 0;
    qword_10002E760 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_10002E760)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

VOTQuickSettingsListViewController *sub_1000064EC(uint64_t a1)
{
  VOTQuickSettingsListViewController *result;
  VOTQuickSettingsListViewController *v3;
  SEL v4;
  id v5;
  id v6;

  sub_100006440();
  result = (VOTQuickSettingsListViewController *)objc_getClass("CACPopoverPresentingViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10002E768 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (VOTQuickSettingsListViewController *)sub_100013A3C();
    return -[VOTQuickSettingsListViewController initWithNibName:bundle:](v3, v4, v5, v6);
  }
  return result;
}

void sub_100006924(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_100006960(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

void sub_10000698C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

void sub_1000069B8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

void sub_10000706C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007090(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_isFiltering"))
  {
    v1 = sub_10000DC74(CFSTR("item.count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "filteredSpecifiers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v2, objc_msgSend(v3, "count")));

    UIAccessibilitySpeakIfNotSpeaking(v4);
  }

}

void sub_100007858(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "imageExplorerViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hostAppName"));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "visionResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "features"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "detailData"));
  objc_msgSend(v7, "launchImageExplorerFromHostApp:withImage:visionFeatures:data:", v2, v3, v5, v6);

}

id sub_100007904(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadImageViewIfNeeded");
}

void sub_100007DE0(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");
  objc_msgSend(v1, "invalidate");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100024888);

}

void sub_100007E2C(id a1)
{
  objc_msgSend(UIApp, "terminateWithSuccess");
}

void sub_1000084E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  uint64_t v27;

  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008514(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100008524(uint64_t a1)
{

}

void sub_10000852C(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  double v41;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = VOTLogImageExplorer(WeakRetained);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100013F8C();

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_photoAssetDataWithNetWorkAccess:", 1));
  v8 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v10 = v9;
  v11 = VOTLogImageExplorer(v8);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v29 = (objc_class *)objc_opt_class(WeakRetained, v13);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    *(_DWORD *)buf = 138412546;
    v39 = v31;
    v40 = 2048;
    v41 = v10 - v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ - Loading image from network took %.3fs to complete", buf, 0x16u);

  }
  v14 = objc_alloc((Class)UIImage);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageData"));
  v16 = objc_msgSend(v14, "initWithData:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "visionEngine"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXMVisionAnalysisOptions voiceOverOptions](AXMVisionAnalysisOptions, "voiceOverOptions"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100008808;
  v33[3] = &unk_1000248B0;
  v37 = v19;
  v36 = *(_QWORD *)(a1 + 64);
  v33[4] = WeakRetained;
  v34 = v16;
  v32 = *(_OWORD *)(a1 + 48);
  v20 = (id)v32;
  v35 = v32;
  v21 = v16;
  v22 = objc_retainBlock(v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageNode"));
  objc_msgSend(v23, "setShouldProcessRemotely:", 1);

  v25 = VOTLogImageExplorer(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    sub_100013F10();

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageNode"));
  v28 = objc_msgSend(objc_alloc((Class)CIImage), "initWithImage:", v21);
  objc_msgSend(v27, "triggerWithImage:options:cacheKey:resultHandler:", v28, v18, 0, v22);

}

void sub_100008808(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  UIAccessibilityNotifications v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a2;
  v4 = VOTLogImageExplorer(+[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate"));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000140C8();

  v7 = VOTLogImageExplorer(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100014018(a1, (uint64_t)v8, v9, v10);

  v11 = UIAccessibilityAnnouncementNotification;
  v12 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.image.and.features.updated"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  UIAccessibilityPostNotification(v11, v13);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v3;
  v16 = v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_100008918(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "imageExplorerViewController"));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "features"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "detailData"));
  objc_msgSend(v5, "updateImageExplorerWithImage:features:data:", v2, v3, v4);

}

id sub_100008F9C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "label"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_100009258(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000092C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

uint64_t sub_1000092E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_opt_class(a1, a2, a3, a4);
}

uint64_t sub_100009310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_opt_class(*(_QWORD *)(a1 + 32), a2, a3, a4);
}

BOOL sub_1000096F8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ocrFeatureType") == *(id *)(a1 + 32);
}

BOOL sub_1000097D8(id a1, id a2, NSDictionary *a3)
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  char v13;

  v4 = a2;
  v5 = a3;
  v13 = 0;
  v7 = objc_opt_class(VOTImageExplorerTextElement, v6);
  v8 = __UIAccessibilityCastAsClass(v7, v4, 1, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v13)
    abort();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "isHeader");
  else
    v11 = 0;

  return v11;
}

BOOL sub_10000A39C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ocrFeatureType") == *(id *)(a1 + 32);
}

id sub_10000ACAC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10000AF9C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10000B544(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void sub_10000B674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B698(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000B6A8(uint64_t a1)
{

}

void sub_10000B6B0(uint64_t a1, void *a2)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v44;
  double v45;
  uint64_t v46;
  id v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v47 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "normalizedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v15 = UIAccessibilityFrameForBounds(v4, v6 * v13, v8 * v14, v10 * v13, v12 * v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v47, "normalizedFrame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v33 = UIAccessibilityFrameForBounds(v22, v24 * v31, v32 * (1.0 - v26 - v30), v28 * v31, v30 * v32);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  v53.origin.x = v33;
  v53.origin.y = v35;
  v53.size.width = v37;
  v53.size.height = v39;
  if (CGRectIntersectsRect(v48, v53))
    goto LABEL_3;
  v49.origin.x = v33;
  v49.origin.y = v35;
  v49.size.width = v37;
  v49.size.height = v39;
  v54.origin.x = v15;
  v54.origin.y = v17;
  v54.size.width = v19;
  v54.size.height = v21;
  if (CGRectContainsRect(v49, v54))
  {
LABEL_3:
    v50.origin.x = v33;
    v50.origin.y = v35;
    v50.size.width = v37;
    v50.size.height = v39;
    v55.origin.x = v15;
    v55.origin.y = v17;
    v55.size.width = v19;
    v55.size.height = v21;
    v51 = CGRectIntersection(v50, v55);
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;
    v44 = CGRectGetWidth(v51);
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v45 = v44 * CGRectGetHeight(v52);
    v46 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v45 > *(double *)(v46 + 24))
    {
      *(double *)(v46 + 24) = v45;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    }
  }

}

void sub_10000BA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000BAA8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  id v14;
  void *v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "elements"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));

  if (!objc_msgSend(v6, "count"))
    goto LABEL_17;
  v7 = *(__CFString **)(a1 + 32);
  if (v7 == CFSTR("VoiceOverImageExplorer.text.rotor"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessibilityElements"));

    v6 = v9;
  }
  else
  {
    if (v7 != CFSTR("VoiceOverImageExplorer.document.rotor") && v7 != CFSTR("VoiceOverImageExplorer.table.rotor"))
      goto LABEL_8;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &stru_100024A40));
  }

  v6 = (void *)v8;
LABEL_8:
  if (!objc_msgSend(v6, "count"))
    goto LABEL_17;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "targetElement"));
  v12 = objc_msgSend(v6, "indexOfObject:", v11);

  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "searchDirection"))
      v13 = (unint64_t)v12 + 1;
    else
      v13 = (unint64_t)v12 - 1;
    if ((v13 & 0x8000000000000000) != 0)
      goto LABEL_17;
  }
  if (v13 >= (unint64_t)objc_msgSend(v6, "count"))
  {
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  v14 = objc_alloc_init((Class)UIAccessibilityCustomRotorItemResult);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v13));
  objc_msgSend(v14, "setTargetElement:", v15);

LABEL_18:
  return v14;
}

id sub_10000BC58(id a1, id a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityElements"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityElements"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_10000C33C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_10000C380()
{
  JUMPOUT(0x10000C370);
}

void sub_10000C388(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  VOTImageExplorerCustomContentValue *v14;
  id v15;

  v15 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_axNearbyRelationKeyForFeature:andNeighborFeature:", *(_QWORD *)(a1 + 32), v15));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "faceDetectionResult"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

    if (AXRuntimeCheck_MediaAnalysisSupport())
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mediaAnalysisFaceDetectionResult"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

      v6 = (__CFString *)v8;
    }
    if (!-[__CFString length](v6, "length"))
    {

      v6 = CFSTR("UNKFace");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4));
    v10 = objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = v12;

    v14 = -[VOTImageExplorerCustomContentValue initWithFeatureValue:featureType:]([VOTImageExplorerCustomContentValue alloc], "initWithFeatureValue:featureType:", v6, CFSTR("Face"));
    objc_msgSend(v13, "axSafelyAddObject:", v14);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v4);

  }
}

void sub_10000C4E8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  VOTImageExplorerCustomContentValue *v10;
  void *v11;
  VOTImageExplorerCustomContentValue *v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_axNearbyRelationKeyForFeature:andNeighborFeature:", *(_QWORD *)(a1 + 32), v13));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4));
    v6 = objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v9 = v8;

    v10 = [VOTImageExplorerCustomContentValue alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "classificationLocalizedValue"));
    v12 = -[VOTImageExplorerCustomContentValue initWithFeatureValue:featureType:](v10, "initWithFeatureValue:featureType:", v11, CFSTR("Object"));

    objc_msgSend(v9, "axSafelyAddObject:", v12);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v4);

  }
}

void sub_10000C5F8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  VOTImageExplorerCustomContentValue *v10;
  void *v11;
  VOTImageExplorerCustomContentValue *v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_axNearbyRelationKeyForFeature:andNeighborFeature:", *(_QWORD *)(a1 + 32), v13));

  if (v4 && objc_msgSend(v13, "ocrFeatureType") != (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4));
    v6 = objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v9 = v8;

    v10 = [VOTImageExplorerCustomContentValue alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXMVisionFeature nameForOCRType:](AXMVisionFeature, "nameForOCRType:", objc_msgSend(v13, "ocrFeatureType")));
    v12 = -[VOTImageExplorerCustomContentValue initWithFeatureValue:featureType:](v10, "initWithFeatureValue:featureType:", v11, CFSTR("OCR"));

    objc_msgSend(v9, "axSafelyAddObject:", v12);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v4);

  }
}

void sub_10000C818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C830(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  id v47;
  void *v48;
  id v49;
  id obj;
  NSMutableDictionary *v51;
  void *v52;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _BYTE v64[128];

  v47 = a2;
  v49 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_10000B698;
  v62 = sub_10000B6A8;
  v63 = (id)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "axFilterObjectsUsingBlock:", &stru_100024AD0));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axFilterObjectsUsingBlock:", &stru_100024AF0));
  v45 = v4;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v59[5];
    v7 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.maybe.x.people"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5));
    v10 = __UIAXStringForVariables(v6, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v59[5];
    v59[5] = v11;

    if (objc_msgSend(v48, "count", v41, CFSTR("__AXStringForVariablesSentinel")))
    {
      v13 = v59[5];
      v14 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.relations.including.people.names"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.value")));
      v17 = UIAXLabelForElements();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v18));
      v43 = CFSTR("__AXStringForVariablesSentinel");
      v20 = __UIAXStringForVariables(v13, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)v59[5];
      v59[5] = v21;

    }
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "axFilterObjectsUsingBlock:", &stru_100024B10, v40, v43));
  v51 = objc_opt_new(NSMutableDictionary);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.value")));
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value = %@"), v26));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "filteredArrayUsingPredicate:", v27));
        v29 = objc_msgSend(v28, "count");

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29));
        -[NSMutableDictionary setObject:forKey:](v51, "setObject:forKey:", v30, v26);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v23);
  }

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10000CDCC;
  v53[3] = &unk_100024B38;
  v53[4] = &v58;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v51, "enumerateKeysAndObjectsUsingBlock:", v53);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "axFilterObjectsUsingBlock:", &stru_100024B58));
  if (objc_msgSend(v31, "count"))
  {
    v32 = v59[5];
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.value")));
    v34 = UIAXLabelForElements();
    v42 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v44 = CFSTR("__AXStringForVariablesSentinel");
    v36 = __UIAXStringForVariables(v32, v35);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = (void *)v59[5];
    v59[5] = v37;

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v47, v59[5], v42, v44));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "axSafelyAddObject:", v39);

  _Block_object_dispose(&v58, 8);
}

void sub_10000CCBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10000CD0C(id a1, VOTImageExplorerCustomContentValue *a2, unint64_t a3)
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerCustomContentValue type](a2, "type", a3));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Face"));

  return v4;
}

BOOL sub_10000CD4C(id a1, VOTImageExplorerCustomContentValue *a2, unint64_t a3)
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerCustomContentValue value](a2, "value", a3));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("UNKFace")) ^ 1;

  return v4;
}

BOOL sub_10000CD8C(id a1, VOTImageExplorerCustomContentValue *a2, unint64_t a3)
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerCustomContentValue type](a2, "type", a3));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Object"));

  return v4;
}

void sub_10000CDCC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_msgSend(a3, "unsignedIntegerValue");
  v7 = v14;
  if (v6)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v9 = v14;
    if (v6 != (id)1)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu %@"), v6, v14));
    v10 = __UIAXStringForVariables(v8, v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v7 = v14;
    if (v6 != (id)1)
    {

      v7 = v14;
    }
  }

}

BOOL sub_10000CE94(id a1, VOTImageExplorerCustomContentValue *a2, unint64_t a3)
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerCustomContentValue type](a2, "type", a3));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("OCR"));

  return v4;
}

void sub_10000DA74(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "sceneClassId"));
  objc_msgSend(v2, "axSafelyAddObject:", v3);

}

void sub_10000DB50(id a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v1 = (id *)qword_10002E790;
  v10 = (void *)qword_10002E790;
  if (!qword_10002E790)
  {
    v2 = (void *)sub_10000DCF4();
    v1 = (id *)dlsym(v2, "kTCCServicePhotos");
    v8[3] = (uint64_t)v1;
    qword_10002E790 = (uint64_t)v1;
  }
  _Block_object_dispose(&v7, 8);
  if (!v1)
  {
    sub_10001343C();
    goto LABEL_9;
  }
  v3 = objc_retainAutorelease(*v1);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = off_10002E780;
  v10 = off_10002E780;
  if (!off_10002E780)
  {
    v5 = (void *)sub_10000DCF4();
    v4 = dlsym(v5, "TCCAccessPreflight");
    v8[3] = (uint64_t)v4;
    off_10002E780 = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
LABEL_9:
    v6 = (_Unwind_Exception *)sub_10001343C();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  byte_10002E770 = ((unsigned int (*)(id, _QWORD))v4)(v3, 0) == 0;
}

id sub_10000DC74(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSBundle *v5;
  void *v6;
  void *v7;

  v1 = a1;
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AXUIViewServiceUtilities, v2, v3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v1, &stru_100024F18, CFSTR("AXUIViewService")));

  return v7;
}

uint64_t sub_10000DCF4()
{
  uint64_t v0;
  char *v1;
  char *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10002E788)
  {
    v4 = off_100024BE8;
    v5 = 0;
    qword_10002E788 = _sl_dlopen(&v4, &v3);
  }
  v0 = qword_10002E788;
  v1 = v3;
  if (!qword_10002E788)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }
  if (v3)
LABEL_7:
    free(v1);
  return v0;
}

void sub_10000E0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000E0F8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "value");
  v2 = AXFormatFloatWithPercentage(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  return v3;
}

id sub_10000FC4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "selectAll:", 0);
}

void sub_10000FECC(id a1)
{
  void *v1;
  void *v2;
  unsigned __int8 v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  void *v24;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/AccessibilityBundles/GAXClient.bundle")));
  v2 = v1;
  if (v1)
  {
    v22 = 0;
    v3 = objc_msgSend(v1, "loadAndReturnError:", &v22);
    v4 = v22;
    if ((v3 & 1) != 0)
      goto LABEL_14;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](AXSubsystemVoiceOver, "sharedInstance"));
    v6 = objc_msgSend(v5, "ignoreLogging");

    if ((v6 & 1) != 0)
      goto LABEL_14;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](AXSubsystemVoiceOver, "identifier"));
    v8 = AXLoggerForFacility();
    v9 = objc_claimAutoreleasedReturnValue(v8);

    v10 = AXOSLogLevelFromAXLogLevel(1);
    if (!os_log_type_enabled(v9, v10))
      goto LABEL_13;
    v11 = AXColorizeFormatLog(1, CFSTR("**** AX Error: Could not load GAX Client bundle. loadAndReturnError failed: %@"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = _AXStringForArgs(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}@", buf, 0xCu);
    }

LABEL_12:
LABEL_13:

    goto LABEL_14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](AXSubsystemVoiceOver, "sharedInstance"));
  v16 = objc_msgSend(v15, "ignoreLogging");

  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](AXSubsystemVoiceOver, "identifier"));
    v18 = AXLoggerForFacility();
    v4 = objc_claimAutoreleasedReturnValue(v18);

    v19 = AXOSLogLevelFromAXLogLevel(1);
    if (!os_log_type_enabled(v4, v19))
    {
LABEL_14:

      goto LABEL_15;
    }
    v20 = AXColorizeFormatLog(1, CFSTR("**** AX Error: Could not load GAX Client bundle. bundleWithPath came back nil"));
    v9 = objc_claimAutoreleasedReturnValue(v20);
    v21 = ((uint64_t (*)(void))_AXStringForArgs)();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v4, v19))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, v19, "%{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_15:

}

uint64_t sub_100010504(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndex:"));
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40)) ^ 1;

  return v3;
}

BOOL sub_100010550(id a1, id a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

void sub_1000105F8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

id sub_10001062C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resignFirstResponder");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setText:", &stru_100024F18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v4, "itemChooser:didSelectItemAtIndex:activate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 120));

  return objc_msgSend(*(id *)(a1 + 32), "_updateGuidedAccessWindowId:", 0);
}

BOOL sub_100010854(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "lowercaseString"));
  v4 = objc_msgSend(v3, "rangeOfString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104)) == (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

void sub_100010C44(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  __CFString *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringToIndex:", 1));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uppercaseString"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet"));
    v8 = objc_msgSend(v7, "characterIsMember:", -[__CFString characterAtIndex:](v6, "characterAtIndex:", 0));

    if ((v8 & 1) == 0)
    {

      v6 = CFSTR("#");
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v6));
    if (!v9)
    {
      v9 = objc_msgSend(objc_allocWithZone((Class)NSMutableArray), "init");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v9, v6);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v10, 0));
    objc_msgSend(v9, "addObject:", v11);

  }
}

int64_t sub_100010D98(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a2, "localizedCaseInsensitiveCompare:", a3);
}

void sub_100010DA0(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v1, "setIndexBackgroundColor:", v2);

}

id sub_100010F4C(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  void *v6;
  CGRect v8;
  CGRect v9;

  v8 = CGRectIntegral(*(CGRect *)(a1 + 40));
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v6, "setFrame:", x, y, width, height);

  v9 = CGRectIntegral(*(CGRect *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

void sub_100012478(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");

}

void sub_1000127C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1000127EC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismiss");

}

void sub_100012818(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismiss");

}

void sub_1000129D0(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");
  objc_msgSend(v1, "invalidate");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100024E48);

}

void sub_100012A1C(id a1)
{
  objc_msgSend(UIApp, "terminateWithSuccess");
}

void sub_100012CFC(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemChooserController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "items"));
  objc_msgSend(v3, "showItemChooser:", v2);

}

void sub_100012E34(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;
  char v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v2, "deactivate");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012ECC;
  v4[3] = &unk_100024E70;
  v3 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_BYTE *)(a1 + 56);
  v5 = v3;
  AXPerformBlockOnMainThreadAfterDelay(v4, 0.1);

}

void sub_100012ECC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[3];

  v6[0] = CFSTR("row");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  v7[0] = v2;
  v6[1] = CFSTR("activate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  v6[2] = CFSTR("searchTerm");
  v4 = *(_QWORD *)(a1 + 32);
  v7[1] = v3;
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  UIAccessibilityPostNotification(0x7EAu, v5);

}

void sub_10001324C(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  objc_class *v6;
  NSString *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;

  v6 = (objc_class *)objc_opt_class(a1, a2, a3, a4);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = 138412546;
  v10 = v8;
  v11 = 2112;
  v12 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ - Did prepare for alert activation context : %@", (uint8_t *)&v9, 0x16u);

}

void sub_1000132FC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not decode settings data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100013370(uint64_t a1, void *a2, NSObject *a3, uint64_t a4)
{
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;

  v6 = (objc_class *)objc_opt_class(a1, a2, a3, a4);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  v10 = 138412802;
  v11 = v8;
  v12 = 2112;
  v13 = a2;
  v14 = 2112;
  v15 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ - Did configure with alert configuration context : %@, userInfo : %@", (uint8_t *)&v10, 0x20u);

}

uint64_t sub_10001343C()
{
  char *v0;
  uint64_t v1;

  v0 = dlerror();
  v1 = abort_report_np("%s", v0);
  return sub_10001345C(v1);
}

void sub_10001345C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138477827;
  v4 = a1;
  sub_1000048D0((void *)&_mh_execute_header, a2, a3, "Unable to get identifier for command with dictionary: %{private}@", (uint8_t *)&v3);
  sub_1000048DC();
}

void sub_1000134C4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_1000048D0((void *)&_mh_execute_header, a2, a3, "Unable to get a valid shortcut from identifier: %@", (uint8_t *)&v3);
  sub_1000048DC();
}

void sub_10001352C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000048E4();
  sub_1000048BC((void *)&_mh_execute_header, v0, v1, "Unable to deserialize user action flow from data: %@, error: %@");
  sub_1000048DC();
}

void sub_10001358C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000048E4();
  sub_1000048BC((void *)&_mh_execute_header, v0, v1, "Unable to deserialize gesture from data: %@, error: %@");
  sub_1000048DC();
}

void sub_1000135EC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Empty string passed as text to insert", v1, 2u);
}

void sub_10001362C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userInfo"));
  v5 = 138412290;
  v6 = v3;
  sub_1000048D0((void *)&_mh_execute_header, a2, v4, "Unsupported context for custom command: %@", (uint8_t *)&v5);

}

uint64_t sub_1000136BC()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CACCustomCommandEditorViewController");
  return sub_1000136E0(v0);
}

uint64_t sub_1000136E0()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CACSpokenCommandItem");
  return sub_100013704(v0);
}

uint64_t sub_100013704()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CACPreferences");
  return sub_100013728(v0);
}

uint64_t sub_100013728()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CACRecordedUserActionFlow");
  return sub_10001374C(v0);
}

void sub_10001374C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (objc_class *)sub_100005734(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1000056D0((void *)&_mh_execute_header, v7, v8, "%@ - detail data not found", v9, v10, v11, v12, 2u);

  sub_100005704();
}

void sub_1000137C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (objc_class *)sub_100005734(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1000056D0((void *)&_mh_execute_header, v7, v8, "%@ - features not found", v9, v10, v11, v12, 2u);

  sub_100005704();
}

void sub_100013844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (objc_class *)sub_100005734(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1000056D0((void *)&_mh_execute_header, v7, v8, "%@ - image is nil", v9, v10, v11, v12, 2u);

  sub_100005704();
}

void sub_1000138C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  v5 = (objc_class *)objc_opt_class(a1, a2, a3, a4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "image"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "features"));
  sub_1000056E4();
  sub_100005710((void *)&_mh_execute_header, v10, v11, "%@ - After update : image : %@ features : %@", v12, v13, v14, v15, v16);

  sub_100005724();
}

void sub_10001396C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  v5 = (objc_class *)objc_opt_class(a1, a2, a3, a4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "image"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "features"));
  sub_1000056E4();
  sub_100005710((void *)&_mh_execute_header, v10, v11, "%@ - Before update : image : %@ features : %@", v12, v13, v14, v15, v16);

  sub_100005724();
}

uint64_t sub_100013A18()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CACCorrectionsCollectionViewController");
  return sub_100013A3C(v0);
}

uint64_t sub_100013A3C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CACPopoverPresentingViewController");
  return sub_100013A60(v0);
}

void sub_100013A60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  sub_1000092B4();
  v4 = (objc_class *)sub_100005734(v0, v1, v2, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000927C();
  sub_100009258((void *)&_mh_execute_header, v7, v8, "%@ - Did prepare for alert activation context : %@", v9, v10, v11, v12, v13);

  sub_10000926C();
}

void sub_100013ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (objc_class *)sub_100005734(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100009304();
  sub_1000056D0((void *)&_mh_execute_header, v7, v8, "%@ - Unable to unarchive AXMVisionResult object from imageData", v9, v10, v11, v12, v13);

  sub_100005704();
}

void sub_100013B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (objc_class *)sub_100005734(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100009304();
  sub_1000056D0((void *)&_mh_execute_header, v7, v8, "%@ - Unable to unarchive AXSBImageExplorerData object from imageData", v9, v10, v11, v12, v13);

  sub_100005704();
}

void sub_100013BCC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  sub_1000092D4();
  v5 = (objc_class *)sub_1000092E4(v1, v2, v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "elementInfo"));
  sub_100009294();
  sub_1000092C0((void *)&_mh_execute_header, v9, v10, "%@ - elementInfo must be type AXSBImageExplorerData. was actually %@. error:%@ ", v11, v12, v13, v14, v15);

  sub_100005724();
}

void sub_100013C5C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  sub_1000092D4();
  v5 = (objc_class *)sub_1000092E4(v1, v2, v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "visionResult"));
  sub_100009294();
  sub_1000092C0((void *)&_mh_execute_header, v9, v10, "%@ - result must be type AXMVisionResult. was actually %@. error:%@ ", v11, v12, v13, v14, v15);

  sub_100005724();
}

void sub_100013CEC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_1000092B4();
  v5 = (objc_class *)sub_1000092E4(v1, v2, v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "userInfo"));
  sub_1000092EC();
  sub_100005710((void *)&_mh_execute_header, v9, v10, "%@ - Did configure with alert configuration context : %@, userInfo : %@", v11, v12, v13, v14, 2u);

  sub_100005724();
}

void sub_100013D84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  sub_1000092B4();
  v4 = (objc_class *)sub_100005734(v0, v1, v2, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000927C();
  sub_100009258((void *)&_mh_execute_header, v7, v8, "%@ - Using screengrab image : %@", v9, v10, v11, v12, v13);

  sub_10000926C();
}

void sub_100013E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (objc_class *)sub_100005734(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100009304();
  sub_1000056D0((void *)&_mh_execute_header, v7, v8, "%@ - Neither a valid local identifier, nor a valid image, nor a valid imageURL available to present the Image Explorer", v9, v10, v11, v12, v13);

  sub_100005704();
}

void sub_100013E78()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_1000092D4();
  v5 = (objc_class *)sub_1000092E4(v1, v2, v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "_photoLibraryURL"));
  sub_1000092EC();
  sub_100005710((void *)&_mh_execute_header, v9, v10, "%@ - Using asset local identifier : %@ at photoLibraryURL : %@", v11, v12, v13, v14, 2u);

  sub_100005724();
}

void sub_100013F10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  sub_1000092B4();
  v4 = (objc_class *)sub_100005734(v0, v1, v2, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000927C();
  sub_100009258((void *)&_mh_execute_header, v7, v8, "%@ - Vision engine to process image downloaded from iCloud. %@", v9, v10, v11, v12, v13);

  sub_10000926C();
}

void sub_100013F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  sub_1000092B4();
  v4 = (objc_class *)sub_100005734(v0, v1, v2, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100009304();
  sub_100009258((void *)&_mh_execute_header, v7, v8, "%@ - Reload image from PHAsset's localIdentifier : %@", v9, v10, v11, v12, v13);

  sub_10000926C();
}

void sub_100014018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (objc_class *)sub_100009310(a1, a2, a3, a4);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100009258((void *)&_mh_execute_header, v7, v8, "%@ - Vision request took %.3fs to complete", v9, v10, v11, v12, 2u);

}

void sub_1000140C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  sub_1000092B4();
  v4 = (objc_class *)sub_100009310(v0, v1, v2, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000927C();
  sub_100009258((void *)&_mh_execute_header, v7, v8, "%@ - Vision results available : %@", v9, v10, v11, v12, v13);

  sub_10000926C();
}

void sub_100014144(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "detailData"));
  sub_100009304();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Detail data : %@", v4, 0xCu);

  sub_100005704();
}

void sub_1000141CC(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const __CFString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = CFSTR("VoiceOverImageExplorer.text.rotor");
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to add element %@ with a feature key of: %@", (uint8_t *)&v4, 0x16u);

}

id objc_msgSend_Activities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Activities");
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_ScreenRecognition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ScreenRecognition");
}

id objc_msgSend_Volume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Volume");
}

id objc_msgSend__accessibilityCustomContentForFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityCustomContentForFeature:");
}

id objc_msgSend__accessibilityFindDescendant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityFindDescendant:");
}

id objc_msgSend__accessibilityShouldClearChildren(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessibilityShouldClearChildren");
}

id objc_msgSend__assetLocalIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_assetLocalIdentifier");
}

id objc_msgSend__axNearbyRelationKeyForFeature_andNeighborFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_axNearbyRelationKeyForFeature:andNeighborFeature:");
}

id objc_msgSend__axNearbyRelationsForFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_axNearbyRelationsForFeature:");
}

id objc_msgSend__axRelationOfCurrentFrame_withNeighborFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_axRelationOfCurrentFrame:withNeighborFrame:");
}

id objc_msgSend__constraintsToPositionItem_identicallyToItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_constraintsToPositionItem:identicallyToItem:");
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contextId");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__displayWithList_fromRotorSwitch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_displayWithList:fromRotorSwitch:");
}

id objc_msgSend__explorerImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_explorerImage");
}

id objc_msgSend__filterContentForSearchText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filterContentForSearchText:");
}

id objc_msgSend__findPeopleFeatureThatOverlapsWithFace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findPeopleFeatureThatOverlapsWithFace:");
}

id objc_msgSend__generateFaceAccessibilityElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateFaceAccessibilityElements");
}

id objc_msgSend__generateOCRDocumentAccessibilityElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateOCRDocumentAccessibilityElements");
}

id objc_msgSend__generateOCRTextAccessibilityElementsForFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateOCRTextAccessibilityElementsForFeature:");
}

id objc_msgSend__generateObjectClassificationAccessibilityElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateObjectClassificationAccessibilityElements");
}

id objc_msgSend__guidedAccessItemChooserDidShow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_guidedAccessItemChooserDidShow");
}

id objc_msgSend__handleSearchFieldTextChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSearchFieldTextChange:");
}

id objc_msgSend__imageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imageURL");
}

id objc_msgSend__isAssetLocallyAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isAssetLocallyAvailable");
}

id objc_msgSend__isFiltering(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isFiltering");
}

id objc_msgSend__isSearchBarEmpty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isSearchBarEmpty");
}

id objc_msgSend__loadGuidedAccessBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadGuidedAccessBundle");
}

id objc_msgSend__photoAssetDataWithNetWorkAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_photoAssetDataWithNetWorkAccess:");
}

id objc_msgSend__photoLibraryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_photoLibraryURL");
}

id objc_msgSend__populateCaptionAndMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populateCaptionAndMetadata");
}

id objc_msgSend__positionAccountingForKeyboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_positionAccountingForKeyboard:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__screenGrabImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_screenGrabImage");
}

id objc_msgSend__setAccessibilityElementsBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAccessibilityElementsBlock:");
}

id objc_msgSend__setAccessibilityServesAsFirstElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAccessibilityServesAsFirstElement:");
}

id objc_msgSend__setSectionIndexColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSectionIndexColor:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__settingsItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_settingsItem");
}

id objc_msgSend__setupRemoteProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupRemoteProxy");
}

id objc_msgSend__specifierForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_specifierForItem:");
}

id objc_msgSend__updateCellAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCellAccessories");
}

id objc_msgSend__updateCellAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCellAccessory:");
}

id objc_msgSend__updateGuidedAccessWindowId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateGuidedAccessWindowId:");
}

id objc_msgSend__updatePositionForKeyboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePositionForKeyboard:");
}

id objc_msgSend__updateSelectedRow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSelectedRow:");
}

id objc_msgSend__visionFeatureDescriptionOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_visionFeatureDescriptionOptions");
}

id objc_msgSend_accessibilityContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityContainer");
}

id objc_msgSend_accessibilityContainerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityContainerType");
}

id objc_msgSend_accessibilityCustomActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityCustomActions");
}

id objc_msgSend_accessibilityDecrement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityDecrement");
}

id objc_msgSend_accessibilityElementAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityElementAtIndex:");
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityElements");
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityFrame");
}

id objc_msgSend_accessibilityIncrement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityIncrement");
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityLabel");
}

id objc_msgSend_accessibilityLabelForAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityLabelForAttributes");
}

id objc_msgSend_accessibilityTraits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityTraits");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addElement_toElements_forFeatureKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addElement:toElements:forFeatureKey:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allSpecifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSpecifiers");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetLocallyAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetLocallyAvailable");
}

id objc_msgSend_assetMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetMetadata");
}

id objc_msgSend_assetMetadataFeature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetMetadataFeature");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_axArrayByIgnoringNilElementsWithCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axArrayByIgnoringNilElementsWithCount:");
}

id objc_msgSend_axCapitalizeFirstLetter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axCapitalizeFirstLetter");
}

id objc_msgSend_axFilterObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axFilterObjectsUsingBlock:");
}

id objc_msgSend_axLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axLabel");
}

id objc_msgSend_axSafelyAddEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axSafelyAddEntriesFromDictionary:");
}

id objc_msgSend_axSafelyAddObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axSafelyAddObject:");
}

id objc_msgSend_axSafelyAddObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axSafelyAddObjectsFromArray:");
}

id objc_msgSend_axSortedElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axSortedElements");
}

id objc_msgSend_axTCCAllowsPhotoLibraryAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axTCCAllowsPhotoLibraryAccess");
}

id objc_msgSend_axVisionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axVisionQueue");
}

id objc_msgSend_ax_filteredArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ax_filteredArrayUsingBlock:");
}

id objc_msgSend_ax_flatMappedArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ax_flatMappedArrayUsingBlock:");
}

id objc_msgSend_ax_pinConstraintsInAllDimensionsToView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ax_pinConstraintsInAllDimensionsToView:");
}

id objc_msgSend_ax_removeObjectsFromArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ax_removeObjectsFromArrayUsingBlock:");
}

id objc_msgSend_axmIsSceneClassId_childOfSceneClassId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axmIsSceneClassId:childOfSceneClassId:");
}

id objc_msgSend_axmSecurelyUnarchiveData_withExpectedClass_otherAllowedClasses_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "axmSecurelyUnarchiveData:withExpectedClass:otherAllowedClasses:error:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_becomeKeyWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeKeyWindow");
}

id objc_msgSend_bestLocaleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestLocaleIdentifier");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_boundingBoxForRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundingBoxForRange:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_cell(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell");
}

id objc_msgSend_cellAccessibility(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellAccessibility");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_chartDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chartDescriptor");
}

id objc_msgSend_classificationLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classificationLabel");
}

id objc_msgSend_classificationLocalizedValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classificationLocalizedValue");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_collectionViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionViewController");
}

id objc_msgSend_columnIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "columnIndex");
}

id objc_msgSend_commandItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandItem");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToSystemSpacingBelowAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToSystemSpacingBelowAnchor:multiplier:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "control");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentItem");
}

id objc_msgSend_customContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customContent");
}

id objc_msgSend_customContentWithLabel_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customContentWithLabel:value:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultExcludeOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultExcludeOptions");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detailData");
}

id objc_msgSend_detectedCaptionFeatureDescriptionWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectedCaptionFeatureDescriptionWithOptions:");
}

id objc_msgSend_detectedSceneClassificationFeatureDescriptionWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectedSceneClassificationFeatureDescriptionWithOptions:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForSavingToPreferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForSavingToPreferences");
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

id objc_msgSend_dismissDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissDelegate");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_editor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "editor");
}

id objc_msgSend_editorNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "editorNavigationController");
}

id objc_msgSend_elementInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elementInfo");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_explorableOCRTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "explorableOCRTypes");
}

id objc_msgSend_explorerImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "explorerImageView");
}

id objc_msgSend_faceDetectionResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faceDetectionResult");
}

id objc_msgSend_faceFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faceFeatures");
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feature");
}

id objc_msgSend_featureType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureType");
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "features");
}

id objc_msgSend_filterFeatureList_basedOnSceneClassIdsForFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterFeatureList:basedOnSceneClassIdsForFeature:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredColumnHeaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredColumnHeaders");
}

id objc_msgSend_filteredSpecifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredSpecifiers");
}

id objc_msgSend_filteredSubfeaturesForFeature_withOCRType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredSubfeaturesForFeature:withOCRType:");
}

id objc_msgSend_filteredSubfeaturesWithFeatureType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredSubfeaturesWithFeatureType:");
}

id objc_msgSend_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findLeastCommonAncestorForSceneClassIds:withKnownAncestorSceneClassId:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flippedYAxis(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flippedYAxis");
}

id objc_msgSend_formattedValue_withItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedValue:withItem:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_frontmostAppIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontmostAppIdentifier");
}

id objc_msgSend_generateAccessibilityElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateAccessibilityElements");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_hideItemChooser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideItemChooser:");
}

id objc_msgSend_hostAppName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostAppName");
}

id objc_msgSend_hostingController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostingController");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoreLogging");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageData");
}

id objc_msgSend_imageExplorerRotorCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageExplorerRotorCache");
}

id objc_msgSend_imageExplorerRotorWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageExplorerRotorWithName:");
}

id objc_msgSend_imageExplorerViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageExplorerViewController");
}

id objc_msgSend_imageExplorerViewControllerWillDisappear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageExplorerViewControllerWillDisappear");
}

id objc_msgSend_imageNode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNode");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCIImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCIImage:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFeatureValue_featureType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFeatureValue:featureType:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImageAssetLocalIdentifier_photoLibraryURL_allowsNetworkAccess_needsImageData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:");
}

id objc_msgSend_initWithImageView_forFaceFeature_withOverlappingPeopleFeature_hasFlippedYAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImageView:forFaceFeature:withOverlappingPeopleFeature:hasFlippedYAxis:");
}

id objc_msgSend_initWithImageView_forFeature_hasFlippedYAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImageView:forFeature:hasFlippedYAxis:");
}

id objc_msgSend_initWithImageView_forFeature_withMatchingScenes_hasFlippedYAxis_objectIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImageView:forFeature:withMatchingScenes:hasFlippedYAxis:objectIndex:");
}

id objc_msgSend_initWithImageView_forTextFeature_withParentTextFeature_hasFlippedYAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImageView:forTextFeature:withParentTextFeature:hasFlippedYAxis:");
}

id objc_msgSend_initWithKey_values_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKey:values:");
}

id objc_msgSend_initWithName_itemSearchBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:itemSearchBlock:");
}

id objc_msgSend_initWithPrivateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrivateStyle:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSearchResultsController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSearchResultsController:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithWeakCell_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWeakCell:");
}

id objc_msgSend_initializeImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeImageView");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstResponder");
}

id objc_msgSend_isHeader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHeader");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_itemChooser_didSelectItemAtIndex_activate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemChooser:didSelectItemAtIndex:activate:");
}

id objc_msgSend_itemChooserActivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemChooserActivate");
}

id objc_msgSend_itemChooserController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemChooserController");
}

id objc_msgSend_itemChooserSelectedIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemChooserSelectedIndex");
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemType");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "items");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "key");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_lastSearchTerm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSearchTerm");
}

id objc_msgSend_launchImageExplorerFromHostApp_withImage_visionFeatures_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchImageExplorerFromHostApp:withImage:visionFeatures:data:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_letterCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "letterCharacterSet");
}

id objc_msgSend_loadAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadAndReturnError:");
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdentifier");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForLocation_isSubjectImplicit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForLocation:isSubjectImplicit:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_locationUsingThirds_withFlippedYAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationUsingThirds:withFlippedYAxis:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_makeAudiographExplorerView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeAudiographExplorerView:");
}

id objc_msgSend_matchingScenes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchingScenes");
}

id objc_msgSend_mediaAnalysisFaceDetectionResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaAnalysisFaceDetectionResult");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nameForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameForItem:");
}

id objc_msgSend_nameForOCRType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameForOCRType:");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_newCommandItemWithLocale_scope_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newCommandItemWithLocale:scope:");
}

id objc_msgSend_normalizedFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "normalizedFrame");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectClassificationFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectClassificationFeatures");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectIndex");
}

id objc_msgSend_ocrFeatureType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ocrFeatureType");
}

id objc_msgSend_ocrFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ocrFeatures");
}

id objc_msgSend_parentAccessibilityContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentAccessibilityContainer");
}

id objc_msgSend_parentTextFeature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentTextFeature");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_peopleFeature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peopleFeature");
}

id objc_msgSend_peopleFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peopleFeatures");
}

id objc_msgSend_photoLibraryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoLibraryURL");
}

id objc_msgSend_popoverPresentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popoverPresentingViewController");
}

id objc_msgSend_possibleValuesForSettingsItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "possibleValuesForSettingsItem:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:compatibleWithTraitCollection:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_quickSettingsViewControllerWasDismissed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quickSettingsViewControllerWasDismissed:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerUpdateBlock:forRetrieveSelector:withListener:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadSpecifiers");
}

id objc_msgSend_reloadWithSpecifier_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadWithSpecifier:animated:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_rowIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rowIndex");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_safeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeValueForKey:");
}

id objc_msgSend_scaledValue_withItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scaledValue:withItem:");
}

id objc_msgSend_sceneClassId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneClassId");
}

id objc_msgSend_sceneClassificationFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneClassificationFeatures");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchBar");
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchController");
}

id objc_msgSend_searchDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchDirection");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "section");
}

id objc_msgSend_series(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "series");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessibilityCustomContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityCustomContent:");
}

id objc_msgSend_setAccessibilityHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityHint:");
}

id objc_msgSend_setAccessibilityTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityTraits:");
}

id objc_msgSend_setAccessibilityValueBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityValueBlock:");
}

id objc_msgSend_setAccessibilityViewIsModal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityViewIsModal:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlternatives_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternatives:");
}

id objc_msgSend_setApplicationIdentifiersToNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationIdentifiersToNames:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCell_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCell:");
}

id objc_msgSend_setChartDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChartDescriptor:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColumnIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColumnIndex:");
}

id objc_msgSend_setCommandItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommandItem:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCustomGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomGesture:");
}

id objc_msgSend_setCustomShortcutsWorkflowIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomShortcutsWorkflowIdentifier:");
}

id objc_msgSend_setCustomTextToInsert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomTextToInsert:");
}

id objc_msgSend_setCustomType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomType:");
}

id objc_msgSend_setCustomUserActionFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomUserActionFlow:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDefinesPresentationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefinesPresentationContext:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDismissDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissDelegate:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setElementInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setElementInfo:");
}

id objc_msgSend_setEmojis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmojis:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setExcludeOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExcludeOptions:");
}

id objc_msgSend_setExplorerImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExplorerImageView:");
}

id objc_msgSend_setFaceFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceFeatures:");
}

id objc_msgSend_setFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFeatures:");
}

id objc_msgSend_setFilteredSpecifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilteredSpecifiers:");
}

id objc_msgSend_setFlippedYAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlippedYAxis:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidesNavigationBarDuringPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesNavigationBarDuringPresentation:");
}

id objc_msgSend_setHidesSearchBarWhenScrolling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesSearchBarWhenScrolling:");
}

id objc_msgSend_setHostAppName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostAppName:");
}

id objc_msgSend_setHostingController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostingController:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageExplorerRotorCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageExplorerRotorCache:");
}

id objc_msgSend_setImageExplorerViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageExplorerViewController:");
}

id objc_msgSend_setIndexBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIndexBackgroundColor:");
}

id objc_msgSend_setItemChooserActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemChooserActivate:");
}

id objc_msgSend_setItemChooserController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemChooserController:");
}

id objc_msgSend_setItemChooserSelectedIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemChooserSelectedIndex:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setNextValueForItem_inDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextValueForItem:inDirection:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectClassificationFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectClassificationFeatures:");
}

id objc_msgSend_setObscuresBackgroundDuringPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObscuresBackgroundDuringPresentation:");
}

id objc_msgSend_setOcrFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOcrFeatures:");
}

id objc_msgSend_setOrientationChangedEventsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientationChangedEventsEnabled:");
}

id objc_msgSend_setPeopleFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeopleFeatures:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPopoverPresentationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPopoverPresentationDelegate:");
}

id objc_msgSend_setPortraitUpSourceRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPortraitUpSourceRect:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRightBarButtonItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItems:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setRowIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRowIndex:");
}

id objc_msgSend_setSceneClassificationFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSceneClassificationFeatures:");
}

id objc_msgSend_setSearchController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchController:");
}

id objc_msgSend_setSearchResultsUpdater_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchResultsUpdater:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setSettingsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSettingsData:");
}

id objc_msgSend_setSettingsItemUpdateObserverToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSettingsItemUpdateObserverToken:");
}

id objc_msgSend_setShouldProcessRemotely_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldProcessRemotely:");
}

id objc_msgSend_setSpeakFilteredItemSummaryTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpeakFilteredItemSummaryTimer:");
}

id objc_msgSend_setSpellCheckingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpellCheckingType:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableView:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTargetElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetElement:");
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

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:animated:");
}

id objc_msgSend_setValue_forSettingsItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forSettingsItem:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllerInPopover_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllerInPopover:");
}

id objc_msgSend_setVisionFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVisionFeatures:");
}

id objc_msgSend_setVisionResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVisionResult:");
}

id objc_msgSend_setWallpaperStyle_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperStyle:withDuration:");
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperTunnelActive:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_settingsItemUpdateObserverToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsItemUpdateObserverToken");
}

id objc_msgSend_setupNavigationItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupNavigationItems");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPreferences");
}

id objc_msgSend_shortcutForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortcutForIdentifier:");
}

id objc_msgSend_showItemChooser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showItemChooser:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sortedElements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedElements");
}

id objc_msgSend_speakFilteredItemSummaryTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakFilteredItemSummaryTimer");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specifier");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subfeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subfeatures");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "table");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_targetElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetElement");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textLabel");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_triggerWithImage_options_cacheKey_resultHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerWithImage:options:cacheKey:resultHandler:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateImageExplorerWithImage_features_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateImageExplorerWithImage:features:data:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userSettingsItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSettingsItems");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueForSettingsItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForSettingsItem:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "values");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerForType_onDismiss_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForType:onDismiss:");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleCells");
}

id objc_msgSend_visionEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visionEngine");
}

id objc_msgSend_visionResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visionResult");
}

id objc_msgSend_voiceOverActivities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceOverActivities");
}

id objc_msgSend_voiceOverDiscoveredSensitiveContentFeedback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceOverDiscoveredSensitiveContentFeedback");
}

id objc_msgSend_voiceOverItemChooserDidShow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceOverItemChooserDidShow:");
}

id objc_msgSend_voiceOverMediaDuckingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceOverMediaDuckingMode");
}

id objc_msgSend_voiceOverOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceOverOptions");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
