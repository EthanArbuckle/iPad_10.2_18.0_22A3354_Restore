void sub_100004F00(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;

  v2 = sub_100007894();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1000124B4();

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

}

void sub_100004F94(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = sub_100007894();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100012514();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "playSoundForAccessory sound started", v8, 2u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void sub_1000051A4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;

  v2 = sub_100007584();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100012574();

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

}

void sub_100005238(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = sub_100007584();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000125D4();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stopSoundForAccessory sound did stop", v8, 2u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void sub_1000054F0(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(double *)(a1 + 64);
  v3 = 5.0;
  if (v2 >= 5.0)
    v3 = *(double *)(a1 + 64);
  if (v2 >= 0.0)
    v4 = v3;
  else
    v4 = 0.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryAudioController"));
  objc_msgSend(v5, "setRampUpDuration:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryAudioController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000055EC;
  v9[3] = &unk_100020550;
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 72);
  v10 = v7;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v6, "startPlayingSoundForAccessory:channels:completion:", v10, v8, v9);

}

void sub_1000055EC(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  v3 = a2;
  if (!v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005690;
    block[3] = &unk_100020528;
    v4 = (void *)a1[5];
    block[4] = a1[4];
    v8 = a1[7];
    v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v5 = a1[6];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

id sub_100005690(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTimeoutForDuration:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAccessory:", *(_QWORD *)(a1 + 40));
}

void sub_100005884(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  if (*(double *)(a1 + 56) >= 0.0)
    v2 = *(double *)(a1 + 56);
  else
    v2 = 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryAudioController"));
  objc_msgSend(v3, "setRampDownDuration:", v2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryAudioController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005950;
  v6[3] = &unk_1000205A0;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "stopPlayingForAccessory:completion:", v5, v6);

}

void sub_100005950(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidateStopSoundTimer");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void sub_100005BF0(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_100007824();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100012634();

  }
}

void sub_100005D44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005F30(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FindMyDeviceBluetoothExtension.bluetoothManagerDelegateQueue", 0);
  v2 = (void *)qword_10002D6A0;
  qword_10002D6A0 = (uint64_t)v1;

}

void sub_100005F9C(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FindMyDeviceBluetoothExtension.bluetoothManagerSerialQueue", 0);
  v2 = (void *)qword_10002D6B0;
  qword_10002D6B0 = (uint64_t)v1;

}

void sub_1000061E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006218(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006228(uint64_t a1)
{

}

void sub_100006230(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairedDevices"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100006880(id a1)
{
  FMDAutomationHelperFactory *v1;
  void *v2;

  v1 = objc_alloc_init(FMDAutomationHelperFactory);
  v2 = (void *)qword_10002D6B8;
  qword_10002D6B8 = (uint64_t)v1;

}

void sub_100006B68(id a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  NSSet *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = objc_alloc((Class)FMSharedFileContainer);
  v2 = objc_msgSend(v1, "initWithIdentifier:", off_10002D118);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "url"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_preferencesPathURLForDomain:", CFSTR("FMDAutomationAVRouteController")));

  v4 = objc_msgSend(objc_alloc((Class)FMDataArchiver), "initWithFileURL:", v9);
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readDictionaryAndClasses:error:", v6, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FMDAutomationAVRouteControllerAutomationActiveKey")));
  byte_10002D6C8 = objc_msgSend(v8, "BOOLValue");

}

void sub_100006D84(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10002D6D8;
  qword_10002D6D8 = (uint64_t)v1;

}

id sub_100007584()
{
  if (qword_10002D6E8 != -1)
    dispatch_once(&qword_10002D6E8, &stru_100021120);
  return (id)qword_10002D6F0;
}

void sub_1000075C4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "_");
  v2 = (void *)qword_10002D6F0;
  qword_10002D6F0 = (uint64_t)v1;

}

id sub_1000075F4()
{
  if (qword_10002D6F8 != -1)
    dispatch_once(&qword_10002D6F8, &stru_100021140);
  return (id)qword_10002D700;
}

void sub_100007634(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "locations");
  v2 = (void *)qword_10002D700;
  qword_10002D700 = (uint64_t)v1;

}

id sub_100007664()
{
  if (qword_10002D708 != -1)
    dispatch_once(&qword_10002D708, &stru_100021160);
  return (id)qword_10002D710;
}

void sub_1000076A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "accessory");
  v2 = (void *)qword_10002D710;
  qword_10002D710 = (uint64_t)v1;

}

id sub_1000076D4()
{
  if (qword_10002D718 != -1)
    dispatch_once(&qword_10002D718, &stru_100021180);
  return (id)qword_10002D720;
}

void sub_100007714(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "traffic");
  v2 = (void *)qword_10002D720;
  qword_10002D720 = (uint64_t)v1;

}

id sub_100007744()
{
  if (qword_10002D728 != -1)
    dispatch_once(&qword_10002D728, &stru_1000211A0);
  return (id)qword_10002D730;
}

void sub_100007784(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "encoder");
  v2 = (void *)qword_10002D730;
  qword_10002D730 = (uint64_t)v1;

}

id sub_1000077B4()
{
  if (qword_10002D738 != -1)
    dispatch_once(&qword_10002D738, &stru_1000211C0);
  return (id)qword_10002D740;
}

void sub_1000077F4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");
  v2 = (void *)qword_10002D740;
  qword_10002D740 = (uint64_t)v1;

}

id sub_100007824()
{
  if (qword_10002D748 != -1)
    dispatch_once(&qword_10002D748, &stru_1000211E0);
  return (id)qword_10002D750;
}

