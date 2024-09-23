void sub_100003720(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v5 = a2;
  v7 = handleForCategory(0, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000BEB8();

    objc_msgSend(*(id *)(a1 + 32), "resetState");
    objc_msgSend(*(id *)(a1 + 32), "showUnknownErrorAlertWithCode:", a3);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rendering xmlui", v13, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteUIController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeTokenChallenger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endpointBaseURL"));
    objc_msgSend(v10, "loadData:baseURL:", v5, v12);

  }
}

void sub_100003E54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL sub_100003E78(id a1, RUIElement *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RUIElement identifier](a2, "identifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("next"));

  return v3;
}

void sub_100003EB8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = handleForCategory(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Next tapped", buf, 2u);
  }

  objc_msgSend(WeakRetained, "transitionToState:", 3);
  objc_msgSend(v3, "startNavigationBarSpinnerWithTitle:", &stru_100014BA8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003FBC;
  block[3] = &unk_100014638;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = WeakRetained;
  v8 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100003FBC(id *a1)
{
  void *v2;
  id v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[8];
  id v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "authenticator"));
  v3 = a1[5];
  v20 = 0;
  v4 = (unint64_t)objc_msgSend(v2, "authenticateFromObjectModel:outRequest:", v3, &v20);
  v5 = v20;

  v7 = handleForCategory(0, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000BF48();

    objc_msgSend(a1[5], "stopNavigationBarSpinner");
    objc_msgSend(a1[5], "activateElement:completion:", 0, 0);
    v10 = a1[6];
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 0xFFFFFFFFFFFFFF36)
      objc_msgSend(v10, "showUserAuthErrorAlert");
    else
      objc_msgSend(v10, "showUnknownErrorAlertWithCode:", v4);
    objc_msgSend(a1[6], "transitionToState:", 2);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IDMS authentication succeed", buf, 2u);
    }

    objc_msgSend(a1[6], "transitionToState:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "activeTokenChallenger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "authenticator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "authKitSession"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004178;
    v16[3] = &unk_100014610;
    v14 = a1[5];
    v15 = a1[6];
    v17 = v14;
    v18 = v15;
    objc_msgSend(v11, "startRequest:session:completion:", v5, v13, v16);

  }
}

void sub_100004178(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v5 = a2;
  v7 = handleForCategory(0, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000BFAC();

    objc_msgSend(*(id *)(a1 + 32), "stopNavigationBarSpinner");
    objc_msgSend(*(id *)(a1 + 32), "activateElement:completion:", 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "transitionToState:", 2);
    objc_msgSend(*(id *)(a1 + 40), "showUnknownErrorAlertWithCode:", a3);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loading unlock status", v13, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "remoteUIController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "activeTokenChallenger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endpointBaseURL"));
    objc_msgSend(v10, "loadData:baseURL:", v5, v12);

  }
}

void sub_100004340(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

BOOL sub_10000435C(id a1, RUIElement *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RUIElement identifier](a2, "identifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("skip"));

  return v3;
}

void sub_10000439C(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = handleForCategory(0, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "skip tapped", v5, 2u);
  }

  objc_msgSend(WeakRetained, "transitionToState:", 5);
}

void sub_100005054(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005064(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id sub_1000050A4(void *a1, const char *a2)
{
  return objc_msgSend(a1, "state");
}

void sub_100005D5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E40;
  block[3] = &unk_1000146D0;
  v16 = v8;
  v17 = v7;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v19 = v11;
  v20 = v10;
  v12 = v9;
  v13 = v7;
  v14 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100005E40(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(void);
  int v23;
  id v24;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "URL"));
    v23 = 138543362;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Response URL: %{public}@", (uint8_t *)&v23, 0xCu);

  }
  v7 = handleForCategory(0, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allHeaderFields"));
    v23 = 138543362;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Response Headers: %{public}@", (uint8_t *)&v23, 0xCu);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v11 = handleForCategory(0, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", *(_QWORD *)(a1 + 40), 4);
      v23 = 138477827;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Response Body: %{private}@", (uint8_t *)&v23, 0xCu);

    }
  }
  if (*(_QWORD *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v14 = handleForCategory(0, v10);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10000C514(a1 + 48, v15, v16, v17, v18, v19, v20, v21);

      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "_sanityCheckBuddyMLResponse:data:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v22();
  }
}

void sub_100006414(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000067E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100006838(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "buttonEventMonitor"));
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "addTarget:action:forButtonEvents:propagate:", v3, "handleButtonEvent:", 0xFFFFFFFFLL, 0);

}

void sub_100006BA4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttonEventMonitor"));
  objc_msgSend(v2, "removeTarget:", *(_QWORD *)(a1 + 32));

}

void sub_100008294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000082D4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000082E4(uint64_t a1)
{

}

