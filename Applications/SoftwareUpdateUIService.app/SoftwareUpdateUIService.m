uint64_t sub_100001CF0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

_BYTE *sub_1000020A4(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_1000020C0(id *a1, void *a2)
{
  NSObject *log;
  os_log_type_t type;
  id v4;
  uint8_t v6[7];
  os_log_type_t v7;
  id v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[1] = a1;
  if (location[0])
  {
    objc_storeStrong((id *)a1[4] + 12, location[0]);
    objc_msgSend(*((id *)a1[4] + 12), "setDelegate:", a1[4]);
    objc_msgSend(a1[4], "_setChildViewController:", *((_QWORD *)a1[4] + 12));
    v4 = objc_msgSend(*((id *)a1[4] + 12), "view");
    objc_msgSend(v4, "setAlpha:", 0.0);

    v9 = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_1000022CC;
    v13 = &unk_100014528;
    v14[0] = a1[4];
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &v9, 0.4);
    objc_storeStrong(v14, 0);
  }
  else
  {
    v8 = (id)SUSUILogAuthenticationUI();
    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      log = v8;
      type = v7;
      sub_1000020A4(v6);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Failed to create emergency call view controller", v6, 2u);
    }
    objc_storeStrong(&v8, 0);
    objc_msgSend(a1[4], "_authenticationCancelled");
  }
  objc_storeStrong(location, 0);
}

void sub_1000022CC(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "view");
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_100002460(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "view");
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_1000024BC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), 0);
}

id sub_100002808(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setPasscodeViewsToVisible:animated:completion:", *(_BYTE *)(a1 + 48) & 1, *(_BYTE *)(a1 + 49) & 1, *(_QWORD *)(a1 + 40), a1, a1);
}

void sub_100002B88(uint64_t a1)
{
  id v1;
  char v3;
  id v4;
  id v5[3];

  v5[2] = (id)a1;
  v5[1] = (id)a1;
  v3 = 0;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "passcode");
    v3 = 1;
    v1 = v4;
  }
  v5[0] = v1;
  if ((v3 & 1) != 0)

  objc_msgSend(*(id *)(a1 + 40), "_attemptUnlock:passcode:", *(_QWORD *)(a1 + 32), v5[0]);
  objc_storeStrong(v5, 0);
}

void sub_100003178(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(NSObject *, char, id);
  void *v9;
  id v10;
  id v11[3];

  v11[2] = a1;
  v11[1] = a1;
  v4 = (void *)*((_QWORD *)a1[4] + 4);
  v2 = *((_QWORD *)a1[4] + 6);
  v3 = *((_QWORD *)a1[4] + 2);
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100003298;
  v9 = &unk_1000145F0;
  v10 = a1[4];
  v11[0] = a1[5];
  objc_msgSend(v4, "presentTermsIfNecessaryForUpdate:overController:showLoadSpinner:completion:", v2, v3, 0);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
}

void sub_100003298(NSObject *a1, char a2, id obj)
{
  const __CFString *v3;
  os_log_t oslog[2];
  id location;
  char v7;
  NSObject *v8;
  uint8_t v9[24];

  v8 = a1;
  v7 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  oslog[0] = (os_log_t)(id)SUSUILogAuthenticationUI();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if ((v7 & 1) != 0)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    sub_100003488((uint64_t)v9, (uint64_t)v3, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Terms accepted? %@, error: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  if ((v7 & 1) != 0)
    -[objc_class _termsAgree](a1[4].isa, "_termsAgree");
  else
    -[objc_class _termsDisagree](a1[4].isa, "_termsDisagree");
  if (!location)
  {
    objc_msgSend(*((id *)a1[4].isa + 3), "setAlpha:", 0.0);
    objc_msgSend(*((id *)a1[4].isa + 3), "setHidden:", 1);
  }
  if (a1[5].isa)
    (*((void (**)(void))a1[5].isa + 2))();
  objc_storeStrong(&location, 0);
}

uint64_t sub_100003488(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t sub_100003BA4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_100003D74(uint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  NSObject *log;
  os_log_type_t type;
  id WeakRetained;
  uint8_t v7[7];
  os_log_type_t v8;
  id v9;
  uint8_t v10[15];
  os_log_type_t v11;
  id location;
  id v13[3];

  v13[2] = (id)a1;
  v13[1] = (id)a1;
  v13[0] = objc_alloc_init((Class)SUKeybagOptions);
  objc_msgSend(v13[0], "setDescriptor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v13[0], "setPasscode:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v13[0], "setKeybagType:");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(WeakRetained, "createInstallationKeybagWithOptions:", v13[0]) & 1;

  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 1) != 0)
  {
    location = (id)SUSUILogAuthenticationUI();
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      type = v11;
      sub_1000020A4(v10);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Successfully created installation keybag with passcode!", v10, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    v9 = (id)SUSUILogAuthenticationUI();
    v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      v1 = v9;
      v2 = v8;
      sub_1000020A4(v7);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to create installation keybag with passcode!", v7, 2u);
    }
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v13, 0);
}