void sub_100007864(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "extensions");
  v2 = (void *)qword_10002D750;
  qword_10002D750 = (uint64_t)v1;

}

id sub_100007894()
{
  if (qword_10002D758 != -1)
    dispatch_once(&qword_10002D758, &stru_100021200);
  return (id)qword_10002D760;
}

void sub_1000078D4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");
  v2 = (void *)qword_10002D760;
  qword_10002D760 = (uint64_t)v1;

}

id sub_100007904()
{
  if (qword_10002D768 != -1)
    dispatch_once(&qword_10002D768, &stru_100021220);
  return (id)qword_10002D770;
}

void sub_100007944(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "secureLocations");
  v2 = (void *)qword_10002D770;
  qword_10002D770 = (uint64_t)v1;

}

id sub_100007974()
{
  if (qword_10002D778 != -1)
    dispatch_once(&qword_10002D778, &stru_100021240);
  return (id)qword_10002D780;
}

void sub_1000079B4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "repairDevice");
  v2 = (void *)qword_10002D780;
  qword_10002D780 = (uint64_t)v1;

}

id sub_1000079E4()
{
  if (qword_10002D788 != -1)
    dispatch_once(&qword_10002D788, &stru_100021260);
  return (id)qword_10002D790;
}

void sub_100007A24(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");
  v2 = (void *)qword_10002D790;
  qword_10002D790 = (uint64_t)v1;

}

id sub_100007A54()
{
  if (qword_10002D798 != -1)
    dispatch_once(&qword_10002D798, &stru_100021280);
  return (id)qword_10002D7A0;
}

void sub_100007A94(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");
  v2 = (void *)qword_10002D7A0;
  qword_10002D7A0 = (uint64_t)v1;

}

id sub_100007AC4()
{
  if (qword_10002D7A8 != -1)
    dispatch_once(&qword_10002D7A8, &stru_1000212A0);
  return (id)qword_10002D7B0;
}

void sub_100007B04(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");
  v2 = (void *)qword_10002D7B0;
  qword_10002D7B0 = (uint64_t)v1;

}

id sub_100007B34()
{
  if (qword_10002D7B8 != -1)
    dispatch_once(&qword_10002D7B8, &stru_1000212C0);
  return (id)qword_10002D7C0;
}

void sub_100007B74(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");
  v2 = (void *)qword_10002D7C0;
  qword_10002D7C0 = (uint64_t)v1;

}

id sub_100007BA4()
{
  if (qword_10002D7C8 != -1)
    dispatch_once(&qword_10002D7C8, &stru_1000212E0);
  return (id)qword_10002D7D0;
}

void sub_100007BE4(id a1)
{
  os_log_t v1;
  void *v2;

  if (+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("ShowAutomationLogs"), CFSTR("com.apple.icloud.findmydeviced.notbackedup")))
  {
    v1 = os_log_create("com.apple.icloud.findmydeviced", "automation");
    v2 = (void *)qword_10002D7D0;
    qword_10002D7D0 = (uint64_t)v1;

  }
}

void sub_100007D60(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_1000077B4();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Session started by client. [warmup complete]", v3, 2u);
  }

}

void sub_100008034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008080(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100008090(uint64_t a1)
{

}

void sub_100008098(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t ControlCommand;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioRoutingIdentifier"));
  v4 = objc_msgSend(WeakRetained, "deviceWithAddress:", v3);

  if (v4)
  {
    ControlCommand = BTAccessoryManagerGetControlCommand(objc_msgSend(WeakRetained, "accessoryManager"), v4, 13, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v6 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if ((_DWORD)ControlCommand)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000127D4(a1 + 32, ControlCommand, v8);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioRoutingIdentifier"));
      v11 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v13 = 138412546;
      v14 = v10;
      v15 = 1024;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Got listening mode for accessory address: %@ | mode: %u", (uint8_t *)&v13, 0x12u);

    }
  }
  else
  {
    v9 = sub_1000077B4();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100012754(a1 + 32, v8);
  }

  v12 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v12)
    dispatch_semaphore_signal(v12);

}

void sub_10000838C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000083B0(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioRoutingIdentifier"));
  v4 = objc_msgSend(WeakRetained, "deviceWithAddress:", v3);

  if (v4)
  {
    v5 = BTAccessoryManagerSendControlCommand(objc_msgSend(WeakRetained, "accessoryManager"), v4, 13, *(unsigned int *)(a1 + 48));
    v6 = sub_1000077B4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if ((_DWORD)v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000128DC(a1 + 32, v5, v8);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioRoutingIdentifier"));
      v11 = *(_DWORD *)(a1 + 48);
      v12 = 138412546;
      v13 = v10;
      v14 = 1024;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set listening mode for accessory address: %@ | mode: %u", (uint8_t *)&v12, 0x12u);

    }
  }
  else
  {
    v9 = sub_1000077B4();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001285C(a1 + 32, v8);
  }

}

void sub_1000085FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100008610(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;
  _QWORD v11[4];
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "attachToSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "futureSession"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008780;
  v11[3] = &unk_100021380;
  v12 = a1[4];
  v13 = a1[5];
  v4 = objc_msgSend(v3, "addSuccessBlock:", v11);

  objc_initWeak(&location, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "futureSession"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000087FC;
  v7[3] = &unk_1000213A8;
  v8 = a1[4];
  objc_copyWeak(&v9, &location);
  v6 = objc_msgSend(v5, "addFailureBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void sub_10000875C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100008780(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v2 = sub_1000077B4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Session is active. Executing client request block.", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000087FC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = sub_1000077B4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100012964();

  objc_msgSend(WeakRetained, "detachFromSession");
}

void sub_100008C98(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v5 = sub_1000077B4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Callback for BTServiceEvent %u", (uint8_t *)v7, 8u);
  }

}

void sub_100009930(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  uint8_t buf[4];
  int v19;

  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bluetoothSessionQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = sub_1000077B4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = a2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Callback for BTSessionEvent %u", buf, 8u);
  }

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009A6C;
  block[3] = &unk_100021438;
  v14 = v7;
  v15 = a1;
  v16 = a2;
  v17 = a3;
  v12 = v7;
  dispatch_sync(v11, block);

}