void sub_1000082EC(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  int v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v10 = handleForCategory(0, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 67109120;
    LODWORD(v25) = a2;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Preflight phase 1 success: %d", (uint8_t *)&v24, 8u);
  }

  v13 = handleForCategory(0, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Preflight phase 1 resultsPhase1: %@", (uint8_t *)&v24, 0xCu);
  }

  v16 = handleForCategory(0, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Preflight phase 1 error: %@", (uint8_t *)&v24, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v7;
  v20 = v7;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v8;
  v23 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000878C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  int v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v10 = handleForCategory(0, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 67109120;
    LODWORD(v25) = a2;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Preflight phase 2 success: %d", (uint8_t *)&v24, 8u);
  }

  v13 = handleForCategory(0, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Preflight phase 2 results: %@", (uint8_t *)&v24, 0xCu);
  }

  v16 = handleForCategory(0, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Preflight phase 2 error: %@", (uint8_t *)&v24, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v7;
  v20 = v7;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v8;
  v23 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

Class sub_100008CD8(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_10001A1A0)
  {
    v5 = off_100014790;
    v6 = 0;
    qword_10001A1A0 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_10001A1A0)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("DSHardwareButtonEventMonitor");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_10000C94C();
LABEL_8:
    free(v2);
  }
  qword_10001A1A8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000097DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009818(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100009828(uint64_t a1)
{

}

void sub_100009830(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t v22[16];

  v5 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = handleForCategory(0, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000CBF0();

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = -202;
    goto LABEL_5;
  }
  if (!v5)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = -203;
LABEL_5:
    *(_QWORD *)(v10 + 24) = v11;
    goto LABEL_12;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", AKAuthenticationAlternateDSIDKey));
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", AKAuthenticationIDMSTokenKey));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("com.apple.gs.corerepair.auth")));
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = -204;
    goto LABEL_5;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v11 = -205;
    goto LABEL_5;
  }
  *(_QWORD *)(v10 + 24) = 0;
  v20 = handleForCategory(0, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Authenticated user credentials successfully.", v22, 2u);
  }

LABEL_12:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

unint64_t sub_100009EC0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t result;

  v0 = type metadata accessor for ComponentsMapDataSource();
  v1 = swift_allocObject(v0, 24, 7);
  result = sub_100009F44((uint64_t)&_swiftEmptyArrayStorage);
  *(_QWORD *)(v1 + 16) = result;
  qword_10001A6C8 = v1;
  return result;
}

uint64_t sub_100009F04()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_allocObject(v0, 24, 7);
  *(_QWORD *)(v1 + 16) = sub_100009F44((uint64_t)&_swiftEmptyArrayStorage);
  return v1;
}

unint64_t sub_100009F44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000BCC0((uint64_t *)&unk_10001A190);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v10 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_10000AE38(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (_QWORD *)(v4[7] + 16 * result);
    *v14 = v10;
    v14[1] = v9;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000A064()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 16, v2, 0, 0);
  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10000A098(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  swift_beginAccess(v1 + 16, v5, 1, 0);
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease(v3);
}

void *sub_10000A0DC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + 16, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_10000A11C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_10000A140(char *a1, char *a2)
{
  return sub_10000A14C(*a1, *a2);
}

uint64_t sub_10000A14C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x634164656B73616DLL;
  else
    v3 = 0x7374726170;
  if (v2)
    v4 = 0xE500000000000000;
  else
    v4 = 0xED0000746E756F63;
  if ((a2 & 1) != 0)
    v5 = 0x634164656B73616DLL;
  else
    v5 = 0x7374726170;
  if ((a2 & 1) != 0)
    v6 = 0xED0000746E756F63;
  else
    v6 = 0xE500000000000000;
  if (v3 == v5 && v4 == v6)
  {
    v7 = 1;
    v6 = v4;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_10000A1F8()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  if (v1)
    v2 = 0x634164656B73616DLL;
  else
    v2 = 0x7374726170;
  if (v1)
    v3 = 0xED0000746E756F63;
  else
    v3 = 0xE500000000000000;
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000A280(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0x634164656B73616DLL;
  else
    v2 = 0x7374726170;
  if (*v1)
    v3 = 0xED0000746E756F63;
  else
    v3 = 0xE500000000000000;
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_10000A2E4(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2)
    v3 = 0x634164656B73616DLL;
  else
    v3 = 0x7374726170;
  if (v2)
    v4 = 0xED0000746E756F63;
  else
    v4 = 0xE500000000000000;
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10000A368@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;
  char v7;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000147F8, v3);
  result = swift_bridgeObjectRelease(v4);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void sub_10000A3C4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x7374726170;
  if (*v1)
    v2 = 0x634164656B73616DLL;
  v3 = 0xE500000000000000;
  if (*v1)
    v3 = 0xED0000746E756F63;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10000A40C()
{
  _BYTE *v0;

  if (*v0)
    return 0x634164656B73616DLL;
  else
    return 0x7374726170;
}

uint64_t sub_10000A450@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;
  char v7;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000147F8, v3);
  result = swift_bridgeObjectRelease(object);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

uint64_t sub_10000A4B0()
{
  return 0;
}

void sub_10000A4BC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000A4C8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000BC7C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000A4F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000BC7C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000A518@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  Swift::String v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  double v46;
  char v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t KeyPath;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  char v90;
  _BYTE v91[7];
  _BYTE v92[7];
  char v93;
  _BYTE v94[11];
  __int16 v95;
  _BYTE v96[7];
  char v97;
  _BYTE v98[7];
  char v99;
  _BYTE v100[7];
  _BYTE v101[11];
  __int16 v102;
  _BYTE v103[7];
  char v104;

  type metadata accessor for LocalizedStringKey.StringInterpolation(0);
  __chkstk_darwin();
  v5 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v6);
  v7._countAndFlagsBits = sub_10000B0E4(*(unint64_t **)(a1 + 16), *(_QWORD *)(a1 + 24));
  object = v7._object;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v7);
  swift_bridgeObjectRelease(object);
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v9);
  v10 = LocalizedStringKey.init(stringInterpolation:)(v5);
  v11 = Text.init(_:tableName:bundle:comment:)(v10);
  v13 = v12;
  v15 = v14;
  v17 = v16 & 1;
  v86 = Text.bold()();
  v85 = v18;
  v87 = v19;
  v81 = v20 & 1;
  sub_10000BDCC(v11, v13, v17);
  swift_bridgeObjectRelease(v15);
  KeyPath = swift_getKeyPath(&unk_100012458);
  v82 = static Edge.Set.vertical.getter();
  v21 = (void *)objc_opt_self(UIFont);
  v22 = EdgeInsets.init(_all:)(objc_msgSend(v21, "systemFontSize"));
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000019, 0x8000000100013840);
  v78 = Text.init(_:tableName:bundle:comment:)(v29);
  v79 = v30;
  v80 = v31;
  LODWORD(v15) = v32 & 1;
  v77 = swift_getKeyPath(&unk_100012458);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v33);
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(*(Swift::String *)(a1 + 32));
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v34);
  v35 = LocalizedStringKey.init(stringInterpolation:)(v5);
  v36 = Text.init(_:tableName:bundle:comment:)(v35);
  v38 = v37;
  v40 = v39;
  LOBYTE(v13) = v41 & 1;
  v76 = Text.bold()();
  v75 = v42;
  v84 = v43;
  LOBYTE(v5) = v44 & 1;
  sub_10000BDCC(v36, v38, v13);
  v45 = swift_bridgeObjectRelease(v40);
  v73 = static Edge.Set.top.getter(v45);
  v46 = EdgeInsets.init(_all:)(objc_msgSend(v21, "systemFontSize"));
  v47 = v81;
  v89 = v81;
  v74 = v15;
  v88 = v15;
  v104 = v81;
  v99 = 0;
  v97 = v15;
  v93 = (char)v5;
  LOBYTE(v40) = (_BYTE)v5;
  v90 = 0;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v103;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v103[3];
  *(_DWORD *)(a2 + 34) = *(_DWORD *)&v101[7];
  *(_WORD *)(a2 + 38) = v102;
  *(_DWORD *)(a2 + 49) = *(_DWORD *)v101;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v101[3];
  v48 = *(_DWORD *)v100;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v100[3];
  *(_DWORD *)(a2 + 57) = v48;
  LOBYTE(v48) = v99;
  v49 = *(_DWORD *)v98;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v98[3];
  *(_DWORD *)(a2 + 97) = v49;
  LOBYTE(v49) = v97;
  v50 = *(_DWORD *)v96;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v96[3];
  *(_DWORD *)(a2 + 121) = v50;
  v51 = *(_DWORD *)&v94[7];
  *(_WORD *)(a2 + 142) = v95;
  *(_DWORD *)(a2 + 138) = v51;
  v52 = *(_DWORD *)v94;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v94[3];
  *(_DWORD *)(a2 + 153) = v52;
  LOBYTE(v52) = v93;
  v53 = *(_DWORD *)v92;
  *(_DWORD *)(a2 + 180) = *(_DWORD *)&v92[3];
  *(_DWORD *)(a2 + 177) = v53;
  v54 = *(_DWORD *)v91;
  *(_DWORD *)(a2 + 196) = *(_DWORD *)&v91[3];
  *(_DWORD *)(a2 + 193) = v54;
  LOBYTE(v54) = v90;
  v55 = v86;
  v56 = v87;
  v57 = v85;
  *(_QWORD *)a2 = v86;
  *(_QWORD *)(a2 + 8) = v57;
  *(_BYTE *)(a2 + 16) = v47;
  *(_QWORD *)(a2 + 24) = v56;
  *(_WORD *)(a2 + 32) = 256;
  v58 = KeyPath;
  *(_QWORD *)(a2 + 40) = KeyPath;
  *(_BYTE *)(a2 + 48) = 1;
  *(_BYTE *)(a2 + 56) = v82;
  *(double *)(a2 + 64) = v22;
  *(_QWORD *)(a2 + 72) = v24;
  *(_QWORD *)(a2 + 80) = v26;
  *(_QWORD *)(a2 + 88) = v28;
  *(_BYTE *)(a2 + 96) = v48;
  v59 = v78;
  v60 = v79;
  *(_QWORD *)(a2 + 104) = v78;
  *(_QWORD *)(a2 + 112) = v60;
  *(_BYTE *)(a2 + 120) = v49;
  v61 = v80;
  *(_QWORD *)(a2 + 128) = v80;
  *(_WORD *)(a2 + 136) = 256;
  v62 = v77;
  *(_QWORD *)(a2 + 144) = v77;
  *(_BYTE *)(a2 + 152) = 1;
  v63 = v76;
  v64 = v75;
  *(_QWORD *)(a2 + 160) = v76;
  *(_QWORD *)(a2 + 168) = v64;
  *(_BYTE *)(a2 + 176) = v52;
  *(_QWORD *)(a2 + 184) = v84;
  *(_BYTE *)(a2 + 192) = v73;
  *(double *)(a2 + 200) = v46;
  *(_QWORD *)(a2 + 208) = v65;
  *(_QWORD *)(a2 + 216) = v66;
  *(_QWORD *)(a2 + 224) = v67;
  *(_BYTE *)(a2 + 232) = v54;
  sub_10000BDDC(v55, v57, v47);
  swift_bridgeObjectRetain(v56);
  v68 = v58;
  swift_retain(v58);
  v69 = v59;
  sub_10000BDDC(v59, v60, v74);
  swift_bridgeObjectRetain(v61);
  swift_retain(v62);
  sub_10000BDDC(v63, v64, v40);
  v70 = v84;
  swift_bridgeObjectRetain(v84);
  sub_10000BDCC(v63, v64, v40);
  swift_bridgeObjectRelease(v70);
  sub_10000BDCC(v69, v60, v88);
  swift_release(v62);
  swift_bridgeObjectRelease(v61);
  sub_10000BDCC(v86, v85, v89);
  swift_release(v68);
  return swift_bridgeObjectRelease(v87);
}

