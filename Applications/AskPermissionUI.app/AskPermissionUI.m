uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

id sub_100001910(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccount:", a2);
}

uint64_t sub_100001B78(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_viewControllerProxy"));
  objc_msgSend(v2, "dismiss");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_100001DE4(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "setEventType:", CFSTR("click"));
  objc_msgSend(v3, "setProperty:forBodyKey:", CFSTR("button"), CFSTR("targetType"));
  objc_msgSend(v3, "setProperty:forBodyKey:", CFSTR("com.apple.AskPermissionUI"), CFSTR("hostApp"));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 <= 2)
  {
    v5 = off_1000145F0[v4];
    objc_msgSend(v3, "setProperty:forBodyKey:", off_1000145D8[v4], CFSTR("targetId"));
    objc_msgSend(v3, "setProperty:forBodyKey:", v5, CFSTR("actionType"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3));

  return v6;
}

void sub_100002374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1000023BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
  v7 = (void *)v6;
  if (v4)
  {
    if (!v6)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = (id)objc_opt_class(WeakRetained);
      v15 = 2114;
      v16 = v4;
      v9 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error loading store product view controller. Error: %{public}@", buf, 0x16u);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000025A0;
    block[3] = &unk_1000144B0;
    block[4] = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    if (!v6)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = (id)objc_opt_class(WeakRetained);
      v11 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Loaded store product view controller succesfully", buf, 0xCu);

    }
  }

}

id sub_1000025A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "productViewControllerDidFinishWithAction:", 3);
}

void sub_100002860(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10000287C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = (id)objc_opt_class(WeakRetained);
    v10 = 2114;
    v11 = v3;
    v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@: Remote view controller proxy error. Error:%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void sub_100002B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002B54(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void sub_100002D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002D68(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
  v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSLogObject"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543618;
      v14 = (id)objc_opt_class(WeakRetained);
      v15 = 2114;
      v16 = v3;
      v8 = v14;
      v9 = "%{public}@: Error updating request. Error: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else
  {
    if (!v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSLogObject"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = (id)objc_opt_class(WeakRetained);
      v8 = v14;
      v9 = "%{public}@: Updated request succesfully";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
      goto LABEL_10;
    }
  }

}

void sub_1000031C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_100003200(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bag"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v5));
    objc_msgSend(v4, "enqueueEvent:", v3);

  }
}

void sub_10000327C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateRequestWithAction:", 0);

}

void sub_1000032AC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateRequestWithAction:", 1);

}

Class sub_1000033F8(uint64_t a1)
{
  Class result;

  sub_10000344C();
  result = objc_getClass("SKStoreProductViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10000BC5C();
  qword_10001BC00 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000344C()
{
  uint64_t v0;
  char *v1;
  char *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10001BC08)
  {
    v4 = off_1000145C0;
    v5 = 0;
    qword_10001BC08 = _sl_dlopen(&v4, &v3);
  }
  v0 = qword_10001BC08;
  v1 = v3;
  if (!qword_10001BC08)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }
  if (v3)
LABEL_7:
    free(v1);
  return v0;
}

void sub_100009280(id a1)
{
  void *v1;

  v1 = (void *)qword_10001BC20;
  qword_10001BC20 = (uint64_t)&off_100015A10;

}

void sub_10000AE5C(id a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
  if (!v1)
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "OSLogObject"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received SIGTERM, stopping daemon", v3, 2u);
  }

  exit(0);
}