id *sub_100009A6C(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4;

  v4 = *((_DWORD *)result + 12);
  if (v4 - 2 < 2)
    return (id *)objc_msgSend(result[4], "sessionTerminated:", result[5], a4);
  if (v4 == 1)
    return (id *)objc_msgSend(result[4], "sessionDetached:", result[5], a4);
  if (!v4)
    return (id *)objc_msgSend(result[4], "sessionAttached:result:", result[5], *((unsigned int *)result + 13));
  return result;
}

void sub_100009AB4(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  _DWORD v5[2];

  v3 = sub_1000077B4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Callback for BTAccessoryEvent %u", (uint8_t *)v5, 8u);
  }

}

void sub_100009B54(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  _DWORD v5[2];

  v3 = sub_1000077B4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Callback for BTLocalDeviceStatusEvent %u", (uint8_t *)v5, 8u);
  }

}

void sub_100009BF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100009C04(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100009C30(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_100009C3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100009C50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_100009C94(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_100009D7C(id a1)
{
  unsigned int v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v1 = objc_msgSend(v2, "isInternalBuild");
  if (v1)
    LOBYTE(v1) = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("FMDAutomationBluetoothManagerAutomationActiveKey"), kFMDNotBackedUpPrefDomain);
  byte_10002D7D8 = v1;

}

id sub_100009EF0(uint64_t a1)
{
  return +[BluetoothManager setSharedInstanceQueue:](BluetoothManager, "setSharedInstanceQueue:", *(_QWORD *)(a1 + 32));
}

void sub_100009F04(id a1)
{
  void *v1;
  objc_class *v2;
  id v3;
  void *v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAutomationHelperFactory sharedFactory](FMDAutomationHelperFactory, "sharedFactory"));
  v2 = (objc_class *)objc_msgSend(v1, "automationHelperClassWithName:", CFSTR("FMDAutomationBluetoothManager"));

  v3 = objc_alloc_init(v2);
  v4 = (void *)qword_10002D7F0;
  qword_10002D7F0 = (uint64_t)v3;

}

uint64_t sub_10000ACBC(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsSoundPlaying:", 0);
  LODWORD(v2) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setVolumeTargetValue:", v2);
  objc_msgSend(*(id *)(a1 + 32), "rampDownDuration");
  objc_msgSend(*(id *)(a1 + 32), "setFadeDuration:");
  objc_msgSend(*(id *)(a1 + 32), "rampDownDuration");
  v3 = *(void **)(a1 + 32);
  if (v4 <= 0.0)
    objc_msgSend(v3, "stopSound");
  else
    objc_msgSend(v3, "fade");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_10000C414(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;

  v2 = sub_100007584();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10001329C(v3, v4, v5, v6, v7, v8, v9, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fade");

}

uint64_t sub_10000CB5C(uint64_t result)
{
  uint64_t v1;
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    v2 = sub_100007584();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_retainBlock(*(id *)(v1 + 32));
      v5 = 138412290;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Calling initial completion block %@", (uint8_t *)&v5, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t sub_10000CF54(uint64_t result)
{
  uint64_t v1;
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    v2 = sub_100007584();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_retainBlock(*(id *)(v1 + 32));
      v5 = 138412290;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Calling initial completion block %@", (uint8_t *)&v5, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

double sub_10000D5B8(float a1)
{
  return a1;
}

void sub_10000D5D4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10000D5FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id sub_10000D60C()
{
  void *v0;

  return objc_msgSend(v0, "panTargetValue");
}

void sub_10000F510(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000F878(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_10000F8DC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bluetoothDiscoveryQueue"));
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000F980;
    v6[3] = &unk_1000215D0;
    v7 = v3;
    v8 = WeakRetained;
    dispatch_async(v5, v6);

  }
}

id sub_10000F980(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = sub_100007824();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BluetoothManager didDiscoverDevice %@", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "didDiscoverDevice:", *(_QWORD *)(a1 + 32));
}

void sub_10000FA2C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bluetoothDiscoveryQueue"));
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000FAD0;
    v6[3] = &unk_1000215D0;
    v7 = v3;
    v8 = WeakRetained;
    dispatch_async(v5, v6);

  }
}

id sub_10000FAD0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = sub_100007824();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BluetoothManager didLoseDevice %@", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "didLoseDevice:", *(_QWORD *)(a1 + 32));
}

void sub_10000FB7C(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bluetoothDiscoveryQueue"));
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000FBFC;
    block[3] = &unk_100021480;
    block[4] = WeakRetained;
    dispatch_async(v2, block);
  }

}

id sub_10000FBFC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = sub_100007824();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BluetoothManager discovery ended - setting all channels inactive.", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setAllAudioChannelsActive:", 0);
}

void sub_10000FC70(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bluetoothDiscoveryQueue"));
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000FCF0;
    block[3] = &unk_100021480;
    block[4] = WeakRetained;
    dispatch_async(v2, block);
  }

}

id sub_10000FCF0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = sub_100007824();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BluetoothManager discovery started - setting all channels active.", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setAllAudioChannelsActive:", 1);
}