uint64_t sub_10000AA6C()
{
  return static View._viewListCount(inputs:)();
}

double sub_10000AA84@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  double result;
  _OWORD v24[13];
  _OWORD v25[2];
  _OWORD v26[15];
  char v27;
  char v28;

  v2 = v1;
  v4 = static HorizontalAlignment.center.getter();
  v5 = sub_10000A518(v2, (uint64_t)v24);
  *(_OWORD *)((char *)&v26[11] + 7) = v24[11];
  *(_OWORD *)((char *)&v26[12] + 7) = v24[12];
  *(_OWORD *)((char *)&v26[13] + 7) = v25[0];
  v26[14] = *(_OWORD *)((char *)v25 + 9);
  *(_OWORD *)((char *)&v26[7] + 7) = v24[7];
  *(_OWORD *)((char *)&v26[8] + 7) = v24[8];
  *(_OWORD *)((char *)&v26[9] + 7) = v24[9];
  *(_OWORD *)((char *)&v26[10] + 7) = v24[10];
  *(_OWORD *)((char *)&v26[3] + 7) = v24[3];
  *(_OWORD *)((char *)&v26[4] + 7) = v24[4];
  *(_OWORD *)((char *)&v26[5] + 7) = v24[5];
  *(_OWORD *)((char *)&v26[6] + 7) = v24[6];
  *(_OWORD *)((char *)v26 + 7) = v24[0];
  *(_OWORD *)((char *)&v26[1] + 7) = v24[1];
  v27 = 1;
  *(_OWORD *)((char *)&v26[2] + 7) = v24[2];
  LOBYTE(v2) = static Edge.Set.vertical.getter(v5);
  v6 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontSize");
  v7 = EdgeInsets.init(_all:)(v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v28 = 0;
  v14 = static Edge.Set.all.getter();
  v15 = v26[10];
  *(_OWORD *)(a1 + 193) = v26[11];
  v16 = v26[13];
  *(_OWORD *)(a1 + 209) = v26[12];
  *(_OWORD *)(a1 + 225) = v16;
  *(_OWORD *)(a1 + 241) = v26[14];
  v17 = v26[6];
  *(_OWORD *)(a1 + 129) = v26[7];
  v18 = v26[9];
  *(_OWORD *)(a1 + 145) = v26[8];
  *(_OWORD *)(a1 + 161) = v18;
  *(_OWORD *)(a1 + 177) = v15;
  v19 = v26[2];
  *(_OWORD *)(a1 + 65) = v26[3];
  v20 = v26[5];
  *(_OWORD *)(a1 + 81) = v26[4];
  *(_OWORD *)(a1 + 97) = v20;
  *(_OWORD *)(a1 + 113) = v17;
  v21 = v26[1];
  *(_OWORD *)(a1 + 17) = v26[0];
  *(_OWORD *)(a1 + 33) = v21;
  v22 = v28;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 49) = v19;
  *(_BYTE *)(a1 + 264) = v2;
  *(double *)(a1 + 272) = v7;
  *(_QWORD *)(a1 + 280) = v9;
  *(_QWORD *)(a1 + 288) = v11;
  *(_QWORD *)(a1 + 296) = v13;
  *(_BYTE *)(a1 + 304) = v22;
  *(_BYTE *)(a1 + 312) = v14;
  result = 0.0;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_BYTE *)(a1 + 352) = 1;
  return result;
}