void sub_10000B71C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  User *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  int v41;
  void *v42;
  __int16 v43;
  id v44;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", AKAuthenticationDSIDKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", AKAuthenticationPasswordKey));
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", AKAuthenticationUsernameKey));
  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;

  if (v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v14)
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "OSLogObject"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
      v41 = 138543618;
      v42 = v16;
      v43 = 2114;
      v44 = v6;
      v17 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to authenticate user. Error: %{public}@", (uint8_t *)&v41, 0x16u);

    }
    v18 = CFSTR("Authentication failed");
    v19 = v6;
    goto LABEL_28;
  }
  if ((objc_opt_respondsToSelector(v7, "stringValue") & 1) == 0
    || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue")), v20, !v20))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v29)
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "OSLogObject"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
      v41 = 138543362;
      v42 = v31;
      v32 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no DSID", (uint8_t *)&v41, 0xCu);

    }
    v18 = CFSTR("Authenticated user but no DSID");
    goto LABEL_27;
  }
  if (!v10)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v34)
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "OSLogObject"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
      v41 = 138543362;
      v42 = v36;
      v37 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no password", (uint8_t *)&v41, 0xCu);

    }
    v18 = CFSTR("Authenticated user but no password");
    goto LABEL_27;
  }
  v21 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
  v22 = (void *)v21;
  if (!v13)
  {
    if (!v21)
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "OSLogObject"));
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
      v41 = 138543362;
      v42 = v39;
      v40 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no username", (uint8_t *)&v41, 0xCu);

    }
    v18 = CFSTR("Authenticated user but no username");
LABEL_27:
    v19 = 0;
LABEL_28:
    v33 = APError(0, CFSTR("User error"), v18, v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v27 = 0;
    goto LABEL_29;
  }
  if (!v21)
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "OSLogObject"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
    v41 = 138543362;
    v42 = v24;
    v25 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Authenticated user succesfully", (uint8_t *)&v41, 0xCu);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  v27 = -[User initWithDSID:username:password:biometricsToken:]([User alloc], "initWithDSID:username:password:biometricsToken:", v26, v13, v10, 0);

  v28 = 0;
LABEL_29:
  (*(void (**)(_QWORD, User *, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v27, v28);

}

void sub_10000BC3C()
{
  char *v0;
  uint64_t v1;

  v0 = dlerror();
  v1 = abort_report_np("%s", v0);
  sub_10000BC5C(v1);
}

void sub_10000BC5C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "SKStoreProductViewController");
  APCustomError(v0);
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DSID");
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "OSLogObject");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__copyKeychainQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyKeychainQuery");
}

id objc_msgSend__countryCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_countryCodes");
}

id objc_msgSend__loadWebsite(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadWebsite");
}

id objc_msgSend__presentErrorAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentErrorAlert");
}

id objc_msgSend__presentStoreProductViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentStoreProductViewController");
}

id objc_msgSend__presentWebProductViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentWebProductViewController");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_run");
}

id objc_msgSend__setProxyingForApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setProxyingForApp:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setup");
}

id objc_msgSend__setupNavigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupNavigationItem");
}

id objc_msgSend__stringWithKey_localeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stringWithKey:localeIdentifier:");
}

id objc_msgSend__updateRequestWithAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateRequestWithAction:");
}

id objc_msgSend__useROWKeyForCountryCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_useROWKeyForCountryCode:");
}

id objc_msgSend__viewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_viewControllerProxy");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_actionDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionDelegate");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activityIndicatorView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityIndicatorView");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_ageRating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ageRating");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_ams_activeiTunesAccountForMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_activeiTunesAccountForMediaType:");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ap_generateDescriptionWithSubObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ap_generateDescriptionWithSubObjects:");
}

id objc_msgSend_ap_setNullableObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ap_setNullableObject:forKey:");
}

id objc_msgSend_approve(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "approve");
}

id objc_msgSend_approverDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "approverDSID");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bag");
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_bannerLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerLabel");
}

id objc_msgSend_biometricsToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "biometricsToken");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "body");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_canSendViaMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canSendViaMessages");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_childViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childViewController");
}

id objc_msgSend_compile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compile");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countryCode");
}

id objc_msgSend_createUniqueIDFromRequestID_andCreatedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createUniqueIDFromRequestID:andCreatedDate:");
}

id objc_msgSend_createdDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createdDate");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decline(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decline");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enqueueEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueEvent:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "font");
}

id objc_msgSend_heightForWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightForWidth:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithApprove_body_decline_title_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApprove:body:decline:title:");
}

id objc_msgSend_initWithCloudPushDictionary_bag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCloudPushDictionary:bag:");
}