void sub_1000106E8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_100010724(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "didDiscoverDevice"));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

void sub_100010788(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "didLoseDevice"));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

void sub_1000107EC(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didEndDiscoveryWithError:", v3);

}

void sub_100010A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010A58(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTokens"));
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 32));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTokens"));
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tokenDiscoveryEnded"));

    if (v5)
    {
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tokenDiscoveryEnded"));
      v6[2]();

    }
  }
  objc_msgSend(WeakRetained, "updateDisccovery");

}

void sub_100010C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010C70(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTokens"));
  objc_msgSend(v2, "fm_safeAddObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "updateDisccovery");
}

void sub_100010E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010E24(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTokens"));
  v2 = objc_msgSend(v1, "copy");

  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &stru_100021708);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTokens"));
  objc_msgSend(v3, "removeAllObjects");

}

void sub_100010E98(id a1, FMDBluetoothDiscoveryToken *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void (**v5)(void);
  FMDBluetoothDiscoveryToken *v6;

  v6 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken tokenDiscoveryEnded](v6, "tokenDiscoveryEnded"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken tokenDiscoveryEnded](v6, "tokenDiscoveryEnded"));
    v5[2]();

  }
}

void sub_10001102C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011054(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scanningTimerFired");

}

void sub_100011148(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_10001115C(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTokens"));
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = sub_100007584();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTokens"));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery unterminated tokens %@.", (uint8_t *)&v7, 0xCu);

    }
  }
  objc_msgSend(WeakRetained, "updateDisccovery");

}

int64_t sub_1000115C8(id a1, FMDBluetoothDiscoveryToken *a2, FMDBluetoothDiscoveryToken *a3)
{
  FMDBluetoothDiscoveryToken *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken endDate](a2, "endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken endDate](v4, "endDate"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

void sub_100011D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011D90(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "completion"));
  v2 = (void *)v1;
  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void sub_100011FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012014(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSErrorUserInfoKey v15;
  void *v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v4 = sub_100007584();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001389C((uint64_t)a2, v5, v6, v7, v8, v9, v10, v11);

    v12 = kFMDErrorDomain;
    v15 = NSUnderlyingErrorKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSXPCError"), a2, 0));
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    a2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, 13, v14));

  }
  objc_msgSend(WeakRetained, "setConnection:", 0);
  objc_msgSend(WeakRetained, "_didEndDiscoveryWithError:", a2);

}

void sub_1000124B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005D5C();
  sub_100005D44((void *)&_mh_execute_header, v0, v1, "XPC error for startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion: %li", v2, v3, v4, v5, v6);
  sub_100005D54();
}

void sub_100012514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005D5C();
  sub_100005D44((void *)&_mh_execute_header, v0, v1, "playSoundForAccessory encountered an error : %@", v2, v3, v4, v5, v6);
  sub_100005D54();
}

void sub_100012574()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005D5C();
  sub_100005D44((void *)&_mh_execute_header, v0, v1, "XPC error for stopPlayingSoundForAccessory:rampDownDuration:completion %li", v2, v3, v4, v5, v6);
  sub_100005D54();
}

void sub_1000125D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005D5C();
  sub_100005D44((void *)&_mh_execute_header, v0, v1, "stopSoundForAccessory encountered an error : %@", v2, v3, v4, v5, v6);
  sub_100005D54();
}

void sub_100012634()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005D5C();
  sub_100005D44((void *)&_mh_execute_header, v0, v1, "stop sound with error %@", v2, v3, v4, v5, v6);
  sub_100005D54();
}

void sub_100012694(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_100012708(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100009C3C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Timeout getting listening mode for accessory address: %@", (uint8_t *)a2);

}

void sub_100012754(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = objc_msgSend((id)sub_100009C94(a1), "audioRoutingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100005D5C();
  sub_100009C3C((void *)&_mh_execute_header, a2, v5, "Failed to get btdevice for listening mode using accessory address: %@", v6);

  sub_100009CA0();
}

void sub_1000127D4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = objc_msgSend((id)sub_100009C94(a1), "audioRoutingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100009C60();
  sub_100009C30((void *)&_mh_execute_header, a3, v6, "Failed to get listening mode for accessory address: %@ | result: %d", v7);

  sub_100009C78();
}

void sub_10001285C(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = objc_msgSend((id)sub_100009C94(a1), "audioRoutingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100005D5C();
  sub_100009C3C((void *)&_mh_execute_header, a2, v5, "Failed to update btdevice listening mode on accessory address: %@", v6);

  sub_100009CA0();
}

void sub_1000128DC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = objc_msgSend((id)sub_100009C94(a1), "audioRoutingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100009C60();
  sub_100009C30((void *)&_mh_execute_header, a3, v6, "Failed to set listening mode for accessory address: %@ | result: %d", v7);

  sub_100009C78();
}

void sub_100012964()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005D5C();
  sub_100009C3C((void *)&_mh_execute_header, v0, v1, "Error in bluetooth session interface, detaching. Pending actions have been discarded. %@", v2);
  sub_100005D54();
}

void sub_1000129C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009C88();
  sub_100009BF4((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice address from nil / empty address string.", v2, v3, v4, v5, v6);
  sub_100009C48();
}

void sub_1000129F4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005D5C();
  sub_100009C3C((void *)&_mh_execute_header, v0, v1, "Cannot get BTDevice: No session. Address: %@", v2);
  sub_100005D54();
}

void sub_100012A58()
{
  uint64_t v0;
  os_log_t v1;

  sub_100009C18();
  sub_100009C04((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice from BTDeviceAddress %@ %d");
  sub_100005D54();
}

void sub_100012AB8()
{
  uint64_t v0;
  os_log_t v1;

  sub_100009C18();
  sub_100009C04((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice address from address string %@ %d");
  sub_100005D54();
}

void sub_100012B18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009C50((void *)&_mh_execute_header, a2, a3, "Session failed to attach: %u", a5, a6, a7, a8, 0);
  sub_100009C48();
}

void sub_100012B7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009C88();
  sub_100009BF4((void *)&_mh_execute_header, v0, v1, "Detached session is not the active session. Ignoring.", v2, v3, v4, v5, v6);
  sub_100009C48();
}

void sub_100012BA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009C88();
  sub_100009BF4((void *)&_mh_execute_header, v0, v1, "Terminated session is not the active session. Ignoring.", v2, v3, v4, v5, v6);
  sub_100009C48();
}

void sub_100012BD4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009C50((void *)&_mh_execute_header, a2, a3, "Failed attaching to session %d", a5, a6, a7, a8, 0);
  sub_100009C48();
}

void sub_100012C38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009C88();
  sub_100009BF4((void *)&_mh_execute_header, v0, v1, "Failed to set up accessory manager. Missing session.", v2, v3, v4, v5, v6);
  sub_100009C48();
}

void sub_100012C64()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  sub_100009C18();
  sub_100009C04((void *)&_mh_execute_header, v0, v1, "Failed getting default accessory manager from session: %p, result: %d", v2, v3);
  sub_100005D54();
}