double sub_10000AC8C@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_10000B31C(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_10000ACCC@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

Swift::Void __swiftcall RemoteUIController.registerPartsInfoView(componentsMap:)(Swift::OpaquePointer componentsMap)
{
  void (*v2)(uint64_t);
  uint64_t v3;
  unint64_t v4;

  if (qword_10001A1B0 != -1)
    swift_once(&qword_10001A1B0, sub_100009EC0);
  v2 = *(void (**)(uint64_t))(*(_QWORD *)qword_10001A6C8 + 96);
  v3 = swift_bridgeObjectRetain(componentsMap._rawValue);
  v2(v3);
  v4 = sub_10000B544();
  RemoteUIController.registerViewType(_:named:)(&type metadata for PartsInfoView, v4, 0x666E497374726170, 0xE90000000000006FLL);
}

unint64_t sub_10000AE38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000AE9C(a1, a2, v5);
}

unint64_t sub_10000AE9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000AF7C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000AFA4(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

char *sub_10000AFC8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_10000AFE4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_10000AFE4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10000BCC0(&qword_10001A188);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_release(a4);
  return v11;
}

uint64_t sub_10000B0E4(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD v27[2];
  unint64_t *v28;
  uint64_t v29;

  v28 = a1;
  v29 = a2;
  v27[0] = 44;
  v27[1] = 0xE100000000000000;
  v2 = sub_10000BD44();
  v3 = StringProtocol.components<A>(separatedBy:)(v27, &type metadata for String, &type metadata for String, v2, v2);
  v4 = v3;
  v5 = *(_QWORD *)(v3 + 16);
  if (v5)
  {
    v28 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10000AFC8(0, v5, 0);
    v6 = v28;
    v26 = v4;
    v7 = (uint64_t *)(v4 + 40);
    do
    {
      v9 = *(v7 - 1);
      v8 = *v7;
      v10 = qword_10001A1B0;
      swift_bridgeObjectRetain(*v7);
      if (v10 != -1)
        swift_once(&qword_10001A1B0, sub_100009EC0);
      v11 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_10001A6C8 + 88);
      v12 = swift_bridgeObjectRetain(v8);
      v13 = v11(v12);
      if (*(_QWORD *)(v13 + 16) && (v14 = sub_10000AE38(v9, v8), (v15 & 1) != 0))
      {
        v16 = (uint64_t *)(*(_QWORD *)(v13 + 56) + 16 * v14);
        v17 = *v16;
        v18 = v16[1];
        swift_bridgeObjectRetain(v18);
        swift_bridgeObjectRelease_n(v8, 2);
        swift_bridgeObjectRelease(v13);
      }
      else
      {
        swift_bridgeObjectRelease(v13);
        swift_bridgeObjectRelease_n(v8, 2);
        v18 = 0xE700000000000000;
        v17 = 0x6E776F6E6B6E55;
      }
      v28 = v6;
      v20 = v6[2];
      v19 = v6[3];
      if (v20 >= v19 >> 1)
      {
        sub_10000AFC8((char *)(v19 > 1), v20 + 1, 1);
        v6 = v28;
      }
      v7 += 2;
      v6[2] = v20 + 1;
      v21 = &v6[2 * v20];
      v21[4] = v17;
      v21[5] = v18;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease(v26);
  }
  else
  {
    swift_bridgeObjectRelease(v3);
    v6 = (unint64_t *)&_swiftEmptyArrayStorage;
  }
  v28 = v6;
  v22 = sub_10000BCC0(&qword_10001A178);
  v23 = sub_10000BD88(&qword_10001A180, &qword_10001A178, (uint64_t)&protocol conformance descriptor for [A]);
  v24 = BidirectionalCollection<>.joined(separator:)(10, 0xE100000000000000, v22, v23);
  swift_bridgeObjectRelease(v6);
  return v24;
}

