uint64_t start(int a1, char **a2)
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;

  if (qword_100011D78 != -1)
    dispatch_once(&qword_100011D78, &stru_10000C280);
  v4 = qword_100011D80;
  if (os_log_type_enabled((os_log_t)qword_100011D80, OS_LOG_TYPE_DEBUG))
    sub_1000074A0(v4);
  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(SOUIServiceAppDelegate);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = UIApplicationMain(a1, a2, 0, v8);

  objc_autoreleasePoolPop(v5);
  return v9;
}

void sub_100003E48(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.AppSSO", "AppSSOUIService");
  v2 = (void *)qword_100011D80;
  qword_100011D80 = (uint64_t)v1;

}

void sub_100003EB8(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.AppSSO.ui-queue", 0);
  v2 = (void *)qword_100011D88;
  qword_100011D88 = (uint64_t)v1;

}

id sub_100003FB0()
{
  if (qword_100011D98 != -1)
    dispatch_once(&qword_100011D98, &stru_10000C328);
  return (id)qword_100011DA0;
}

void sub_100004334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000436C()
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
  v0 = (void *)qword_100011DA8;
  v7 = qword_100011DA8;
  if (!qword_100011DA8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100004730;
    v3[3] = &unk_10000C350;
    v3[4] = &v4;
    sub_100004730((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000440C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004424(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100003FB0();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_1000075D4();

  }
}

void sub_10000447C(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100003FB0();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_100007634();

  }
}

void sub_100004654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000466C(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_100003FB0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000076C8();

}

void sub_100004700(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.AppSSO", "SOUIDaemonConnection");
  v2 = (void *)qword_100011DA0;
  qword_100011DA0 = (uint64_t)v1;

}

void sub_100004730(uint64_t a1)
{
  sub_100004784();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SOInternalProtocols");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100011DA8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100007728();
    sub_100004784();
  }
}

void sub_100004784()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_100011DB0)
  {
    v2 = off_10000C370;
    v3 = 0;
    qword_100011DB0 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_100011DB0)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