void sub_100012CC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009C88();
  sub_100009BF4((void *)&_mh_execute_header, v0, v1, "Failed to set up local device. Missing session.", v2, v3, v4, v5, v6);
  sub_100009C48();
}

void sub_100012CF0()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  sub_100009C18();
  sub_100009C04((void *)&_mh_execute_header, v0, v1, "Failed getting default local device from session %p. Result: %d.", v2, v3);
  sub_100005D54();
}

void sub_100012D50(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005D44((void *)&_mh_execute_header, a2, a3, "#PARSING invalid or no pattern in maskInfo %@", a5, a6, a7, a8, 2u);
}

void sub_100012DB8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005D44((void *)&_mh_execute_header, a2, a3, "#PARSING invalid or no mask in maskInfo %@", a5, a6, a7, a8, 2u);
}

void sub_100012E20()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005D5C();
  sub_100009C3C((void *)&_mh_execute_header, v0, v1, "FMDAccessoryAudioController cannot pick route to accessory. Aborting, %@", v2);
  sub_100005D54();
}

void sub_100012E84()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005D5C();
  sub_100009C3C((void *)&_mh_execute_header, v0, v1, "FMDAccessoryAudioController cannot route audio to accessory %@", v2);
  sub_100005D54();
}

void sub_100012EE8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "routeID"));
  sub_100005D5C();
  sub_100009C3C((void *)&_mh_execute_header, a2, v4, "AccessoryAudioController unable to set maximum volume, please file a bug to Core Audio %@", v5);

  sub_100009CA0();
}

void sub_100012F68(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "routeID"));
  sub_100005D5C();
  sub_100009C3C((void *)&_mh_execute_header, a2, v4, "AccessoryAudioController unable to get original volume %@", v5);

  sub_100009CA0();
}

void sub_100012FE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000D5FC((void *)&_mh_execute_header, a1, a3, "Creating fade timer", a5, a6, a7, a8, 0);
}

void sub_10001301C(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "audioPlayer"));
  objc_msgSend(v1, "pan");
  sub_10000D60C();
  sub_10000D5B8(v2);
  sub_10000D5D4((void *)&_mh_execute_header, v3, v4, "Panning to %f targetValue: %f", v5, v6, v7, v8, v9);

  sub_10000D5E8();
}

void sub_1000130A8(void *a1)
{
  void *v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "audioPlayer"));
  objc_msgSend(v1, "pan");
  sub_10000D60C();
  sub_10000D5B8(v2);
  sub_10000D5D4((void *)&_mh_execute_header, v3, v4, "Stopping pan at %f target: %f", v5, v6, v7, v8, v9);

  sub_10000D5E8();
}

void sub_100013134(void *a1, NSObject *a2, double a3)
{
  void *v6;
  float v7;
  double v8;
  float v9;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "audioPlayer"));
  objc_msgSend(v6, "volume");
  v8 = v7;
  objc_msgSend(a1, "volumeTargetValue");
  v10 = 134218496;
  v11 = v8;
  v12 = 2048;
  v13 = v9;
  v14 = 2048;
  v15 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Fading to %f targetValue: %f interval: %f", (uint8_t *)&v10, 0x20u);

}

void sub_100013208(void *a1)
{
  void *v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "audioPlayer"));
  objc_msgSend(v2, "volume");
  objc_msgSend(a1, "volumeTargetValue");
  sub_10000D5B8(v3);
  sub_10000D5D4((void *)&_mh_execute_header, v4, v5, "Stopping fade at %f target: %f", v6, v7, v8, v9, v10);

  sub_10000D5E8();
}

void sub_10001329C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000D5FC((void *)&_mh_execute_header, a1, a3, "Fade timer fired", a5, a6, a7, a8, 0);
}

void sub_1000132D0(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;

  v2[0] = 67109378;
  v2[1] = 0;
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDAccessoryAudioController unable to restore unknown listening mode %u for accessory %@", (uint8_t *)v2, 0x12u);
  sub_100005D54();
}