void sub_100004184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19)
{
  uint64_t v19;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v19 - 80));
  _Unwind_Resume(a1);
}

void sub_1000041CC(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *log;
  os_log_type_t type;
  uint8_t v6[15];
  os_log_type_t v7;
  id location[2];
  char v9;
  uint64_t v10;

  v10 = a1;
  v9 = a2 & 1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILogAuthenticationUI();
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    type = v7;
    sub_1000020A4(v6);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Dismissal completed", v6, 2u);
  }
  objc_storeStrong(location, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAndSendCompletionResponse:", *(_BYTE *)(a1 + 40) & 1);

}

id sub_100004B34(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = 1.0;
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
    v3 = 0.0;
  return objc_msgSend(v2, "setAlpha:", v3, a1, a1);
}

id sub_100004B8C(uint64_t a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "becomeFirstResponder");
  else
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resignFirstResponder");
  if (*(_QWORD *)(a1 + 40))
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

uint64_t sub_1000061C4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_100006780(id *a1)
{
  id v1;
  id v2;
  NSObject *log;
  os_log_type_t type;
  id v5;
  id v7;
  os_log_type_t v8;
  id v9[3];
  uint8_t v10[24];

  v9[2] = a1;
  v9[1] = a1;
  v9[0] = (id)SUSUILogLaggardsUI();
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v9[0];
    type = v8;
    v5 = objc_msgSend(a1[4], "buildSUSettingsAction:", 1);
    v7 = v5;
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIScheduleUpdateViewController performUpdateNow]_block_invoke", (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%s: Opening the Software Update Settings pane with URL: %@", v10, 0x16u);

    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v9, 0);
  v2 = +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
  v1 = objc_msgSend(a1[4], "buildSUSettingsAction:", 1);
  objc_msgSend(v2, "openSensitiveURL:withOptions:");

}

uint64_t sub_100006914(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

void sub_100007014(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void sub_100007078(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "cancellationDialogRemindMeLaterButtonTapped:", location[0]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

uint64_t start(int a1, char **a2)
{
  objc_class *v2;
  NSString *v4;
  void *context;
  unsigned int v8;

  context = objc_autoreleasePoolPush();
  v2 = (objc_class *)objc_opt_class(AppDelegate);
  v4 = NSStringFromClass(v2);
  v8 = UIApplicationMain(a1, a2, 0, v4);

  objc_autoreleasePoolPop(context);
  return v8;
}

void sub_10000857C(uint64_t a1, void *a2)
{
  id v2;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = (id)a1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), location[0]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_setRootViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "view");
  objc_msgSend(v2, "setAlpha:", 0.0);

  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10000870C;
  v8 = &unk_100014528;
  v9[0] = *(id *)(a1 + 32);
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &v4, 0.4);
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

void sub_10000870C(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "view");
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_100008814(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_fireActionWithResponseIfNecessary:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  objc_msgSend(v2, "dismiss");

}

void sub_100008A70(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "view");
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100008ACC(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  objc_msgSend(v1, "dismiss");

}

id sub_100009FBC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fireActionWithResponseIfNecessary:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

uint64_t sub_10000A188(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

void sub_10000A658(uint64_t a1)
{
  id v1;

  if (*(_DWORD *)(a1 + 40) == dword_10001C238)
  {
    v1 = objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
    objc_msgSend(v1, "setIdleTimerDisabled:forReason:", 0, CFSTR("reset"));

  }
}

uint64_t sub_10000BAE0(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void sub_10000BD3C(id *a1)
{
  dispatch_queue_t queue;
  void **v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[3];

  v8[2] = a1;
  v8[1] = a1;
  queue = &_dispatch_main_q;
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10000BDF8;
  v7 = &unk_100014528;
  v8[0] = a1[4];
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

void sub_10000BDF8(id *a1)
{
  void *v1;
  void **v2;
  int v3;
  int v4;
  void (*v5)(id *);
  void *v6;
  id v7[3];

  v7[2] = a1;
  v7[1] = a1;
  v1 = (void *)*((_QWORD *)a1[4] + 1);
  v2 = _NSConcreteStackBlock;
  v3 = -1073741824;
  v4 = 0;
  v5 = sub_10000BEAC;
  v6 = &unk_100014528;
  v7[0] = a1[4];
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v7, 0);
}

void sub_10000BEAC(id *a1)
{
  id v1;
  id location[3];
  uint8_t v4[24];

  location[2] = a1;
  location[1] = a1;
  location[0] = (id)SUSUILogLaggardsUI(a1);
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v4, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController handleCancelButtonTapped:]_block_invoke_3");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s: Dismissed controller", v4, 0xCu);
  }
  objc_storeStrong(location, 0);
  objc_msgSend(a1[4], "_fireActionWithResponseIfNecessary:", 0);
  v1 = objc_msgSend(a1[4], "_remoteViewControllerProxy");
  objc_msgSend(v1, "dismiss");

}