void sub_100004830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_100004784();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SOErrorHelper");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100011DB8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)sub_10000774C();
    sub_100004884(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_100004884(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000048A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000048B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100004980()
{
  if (qword_100011DC0 != -1)
    dispatch_once(&qword_100011DC0, &stru_10000C388);
  return (id)qword_100011DC8;
}

void sub_100004D98(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.AppSSO", "SOUIServiceAppDelegate");
  v2 = (void *)qword_100011DC8;
  qword_100011DC8 = (uint64_t)v1;

}

id sub_100004E98()
{
  if (qword_100011DD0 != -1)
    dispatch_once(&qword_100011DD0, &stru_10000C500);
  return (id)qword_100011DD8;
}

id sub_100005C20()
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
  v0 = (void *)qword_100011DE0;
  v7 = qword_100011DE0;
  if (!qword_100011DE0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100007338;
    v3[3] = &unk_10000C350;
    v3[4] = &v4;
    sub_100007338((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005CD8(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;

  v6 = a2;
  v7 = a3;
  v8 = sub_100004E98();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "requestAuthorizationViewControllerWithCompletion: remoteViewController = %{public}@, error = %{public}@", buf, 0x16u);
  }

  v10 = *(id **)(a1 + 32);
  if (v6)
  {
    objc_storeStrong(v10 + 3, a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 48);
    *(_QWORD *)(v12 + 48) = v11;

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v16 = *(void **)(v14 + 16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100005EB0;
    v20[3] = &unk_10000C3B0;
    v20[4] = v14;
    v21 = v15;
    objc_msgSend(v16, "beginAuthorizationWithRequestParameters:completion:", v21, v20);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    v18 = objc_msgSend(sub_100005C20(), "errorWithCode:message:suberror:", -1000, CFSTR("Missing remote view controller"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v10, "authorization:didCompleteWithCredential:error:", v17, 0, v19);

  }
}

void sub_100005EB0(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;

  v5 = a3;
  v6 = sub_100004E98();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67240450;
    v10[1] = a2;
    v11 = 2114;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "beginAuthorizationWithRequestParameters: %{public}d, %{public}@", (uint8_t *)v10, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    objc_msgSend(v8, "authorization:didCompleteWithCredential:error:", v9, 0, v5);

  }
}

id sub_100006290()
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
  v0 = (void *)qword_100011DF0;
  v7 = qword_100011DF0;
  if (!qword_100011DF0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100007438;
    v3[3] = &unk_10000C350;
    v3[4] = &v4;
    sub_100007438((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100006330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006450(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "dismiss");

}

void sub_100006B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006BA8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100006BBC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006BCC(uint64_t a1)
{

}

void sub_100006BD4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = sub_100004E98();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1000078E0(a1, v3);

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1 + 40);
    v7 = objc_msgSend(sub_100005C20(), "internalErrorWithMessage:", CFSTR("timed out presenting extension view controller"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v8);

  }
}

void *sub_100006C74(uint64_t a1)
{
  void *result;
  uint64_t v3;
  void *v4;

  result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    objc_msgSend(result, "invalidate");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    return (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

void sub_100006E14(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;

  v5 = a3;
  v6 = sub_100004E98();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = CFSTR("NO");
    v10 = 138412802;
    if (a2)
      v9 = CFSTR("YES");
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ did finish completion: success = %{public}@, error = %{public}@", (uint8_t *)&v10, 0x20u);
  }

}

void sub_100007308(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.AppSSO", "SOUIServiceViewController");
  v2 = (void *)qword_100011DD8;
  qword_100011DD8 = (uint64_t)v1;

}

void sub_100007338(uint64_t a1)
{
  sub_10000738C();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SOErrorHelper");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100011DE0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000774C();
    sub_10000738C();
  }
}

void sub_10000738C()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_100011DE8)
  {
    v2 = off_10000C520;
    v3 = 0;
    qword_100011DE8 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_100011DE8)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_100007438(uint64_t a1)
{
  Class result;

  sub_10000738C();
  result = objc_getClass("SOUtils");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100007A00();
  qword_100011DF0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000074A0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "starting UI service", v1, 2u);
}

void sub_1000074E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000048B8((void *)&_mh_execute_header, a1, a3, "missing daemon XPC endpoint", a5, a6, a7, a8, 0);
}

void sub_100007514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000489C();
  sub_1000048A8((void *)&_mh_execute_header, v0, v1, "%{public}@: failed to create XPC connection", v2, v3, v4, v5, v6);
  sub_100004894();
}

void sub_100007574()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000489C();
  sub_100004884((void *)&_mh_execute_header, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
  sub_100004894();
}

void sub_1000075D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000489C();
  sub_100004884((void *)&_mh_execute_header, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
  sub_100004894();
}

void sub_100007634()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000489C();
  sub_100004884((void *)&_mh_execute_header, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
  sub_100004894();
}

void sub_100007694(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000048B8((void *)&_mh_execute_header, a1, a3, "Failed to connect to AppSSO daemon", a5, a6, a7, a8, 0);
}

void sub_1000076C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000489C();
  sub_1000048A8((void *)&_mh_execute_header, v0, v1, "AppSSO daemon XPC error: %{public}@", v2, v3, v4, v5, v6);
  sub_100004894();
}

uint64_t sub_100007728()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "SOInternalProtocols");
  return sub_10000774C(v0);
}

uint64_t sub_10000774C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "SOErrorHelper");
  return sub_100007770(v0);
}

void sub_100007770(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[SOUIServiceViewController prepareForActivationWithContext:completion:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

void sub_1000077F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007494();
  sub_1000048B8((void *)&_mh_execute_header, v0, v1, "no daemon connection", v2, v3, v4, v5, v6);
  sub_10000748C();
}

void sub_100007824()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100007494();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "show on cover screen is allowed", v1, 2u);
  sub_10000748C();
}

