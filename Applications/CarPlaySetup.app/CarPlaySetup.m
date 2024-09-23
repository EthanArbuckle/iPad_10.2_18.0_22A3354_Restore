uint64_t sub_100001BB0(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth confirmation prompt answered: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100001D28(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth contacts sync prompt answered: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100001EB8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth failed prompt answered", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100002020(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "allow while locked prompt answered: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000021B0(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connect prompt answered: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100002340(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "use wireless prompt answered: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000024C0(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "enhanced integration prompt answered: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100002650(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connect prompt answered: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000027E0(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if (a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "use wireless prompt answered: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_100002978(uint64_t a1, char a2)
{
  id result;

  result = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_dismissFromGenericFlow");
  return result;
}

uint64_t sub_100002A60(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asset ready prompt confirmed", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100002B80(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asset ready soon prompt confirmed", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100002CCC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002D64;
  block[3] = &unk_10000C318;
  v6 = a2;
  v3 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100002D64(uint64_t a1)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_presentPromptViewController:");
  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PassKit didn't want to present car key setup", v5, 2u);
  }

  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(CARSetupAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_1000039E0(id a1, SBUIRemoteAlertButtonAction *a2, BOOL *a3)
{
  -[SBUIRemoteAlertButtonAction events](a2, "events", a3);
}

void sub_100003A20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100003AF8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present Bluetooth confirmation prompt", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5
    && (objc_opt_respondsToSelector(v5, "promptDirector:wantsToPresentBluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003C20;
    v9[3] = &unk_10000C2A0;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v5, "promptDirector:wantsToPresentBluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:", v6, v7, v8, v9);

  }
}

uint64_t sub_100003C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if ((_DWORD)a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth confirmation prompt received response: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100003D78(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present Bluetooth contacts sync prompt", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5
    && (objc_opt_respondsToSelector(v5, "promptDirector:wantsToPresentBluetoothContactsSyncPromptWithResponseHandler:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100003E8C;
    v7[3] = &unk_10000C2A0;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "promptDirector:wantsToPresentBluetoothContactsSyncPromptWithResponseHandler:", v6, v7);

  }
}

uint64_t sub_100003E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if ((_DWORD)a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth contacts sync prompt received response: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100004018(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present Bluetooth failed prompt", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5
    && (objc_opt_respondsToSelector(v5, "promptDirector:wantsToPresentBluetoothFailedPromptForVehicleName:isTimeout:responseHandler:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    v7 = *(unsigned __int8 *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004140;
    v9[3] = &unk_10000C2C8;
    v8 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "promptDirector:wantsToPresentBluetoothFailedPromptForVehicleName:isTimeout:responseHandler:", v6, v8, v7, v9);

  }
}

uint64_t sub_100004140(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth failed prompt received response", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100004214(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present waiting prompt", v7, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5 && (objc_opt_respondsToSelector(v5, "promptDirectorWantsToPresentWaiting:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    objc_msgSend(v5, "promptDirectorWantsToPresentWaiting:", v6);

  }
}

void sub_10000438C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present allow while locked prompt", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5
    && (objc_opt_respondsToSelector(v5, "promptDirector:wantsToPresentAllowWhileLockedPromptForVehicleName:responseHandler:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000044A4;
    v8[3] = &unk_10000C2A0;
    v7 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "promptDirector:wantsToPresentAllowWhileLockedPromptForVehicleName:responseHandler:", v6, v7, v8);

  }
}

uint64_t sub_1000044A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if ((_DWORD)a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "allow while locked prompt received response: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100004614(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present connect prompt", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5
    && (objc_opt_respondsToSelector(v5, "promptDirector:wantsToPresentConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    v7 = *(unsigned __int8 *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000473C;
    v9[3] = &unk_10000C2A0;
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "promptDirector:wantsToPresentConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v6, v7, v8, v9);

  }
}

uint64_t sub_10000473C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if ((_DWORD)a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connect prompt received response: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_1000048A8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present use wireless prompt", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5
    && (objc_opt_respondsToSelector(v5, "promptDirector:wantsToPresentUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    v8 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000049D0;
    v9[3] = &unk_10000C2A0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "promptDirector:wantsToPresentUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:", v6, v8, v7, v9);

  }
}

uint64_t sub_1000049D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if ((_DWORD)a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "use wireless prompt received response: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100004B54(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present enhanced integration prompt for vehicle name: %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presenter"));

  if (v6
    && (objc_opt_respondsToSelector(v6, "promptDirector:wantsToPresentEnhancedIntegrationPromptForVehicleName:responseHandler:") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004CAC;
    v9[3] = &unk_10000C2A0;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v6, "promptDirector:wantsToPresentEnhancedIntegrationPromptForVehicleName:responseHandler:", v7, v8, v9);

  }
}

uint64_t sub_100004CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if ((_DWORD)a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "enhanced integration prompt received response: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100004E1C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present connect prompt", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5
    && (objc_opt_respondsToSelector(v5, "promptDirector:wantsToPresentAssetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    v7 = *(unsigned __int8 *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004F44;
    v9[3] = &unk_10000C2A0;
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "promptDirector:wantsToPresentAssetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:", v6, v7, v8, v9);

  }
}

uint64_t sub_100004F44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if ((_DWORD)a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connect prompt received response: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_1000050B0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present use wireless prompt", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenter"));

  if (v5
    && (objc_opt_respondsToSelector(v5, "promptDirector:wantsToPresentAssetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "director"));
    v8 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000051D8;
    v9[3] = &unk_10000C2A0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "promptDirector:wantsToPresentAssetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:", v6, v8, v7, v9);

  }
}

uint64_t sub_1000051D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("declined");
    if ((_DWORD)a2)
      v6 = CFSTR("accepted");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "use wireless prompt received response: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_10000535C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present asset progress prompt for vehicle name: %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_remoteAssetProgress"));

  objc_msgSend(*(id *)(a1 + 40), "setProgress:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presenter"));

  if (v8
    && (objc_opt_respondsToSelector(v8, "promptDirector:wantsToPresentAssetProgressPromptForVehicleName:progressReporter:cancelHandler:") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000054F0;
    v12[3] = &unk_10000C2A0;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v8, "promptDirector:wantsToPresentAssetProgressPromptForVehicleName:progressReporter:cancelHandler:", v9, v10, v11, v12);

  }
}

uint64_t sub_1000054F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t result;
  uint8_t v7[16];

  v4 = CARSetupLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "asset progress prompt was canceled", v7, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_100005624(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present asset ready prompt for vehicle name: %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presenter"));

  if (v6
    && (objc_opt_respondsToSelector(v6, "promptDirector:wantsToPresentAssetReadyPromptForVehicleName:confirmationHandler:") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005788;
    v9[3] = &unk_10000C2C8;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v6, "promptDirector:wantsToPresentAssetReadyPromptForVehicleName:confirmationHandler:", v7, v8, v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "setProgress:", 0);

}

uint64_t sub_100005788(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asset ready prompt was confirmed", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000058AC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present asset ready soon prompt for vehicle name: %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presenter"));

  if (v6
    && (objc_opt_respondsToSelector(v6, "promptDirector:wantsToPresentAssetReadySoonPromptForVehicleName:confirmationHandler:") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005A04;
    v9[3] = &unk_10000C2C8;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v6, "promptDirector:wantsToPresentAssetReadySoonPromptForVehicleName:confirmationHandler:", v7, v8, v9);

  }
}

uint64_t sub_100005A04(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asset ready soon prompt was confirmed", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100005B48(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "present setup car keys prompt for vehicle name: %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presenter"));

  if (v6
    && (objc_opt_respondsToSelector(v6, "promptDirector:wantsToPresentSetupCarKeysPromptForVehicleName:carKeyInfo:cancelHandler:") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "director"));
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005CAC;
    v10[3] = &unk_10000C2C8;
    v9 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v6, "promptDirector:wantsToPresentSetupCarKeysPromptForVehicleName:carKeyInfo:cancelHandler:", v7, v8, v9, v10);

  }
}