void sub_10000BFD8(NSObject *a1, char a2)
{
  const __CFString *v2;
  os_log_t oslog[2];
  char v5;
  NSObject *v6;
  uint8_t v7[24];

  v6 = a1;
  v5 = a2 & 1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)(id)SUSUILogLaggardsUI(a1);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if ((v5 & 1) != 0)
      v2 = CFSTR("YES");
    else
      v2 = CFSTR("NO");
    sub_100006914((uint64_t)v7, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController handleCancelButtonTapped:]_block_invoke", (uint64_t)v2);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: should proceed with dialog cancellation: %@", v7, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  if ((v5 & 1) != 0)
    (*((void (**)(void))a1[4].isa + 2))();
}

void sub_10000C1E4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_fireActionWithResponseIfNecessary:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  objc_msgSend(v2, "dismiss");

}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__attemptUnlock_passcode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attemptUnlock:passcode:");
}

id objc_msgSend__authenticationCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authenticationCancelled");
}

id objc_msgSend__authenticationFailure_fromMesa_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authenticationFailure:fromMesa:");
}

id objc_msgSend__authenticationSuccess_fromMesa_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authenticationSuccess:fromMesa:");
}

id objc_msgSend__bodyTextToModelSpecificLocalizedKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bodyTextToModelSpecificLocalizedKey:");
}

id objc_msgSend__configureWithAction_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureWithAction:completion:");
}

id objc_msgSend__createKeybagForPasscode_forInstallTonight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createKeybagForPasscode:forInstallTonight:");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__dismissAndSendCompletionResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissAndSendCompletionResponse:");
}

id objc_msgSend__dismissSelf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissSelf:");
}

id objc_msgSend__dismissTermsAndConditionsIfNecessaryAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissTermsAndConditionsIfNecessaryAnimated:withCompletion:");
}

id objc_msgSend__fireActionWithResponseIfNecessary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fireActionWithResponseIfNecessary:");
}

id objc_msgSend__passcodeLockViewPasscodeEntered_viaMesa_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_passcodeLockViewPasscodeEntered:viaMesa:");
}

id objc_msgSend__presentTermsAndConditionsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentTermsAndConditionsWithCompletion:");
}

id objc_msgSend__registerSceneActionsHandlerArray_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerSceneActionsHandlerArray:forKey:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__sendDeactivationResponseFailureIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendDeactivationResponseFailureIfNecessary");
}

id objc_msgSend__setChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setChildViewController:");
}

id objc_msgSend__setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setRootViewController:");
}

id objc_msgSend__setVisible_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setVisible:animated:completion:");
}

id objc_msgSend__shouldShowPasscodeView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowPasscodeView");
}

id objc_msgSend__susui_cardinalityForRoundedEndTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_susui_cardinalityForRoundedEndTime");
}

id objc_msgSend__susui_cardinalityForRoundedStartTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_susui_cardinalityForRoundedStartTime");
}

id objc_msgSend__susui_formattedRoundedEndTimeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_susui_formattedRoundedEndTimeString");
}

id objc_msgSend__susui_formattedRoundedStartTimeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_susui_formattedRoundedStartTimeString");
}

id objc_msgSend__termsAgree(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_termsAgree");
}

id objc_msgSend__termsDisagree(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_termsDisagree");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertType");
}

id objc_msgSend_allowCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowCancel");
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alphaComponent");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_attemptAuthentication_outBlocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptAuthentication:outBlocked:");
}