void sub_10001334C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005D44((void *)&_mh_execute_header, a2, a3, "invalid host received %@", a5, a6, a7, a8, 2u);
  sub_100005D54();
}

void sub_1000133B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F520();
  sub_10000F510((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
  sub_100005D54();
}

void sub_10001341C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F520();
  sub_10000F510((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
  sub_100005D54();
}

void sub_100013488()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F520();
  sub_10000F510((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
  sub_100005D54();
}

void sub_1000134F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F520();
  sub_10000F510((void *)&_mh_execute_header, v0, v1, "%s parsing failed %@", v2, v3, v4, v5, 2u);
  sub_100005D54();
}

void sub_100013560()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F520();
  sub_10000F510((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
  sub_100005D54();
}

void sub_1000135CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F520();
  sub_10000F510((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
  sub_100005D54();
}

void sub_100013638(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "discoveryFactory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryId"));
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "got stop command for discover for different accessory %@ != %@", (uint8_t *)&v7, 0x16u);

}

void sub_1000136F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F520();
  sub_10000F510((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
  sub_100005D54();
}

void sub_100013764(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005D44((void *)&_mh_execute_header, a2, a3, "soundFile %@.wav does not exist", a5, a6, a7, a8, 2u);
  sub_100005D54();
}

void sub_1000137C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000F520();
  sub_10000F510((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
  sub_100005D54();
}

void sub_100013834(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000D5FC((void *)&_mh_execute_header, a1, a3, "FMDBluetoothDiscovery Scanning timer fired.", a5, a6, a7, a8, 0);
}

void sub_100013868(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000D5FC((void *)&_mh_execute_header, a1, a3, "FMDBluetoothDiscoveryCoordinator discovery terminating - no active tokens", a5, a6, a7, a8, 0);
}

void sub_10001389C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005D44((void *)&_mh_execute_header, a2, a3, "FMDBluetoothDiscoveryXPCProxy service terminated with error : %li", a5, a6, a7, a8, 0);
}

void sub_100013904(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005D44((void *)&_mh_execute_header, a2, a3, "FMDBluetoothDiscoveryXPCProxy didEndDiscoveryWithError : %@", a5, a6, a7, a8, 2u);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend__audioCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_audioCategory");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_auxiliaryConnection");
}

id objc_msgSend__computehash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computehash:");
}

id objc_msgSend__didEndDiscoveryWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didEndDiscoveryWithError:");
}

id objc_msgSend__xpcSafeAdvertisementKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSafeAdvertisementKeys:");
}

id objc_msgSend_accessoryAudioController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryAudioController");
}

id objc_msgSend_accessoryId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryId");
}

id objc_msgSend_accessoryIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryIdentifier");
}

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryInfo");
}

id objc_msgSend_accessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryManager");
}

id objc_msgSend_activeTokens(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeTokens");
}

id objc_msgSend_addFailureBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFailureBlock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_advertisementFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisementFields");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachToSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachToSession");
}

id objc_msgSend_audioPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioPlayer");
}

id objc_msgSend_audioRoutingIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioRoutingIdentifier");
}

id objc_msgSend_audioURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioURL");
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automationHelperBundle");
}

id objc_msgSend_automationHelperClassWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automationHelperClassWithName:");
}

id objc_msgSend_availabilitydidChangeFor_status_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availabilitydidChangeFor:status:withCompletion:");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothAddress");
}

id objc_msgSend_bluetoothDiscoveryQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothDiscoveryQueue");
}

id objc_msgSend_bluetoothManagerDelegateQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManagerDelegateQueue");
}

id objc_msgSend_bluetoothManagerWithQueue_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManagerWithQueue:delegate:");
}

id objc_msgSend_bluetoothSessionInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothSessionInterface");
}

id objc_msgSend_bluetoothSessionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothSessionQueue");
}

id objc_msgSend_BOOLForKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:inDomain:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_btDiscoveryConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btDiscoveryConfiguration");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bypassAllListeningModesForAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bypassAllListeningModesForAccessory:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completion");
}

id objc_msgSend_configurationDictWithBleDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationDictWithBleDevice:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectDevice:");
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connected");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
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

id objc_msgSend_currentAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAccessory");
}

id objc_msgSend_currentInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentInstance");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentThread");
}

id objc_msgSend_currentlyPicked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyPicked");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntegerForKey:");
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

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_detachFromSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detachFromSession");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceIDFromAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIDFromAddress:");
}

id objc_msgSend_deviceTypeFromVendorId_productId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceTypeFromVendorId:productId:");
}

id objc_msgSend_deviceWithAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithAddress:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDiscoverDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didDiscoverDevice");
}

id objc_msgSend_didDiscoverDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didDiscoverDevice:");
}

id objc_msgSend_didEndDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEndDiscovery");
}

id objc_msgSend_didEndDiscoveryWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEndDiscoveryWithError:");
}

id objc_msgSend_didLoseDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didLoseDevice");
}

id objc_msgSend_didLoseDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didLoseDevice:");
}

id objc_msgSend_didStartDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didStartDiscovery");
}

id objc_msgSend_discovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discovery");
}

id objc_msgSend_discoveryCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryCoordinator");
}

id objc_msgSend_discoveryEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryEndDate");
}

id objc_msgSend_discoveryFactory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryFactory");
}

id objc_msgSend_discoveryRequestedStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryRequestedStart:");
}

id objc_msgSend_discoveryRequestedStop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryRequestedStop:");
}

id objc_msgSend_discoveryTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryTimer");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithMessage:");
}

id objc_msgSend_fade(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fade");
}