uint64_t sub_10000B31C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t *v22;
  uint64_t countAndFlagsBits;
  uint64_t *v24;
  char v25;
  char v26;

  v4 = sub_10000BCC0(&qword_10001A168);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&countAndFlagsBits - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BD00(a1, a1[3]);
  v8 = Decoder.decodeRUIID()();
  if (v9)
    return sub_10000BD24(a1);
  countAndFlagsBits = v8._countAndFlagsBits;
  v24 = a2;
  v12 = a1[3];
  v11 = a1[4];
  sub_10000BD00(a1, v12);
  v13 = sub_10000BC7C();
  swift_bridgeObjectRetain(v8._object);
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PartsInfoView.CodingKeys, &type metadata for PartsInfoView.CodingKeys, v13, v12, v11);
  v26 = 0;
  v14 = KeyedDecodingContainer.decode(_:forKey:)(&v26, v4);
  v16 = v15;
  v25 = 1;
  swift_bridgeObjectRetain(v15);
  v17 = KeyedDecodingContainer.decode(_:forKey:)(&v25, v4);
  v19 = v18;
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21 = v17;
  v20(v7, v4);
  swift_bridgeObjectRetain(v19);
  sub_10000BD24(a1);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v16);
  result = swift_bridgeObjectRelease(v8._object);
  v22 = v24;
  *v24 = countAndFlagsBits;
  v22[1] = (uint64_t)v8._object;
  v22[2] = v14;
  v22[3] = v16;
  v22[4] = v21;
  v22[5] = v19;
  return result;
}

unint64_t sub_10000B544()
{
  unint64_t result;

  result = qword_10001A040;
  if (!qword_10001A040)
  {
    result = swift_getWitnessTable(&unk_10001231C, &type metadata for PartsInfoView);
    atomic_store(result, (unint64_t *)&qword_10001A040);
  }
  return result;
}

unint64_t sub_10000B58C()
{
  unint64_t result;

  result = qword_10001A048;
  if (!qword_10001A048)
  {
    result = swift_getWitnessTable(&unk_1000121DC, &type metadata for PartsInfoView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001A048);
  }
  return result;
}

unint64_t sub_10000B5D4()
{
  unint64_t result;

  result = qword_10001A050;
  if (!qword_10001A050)
  {
    result = swift_getWitnessTable(&unk_1000122F4, &type metadata for PartsInfoView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001A050);
  }
  return result;
}

unint64_t sub_10000B61C()
{
  unint64_t result;

  result = qword_10001A058;
  if (!qword_10001A058)
  {
    result = swift_getWitnessTable(&unk_1000122CC, &type metadata for PartsInfoView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001A058);
  }
  return result;
}

unint64_t sub_10000B664()
{
  unint64_t result;

  result = qword_10001A060;
  if (!qword_10001A060)
  {
    result = swift_getWitnessTable(&unk_1000123A4, &type metadata for PartsInfoView);
    atomic_store(result, (unint64_t *)&qword_10001A060);
  }
  return result;
}

unint64_t sub_10000B6AC()
{
  unint64_t result;

  result = qword_10001A068;
  if (!qword_10001A068)
  {
    result = swift_getWitnessTable(&unk_1000123CC, &type metadata for PartsInfoView);
    atomic_store(result, (unint64_t *)&qword_10001A068);
  }
  return result;
}