id objc_msgSend_autoInstallForecast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoInstallForecast");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldButton");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bs_removeChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_removeChildViewController:");
}

id objc_msgSend_buildSUSettingsAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildSUSettingsAction:");
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonTray");
}

id objc_msgSend_canDeferInstallation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canDeferInstallation");
}

id objc_msgSend_cancellationDialogRemindMeLaterButtonTapped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancellationDialogRemindMeLaterButtonTapped:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_combinedTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "combinedTintColor");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configureWithAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureWithAction:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createInstallationKeybagWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInstallationKeybagWithOptions:");
}

id objc_msgSend_createPasscodeView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPasscodeView");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptor");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissEmergencyCallViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissEmergencyCallViewController:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_documentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "documentation");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_emergencyCallViewController_didExitWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emergencyCallViewController:didExitWithError:");
}

id objc_msgSend_enableSwipeToCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSwipeToCancel");
}

id objc_msgSend_fireCompletionIfNecessaryForResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fireCompletionIfNecessaryForResult:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_forInstallTonight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forInstallTonight");
}

id objc_msgSend_hasPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPasscodeSet");
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconImage");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithDelegate_queue_clientType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:queue:clientType:");
}

id objc_msgSend_initWithDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDescriptor:");
}

id objc_msgSend_initWithDescriptor_forInstallTonight_withInstallForecast_canDeferInstallation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDescriptor:forInstallTonight:withInstallForecast:canDeferInstallation:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithInfo_forBaseAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInfo:forBaseAction:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithPrivateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrivateStyle:");
}

id objc_msgSend_initWithRollbackDescriptor_canDeferInstallation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRollbackDescriptor:canDeferInstallation:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_installTonightPasscodeLockViewForUsersCurrentStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installTonightPasscodeLockViewForUsersCurrentStyle");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isSplatOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSplatOnly");
}

id objc_msgSend_laggardsUIViewControllerForAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "laggardsUIViewControllerForAction:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkButton");
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

id objc_msgSend_majorOSVersionStringForBuildVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "majorOSVersionStringForBuildVersion:");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcode");
}

id objc_msgSend_passcodeLockView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockView");
}

id objc_msgSend_passcodeLockViewForUsersCurrentStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockViewForUsersCurrentStyle");
}

id objc_msgSend_performUpdateNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performUpdateNow");
}

id objc_msgSend_performUpdateTonight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performUpdateTonight");
}

id objc_msgSend_presentTermsIfNecessaryForUpdate_overController_showLoadSpinner_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentTermsIfNecessaryForUpdate:overController:showLoadSpinner:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationController");
}

id objc_msgSend_productSystemName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productSystemName");
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productVersion");
}

id objc_msgSend_remoteLaggardsUIHostingControllerWillCancelOperation_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteLaggardsUIHostingControllerWillCancelOperation:withCompletionBlock:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_requestEmergencyCallControllerWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestEmergencyCallControllerWithCompletion:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetForFailedPasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetForFailedPasscode");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_rollbackDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rollbackDescriptor");
}

id objc_msgSend_setAllowCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowCancel:");
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertItems:");
}

id objc_msgSend_setAllowsGroupBlending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsGroupBlending:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAllowsSiri_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSiri:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundAlpha:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBiometricAuthenticationAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBiometricAuthenticationAllowed:");
}

id objc_msgSend_setCustomBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomBackgroundColor:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDescriptor:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:forReason:");
}

id objc_msgSend_setInstallTonightForecast_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallTonightForecast:");
}

id objc_msgSend_setKeybagType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeybagType:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscode:");
}

id objc_msgSend_setPasscodeViewsToVisible_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeViewsToVisible:animated:completion:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setShowsCancelButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsCancelButton:");
}

id objc_msgSend_setShowsEmergencyCallButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsEmergencyCallButton:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setUseNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseNavigationController:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsForPrivateStyle:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topItem");
}

id objc_msgSend_updateIcon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateIcon");
}

id objc_msgSend_updateStatusText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStatusText");
}

id objc_msgSend_updateStatusText_subtitle_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStatusText:subtitle:animated:");
}

id objc_msgSend_useNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useNavigationController");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewController_wantsStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewController:wantsStatusBarHidden:withDuration:");
}

id objc_msgSend_viewControllerAuthenticatedWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerAuthenticatedWithResult:");
}

id objc_msgSend_viewControllerWantsDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerWantsDismissal:");
}

id objc_msgSend_viewControllerWantsIdleTimerReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerWantsIdleTimerReset:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}