void sub_10000785C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007494();
  sub_1000048B8((void *)&_mh_execute_header, v0, v1, "device screen is locked => authorization request not handled", v2, v3, v4, v5, v6);
  sub_10000748C();
}

void sub_100007888()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007494();
  sub_1000048B8((void *)&_mh_execute_header, v0, v1, "device screen is locked => canceling authorization request", v2, v3, v4, v5, v6);
  sub_10000748C();
}

void sub_1000078B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007494();
  sub_1000048B8((void *)&_mh_execute_header, v0, v1, "device screen is locked => cannot present extension view controller", v2, v3, v4, v5, v6);
  sub_10000748C();
}

void sub_1000078E0(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "timed out presenting extension view controller: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100007964(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = 136315650;
  v4 = "-[SOUIServiceViewController extensionCleanupWithCompletion:]";
  v5 = 2112;
  v6 = v2;
  v7 = 2112;
  v8 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s extension = %@ on %@", (uint8_t *)&v3, 0x20u);
}

void sub_100007A00()
{
  objc_class *v0;

  v0 = (objc_class *)abort_report_np("Unable to find class %s", "SOUtils");
  NSStringFromClass(v0);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__cancelAuthorization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelAuthorization");
}

id objc_msgSend__checkScreenLockStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkScreenLockStatus");
}

id objc_msgSend__connectToDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectToDaemon");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__extensionCleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionCleanup");
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queue");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_authorization_didCompleteWithCredential_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorization:didCompleteWithCredential:error:");
}

id objc_msgSend_authorizationDidCompleteWithCredential_error_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationDidCompleteWithCredential:error:completion:");
}

id objc_msgSend_beginAuthorizationWithRequestParameters_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginAuthorizationWithRequestParameters:completion:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cancelAuthorization_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAuthorization:completion:");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_connectToDaemonWithXpcEndpoint_requestInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToDaemonWithXpcEndpoint:requestInfo:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_errorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:");
}

id objc_msgSend_errorWithCode_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:message:");
}

id objc_msgSend_errorWithCode_message_suberror_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:message:suberror:");
}

id objc_msgSend_errorWithCode_subcode_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:subcode:message:");
}

id objc_msgSend_finishAuthorization_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishAuthorization:completion:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithExtensionViewController_hints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExtensionViewController:hints:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithViewController:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_interfaceWithInternalProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithInternalProtocol:");
}

id objc_msgSend_internalErrorWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalErrorWithMessage:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_loadExtensionWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadExtensionWithBundleIdentifier:");
}

id objc_msgSend_loadInternalExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadInternalExtension");
}

id objc_msgSend_localizedExtensionDisplayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedExtensionDisplayName");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_parameterErrorWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameterErrorWithMessage:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_requestAuthorizationViewControllerWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAuthorizationViewControllerWithCompletion:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_saveDelegate_forRequestIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveDelegate:forRequestIdentifier:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAuditTokenData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuditTokenData:");
}

id objc_msgSend_setAuthorizationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthorizationOptions:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCallerBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallerBundleIdentifier:");
}

id objc_msgSend_setCallerManaged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallerManaged:");
}

id objc_msgSend_setCallerTeamIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallerTeamIdentifier:");
}

id objc_msgSend_setCfNetworkInterception_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCfNetworkInterception:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setEnableUserInteraction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableUserInteraction:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtensionData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionData:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHttpBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHttpBody:");
}

id objc_msgSend_setHttpHeaders_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHttpHeaders:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImpersonationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImpersonationBundleIdentifier:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchingInterfaceOrientation:");
}

id objc_msgSend_setLocalizedCallerDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalizedCallerDisplayName:");
}

id objc_msgSend_setRealm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRealm:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestedOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestedOperation:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcConnection:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_timerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerWithTimeInterval:repeats:block:");
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unload");
}

id objc_msgSend_unloadExtensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unloadExtensions");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection");
}

id objc_msgSend_xpcDaemonEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcDaemonEndpoint");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