unint64_t sub_10000B6F4()
{
  unint64_t result;

  result = qword_10001A070;
  if (!qword_10001A070)
  {
    result = swift_getWitnessTable(&unk_100012354, &type metadata for PartsInfoView);
    atomic_store(result, (unint64_t *)&qword_10001A070);
  }
  return result;
}

uint64_t sub_10000B738(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100013BC0, 1);
}

void *sub_10000B748()
{
  return &protocol witness table for String;
}

uint64_t type metadata accessor for ComponentsMapDataSource()
{
  return objc_opt_self(_TtC15Diagnostic_900823ComponentsMapDataSource);
}

uint64_t initializeBufferWithCopyOfBuffer for PartsInfoView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for PartsInfoView(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  return swift_bridgeObjectRelease(a1[5]);
}

_QWORD *initializeWithCopy for PartsInfoView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

_QWORD *assignWithCopy for PartsInfoView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for PartsInfoView(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for PartsInfoView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[5];
  v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PartsInfoView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PartsInfoView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PartsInfoView()
{
  return &type metadata for PartsInfoView;
}

_BYTE *initializeBufferWithCopyOfBuffer for PartsInfoView.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PartsInfoView.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PartsInfoView.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_10000BAAC + 4 * byte_1000121D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000BAE0 + 4 * byte_1000121D0[v4]))();
}

uint64_t sub_10000BAE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000BAE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000BAF0);
  return result;
}

uint64_t sub_10000BAFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000BB04);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000BB08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000BB10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000BB1C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000BB28(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PartsInfoView.CodingKeys()
{
  return &type metadata for PartsInfoView.CodingKeys;
}

unint64_t sub_10000BB48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A130;
  if (!qword_10001A130)
  {
    v1 = sub_10000BBB4(&qword_10001A138);
    sub_10000BBF8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001A130);
  }
  return result;
}

uint64_t sub_10000BBB4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000BBF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A140;
  if (!qword_10001A140)
  {
    v1 = sub_10000BBB4(&qword_10001A148);
    sub_10000BD88(&qword_10001A150, &qword_10001A158, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001A140);
  }
  return result;
}

unint64_t sub_10000BC7C()
{
  unint64_t result;

  result = qword_10001A160;
  if (!qword_10001A160)
  {
    result = swift_getWitnessTable(&unk_10001227C, &type metadata for PartsInfoView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001A160);
  }
  return result;
}

uint64_t sub_10000BCC0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_10000BD00(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000BD24(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_10000BD44()
{
  unint64_t result;

  result = qword_10001A170;
  if (!qword_10001A170)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001A170);
  }
  return result;
}

uint64_t sub_10000BD88(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000BBB4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BDCC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000BDDC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

void sub_10000BDEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "no challenger", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000BE18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "no component", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000BE44(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "activeTokenChallengerIndex");
  sub_10000507C();
  sub_100005064((void *)&_mh_execute_header, a2, v3, "challenger out of bounds: %lu", v4);
  sub_100005070();
}

void sub_10000BEB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Error fetching password screen", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000BEE4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000507C();
  sub_100005064((void *)&_mh_execute_header, v0, v1, "Unknown error: %ld", v2);
  sub_10000509C();
}

void sub_10000BF48()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000507C();
  sub_100005064((void *)&_mh_execute_header, v0, v1, "IDMS authentication failed: %ld", v2);
  sub_10000509C();
}

void sub_10000BFAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Failed to request unlock status", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000BFD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Got unknown action", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C004()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000507C();
  sub_100005064((void *)&_mh_execute_header, v0, v1, "Invalid token: %@", v2);
  sub_10000509C();
}

void sub_10000C068()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000507C();
  sub_100005064((void *)&_mh_execute_header, v0, v1, "Failed to unlock token: %@", v2);
  sub_10000509C();
}

void sub_10000C0CC(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_1000050A4(a1, a2);
  sub_10000507C();
  sub_100005064((void *)&_mh_execute_header, a2, v3, "Dismiss at illegal state %ld", v4);
  sub_100005070();
}

void sub_10000C13C(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_1000050A4(a1, a2);
  sub_10000507C();
  sub_100005064((void *)&_mh_execute_header, a2, v3, "Push at illegal state %ld", v4);
  sub_100005070();
}

void sub_10000C1AC(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_1000050A4(a1, a2);
  sub_10000507C();
  sub_100005064((void *)&_mh_execute_header, a2, v3, "Got load error at illegal state %ld", v4);
  sub_100005070();
}

void sub_10000C21C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "BuddyML failed to load", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C248(void *a1, const char *a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  const char *v7;

  sub_1000050A4(a1, a2);
  sub_10000507C();
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Illegal state transition from %ld to %ld", v5, 0x16u);
  sub_100005070();
}

void sub_10000C2D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000507C();
  sub_100006414((void *)&_mh_execute_header, v0, v1, "Failed to construct challenge request: %ld", v2, v3, v4, v5, v6);
  sub_10000509C();
}

void sub_10000C330()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "No BAA certificate found", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C35C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Failed to sign payload", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C388()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000507C();
  sub_100006414((void *)&_mh_execute_header, v0, v1, "Failed to serialize post data: %@", v2, v3, v4, v5, v6);
  sub_10000509C();
}

void sub_10000C3E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000507C();
  sub_100006414((void *)&_mh_execute_header, v0, v1, "Failed to serialize payload: %@", v2, v3, v4, v5, v6);
  sub_10000509C();
}