id objc_msgSend_fadeDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fadeDuration");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithNoResult");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fm_MACAddressString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_MACAddressString");
}

id objc_msgSend_fm_hexString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_hexString");
}

id objc_msgSend_fm_preferencesPathURLForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_preferencesPathURLForDomain:");
}

id objc_msgSend_fm_safeAddObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_safeAddObject:");
}

id objc_msgSend_fm_safelySetObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_safelySetObject:forKey:");
}

id objc_msgSend_fm_sha256Hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fm_sha256Hash");
}

id objc_msgSend_futureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureSession");
}

id objc_msgSend_getAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAccessoryManager");
}

id objc_msgSend_getVolume_forCategory_route_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVolume:forCategory:route:");
}

id objc_msgSend_getVolumeForRoute_forCategory_mode_route_deviceIdentifier_andRouteSubtype_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVolumeForRoute:forCategory:mode:route:deviceIdentifier:andRouteSubtype:");
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAttemptedLoad");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_helperConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "helperConfiguration");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_inEarDetectEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEarDetectEnabled");
}

id objc_msgSend_inEarStatusPrimary_secondary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEarStatusPrimary:secondary:");
}

id objc_msgSend_initWithAccessoryId_audioRoutingIdentifier_audioURL_audioAccessoryInfo_supportsChangingListeningMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryId:audioRoutingIdentifier:audioURL:audioAccessoryInfo:supportsChangingListeningMode:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfiguration_exportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:exportedObject:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDiscovery:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithQueue_timeout_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:timeout:completion:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initializeNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeNotifications");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateStopSoundTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateStopSoundTimer");
}

id objc_msgSend_isAccessoryBeingMonitored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessoryBeingMonitored:");
}

id objc_msgSend_isAutomationActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomationActive");
}

id objc_msgSend_isDiscoveryActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDiscoveryActive");
}

id objc_msgSend_isDiscoveryActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDiscoveryActive:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isSoundPlaying(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSoundPlaying");
}

id objc_msgSend_isTemporaryPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTemporaryPaired");
}

id objc_msgSend_lastAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastAccessory");
}

id objc_msgSend_leewayTimeInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leewayTimeInterval");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningMode");
}

id objc_msgSend_listeningModeForAccessory_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningModeForAccessory:timeout:");
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDevice");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_monitoredAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitoredAccessories");
}

id objc_msgSend_monitoredAccessoriesCompletionBlocks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitoredAccessoriesCompletionBlocks");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newDiscovery");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
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

id objc_msgSend_originalRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalRoute");
}

id objc_msgSend_originalState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalState");
}

id objc_msgSend_pairedAccessoryWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedAccessoryWithID:");
}

id objc_msgSend_pairedAppleAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedAppleAccessories");
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedDevices");
}

id objc_msgSend_pan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pan");
}

id objc_msgSend_panTargetValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panTargetValue");
}

id objc_msgSend_parseStyle_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseStyle:info:");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_performWithActiveSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithActiveSession:");
}

id objc_msgSend_pickRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pickRoute:");
}

id objc_msgSend_pickableRoutesForCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pickableRoutesForCategory:");
}

id objc_msgSend_pickedRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pickedRoute");
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "play");
}

id objc_msgSend_playSound_channels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playSound:channels:");
}

id objc_msgSend_prepareToPlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareToPlay");
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productId");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_rampDownDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rampDownDuration");
}

id objc_msgSend_rampUpDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rampUpDuration");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rawRouteInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawRouteInfo");
}

id objc_msgSend_readDictionaryAndClasses_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDictionaryAndClasses:error:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_restoreListeningMode_forAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreListeningMode:forAccessory:");
}

id objc_msgSend_resumeConnectionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeConnectionWithConfiguration:");
}

id objc_msgSend_routeController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routeController");
}

id objc_msgSend_routeForAccessoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routeForAccessoryIdentifier:");
}

id objc_msgSend_routeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routeID");
}

id objc_msgSend_routeSubType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routeSubType");
}

id objc_msgSend_routeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routeType");
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssi");
}

id objc_msgSend_scanningTimerFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanningTimerFired");
}

id objc_msgSend_serialNumberFromVersionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumberFromVersionInfo:");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_setAccessoryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryId:");
}

id objc_msgSend_setAccessoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryIdentifier:");
}

id objc_msgSend_setAccessoryManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryManager:");
}

id objc_msgSend_setAccessoryProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryProvider:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setActive_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:error:");
}

id objc_msgSend_setActive_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:withOptions:error:");
}

id objc_msgSend_setActiveTokens_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveTokens:");
}

id objc_msgSend_setAdditionalInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalInfo:");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setAdvertisementFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertisementFields:");
}

id objc_msgSend_setAllAudioChannelsActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllAudioChannelsActive:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAudioPlayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioPlayer:");
}

id objc_msgSend_setAutomationHelperBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomationHelperBundle:");
}

id objc_msgSend_setBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothAddress:");
}

id objc_msgSend_setBluetoothDiscoveryQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothDiscoveryQueue:");
}

id objc_msgSend_setBluetoothManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothManager:");
}

id objc_msgSend_setBluetoothSessionInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothSessionInterface:");
}

id objc_msgSend_setBluetoothSessionQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothSessionQueue:");
}

id objc_msgSend_setCategory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:error:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setCurrentlyPicked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentlyPicked:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceDiscoveryId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDiscoveryId:");
}

id objc_msgSend_setDidDiscoverDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidDiscoverDevice:");
}

id objc_msgSend_setDidEndDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidEndDiscovery:");
}