id objc_msgSend_initWithDSID_username_password_biometricsToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDSID:username:password:biometricsToken:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDate_requestIdentifier_uniqueIdentifier_itemBundleIdentifier_itemIdentifier_localizations_mocked_offerName_previewURL_productType_productTypeName_productURL_requestInfo_status_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:offerName:previewURL:productType:productTypeName:productURL:requestInfo:status:");
}

id objc_msgSend_initWithDate_requestIdentifier_uniqueIdentifier_itemIdentifier_localizations_offerName_status_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDate:requestIdentifier:uniqueIdentifier:itemIdentifier:localizations:offerName:status:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_internalInstanceUsingBag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalInstanceUsingBag:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMocked");
}

id objc_msgSend_isSubscription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubscription");
}

id objc_msgSend_itemBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemBundleID");
}

id objc_msgSend_itemBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemBundleIdentifier");
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemDescription");
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemIdentifier");
}

id objc_msgSend_itemTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemTitle");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadProductWithParameters_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadProductWithParameters:completionBlock:");
}

id objc_msgSend_loadRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadRequest:");
}

id objc_msgSend_lobForProductType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lobForProductType:");
}

id objc_msgSend_lobForSubscription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lobForSubscription:");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedPrice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedPrice");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:localization:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_metricsEventForAccount_request_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricsEventForAccount:request:action:");
}

id objc_msgSend_metricsEventWithAccount_request_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricsEventWithAccount:request:");
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifiedDate");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offerName");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "password");
}

id objc_msgSend_performStartupWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performStartupWithError:");
}

id objc_msgSend_pinchGestureRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pinchGestureRecognizer");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationController");
}

id objc_msgSend_previewURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewURL");
}

id objc_msgSend_priceSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "priceSummary");
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productType");
}

id objc_msgSend_productTypeName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productTypeName");
}

id objc_msgSend_productURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productURL");
}

id objc_msgSend_productViewControllerDidFinishWithAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productViewControllerDidFinishWithAction:");
}

id objc_msgSend_promiseWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promiseWithResult:");
}

id objc_msgSend_removeToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeToken");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestIdentifier");
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestInfo");
}

id objc_msgSend_requestString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestString");
}

id objc_msgSend_requestSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSummary");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requesterDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requesterDSID");
}

id objc_msgSend_requesterName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requesterName");
}

id objc_msgSend_resultWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultWithCompletion:");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollView");
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "separatorColor");
}

id objc_msgSend_separatorView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "separatorView");
}

id objc_msgSend_setActionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionDelegate:");
}

id objc_msgSend_setActivityIndicatorView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityIndicatorView:");
}

id objc_msgSend_setAskToBuy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAskToBuy:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBag:");
}

id objc_msgSend_setBannerLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBannerLabel:");
}

id objc_msgSend_setCancelButtonTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelButtonTitle:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChildViewController:");
}

id objc_msgSend_setCustomUserAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomUserAgent:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventType:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesWhenStopped:");
}

id objc_msgSend_setIsEphemeral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsEphemeral:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNavigationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationDelegate:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setPromptString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPromptString:");
}

id objc_msgSend_setProperty_forBodyKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:forBodyKey:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRightBarButtonTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonTitle:");
}

id objc_msgSend_setSeparatorView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorView:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setShouldAllowAppleIDCreation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldAllowAppleIDCreation:");
}

id objc_msgSend_setShowsRightBarButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsRightBarButton:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setWebView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWebView:");
}

id objc_msgSend_set_passwordPromptTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_passwordPromptTitle:");
}

id objc_msgSend_sharedBag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBag");
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConfig");
}

id objc_msgSend_sharedDaemonConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDaemonConfig");
}

id objc_msgSend_sharedUIServiceConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedUIServiceConfig");
}

id objc_msgSend_starRating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "starRating");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithKey:");
}

id objc_msgSend_stringWithKey_bag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithKey:bag:");
}

id objc_msgSend_stringWithKey_countryCode_localeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithKey:countryCode:localeIdentifier:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_thenWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thenWithBlock:");
}

id objc_msgSend_thumbnailURLString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailURLString");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_updateRequestWithIdentifier_action_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRequestWithIdentifier:action:completion:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_valueWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithError:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webView");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