uint64_t sub_100005CAC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "setup car keys prompt was canceled", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100005EF8(id a1, CRSetupPromptDirectorService *a2)
{
  -[CRSetupPromptDirectorService presenterDidDismissWithCompletion:](a2, "presenterDidDismissWithCompletion:", &stru_10000C518);
}

void sub_100005F08(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2;
  v4 = a3;
  v5 = CARSetupLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10000696C();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100006998();
  }

}

void sub_100006000(id a1, CRSetupPromptDirectorService *a2)
{
  -[CRSetupPromptDirectorService presenterIsReadyWithCompletion:](a2, "presenterIsReadyWithCompletion:", &stru_10000C558);
}

void sub_100006010(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2;
  v4 = a3;
  v5 = CARSetupLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1000069F8();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100006A24();
  }

}

void sub_100006210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006234(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006244(uint64_t a1)
{

}

void sub_10000624C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "presenterRequestsAssetProgressWithCompletion:", &stru_10000C578));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_10000628C(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  NSError *v11;

  v3 = a2;
  v4 = a3;
  v5 = CARSetupLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "asset progress completed: success: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

}

void sub_100006504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006534(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100006A84();

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000065DC;
  block[3] = &unk_10000C5C8;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
}

void sub_1000065DC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionReset");

}