void sub_10000C448(void *a1, NSObject *a2)
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "components"));
  v5 = objc_msgSend(v4, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fdrTypes"));
  v7 = 134218240;
  v8 = v5;
  v9 = 2048;
  v10 = objc_msgSend(v6, "count");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Lengths of localized components mismatch: %ld, %ld", (uint8_t *)&v7, 0x16u);

}

void sub_10000C514(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006414((void *)&_mh_execute_header, a2, a3, "Failed to fetch buddyML: %@", a5, a6, a7, a8, 2u);
  sub_10000509C();
}

void sub_10000C57C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Empty response", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C5A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Empty data", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C5D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Not xmlui data", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C600(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "MIMEType"));
  sub_10000507C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid MIME type %@", v4, 0xCu);

}

void sub_10000C690()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "ButtonEventMonitor not available", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C6BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "DiagnosticsSupport not available", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C6E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Missing partSPCs", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C714()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Missing preflight RIK", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C740(void *a1, void *a2, NSObject *a3)
{
  int v5;
  id v6;
  __int16 v7;
  id v8;

  v5 = 134218240;
  v6 = objc_msgSend(a1, "count");
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Array length mismatch: %ld %ld", (uint8_t *)&v5, 0x16u);
}

void sub_10000C7EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Missing activation token", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C818()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Missing activation challenge endpoint", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C844()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Invalid type of types", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C870()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Invalid type of SPCs", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C89C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Preflight phase 1 failed", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C8C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Preflight phase 1 missing expected results", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C8F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Preflight phase 1 time out", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C920()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Preflight phase 2 time out", v2, v3, v4, v5, v6);
  sub_100005088();
}

uint64_t sub_10000C94C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "DSHardwareButtonEventMonitor");
  return sub_10000C970(v0);
}

void sub_10000C970()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "No object model", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C99C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Empty username", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C9C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Empty password", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000C9F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000507C();
  sub_100006414((void *)&_mh_execute_header, v0, v1, "Failed to construct request: %ld", v2, v3, v4, v5, v6);
  sub_10000509C();
}

void sub_10000CA54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000507C();
  sub_100006414((void *)&_mh_execute_header, v0, v1, "Failed to fetch token: %ld", v2, v3, v4, v5, v6);
  sub_10000509C();
}

void sub_10000CAB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "No password field", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000CAE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "No email field", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000CB0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Unable to find next relative path", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000CB38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "Unable to find base path", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000CB64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000507C();
  sub_100006414((void *)&_mh_execute_header, v0, v1, "Failed to serialize the request: %@", v2, v3, v4, v5, v6);
  sub_10000509C();
}

void sub_10000CBC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005090();
  sub_100005054((void *)&_mh_execute_header, v0, v1, "IDMS timeout", v2, v3, v4, v5, v6);
  sub_100005088();
}

void sub_10000CBF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000507C();
  sub_100006414((void *)&_mh_execute_header, v0, v1, "Failed to authenticate: %@", v2, v3, v4, v5, v6);
  sub_10000509C();
}

void sub_10000CC50(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid status", v1, 2u);
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HTTPBody");
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MIMEType");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__appendAdditionalHeaders_altDSID_gsToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendAdditionalHeaders:altDSID:gsToken:");
}

id objc_msgSend__constructAlbertRequest_objectModel_username_altDSID_gsToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constructAlbertRequest:objectModel:username:altDSID:gsToken:");
}

id objc_msgSend__fetchGSTokenWithPassword_username_altDSID_gsToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchGSTokenWithPassword:username:altDSID:gsToken:");
}

id objc_msgSend__findLabelWithText_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findLabelWithText:inView:");
}

id objc_msgSend__requestBuddyML_session_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestBuddyML:session:completion:");
}

id objc_msgSend__sanityCheckBuddyMLResponse_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sanityCheckBuddyMLResponse:data:");
}

id objc_msgSend__setHandlerForSkipButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHandlerForSkipButton");
}

id objc_msgSend__setPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPassword:");
}

id objc_msgSend__showAlertWithTitle_message_actionTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertWithTitle:message:actionTitle:");
}

id objc_msgSend_accessoryButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryButton");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateElement_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateElement:completion:");
}

id objc_msgSend_activationLockChallengeNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationLockChallengeNeeded");
}

id objc_msgSend_activationLockCheck(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationLockCheck");
}

id objc_msgSend_activationLockComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationLockComplete");
}

id objc_msgSend_activationLockComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationLockComponents");
}

id objc_msgSend_activationResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationResults:");
}

id objc_msgSend_activeTokenChallenger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeTokenChallenger");
}

id objc_msgSend_activeTokenChallengerIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeTokenChallengerIndex");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forButtonEvents_propagate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forButtonEvents:propagate:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_ak_addAuthorizationHeaderWithServiceToken_forAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:");
}

id objc_msgSend_ak_addClientInfoHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addClientInfoHeader");
}

id objc_msgSend_ak_addDeviceUDIDHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addDeviceUDIDHeader");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allHTTPHeaderFields");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributes");
}

id objc_msgSend_authKitSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authKitSession");
}

id objc_msgSend_authenticateFromObjectModel_outRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateFromObjectModel:outRequest:");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_authenticator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticator");
}

id objc_msgSend_baaCert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baaCert");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_baseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseURL:");
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldButton");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonEventMonitor");
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonTray");
}

id objc_msgSend_chimeraLockComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chimeraLockComponents");
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientInfo");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithHierarchicalColor:");
}