id objc_msgSend_setDidLoseDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidLoseDevice:");
}

id objc_msgSend_setDidStartDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidStartDiscovery:");
}

id objc_msgSend_setDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscovery:");
}

id objc_msgSend_setDiscoveryCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryCoordinator:");
}

id objc_msgSend_setDiscoveryEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryEndDate:");
}

id objc_msgSend_setDiscoveryFactory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryFactory:");
}

id objc_msgSend_setDiscoveryTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryTimer:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setFadeDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFadeDuration:");
}

id objc_msgSend_setFirmwareVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirmwareVersion:");
}

id objc_msgSend_setFutureSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFutureSession:");
}

id objc_msgSend_setHasAttemptedLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasAttemptedLoad:");
}

id objc_msgSend_setHostProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostProxy:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIsDiscoveryActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDiscoveryActive:");
}

id objc_msgSend_setIsSoundPlaying_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsSoundPlaying:");
}

id objc_msgSend_setLastAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastAccessory:");
}

id objc_msgSend_setListeningMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListeningMode:");
}

id objc_msgSend_setLocalDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalDevice:");
}

id objc_msgSend_setMaxVolumeForRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxVolumeForRoute:");
}

id objc_msgSend_setMonitoredAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonitoredAccessories:");
}

id objc_msgSend_setMonitoredAccessoriesCompletionBlocks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonitoredAccessoriesCompletionBlocks:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNumberOfLoops_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLoops:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setOriginalRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalRoute:");
}

id objc_msgSend_setOriginalState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalState:");
}

id objc_msgSend_setPan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPan:");
}

id objc_msgSend_setPanForChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPanForChannels:");
}

id objc_msgSend_setPanTargetValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPanTargetValue:");
}

id objc_msgSend_setPickedRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPickedRoute:");
}

id objc_msgSend_setPickedRouteWithPassword_withPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPickedRouteWithPassword:withPassword:");
}

id objc_msgSend_setPreferredIOBufferDuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredIOBufferDuration:error:");
}

id objc_msgSend_setPreferredSampleRate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredSampleRate:error:");
}

id objc_msgSend_setRampDownDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRampDownDuration:");
}

id objc_msgSend_setRampUpDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRampUpDuration:");
}

id objc_msgSend_setRawRouteInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRawRouteInfo:");
}

id objc_msgSend_setRouteID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRouteID:");
}

id objc_msgSend_setRouteSubType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRouteSubType:");
}

id objc_msgSend_setRouteType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRouteType:");
}

id objc_msgSend_setRssi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssi:");
}

id objc_msgSend_setSerialNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumbers:");
}

id objc_msgSend_setSerialQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialQueue:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSoundTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSoundTransaction:");
}

id objc_msgSend_setStopSoundTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStopSoundTimer:");
}

id objc_msgSend_setTimeoutForDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutForDuration:");
}

id objc_msgSend_setTimerSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimerSource:");
}

id objc_msgSend_setUpAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpAccessoryManager");
}

id objc_msgSend_setUpLocalDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpLocalDevice");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolume:");
}

id objc_msgSend_setVolume_forCategory_route_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolume:forCategory:route:");
}

id objc_msgSend_setVolume_forRoute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolume:forRoute:");
}

id objc_msgSend_setVolumeForRouteTo_forCategory_mode_route_deviceIdentifier_andRouteSubtype_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeForRouteTo:forCategory:mode:route:deviceIdentifier:andRouteSubtype:");
}

id objc_msgSend_setVolumeTargetValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeTargetValue:");
}

id objc_msgSend_setWasSoundPlayed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasSoundPlayed:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupAudioSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAudioSession");
}

id objc_msgSend_setupDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDiscovery");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCache");
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFactory");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_soundController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundController");
}

id objc_msgSend_soundDidStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundDidStop");
}

id objc_msgSend_soundStoppedForAccessoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundStoppedForAccessoryIdentifier:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiscovery");
}

id objc_msgSend_startDiscoveryForDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiscoveryForDuration:");
}

id objc_msgSend_startDiscoveryTimerWithDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiscoveryTimerWithDuration:");
}

id objc_msgSend_startPlayingSoundForAccessory_channels_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPlayingSoundForAccessory:channels:completion:");
}

id objc_msgSend_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion:");
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSession");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopDiscovery");
}

id objc_msgSend_stopMonitoringRoutableAccessory_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringRoutableAccessory:completion:");
}

id objc_msgSend_stopPlayingForAccessory_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopPlayingForAccessory:completion:");
}

id objc_msgSend_stopPlayingForAccessory_rampDownDuration_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopPlayingForAccessory:rampDownDuration:completion:");
}

id objc_msgSend_stopPlayingSoundForAccessory_rampDownDuration_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopPlayingSoundForAccessory:rampDownDuration:completion:");
}

id objc_msgSend_stopSound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSound");
}

id objc_msgSend_stopSoundTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSoundTimer");
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

id objc_msgSend_supportsChangingListeningMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsChangingListeningMode");
}

id objc_msgSend_tearDownAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownAccessoryManager");
}

id objc_msgSend_tearDownLocalDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownLocalDevice");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeout");
}

id objc_msgSend_timerSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerSource");
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_tokenDiscoveryEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenDiscoveryEnded");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updateDisccovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDisccovery");
}

id objc_msgSend_updateListeningMode_accessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateListeningMode:accessory:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_vendorId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorId");
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volume");
}

id objc_msgSend_volumeTargetValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeTargetValue");
}

id objc_msgSend_wasSoundPlayed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasSoundPlayed");
}