void sub_100006608(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v2 = CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100006AB0();

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000066B0;
  block[3] = &unk_10000C5C8;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
}

void sub_1000066B0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void sub_100006748(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = a2;
  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100006ADC();

}

void sub_100006808(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = a2;
  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100006ADC();

}

void sub_1000068BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000068DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006904(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003A20((void *)&_mh_execute_header, a1, a3, "CARSetupContainerViewController viewDidLoad", a5, a6, a7, a8, 0);
}

void sub_100006938(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003A20((void *)&_mh_execute_header, a1, a3, "CARSetupContainerViewController viewDidAppear:", a5, a6, a7, a8, 0);
}

void sub_10000696C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000068F8();
  sub_100003A20((void *)&_mh_execute_header, v0, v1, "presenterDidDismiss, director replied", v2, v3, v4, v5, v6);
  sub_1000068D4();
}

void sub_100006998()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000068EC();
  sub_1000068BC((void *)&_mh_execute_header, v0, v1, "presenterDidDismiss, director replied with error: %@", v2, v3, v4, v5, v6);
  sub_1000068CC();
}

void sub_1000069F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000068F8();
  sub_100003A20((void *)&_mh_execute_header, v0, v1, "presenterIsReady, director replied", v2, v3, v4, v5, v6);
  sub_1000068D4();
}

void sub_100006A24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000068EC();
  sub_1000068BC((void *)&_mh_execute_header, v0, v1, "presenterIsReady, director replied with error: %@", v2, v3, v4, v5, v6);
  sub_1000068CC();
}

void sub_100006A84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000068F8();
  sub_1000068DC((void *)&_mh_execute_header, v0, v1, "CarKit setup prompt director service was interrupted", v2, v3, v4, v5, v6);
  sub_1000068D4();
}

void sub_100006AB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000068F8();
  sub_1000068DC((void *)&_mh_execute_header, v0, v1, "CarKit setup prompt director service was invalidated", v2, v3, v4, v5, v6);
  sub_1000068D4();
}

void sub_100006ADC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000068EC();
  sub_1000068BC((void *)&_mh_execute_header, v0, v1, "error calling CarKit setup prompt service: %@", v2, v3, v4, v5, v6);
  sub_1000068CC();
}

id objc_msgSend__handleConnectionReset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleConnectionReset");
}

id objc_msgSend__passConfigurationFromDigitalCarKeyInfo_vehicleName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_passConfigurationFromDigitalCarKeyInfo:vehicleName:");
}

id objc_msgSend__presentGenericViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentGenericViewController:");
}

id objc_msgSend__presentPromptViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentPromptViewController:");
}

id objc_msgSend__presenterIsReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presenterIsReady");
}

id objc_msgSend__remoteAssetProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteAssetProgress");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__servicePerform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_servicePerform:");
}

id objc_msgSend__setupConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupConnection");
}

id objc_msgSend__setupPromptPresenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupPromptPresenter");
}

id objc_msgSend__synchronous_servicePerform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_synchronous_servicePerform:");
}

id objc_msgSend_allowWhileLockedPromptForVehicleName_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowWhileLockedPromptForVehicleName:responseHandler:");
}

id objc_msgSend_assetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:");
}