id objc_msgSend_constructChallengeRequestDataWithToken_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constructChallengeRequestDataWithToken:data:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinator");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableTextField");
}

id objc_msgSend_endTestWithStatusCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTestWithStatusCode:error:");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpoint");
}

id objc_msgSend_endpointBaseURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointBaseURL");
}

id objc_msgSend_fdrTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fdrTypes");
}

id objc_msgSend_fetchPasswordScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPasswordScreen");
}

id objc_msgSend_fetchPasswordWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPasswordWithCompletion:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "font");
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerView");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithComponent_status_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithComponent:status:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithToken_components_fdrTypes_endpoint_signer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithToken:components:fdrTypes:endpoint:signer:");
}

id objc_msgSend_initWithTokenChallengers_authenticator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTokenChallengers:authenticator:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputs");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isTokenUnlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTokenUnlocked");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelColor");
}

id objc_msgSend_learnMoreController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "learnMoreController");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkButton");
}

id objc_msgSend_loadData_baseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadData:baseURL:");
}

id objc_msgSend_localizedComponentMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedComponentMap");
}

id objc_msgSend_localizedComponentsMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedComponentsMap");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_moveToNextLockedTokenChallenger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToNextLockedTokenChallenger");
}

id objc_msgSend_moveToNextViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToNextViewController");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointSize");
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToViewController:animated:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preflightPhase1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightPhase1:");
}

id objc_msgSend_preflightPhase1_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightPhase1:withReply:");
}

id objc_msgSend_preflightPhase2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightPhase2:");
}

id objc_msgSend_preflightPhase2_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightPhase2:withReply:");
}

id objc_msgSend_preflightRIK(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightRIK");
}

id objc_msgSend_preflightResponsePhase1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightResponsePhase1");
}

id objc_msgSend_preflightResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightResults");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_registerPartsInfoViewWithComponentsMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPartsInfoViewWithComponentsMap:");
}

id objc_msgSend_remoteUIController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteUIController");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_resetState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetState");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "result");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_serverInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverInfo");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_setActivationLockChallengeNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationLockChallengeNeeded:");
}

id objc_msgSend_setActivationLockComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationLockComponents:");
}

id objc_msgSend_setActiveTokenChallengerIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveTokenChallengerIndex:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setAuthenticator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticator:");
}

id objc_msgSend_setButtonEventMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonEventMonitor:");
}

id objc_msgSend_setChimeraLockComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChimeraLockComponents:");
}

id objc_msgSend_setCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoordinator:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFragment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFragment:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHandlerForElementsMatching_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlerForElementsMatching:handler:");
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesBackButton:");
}

id objc_msgSend_setHostViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostViewController:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIsEphemeral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEphemeral:");
}

id objc_msgSend_setIsTokenUnlocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTokenUnlocked:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setLocalizedComponentMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedComponentMap:");
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNavigationController:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPreflightBaaCert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreflightBaaCert:");
}

id objc_msgSend_setPreflightRIK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreflightRIK:");
}

id objc_msgSend_setPreflightResponsePhase1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreflightResponsePhase1:");
}

id objc_msgSend_setPreflightResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreflightResults:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setRemoteUIController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteUIController:");
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestCachePolicy:");
}

id objc_msgSend_setScrollingDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollingDisabled:");
}

id objc_msgSend_setServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceIdentifier:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setShouldPromptForPasswordOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPromptForPasswordOnly:");
}

id objc_msgSend_setShouldShowPressHomeLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowPressHomeLabel:");
}

id objc_msgSend_setShouldUpdatePersistentServiceTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUpdatePersistentServiceTokens:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubtitleText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleText:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTokenChallengers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenChallengers:");
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLCache:");
}

id objc_msgSend_setUiNeededKnownSemaphore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUiNeededKnownSemaphore:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllers:animated:");
}

id objc_msgSend_set_appleIDContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_appleIDContext:");
}

id objc_msgSend_setupActivationLockView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupActivationLockView");
}

id objc_msgSend_setupAssistantStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupAssistantStyle");
}

id objc_msgSend_setupRemoteUIController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupRemoteUIController");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_showButtonsAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showButtonsAvailable");
}

id objc_msgSend_showButtonsBusy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showButtonsBusy");
}

id objc_msgSend_showUnknownErrorAlertWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUnknownErrorAlertWithCode:");
}

id objc_msgSend_showUserAuthErrorAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUserAuthErrorAlert");
}

id objc_msgSend_sign_keyBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sign:keyBlob:");
}

id objc_msgSend_signData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signData:");
}

id objc_msgSend_signer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signer");
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceURL");
}

id objc_msgSend_spcResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spcResults:");
}

id objc_msgSend_startNavigationBarSpinnerWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startNavigationBarSpinnerWithTitle:");
}

id objc_msgSend_startRequest_session_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRequest:session:completion:");
}

id objc_msgSend_startWithPriority_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithPriority:completion:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stopNavigationBarSpinner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopNavigationBarSpinner");
}

id objc_msgSend_stopWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWithCompletion:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subElementWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subElementWithID:");
}

id objc_msgSend_subtitleText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleText");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_tableCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableCell");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColor");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "token");
}

id objc_msgSend_tokenChallengers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenChallengers");
}

id objc_msgSend_transitionTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionTable");
}

id objc_msgSend_transitionToState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionToState:");
}

id objc_msgSend_uiNeededKnownSemaphore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiNeededKnownSemaphore");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllers");
}