id objc_msgSend_assetSupportingUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:");
}

id objc_msgSend_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:");
}

id objc_msgSend_bluetoothContactsSyncPromptWithResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothContactsSyncPromptWithResponseHandler:");
}

id objc_msgSend_bluetoothFailedPromptForVehicleName_isTimeout_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothFailedPromptForVehicleName:isTimeout:responseHandler:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_director(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "director");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_enhancedIntegrationPromptForVehicleName_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enhancedIntegrationPromptForVehicleName:responseHandler:");
}

id objc_msgSend_genericNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "genericNavigationController");
}

id objc_msgSend_initWithDoneHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDoneHandler:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithPresenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPresenter:");
}

id objc_msgSend_initWithPresentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPresentingViewController:");
}

id objc_msgSend_initWithProgressReporter_cancelHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgressReporter:cancelHandler:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_presentProxCardFlowWithDelegate_initialViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenter");
}

id objc_msgSend_presenterDidDismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenterDidDismiss");
}

id objc_msgSend_presenterRequestsAssetProgressWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenterRequestsAssetProgressWithCompletion:");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_promptDirector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector");
}

id objc_msgSend_promptDirector_wantsToPresentAllowWhileLockedPromptForVehicleName_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentAllowWhileLockedPromptForVehicleName:responseHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentAssetProgressPromptForVehicleName_progressReporter_cancelHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentAssetProgressPromptForVehicleName:progressReporter:cancelHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentAssetReadyPromptForVehicleName_confirmationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentAssetReadyPromptForVehicleName:confirmationHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentAssetReadySoonPromptForVehicleName_confirmationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentAssetReadySoonPromptForVehicleName:confirmationHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentAssetSupportingConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentAssetSupportingConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentAssetSupportingUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentAssetSupportingUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentBluetoothConfirmationPromptForVehicleName_numericCode_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentBluetoothConfirmationPromptForVehicleName:numericCode:responseHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentBluetoothContactsSyncPromptWithResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentBluetoothContactsSyncPromptWithResponseHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentBluetoothFailedPromptForVehicleName_isTimeout_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentBluetoothFailedPromptForVehicleName:isTimeout:responseHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentConnectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentConnectPromptWithBluetoothOnlyOption:wirelessEnablement:responseHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentEnhancedIntegrationPromptForVehicleName_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentEnhancedIntegrationPromptForVehicleName:responseHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentSetupCarKeysPromptForVehicleName_carKeyInfo_cancelHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentSetupCarKeysPromptForVehicleName:carKeyInfo:cancelHandler:");
}

id objc_msgSend_promptDirector_wantsToPresentUseWirelessPromptWithWirelessEnablement_declineVariant_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirector:wantsToPresentUseWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:");
}

id objc_msgSend_promptDirectorWantsToPresentWaiting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptDirectorWantsToPresentWaiting:");
}

id objc_msgSend_proxNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxNavigationController");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertItems:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setDirector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirector:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setGenericNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGenericNavigationController:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIssuerIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIssuerIdentifier:");
}

id objc_msgSend_setManufacturerIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManufacturerIdentifier:");
}

id objc_msgSend_setOnlineServicesActivated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOnlineServicesActivated:");
}

id objc_msgSend_setOwnerKeyPairingAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOwnerKeyPairingAvailable:");
}

id objc_msgSend_setPairedReaderIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairedReaderIdentifier:");
}

id objc_msgSend_setProductPlanIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductPlanIdentifier:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setPromptPresenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPromptPresenter:");
}

id objc_msgSend_setProofOfOwnershipPresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProofOfOwnershipPresent:");
}

id objc_msgSend_setProvisioningTemplateIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProvisioningTemplateIdentifier:");
}

id objc_msgSend_setProxNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxNavigationController:");
}

id objc_msgSend_setReferralSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReferralSource:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSupportedRadioTechnologies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedRadioTechnologies:");
}

id objc_msgSend_setVehicleName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVehicleName:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useWirelessPromptWithWirelessEnablement:declineVariant:responseHandler:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vehicleInitiatedPairingViewControllerForConfiguration:paymentService:completion:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_waitingPrompt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingPrompt");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
