void sub_100007358(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupQRCodeScanner"));

  if (v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupQRCodeScanner"));
    objc_msgSend(v3, "stopScan");

  }
}

void sub_1000073BC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteSetupQRCodeScannerController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007468;
  v7[3] = &unk_1000753E8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupManager"));
  objc_msgSend(v6, "sendAuthPassword:", v4);

}

void sub_100007468(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupQRCodeScanner"));

  if (v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupQRCodeScanner"));
    objc_msgSend(v3, "stopScan");

  }
}

void sub_1000074CC(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupQRCodeScanner"));
  v3 = objc_msgSend(v2, "startScan");

  if ((v3 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000755C;
    block[3] = &unk_1000753E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10000755C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10004517C(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupManager"));
  objc_msgSend(v11, "setupFailed");

}

void sub_100007A08(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupQRCodeScanner"));

  if (v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupQRCodeScanner"));
    objc_msgSend(v3, "stopScan");

  }
}

void sub_100007CB4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteSetupManager"));
  objc_msgSend(v1, "startRemoteSetupBroadcast");

}

void sub_100007CE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007CF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007D64(id a1)
{
  CBUserSettings *v1;
  void *v2;

  v1 = objc_alloc_init(CBUserSettings);
  v2 = (void *)qword_10008BC90;
  qword_10008BC90 = (uint64_t)v1;

}

void sub_10000858C(id a1)
{
  void *v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  unsigned int v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  int v21;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[CBAPTicket sharedInstance](CBAPTicket, "sharedInstance"));
  v2 = objc_msgSend(v1, "isEntitledForTag:", 1633776739);

  v5 = MGGetBoolAnswer(CFSTR("a5BRUxn1QBPXkAnbAHbmeg"), v3, v4);
  v15 = 0;
  v6 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", CFSTR("EnableInfoPaneInCheckerBoard"), &v15);
  v7 = v15;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9 || !objc_msgSend(v7, "length"))
  {
    v12 = 0;
  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = v5 ^ 1 | v2;
    if (!v11)
      v12 = 0;
  }
  byte_10008BCA0 = v12;
  v13 = CheckerBoardLogHandleForCategory(1);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v17 = byte_10008BCA0;
    v18 = 1024;
    v19 = v2;
    v20 = 1024;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Should show info pane: (%d). Entitled: (%d)  Fusing: (%d)", buf, 0x14u);
  }

}

void sub_100008AE0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiSSIDFromNvram"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiPasswordFromNvram"));
    *(_DWORD *)buf = 138412546;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to set wifi to (%@ : %@)", buf, 0x16u);

  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008D6C;
  v18[3] = &unk_1000754C0;
  v18[4] = *(_QWORD *)(a1 + 32);
  v6 = objc_retainBlock(v18);
  v7 = objc_msgSend(*(id *)(a1 + 32), "wifiRequiresPassword");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBShellServer sharedInstance](CBShellServer, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "systemServicesDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiSSIDFromNvram"));
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiPasswordFromNvram"));
    objc_msgSend(v9, "connectToSSID:password:completion:", v10, v11, v6);

  }
  else
  {
    objc_msgSend(v9, "connectToSSID:completion:", v10, v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "setWifiJoinAttemptCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "wifiJoinAttemptCount") + 1);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "wifiJoinAttemptCount") >= 0xB)
  {
    v12 = CheckerBoardLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "wifiJoinAttemptCount");
      *(_DWORD *)buf = 134217984;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempted to connect to wifi %ld times without success. No further attempts will be made", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiReconnectTimer"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiReconnectTimer"));
      objc_msgSend(v16, "invalidate");

      objc_msgSend(*(id *)(a1 + 32), "setWifiReconnectTimer:", 0);
    }
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diagsLaunchDependenciesSemaphore"));
    dispatch_semaphore_signal(v17);

  }
}

void sub_100008D6C(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = CheckerBoardLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connected to wifi network specified in nvram", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiReconnectTimer"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiReconnectTimer"));
      objc_msgSend(v8, "invalidate");

      objc_msgSend(*(id *)(a1 + 32), "setWifiReconnectTimer:", 0);
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diagsLaunchDependenciesSemaphore"));
    dispatch_semaphore_signal(v9);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to connect to wifi network specified in nvram. Setting timer to re-try", v12, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiReconnectTimer"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiReconnectTimer"));
      objc_msgSend(v11, "invalidate");

    }
    v9 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "_attemptConnectingToWifi", 0, 0, 2.0));
    objc_msgSend(*(id *)(a1 + 32), "setWifiReconnectTimer:", v9);
  }

}

void sub_100009374(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  unsigned int v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  unsigned int v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diagsLaunchDependenciesSemaphore"));
  v3 = dispatch_time(0, 20);
  dispatch_semaphore_wait(v2, v3);

  v12 = 0;
  v4 = +[CBSNVRamUtil readNVRamVariable:value:](CBSNVRamUtil, "readNVRamVariable:value:", CFSTR("cb-auto-launch-diags"), &v12);
  v5 = v12;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (objc_msgSend(v5, "length"))
    {
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4);
      v9 = objc_msgSend(v8, "BOOLValue");

      if (v9)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100009490;
        v10[3] = &unk_1000753E8;
        v11 = *(id *)(a1 + 40);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

      }
    }
  }

}

void sub_100009490(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  CBEndgameViewController *v4;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Moving directly to Diagnostics", v5, 2u);
  }

  v4 = objc_alloc_init(CBEndgameViewController);
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v4, 1);

}

void sub_1000098DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000098F8(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "windowManager"));
  objc_msgSend(v1, "windowDidDismiss:", WeakRetained);

}

void sub_100009AEC(id a1)
{
  CBThermalManager *v1;
  void *v2;

  v1 = objc_alloc_init(CBThermalManager);
  v2 = (void *)qword_10008BCB0;
  qword_10008BCB0 = (uint64_t)v1;

}

id sub_100009F3C(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling thermal notification…", v6, 2u);
  }

  return objc_msgSend(a2, "_respondToCurrentThermalCondition");
}

id sub_100009FB0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(10);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Thermal state changed", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_respondToCurrentThermalCondition");
}

void sub_10000A5A0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSRunLoopMode v6;
  uint8_t buf[4];
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "sampling"))
  {
    v2 = CheckerBoardLogHandleForCategory(10);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = 0x4024000000000000;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Let's kill the thermally active application after %f seconds", buf, 0xCu);
    }

    v4 = *(void **)(a1 + 32);
    v6 = NSRunLoopCommonModes;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    objc_msgSend(v4, "performSelector:withObject:afterDelay:inModes:", "_killThermallyActiveApplication", 0, v5, 10.0);

  }
}

id *sub_10000AC68(id *result)
{
  id *v1;
  void *v2;
  double v3;
  CGFloat v4;
  void *v5;
  uint64_t v6;
  id v7;
  double v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  double y;
  double v14;
  double v15;
  CGFloat v16;
  float v17;
  float v18;
  id v19;
  double MidY;
  id v21;
  uint64_t v22;
  id v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  _QWORD v27[2];
  _QWORD v28[2];
  CGRect v29;
  CGRect v30;

  if (result)
  {
    v1 = result;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v2, "scale");
    v4 = v3;

    v27[0] = kCAContextDisplayable;
    v27[1] = kCAContextSecure;
    v28[0] = kCFBooleanTrue;
    v28[1] = kCFBooleanTrue;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    v6 = objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", v5));
    v7 = v1[13];
    v1[13] = (id)v6;

    LODWORD(v8) = 1148846080;
    objc_msgSend(v1[13], "setLevel:", v8);
    objc_msgSend(v1[13], "setSecure:", 1);
    v9 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    v10 = v1[14];
    v1[14] = (id)v9;

    v11 = v1[14];
    CGAffineTransformMakeScale(&v26, v4, v4);
    v12 = objc_msgSend(v11, "setAffineTransform:", &v26);
    y = CGPointZero.y;
    v14 = GSMainScreenPixelSize(v12);
    v16 = v15;
    v17 = GSMainScreenOrientation(objc_msgSend(v1[14], "setFrame:", CGPointZero.x, y, v14, v15));
    if (v17 != 0.0)
    {
      v18 = v17;
      v19 = v1[14];
      v29.origin.x = CGPointZero.x;
      v29.origin.y = y;
      v29.size.width = v14;
      v29.size.height = v16;
      MidY = CGRectGetMidY(v29);
      v30.origin.x = CGPointZero.x;
      v30.origin.y = y;
      v30.size.width = v14;
      v30.size.height = v16;
      objc_msgSend(v19, "setPosition:", MidY, CGRectGetMidX(v30));
      v21 = v1[14];
      if (v21)
        objc_msgSend(v21, "affineTransform");
      else
        memset(&v24, 0, sizeof(v24));
      CGAffineTransformRotate(&v25, &v24, (float)-v18);
      objc_msgSend(v21, "setAffineTransform:", &v25);
    }
    v22 = objc_claimAutoreleasedReturnValue(+[CASecureIndicatorLayer layer](CASecureIndicatorLayer, "layer", *(_OWORD *)&v24.a, *(_OWORD *)&v24.c, *(_OWORD *)&v24.tx));
    v23 = v1[16];
    v1[16] = (id)v22;

    objc_msgSend(v1[16], "setMasksToBounds:", 1);
    objc_msgSend(v1[14], "addSublayer:", v1[16]);
    objc_msgSend(v1[13], "setLayer:", v1[14]);

    return (id *)+[CATransaction commit](CATransaction, "commit");
  }
  return result;
}

void sub_10000AF3C(uint64_t a1)
{
  char v2;
  int *v3;
  double v4;
  int *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  char *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  CGFloat MidX;
  CGFloat MidY;
  void *v32;
  void *v33;
  CGRect v34;
  CGRect v35;

  if (a1)
  {
    *(_QWORD *)(a1 + 64) = 0;
    *(_QWORD *)(a1 + 72) = 0xC049000000000000;
    *(_QWORD *)(a1 + 80) = 0xC049000000000000;
    switch(sub_100036F10())
    {
      case 0:
      case 1:
      case 2:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v7, "scale");
        v9 = fabs(v8 + -2.0);

        v2 = 0;
        v10 = 10.0;
        if (v9 > 2.22044605e-16)
          v10 = 13.0;
        *(double *)(a1 + 64) = v10;
        goto LABEL_12;
      case 3:
      case 4:
      case 6:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4030000000000000;
        v6 = 18.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v4 = 212.0;
        goto LABEL_24;
      case 5:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4030000000000000;
        v6 = 18.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v4 = 268.0;
        goto LABEL_24;
      case 7:
      case 8:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4028000000000000;
        v6 = 12.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v4 = 157.0;
        goto LABEL_24;
      case 9:
      case 10:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4032000000000000;
        v6 = 19.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        *(double *)&v11 = 176.0;
        goto LABEL_17;
      case 11:
      case 12:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4032000000000000;
        v6 = 19.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        *(double *)&v11 = 232.0;
LABEL_17:
        v4 = *(double *)&v11;
        goto LABEL_24;
      case 13:
      case 14:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4032000000000000;
        v6 = 18.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v4 = 289.0;
        goto LABEL_24;
      case 15:
      case 16:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4032000000000000;
        v6 = 19.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v4 = 252.0;
        goto LABEL_24;
      case 17:
      case 18:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4032000000000000;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v4 = 18.0;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v6 = 306.0;
        goto LABEL_24;
      case 19:
      case 20:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4032000000000000;
        v6 = 18.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v4 = 363.0;
        goto LABEL_24;
      case 21:
      case 22:
      case 25:
      case 26:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4031000000000000;
        v6 = 31.0;
        goto LABEL_8;
      case 23:
      case 24:
      case 27:
      case 28:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x4031000000000000;
        v6 = 28.0;
LABEL_8:
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v4 = 79.0;
        goto LABEL_24;
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x402C000000000000;
LABEL_12:
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v4 = 3.0;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v6 = 3.0;
        goto LABEL_24;
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
        v2 = 0;
        *(_QWORD *)(a1 + 64) = 0x402C000000000000;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v4 = 16.0;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        v6 = 16.0;
        goto LABEL_24;
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
        *(_QWORD *)(a1 + 64) = 0x4028000000000000;
        v2 = 1;
        v6 = 18.0;
        v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        v4 = 31.0;
        v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
LABEL_24:
        *(double *)(a1 + *v5) = v4;
        *(double *)(a1 + *v3) = v6;
        break;
      default:
        v2 = 0;
        break;
    }
    v12 = (char *)objc_msgSend((id)a1, "location");
    if (v12 == (char *)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v13, "scale");
      v15 = fabs(v14 + -2.0);

      if (v15 <= 2.22044605e-16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v18 = objc_msgSend(v17, "userInterfaceIdiom");

        if (v18 == (id)1)
          v16 = 0x402E000000000000;
        else
          v16 = 0x402A000000000000;
      }
      else
      {
        v16 = 0x4032000000000000;
      }
      *(_QWORD *)(a1 + 64) = v16;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v19, "scale");
    v21 = v20;

    v22 = v21;
    if ((v2 & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v23, "nativeScale");
      v22 = v24;

    }
    *(double *)(a1 + 64) = UIRoundToScale(*(double *)(a1 + 64) / v22, v21);
    *(double *)(a1 + 72) = UIRoundToScale(*(double *)(a1 + 72) / v22, v21);
    *(double *)(a1 + 80) = UIRoundToScale(*(double *)(a1 + 80) / v22, v21);
    if ((unint64_t)(v12 - 1) <= 1)
    {
      *(_QWORD *)(a1 + 72) = 0xC059000000000000;
      *(_QWORD *)(a1 + 80) = 0xC059000000000000;
    }
    if (objc_msgSend(UIApp, "userInterfaceLayoutDirection") == (id)1)
    {
      v25 = *(double *)(a1 + 72);
      v26 = *(double *)(a1 + 64);
      v27 = *(double *)(a1 + 80);
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v28, "bounds");
      v26 = *(double *)(a1 + 64);
      v25 = v29 - v26 - *(double *)(a1 + 72);
      v27 = *(double *)(a1 + 80);

    }
    v34.origin.x = v25;
    v34.origin.y = v27;
    v34.size.width = v26;
    v34.size.height = v26;
    MidX = CGRectGetMidX(v34);
    v35.origin.x = v25;
    v35.origin.y = v27;
    v35.size.width = v26;
    v35.size.height = v26;
    MidY = CGRectGetMidY(v35);
    *(CGFloat *)(a1 + 88) = MidX;
    *(CGFloat *)(a1 + 96) = MidY;
    sub_10000B93C((id *)a1, v25, v27, v26, v26, *(double *)(a1 + 88), *(double *)(a1 + 96));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1, "indicatorContainerView"));
    objc_msgSend(v32, "setFrame:", v25, v27, v26, v26);

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1, "indicatorView"));
    objc_msgSend(v33, "setFrame:", v25, v27, v26, v26);

    if (v12 != (char *)1)
    {
      sub_10000BA28((id *)a1, 0.0, 0.0);
      sub_10000BB10(a1, 0.0, 0.0);
    }
  }
}

void sub_10000B554(_QWORD *a1, uint64_t a2)
{
  id v4;

  if (a1)
  {
    if (a1[20] != a2)
    {
      a1[20] = a2;
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "delegate"));
      objc_msgSend(v4, "recordingIndicatorViewController:didUpdateIndicatorState:", a1, a2);

    }
  }
}

void sub_10000B664(uint64_t a1, uint64_t a2, double a3)
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28[2];
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;

  if (a1 && *(_QWORD *)(a1 + 168) != a2)
  {
    *(_QWORD *)(a1 + 168) = a2;
    if (a3 <= 0.0 || *(_BYTE *)(a1 + 120) == 0)
    {
      sub_10000BD58((char *)a1, a2);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBRecordingIndicatorDomain rootSettings](CBRecordingIndicatorDomain, "rootSettings"));
      if (BSFloatGreaterThanOrEqualToFloat(a3, 0.6))
      {
        objc_msgSend(v6, "delayBeforeFadeOut180");
        v8 = v7;
        objc_msgSend(v6, "fadeOutDuration180");
        v10 = v9;
        objc_msgSend(v6, "delayBeforeFadeIn180");
        v12 = v11;
        objc_msgSend(v6, "fadeInDuration180");
      }
      else
      {
        objc_msgSend(v6, "delayBeforeFadeOut90");
        v8 = v14;
        objc_msgSend(v6, "fadeOutDuration90");
        v10 = v15;
        objc_msgSend(v6, "delayBeforeFadeIn90");
        v12 = v16;
        objc_msgSend(v6, "fadeInDuration90");
      }
      v17 = v13;
      objc_initWeak(&location, (id)a1);
      v18 = objc_alloc((Class)UIViewPropertyAnimator);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000BC3C;
      v31[3] = &unk_100075510;
      objc_copyWeak(&v32, &location);
      v19 = objc_msgSend(v18, "initWithDuration:curve:animations:", 0, v31, v10);
      v20 = objc_alloc((Class)UIViewPropertyAnimator);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10000BCA0;
      v29[3] = &unk_100075510;
      objc_copyWeak(&v30, &location);
      v21 = objc_msgSend(v20, "initWithDuration:curve:animations:", 0, v29, v17);
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_10000BD04;
      v26 = &unk_1000755B0;
      objc_copyWeak(v28, &location);
      v22 = v21;
      v27 = v22;
      v28[1] = v12;
      objc_msgSend(v19, "addCompletion:", &v23);
      objc_msgSend(v19, "startAnimationAfterDelay:", v8, v23, v24, v25, v26);

      objc_destroyWeak(v28);
      objc_destroyWeak(&v30);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);

    }
  }
}

void sub_10000B8F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 120));
  _Unwind_Resume(a1);
}

void sub_10000B934()
{
  JUMPOUT(0x10000B924);
}

id *sub_10000B93C(id *result, double a2, double a3, double a4, double a5, double a6, double a7)
{
  id *v13;
  void *v14;
  _BOOL4 v15;
  double v16;

  if (result)
  {
    v13 = result;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indicatorView"));
    v15 = sub_10001CB60((unint64_t)objc_msgSend(v14, "indicatorType"));

    v16 = a4 * 0.5;
    if (!v15)
      v16 = 0.0;
    objc_msgSend(v13[16], "setCornerRadius:", v16);
    objc_msgSend(v13[16], "setBounds:", a2, a3, a4, a5);
    objc_msgSend(v13[16], "setPosition:", a6, a7);
    return (id *)+[CATransaction commit](CATransaction, "commit");
  }
  return result;
}

id *sub_10000BA28(id *result, double a2, double a3)
{
  id *v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  double v9;

  if (result)
  {
    v5 = result;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indicatorView"));
    v7 = sub_10001CB60((unint64_t)objc_msgSend(v6, "indicatorType"));

    v8 = a2 * 0.5;
    if (!v7)
      v8 = 0.0;
    objc_msgSend(v5[16], "setCornerRadius:", v8);
    objc_msgSend(v5[16], "frame");
    objc_msgSend(v5[16], "setFrame:");
    objc_msgSend(v5[16], "setPosition:", *((double *)v5 + 11), *((double *)v5 + 12));
    *(float *)&v9 = a3;
    objc_msgSend(v5[16], "setOpacity:", v9);
    return (id *)+[CATransaction commit](CATransaction, "commit");
  }
  return result;
}

void sub_10000BB10(uint64_t a1, double a2, double a3)
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  if (a1)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1, "indicatorView"));
    objc_msgSend(v18, "setBounds:", 0.0, 0.0, a2, a2);
    objc_msgSend(v18, "setAlpha:", a3);
    v6 = objc_msgSend((id)a1, "location") == (id)2 || *(_BYTE *)(a1 + 120) && !objc_msgSend((id)a1, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1, "indicatorContainerView"));
    v8 = v7;
    if (v6 && v7)
    {
      objc_msgSend(v7, "center");
      v10 = v9;
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
      objc_msgSend(v8, "convertPoint:fromView:", v13, v10, v12);
      v15 = v14;
      v17 = v16;

    }
    else
    {
      v15 = *(double *)(a1 + 88);
      v17 = *(double *)(a1 + 96);
    }
    objc_msgSend(v18, "setCenter:", v15, v17);

  }
}

void sub_10000BC3C(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  double v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    objc_msgSend(v2, "setAlpha:", 0.0);

    LODWORD(v3) = 0;
    objc_msgSend(v4[14], "setOpacity:", v3);
    WeakRetained = v4;
  }

}

void sub_10000BCA0(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  double v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    objc_msgSend(v2, "setAlpha:", 1.0);

    LODWORD(v3) = 1.0;
    objc_msgSend(v4[14], "setOpacity:", v3);
    WeakRetained = v4;
  }

}

void sub_10000BD04(uint64_t a1)
{
  uint64_t *WeakRetained;
  uint64_t *v3;

  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    sub_10000BD58((char *)WeakRetained, WeakRetained[21]);
    objc_msgSend(*(id *)(a1 + 32), "startAnimationAfterDelay:", *(double *)(a1 + 48));
    WeakRetained = v3;
  }

}

char *sub_10000BD58(char *result, uint64_t a2)
{
  char *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  double v13;
  uint64_t v14;
  CGFloat MidX;
  CGFloat MidY;
  void *v17;
  CGRect v18;
  CGRect v19;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "_referenceBounds");
    v6 = v5;
    v8 = v7;

    switch(a2)
    {
      case 4:
        v12 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
        v10 = *((double *)v3 + 10);
        v9 = *((double *)v3 + 8);
        if (v12 == (id)1)
          v10 = v6 - v10 - v9;
        v14 = 72;
        break;
      case 3:
        v11 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
        v10 = *((double *)v3 + 10);
        v9 = *((double *)v3 + 8);
        if (v11 != (id)1)
          v10 = v6 - v10 - v9;
        v13 = v8 - *((double *)v3 + 9) - v9;
        goto LABEL_21;
      case 2:
        if (objc_msgSend(UIApp, "userInterfaceLayoutDirection") == (id)1)
        {
          v9 = *((double *)v3 + 8);
          v10 = v6 - v9 - *((double *)v3 + 9);
        }
        else
        {
          v10 = *((double *)v3 + 9);
          v9 = *((double *)v3 + 8);
        }
        v13 = v8 - v9 - *((double *)v3 + 10);
        goto LABEL_21;
      default:
        if (objc_msgSend(UIApp, "userInterfaceLayoutDirection") == (id)1)
        {
          v10 = *((double *)v3 + 9);
          v9 = *((double *)v3 + 8);
        }
        else
        {
          v9 = *((double *)v3 + 8);
          v10 = v6 - v9 - *((double *)v3 + 9);
        }
        v14 = 80;
        break;
    }
    v13 = *(double *)&v3[v14];
LABEL_21:
    v18.origin.x = v10;
    v18.origin.y = v13;
    v18.size.width = v9;
    v18.size.height = v9;
    MidX = CGRectGetMidX(v18);
    v19.origin.x = v10;
    v19.origin.y = v13;
    v19.size.width = v9;
    v19.size.height = v9;
    MidY = CGRectGetMidY(v19);
    *((CGFloat *)v3 + 11) = MidX;
    *((CGFloat *)v3 + 12) = MidY;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    objc_msgSend(*((id *)v3 + 16), "setPosition:", *((double *)v3 + 11), *((double *)v3 + 12));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indicatorView"));
    objc_msgSend(v17, "setCenter:", *((double *)v3 + 11), *((double *)v3 + 12));

    return (char *)+[CATransaction commit](CATransaction, "commit");
  }
  return result;
}

void sub_10000C324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C350(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  id *v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  __CFString *v36;

  if (a1)
  {
    v4 = CheckerBoardLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v6 = CFSTR("on");
      else
        v6 = CFSTR("off");
      v7 = objc_msgSend((id)a1, "location");
      v8 = CFSTR("Standalone");
      if (v7 == (id)1)
        v8 = CFSTR("StatusBar");
      if (v7 == (id)2)
        v8 = CFSTR("SystemAperture");
      v9 = v8;
      *(_DWORD *)buf = 138543618;
      v34 = v6;
      v35 = 2114;
      v36 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (spring animation)", buf, 0x16u);

    }
    sub_10000C7B0((id *)a1);
    objc_initWeak((id *)buf, (id)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1, "indicatorView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
    if (a2)
    {
      if (!*(_BYTE *)(a1 + 120))
      {
        sub_10000CE14(a1, v11, 6.0);
        sub_10000CF34(a1, v11, CFSTR("filters.gaussianBlur.inputRadius"), &off_100078E30, &off_100078E40, 1, 0.8);
      }
      v12 = objc_alloc((Class)UIViewPropertyAnimator);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000CFF4;
      v31[3] = &unk_100075628;
      v13 = &v32;
      objc_copyWeak(&v32, (id *)buf);
      v31[4] = a1;
      v14 = objc_msgSend(v12, "initWithDuration:dampingRatio:animations:", v31, 1.9, 0.35);
      v15 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v14;

      v16 = *(void **)(a1 + 48);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10000D044;
      v29[3] = &unk_1000755D8;
      v17 = &v30;
      objc_copyWeak(&v30, (id *)buf);
      objc_msgSend(v16, "addCompletion:", v29);
      sub_10000B554((_QWORD *)a1, 1);
      objc_msgSend(*(id *)(a1 + 48), "startAnimation");
    }
    else
    {
      if (!*(_BYTE *)(a1 + 120))
      {
        sub_10000CE14(a1, v11, 0.0);
        sub_10000CF34(a1, v11, CFSTR("filters.gaussianBlur.inputRadius"), &off_100078E50, &off_100078E60, 0, 1.0);
      }
      v18 = objc_alloc((Class)UIViewPropertyAnimator);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10000D084;
      v27[3] = &unk_100075628;
      v13 = &v28;
      objc_copyWeak(&v28, (id *)buf);
      v27[4] = a1;
      v19 = objc_msgSend(v18, "initWithDuration:dampingRatio:animations:", v27, 1.5, 1.02);
      v20 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v19;

      v21 = *(void **)(a1 + 56);
      v22 = _NSConcreteStackBlock;
      v23 = 3221225472;
      v24 = sub_10000D0DC;
      v25 = &unk_1000755D8;
      v17 = &v26;
      objc_copyWeak(&v26, (id *)buf);
      objc_msgSend(v21, "addCompletion:", &v22);
      sub_10000B554((_QWORD *)a1, 3);
      objc_msgSend(*(id *)(a1 + 56), "startAnimation", v22, v23, v24, v25);
    }
    objc_destroyWeak(v17);
    objc_destroyWeak(v13);

    objc_destroyWeak((id *)buf);
  }
}

void sub_10000C72C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

id *sub_10000C7B0(id *result)
{
  id *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result[1], "stopAnimation:", 1);
    objc_msgSend(v1[2], "stopAnimation:", 1);
    objc_msgSend(v1[3], "stopAnimation:", 1);
    objc_msgSend(v1[4], "stopAnimation:", 1);
    objc_msgSend(v1[5], "stopAnimation:", 1);
    objc_msgSend(v1[6], "stopAnimation:", 1);
    return (id *)objc_msgSend(v1[7], "stopAnimation:", 1);
  }
  return result;
}

void sub_10000C85C(uint64_t a1)
{
  double *WeakRetained;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  sub_10000BB10((uint64_t)WeakRetained, WeakRetained[8] * 1.2, 1.0);

}

void sub_10000CBFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_10000CC40(uint64_t a1)
{
  uint64_t v1;
  double v2;
  double v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(double *)(v1 + 64);
    v3 = 0.8;
    if (*(_BYTE *)(v1 + 120))
      v3 = 1.0;
    else
      v2 = v2 * 0.8;
  }
  else
  {
    v2 = 0.0;
    v3 = 0.0;
  }
  sub_10000BB10(v1, v2, v3);
}

void sub_10000CC8C(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  id v3;
  _QWORD *v4;
  double v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  unsigned __int8 *v13;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "location");
    v4 = v13;
    if (v3 != (id)2)
    {
      if (v3)
      {
        v6 = v13[120] == 0;
        v5 = *((double *)v13 + 8);
        if (v13[120])
        {
LABEL_8:
          v7 = 1.0;
          if (v6)
            v7 = 0.8;
          sub_10000BA28((id *)v13, v5, v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "traitCollection"));
          v9 = objc_msgSend(v8, "_backlightLuminance");

          if (v9 == (id)1 && (v10 = *(_QWORD *)(a1 + 32)) != 0)
          {
            if (*(_BYTE *)(v10 + 120))
              v11 = 1.0;
            else
              v11 = 0.8;
          }
          else
          {
            v11 = 0.0;
          }
          v12 = *((double *)v13 + 8);
          if (!v13[120])
            v12 = v12 * 0.8;
          sub_10000BB10((uint64_t)v13, v12, v11);
          v4 = v13;
          goto LABEL_19;
        }
LABEL_7:
        v5 = v5 * 0.8;
        goto LABEL_8;
      }
      if (!v13[120])
      {
        v5 = *((double *)v13 + 8);
        v6 = 1;
        goto LABEL_7;
      }
    }
LABEL_19:
    sub_10000B554(v4, 2);
    WeakRetained = v13;
  }

}

void sub_10000CDD4(uint64_t a1)
{
  sub_10000BB10(*(_QWORD *)(a1 + 32), 0.0, 0.0);
}

void sub_10000CDE4(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_10000B554(WeakRetained, 0);

}

void sub_10000CE14(uint64_t a1, void *a2, double a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v4 = kCAFilterGaussianBlur;
    v5 = a2;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v4));
    objc_msgSend(v6, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v6, "setValue:forKey:", CFSTR("high"), CFSTR("inputQuality"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("inputRadius"));

    v9 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "setFilters:", v8);

  }
}

void sub_10000CF34(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6, double a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a2;
  v13 = a3;
  v14 = a5;
  if (a1)
  {
    v15 = sub_10000D11C(a1, (uint64_t)v13, a4, v14, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v17, "addAnimation:forKey:", v16, v13);
    if (a6)
      objc_msgSend(v17, "setValue:forKeyPath:", v14, v13);

  }
}

void sub_10000CFF4(uint64_t a1)
{
  double *WeakRetained;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  sub_10000BB10(*(_QWORD *)(a1 + 32), WeakRetained[8], 1.0);

}

void sub_10000D044(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "indicatorState") == (id)1)
    sub_10000B554(WeakRetained, 2);

}

void sub_10000D084(uint64_t a1)
{
  double *WeakRetained;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  sub_10000BB10(*(_QWORD *)(a1 + 32), WeakRetained[8] * 0.5, 0.0);

}

void sub_10000D0DC(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "indicatorState") == (id)3)
    sub_10000B554(WeakRetained, 0);

}

id sub_10000D11C(uint64_t a1, uint64_t a2, void *a3, void *a4, double a5)
{
  id v8;
  id v9;
  void *v10;

  if (a1)
  {
    v8 = a4;
    v9 = a3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", a2));
    objc_msgSend(v10, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(v10, "setFillMode:", kCAFillModeBackwards);
    objc_msgSend(v10, "setFromValue:", v9);

    objc_msgSend(v10, "setToValue:", v8);
    objc_msgSend(v10, "setMass:", 2.0);
    objc_msgSend(v10, "setStiffness:", 300.0);
    objc_msgSend(v10, "setDamping:", 50.0);
    objc_msgSend(v10, "setDuration:", a5);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

void sub_10000D204(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  double v8;
  id v9;

  if (a1)
  {
    if (objc_msgSend(a1, "indicatorState") == (id)2)
    {
      v6 = objc_msgSend(a1, "location");
      if (v6 != (id)2 && (v6 || !a1[120]) && (a2 == 1 || a3 == 1))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "indicatorView"));
        v8 = 0.0;
        if (a2 == 1)
        {
          v8 = 0.8;
          if (a1[120])
            v8 = 1.0;
        }
        v9 = v7;
        objc_msgSend(v7, "setAlpha:", v8);

      }
    }
  }
}

void sub_10000D560(id a1)
{
  CBStatusBarStateAggregator *v1;
  void *v2;

  v1 = objc_alloc_init(CBStatusBarStateAggregator);
  v2 = (void *)qword_10008BCC0;
  qword_10008BCC0 = (uint64_t)v1;

}

id sub_10000DCC4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateLockItem");
}

void sub_10000DE80(id a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_alloc_init((Class)NSDateFormatter);
  v2 = (void *)qword_10008BCD0;
  qword_10008BCD0 = (uint64_t)v1;

  v3 = (void *)qword_10008BCD0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend((id)qword_10008BCD0, "setDateStyle:", 0);
  _objc_msgSend((id)qword_10008BCD0, "setTimeStyle:", 1);
}

id sub_10000DF70(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_timeItemDateFormatter"));
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)qword_10008BCE0;
  qword_10008BCE0 = (uint64_t)v2;

  return _objc_msgSend((id)qword_10008BCE0, "setLocalizedDateFormatFromTemplate:", CFSTR("Jmm"));
}

void sub_10000E4F4(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSNumberFormatter);
  v2 = (void *)qword_10008BCF0;
  qword_10008BCF0 = (uint64_t)v1;

  objc_msgSend((id)qword_10008BCF0, "setNumberStyle:", 3);
  _objc_msgSend((id)qword_10008BCF0, "_setUsesCharacterDirection:", 1);
}

void sub_10000E6FC(id a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = CheckerBoardLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Battery Saver Mode changed", v4, 2u);
  }

}

const __CFString *sub_10000F938(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("invalid");
  else
    return off_1000756E8[a1];
}

id sub_10000FB74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sensor");
}

id sub_10000FC24(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)CBSensorActivityAttribution;
  return objc_msgSendSuper2(&v2, "hash");
}

void sub_10000FE10(uint64_t a1)
{
  void *v1;
  const __CFString *v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = sub_10000F938((unint64_t)objc_msgSend(*(id *)(a1 + 40), "sensor"));
  v4 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend(v1, "appendObject:withName:", v4, CFSTR("sensor"));

}

void sub_100010CB8(id a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (!a2)
  {
    v7 = v2;
    v8 = v3;
    +[CBSystem checkoutAndReboot:userInitiated:](CBSystem, "checkoutAndReboot:userInitiated:", 1, 1);
    v4 = CheckerBoardLogHandleForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Exit Diagnostics] button was tapped. Checking out now…", v6, 2u);
    }

  }
}

void sub_100010EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010F00(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTappedLanguageSelectorButton");

}

uint64_t sub_1000110D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  char v5;

  v2 = 0;
  do
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 16))(a1, v2, &v5);
    if (v5)
      break;
  }
  while (v2++ != 43);
  return result;
}

uint64_t sub_100011130(unint64_t a1)
{
  return (a1 < 0x22) & (0x3E0000007uLL >> a1);
}

BOOL sub_10001114C(uint64_t a1)
{
  return (unint64_t)(a1 - 29) < 0xF;
}

BOOL sub_10001115C(unint64_t a1)
{
  return a1 < 0x1D;
}

unint64_t sub_100011168@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v2 = 2;
  v3 = 1;
  if (((1 << result) & 0x3E0000007) == 0)
    v3 = 2;
  if (result <= 0x21)
    v2 = v3;
  *(_QWORD *)(a2 + 32) = v2;
  switch(result)
  {
    case 0uLL:
      *(_OWORD *)a2 = xmmword_1000558C0;
      v5 = 0x4000000000000000;
      v6 = 568;
      goto LABEL_53;
    case 1uLL:
      *(_OWORD *)a2 = xmmword_1000558D0;
      v5 = 0x4000000000000000;
      v6 = 569;
      goto LABEL_53;
    case 2uLL:
      *(_OWORD *)a2 = xmmword_1000558E0;
      v5 = 0x4008000000000000;
      v6 = 570;
      goto LABEL_53;
    case 3uLL:
      v9 = xmmword_100055900;
      goto LABEL_22;
    case 4uLL:
      v9 = xmmword_1000558F0;
LABEL_22:
      *(_OWORD *)a2 = v9;
      v5 = 0x4008000000000000;
      v6 = 2436;
      goto LABEL_53;
    case 5uLL:
      v10 = xmmword_100055920;
      goto LABEL_25;
    case 6uLL:
      v10 = xmmword_100055900;
LABEL_25:
      *(_OWORD *)a2 = v10;
      v5 = 0x4008000000000000;
      v6 = 2688;
      goto LABEL_53;
    case 7uLL:
      v11 = xmmword_100055920;
      goto LABEL_28;
    case 8uLL:
      v11 = xmmword_100055900;
LABEL_28:
      *(_OWORD *)a2 = v11;
      v5 = 0x4000000000000000;
      v6 = 1792;
      goto LABEL_53;
    case 9uLL:
    case 0xFuLL:
      v4 = xmmword_100055900;
      goto LABEL_9;
    case 0xAuLL:
    case 0x10uLL:
      v4 = xmmword_1000558F0;
LABEL_9:
      *(_OWORD *)a2 = v4;
      v5 = 0x4008000000000000;
      v6 = 2340;
      goto LABEL_53;
    case 0xBuLL:
    case 0x11uLL:
      v7 = xmmword_100055910;
      goto LABEL_12;
    case 0xCuLL:
    case 0x12uLL:
      v7 = xmmword_1000558F0;
LABEL_12:
      *(_OWORD *)a2 = v7;
      v5 = 0x4008000000000000;
      v6 = 2532;
      goto LABEL_53;
    case 0xDuLL:
    case 0x13uLL:
      v8 = xmmword_100055930;
      goto LABEL_15;
    case 0xEuLL:
    case 0x14uLL:
      v8 = xmmword_100055900;
LABEL_15:
      *(_OWORD *)a2 = v8;
      v5 = 0x4008000000000000;
      v6 = 2778;
      goto LABEL_53;
    case 0x15uLL:
      v12 = xmmword_100055940;
      goto LABEL_31;
    case 0x16uLL:
      v12 = xmmword_1000558F0;
LABEL_31:
      *(_OWORD *)a2 = v12;
      v5 = 0x4008000000000000;
      v6 = 2556;
      goto LABEL_53;
    case 0x17uLL:
      v13 = xmmword_100055950;
      goto LABEL_34;
    case 0x18uLL:
      v13 = xmmword_100055900;
LABEL_34:
      *(_OWORD *)a2 = v13;
      v5 = 0x4008000000000000;
      v6 = 2796;
      goto LABEL_53;
    case 0x19uLL:
      v14 = xmmword_100055960;
      goto LABEL_37;
    case 0x1AuLL:
      v14 = xmmword_1000558F0;
LABEL_37:
      *(_OWORD *)a2 = v14;
      v5 = 0x4008000000000000;
      v6 = 2622;
      goto LABEL_53;
    case 0x1BuLL:
      v15 = xmmword_100055970;
      goto LABEL_40;
    case 0x1CuLL:
      v15 = xmmword_100055900;
LABEL_40:
      *(_OWORD *)a2 = v15;
      v5 = 0x4008000000000000;
      v6 = 2868;
      goto LABEL_53;
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x26uLL:
      *(_OWORD *)a2 = xmmword_100055980;
      *(_QWORD *)(a2 + 16) = 0x4000000000000000;
      return result;
    case 0x1FuLL:
      *(_OWORD *)a2 = xmmword_100055990;
      v5 = 0x4000000000000000;
      v6 = 2160;
      goto LABEL_53;
    case 0x20uLL:
      *(_OWORD *)a2 = xmmword_1000559A0;
      v5 = 0x4000000000000000;
      v6 = 2224;
      goto LABEL_53;
    case 0x21uLL:
    case 0x25uLL:
      *(_OWORD *)a2 = xmmword_1000559B0;
      v5 = 0x4000000000000000;
      v6 = 2732;
      goto LABEL_53;
    case 0x22uLL:
      *(_OWORD *)a2 = xmmword_1000559C0;
      v5 = 0x4000000000000000;
      v6 = 2266;
      goto LABEL_53;
    case 0x23uLL:
      *(_OWORD *)a2 = xmmword_1000559F0;
      v5 = 0x4000000000000000;
      v6 = 2360;
      goto LABEL_53;
    case 0x24uLL:
      *(_OWORD *)a2 = xmmword_100055A00;
      v5 = 0x4000000000000000;
      v6 = 2388;
      goto LABEL_53;
    case 0x27uLL:
      v16 = xmmword_100055A10;
      goto LABEL_48;
    case 0x28uLL:
      v16 = xmmword_100055A20;
LABEL_48:
      *(_OWORD *)a2 = v16;
      v5 = 0x4000000000000000;
      v6 = 2420;
      goto LABEL_53;
    case 0x29uLL:
      v17 = xmmword_100055A40;
      goto LABEL_52;
    case 0x2AuLL:
      v17 = xmmword_1000559E0;
      goto LABEL_52;
    case 0x2BuLL:
      v17 = xmmword_100055A50;
LABEL_52:
      *(_OWORD *)a2 = v17;
      v5 = 0x4000000000000000;
      v6 = 2752;
LABEL_53:
      *(_QWORD *)(a2 + 16) = v5;
      *(_QWORD *)(a2 + 24) = v6;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000114F8(uint64_t a1, uint64_t a2)
{
  _BOOL4 v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  v3 = *(double *)(a1 + 16) == *(double *)(a2 + 16);
  if (*(double *)a1 != *(double *)a2)
    v3 = 0;
  result = *(double *)(a1 + 8) == *(double *)(a2 + 8) && v3;
  v5 = *(_QWORD *)(a1 + 24);
  if (v5)
  {
    v6 = *(_QWORD *)(a2 + 24);
    if (v6)
      v7 = v5 == v6;
    else
      v7 = 1;
    if (v7)
      result = result;
    else
      result = 0;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 != -1)
  {
    v9 = *(_QWORD *)(a2 + 32);
    v10 = ((v8 != 2) ^ (v9 == 2)) & result;
    if (v9 == -1)
      return result;
    else
      return v10;
  }
  return result;
}

void sub_1000115B0(id a1)
{
  CBRemoteSetupManager *v1;
  void *v2;

  v1 = objc_alloc_init(CBRemoteSetupManager);
  v2 = (void *)qword_10008BD00;
  qword_10008BD00 = (uint64_t)v1;

}

void sub_100011950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011980(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleSetupEvent:", v3);

}

id sub_100011AB4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startRemoteSetupBroadcast");
}

id sub_1000126D4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Network is not reachable. Failing remote setup.", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "setupFailed");
}

void sub_100013A98(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id *v4;
  id v5;
  void *v6;
  id WeakRetained;
  uint8_t v8[16];

  v2 = CheckerBoardLogHandleForCategory(8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Wi-Fi network scan completed notification sent", v8, 2u);
  }

  v4 = (id *)(a1 + 32);
  v5 = objc_loadWeakRetained(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "wifiManager"));
  objc_msgSend(v5, "enableContinueButton:", objc_msgSend(v6, "isAssociatedToNetwork"));

  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "updateNetworkList");

}

void sub_100014320(id a1, unint64_t a2)
{
  if (!a2)
    +[CBSystem checkoutAndReboot:userInitiated:](CBSystem, "checkoutAndReboot:userInitiated:", 1, 1);
}

void sub_100014758(uint64_t a1)
{
  CBNetworkListRecord *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  CBNetworkListRecord *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  CBNetworkListRecord *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  CBNetworkListRecord *v19;
  void *v20;
  CBNetworkListRecord *v21;
  uint64_t v22;
  void *v23;
  CBNetworkListRecord *v24;
  uint64_t v25;
  id obj;
  CBNetworkListRecord *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v2 = (CBNetworkListRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "targetNetworkForBootIntent"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredWiFiScanResults"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v27 = 0;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v10 = -[CBNetworkListRecord initWithScanResult:]([CBNetworkListRecord alloc], "initWithScanResult:", v9);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "networkName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentNetworkSSID"));
        v14 = objc_msgSend(v11, "isEqualToString:", v13);

        if (v14)
        {
          v15 = v10;

          v27 = v15;
        }
        if (v2)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord ssid](v2, "ssid"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkListRecord ssid](v10, "ssid"));
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (v18)
          {
            v19 = v10;

            objc_msgSend(*(id *)(a1 + 32), "setTargetNetworkForBootIntent:", v19);
            v2 = v19;
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }
  else
  {
    v27 = 0;
  }

  if (v2 && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v2) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setNetworks:", *(_QWORD *)(a1 + 40));
  v20 = *(void **)(a1 + 32);
  if (v27)
  {
    v21 = (CBNetworkListRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentNetwork"));

    if (v21 != v27)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", v27);
      if (objc_msgSend(*(id *)(a1 + 32), "networkConnectionInProgress"))
        v22 = 1;
      else
        v22 = 2;
      v23 = *(void **)(a1 + 32);
      goto LABEL_31;
    }
  }
  else
  {
    if (!v2)
    {
      objc_msgSend(v20, "setCurrentNetwork:", 0);
      v23 = *(void **)(a1 + 32);
      v22 = 0;
LABEL_31:
      objc_msgSend(v23, "setCurrentNetworkState:", v22);
      goto LABEL_32;
    }
    v24 = (CBNetworkListRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentNetwork"));

    if (v24 != v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", v2);
      if (objc_msgSend(*(id *)(a1 + 32), "networkConnectionInProgress"))
        v25 = 1;
      else
        v25 = 2;
      objc_msgSend(*(id *)(a1 + 32), "setCurrentNetworkState:", v25);
      objc_msgSend(*(id *)(a1 + 32), "enableContinueButton:", 1);
    }
  }
LABEL_32:

}

void sub_100014FEC(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CheckerBoardLogHandleForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Alternate Network View Controller presented", v3, 2u);
  }

}

void sub_1000166B4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a2;
  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Language Location: Wifi scan failed with error %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_closeWifiConnection");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_scanComplete:", a3);
  }

}

void sub_1000175B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000175E4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100045430(v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainNavigationController"));
  v6 = objc_msgSend(v5, "popToRootViewControllerAnimated:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localServiceClient"));
  LODWORD(v5) = objc_msgSend(v7, "didMoveToEndgame");

  if ((_DWORD)v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localServiceClient"));
    objc_msgSend(v8, "relaunchToDiagnosticsApp");

  }
}

void sub_10001769C(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  objc_msgSend(v1, "updateWiFiState");

}

void sub_1000187C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000187F0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v3 = a2;
  v4 = CheckerBoardLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Status bar server dataAccessDomain updated with data %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018918;
  v7[3] = &unk_100075948;
  v8 = v3;
  v6 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(&v9);

}

void sub_100018918(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  uint64_t v7;

  v2 = CheckerBoardLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Status bar server dataAccessDomain updated with data %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleNewDomainData:", *(_QWORD *)(a1 + 32));

}

BOOL sub_100018C9C(id a1, CBSensorActivityAttribution *a2, BOOL *a3)
{
  CBSensorActivityAttribution *v3;
  BOOL v4;

  v3 = a2;
  if (-[CBSensorActivityAttribution sensor](v3, "sensor"))
    v4 = (id)-[CBSensorActivityAttribution sensor](v3, "sensor") == (id)1;
  else
    v4 = 1;

  return v4;
}

id sub_100019158(id a1, STUIDataAccessAttribution *a2)
{
  STUIDataAccessAttribution *v2;
  CBSensorActivityAttribution *v3;

  v2 = a2;
  v3 = -[CBSensorActivityAttribution initWithDataAccessAttribution:]([CBSensorActivityAttribution alloc], "initWithDataAccessAttribution:", v2);

  return v3;
}

id sub_10001919C(id a1, STUIDataAccessAttribution *a2)
{
  STUIDataAccessAttribution *v2;
  CBSensorActivityAttribution *v3;

  v2 = a2;
  v3 = -[CBSensorActivityAttribution initWithDataAccessAttribution:]([CBSensorActivityAttribution alloc], "initWithDataAccessAttribution:", v2);

  return v3;
}

void sub_100019458(id a1)
{
  CBAppManager *v1;
  void *v2;

  v1 = objc_alloc_init(CBAppManager);
  v2 = (void *)qword_10008BD18;
  qword_10008BD18 = (uint64_t)v1;

}

id sub_1000196E0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addScene:", a2);
}

void sub_1000197F8(uint64_t a1)
{
  CBAppLaunch *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  v2 = -[CBAppLaunch initWithBundleID:backgrounded:native:]([CBAppLaunch alloc], "initWithBundleID:backgrounded:native:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "openApps"));
  objc_msgSend(v3, "addObject:", v2);

  objc_initWeak(&location, v2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019908;
  v4[3] = &unk_100075948;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v5, &location);
  -[CBAppLaunch setOnExit:](v2, "setOnExit:", v4);
  -[CBAppLaunch setOnLaunch:](v2, "setOnLaunch:", *(_QWORD *)(a1 + 48));
  -[CBAppLaunch launch](v2, "launch");
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void sub_1000198E8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100019908(uint64_t a1)
{
  id WeakRetained;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "openApps"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "removeObject:", WeakRetained);

}

void sub_100019B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019BA0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v2 = CheckerBoardLogHandleForCategory(9);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Terminate event handler called", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationProcessesForBundleIdentifier:", *(_QWORD *)(a1 + 32)));

  objc_msgSend(WeakRetained, "_terminateApps:reason:reportCrash:description:completion:", v6, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t sub_10001A030(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void sub_10001A048(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A0B0;
  block[3] = &unk_1000753E8;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10001A0B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

void sub_10001A32C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v2 = CheckerBoardLogHandleForCategory(9);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posting layout change for frontboard on behalf of %@", (uint8_t *)&v11, 0xCu);

  }
  v5 = objc_alloc((Class)FBSDisplayLayoutElement);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
  v7 = objc_msgSend(v5, "initWithIdentifier:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setReferenceFrame:");

  objc_msgSend(v7, "setLevel:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBMainDisplayLayoutPublisher sharedInstance](FBMainDisplayLayoutPublisher, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addElement:", v7));
  objc_msgSend(*(id *)(a1 + 40), "setLayoutElementInvalidator:", v10);

}

id sub_10001A648(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;

  v2 = CheckerBoardLogHandleForCategory(9);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating layout change for frontboard on behalf of %@", (uint8_t *)&v7, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "layoutElementInvalidator"));
  objc_msgSend(v5, "invalidate");

  return objc_msgSend(*(id *)(a1 + 40), "setLayoutElementInvalidator:", 0);
}

id sub_10001AD28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLevel:", *(double *)(a1 + 32));
}

void sub_10001AE10(id a1, void *a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v2 = a2;
  v3 = CheckerBoardLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Observing idle timer disabled state…", (uint8_t *)&v20, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "updatedClientSettings"));
  v6 = objc_msgSend(v5, "idleTimerDisabled");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "settings"));
  v8 = objc_msgSend(v7, "isForeground");

  v9 = CheckerBoardLogHandleForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scene"));
    v12 = (void *)v11;
    v13 = "NO";
    if ((_DWORD)v6)
      v13 = "YES";
    v14 = " (ignoring because isForeground is false)";
    v20 = 138412802;
    v21 = v11;
    v23 = v13;
    v22 = 2080;
    if (v8)
      v14 = "";
    v24 = 2080;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scene %@ is setting idleTimerDisabled to: %s%s", (uint8_t *)&v20, 0x20u);

  }
  if (v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
    v16 = CheckerBoardLogHandleForCategory(4);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v6)
    {
      if (v18)
      {
        LOWORD(v20) = 0;
        v19 = "Disabling idle timer per app request";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v20, 2u);
      }
    }
    else if (v18)
    {
      LOWORD(v20) = 0;
      v19 = "Enabling idle timer per app request";
      goto LABEL_15;
    }

    objc_msgSend(v15, "setIdleTimerDisabled:forReason:", v6, CFSTR("AppRequest"));
  }

}

void sub_10001B59C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "setForeground:", 1);
  +[CBSceneManager windowLevel:](CBSceneManager, "windowLevel:", 1);
  objc_msgSend(v3, "setLevel:");
  objc_msgSend(v3, "setInterfaceOrientation:", 1);
  if (objc_msgSend(v3, "isUISubclass"))
    objc_msgSend(v3, "setInterfaceOrientationMode:", 2);

}

void sub_10001C780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x240]);
  _Unwind_Resume(a1);
}

id sub_10001C7BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "passwordType") == 8)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
      objc_msgSend(v6, "bounds");
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "headerView"));
      objc_msgSend(v9, "bounds");
      v11 = v8 - v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttonTray"));
      objc_msgSend(v12, "bounds");
      v14 = v11 - v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", (double)(uint64_t)v14));
      objc_msgSend(WeakRetained, "setHeightConstraint:", v16);

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "heightConstraint"));
      objc_msgSend(v17, "setActive:", 0);

      objc_msgSend(WeakRetained, "setHeightConstraint:", 0);
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "heightConstraint"));

  return v18;
}

id sub_10001CB30(id a1)
{
  if ((unint64_t)a1 <= 2)
    a1 = *(id *)*(&off_100075BB0 + (_QWORD)a1);
  return a1;
}

BOOL sub_10001CB60(unint64_t a1)
{
  return a1 < 2;
}

void sub_10001CBBC(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a1)
  {
    v2 = sub_10001CB30(a1[1]);
    v8 = (id)objc_claimAutoreleasedReturnValue(v2);
    v4 = objc_opt_class(CASecureIndicatorLayer, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "layer"));
    v6 = sub_10001CE74(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    objc_msgSend(v7, "setPrivacyIndicatorType:", v8);
  }
}

id sub_10001CE74(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id sub_10001D38C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_activityAttribution");
}

id sub_10001D610(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "displayName"));
  v4 = objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("displayName"));

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));
  v7 = objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("bundleIdentifier"));

  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "website"));
  v10 = objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("website"));

  return objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSystemService"), CFSTR("isSystemService"));
}

void sub_10001D760(id a1)
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0))
    byte_10008AE30 = v2 == 0;
}

void sub_10001D840(id a1)
{
  byte_10008BD30 = os_variant_has_internal_content("com.apple.CheckerBoard");
}

void sub_10001F80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 168));
  _Unwind_Resume(a1);
}

id sub_10001F84C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    objc_msgSend(v7, "frame");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerView"));
    objc_msgSend(v10, "frame");
    v12 = v9 - v11 + -120.0;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", (double)(uint64_t)v12));
    objc_msgSend(v6, "setHeightConstraint:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightConstraint"));

  return v15;
}

void sub_10001FFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 136));
  _Unwind_Resume(a1);
}

id sub_100020008(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "heightConstraint"));
    objc_msgSend(v3, "setActive:", 0);

    objc_msgSend(v2, "setHeightConstraint:", 0);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "heightConstraint"));

  return v4;
}

FBProcessExecutionContext *__cdecl sub_100020498(id a1)
{
  id v1;

  v1 = objc_alloc_init((Class)FBMutableProcessExecutionContext);
  objc_msgSend(v1, "setLaunchIntent:", 4);
  return (FBProcessExecutionContext *)v1;
}

void sub_1000204CC(id a1, BOOL a2)
{
  _BOOL4 v2;
  uint64_t v3;
  NSObject *v4;
  _DWORD v5[2];

  v2 = a2;
  v3 = CheckerBoardLogHandleForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Transaction completed, success: %d", (uint8_t *)v5, 8u);
  }

}

void sub_100020654(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(void);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "windowRepresentation"));
  objc_msgSend(v2, "dismissViewControllerAnimated:", 1);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "onExit"));
  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "onExit"));
    v4[2]();

  }
}

void sub_1000209F8(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000455F0((uint64_t)v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Launched Diagnostics", v6, 2u);
  }

}

void sub_100020ACC(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSSet *v5;
  id v6;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CBLocalServiceClientInterface));
  v2 = (void *)qword_10008BD50;
  qword_10008BD50 = v1;

  v3 = (void *)qword_10008BD50;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CBSProxyServer, v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "setProxyServer:completion:", 0, 0);

}

void sub_100020BA0(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CBLocalServiceServerInterface));
  v2 = (void *)qword_10008BD60;
  qword_10008BD60 = v1;

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  NSString *v13;
  uint64_t v14;

  v4 = objc_autoreleasePoolPush();
  +[CBApplication disableS2R](CBApplication, "disableS2R");
  v5 = (id)FBSystemShellInitialize(&stru_100075D80);
  v7 = (objc_class *)objc_opt_class(CBApplication, v6);
  v8 = NSStringFromClass(v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  v11 = (objc_class *)objc_opt_class(CBAppDelegate, v10);
  v12 = NSStringFromClass(v11);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue(v12);
  v14 = UIApplicationMain(a1, a2, v9, v13);

  objc_autoreleasePoolPop(v4);
  return v14;
}

void sub_100020C84(id a1, FBMutableSystemShellInitializationOptions *a2)
{
  FBMutableSystemShellInitializationOptions *v2;

  v2 = a2;
  -[FBMutableSystemShellInitializationOptions setShouldWaitForMigrator:](v2, "setShouldWaitForMigrator:", 0);
  -[FBMutableSystemShellInitializationOptions setRegisterAdditionalServicesBlock:](v2, "setRegisterAdditionalServicesBlock:", &stru_100075DA0);

}

void sub_100020CC0(id a1)
{
  +[CBApplication initializeAppSupportService](CBApplication, "initializeAppSupportService");
}

void sub_100020D0C(id a1)
{
  CBAPTicket *v1;
  void *v2;

  v1 = objc_alloc_init(CBAPTicket);
  v2 = (void *)qword_10008BD68;
  qword_10008BD68 = (uint64_t)v1;

}

id sub_100021D14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataProviderDidUpdate:", *(_QWORD *)(a1 + 40));
}

void sub_100022064(id a1)
{
  byte_10008BD80 = (unint64_t)(sub_100036F10() - 39) < 5;
}

void sub_100022FFC(id a1)
{
  CBIdleSleepManager *v1;
  void *v2;

  v1 = objc_alloc_init(CBIdleSleepManager);
  v2 = (void *)qword_10008BD88;
  qword_10008BD88 = (uint64_t)v1;

}

void sub_1000231C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000231E0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(v3, "eventMask");
  v6 = CheckerBoardLogHandleForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Dimming for idle", (uint8_t *)&v9, 2u);
    }

    objc_msgSend(WeakRetained, "dimDisplay");
  }
  else
  {
    if (v8)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Reset idle for event %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(WeakRetained, "resetIdleTimerAndUndim:", 1);
  }

}

id sub_100023F88(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _objc_msgSend(a1, "_powerChangedOnService:messageType:messageArgument:", a2, a3, a4);
}

void sub_1000248AC(id a1)
{
  void *v1;
  void *v2;
  unsigned __int8 v3;
  void *v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"));
  v2 = v1;
  if (v1)
  {
    v4 = v1;
    v3 = objc_msgSend(v1, "isMinimized");
    v2 = v4;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v4, "setMinimized:", 1);
      v2 = v4;
    }
  }

}

void sub_1000249A8(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"));
  if (v1)
    objc_msgSend(v1, "setMinimized:", +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode"));

}

void sub_100024AF0(id a1)
{
  id v1;
  void *v2;

  v1 = -[CBAlertManager _init]([CBAlertManager alloc], "_init");
  v2 = (void *)qword_10008BDB0;
  qword_10008BDB0 = (uint64_t)v1;

}

uint64_t sub_100025128(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggered [Exit Diagnostics].", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAlertVisible:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1000251B0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggered [Wi-Fi Settings].", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAlertVisible:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_100025238(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggered [Shut Down].", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAlertVisible:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1000252C0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggered [Debug Info].", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAlertVisible:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_100025348(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggered [Cancel].", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAlertVisible:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1000253D0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Menu sheet presented.", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t sub_100025784(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlertVisible:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1000257B8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlertVisible:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1000257EC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CheckerBoard confirmation alert presented.", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t sub_100025A20(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Wi-Fi picker presented.", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t sub_100025C8C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Thermal warning UI presented.", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t sub_100025EDC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Power Down UI presented.", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t sub_100026108(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Debug info presented.", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void sub_100026900(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_10002691C(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "window"));
  objc_msgSend(v3, "viewControllerDidDismiss");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100026C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100026C4C(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPresentedView:", 0);
  v2 = CheckerBoardLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissed view controller on %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "windowManager"));
  objc_msgSend(v4, "windowDidDismiss:", WeakRetained);

}

void sub_100026FFC(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CheckerBoardLogHandleForCategory(11);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Local XPC - _connection.interruptionHandler", v3, 2u);
  }

}

void sub_100027064(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CheckerBoardLogHandleForCategory(11);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Local XPC - _connection.invalidationHandler", v3, 2u);
  }

}

void sub_1000271B8(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = CheckerBoardLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Local XPC - Can't get remote proxy object %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100027264(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CheckerBoardLogHandleForCategory(11);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Local XPC - ping pong", v3, 2u);
  }

}

void sub_1000272FC(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Relaunch Diagnostics app again. error = %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void sub_100027580(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  CBEndgameViewController *v4;
  void *v5;
  uint8_t v6[16];

  v2 = CheckerBoardLogHandleForCategory(11);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Local XPC - moveToDiagnosticsApp: move to endgame.", v6, 2u);
  }

  v4 = objc_alloc_init(CBEndgameViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mainNavController"));
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

  objc_msgSend(*(id *)(a1 + 32), "setDidMoveToEndgame:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100027918(id a1)
{
  CBWiFiManager *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;

  if (+[CBUtilities isRunningOnPhysicalHardware](CBUtilities, "isRunningOnPhysicalHardware"))
  {
    v1 = objc_alloc_init(CBWiFiManager);
    v2 = (void *)qword_10008BDC0;
    qword_10008BDC0 = (uint64_t)v1;

  }
  else
  {
    v3 = CheckerBoardLogHandleForCategory(8);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100045A30();

  }
}

void sub_100027EE4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100027F18(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleCWInterfaceEvent:", v3);

}

void sub_100027F60(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  void *v6;
  uint8_t v7[16];

  v2 = CheckerBoardLogHandleForCategory(8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cwInterface was invalidated. Recreating", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_alloc_init((Class)CWFInterface);
  objc_msgSend(WeakRetained, "setCwInterface:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "cwInterface"));
  objc_msgSend(v6, "activate");

  objc_msgSend(WeakRetained, "_registerWiFiNotifications");
}

void sub_1000288D4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "_attemptReconnect");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "_attemptReconnect", 0, 1, 8.0));
  objc_msgSend(*(id *)(a1 + 32), "setReconnectTimer:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "reconnectTimer"));
  objc_msgSend(v3, "addTimer:forMode:", v4, NSRunLoopCommonModes);

  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reconnect scheduled", v7, 2u);
  }

}

int64_t sub_100028B64(id a1, CWFScanResult *a2, CWFScanResult *a3)
{
  CWFScanResult *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult networkName](a2, "networkName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult networkName](v4, "networkName"));

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return (int64_t)v7;
}

void sub_100029230(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "networkScanSemaphore"));
  v5 = dispatch_time(0, 10000000000);
  v6 = dispatch_semaphore_wait(v4, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cwInterface"));
  v8 = CheckerBoardLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v7 || v6)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unfortunately, we do not have a Wi-Fi device available for network scan… Let's try again", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_restartWiFiNetworkScan");
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device is available for network scan", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "scanParametersWithSSID:isHidden:", 0, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cwInterface"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000293E8;
    v13[3] = &unk_1000760E8;
    objc_copyWeak(&v14, v2);
    objc_msgSend(v12, "performScanWithParameters:reply:", v11, v13);

    objc_destroyWeak(&v14);
  }
}

void sub_1000293D4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000293E8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "networkScanSemaphore"));
  dispatch_semaphore_signal(v9);

  if (v5)
  {
    v10 = CheckerBoardLogHandleForCategory(8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100045A94();

    v12 = objc_loadWeakRetained(v7);
    objc_msgSend(v12, "_restartWiFiNetworkScan");
  }
  else
  {
    v12 = objc_loadWeakRetained(v7);
    objc_msgSend(v12, "_wifiScanCompleted:", v6);
  }

}

void sub_100029A94(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "_startWiFiNetworkScan", 0, 0, *(double *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 32), "setScanTimer:", v2);

}

void sub_100029ED0(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  intptr_t v28;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "networkScanSemaphore"));
  v5 = dispatch_time(0, 10000000000);
  v6 = dispatch_semaphore_wait(v4, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cwInterface"));
  if (!v7 || v6)
  {
    v11 = CheckerBoardLogHandleForCategory(8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cwInterface"));
      *(_DWORD *)buf = 138412546;
      v26 = v13;
      v27 = 2048;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Skipping scan: %@ + semaphore result: %li", buf, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("Wifi"), objc_msgSend(&off_100078D70, "integerValue"), 0));
    v14 = *(_BYTE *)(a1 + 64) == 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    if (v14)
    {
      v21 = CFSTR("CBWiFiManagerErrorKey");
      v22 = v8;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("CBWiFiManagerDidAssociateToEncryptedNetworkNotification"), 0, v16);
    }
    else
    {
      v23 = CFSTR("CBWiFiManagerErrorKey");
      v24 = v8;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("CBWiFiManagerDidAssociateToOpenNetworkNotification"), 0, v16);
    }

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "scanParametersWithSSID:isHidden:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64)));
    v9 = objc_loadWeakRetained(v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cwInterface"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A1C4;
    v17[3] = &unk_100076138;
    objc_copyWeak(&v19, v2);
    v18 = *(id *)(a1 + 48);
    v20 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v10, "performScanWithParameters:reply:", v8, v17);

    objc_destroyWeak(&v19);
  }

}

void sub_10002A1A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002A1C4(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  id v24;

  v4 = (id *)(a1 + 40);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "networkScanSemaphore"));
  dispatch_semaphore_signal(v7);

  v8 = objc_loadWeakRetained(v4);
  objc_msgSend(v8, "updateWiFiState");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));
  v10 = CheckerBoardLogHandleForCategory(8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v9, "count");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "There are %lu directed scan results", buf, 0xCu);
  }

  if (objc_msgSend(v9, "count"))
  {
    v12 = objc_msgSend(v9, "count");
    v13 = CheckerBoardLogHandleForCategory(8);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12 == (id)1)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        v16 = "Attempting to associate to that one";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
      }
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      v16 = "Attempting to associate to the first scan result";
      goto LABEL_10;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    v19 = objc_loadWeakRetained(v4);
    objc_msgSend(v19, "_associateToEncryptedNetworkWithScanResult:password:isHidden:", v18, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
    goto LABEL_12;
  }
  v17 = objc_loadWeakRetained(v4);
  objc_msgSend(v17, "updateWiFiState");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("Wifi"), objc_msgSend(&off_100078D70, "integerValue"), 0));
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v21 = CFSTR("CBWiFiManagerErrorKey");
  v22 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("CBWiFiManagerDidAssociateToOpenNetworkNotification"), 0, v20);

LABEL_12:
}

void sub_10002A7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A7F0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    v4 = CheckerBoardLogHandleForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100045B20();

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_postDidAssociateToEncryptedNetworkNotificationWithError:", v3);

}

void sub_10002A9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A9D8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    v4 = CheckerBoardLogHandleForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100045B80();

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_postDidAssociateToOpenNetworkNotificationWithError:", v3);

}

void sub_10002AB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002ABC0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;

  v3 = a2;
  if (v3)
  {
    v4 = CheckerBoardLogHandleForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100045BE0();

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_postDidAssociateToOpenNetworkNotificationWithError:", v3);

}

void sub_10002B3C4(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:userInfo:", CFSTR("CBWiFiSignalStrengthChangedNotification"), 0, 0);

}

void sub_10002B4CC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("CBWiFiManagerErrorKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("CBWiFiManagerDidAssociateToEncryptedNetworkNotification"), 0, v4);

}

void sub_10002B610(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("CBWiFiManagerErrorKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("CBWiFiManagerDidAssociateToOpenNetworkNotification"), 0, v4);

}

void sub_10002BBE8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "statusBarView"));
  objc_msgSend(v1, "setHidden:", 0);

}

void sub_10002BCC8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "statusBarView"));
  objc_msgSend(v1, "setHidden:", 1);

}

void sub_10002BDEC(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "statusBarView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusBar"));
  objc_msgSend(v2, "setStyle:", objc_msgSend(*(id *)(a1 + 32), "_statusBarStyle:", *(_QWORD *)(a1 + 40)));

}

void sub_10002BF78(id a1)
{
  CBSceneManager *v1;
  void *v2;

  v1 = objc_alloc_init(CBSceneManager);
  v2 = (void *)qword_10008BDD0;
  qword_10008BDD0 = (uint64_t)v1;

}

void sub_10002C4DC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](FBDisplayManager, "mainConfiguration"));
  objc_msgSend(v5, "setDisplayConfiguration:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "_referenceBounds");
  objc_msgSend(v5, "setFrame:");

  objc_msgSend(v5, "setLevel:", *(double *)(a1 + 32));
  objc_msgSend(v5, "setForeground:", 1);
  objc_msgSend(v5, "setInterfaceOrientation:", 1);
  if (objc_msgSend(v5, "isUISubclass"))
    objc_msgSend(v5, "setDeviceOrientationEventsEnabled:", 1);

}

void sub_10002C590(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isUISubclass"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "settings"));
    objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v3, "interfaceOrientation"));

    objc_msgSend(v4, "setStatusBarStyle:", 0);
  }

}

void sub_10002CB8C(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allKeys", 0));
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
        objc_msgSend(v7, "destroyScene:withTransitionContext:", v6, 0);

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void sub_10002CEB8(id a1)
{
  CBWindowManager *v1;
  void *v2;

  v1 = objc_alloc_init(CBWindowManager);
  v2 = (void *)qword_10008BDE0;
  qword_10008BDE0 = (uint64_t)v1;

}

uint64_t sub_10002D4BC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t result;
  uint8_t v6[16];

  v2 = CheckerBoardLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Presented", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "windowManager"));
  objc_msgSend(v4, "windowDidAppear:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10002D634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002DCC4(id a1)
{
  CBShellServer *v1;
  void *v2;

  v1 = objc_alloc_init(CBShellServer);
  v2 = (void *)qword_10008BDF0;
  qword_10008BDF0 = (uint64_t)v1;

}

void sub_10002DEF8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "systemServicesDelegate"));
  objc_msgSend(v2, "exitRequestedWithServer:", *(_QWORD *)(a1 + 32));

}

void sub_10002E278(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "systemServicesDelegate"));
  objc_msgSend(v1, "launchDiagnostics");

}

void sub_10002EC18(id a1)
{
  id v1;
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v1 = objc_alloc((Class)UISMutableDisplayContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](FBDisplayManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainConfiguration"));
  v21 = objc_msgSend(v1, "initWithDisplayConfiguration:", v3);

  v4 = sub_100036F10();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](FBDisplayManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainConfiguration"));
  objc_msgSend(v21, "setDisplayConfiguration:", v6);

  v7 = sub_1000379FC(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v21, "setDisplayEdgeInfo:", v8);

  v9 = sub_100037C74(v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v21, "setExclusionArea:", v10);

  objc_msgSend(v21, "setArtworkSubtype:", sub_10003700C());
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIUserInterfaceStyleArbiter sharedInstance](UIUserInterfaceStyleArbiter, "sharedInstance"));
  v12 = v11;
  if (v11)
    objc_msgSend(v21, "setUserInterfaceStyle:", objc_msgSend(v11, "currentStyle"));
  v13 = objc_msgSend(objc_alloc((Class)UISMutableDeviceContext), "initWithDeviceInfoValues:", &__NSDictionary0__struct);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v14, "deviceClass")));
  objc_msgSend(v13, "setDeviceInfoValue:forKey:", v15, UISDeviceContextDeviceClassKey);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v16, "homeButtonType")));
  objc_msgSend(v13, "setDeviceInfoValue:forKey:", v17, UISDeviceContextHomeButtonTypeKey);

  MGGetFloat32Answer(CFSTR("DeviceCornerRadius"), 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v13, "setDeviceInfoValue:forKey:", v18, UISDeviceContextDeviceCornerRadiusKey);

  v19 = objc_msgSend(objc_alloc((Class)UISApplicationInitializationContext), "initWithDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", v21, v13, 0, 1);
  v20 = (void *)qword_10008BE00;
  qword_10008BE00 = (uint64_t)v19;

}

void sub_10002F3B0(id a1)
{
  void *v1;
  void *v2;
  id v3;
  _CBApplicationSupportServiceDelegate *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *queue;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bundleIdentifier"));
  v3 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v2);

  queue = dispatch_queue_create("com.apple.checkerboard.initializationContext", 0);
  v4 = objc_alloc_init(_CBApplicationSupportServiceDelegate);
  v5 = (void *)qword_10008BE18;
  qword_10008BE18 = (uint64_t)v4;

  v6 = objc_alloc((Class)UISApplicationSupportService);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSerialQueue queueWithDispatchQueue:](FBSSerialQueue, "queueWithDispatchQueue:", queue));
  v8 = objc_msgSend(v6, "initWithCalloutQueue:", v7);
  v9 = (void *)qword_10008BE10;
  qword_10008BE10 = (uint64_t)v8;

  dispatch_sync(queue, &stru_100076290);
}

void sub_10002F4A8(id a1)
{
  objc_msgSend((id)qword_10008BE10, "setDelegate:", qword_10008BE18);
}

void sub_100030038(uint64_t a1, uint64_t a2)
{
  id v2;
  id v3;
  id v4;

  switch(a2)
  {
    case 0:
      v2 = (id)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
      objc_msgSend(v2, "showExitConfirmationWithCompletion:response:", 0, &stru_1000762B0);

      break;
    case 1:
      v3 = (id)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
      objc_msgSend(v3, "showWiFiPickerWithCompletion:", 0);

      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_showPowerDownView");
      break;
    case 3:
      v4 = (id)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
      objc_msgSend(v4, "showDebugInfoWithCompletion:", 0);

      break;
    default:
      return;
  }
}

void sub_1000300F4(id a1, unint64_t a2)
{
  if (!a2)
    +[CBSystem checkoutAndReboot:userInitiated:](CBSystem, "checkoutAndReboot:userInitiated:", 1, 1);
}

void sub_100030584(id a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (!a2)
  {
    v7 = v2;
    v8 = v3;
    v4 = CheckerBoardLogHandleForCategory(7);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Shutting down device…", v6, 2u);
    }

    +[CBSystem checkoutAndReboot:userInitiated:](CBSystem, "checkoutAndReboot:userInitiated:", 0, 1);
  }
}

void sub_100030EF4(id a1, FBSMutableSceneSettings *a2)
{
  void *v2;
  void *v3;
  FBSMutableSceneSettings *v4;

  v4 = a2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](FBDisplayManager, "mainConfiguration"));
  -[FBSMutableSceneSettings setDisplayConfiguration:](v4, "setDisplayConfiguration:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "_referenceBounds");
  -[FBSMutableSceneSettings setFrame:](v4, "setFrame:");

  -[FBSMutableSceneSettings setLevel:](v4, "setLevel:", 0.0);
  -[FBSMutableSceneSettings setForeground:](v4, "setForeground:", 1);
  -[FBSMutableSceneSettings setInterfaceOrientation:](v4, "setInterfaceOrientation:", 1);
  if (-[FBSMutableSceneSettings isUISubclass](v4, "isUISubclass"))
    -[FBSMutableSceneSettings setDeviceOrientationEventsEnabled:](v4, "setDeviceOrientationEventsEnabled:", 1);

}

void sub_100030FA4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isUISubclass"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "settings"));
    objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v3, "interfaceOrientation"));

    objc_msgSend(v4, "setStatusBarStyle:", 0);
  }

}

void sub_100031130(uint64_t a1)
{
  int v1;
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v1 = *(unsigned __int8 *)(a1 + 32);
  v2 = CheckerBoardLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting immediately due to kIOPMPSAtCriticalLevelKey battery notification", buf, 2u);
    }
    v5 = 1;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down immediately due to kIOPMPSAtCriticalLevelKey battery notification", v7, 2u);
    }
    v5 = 0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSystemService sharedInstance](FBSystemService, "sharedInstance"));
  objc_msgSend(v6, "shutdownWithOptions:forSource:", v5, 0);

}

void sub_100031784(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)FBSShutdownOptions), "initWithReason:", CFSTR("Rebooting for Diagnostics"));
  if (*(_BYTE *)(a1 + 32))
    objc_msgSend(v3, "setRebootType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](FBSSystemService, "sharedService"));
  objc_msgSend(v2, "shutdownWithOptions:", v3);

}

uint64_t sub_1000317FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100031904(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(a1 + 32), "checkedInWiFiSettings"))
  {
    v2 = CheckerBoardLogHandleForCategory(1);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting Wi-Fi settings", v5, 2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
    objc_msgSend(v4, "setPowered:", objc_msgSend(*(id *)(a1 + 32), "wifiPowerStateOn"));

  }
}

void sub_100032260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,char a22)
{
  id *v22;
  uint64_t v23;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v23 - 200), 8);
  _Block_object_dispose((const void *)(v23 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000322AC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000322BC(uint64_t a1)
{

}

void sub_1000322C4(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CBWiFiManagerErrorKey")));

  if (v4)
    v5 = objc_msgSend(v4, "code") == 0;
  else
    v5 = 1;
  v6 = CheckerBoardLogHandleForCategory(8);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Network association for CBSystem completed with success: %d", (uint8_t *)v12, 8u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBStatusBarStateAggregator sharedInstance](CBStatusBarStateAggregator, "sharedInstance"));
  objc_msgSend(v10, "updateStatusBarItem:", 9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  objc_msgSend(v11, "stopWiFiNetworkScanRequestFrom:", a1[4]);

}

void sub_100032458(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  _BYTE v33[128];

  v2 = CheckerBoardLogHandleForCategory(8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Network scan for CBSystem completed as part of association", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "stopWiFiNetworkScanRequestFrom:", WeakRetained);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredWiFiScanResults"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "networkName", (_QWORD)v25));
        v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v15)
        {
          v10 = v13;
          v16 = CheckerBoardLogHandleForCategory(8);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Network scan for CBSystem found a network matching the association request.", buf, 2u);
          }

          goto LABEL_15;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  v18 = CheckerBoardLogHandleForCategory(8);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 40) != 0;
    *(_DWORD *)buf = 67109376;
    v30 = v10 != 0;
    v31 = 1024;
    v32 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Network scan for CBSystem complete - associating to network. In scan results: %d, has password: %d", buf, 0xEu);
  }

  if (v10)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
    objc_msgSend(v21, "associateToEncryptedNetworkWithScanResult:password:", v10, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v22 = *(_QWORD *)(a1 + 40);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
    v21 = v23;
    v24 = *(_QWORD *)(a1 + 32);
    if (v22)
      objc_msgSend(v23, "associateToHiddenEncryptedNetworkWithName:password:", v24, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v23, "associateToHiddenUnencryptedNetworkWithName:", v24);
  }

}

void sub_100032930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_10003295C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];

  v2 = CheckerBoardLogHandleForCategory(8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Network scan completed for CBSystem network scan (without association)", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  v21 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "stopWiFiNetworkScanRequestFrom:", WeakRetained);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredWiFiScanResults"));

  v9 = objc_alloc_init((Class)NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "networkName", v21));
        v16 = objc_msgSend(v14, "requiresPassword");
        v28[1] = CFSTR("protected");
        v29[0] = v15;
        v28[0] = CFSTR("ssid");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v16));
        v29[1] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
        objc_msgSend(v9, "addObject:", v18);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v11);
  }

  v19 = *(_QWORD *)(v21 + 32);
  v20 = objc_msgSend(v9, "copy");
  (*(void (**)(uint64_t, id))(v19 + 16))(v19, v20);

}

uint64_t sub_100032E74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000343F4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t v25[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentlyActiveTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textInputTraits"));

  if (objc_msgSend(v3, "returnKeyType") != (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentlyActiveTextField"));

    if (!v6)
      goto LABEL_14;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentlyActiveTextField"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "networkNameCell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textField"));

    v10 = *(void **)(a1 + 32);
    if (v7 == v9)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scanResult"));
      v19 = objc_msgSend(v18, "requiresPassword");

      if (!v19)
      {
LABEL_12:
        v21 = *(char **)(a1 + 32);
        v22 = *(void **)&v21[OBJC_IVAR___PSListController__table];
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "indexPathForIndex:", objc_msgSend(v21, "indexToSelect")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "cellForRowAtIndexPath:", v23));
        objc_msgSend(v24, "becomeFirstResponder");

        goto LABEL_13;
      }
      v14 = *(void **)(a1 + 32);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = v15;
      v17 = CFSTR("PASSWORD");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentlyActiveTextField"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "passwordCell"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textField"));

      if (v11 != v13)
      {
LABEL_13:
        objc_msgSend(*(id *)(a1 + 32), "setCurrentlyActiveTextField:", 0);
        goto LABEL_14;
      }
      v14 = *(void **)(a1 + 32);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = v15;
      v17 = CFSTR("OTHER_NETWORK_NAME");
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1000769A0, 0));
    objc_msgSend(*(id *)(a1 + 32), "setIndexToSelect:", objc_msgSend(v14, "indexOfSpecifierID:", v20));

    goto LABEL_12;
  }
  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Return] key is [Join]", v25, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "joinTapped:", 0);
LABEL_14:

}

void sub_1000346BC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;

  if (objc_msgSend(*(id *)(a1 + 32), "joining"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setJoining:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "userInfo"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CBWiFiManagerErrorKey")));
    v4 = CheckerBoardLogHandleForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi network did associate to [un]encrypted network notification sent with error (%@)", buf, 0xCu);
    }

    v6 = CheckerBoardLogHandleForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v56 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Association error: %@", buf, 0xCu);
      }

      v9 = objc_msgSend(v3, "code");
      if ((unint64_t)v9 + 102 >= 3 && (unint64_t)v9 + 3925 >= 2)
      {
        if (v9 == (id)16)
        {
          v35 = CheckerBoardLogHandleForCategory(8);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_100045CDC(v36, v37, v38, v39, v40, v41, v42, v43);

          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "_networkJoinRetryTimerFired:", 0, 0, 1.0));
          objc_msgSend(*(id *)(a1 + 32), "setJoinTimer:", v44);

        }
        else
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("FAILED_NETWORK_PROMPT"), &stru_1000769A0, 0));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "networkName"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v47));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationItem"));
          objc_msgSend(v49, "setPrompt:", v48);

          objc_msgSend(*(id *)(a1 + 32), "_enableUI:", 1);
          v50 = *(void **)(a1 + 32);
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("COULD_NOT_FIND_NETWORK_TITLE"), &stru_1000769A0, 0));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "networkName"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v52, v53));
          objc_msgSend(v50, "_presentFailedAssociationAlertWithTitle:message:", v54, 0);

        }
      }
      else
      {
        v11 = CheckerBoardLogHandleForCategory(8);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_100045CAC(v12, v13, v14, v15, v16, v17, v18, v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FAILED_NETWORK_PROMPT"), &stru_1000769A0, 0));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "networkName"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationItem"));
        objc_msgSend(v24, "setPrompt:", v23);

        objc_msgSend(*(id *)(a1 + 32), "_enableUI:", 1);
        v25 = *(void **)(a1 + 32);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("INCORRECT_PASSWORD_TITLE"), &stru_1000769A0, 0));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "networkName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v28));
        objc_msgSend(v25, "_presentFailedAssociationAlertWithTitle:message:", v29, 0);

      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No association error", buf, 2u);
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("JOINED_NETWORK_PROMPT"), &stru_1000769A0, 0));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "networkName"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v32));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationItem"));
      objc_msgSend(v34, "setPrompt:", v33);

      objc_msgSend(*(id *)(a1 + 32), "_enableUI:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_checkoutAndPostAssociationCompletedNotificationWithError:", 0);
    }

  }
}

double sub_100036E78()
{
  id v0;
  void *v1;
  double v2;
  double v3;

  v0 = sub_10003760C();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  objc_msgSend(v1, "bounds");
  v3 = v2;

  return v3;
}

double sub_100036ED4()
{
  id v0;
  void *v1;
  double v2;
  double v3;

  v0 = sub_10003760C();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  objc_msgSend(v1, "scale");
  v3 = v2;

  return v3;
}

uint64_t sub_100036F10()
{
  if (qword_10008BE28 != -1)
    dispatch_once(&qword_10008BE28, &stru_1000763F0);
  return qword_10008BE30;
}

void sub_100036F50(id a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  unsigned int v10;
  id v11;

  v1 = sub_100036E78();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = sub_100036ED4();
  if (qword_10008BE40 != -1)
    dispatch_once(&qword_10008BE40, &stru_100076478);
  v9 = qword_10008BE38;
  v10 = sub_100037478();
  v11 = sub_1000374B4();
  qword_10008BE30 = sub_100037074(v10, (uint64_t)v11, v9, &stru_100076430, v1, v3, v5, v7, v8);
}

uint64_t sub_10003700C()
{
  if (qword_10008BE40 != -1)
    dispatch_once(&qword_10008BE40, &stru_100076478);
  return qword_10008BE38;
}

BOOL sub_10003704C(id a1)
{
  return MGGetSInt32Answer(CFSTR("main-screen-class"), 0xFFFFFFFFLL) == 7;
}

uint64_t sub_100037074(unsigned int a1, uint64_t a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8, double a9)
{
  unsigned int (**v15)(_QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  _QWORD v40[11];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  v15 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000374F0;
  v40[3] = &unk_100076458;
  *(double *)&v40[6] = a7;
  *(double *)&v40[7] = a8;
  *(double *)&v40[8] = a9;
  v40[9] = a3;
  v40[10] = a2;
  v40[4] = &v45;
  v40[5] = &v41;
  v16 = sub_1000110D8((uint64_t)v40);
  if (!*((_BYTE *)v42 + 24))
  {
    if (a1 == 2)
    {
      if (a2 == 2)
      {
        v17 = BSSizeGreaterThanOrEqualToSize(v16, a7, a8, 1024.0, 1366.0);
        if ((_DWORD)v17)
        {
          v18 = v46;
          v19 = 37;
        }
        else
        {
          v23 = BSSizeGreaterThanOrEqualToSize(v17, a7, a8, 834.0, 1194.0);
          if ((_DWORD)v23)
          {
            v18 = v46;
            v19 = 36;
          }
          else
          {
            v27 = BSSizeGreaterThanOrEqualToSize(v23, a7, a8, 820.0, 1180.0);
            if ((_DWORD)v27)
            {
              v18 = v46;
              v19 = 35;
            }
            else
            {
              v30 = BSSizeGreaterThanOrEqualToSize(v27, a7, a8, 834.0, 1210.0);
              if ((_DWORD)v30)
              {
                v18 = v46;
                v19 = 39;
              }
              else
              {
                v32 = BSSizeGreaterThanOrEqualToSize(v30, a7, a8, 1032.0, 1376.0);
                if ((_DWORD)v32)
                {
                  v18 = v46;
                  v19 = 41;
                }
                else
                {
                  v34 = BSSizeGreaterThanOrEqualToSize(v32, a7, a8, 768.0, 1024.0);
                  v18 = v46;
                  if (v34)
                    v19 = 38;
                  else
                    v19 = 34;
                }
              }
            }
          }
        }
      }
      else
      {
        v21 = BSSizeGreaterThanOrEqualToSize(v16, a7, a8, 1024.0, 1366.0);
        if ((_DWORD)v21)
        {
          v18 = v46;
          v19 = 33;
        }
        else
        {
          v24 = BSSizeGreaterThanOrEqualToSize(v21, a7, a8, 834.0, 1112.0);
          if ((_DWORD)v24)
          {
            v18 = v46;
            v19 = 32;
          }
          else
          {
            v28 = BSSizeGreaterThanOrEqualToSize(v24, a7, a8, 810.0, 1080.0);
            v18 = v46;
            if (v28)
              v19 = 31;
            else
              v19 = 29;
          }
        }
      }
    }
    else
    {
      if (a1 > 1)
        goto LABEL_49;
      if (a2 == 2)
      {
        v20 = BSSizeGreaterThanOrEqualToSize(v16, a7, a8, 428.0, 926.0);
        if ((_DWORD)v20)
        {
          v18 = v46;
          v19 = 13;
        }
        else
        {
          v25 = BSSizeGreaterThanOrEqualToSize(v20, a7, a8, 414.0, 896.0);
          if ((_DWORD)v25)
          {
            v18 = v46;
            v19 = 5;
          }
          else
          {
            v29 = BSSizeGreaterThanOrEqualToSize(v25, a7, a8, 390.0, 844.0);
            if ((_DWORD)v29)
            {
              v18 = v46;
              v19 = 11;
            }
            else
            {
              v31 = BSSizeGreaterThanOrEqualToSize(v29, a7, a8, 375.0, 812.0);
              if ((_DWORD)v31)
              {
                v18 = v46;
                v19 = 3;
              }
              else
              {
                v33 = BSSizeGreaterThanOrEqualToSize(v31, a7, a8, 393.0, 852.0);
                if ((_DWORD)v33)
                {
                  v18 = v46;
                  v19 = 21;
                }
                else
                {
                  v35 = BSSizeGreaterThanOrEqualToSize(v33, a7, a8, 430.0, 932.0);
                  if ((_DWORD)v35)
                  {
                    v18 = v46;
                    v19 = 23;
                  }
                  else
                  {
                    v36 = BSSizeGreaterThanOrEqualToSize(v35, a7, a8, 402.0, 874.0);
                    if ((_DWORD)v36)
                    {
                      v18 = v46;
                      v19 = 25;
                    }
                    else
                    {
                      v37 = BSSizeGreaterThanOrEqualToSize(v36, a7, a8, 440.0, 956.0);
                      v18 = v46;
                      if (v37)
                        v19 = 27;
                      else
                        v19 = 4;
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        v22 = BSSizeGreaterThanOrEqualToSize(v16, a7, a8, 414.0, 736.0);
        if ((_DWORD)v22)
        {
          v18 = v46;
          v19 = 2;
        }
        else
        {
          v26 = BSSizeGreaterThanOrEqualToSize(v22, a7, a8, 375.0, 667.0);
          v18 = v46;
          if (!v26)
          {
            v46[3] = 0;
            goto LABEL_49;
          }
          v19 = 1;
        }
      }
    }
    v18[3] = v19;
  }
LABEL_49:
  v38 = v46[3];
  if ((unint64_t)(v38 - 29) <= 1)
  {
    if (v15[2](v15))
      v38 = 30;
    else
      v38 = 29;
    v46[3] = v38;
  }
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v38;
}

void sub_100037450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_100037478()
{
  void *v0;
  id v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v1 = objc_msgSend(v0, "deviceClass");

  return v1;
}

id sub_1000374B4()
{
  void *v0;
  id v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v1 = objc_msgSend(v0, "homeButtonType");

  return v1;
}

uint64_t sub_1000374F0(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  __int128 v6;
  uint64_t result;
  _OWORD v8[2];
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  sub_100011168(a2, (uint64_t)&v12);
  v10[0] = v12;
  v10[1] = v13;
  v11 = v14;
  v6 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v6;
  v9 = *(_QWORD *)(a1 + 80);
  result = sub_1000114F8((uint64_t)v10, (uint64_t)v8);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void sub_10003758C(id a1)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const void *Value;
  id v4;

  v1 = (const __CFDictionary *)MGCopyAnswer(CFSTR("oPeik/9e8lQWMszEjbPzng"), 0);
  if (v1)
  {
    v2 = v1;
    Value = CFDictionaryGetValue(v1, CFSTR("ArtworkDeviceSubType"));
    v4 = (id)objc_claimAutoreleasedReturnValue(Value);
    if (v4)
      qword_10008BE38 = (int)objc_msgSend(v4, "intValue");
    CFRelease(v2);

  }
}

id sub_10003760C()
{
  if (qword_10008BE50 != -1)
    dispatch_once(&qword_10008BE50, &stru_100076498);
  return (id)qword_10008BE48;
}

void sub_10003764C(id a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v1 = (void *)qword_10008BE58;
  v10 = qword_10008BE58;
  if (!qword_10008BE58)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100037744;
    v6[3] = &unk_1000764C0;
    v6[4] = &v7;
    sub_100037744((uint64_t)v6);
    v1 = (void *)v8[3];
  }
  v2 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v7, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainDisplay"));
  v4 = objc_msgSend(objc_alloc((Class)FBSDisplayConfiguration), "initWithCADisplay:", v3);
  v5 = (void *)qword_10008BE48;
  qword_10008BE48 = (uint64_t)v4;

  BSCGFloatEpsilon(objc_msgSend((id)qword_10008BE48, "bounds"));
}

void sub_10003772C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100037744(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10008BE60)
  {
    v4 = off_1000764E0;
    v5 = 0;
    qword_10008BE60 = _sl_dlopen(&v4, &v3);
    if (!qword_10008BE60)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_100045D3C();
    }
    if (v3)
      free(v3);
  }
  result = objc_getClass("CADisplay");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_8;
  qword_10008BE58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double sub_100037838(unint64_t a1)
{
  double result;
  double v2;
  unint64_t v3;
  unint64_t v4;
  _BYTE v5[16];
  double v6;

  switch(a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x2BuLL:
      sub_100011168(a1, (uint64_t)v5);
      return v6;
    case 3uLL:
    case 4uLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 3;
      goto LABEL_19;
    case 5uLL:
    case 6uLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 5;
      goto LABEL_19;
    case 7uLL:
    case 8uLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 7;
      goto LABEL_19;
    case 9uLL:
    case 0xAuLL:
      v2 = 0.96;
      v3 = a1;
      v4 = 9;
      goto LABEL_19;
    case 0xBuLL:
    case 0xCuLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 11;
      goto LABEL_19;
    case 0xDuLL:
    case 0xEuLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 13;
      goto LABEL_19;
    case 0xFuLL:
    case 0x10uLL:
      v2 = 0.96;
      v3 = a1;
      v4 = 15;
      goto LABEL_19;
    case 0x11uLL:
    case 0x12uLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 17;
      goto LABEL_19;
    case 0x13uLL:
    case 0x14uLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 19;
      goto LABEL_19;
    case 0x15uLL:
    case 0x16uLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 21;
      goto LABEL_19;
    case 0x17uLL:
    case 0x18uLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 23;
      goto LABEL_19;
    case 0x19uLL:
    case 0x1AuLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 25;
      goto LABEL_19;
    case 0x1BuLL:
    case 0x1CuLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 27;
      goto LABEL_19;
    case 0x25uLL:
    case 0x26uLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 37;
      goto LABEL_19;
    case 0x29uLL:
    case 0x2AuLL:
      v2 = 1.0;
      v3 = a1;
      v4 = 41;
LABEL_19:
      result = sub_100037984(v2, a1, v3, v4);
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

double sub_100037984(double a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = 0;
  memset(v10, 0, sizeof(v10));
  sub_100011168(a3, (uint64_t)v10);
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  sub_100011168(a4, (uint64_t)&v7);
  return *(double *)&v8 * (*(double *)&v7 / *(double *)v10) * a1;
}

id sub_1000379FC(unint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  id v8;
  _BOOL4 v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;

  v2 = 27.0;
  v3 = 0x4049800000000000;
  v4 = 0x4043000000000000;
  v5 = 0x4044000000000000;
  v6 = 48.0;
  switch(a1)
  {
    case 3uLL:
    case 5uLL:
    case 8uLL:
      v7 = 0x4046000000000000;
      goto LABEL_6;
    case 4uLL:
LABEL_23:
      v2 = 29.0;
      v6 = *(double *)&v4;
      break;
    case 6uLL:
LABEL_24:
      v2 = 30.67;
      v6 = *(double *)&v5;
      break;
    case 7uLL:
      goto LABEL_11;
    case 9uLL:
    case 0xFuLL:
      v7 = 0x4049000000000000;
LABEL_6:
      v6 = *(double *)&v7;
      goto LABEL_10;
    case 0xAuLL:
    case 0x10uLL:
      v6 = 43.0;
      goto LABEL_10;
    case 0xBuLL:
    case 0xDuLL:
    case 0x11uLL:
    case 0x13uLL:
      v6 = 47.0;
      goto LABEL_10;
    case 0xCuLL:
    case 0x12uLL:
      v6 = 39.0;
      goto LABEL_10;
    case 0xEuLL:
    case 0x14uLL:
      v6 = 41.0;
      goto LABEL_10;
    case 0x15uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1BuLL:
      v6 = 59.0;
LABEL_11:
      v2 = 34.0;
      break;
    case 0x16uLL:
LABEL_25:
      v2 = 27.67;
      break;
    case 0x18uLL:
LABEL_26:
      v2 = 31.0;
      v6 = *(double *)&v3;
      break;
    case 0x1AuLL:
      break;
    case 0x1CuLL:
      v2 = 29.0;
      v6 = 51.0;
      break;
    default:
LABEL_10:
      v4 = *(_QWORD *)&v6;
      v5 = *(_QWORD *)&v6;
      v3 = *(_QWORD *)&v6;
      v2 = 0.0;
      switch(a1)
      {
        case 3uLL:
        case 5uLL:
        case 7uLL:
        case 9uLL:
        case 0xBuLL:
        case 0xDuLL:
        case 0xFuLL:
        case 0x11uLL:
        case 0x13uLL:
        case 0x15uLL:
        case 0x17uLL:
          goto LABEL_11;
        case 4uLL:
          goto LABEL_23;
        case 6uLL:
          goto LABEL_24;
        case 8uLL:
          v2 = 31.0;
          break;
        case 0xAuLL:
        case 0x10uLL:
          v2 = 29.0;
          break;
        case 0xCuLL:
        case 0x12uLL:
          v2 = 28.0;
          break;
        case 0xEuLL:
        case 0x14uLL:
          v2 = 29.67;
          break;
        case 0x16uLL:
          goto LABEL_25;
        case 0x18uLL:
          goto LABEL_26;
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x22uLL:
          goto LABEL_12;
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
          v2 = 20.0;
          break;
        default:
          v2 = 0.0;
          break;
      }
      break;
  }
LABEL_12:
  v8 = objc_alloc_init((Class)UISApplicationSupportDisplayEdgeInfo);
  if ((sub_100011130(a1) & 1) == 0 && (sub_10001115C(a1) || sub_10001114C(a1)))
  {
    v9 = sub_10001115C(a1);
    v10 = 15.0;
    if (v9)
    {
      if (a1 - 21 >= 8)
        v11 = 32.0;
      else
        v11 = 48.0;
      v12 = objc_msgSend(objc_alloc((Class)UISApplicationSupportDisplayEdgeInsetsWrapper), "initWithTop:left:bottom:right:", v11, 0.0, 0.0, 0.0);
      objc_msgSend(v8, "setPeripheryInsets:", v12);

      v10 = 21.0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
    objc_msgSend(v8, "setHomeAffordanceOverlayAllowance:", v13);

    v14 = objc_msgSend(objc_alloc((Class)UISApplicationSupportDisplayEdgeInsetsWrapper), "initWithTop:left:bottom:right:", v6, 0.0, v2, 0.0);
    objc_msgSend(v8, "setSafeAreaInsetsPortrait:", v14);

    objc_msgSend(v8, "setSystemMinimumMargin:", &off_100078E70);
  }
  return v8;
}

id sub_100037C74(unint64_t a1)
{
  CGSize size;
  uint64_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  uint64_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  double y;
  float64x2_t v14;
  float64x2_t v15;
  double height;
  double v17;
  float64_t v18;
  double v19;
  double v20;
  id v21;
  CGSize v23;
  double v24;

  size = CGRectNull.size;
  size.height = CGRectNull.origin.x;
  v23 = size;
  *(double *)&v3 = sub_100037838(a1);
  switch(a1)
  {
    case 3uLL:
    case 4uLL:
      v4 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v5 = (float64x2_t)xmmword_100055C80;
      goto LABEL_4;
    case 5uLL:
    case 6uLL:
      v4 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v5 = (float64x2_t)xmmword_100055C70;
LABEL_4:
      v6 = vdivq_f64(v5, v4);
      v7 = 90.0;
      goto LABEL_15;
    case 7uLL:
    case 8uLL:
      v6 = vdivq_f64((float64x2_t)xmmword_100055C60, (float64x2_t)vdupq_lane_s64(v3, 0));
      *(double *)&v8 = 64.0;
      goto LABEL_10;
    case 9uLL:
    case 0xAuLL:
      v6 = vdivq_f64((float64x2_t)xmmword_100055C50, (float64x2_t)vdupq_lane_s64(v3, 0));
      v7 = 98.88;
      goto LABEL_15;
    case 0xBuLL:
    case 0xCuLL:
      v9 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v10 = (float64x2_t)xmmword_100055C90;
      goto LABEL_9;
    case 0xDuLL:
    case 0xEuLL:
      v9 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v10 = (float64x2_t)xmmword_100055CA0;
LABEL_9:
      v6 = vdivq_f64(v10, v9);
      *(double *)&v8 = 96.0;
LABEL_10:
      v7 = *(double *)&v8;
      goto LABEL_15;
    case 0xFuLL:
    case 0x10uLL:
      v6 = vdivq_f64((float64x2_t)xmmword_100055CB0, (float64x2_t)vdupq_lane_s64(v3, 0));
      v7 = 107.52;
      goto LABEL_15;
    case 0x11uLL:
    case 0x12uLL:
      v11 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v12 = (float64x2_t)xmmword_100055CC0;
      goto LABEL_14;
    case 0x13uLL:
    case 0x14uLL:
      v11 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v12 = (float64x2_t)xmmword_100055CD0;
LABEL_14:
      v6 = vdivq_f64(v12, v11);
      v7 = 101.0;
LABEL_15:
      y = 0.0;
      goto LABEL_21;
    case 0x15uLL:
    case 0x16uLL:
      y = 34.0 / *(double *)&v3;
      v14 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v15 = (float64x2_t)xmmword_100055CE0;
      goto LABEL_20;
    case 0x17uLL:
    case 0x18uLL:
      y = 34.0 / *(double *)&v3;
      v14 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v15 = (float64x2_t)xmmword_100055CF0;
      goto LABEL_20;
    case 0x19uLL:
    case 0x1AuLL:
      y = 42.0 / *(double *)&v3;
      v14 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v15 = (float64x2_t)xmmword_100055D00;
      goto LABEL_20;
    case 0x1BuLL:
    case 0x1CuLL:
      y = 42.0 / *(double *)&v3;
      v14 = (float64x2_t)vdupq_lane_s64(v3, 0);
      v15 = (float64x2_t)xmmword_100055D10;
LABEL_20:
      v6 = vdivq_f64(v15, v14);
      v7 = 110.0;
LABEL_21:
      height = v7 / *(double *)&v3;
      break;
    default:
      y = CGRectNull.origin.y;
      height = CGRectNull.size.height;
      v6 = (float64x2_t)v23;
      break;
  }
  v17 = v6.f64[1];
  v18 = v6.f64[1];
  v19 = y;
  v24 = v6.f64[0];
  v20 = height;
  if (CGRectIsNull(*(CGRect *)(&v6 - 1)))
    v21 = 0;
  else
    v21 = objc_msgSend(objc_alloc((Class)UISDisplaySingleRectShape), "initWithRect:", v17, y, v24, height);
  return v21;
}

void sub_100038804(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "languageStrings"));
  v4 = objc_msgSend(v3, "count");

  v5 = objc_loadWeakRetained(v1);
  v7 = v5;
  if (v4)
  {
    objc_msgSend(v5, "_hideActivityView");

    v7 = objc_loadWeakRetained(v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView"));
    objc_msgSend(v6, "reloadData");

  }
  else
  {
    objc_msgSend(v5, "_showActivityView");
  }

}

void sub_10003891C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBLocationController sharedLocationController](CBLocationController, "sharedLocationController"));
  objc_msgSend(v2, "selectLanguage:restartAfterCompletion:", *(_QWORD *)(a1 + 32), 0);

}

id sub_100038E60(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  CFStringRef v9;
  id v10;

  v3 = a2;
  v4 = a1;
  v5 = objc_alloc((Class)NSAttributedString);
  v9 = kCTLanguageAttributeName;
  v10 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  v7 = objc_msgSend(v5, "initWithString:attributes:", v4, v6);
  return v7;
}

BOOL sub_1000391F4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100039208()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10003924C()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100039274(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

_QWORD *sub_1000392B4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

void sub_1000392E4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1000392F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  char v40;

  v3 = v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 8);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 16);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 24);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 32);
  v9 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 40);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 48);
  if (v7 == 1)
  {
    v34 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 8);
    v35 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent);
    v32 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 32);
    v33 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 24);
    v30 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 48);
    v31 = *(_QWORD *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 40);
    sub_100039440(v1, (uint64_t)&v36);
    v11 = v39;
    v12 = v40;
    v13 = *(_QWORD *)v3;
    v29 = *(_QWORD *)(v3 + 8);
    v14 = *(_QWORD *)(v3 + 16);
    v15 = *(_QWORD *)(v3 + 24);
    v16 = *(_QWORD *)(v3 + 32);
    v17 = *(_QWORD *)(v3 + 40);
    v18 = *(_QWORD *)(v3 + 48);
    v19 = v37;
    *(_OWORD *)v3 = v36;
    *(_OWORD *)(v3 + 16) = v19;
    *(_OWORD *)(v3 + 32) = v38;
    *(_QWORD *)(v3 + 48) = v11;
    *(_BYTE *)(v3 + 56) = v12;
    sub_10003ADB4(&v36);
    sub_10003ADFC(v13, v29, v14, v15, v16, v17, v18);
    v10 = v30;
    v9 = v31;
    v8 = v32;
    v6 = v33;
    v5 = v34;
    v4 = v35;
    v20 = v40;
    v22 = *((_QWORD *)&v38 + 1);
    v21 = v39;
    v24 = *((_QWORD *)&v37 + 1);
    v23 = v38;
    v26 = *((_QWORD *)&v36 + 1);
    v25 = v37;
    v27 = v36;
  }
  else
  {
    v20 = *(_BYTE *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 56) & 1;
    v27 = v4;
    v26 = v5;
    v25 = v7;
    v24 = v6;
    v23 = v8;
    v22 = v9;
    v21 = v10;
  }
  result = sub_10003AE3C(v4, v5, v7, v6, v8, v9, v10);
  *(_QWORD *)a1 = v27;
  *(_QWORD *)(a1 + 8) = v26;
  *(_QWORD *)(a1 + 16) = v25;
  *(_QWORD *)(a1 + 24) = v24;
  *(_QWORD *)(a1 + 32) = v23;
  *(_QWORD *)(a1 + 40) = v22;
  *(_QWORD *)(a1 + 48) = v21;
  *(_BYTE *)(a1 + 56) = v20;
  return result;
}

void sub_100039440(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  id v6;
  Class v7;
  NSString v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  Class isa;
  NSString v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[64];
  _BYTE v25[64];
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  sub_100039B48((uint64_t)v24);
  sub_10003AEC4((uint64_t)v24, (uint64_t)v33, &qword_10008B740);
  v4 = v34;
  if (v34 != 1)
  {
    v9 = v33[0];
    v12 = v36;
    v22 = v35;
    v23 = v33[1];
    v16 = v37;
    v15 = v38;
    v21 = v39;
    v17 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
LABEL_6:
    v18 = v17;
    isa = UInt._bridgeToObjectiveC()().super.super.isa;
    v20 = String._bridgeToObjectiveC()();
    objc_msgSend(v18, "setValue:forKey:", isa, v20);

    v14 = v15;
    v13 = v16;
    v11 = v22;
    v10 = v23;
    *(_BYTE *)(a1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead) = 1;
    v5 = v21 & 1;
    goto LABEL_7;
  }
  sub_100039F78((uint64_t)v25);
  sub_10003AEC4((uint64_t)v25, (uint64_t)v26, &qword_10008B740);
  v4 = v27;
  if (v27 != 1)
  {
    v9 = v26[0];
    v12 = v29;
    v22 = v28;
    v23 = v26[1];
    v16 = v30;
    v15 = v31;
    v21 = v32;
    v17 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
    goto LABEL_6;
  }
  v5 = sub_100039684() ^ 1;
  v6 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v7 = UInt._bridgeToObjectiveC()().super.super.isa;
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "setValue:forKey:", v7, v8);

  v9 = 0;
  v10 = 0;
  v4 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  *(_BYTE *)(a1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead) = 1;
LABEL_7:
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = v11;
  *(_QWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 40) = v13;
  *(_QWORD *)(a2 + 48) = v14;
  *(_BYTE *)(a2 + 56) = v5 & 1;
}

uint64_t sub_100039684()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  char v3;

  v1 = OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead;
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead);
  if (v2 == 2)
  {
    v3 = sub_1000396C8();
    *(_BYTE *)(v0 + v1) = v3 & 1;
  }
  else
  {
    v3 = v2 & 1;
  }
  return v3 & 1;
}

uint64_t sub_1000396C8()
{
  id v0;
  NSString v1;
  id v2;
  _BYTE v4[8];
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  v0 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v5, v2);

    swift_unknownObjectRelease(v2);
  }
  else
  {

    memset(v5, 0, sizeof(v5));
  }
  sub_10003AEC4((uint64_t)v5, (uint64_t)v6, &qword_10008B738);
  if (v7)
    return swift_dynamicCast(v4, v6, (char *)&type metadata for Any + 8, &type metadata for UInt, 6);
  sub_10003AC38((uint64_t)v6);
  return 0;
}

id sub_1000397D4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BootIntentManager()), "init");
  qword_10008C220 = (uint64_t)result;
  return result;
}

void sub_100039B48(uint64_t a1@<X8>)
{
  id v2;
  NSString v3;
  id v4;
  unint64_t v5;
  NSString v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  NSString v18;
  id v19;
  int v20;
  NSString v21;
  id v22;
  int v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[24];
  uint64_t v30;

  v2 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "objectForKey:", v3);

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(&v27, v4);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_10003AEC4((uint64_t)&v27, (uint64_t)v29, &qword_10008B738);
  if (!v30)
  {
    sub_10003AC38((uint64_t)v29);
LABEL_10:
    sub_10003AB14();
    v8 = (void *)static OS_os_log.default.getter();
    v9 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Failed to read boot intent from user defaults.", 46, 2, &_mh_execute_header, v8, v9, &_swiftEmptyArrayStorage);

    v5 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 1;
    goto LABEL_11;
  }
  if ((swift_dynamicCast(&v25, v29, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) == 0)
    goto LABEL_10;
  v5 = v25;
  if (v25 > 1)
    goto LABEL_10;
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v2, "objectForKey:", v6);

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)(&v27, v7);
    swift_unknownObjectRelease(v7);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_10003AEC4((uint64_t)&v27, (uint64_t)v29, &qword_10008B738);
  if (v30)
  {
    v17 = swift_dynamicCast(&v25, v29, (char *)&type metadata for Any + 8, &type metadata for String, 6);
    if (v17)
      v10 = v25;
    else
      v10 = 0;
    if (v17)
      v16 = v26;
    else
      v16 = 0;
  }
  else
  {
    sub_10003AC38((uint64_t)v29);
    v10 = 0;
    v16 = 0;
  }
  v18 = String._bridgeToObjectiveC()();
  v19 = objc_msgSend(v2, "objectForKey:", v18);

  if (v19)
  {
    _bridgeAnyObjectToAny(_:)(&v27, v19);
    swift_unknownObjectRelease(v19);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_10003AEC4((uint64_t)&v27, (uint64_t)v29, &qword_10008B738);
  if (v30)
  {
    v20 = swift_dynamicCast(&v25, v29, (char *)&type metadata for Any + 8, &type metadata for String, 6);
    if (v20)
      v11 = v25;
    else
      v11 = 0;
    if (v20)
      v12 = v26;
    else
      v12 = 0;
  }
  else
  {
    sub_10003AC38((uint64_t)v29);
    v11 = 0;
    v12 = 0;
  }
  v21 = String._bridgeToObjectiveC()();
  v22 = objc_msgSend(v2, "objectForKey:", v21);

  if (v22)
  {
    _bridgeAnyObjectToAny(_:)(&v27, v22);
    swift_unknownObjectRelease(v22);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_10003AEC4((uint64_t)&v27, (uint64_t)v29, &qword_10008B738);
  if (v30)
  {
    v23 = swift_dynamicCast(&v25, v29, (char *)&type metadata for Any + 8, &type metadata for String, 6);
    if (v23)
      v13 = v25;
    else
      v13 = 0;
    if (v23)
      v14 = v26;
    else
      v14 = 0;
  }
  else
  {
    sub_10003AC38((uint64_t)v29);
    v13 = 0;
    v14 = 0;
  }
  v24 = sub_100039684();

  v15 = (v24 & 1) == 0;
LABEL_11:
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v10;
  *(_QWORD *)(a1 + 16) = v16;
  *(_QWORD *)(a1 + 24) = v11;
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v13;
  *(_QWORD *)(a1 + 48) = v14;
  *(_BYTE *)(a1 + 56) = v15;
}

void sub_100039F78(uint64_t a1@<X8>)
{
  id v2;
  uint64_t ObjCClassMetadata;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  int v44;
  unint64_t v45;
  char v46;
  unint64_t v47;
  char v48;
  int v49;
  unint64_t v50;
  char v51;
  int v52;
  _QWORD v53[2];
  _QWORD v54[3];
  char v55[16];
  id v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;

  v2 = sub_10003AA5C();
  if (!v2)
  {
    sub_10003AB14();
    v11 = (void *)((uint64_t (*)(void))static OS_os_log.default.getter)();
    v12 = ((uint64_t (*)(void))static os_log_type_t.default.getter)();
    os_log(_:dso:log:type:_:)("Unable to get CoreRepair class for reading boot intent data", 59, 2, &_mh_execute_header, v11, v12, &_swiftEmptyArrayStorage, v53[0], v53[1]);
LABEL_17:

    goto LABEL_18;
  }
  ObjCClassMetadata = swift_getObjCClassMetadata(v2);
  v56 = 0;
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(ObjCClassMetadata), "getSsrBootIntentWithError:", &v56);
  v5 = v56;
  if (v4)
  {
    v6 = v4;
    v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v8 = v5;
    swift_bridgeObjectRetain(v7);

    strcpy((char *)v53, "purpose");
    v53[1] = 0xE700000000000000;
    swift_bridgeObjectRetain(v7);
    AnyHashable.init<A>(_:)(&v56, v53, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v7 + 16) && (v9 = sub_10003ABD4((uint64_t)&v56), (v10 & 1) != 0))
    {
      sub_10003AC78(*(_QWORD *)(v7 + 56) + 32 * v9, (uint64_t)&v58);
    }
    else
    {
      v58 = 0u;
      v59 = 0u;
    }
    swift_bridgeObjectRelease(v7);
    sub_10003AC04((uint64_t)&v56);
    if (*((_QWORD *)&v59 + 1))
    {
      if ((swift_dynamicCast(&v56, &v58, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v13 = v57;
        if (v56 == (id)0xD000000000000013 && v57 == 0x800000010006C3E0)
        {
          swift_bridgeObjectRelease(0x800000010006C3E0);
        }
        else
        {
          v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v56, v57);
          swift_bridgeObjectRelease(v13);
          if ((v36 & 1) == 0)
          {
            v28 = 0;
            goto LABEL_23;
          }
        }
        v37 = sub_10003AB14();
        v39 = (void *)static OS_os_log.default.getter(v37, v38);
        v41 = static os_log_type_t.default.getter(v39, v40);
        os_log(_:dso:log:type:_:)("Boot intent set to self service repair", 38, 2, &_mh_execute_header, v39, v41, &_swiftEmptyArrayStorage, v53[0], v53[1]);

        v28 = 1;
LABEL_23:
        strcpy((char *)&v58, "ActiveLocale");
        BYTE13(v58) = 0;
        HIWORD(v58) = -5120;
        swift_bridgeObjectRetain(v7);
        AnyHashable.init<A>(_:)(&v56, &v58, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(v7 + 16) && (v42 = sub_10003ABD4((uint64_t)&v56), (v43 & 1) != 0))
        {
          sub_10003AC78(*(_QWORD *)(v7 + 56) + 32 * v42, (uint64_t)&v58);
        }
        else
        {
          v58 = 0u;
          v59 = 0u;
        }
        swift_bridgeObjectRelease(v7);
        sub_10003AC04((uint64_t)&v56);
        if (*((_QWORD *)&v59 + 1))
        {
          v44 = swift_dynamicCast(&v56, &v58, (char *)&type metadata for Any + 8, &type metadata for String, 6);
          if (v44)
            v29 = v56;
          else
            v29 = 0;
          if (v44)
            v35 = v57;
          else
            v35 = 0;
        }
        else
        {
          sub_10003AC38((uint64_t)&v58);
          v29 = 0;
          v35 = 0;
        }
        v53[0] = 0xD000000000000013;
        v53[1] = 0x800000010006C400;
        AnyHashable.init<A>(_:)(&v56, v53, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(v7 + 16) && (v45 = sub_10003ABD4((uint64_t)&v56), (v46 & 1) != 0))
        {
          sub_10003AC78(*(_QWORD *)(v7 + 56) + 32 * v45, (uint64_t)&v58);
        }
        else
        {
          v58 = 0u;
          v59 = 0u;
        }
        swift_bridgeObjectRelease(v7);
        sub_10003AC04((uint64_t)&v56);
        if (*((_QWORD *)&v59 + 1))
        {
          if ((swift_dynamicCast(&v56, &v58, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0
            && v56 == 1)
          {
            *(_QWORD *)&v58 = 0x6F50737365636341;
            *((_QWORD *)&v58 + 1) = 0xEB00000000746E69;
            AnyHashable.init<A>(_:)(&v56, &v58, &type metadata for String, &protocol witness table for String);
            if (*(_QWORD *)(v7 + 16))
            {
              v47 = sub_10003ABD4((uint64_t)&v56);
              if ((v48 & 1) != 0)
              {
                sub_10003AC78(*(_QWORD *)(v7 + 56) + 32 * v47, (uint64_t)&v58);
              }
              else
              {
                v58 = 0u;
                v59 = 0u;
              }
            }
            else
            {
              v58 = 0u;
              v59 = 0u;
            }
            sub_10003AC04((uint64_t)&v56);
            if (*((_QWORD *)&v59 + 1))
            {
              v49 = swift_dynamicCast(&v56, &v58, (char *)&type metadata for Any + 8, &type metadata for String, 6);
              if (v49)
                v30 = v56;
              else
                v30 = 0;
              if (v49)
                v31 = v57;
              else
                v31 = 0;
            }
            else
            {
              sub_10003AC38((uint64_t)&v58);
              v30 = 0;
              v31 = 0;
            }
            strcpy((char *)v53, "AccessPointPwd");
            HIBYTE(v53[1]) = -18;
            AnyHashable.init<A>(_:)(&v56, v53, &type metadata for String, &protocol witness table for String);
            if (*(_QWORD *)(v7 + 16) && (v50 = sub_10003ABD4((uint64_t)&v56), (v51 & 1) != 0))
            {
              sub_10003AC78(*(_QWORD *)(v7 + 56) + 32 * v50, (uint64_t)&v58);
            }
            else
            {
              v58 = 0u;
              v59 = 0u;
            }
            swift_bridgeObjectRelease(v7);
            sub_10003AC04((uint64_t)&v56);
            if (*((_QWORD *)&v59 + 1))
            {
              v52 = swift_dynamicCast(&v56, &v58, (char *)&type metadata for Any + 8, &type metadata for String, 6);
              if (v52)
                v32 = v56;
              else
                v32 = 0;
              if (v52)
                v33 = v57;
              else
                v33 = 0;
            }
            else
            {
              sub_10003AC38((uint64_t)&v58);
              v32 = 0;
              v33 = 0;
            }
            goto LABEL_48;
          }
          swift_bridgeObjectRelease(v7);
        }
        else
        {
          swift_bridgeObjectRelease(v7);
          sub_10003AC38((uint64_t)&v58);
        }
        v32 = 0;
        v33 = 0;
        v30 = 0;
        v31 = 0;
LABEL_48:
        v34 = (sub_100039684() & 1) == 0;
        goto LABEL_19;
      }
      swift_bridgeObjectRelease_n(v7, 2);
    }
    else
    {
      swift_bridgeObjectRelease_n(v7, 2);
      sub_10003AC38((uint64_t)&v58);
    }
    v24 = sub_10003AB14();
    v11 = (void *)static OS_os_log.default.getter(v24, v25);
    v27 = static os_log_type_t.default.getter(v11, v26);
    os_log(_:dso:log:type:_:)("No boot intent set by ssr", 25, 2, &_mh_execute_header, v11, v27, &_swiftEmptyArrayStorage, v53[0], v53[1]);
    goto LABEL_17;
  }
  v14 = v56;
  v15 = _convertNSErrorToError(_:)(v5);

  v16 = swift_willThrow();
  v17 = static os_log_type_t.error.getter(v16);
  v18 = sub_10003AB50((uint64_t *)&unk_10008B8C0);
  v19 = swift_allocObject(v18, 72, 7);
  *(_OWORD *)(v19 + 16) = xmmword_100055D20;
  swift_getErrorValue(v15, v55, v54);
  v20 = Error.localizedDescription.getter(v54[1], v54[2]);
  v22 = v21;
  *(_QWORD *)(v19 + 56) = &type metadata for String;
  *(_QWORD *)(v19 + 64) = sub_10003AB90();
  *(_QWORD *)(v19 + 32) = v20;
  *(_QWORD *)(v19 + 40) = v22;
  sub_10003AB14();
  v23 = (void *)((uint64_t (*)(void))static OS_os_log.default.getter)();
  os_log(_:dso:log:type:_:)("Failed to read Core Repair boot intent with error %@", 52, 2, &_mh_execute_header, v23, v17, v19);
  swift_bridgeObjectRelease(v19);

  swift_errorRelease(v15);
LABEL_18:
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 1;
LABEL_19:
  *(_QWORD *)a1 = v28;
  *(_QWORD *)(a1 + 8) = v29;
  *(_QWORD *)(a1 + 16) = v35;
  *(_QWORD *)(a1 + 24) = v30;
  *(_QWORD *)(a1 + 32) = v31;
  *(_QWORD *)(a1 + 40) = v32;
  *(_QWORD *)(a1 + 48) = v33;
  *(_BYTE *)(a1 + 56) = v34;
}

id sub_10003A738()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BootIntentManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BootIntentManager()
{
  return objc_opt_self(CBBootIntentManager);
}

uint64_t initializeBufferWithCopyOfBuffer for BootIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for BootIntent(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(a1[4]);
  return swift_bridgeObjectRelease(a1[6]);
}

uint64_t initializeWithCopy for BootIntent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v5 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v4;
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v6;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t assignWithCopy for BootIntent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for BootIntent(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for BootIntent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v4);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease(v6);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for BootIntent(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 57))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BootIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BootIntent()
{
  return &type metadata for BootIntent;
}

id sub_10003AA5C()
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
  v0 = (void *)qword_10008BFF0;
  v7 = qword_10008BFF0;
  if (!qword_10008BFF0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003AFB0;
    v3[3] = &unk_1000764C0;
    v3[4] = &v4;
    sub_10003AFB0(v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10003AAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_10003AB14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10008B728;
  if (!qword_10008B728)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10008B728);
  }
  return result;
}

uint64_t sub_10003AB50(uint64_t *a1)
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

unint64_t sub_10003AB90()
{
  unint64_t result;

  result = qword_10008B730;
  if (!qword_10008B730)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10008B730);
  }
  return result;
}

unint64_t sub_10003ABD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10003ACB4(a1, v4);
}

uint64_t sub_10003AC04(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10003AC38(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10003AB50(&qword_10008B738);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003AC78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10003ACB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_10003AD78(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10003AC04((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10003AD78(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

_QWORD *sub_10003ADB4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[2];
  v3 = a1[4];
  swift_bridgeObjectRetain(a1[6]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t sub_10003ADFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;

  if (a3 != 1)
  {
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a5);
    return swift_bridgeObjectRelease(a7);
  }
  return result;
}

uint64_t sub_10003AE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;

  if (a3 != 1)
  {
    swift_bridgeObjectRetain(a7);
    swift_bridgeObjectRetain(a3);
    return swift_bridgeObjectRetain(a5);
  }
  return result;
}

_QWORD *sub_10003AE7C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a1[6];
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t sub_10003AEC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10003AB50(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003AF08(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_10003AF30(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return a1;
}

ValueMetadata *type metadata accessor for BootIntentReason()
{
  return &type metadata for BootIntentReason;
}

unint64_t sub_10003AF6C()
{
  unint64_t result;

  result = qword_10008B750;
  if (!qword_10008B750)
  {
    result = swift_getWitnessTable(&unk_100055DEC, &type metadata for BootIntentReason);
    atomic_store(result, (unint64_t *)&qword_10008B750);
  }
  return result;
}

Class sub_10003AFB0(_QWORD *a1)
{
  void *v2;
  Class result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  v7 = 0;
  if (!qword_10008BFF8)
  {
    v8 = off_100076678;
    v9 = 0;
    qword_10008BFF8 = _sl_dlopen(&v8, &v7);
  }
  if (qword_10008BFF8)
  {
    v2 = v7;
    if (!v7)
      goto LABEL_5;
  }
  else
  {
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CoreRepairCoreLibrary(void)"));
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CheckerBoard-Bridging-Header.h"), 10, CFSTR("%s"), v7);

    __break(1u);
  }
  free(v2);
LABEL_5:
  result = objc_getClass("CRRepairStatusLite");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getCRRepairStatusLiteClass(void)_block_invoke"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("CheckerBoard-Bridging-Header.h"), 11, CFSTR("Unable to find class %s"), "CRRepairStatusLite");

    __break(1u);
  }
  qword_10008BFF0 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

NSString sub_10003B150()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_10008C228 = (uint64_t)result;
  return result;
}

void sub_10003B1C4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  Class isa;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[14];
  objc_super v69;

  v1 = v0;
  v2 = type metadata accessor for Locale(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for DebugInfoViewController();
  v69.receiver = v0;
  v69.super_class = v6;
  objc_msgSendSuper2(&v69, "viewDidLoad");
  v7 = objc_msgSend((id)objc_opt_self(CBUtilities), "wasRemoteSetupPerformed");
  v8 = static Locale.current.getter();
  v9 = Locale.identifier.getter(v8);
  v11 = v10;
  v12 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13 = (id)MobileGestalt_get_current_device(v12);
  if (!v13)
  {
    __break(1u);
    goto LABEL_16;
  }
  v14 = v13;
  v15 = MobileGestalt_get_inDiagnosticsMode();

  v17 = (id)MobileGestalt_get_current_device(v16);
  if (!v17)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18 = v17;
  v19 = (id)MobileGestalt_copy_buildVersion_obj();

  if (!v19)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  v22 = v21;

  v23 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DebugInfoState(0)), "init");
  sub_1000434AC(v7, v9, v11, v15, v20, v22, (uint64_t)v23, 0, (uint64_t)v68, 0, 0, 0xE000000000000000);
  v24 = objc_allocWithZone((Class)sub_10003AB50(&qword_10008B8D0));
  v25 = (void *)UIHostingController.init(rootView:)(v68);
  v26 = objc_msgSend(v25, "view");
  if (!v26)
  {
    v65 = static os_log_type_t.error.getter(0);
    v66 = sub_100043D28(0, (unint64_t *)&qword_10008B728, OS_os_log_ptr);
    v27 = (void *)static OS_os_log.default.getter(v66, v67);
    os_log(_:dso:log:type:_:)("Unable to get view for debugInfoViewController!", 47, 2, &_mh_execute_header, v27, v65, &_swiftEmptyArrayStorage);
    goto LABEL_14;
  }
  v27 = v26;
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "addChildViewController:", v25);
  v28 = objc_msgSend(v1, "view");
  if (!v28)
    goto LABEL_18;
  v29 = v28;
  objc_msgSend(v28, "addSubview:", v27);

  v30 = sub_10003AB50(&qword_10008B8D8);
  v31 = swift_allocObject(v30, 80, 7);
  *(_OWORD *)(v31 + 16) = xmmword_100055E20;
  v32 = objc_msgSend(v27, "centerXAnchor");
  v33 = objc_msgSend(v1, "view");
  if (!v33)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v34 = v33;
  v35 = objc_msgSend(v33, "centerXAnchor");

  v36 = objc_msgSend(v32, "constraintEqualToAnchor:", v35);
  *(_QWORD *)(v31 + 32) = v36;
  v37 = objc_msgSend(v27, "centerYAnchor");
  v38 = objc_msgSend(v1, "view");
  if (!v38)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v39 = v38;
  v40 = objc_msgSend(v38, "centerYAnchor");

  v41 = objc_msgSend(v37, "constraintEqualToAnchor:", v40);
  *(_QWORD *)(v31 + 40) = v41;
  v42 = objc_msgSend(v27, "topAnchor");
  v43 = objc_msgSend(v1, "view");
  if (!v43)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v44 = v43;
  v45 = objc_msgSend(v43, "topAnchor");

  v46 = objc_msgSend(v42, "constraintEqualToAnchor:", v45);
  *(_QWORD *)(v31 + 48) = v46;
  v47 = objc_msgSend(v27, "bottomAnchor");
  v48 = objc_msgSend(v1, "view");
  if (!v48)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v49 = v48;
  v50 = objc_msgSend(v48, "bottomAnchor");

  v51 = objc_msgSend(v47, "constraintEqualToAnchor:", v50);
  *(_QWORD *)(v31 + 56) = v51;
  v52 = objc_msgSend(v27, "leadingAnchor");
  v53 = objc_msgSend(v1, "view");
  if (!v53)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v54 = v53;
  v55 = objc_msgSend(v53, "leadingAnchor");

  v56 = objc_msgSend(v52, "constraintEqualToAnchor:", v55);
  *(_QWORD *)(v31 + 64) = v56;
  v57 = objc_msgSend(v27, "trailingAnchor");
  v58 = objc_msgSend(v1, "view");
  if (v58)
  {
    v59 = v58;
    v60 = (void *)objc_opt_self(NSLayoutConstraint);
    v61 = objc_msgSend(v59, "trailingAnchor");

    v62 = objc_msgSend(v57, "constraintEqualToAnchor:", v61);
    *(_QWORD *)(v31 + 72) = v62;
    v68[0] = v31;
    specialized Array._endMutation()();
    v63 = v68[0];
    sub_100043D28(0, &qword_10008B8E0, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v63);
    objc_msgSend(v60, "activateConstraints:", isa);

    objc_msgSend(v25, "didMoveToParentViewController:", v1);
LABEL_14:

    return;
  }
LABEL_24:
  __break(1u);
}

id sub_10003B8FC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DebugInfoViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DebugInfoViewController()
{
  return objc_opt_self(CBDebugInfoViewController);
}

uint64_t sub_10003B950(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE v16[16];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[2];

  v2 = sub_10003AB50(&qword_10008B900);
  v3 = __chkstk_darwin(v2);
  v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)v5 = static HorizontalAlignment.center.getter(v3);
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = sub_10003AB50(&qword_10008B908);
  sub_10003BB1C(a1, &v5[*(int *)(v6 + 44)]);
  v19 = *(_OWORD *)(a1 + 88);
  v20 = *(_QWORD *)(a1 + 104);
  v7 = sub_10003AB50(&qword_10008B910);
  State.wrappedValue.getter(v21, v7);
  v18 = *(_OWORD *)(a1 + 72);
  v8 = sub_10003AB50(&qword_10008B918);
  State.projectedValue.getter(&v19, v8);
  v9 = v19;
  v10 = v20;
  v17 = a1;
  v11 = sub_10003AB50(&qword_10008B920);
  v12 = sub_100044F0C(&qword_10008B928, &qword_10008B900, (uint64_t)&protocol conformance descriptor for VStack<A>);
  v13 = sub_100043960();
  v14 = sub_100044F0C(&qword_10008B938, &qword_10008B920, (uint64_t)&protocol conformance descriptor for Button<A>);
  View.alert<A, B>(_:isPresented:actions:)(v21, v9, *((_QWORD *)&v9 + 1), v10, sub_100043958, v16, v2, &type metadata for String, v11, v12, v13, v14);
  swift_release(*((_QWORD *)&v9 + 1));
  swift_release(v9);
  swift_bridgeObjectRelease(v21[1]);
  return sub_100044BA8((uint64_t)v5, &qword_10008B900);
}

uint64_t sub_10003BB1C@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v46[12];
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t KeyPath;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[3];
  _QWORD v70[2];
  char v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  char v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  char v87;
  __int128 v88;
  __int128 v89;
  char v90;

  v4 = sub_10003AB50(&qword_10008B948);
  v5 = __chkstk_darwin(v4);
  v7 = &v46[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __chkstk_darwin(v5);
  v10 = &v46[-v9];
  v54 = static VerticalAlignment.center.getter(v8);
  v53 = static HorizontalAlignment.center.getter(v54);
  v11 = static Font.title.getter();
  v12 = Text.font(_:)(v11, 0xD000000000000012, 0x800000010006C9A0, 0, &_swiftEmptyArrayStorage);
  v48 = v13;
  v49 = v12;
  v52 = v14;
  v16 = v15;
  swift_release(v11);
  KeyPath = swift_getKeyPath(&unk_100056178);
  v50 = static Edge.Set.top.getter();
  v17 = EdgeInsets.init(_all:)(64.0);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = static Edge.Set.leading.getter();
  v25 = static Edge.Set.trailing.getter();
  v26 = Edge.Set.init(rawValue:)(0);
  v27 = Edge.Set.init(rawValue:)(v26);
  if (Edge.Set.init(rawValue:)(v27 & v24) != v24)
    v26 = Edge.Set.init(rawValue:)(v26 | v24);
  v28 = Edge.Set.init(rawValue:)(v26);
  v29 = Edge.Set.init(rawValue:)(v28 & v25);
  if (v29 != v25)
  {
    v29 = Edge.Set.init(rawValue:)(v26 | v25);
    LOBYTE(v26) = v29;
  }
  v58 = 1;
  v57 = 1;
  v30 = v16 & 1;
  v56 = v30;
  v47 = v30;
  v55 = 0;
  v59 = 1;
  *(_QWORD *)v10 = static HorizontalAlignment.center.getter(v29);
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v31 = sub_10003AB50(&qword_10008B950);
  sub_10003BE68(a1, (uint64_t)&v10[*(int *)(v31 + 44)]);
  v32 = v59;
  sub_100044BE4((uint64_t)v10, (uint64_t)v7, &qword_10008B948);
  v60 = (unint64_t)v54;
  LOBYTE(v61) = 1;
  *((_QWORD *)&v61 + 1) = v53;
  *(_QWORD *)&v62 = 0;
  BYTE8(v62) = 1;
  v33 = v49;
  *(_QWORD *)&v63 = v49;
  *((_QWORD *)&v63 + 1) = v52;
  LOBYTE(v64) = v30;
  v34 = v48;
  *((_QWORD *)&v64 + 1) = v48;
  *(_QWORD *)&v65 = KeyPath;
  BYTE8(v65) = 1;
  LOBYTE(v66) = v50;
  *((double *)&v66 + 1) = v17;
  *(_QWORD *)&v67 = v19;
  *((_QWORD *)&v67 + 1) = v21;
  *(_QWORD *)&v68 = v23;
  BYTE8(v68) = 0;
  LOBYTE(v69[0]) = v26;
  *(_OWORD *)((char *)&v69[1] + 8) = 0u;
  *(_OWORD *)((char *)v69 + 8) = 0u;
  BYTE8(v69[2]) = v32;
  v35 = v64;
  v36 = v65;
  v37 = v67;
  a2[6] = v66;
  a2[7] = v37;
  a2[4] = v35;
  a2[5] = v36;
  v38 = v60;
  v39 = v61;
  v40 = v63;
  a2[2] = v62;
  a2[3] = v40;
  *a2 = v38;
  a2[1] = v39;
  v41 = v68;
  v42 = v69[0];
  v43 = v69[1];
  *(_OWORD *)((char *)a2 + 169) = *(_OWORD *)((char *)&v69[1] + 9);
  a2[9] = v42;
  a2[10] = v43;
  a2[8] = v41;
  v44 = sub_10003AB50(&qword_10008B958);
  sub_100044BE4((uint64_t)v7, (uint64_t)a2 + *(int *)(v44 + 48), &qword_10008B948);
  sub_100043AB8((uint64_t)&v60);
  sub_100044BA8((uint64_t)v10, &qword_10008B948);
  sub_100044BA8((uint64_t)v7, &qword_10008B948);
  v70[0] = v54;
  v70[1] = 0;
  v71 = 1;
  v72 = v53;
  v73 = 0;
  v74 = 1;
  v75 = v33;
  v76 = v52;
  v77 = v47;
  v78 = v34;
  v79 = KeyPath;
  v80 = 1;
  v81 = v50;
  v82 = v17;
  v83 = v19;
  v84 = v21;
  v85 = v23;
  v86 = 0;
  v87 = v26;
  v89 = 0u;
  v88 = 0u;
  v90 = v32;
  return sub_100043B14((uint64_t)v70);
}

uint64_t sub_10003BE68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int *v25;
  uint64_t v26;
  uint64_t v28;

  v4 = sub_10003AB50(&qword_10008B960);
  __chkstk_darwin(v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10003AB50(&qword_10008B968);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v28 - v11;
  v13 = sub_10003AB50(&qword_10008B970);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v28 - v18;
  *(_QWORD *)v19 = static HorizontalAlignment.center.getter(v17);
  *((_QWORD *)v19 + 1) = 0;
  v19[16] = 1;
  v20 = sub_10003AB50(&qword_10008B978);
  v21 = sub_10003C0E8(a1, (uint64_t)&v19[*(int *)(v20 + 44)]);
  *(_QWORD *)v6 = static HorizontalAlignment.center.getter(v21);
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v22 = sub_10003AB50(&qword_10008B980);
  v23 = sub_10003DE3C(a1, (uint64_t)&v6[*(int *)(v22 + 44)]);
  LOBYTE(a1) = static Edge.Set.bottom.getter(v23);
  sub_100044BE4((uint64_t)v6, (uint64_t)v10, &qword_10008B960);
  v24 = &v10[*(int *)(v7 + 36)];
  *v24 = a1;
  *(_OWORD *)(v24 + 8) = 0u;
  *(_OWORD *)(v24 + 24) = 0u;
  v24[40] = 1;
  sub_100044BA8((uint64_t)v6, &qword_10008B960);
  sub_10003AEC4((uint64_t)v10, (uint64_t)v12, &qword_10008B968);
  sub_100044BE4((uint64_t)v19, (uint64_t)v16, &qword_10008B970);
  sub_100044BE4((uint64_t)v12, (uint64_t)v10, &qword_10008B968);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v25 = (int *)sub_10003AB50(&qword_10008B988);
  sub_100044BE4((uint64_t)v16, a2 + v25[12], &qword_10008B970);
  v26 = a2 + v25[16];
  *(_QWORD *)v26 = 0;
  *(_BYTE *)(v26 + 8) = 1;
  sub_100044BE4((uint64_t)v10, a2 + v25[20], &qword_10008B968);
  sub_100044BA8((uint64_t)v12, &qword_10008B968);
  sub_100044BA8((uint64_t)v19, &qword_10008B970);
  sub_100044BA8((uint64_t)v10, &qword_10008B968);
  return sub_100044BA8((uint64_t)v16, &qword_10008B970);
}

uint64_t sub_10003C0E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _BYTE v169[176];
  char v170;
  char v171;
  char v172;
  char v173;
  char v174;
  char v175;
  char v176;
  char v177;
  char v178;
  char v179;
  char v180;
  char v181;
  unsigned __int8 v182;
  char v183;
  char v184;
  char v185;
  _QWORD v186[22];
  __int128 v187;
  char v188;
  uint64_t v189;
  uint64_t v190;
  char v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  char v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  char v199;
  uint64_t v200;
  uint64_t v201;
  char v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unsigned __int8 v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  unsigned __int8 v214;
  uint64_t v215;

  sub_10003AB50(&qword_10008B9E8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v149 = (uint64_t)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v143 = (uint64_t *)((char *)&v77 - v7);
  v102 = static VerticalAlignment.center.getter(v6);
  v8 = sub_10003CE3C(a1, (uint64_t)&v208);
  v114 = v209;
  v115 = v208;
  v104 = v210;
  v118 = v212;
  v116 = v211;
  v117 = v213;
  v130 = v214;
  v168 = v215;
  v101 = static VerticalAlignment.center.getter(v8);
  v9 = sub_10003CEFC(a1, (uint64_t)&v208);
  v163 = v208;
  v162 = v209;
  v103 = v210;
  v164 = v211;
  v166 = v212;
  v165 = v213;
  v122 = v214;
  v167 = v215;
  v100 = static VerticalAlignment.center.getter(v9);
  v10 = sub_10003D1C4(a1, (uint64_t)&v208);
  v158 = v208;
  v157 = v209;
  v119 = v210;
  v159 = v211;
  v160 = v212;
  v113 = v213;
  v124 = v214;
  v161 = v215;
  v99 = static VerticalAlignment.center.getter(v10);
  v11 = sub_10003D398(a1, (uint64_t)&v208);
  v152 = v208;
  v151 = v209;
  v120 = v210;
  v153 = v211;
  v155 = v212;
  v154 = v213;
  v126 = v214;
  v156 = v215;
  v98 = static VerticalAlignment.center.getter(v11);
  v12 = sub_10003D490(a1, (uint64_t)&v208);
  v144 = v209;
  v145 = v208;
  v121 = v210;
  v148 = v212;
  v146 = v211;
  v147 = v213;
  v128 = v214;
  v150 = v215;
  v97 = static VerticalAlignment.center.getter(v12);
  v13 = sub_10003D5E8((_BYTE *)a1, (uint64_t)&v208);
  v137 = v209;
  v138 = v208;
  v123 = v210;
  v139 = v211;
  v140 = v213;
  v129 = v214;
  v141 = v212;
  v142 = v215;
  v96 = static VerticalAlignment.center.getter(v13);
  v14 = sub_10003D6C8(a1, (uint64_t)&v208);
  v111 = v209;
  v112 = v208;
  v125 = v210;
  v133 = v211;
  v134 = v213;
  v131 = v214;
  v135 = v212;
  v136 = v215;
  v95 = static VerticalAlignment.center.getter(v14);
  sub_10003D7A8(a1, (uint64_t)&v208);
  v105 = v209;
  v106 = v208;
  v127 = v210;
  v107 = v211;
  v108 = v213;
  v132 = v214;
  v109 = v212;
  v110 = v215;
  v15 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_100056000);
  v208 = v15;
  v17 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v208, KeyPath, v17);
  v18 = swift_release(KeyPath);
  if (*(_BYTE *)(v15 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) == 1)
  {
    v85 = static VerticalAlignment.center.getter(v18);
    v19 = sub_10003D900(a1, (uint64_t)&v208);
    v20 = v208;
    v21 = v209;
    v80 = v208;
    v81 = v209;
    v22 = v210;
    v23 = v211;
    v82 = v211;
    v24 = v212;
    v25 = v213;
    v77 = v213;
    v78 = v212;
    v26 = v214;
    v93 = v215;
    v84 = static VerticalAlignment.center.getter(v19);
    sub_10003DA44(a1, (uint64_t)&v208);
    v91 = v209;
    v92 = v208;
    v89 = v212;
    v90 = v211;
    v88 = v213;
    v87 = v214;
    v86 = v215;
    LOBYTE(v186[0]) = 1;
    v27 = v22;
    v79 = v22;
    v169[0] = v22;
    LOBYTE(v22) = v26;
    v185 = v26;
    v94 = v26;
    v184 = 1;
    v183 = v210;
    LOBYTE(v26) = v210;
    v182 = v214;
    sub_100043B04(v20, v21, v27);
    swift_bridgeObjectRetain(v23);
    sub_100043B04(v24, v25, v22);
    swift_bridgeObjectRetain(v93);
    v29 = v91;
    v28 = v92;
    v83 = a1;
    v30 = v26;
    sub_100043B04(v92, v91, v26);
    v31 = v90;
    swift_bridgeObjectRetain(v90);
    v33 = v88;
    v32 = v89;
    LOBYTE(v23) = v87;
    sub_100043B04(v89, v88, v87);
    v34 = v86;
    swift_bridgeObjectRetain(v86);
    sub_100043B60(v28, v29, v30);
    swift_bridgeObjectRelease(v31);
    sub_100043B60(v32, v33, v23);
    swift_bridgeObjectRelease(v34);
    v35 = v80;
    v36 = v81;
    LOBYTE(v32) = v79;
    sub_100043B60(v80, v81, v79);
    v37 = v82;
    swift_bridgeObjectRelease(v82);
    v39 = v77;
    v38 = v78;
    sub_100043B60(v78, v77, v94);
    v40 = v93;
    swift_bridgeObjectRelease(v93);
    v187 = (unint64_t)v85;
    v188 = 1;
    v189 = v35;
    v190 = v36;
    v191 = v32;
    v192 = v37;
    v193 = v38;
    v194 = v39;
    v195 = v94;
    v196 = v40;
    v197 = v84;
    v198 = 0;
    v199 = 1;
    v200 = v92;
    v201 = v91;
    v202 = v30;
    a1 = v83;
    v203 = v90;
    v204 = v89;
    v205 = v88;
    v206 = v87;
    v207 = v86;
    nullsub_2(&v187);
  }
  else
  {
    sub_100043DE4(&v187);
  }
  sub_10003AEC4((uint64_t)&v187, (uint64_t)&v208, &qword_10008B9F0);
  v187 = *(_OWORD *)(a1 + 56);
  v41 = sub_10003AB50(&qword_10008B918);
  v42 = State.wrappedValue.getter(v186, v41);
  if (LOBYTE(v186[0]) == 1)
  {
    v43 = static VerticalAlignment.center.getter(v42);
    v44 = v143;
    *v143 = v43;
    v44[1] = 0;
    *((_BYTE *)v44 + 16) = 1;
    sub_10003AB50(&qword_10008BA08);
    v45 = sub_10003AB50(&qword_10008BA10);
    v46 = sub_100044F0C(&qword_10008BA18, &qword_10008BA10, (uint64_t)&protocol conformance descriptor for VStack<A>);
    ProgressView<>.init(label:)(sub_10003DCFC, 0, v45, v46);
    v47 = sub_10003AB50(&qword_10008B9F8);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v44, 0, 1, v47);
  }
  else
  {
    v48 = sub_10003AB50(&qword_10008B9F8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v143, 1, 1, v48);
  }
  v49 = v103;
  v185 = v104;
  v50 = v104;
  v184 = v130;
  v183 = v103;
  v182 = v122;
  v181 = v119;
  v180 = v124;
  v179 = v120;
  v178 = v126;
  v177 = v121;
  v176 = v128;
  v175 = v123;
  v174 = v129;
  v173 = v125;
  v172 = v131;
  v171 = v127;
  v170 = v132;
  sub_10003AEC4((uint64_t)&v208, (uint64_t)v169, &qword_10008B9F0);
  sub_100044BE4((uint64_t)v143, v149, &qword_10008B9E8);
  *(_QWORD *)(a2 + 88) = v101;
  *(_QWORD *)(a2 + 176) = v100;
  *(_QWORD *)(a2 + 264) = v99;
  *(_QWORD *)(a2 + 352) = v98;
  *(_QWORD *)(a2 + 440) = v97;
  *(_QWORD *)(a2 + 528) = v96;
  *(_QWORD *)(a2 + 616) = v95;
  *(_BYTE *)(a2 + 16) = 1;
  *(_BYTE *)(a2 + 104) = 1;
  *(_BYTE *)(a2 + 192) = 1;
  *(_BYTE *)(a2 + 280) = 1;
  *(_BYTE *)(a2 + 368) = 1;
  *(_BYTE *)(a2 + 456) = 1;
  *(_BYTE *)(a2 + 544) = 1;
  *(_BYTE *)(a2 + 632) = 1;
  *(_QWORD *)a2 = v102;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 80) = v168;
  *(_QWORD *)(a2 + 168) = v167;
  *(_QWORD *)(a2 + 256) = v161;
  *(_QWORD *)(a2 + 344) = v156;
  *(_QWORD *)(a2 + 432) = v150;
  v51 = v114;
  v52 = v115;
  *(_QWORD *)(a2 + 24) = v115;
  *(_QWORD *)(a2 + 32) = v51;
  *(_BYTE *)(a2 + 40) = v50;
  v54 = v116;
  v53 = v117;
  v55 = v118;
  *(_QWORD *)(a2 + 48) = v116;
  *(_QWORD *)(a2 + 56) = v55;
  *(_QWORD *)(a2 + 64) = v53;
  *(_BYTE *)(a2 + 72) = v130;
  *(_QWORD *)(a2 + 96) = 0;
  v56 = v162;
  *(_QWORD *)(a2 + 112) = v163;
  *(_QWORD *)(a2 + 120) = v56;
  *(_BYTE *)(a2 + 128) = v49;
  v57 = v166;
  *(_QWORD *)(a2 + 136) = v164;
  *(_QWORD *)(a2 + 144) = v57;
  *(_QWORD *)(a2 + 152) = v165;
  *(_BYTE *)(a2 + 160) = v122;
  *(_QWORD *)(a2 + 184) = 0;
  v58 = v157;
  *(_QWORD *)(a2 + 200) = v158;
  *(_QWORD *)(a2 + 208) = v58;
  *(_BYTE *)(a2 + 216) = v119;
  v59 = v160;
  *(_QWORD *)(a2 + 224) = v159;
  *(_QWORD *)(a2 + 232) = v59;
  v60 = v113;
  *(_QWORD *)(a2 + 240) = v113;
  *(_BYTE *)(a2 + 248) = v124;
  *(_QWORD *)(a2 + 272) = 0;
  v61 = v151;
  *(_QWORD *)(a2 + 288) = v152;
  *(_QWORD *)(a2 + 296) = v61;
  *(_BYTE *)(a2 + 304) = v120;
  v62 = v155;
  *(_QWORD *)(a2 + 312) = v153;
  *(_QWORD *)(a2 + 320) = v62;
  *(_QWORD *)(a2 + 328) = v154;
  *(_BYTE *)(a2 + 336) = v126;
  *(_QWORD *)(a2 + 360) = 0;
  v63 = v144;
  *(_QWORD *)(a2 + 376) = v145;
  *(_QWORD *)(a2 + 384) = v63;
  *(_BYTE *)(a2 + 392) = v121;
  v64 = v148;
  *(_QWORD *)(a2 + 400) = v146;
  *(_QWORD *)(a2 + 408) = v64;
  *(_QWORD *)(a2 + 416) = v147;
  *(_BYTE *)(a2 + 424) = v128;
  *(_QWORD *)(a2 + 448) = 0;
  v65 = v137;
  *(_QWORD *)(a2 + 464) = v138;
  *(_QWORD *)(a2 + 472) = v65;
  *(_BYTE *)(a2 + 480) = v123;
  v66 = v141;
  *(_QWORD *)(a2 + 488) = v139;
  *(_QWORD *)(a2 + 496) = v66;
  *(_QWORD *)(a2 + 504) = v140;
  *(_BYTE *)(a2 + 512) = v129;
  *(_QWORD *)(a2 + 520) = v142;
  *(_QWORD *)(a2 + 536) = 0;
  *(_QWORD *)(a2 + 552) = v112;
  *(_QWORD *)(a2 + 560) = v111;
  *(_BYTE *)(a2 + 568) = v125;
  *(_QWORD *)(a2 + 576) = v133;
  *(_QWORD *)(a2 + 584) = v135;
  *(_QWORD *)(a2 + 592) = v134;
  *(_BYTE *)(a2 + 600) = v131;
  *(_QWORD *)(a2 + 608) = v136;
  *(_QWORD *)(a2 + 624) = 0;
  *(_QWORD *)(a2 + 640) = v106;
  *(_QWORD *)(a2 + 648) = v105;
  *(_BYTE *)(a2 + 656) = v127;
  *(_QWORD *)(a2 + 664) = v107;
  *(_QWORD *)(a2 + 672) = v109;
  *(_QWORD *)(a2 + 680) = v108;
  *(_BYTE *)(a2 + 688) = v132;
  *(_QWORD *)(a2 + 696) = v110;
  sub_10003AEC4((uint64_t)v169, (uint64_t)v186, &qword_10008B9F0);
  sub_10003AEC4((uint64_t)v186, a2 + 704, &qword_10008B9F0);
  v67 = sub_10003AB50(&qword_10008BA00);
  sub_100044BE4(v149, a2 + *(int *)(v67 + 176), &qword_10008B9E8);
  sub_100043B04(v52, v51, v104);
  swift_bridgeObjectRetain(v54);
  sub_100043B04(v55, v53, v130);
  swift_bridgeObjectRetain(v168);
  sub_100043B04(v163, v162, v103);
  swift_bridgeObjectRetain(v164);
  sub_100043B04(v166, v165, v122);
  swift_bridgeObjectRetain(v167);
  sub_100043B04(v158, v157, v119);
  swift_bridgeObjectRetain(v159);
  sub_100043B04(v160, v60, v124);
  swift_bridgeObjectRetain(v161);
  sub_100043B04(v152, v151, v120);
  swift_bridgeObjectRetain(v153);
  sub_100043B04(v155, v154, v126);
  swift_bridgeObjectRetain(v156);
  sub_100043B04(v145, v144, v121);
  swift_bridgeObjectRetain(v146);
  sub_100043B04(v148, v147, v128);
  swift_bridgeObjectRetain(v150);
  sub_100043B04(v138, v137, v123);
  swift_bridgeObjectRetain(v139);
  sub_100043B04(v141, v140, v129);
  swift_bridgeObjectRetain(v142);
  v68 = v111;
  v69 = v112;
  sub_100043B04(v112, v111, v125);
  swift_bridgeObjectRetain(v133);
  sub_100043B04(v135, v134, v131);
  swift_bridgeObjectRetain(v136);
  v71 = v105;
  v70 = v106;
  sub_100043B04(v106, v105, v127);
  v72 = v107;
  swift_bridgeObjectRetain(v107);
  v73 = v108;
  v74 = v109;
  sub_100043B04(v109, v108, v132);
  v75 = v110;
  swift_bridgeObjectRetain(v110);
  sub_100043EE0(v186, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100043E04);
  sub_100044BA8((uint64_t)v143, &qword_10008B9E8);
  sub_100044BA8(v149, &qword_10008B9E8);
  sub_10003AEC4((uint64_t)v169, (uint64_t)&v187, &qword_10008B9F0);
  sub_100043EE0(&v187, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100043F44);
  LOBYTE(v51) = v170;
  sub_100043B60(v70, v71, v171);
  swift_bridgeObjectRelease(v72);
  sub_100043B60(v74, v73, v51);
  swift_bridgeObjectRelease(v75);
  LOBYTE(v51) = v172;
  sub_100043B60(v69, v68, v173);
  swift_bridgeObjectRelease(v133);
  sub_100043B60(v135, v134, v51);
  swift_bridgeObjectRelease(v136);
  LOBYTE(v51) = v174;
  sub_100043B60(v138, v137, v175);
  swift_bridgeObjectRelease(v139);
  sub_100043B60(v141, v140, v51);
  swift_bridgeObjectRelease(v142);
  LOBYTE(v51) = v176;
  sub_100043B60(v145, v144, v177);
  swift_bridgeObjectRelease(v146);
  sub_100043B60(v148, v147, v51);
  swift_bridgeObjectRelease(v150);
  LOBYTE(v51) = v178;
  sub_100043B60(v152, v151, v179);
  swift_bridgeObjectRelease(v153);
  sub_100043B60(v155, v154, v51);
  swift_bridgeObjectRelease(v156);
  LOBYTE(v51) = v180;
  sub_100043B60(v158, v157, v181);
  swift_bridgeObjectRelease(v159);
  sub_100043B60(v160, v113, v51);
  swift_bridgeObjectRelease(v161);
  LOBYTE(v51) = v182;
  sub_100043B60(v163, v162, v183);
  swift_bridgeObjectRelease(v164);
  sub_100043B60(v166, v165, v51);
  swift_bridgeObjectRelease(v167);
  LOBYTE(v51) = v184;
  sub_100043B60(v115, v114, v185);
  swift_bridgeObjectRelease(v116);
  sub_100043B60(v118, v117, v51);
  return swift_bridgeObjectRelease(v168);
}

uint64_t sub_10003CE3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)a2 = xmmword_100055E30;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = v3;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0x3A646C697542, 0xE600000000000000, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v2, v3, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(v3);
  sub_100043B60(v2, v3, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0x3A646C697542, 0xE600000000000000, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003CEFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Swift::String v10;
  uint64_t v11;
  Swift::String v12;
  void *object;
  Swift::String v14;
  uint64_t v15;
  Swift::String v16;
  void *v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v23 = 0;
  v24 = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  v4 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_100056050);
  v23 = v4;
  v6 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v23, KeyPath, v6);
  swift_release(KeyPath);
  v7 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
  v9 = v8;
  swift_bridgeObjectRelease(0xE000000000000000);
  v23 = v7;
  v24 = v9;
  v10._countAndFlagsBits = 0x202F20424D20;
  v10._object = (void *)0xE600000000000000;
  String.append(_:)(v10);
  v11 = swift_getKeyPath(&unk_100056028);
  v22 = v4;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v22, v11, v6);
  swift_release(v11);
  v22 = *(_QWORD *)(v4 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize);
  v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
  object = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(object);
  v14._countAndFlagsBits = 0x2820424D20;
  v14._object = (void *)0xE500000000000000;
  String.append(_:)(v14);
  v15 = swift_getKeyPath(&unk_100056078);
  v22 = v4;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v22, v15, v6);
  swift_release(v15);
  v22 = *(_QWORD *)(v4 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage);
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  v18._countAndFlagsBits = 10533;
  v18._object = (void *)0xE200000000000000;
  String.append(_:)(v18);
  v19 = v23;
  v20 = v24;
  *(_OWORD *)a2 = xmmword_100055E40;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v19;
  *(_QWORD *)(a2 + 40) = v20;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0x617053206B736944, 0xEB000000003A6563, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v19, v20, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(v19, v20, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0x617053206B736944, 0xEB000000003A6563, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003D1C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_1000560A0);
  v14 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v14, KeyPath, v5);
  swift_release(KeyPath);
  v6 = (uint64_t *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork);
  v8 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork + 8);
  swift_bridgeObjectRetain(v8);
  v9 = String.count.getter(v7, v8);
  swift_bridgeObjectRelease(v8);
  if (v9 < 1)
  {
    v11 = 0xE600000000000000;
    v12 = 0x29656E6F4E28;
  }
  else
  {
    v10 = swift_getKeyPath(&unk_1000560A0);
    v14 = v3;
    ObservationRegistrar.access<A, B>(_:keyPath:)(&v14, v10, v5);
    swift_release(v10);
    v12 = *v6;
    v11 = v6[1];
    swift_bridgeObjectRetain(v11);
  }
  *(_OWORD *)a2 = xmmword_100055E50;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 40) = v11;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0x74654E2069466957, 0xED00003A6B726F77, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v12, v11, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(v12, v11, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0x74654E2069466957, 0xED00003A6B726F77, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003D398@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  if (String.count.getter(v4, v3) < 1)
  {
    v3 = 0xE700000000000000;
    v4 = 0x6E776F6E6B6E55;
  }
  else
  {
    swift_bridgeObjectRetain(v3);
  }
  *(_OWORD *)a2 = xmmword_100055E60;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 40) = v3;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0x3A656C61636F4CLL, 0xE700000000000000, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v4, v3, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(v4, v3, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0x3A656C61636F4CLL, 0xE700000000000000, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003D490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_1000560C8);
  v9 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v9, KeyPath, v5);
  swift_release(KeyPath);
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning))
    v6 = 7562585;
  else
    v6 = 28494;
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning))
    v7 = 0xE300000000000000;
  else
    v7 = 0xE200000000000000;
  *(_QWORD *)a2 = 0xD000000000000014;
  *(_QWORD *)(a2 + 8) = 0x800000010006CE60;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 40) = v7;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0xD000000000000014, 0x800000010006CE60, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v6, v7, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(v6, v7, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0xD000000000000014, 0x800000010006CE60, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003D5E8@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if ((*a1 & 1) != 0)
    v2 = 7562585;
  else
    v2 = 28494;
  if ((*a1 & 1) != 0)
    v3 = 0xE300000000000000;
  else
    v3 = 0xE200000000000000;
  *(_QWORD *)a2 = 0xD000000000000017;
  *(_QWORD *)(a2 + 8) = 0x800000010006CE40;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = v3;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0xD000000000000017, 0x800000010006CE40, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v2, v3, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(v2, v3, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0xD000000000000017, 0x800000010006CE40, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003D6C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    v2 = 7562585;
  else
    v2 = 28494;
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    v3 = 0xE300000000000000;
  else
    v3 = 0xE200000000000000;
  *(_QWORD *)a2 = 0xD000000000000011;
  *(_QWORD *)(a2 + 8) = 0x800000010006CE20;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = v3;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0xD000000000000011, 0x800000010006CE20, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v2, v3, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(v2, v3, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0xD000000000000011, 0x800000010006CE20, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003D7A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_100056000);
  v9 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v9, KeyPath, v5);
  swift_release(KeyPath);
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected))
    v6 = 7562585;
  else
    v6 = 28494;
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected))
    v7 = 0xE300000000000000;
  else
    v7 = 0xE200000000000000;
  *(_QWORD *)a2 = 0xD00000000000001BLL;
  *(_QWORD *)(a2 + 8) = 0x800000010006CE00;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 40) = v7;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0xD00000000000001BLL, 0x800000010006CE00, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v6, v7, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(v6, v7, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0xD00000000000001BLL, 0x800000010006CE00, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003D900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_100055FD8);
  v9 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v9, KeyPath, v5);
  swift_release(KeyPath);
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName + 8);
  *(_QWORD *)a2 = 0xD00000000000001DLL;
  *(_QWORD *)(a2 + 8) = 0x800000010006CD90;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 40) = v7;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0xD00000000000001DLL, 0x800000010006CD90, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v6, v7, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(v7);
  sub_100043B60(v6, v7, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0xD00000000000001DLL, 0x800000010006CD90, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003DA44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Swift::String v10;
  uint64_t v11;
  Swift::String v12;
  void *object;
  Swift::String v14;
  uint64_t v15;
  Swift::String v16;
  void *v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v23 = 0;
  v24 = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  v4 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_100055F88);
  v23 = v4;
  v6 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v23, KeyPath, v6);
  swift_release(KeyPath);
  v7 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
  v9 = v8;
  swift_bridgeObjectRelease(0xE000000000000000);
  v23 = v7;
  v24 = v9;
  v10._countAndFlagsBits = 0x202F20424D20;
  v10._object = (void *)0xE600000000000000;
  String.append(_:)(v10);
  v11 = swift_getKeyPath(&unk_100055F60);
  v22 = v4;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v22, v11, v6);
  swift_release(v11);
  v22 = *(_QWORD *)(v4 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize);
  v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
  object = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(object);
  v14._countAndFlagsBits = 0x2820424D20;
  v14._object = (void *)0xE500000000000000;
  String.append(_:)(v14);
  v15 = swift_getKeyPath(&unk_100055FB0);
  v22 = v4;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v22, v15, v6);
  swift_release(v15);
  v22 = *(_QWORD *)(v4 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage);
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  v18._countAndFlagsBits = 10533;
  v18._object = (void *)0xE200000000000000;
  String.append(_:)(v18);
  v19 = v23;
  v20 = v24;
  *(_QWORD *)a2 = 0xD000000000000017;
  *(_QWORD *)(a2 + 8) = 0x800000010006CD70;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a2 + 32) = v19;
  *(_QWORD *)(a2 + 40) = v20;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0xD000000000000017, 0x800000010006CD70, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(v19, v20, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(v19, v20, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0xD000000000000017, 0x800000010006CD70, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

__n128 sub_10003DCFC@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __n128 result;
  __int128 v8;
  __n128 v9;
  char v10;
  uint64_t v11;
  __int128 v12;
  char v13;
  uint64_t v14;

  v2 = static HorizontalAlignment.center.getter();
  sub_10003DD6C((uint64_t)&v9);
  v3 = v10;
  v4 = v11;
  v5 = v13;
  v6 = v14;
  result = v9;
  v8 = v12;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 72) = v5;
  *(_QWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_10003DD6C@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x800000010006CDB0;
  *(_QWORD *)(a1 + 24) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(a1 + 32) = 0xD000000000000014;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 40) = 0x800000010006CDE0;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = &_swiftEmptyArrayStorage;
  sub_100043B04(0xD000000000000024, 0x800000010006CDB0, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B04(0xD000000000000014, 0x800000010006CDE0, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100043B60(0xD000000000000014, 0x800000010006CDE0, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100043B60(0xD000000000000024, 0x800000010006CDB0, 0);
  return swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
}

uint64_t sub_10003DE3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  _OWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[16];
  uint64_t v61;
  __int128 v62;
  uint64_t v63;

  v58 = a2;
  v3 = sub_10003AB50(&qword_10008B990);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v54 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v52 - v7;
  v59 = sub_10003AB50(&qword_10008B998);
  v9 = __chkstk_darwin(v59);
  v57 = (uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v56 = (char *)&v52 - v12;
  v13 = __chkstk_darwin(v11);
  v55 = (uint64_t)&v52 - v14;
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v52 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v52 - v18;
  v20 = (_OWORD *)swift_allocObject(&unk_100076858, 128, 7);
  v21 = *(_OWORD *)(a1 + 80);
  v20[5] = *(_OWORD *)(a1 + 64);
  v20[6] = v21;
  v20[7] = *(_OWORD *)(a1 + 96);
  v22 = *(_OWORD *)(a1 + 16);
  v20[1] = *(_OWORD *)a1;
  v20[2] = v22;
  v23 = *(_OWORD *)(a1 + 48);
  v20[3] = *(_OWORD *)(a1 + 32);
  v20[4] = v23;
  v61 = a1;
  sub_1000439F0((_QWORD *)a1);
  v24 = type metadata accessor for TestButtonLabel(0);
  v25 = sub_100043BE4(&qword_10008B9A0, type metadata accessor for TestButtonLabel, (uint64_t)&unk_100056218);
  v53 = v24;
  Button.init(action:label:)(sub_100043B74, v20, sub_100043B94, v60, v24, v25);
  v26 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_100056000);
  *(_QWORD *)&v62 = v26;
  v28 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v62, KeyPath, v28);
  swift_release(KeyPath);
  if (*(_BYTE *)(v26 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) == 1)
  {
    v62 = *(_OWORD *)(a1 + 56);
    v29 = sub_10003AB50(&qword_10008B918);
    State.wrappedValue.getter(&v63, v29);
    v30 = v63;
  }
  else
  {
    v30 = 1;
  }
  v31 = swift_getKeyPath(&unk_1000561A8);
  v32 = swift_allocObject(&unk_100076880, 17, 7);
  *(_BYTE *)(v32 + 16) = v30;
  v52 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v52(v17, v8, v3);
  v33 = (uint64_t *)&v17[*(int *)(v59 + 36)];
  *v33 = v31;
  v33[1] = (uint64_t)sub_100043C84;
  v33[2] = v32;
  v34 = *(void (**)(char *, uint64_t))(v4 + 8);
  v34(v8, v3);
  v35 = (uint64_t)v19;
  sub_10003AEC4((uint64_t)v17, (uint64_t)v19, &qword_10008B998);
  v36 = (_OWORD *)swift_allocObject(&unk_1000768A8, 128, 7);
  v37 = *(_OWORD *)(a1 + 80);
  v36[5] = *(_OWORD *)(a1 + 64);
  v36[6] = v37;
  v36[7] = *(_OWORD *)(a1 + 96);
  v38 = *(_OWORD *)(a1 + 16);
  v36[1] = *(_OWORD *)a1;
  v36[2] = v38;
  v39 = *(_OWORD *)(a1 + 48);
  v36[3] = *(_OWORD *)(a1 + 32);
  v36[4] = v39;
  __chkstk_darwin(v36);
  *(&v52 - 2) = (void (*)(char *, char *, uint64_t))a1;
  sub_1000439F0((_QWORD *)a1);
  v40 = v54;
  Button.init(action:label:)(sub_100043CA0, v36, sub_100043CA8, &v52 - 4, v53, v25);
  v62 = *(_OWORD *)(a1 + 56);
  v41 = sub_10003AB50(&qword_10008B918);
  State.wrappedValue.getter(&v63, v41);
  v42 = v63;
  v43 = swift_getKeyPath(&unk_1000561A8);
  v44 = swift_allocObject(&unk_1000768D0, 17, 7);
  *(_BYTE *)(v44 + 16) = v42;
  v45 = (uint64_t)v56;
  v52(v56, v40, v3);
  v46 = (uint64_t *)(v45 + *(int *)(v59 + 36));
  *v46 = v43;
  v46[1] = (uint64_t)sub_100044FDC;
  v46[2] = v44;
  v34(v40, v3);
  v47 = v55;
  sub_10003AEC4(v45, v55, &qword_10008B998);
  sub_100044BE4(v35, v45, &qword_10008B998);
  v48 = v57;
  sub_100044BE4(v47, v57, &qword_10008B998);
  v49 = v58;
  sub_100044BE4(v45, v58, &qword_10008B998);
  v50 = sub_10003AB50(&qword_10008B9A8);
  sub_100044BE4(v48, v49 + *(int *)(v50 + 48), &qword_10008B998);
  sub_100044BA8(v47, &qword_10008B998);
  sub_100044BA8(v35, &qword_10008B998);
  sub_100044BA8(v48, &qword_10008B998);
  return sub_100044BA8(v45, &qword_10008B998);
}

uint64_t sub_10003E318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 aBlock;
  uint64_t (*v43)(uint64_t);
  void *v44;
  uint64_t (*v45)();
  _OWORD *v46;
  _QWORD v47[2];

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v38 = *(_QWORD *)(v5 - 8);
  v39 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS.QoSClass(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v0 + 48);
  KeyPath = swift_getKeyPath(&unk_100056000);
  *(_QWORD *)&aBlock = v12;
  v14 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&aBlock, KeyPath, v14);
  swift_release(KeyPath);
  if (*(_BYTE *)(v12 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) == 1
    && ((v15 = swift_getKeyPath(&unk_100055F38),
         *(_QWORD *)&aBlock = v12,
         ObservationRegistrar.access<A, B>(_:keyPath:)(&aBlock, v15, v14),
         swift_release(v15),
         v16 = *(_QWORD *)(v12 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath + 8),
         (v16 & 0x2000000000000000) != 0)
      ? (v17 = HIBYTE(v16) & 0xF)
      : (v17 = *(_QWORD *)(v12 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath) & 0xFFFFFFFFFFFFLL),
        v17))
  {
    aBlock = *(_OWORD *)(v0 + 56);
    LOBYTE(v47[0]) = 1;
    v18 = sub_10003AB50(&qword_10008B918);
    State.wrappedValue.setter(v47, v18);
    sub_100043D28(0, &qword_10008B9C0, OS_dispatch_queue_ptr);
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for DispatchQoS.QoSClass.background(_:), v8);
    v19 = (void *)static OS_dispatch_queue.global(qos:)(v11);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v20 = (_OWORD *)swift_allocObject(&unk_1000768F8, 128, 7);
    v21 = *(_OWORD *)(v0 + 80);
    v20[5] = *(_OWORD *)(v0 + 64);
    v20[6] = v21;
    v20[7] = *(_OWORD *)(v0 + 96);
    v22 = *(_OWORD *)(v0 + 16);
    v20[1] = *(_OWORD *)v0;
    v20[2] = v22;
    v23 = *(_OWORD *)(v0 + 48);
    v20[3] = *(_OWORD *)(v0 + 32);
    v20[4] = v23;
    v45 = sub_100043DB8;
    v46 = v20;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v43 = sub_10003F30C;
    v44 = &unk_100076910;
    v24 = _Block_copy(&aBlock);
    v25 = sub_1000439F0((_QWORD *)v0);
    static DispatchQoS.unspecified.getter(v25);
    v47[0] = &_swiftEmptyArrayStorage;
    v26 = sub_100043BE4(&qword_10008B9C8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v27 = sub_10003AB50(&qword_10008B9D0);
    v28 = sub_100044F0C(&qword_10008B9D8, &qword_10008B9D0, (uint64_t)&protocol conformance descriptor for [A]);
    v29 = v41;
    dispatch thunk of SetAlgebra.init<A>(_:)(v47, v27, v28, v41, v26);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v7, v4, v24);
    _Block_release(v24);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v4, v29);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v39);
    return swift_release(v46);
  }
  else
  {
    v31 = sub_100043D28(0, (unint64_t *)&qword_10008B728, OS_os_log_ptr);
    v33 = (void *)static OS_os_log.default.getter(v31, v32);
    v35 = static os_log_type_t.default.getter(v33, v34);
    os_log(_:dso:log:type:_:)("No external drive to copy logs to", 33, 2, &_mh_execute_header, v33, v35, &_swiftEmptyArrayStorage);

    aBlock = *(_OWORD *)(v1 + 88);
    v43 = *(uint64_t (**)(uint64_t))(v1 + 104);
    v47[0] = 0xD00000000000002CLL;
    v47[1] = 0x800000010006CA20;
    v36 = sub_10003AB50(&qword_10008B910);
    State.wrappedValue.setter(v47, v36);
    aBlock = *(_OWORD *)(v1 + 72);
    LOBYTE(v47[0]) = 1;
    v37 = sub_10003AB50(&qword_10008B918);
    return State.wrappedValue.setter(v47, v37);
  }
}

uint64_t sub_10003E764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  __int128 v19;
  uint64_t v20;

  v4 = type metadata accessor for TestButtonLabel(0);
  __chkstk_darwin(v4);
  v6 = (_QWORD *)((char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_100056000);
  *(_QWORD *)&v19 = v7;
  v9 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v19, KeyPath, v9);
  v10 = (_QWORD *)swift_release(KeyPath);
  if (*(_BYTE *)(v7 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) == 1
    && (v19 = *(_OWORD *)(a1 + 56),
        v11 = sub_10003AB50(&qword_10008B918),
        v10 = State.wrappedValue.getter(&v20, v11),
        (v20 & 1) == 0))
  {
    v12 = static Color.blue.getter(v10);
  }
  else
  {
    v12 = static Color.gray.getter(v10);
  }
  v13 = v12;
  v14 = static Color.white.getter();
  v15 = swift_getKeyPath(&unk_1000561D8);
  v16 = (_QWORD *)((char *)v6 + *(int *)(v4 + 28));
  *v16 = v15;
  v17 = sub_10003AB50(&qword_10008B9B0);
  swift_storeEnumTagMultiPayload(v16, v17, 0);
  *v6 = 0xD000000000000023;
  v6[1] = 0x800000010006C9C0;
  v6[2] = v13;
  v6[3] = v14;
  return sub_100043CE4((uint64_t)v6, a2);
}

void sub_10003E8E8()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v1 = v0;
  if (qword_10008B6E8 != -1)
  {
    swift_once(&qword_10008B6E8, sub_10003B150);
    v0 = v1;
  }
  objc_msgSend(v0, "postNotificationName:object:", qword_10008C228, 0);

}

uint64_t sub_10003E96C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t *v15;
  uint64_t v16;
  __int128 v18;
  uint64_t v19;

  v4 = type metadata accessor for TestButtonLabel(0);
  v5 = __chkstk_darwin(v4);
  v7 = (_QWORD *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = static Color.white.getter(v5);
  v9 = Color.opacity(_:)(0.0);
  swift_release(v8);
  v18 = *(_OWORD *)(a1 + 56);
  v10 = sub_10003AB50(&qword_10008B918);
  v11 = State.wrappedValue.getter(&v19, v10);
  if (v19 == 1)
    v12 = static Color.gray.getter(v11);
  else
    v12 = static Color.blue.getter(v11);
  v13 = v12;
  KeyPath = swift_getKeyPath(&unk_1000561D8);
  v15 = (_QWORD *)((char *)v7 + *(int *)(v4 + 28));
  *v15 = KeyPath;
  v16 = sub_10003AB50(&qword_10008B9B0);
  swift_storeEnumTagMultiPayload(v15, v16, 0);
  *v7 = 0x6265442074697845;
  v7[1] = 0xEF6F666E49206775;
  v7[2] = v9;
  v7[3] = v13;
  return sub_100043CE4((uint64_t)v7, a2);
}

uint64_t sub_10003EA9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v18;

  v2 = sub_10003AB50(&qword_10008B940);
  __chkstk_darwin(v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = LocalizedStringKey.init(stringLiteral:)(19279, 0xE200000000000000);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  static ButtonRole.cancel.getter();
  v12 = type metadata accessor for ButtonRole(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 0, 1, v12);
  v13 = (_OWORD *)swift_allocObject(&unk_100076830, 128, 7);
  v14 = *(_OWORD *)(a1 + 80);
  v13[5] = *(_OWORD *)(a1 + 64);
  v13[6] = v14;
  v13[7] = *(_OWORD *)(a1 + 96);
  v15 = *(_OWORD *)(a1 + 16);
  v13[1] = *(_OWORD *)a1;
  v13[2] = v15;
  v16 = *(_OWORD *)(a1 + 48);
  v13[3] = *(_OWORD *)(a1 + 32);
  v13[4] = v16;
  sub_1000439F0((_QWORD *)a1);
  return Button<>.init(_:role:action:)(v5, v7, v9 & 1, v11, v4, sub_1000439A8, v13);
}

uint64_t sub_10003EBC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  Swift::String v5;
  __int128 v6;
  void *v7;
  id v8;
  NSString v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSString v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint8_t *v27;
  id v28;
  NSString v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  uint64_t v33;
  NSString v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  Swift::String v51;
  void *object;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[3];
  _BYTE v63[8];
  __int128 v64;
  _QWORD v65[3];
  _BYTE v66[16];
  __int128 v67;
  uint64_t v68;

  v2 = *(_QWORD *)(a1 + 48);
  KeyPath = swift_getKeyPath(&unk_100055F38);
  *(_QWORD *)&v67 = v2;
  v60 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v67, KeyPath, v60);
  swift_release(KeyPath);
  v59 = (_QWORD *)(v2 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath + 8);
  *(_QWORD *)&v67 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath);
  *((_QWORD *)&v67 + 1) = v4;
  swift_bridgeObjectRetain(v4);
  v5._countAndFlagsBits = 0x2F73676F4C2FLL;
  v5._object = (void *)0xE600000000000000;
  String.append(_:)(v5);
  v6 = v67;
  v7 = (void *)objc_opt_self(NSFileManager);
  v8 = objc_msgSend(v7, "defaultManager");
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  v61 = a1;
  if (!v10)
    goto LABEL_3;
  v11 = sub_100043D28(0, (unint64_t *)&qword_10008B728, OS_os_log_ptr);
  v13 = (void *)static OS_os_log.default.getter(v11, v12);
  v15 = static os_log_type_t.default.getter(v13, v14);
  os_log(_:dso:log:type:_:)("Logs directory already exists on external storage. Deleting to make room for new logs", 85, 2, &_mh_execute_header, v13, v15, &_swiftEmptyArrayStorage);

  v16 = objc_msgSend(v7, "defaultManager");
  v17 = String._bridgeToObjectiveC()();
  *(_QWORD *)&v67 = 0;
  v18 = objc_msgSend(v16, "removeItemAtPath:error:", v17, &v67);

  v19 = (id)v67;
  if (!v18)
  {
    v39 = v19;
    swift_bridgeObjectRelease(*((_QWORD *)&v6 + 1));
  }
  else
  {
LABEL_3:
    sub_100043D28(0, (unint64_t *)&qword_10008B728, OS_os_log_ptr);
    v20 = swift_bridgeObjectRetain(*((_QWORD *)&v6 + 1));
    v22 = static OS_os_log.default.getter(v20, v21);
    v24 = static os_log_type_t.default.getter(v22, v23);
    if (os_log_type_enabled(v22, v24))
    {
      v58 = v2;
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v67 = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain(*((_QWORD *)&v6 + 1));
      *(_QWORD *)&v64 = sub_100042E6C(v6, *((unint64_t *)&v6 + 1), (uint64_t *)&v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, (char *)&v64 + 8, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(*((_QWORD *)&v6 + 1), 3);
      _os_log_impl((void *)&_mh_execute_header, v22, v24, "Copying logs to %s", v25, 0xCu);
      swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1, -1);
      v27 = v25;
      v2 = v58;
      swift_slowDealloc(v27, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*((_QWORD *)&v6 + 1), 2);
    }

    v28 = objc_msgSend(v7, "defaultManager");
    v29 = String._bridgeToObjectiveC()();
    v30 = swift_getKeyPath(&unk_100055F38);
    *(_QWORD *)&v67 = v2;
    ObservationRegistrar.access<A, B>(_:keyPath:)(&v67, v30, v60);
    swift_release(v30);
    v31 = v59[1];
    *(_QWORD *)&v67 = *v59;
    *((_QWORD *)&v67 + 1) = v31;
    swift_bridgeObjectRetain(v31);
    v32._countAndFlagsBits = 0x2F73676F4C2FLL;
    v32._object = (void *)0xE600000000000000;
    String.append(_:)(v32);
    v33 = *((_QWORD *)&v67 + 1);
    v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v33);
    *(_QWORD *)&v67 = 0;
    LODWORD(v33) = objc_msgSend(v28, "copyItemAtPath:toPath:error:", v29, v34, &v67);

    v35 = (id)v67;
    if ((_DWORD)v33)
    {
      v36 = v61;
      v67 = *(_OWORD *)(v61 + 88);
      v68 = *(_QWORD *)(v61 + 104);
      *(_QWORD *)&v64 = 0xD00000000000002DLL;
      *((_QWORD *)&v64 + 1) = 0x800000010006CAA0;
      v37 = sub_10003AB50(&qword_10008B910);
      State.wrappedValue.setter(&v64, v37);
      v67 = *(_OWORD *)(v61 + 72);
      LOBYTE(v64) = 1;
      v38 = sub_10003AB50(&qword_10008B918);
      State.wrappedValue.setter(&v64, v38);
      goto LABEL_14;
    }
    v39 = v35;
  }
  v40 = _convertNSErrorToError(_:)(v39);

  swift_willThrow();
  sub_100043D28(0, (unint64_t *)&qword_10008B728, OS_os_log_ptr);
  swift_errorRetain(v40);
  v41 = swift_errorRetain(v40);
  v43 = static OS_os_log.default.getter(v41, v42);
  v45 = static os_log_type_t.default.getter(v43, v44);
  if (os_log_type_enabled(v43, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc(12, -1);
    v47 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v67 = v47;
    *(_DWORD *)v46 = 136315138;
    swift_getErrorValue(v40, v63, v62);
    v48 = Error.localizedDescription.getter(v62[1], v62[2]);
    v50 = v49;
    *(_QWORD *)&v64 = sub_100042E6C(v48, v49, (uint64_t *)&v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, (char *)&v64 + 8, v46 + 4, v46 + 12);
    swift_bridgeObjectRelease(v50);
    swift_errorRelease(v40);
    swift_errorRelease(v40);
    _os_log_impl((void *)&_mh_execute_header, v43, v45, "Failed to copy log files - %s", v46, 0xCu);
    swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v47, -1, -1);
    swift_slowDealloc(v46, -1, -1);

  }
  else
  {

    swift_errorRelease(v40);
    swift_errorRelease(v40);
  }
  *(_QWORD *)&v67 = 0;
  *((_QWORD *)&v67 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease(*((_QWORD *)&v67 + 1));
  *(_QWORD *)&v67 = 0xD00000000000001ALL;
  *((_QWORD *)&v67 + 1) = 0x800000010006CA80;
  swift_getErrorValue(v40, v66, v65);
  v51._countAndFlagsBits = Error.localizedDescription.getter(v65[1], v65[2]);
  object = v51._object;
  String.append(_:)(v51);
  swift_bridgeObjectRelease(object);
  v53 = v67;
  v36 = v61;
  v67 = *(_OWORD *)(v61 + 88);
  v68 = *(_QWORD *)(v61 + 104);
  v64 = v53;
  v54 = sub_10003AB50(&qword_10008B910);
  State.wrappedValue.setter(&v64, v54);
  v67 = *(_OWORD *)(v61 + 72);
  LOBYTE(v64) = 1;
  v55 = sub_10003AB50(&qword_10008B918);
  State.wrappedValue.setter(&v64, v55);
  swift_errorRelease(v40);
LABEL_14:
  v67 = *(_OWORD *)(v36 + 56);
  LOBYTE(v64) = 0;
  v56 = sub_10003AB50(&qword_10008B918);
  return State.wrappedValue.setter(&v64, v56);
}

uint64_t sub_10003F30C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_10003F340()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10003F358@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _OWORD v14[7];

  v3 = sub_10003AB50(&qword_10008B8E8);
  v4 = __chkstk_darwin(v3);
  v6 = (_QWORD *)((char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = v1[5];
  v14[4] = v1[4];
  v14[5] = v7;
  v14[6] = v1[6];
  v8 = v1[1];
  v14[0] = *v1;
  v14[1] = v8;
  v9 = v1[3];
  v14[2] = v1[2];
  v14[3] = v9;
  *v6 = static Alignment.center.getter(v4);
  v6[1] = v10;
  sub_10003AB50(&qword_10008B8F0);
  v11 = sub_10003B950((uint64_t)v14);
  v12 = static Edge.Set.all.getter(v11);
  sub_100044BE4((uint64_t)v6, a1, &qword_10008B8E8);
  *(_BYTE *)(a1 + *(int *)(sub_10003AB50(&qword_10008B8F8) + 36)) = v12;
  return sub_100044BA8((uint64_t)v6, &qword_10008B8E8);
}

uint64_t sub_10003F43C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _OWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t KeyPath;
  _OWORD *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  _OWORD v92[9];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;

  v91 = a1;
  v85 = sub_10003AB50(&qword_10008BAD8);
  __chkstk_darwin(v85);
  v89 = (uint64_t)&v75 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v83);
  v88 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10003AB50(&qword_10008BAE0);
  __chkstk_darwin(v4);
  v81 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UserInterfaceSizeClass(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v76 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10003AB50(&qword_10008BAE8);
  __chkstk_darwin(v9);
  v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10003AB50(&qword_10008B9B8);
  v13 = __chkstk_darwin(v12);
  v77 = (uint64_t)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v75 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v75 - v18;
  v80 = sub_10003AB50(&qword_10008BAF0);
  __chkstk_darwin(v80);
  v21 = (_OWORD *)((char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v82 = sub_10003AB50(&qword_10008BAF8);
  __chkstk_darwin(v82);
  v87 = (uint64_t)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_10003AB50(&qword_10008BB00);
  __chkstk_darwin(v84);
  v86 = (uint64_t)&v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v1[1];
  v78 = *v1;
  type metadata accessor for TestButtonLabel(0);
  v90 = v1;
  v79 = v24;
  swift_bridgeObjectRetain(v24);
  sub_100042BBC((uint64_t)v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v17, enum case for UserInterfaceSizeClass.compact(_:), v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v17, 0, 1, v6);
  v25 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_100044BE4((uint64_t)v19, (uint64_t)v11, &qword_10008B9B8);
  sub_100044BE4((uint64_t)v17, v25, &qword_10008B9B8);
  v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v26((uint64_t)v11, 1, v6) == 1)
  {
    sub_100044BA8((uint64_t)v17, &qword_10008B9B8);
    sub_100044BA8((uint64_t)v19, &qword_10008B9B8);
    if (v26(v25, 1, v6) == 1)
    {
      v27 = sub_100044BA8((uint64_t)v11, &qword_10008B9B8);
LABEL_8:
      v33 = INFINITY;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  v28 = v77;
  sub_100044BE4((uint64_t)v11, v77, &qword_10008B9B8);
  if (v26(v25, 1, v6) == 1)
  {
    sub_100044BA8((uint64_t)v17, &qword_10008B9B8);
    sub_100044BA8((uint64_t)v19, &qword_10008B9B8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v28, v6);
LABEL_6:
    v27 = sub_100044BA8((uint64_t)v11, &qword_10008BAE8);
    goto LABEL_9;
  }
  v29 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v76, v25, v6);
  v30 = sub_100043BE4(&qword_10008BB08, (uint64_t (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass, (uint64_t)&protocol conformance descriptor for UserInterfaceSizeClass);
  v31 = dispatch thunk of static Equatable.== infix(_:_:)(v28, v29, v6, v30);
  v32 = *(void (**)(char *, uint64_t))(v7 + 8);
  v32(v29, v6);
  sub_100044BA8((uint64_t)v17, &qword_10008B9B8);
  sub_100044BA8((uint64_t)v19, &qword_10008B9B8);
  v32((char *)v28, v6);
  v27 = sub_100044BA8((uint64_t)v11, &qword_10008B9B8);
  if ((v31 & 1) != 0)
    goto LABEL_8;
LABEL_9:
  v33 = 350.0;
LABEL_10:
  v34 = static Alignment.center.getter(v27);
  v35 = v79;
  sub_10003FC44(300.0, 0, 0.0, 1, v33, 0, 0.0, 1, (uint64_t)v92, 0.0, 1, 50.0, 0, v34, v36, v78, v79, 0, (uint64_t)&_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(v35);
  v37 = v90;
  v38 = v90[2];
  v39 = swift_retain(v38);
  v40 = static Edge.Set.all.getter(v39);
  v41 = enum case for Font.Design.default(_:);
  v42 = type metadata accessor for Font.Design(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = (uint64_t)v81;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 104))(v81, v41, v42);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v43 + 56))(v44, 0, 1, v42);
  v45 = static Font.system(size:weight:design:)(0, 1, v44, 16.0);
  sub_100044BA8(v44, &qword_10008BAE0);
  KeyPath = swift_getKeyPath(&unk_100056268);
  v99 = v92[6];
  v100 = v92[7];
  v101 = v92[8];
  v95 = v92[2];
  v96 = v92[3];
  v97 = v92[4];
  v98 = v92[5];
  v93 = v92[0];
  v94 = v92[1];
  *(_QWORD *)&v102 = v38;
  BYTE8(v102) = v40;
  *(_QWORD *)&v103 = KeyPath;
  *((_QWORD *)&v103 + 1) = v45;
  v47 = v88;
  v48 = &v88[*(int *)(v83 + 20)];
  v49 = enum case for RoundedCornerStyle.continuous(_:);
  v50 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 104))(v48, v49, v50);
  __asm { FMOV            V0.2D, #20.0 }
  *v47 = _Q0;
  v56 = v89;
  sub_100044A00((uint64_t)v47, v89);
  *(_WORD *)(v56 + *(int *)(v85 + 36)) = 256;
  sub_100044BE4(v56, (uint64_t)v21 + *(int *)(v80 + 36), &qword_10008BAD8);
  v57 = v102;
  v21[8] = v101;
  v21[9] = v57;
  v21[10] = v103;
  v58 = v98;
  v21[4] = v97;
  v21[5] = v58;
  v59 = v100;
  v21[6] = v99;
  v21[7] = v59;
  v60 = v94;
  *v21 = v93;
  v21[1] = v60;
  v61 = v96;
  v21[2] = v95;
  v21[3] = v61;
  sub_100044A44((uint64_t)&v93);
  sub_100044BA8(v56, &qword_10008BAD8);
  sub_100044AB0((uint64_t)v47);
  sub_100044AEC((uint64_t)&v93);
  v62 = v37[3];
  v63 = swift_getKeyPath(&unk_100056298);
  v64 = v87;
  sub_100044BE4((uint64_t)v21, v87, &qword_10008BAF0);
  v65 = (uint64_t *)(v64 + *(int *)(v82 + 36));
  *v65 = v63;
  v65[1] = v62;
  swift_retain(v62);
  v66 = sub_100044BA8((uint64_t)v21, &qword_10008BAF0);
  v67 = static Edge.Set.leading.getter(v66);
  v68 = static Edge.Set.trailing.getter();
  v69 = Edge.Set.init(rawValue:)(0);
  v70 = Edge.Set.init(rawValue:)(v69);
  if (Edge.Set.init(rawValue:)(v70 & v67) != v67)
    v69 = Edge.Set.init(rawValue:)(v69 | v67);
  v71 = Edge.Set.init(rawValue:)(v69);
  if (Edge.Set.init(rawValue:)(v71 & v68) != v68)
    LOBYTE(v69) = Edge.Set.init(rawValue:)(v69 | v68);
  v72 = v86;
  sub_100044BE4(v64, v86, &qword_10008BAF8);
  v73 = v72 + *(int *)(v84 + 36);
  *(_BYTE *)v73 = v69;
  *(_OWORD *)(v73 + 8) = 0u;
  *(_OWORD *)(v73 + 24) = 0u;
  *(_BYTE *)(v73 + 40) = 1;
  sub_100044BA8(v64, &qword_10008BAF8);
  return sub_10003AEC4(v72, v91, &qword_10008BB00);
}

uint64_t sub_10003FC44@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  double v34;
  double v36;
  double v37;
  double v38;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unsigned int v46;
  unsigned int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _OWORD v52[7];

  v20 = a19;
  v21 = a18;
  v22 = a17;
  v24 = a14;
  v23 = a15;
  v25 = a12;
  v26 = a10;
  v27 = a2 & 1;
  v28 = a1;
  if ((_DWORD)v27)
    v28 = -INFINITY;
  v29 = a4 & 1;
  v30 = a3;
  if ((_DWORD)v29)
    v30 = v28;
  v31 = a6 & 1;
  v32 = a8 & 1;
  v33 = a13 & 1;
  v34 = a5;
  if ((a6 & 1) != 0)
    v34 = v30;
  if (v28 > v30 || v30 > v34)
    goto LABEL_22;
  v36 = a7;
  if ((a8 & 1) != 0)
    v36 = -INFINITY;
  v37 = a10;
  if ((a11 & 1) != 0)
    v37 = v36;
  v38 = a12;
  if ((a13 & 1) != 0)
    v38 = v37;
  if (v36 > v37 || v37 > v38)
  {
LABEL_22:
    v50 = a7;
    v51 = a5;
    v48 = a1;
    v49 = a3;
    v47 = v27;
    v46 = v29;
    v40 = static os_log_type_t.fault.getter();
    v41 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v41, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v33 = a13 & 1;
    v29 = v46;
    v24 = a14;
    v23 = a15;
    v27 = v47;
    v26 = a10;
    v25 = a12;
    a1 = v48;
    a3 = v49;
    a7 = v50;
    a5 = v51;
    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v52, *(_QWORD *)&a1, v27, *(_QWORD *)&a3, v29, *(_QWORD *)&a5, v31, *(_QWORD *)&a7, v32, *(_QWORD *)&v26, a11 & 1, *(_QWORD *)&v25, v33, v24, v23);
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  v42 = v52[5];
  *(_OWORD *)(a9 + 96) = v52[4];
  *(_OWORD *)(a9 + 112) = v42;
  *(_OWORD *)(a9 + 128) = v52[6];
  v43 = v52[1];
  *(_OWORD *)(a9 + 32) = v52[0];
  *(_OWORD *)(a9 + 48) = v43;
  v44 = v52[3];
  *(_OWORD *)(a9 + 64) = v52[2];
  *(_OWORD *)(a9 + 80) = v44;
  sub_100043B04(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain(v20);
}

uint64_t sub_10003FE28()
{
  return sub_10004037C((uint64_t)&unk_1000560A0, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork);
}

uint64_t sub_10003FE3C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000560A0);
  v8[2] = v4;
  v8[3] = v3;
  v8[4] = v2;
  v9 = v4;
  v6 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  swift_bridgeObjectRetain(v2);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_100042A74, v8, (char *)&type metadata for () + 8, v6);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_10003FEF8()
{
  return sub_1000408C8((uint64_t)&unk_1000560C8, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning);
}

uint64_t sub_10003FF0C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000560C8);
  v7[2] = v3;
  v8 = v2;
  v9 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_100045008, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_10003FFB4()
{
  return sub_1000406F4((uint64_t)&unk_100056028, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize);
}

uint64_t sub_10003FFC8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100056028);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_100044FC8, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_10004006C()
{
  return sub_1000406F4((uint64_t)&unk_100056050, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed);
}

uint64_t sub_100040080(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100056050);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_100044FB4, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_100040124()
{
  return sub_1000406F4((uint64_t)&unk_100056078, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage);
}

uint64_t sub_100040138(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100056078);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_100044FA0, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1000401DC()
{
  return sub_1000408C8((uint64_t)&unk_100056000, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected);
}

uint64_t sub_1000401F0(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100056000);
  v7[2] = v3;
  v8 = v2;
  v9 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_100044FF4, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_100040298()
{
  return sub_10004037C((uint64_t)&unk_100055F38, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath);
}

uint64_t sub_1000402AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100055F38);
  v8[2] = v4;
  v8[3] = v3;
  v8[4] = v2;
  v9 = v4;
  v6 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  swift_bridgeObjectRetain(v2);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_1000427F8, v8, (char *)&type metadata for () + 8, v6);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_100040368()
{
  return sub_10004037C((uint64_t)&unk_100055FD8, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName);
}

uint64_t sub_10004037C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;

  KeyPath = swift_getKeyPath(a1);
  v9 = v2;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v9, KeyPath, v5);
  swift_release(KeyPath);
  v6 = (uint64_t *)(v2 + *a2);
  v7 = *v6;
  swift_bridgeObjectRetain(v6[1]);
  return v7;
}

uint64_t sub_100040414@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, _QWORD *a3@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v12 = v6;
  v8 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v12, KeyPath, v8);
  swift_release(KeyPath);
  v9 = (_QWORD *)(v6 + *a3);
  v10 = v9[1];
  *a4 = *v9;
  a4[1] = v10;
  return swift_bridgeObjectRetain(v10);
}

uint64_t sub_1000404B4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100055FD8);
  v8[2] = v4;
  v8[3] = v3;
  v8[4] = v2;
  v9 = v4;
  v6 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  swift_bridgeObjectRetain(v2);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_1000428F0, v8, (char *)&type metadata for () + 8, v6);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_100040570()
{
  return sub_1000406F4((uint64_t)&unk_100055F60, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize);
}

uint64_t sub_100040584(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100055F60);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_100044F64, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_100040628()
{
  return sub_1000406F4((uint64_t)&unk_100055F88, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed);
}

uint64_t sub_10004063C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100055F88);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_100044F78, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1000406E0()
{
  return sub_1000406F4((uint64_t)&unk_100055FB0, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage);
}

uint64_t sub_1000406F4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v7 = v2;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v7, KeyPath, v5);
  swift_release(KeyPath);
  return *(_QWORD *)(v2 + *a2);
}

uint64_t sub_100040778@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, _QWORD *a3@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v10 = v6;
  v8 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v10, KeyPath, v8);
  result = swift_release(KeyPath);
  *a4 = *(_QWORD *)(v6 + *a3);
  return result;
}

uint64_t sub_100040810(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100055FB0);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_100044F8C, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1000408B4()
{
  return sub_1000408C8((uint64_t)&unk_100055F10, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__skManagerReady);
}

uint64_t sub_1000408C8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v7 = v2;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v7, KeyPath, v5);
  swift_release(KeyPath);
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_10004094C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, _QWORD *a3@<X4>, _BYTE *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v10 = v6;
  v8 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v10, KeyPath, v8);
  result = swift_release(KeyPath);
  *a4 = *(_BYTE *)(v6 + *a3);
  return result;
}

uint64_t sub_1000409E4(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100055F10);
  v7[2] = v3;
  v8 = v2;
  v9 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_100044FE0, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

void *sub_100040A8C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v6;

  KeyPath = swift_getKeyPath(&unk_1000560F0);
  v6 = v0;
  v2 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v6, KeyPath, v2);
  swift_release(KeyPath);
  v3 = *(void **)(v0 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer);
  v4 = v3;
  return v3;
}

id sub_100040B20@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000560F0);
  v8 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v5);
  swift_release(KeyPath);
  v6 = *(void **)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer);
  *a2 = v6;
  return v6;
}

void sub_100040BB4(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000560F0);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  v6 = v2;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_100042B64, v7, (char *)&type metadata for () + 8, v5);
  swift_release(KeyPath);

}

char *sub_100040C68()
{
  _BYTE *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  char *v5;
  char *result;
  char *v7;
  void *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t KeyPath;
  uint64_t v17;
  _QWORD v18[6];
  _QWORD aBlock[5];
  uint64_t v20;
  objc_super v21;

  v1 = &v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork];
  *v1 = 0;
  v1[1] = 0xE000000000000000;
  v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage] = 0;
  v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected] = 0;
  v2 = &v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath];
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v3 = &v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName];
  *v3 = 0;
  v3[1] = 0xE000000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage] = 0;
  v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__skManagerReady] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer] = 0;
  v4 = (void *)objc_opt_self(SKManager);
  v5 = v0;
  result = (char *)objc_msgSend(v4, "sharedManager");
  if (result)
  {
    *(_QWORD *)&v5[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState_skManager] = result;
    ObservationRegistrar.init()();

    v21.receiver = v5;
    v21.super_class = (Class)type metadata accessor for DebugInfoState(0);
    v7 = (char *)objc_msgSendSuper2(&v21, "init");
    v8 = *(void **)&v7[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState_skManager];
    v9 = v7;
    objc_msgSend(v8, "addListener:", v9);
    sub_100041408();
    sub_100041564();
    sub_100041208();
    sub_100041890();
    v10 = (void *)objc_opt_self(NSTimer);
    v11 = swift_allocObject(&unk_100076748, 24, 7);
    *(_QWORD *)(v11 + 16) = v9;
    aBlock[4] = sub_100042B78;
    v20 = v11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100040F6C;
    aBlock[3] = &unk_100076760;
    v12 = _Block_copy(aBlock);
    v13 = v20;
    v14 = v9;
    swift_release(v13);
    v15 = objc_msgSend(v10, "scheduledTimerWithTimeInterval:repeats:block:", 1, v12, 10.0);
    _Block_release(v12);
    KeyPath = swift_getKeyPath(&unk_1000560F0);
    __chkstk_darwin(KeyPath);
    v18[2] = v14;
    v18[3] = v15;
    aBlock[0] = v14;
    v17 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(aBlock, KeyPath, sub_100042B64, v18, (char *)&type metadata for () + 8, v17);

    swift_release(KeyPath);
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100040F40()
{
  sub_100041408();
  sub_100041564();
  sub_100041208();
  return sub_100041890();
}

void sub_100040F6C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

id sub_100040FDC()
{
  char *v0;
  uint64_t KeyPath;
  uint64_t v2;
  objc_super v4;
  char *v5;

  KeyPath = swift_getKeyPath(&unk_1000560F0);
  v5 = v0;
  v2 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v5, KeyPath, v2);
  swift_release(KeyPath);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer], "invalidate");
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for DebugInfoState(0);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_1000411EC()
{
  return type metadata accessor for DebugInfoState(0);
}

uint64_t type metadata accessor for DebugInfoState(uint64_t a1)
{
  return sub_100043BB0(a1, qword_10008B888, (uint64_t)&nominal type descriptor for DebugInfoState);
}

void sub_100041208()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD aBlock[5];
  uint64_t v10;

  v1 = objc_msgSend((id)objc_opt_self(CBShellServer), "sharedInstance");
  if (v1)
  {
    v8 = v1;
    v2 = objc_msgSend(v1, "systemServicesDelegate");
    if (v2)
    {
      v3 = v2;
      v4 = swift_allocObject(&unk_1000766F8, 24, 7);
      *(_QWORD *)(v4 + 16) = v0;
      aBlock[4] = sub_100042AFC;
      v10 = v4;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000413CC;
      aBlock[3] = &unk_100076710;
      v5 = _Block_copy(aBlock);
      v6 = v10;
      v7 = v0;
      swift_release(v6);
      objc_msgSend(v3, "diagnosticsRunning:", v5);
      _Block_release(v5);

      swift_unknownObjectRelease(v3);
    }
    else
    {

    }
  }
}

uint64_t sub_100041324(char a1, uint64_t a2)
{
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;

  KeyPath = swift_getKeyPath(&unk_1000560C8);
  v7[2] = a2;
  v8 = a1;
  v9 = a2;
  v5 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_100042B44, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1000413CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_100041408()
{
  uint64_t v0;
  id result;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  _QWORD v9[7];
  uint64_t v10;

  result = objc_msgSend((id)objc_opt_self(CBWiFiManager), "sharedInstance");
  if (result)
  {
    v2 = result;
    if (objc_msgSend(result, "isAssociatedToNetwork"))
    {
      result = objc_msgSend(v2, "currentNetworkSSID");
      if (!result)
      {
        __break(1u);
        return result;
      }
      v3 = result;
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
      v6 = v5;

    }
    else
    {
      v4 = 0;
      v6 = 0xE000000000000000;
    }
    KeyPath = swift_getKeyPath(&unk_1000560A0);
    __chkstk_darwin(KeyPath);
    v9[2] = v0;
    v9[3] = v4;
    v9[4] = v6;
    v10 = v0;
    v8 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v10, KeyPath, sub_100042A74, v9, (char *)&type metadata for () + 8, v8);

    swift_release(KeyPath);
    return (id)swift_bridgeObjectRelease(v6);
  }
  return result;
}

uint64_t sub_100041564()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[16];
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  statfs v21;

  v1 = v0;
  bzero(&v21, 0x878uLL);
  statfs("/private/var", &v21);
  if (!is_mul_ok(v21.f_blocks, v21.f_bsize))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (!is_mul_ok(v21.f_bfree, v21.f_bsize))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v2 = v21.f_blocks * v21.f_bsize;
  v3 = v21.f_bfree * v21.f_bsize;
  v4 = v2 - v3;
  if (v2 < v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v5 = v2 / 0xF4240;
  KeyPath = swift_getKeyPath(&unk_100056028);
  __chkstk_darwin(KeyPath);
  v18 = v1;
  v19 = v5;
  v20 = v1;
  v7 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v20, KeyPath, sub_1000429C0, v17, (char *)&type metadata for () + 8, v7);
  swift_release(KeyPath);
  v8 = v4 / 0xF4240;
  v9 = swift_getKeyPath(&unk_100056050);
  __chkstk_darwin(v9);
  v18 = v1;
  v19 = v8;
  v20 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v20, v9, sub_1000429FC, v17, (char *)&type metadata for () + 8, v7);
  swift_release(v9);
  v10 = swift_getKeyPath(&unk_100056050);
  v20 = v1;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v20, v10, v7);
  swift_release(v10);
  v11 = (double)*(unint64_t *)(v1 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed);
  v12 = swift_getKeyPath(&unk_100056028);
  v20 = v1;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v20, v12, v7);
  swift_release(v12);
  v13 = v11 / (double)*(unint64_t *)(v1 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize) * 100.0;
  if ((~*(_QWORD *)&v13 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  if (v13 >= 9.22337204e18)
    goto LABEL_13;
  v14 = (uint64_t)v13;
  v15 = swift_getKeyPath(&unk_100056078);
  __chkstk_darwin(v15);
  v18 = v1;
  v19 = v14;
  v20 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v20, v15, sub_100042A38, v17, (char *)&type metadata for () + 8, v7);
  return swift_release(v15);
}

uint64_t sub_100041890()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t f_bavail;
  uint64_t f_files;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t KeyPath;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  id v77;
  __int128 v78;
  id v79;
  uint64_t v80;
  id v81[2];
  _OWORD v82[2];
  statfs v83;
  __int128 v84;
  uint64_t v85;
  _QWORD v86[5];

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState_skManager), "allDisks"));
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = sub_10003AB50(&qword_10008B8A8);
  v86[3] = v3;
  v4 = sub_100044F0C(&qword_10008B8B0, &qword_10008B8A8, (uint64_t)&protocol conformance descriptor for [A]);
  v86[4] = v4;
  v86[0] = v2;
  v5 = sub_100042784(v86, v3);
  __chkstk_darwin(v5);
  v7 = (uint64_t *)((char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_QWORD *))(v8 + 16))(v7);
  v83.f_bavail = swift_getAssociatedTypeWitness(0, v4, v3, &protocol requirements base descriptor for Sequence, &associated type descriptor for Sequence.Iterator);
  v83.f_files = swift_getAssociatedConformanceWitness(v4, v3, v83.f_bavail, &protocol requirements base descriptor for Sequence, &associated conformance descriptor for Sequence.Sequence.Iterator: IteratorProtocol);
  v9 = sub_10004294C(&v83);
  v79 = 0;
  *v9 = *v7;
  v9[1] = 0;
  v78 = xmmword_100055D20;
  while (1)
  {
    f_bavail = v83.f_bavail;
    f_files = v83.f_files;
    sub_1000427A8((uint64_t)&v83, v83.f_bavail);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, f_files, f_bavail, &protocol requirements base descriptor for IteratorProtocol, &associated type descriptor for IteratorProtocol.Element);
    v13 = type metadata accessor for Optional(0, AssociatedTypeWitness);
    v14 = *(_QWORD *)(v13 - 8);
    __chkstk_darwin(v13);
    v16 = (char *)&v76 - v15;
    dispatch thunk of IteratorProtocol.next()(f_bavail, f_files);
    v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, AssociatedTypeWitness) == 1)
      break;
    v85 = AssociatedTypeWitness;
    v18 = sub_10004294C(&v84);
    (*(void (**)(_QWORD *, char *, uint64_t))(v17 + 32))(v18, v16, AssociatedTypeWitness);
    sub_100042988(&v84, v82);
    v19 = sub_100043D28(0, &qword_10008B8B8, SKDisk_ptr);
    if ((swift_dynamicCast(v81, v82, (char *)&type metadata for Any + 8, v19, 6) & 1) != 0)
    {
      v20 = v81[0];
      if (objc_msgSend(v81[0], "isValid")
        && objc_msgSend(v20, "isWritable")
        && (objc_msgSend(v20, "isInternal") & 1) == 0)
      {
        v21 = sub_10003AB50((uint64_t *)&unk_10008B8C0);
        v22 = swift_allocObject(v21, 72, 7);
        *(_OWORD *)(v22 + 16) = v78;
        v23 = objc_msgSend(v20, "description");
        v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
        v26 = v25;

        *(_QWORD *)(v22 + 56) = &type metadata for String;
        *(_QWORD *)(v22 + 64) = sub_10003AB90();
        *(_QWORD *)(v22 + 32) = v24;
        *(_QWORD *)(v22 + 40) = v26;
        v27 = sub_100043D28(0, (unint64_t *)&qword_10008B728, OS_os_log_ptr);
        v29 = (void *)static OS_os_log.default.getter(v27, v28);
        v31 = static os_log_type_t.default.getter(v29, v30);
        os_log(_:dso:log:type:_:)("Found potential disk %@", 23, 2, &_mh_execute_header, v29, v31, v22);
        swift_bridgeObjectRelease(v22);

        v79 = v20;
      }
      else
      {

      }
    }
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  sub_100043DC0(&v83);
  v32 = v79;
  if (!v79)
    goto LABEL_21;
  v33 = v79;
  v34 = objc_msgSend(v33, "mountPoint");
  if (!v34)
  {

LABEL_21:
    KeyPath = swift_getKeyPath(&unk_100055F38);
    __chkstk_darwin(KeyPath);
    v68 = v80;
    *(&v76 - 4) = v80;
    *(&v76 - 3) = 0;
    *(&v76 - 2) = 0xE000000000000000;
    *(_QWORD *)&v83.f_bsize = v68;
    v69 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v83, KeyPath, sub_1000427F8, &v76 - 6, (char *)&type metadata for () + 8, v69);
    swift_release(KeyPath);
    v70 = swift_getKeyPath(&unk_100055F60);
    __chkstk_darwin(v70);
    *(&v76 - 2) = v68;
    *(&v76 - 1) = 0;
    *(_QWORD *)&v83.f_bsize = v68;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v83, v70, sub_10004283C, &v76 - 4, (char *)&type metadata for () + 8, v69);
    swift_release(v70);
    v71 = swift_getKeyPath(&unk_100055F88);
    __chkstk_darwin(v71);
    *(&v76 - 2) = v68;
    *(&v76 - 1) = 0;
    *(_QWORD *)&v83.f_bsize = v68;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v83, v71, sub_100042878, &v76 - 4, (char *)&type metadata for () + 8, v69);
    swift_release(v71);
    v72 = swift_getKeyPath(&unk_100055FB0);
    __chkstk_darwin(v72);
    *(&v76 - 2) = v68;
    *(&v76 - 1) = 0;
    *(_QWORD *)&v83.f_bsize = v68;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v83, v72, sub_1000428B4, &v76 - 4, (char *)&type metadata for () + 8, v69);
    swift_release(v72);
    v73 = swift_getKeyPath(&unk_100055FD8);
    __chkstk_darwin(v73);
    *(&v76 - 4) = v68;
    *(&v76 - 3) = 0;
    *(&v76 - 2) = 0xE000000000000000;
    *(_QWORD *)&v83.f_bsize = v68;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v83, v73, sub_1000428F0, &v76 - 6, (char *)&type metadata for () + 8, v69);
    swift_release(v73);
    v74 = swift_getKeyPath(&unk_100056000);
    __chkstk_darwin(v74);
    *(&v76 - 2) = v68;
    *((_BYTE *)&v76 - 8) = 0;
    *(_QWORD *)&v83.f_bsize = v68;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v83, v74, sub_100042934, &v76 - 4, (char *)&type metadata for () + 8, v69);

    swift_release(v74);
    return sub_100043DC0(v86);
  }
  v35 = v34;
  v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
  v38 = v37;

  v39 = objc_msgSend(v33, "volumeName");
  if (!v39)
  {

    swift_bridgeObjectRelease(v38);
    goto LABEL_21;
  }
  v40 = v39;
  *(_QWORD *)&v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
  v79 = v41;

  v42 = swift_getKeyPath(&unk_100055F38);
  __chkstk_darwin(v42);
  v43 = v80;
  *(&v76 - 4) = v80;
  *(&v76 - 3) = v36;
  *(&v76 - 2) = v38;
  *(_QWORD *)&v83.f_bsize = v43;
  v44 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v83, v42, sub_1000427F8, &v76 - 6, (char *)&type metadata for () + 8, v44);
  swift_release(v42);
  swift_bridgeObjectRelease(v38);
  bzero(&v83, 0x878uLL);
  v45 = swift_getKeyPath(&unk_100055F38);
  *(_QWORD *)&v84 = v43;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v84, v45, v44);
  swift_release(v45);
  v46 = String.utf8CString.getter(*(_QWORD *)(v43 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath), *(_QWORD *)(v43 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath + 8));
  statfs((const char *)(v46 + 32), &v83);
  swift_release(v46);
  if (!is_mul_ok(v83.f_blocks, v83.f_bsize))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (!is_mul_ok(v83.f_bfree, v83.f_bsize))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v77 = v33;
  v47 = v83.f_blocks * v83.f_bsize;
  v48 = v83.f_bfree * v83.f_bsize;
  v49 = v47 - v48;
  if (v47 < v48)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v50 = v47 / 0xF4240;
  v51 = swift_getKeyPath(&unk_100055F60);
  __chkstk_darwin(v51);
  v52 = v80;
  *(&v76 - 2) = v80;
  *(&v76 - 1) = v50;
  *(_QWORD *)&v84 = v52;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v84, v51, sub_100044F64, &v76 - 4, (char *)&type metadata for () + 8, v44);
  swift_release(v51);
  v53 = v49 / 0xF4240;
  v54 = swift_getKeyPath(&unk_100055F88);
  __chkstk_darwin(v54);
  *(&v76 - 2) = v52;
  *(&v76 - 1) = v53;
  *(_QWORD *)&v84 = v52;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v84, v54, sub_100044F78, &v76 - 4, (char *)&type metadata for () + 8, v44);
  swift_release(v54);
  v55 = swift_getKeyPath(&unk_100055F88);
  *(_QWORD *)&v84 = v52;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v84, v55, v44);
  swift_release(v55);
  v56 = (double)*(unint64_t *)(v52 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed);
  v57 = swift_getKeyPath(&unk_100055F60);
  *(_QWORD *)&v84 = v52;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v84, v57, v44);
  swift_release(v57);
  v58 = v56 / (double)*(unint64_t *)(v52 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize) * 100.0;
  if ((~*(_QWORD *)&v58 & 0x7FF0000000000000) == 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v58 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  if (v58 >= 9.22337204e18)
    goto LABEL_28;
  v59 = (uint64_t)v58;
  v60 = swift_getKeyPath(&unk_100055FB0);
  __chkstk_darwin(v60);
  v61 = v80;
  *(&v76 - 2) = v80;
  *(&v76 - 1) = v59;
  *(_QWORD *)&v84 = v61;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v84, v60, sub_100044F8C, &v76 - 4, (char *)&type metadata for () + 8, v44);
  swift_release(v60);
  v62 = swift_getKeyPath(&unk_100055FD8);
  __chkstk_darwin(v62);
  v63 = v78;
  *(&v76 - 4) = v61;
  *(&v76 - 3) = v63;
  v64 = v79;
  *(&v76 - 2) = (uint64_t)v79;
  *(_QWORD *)&v84 = v61;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v84, v62, sub_1000428F0, &v76 - 6, (char *)&type metadata for () + 8, v44);
  swift_release(v62);
  swift_bridgeObjectRelease(v64);
  v65 = swift_getKeyPath(&unk_100056000);
  __chkstk_darwin(v65);
  *(&v76 - 2) = v61;
  *((_BYTE *)&v76 - 8) = 1;
  *(_QWORD *)&v84 = v61;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v84, v65, sub_100044FF4, &v76 - 4, (char *)&type metadata for () + 8, v44);
  v66 = v77;

  swift_release(v65);
  return sub_100043DC0(v86);
}

uint64_t sub_10004240C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  _QWORD v10[3];
  char v11;
  uint64_t v12;

  v1 = v0;
  v2 = sub_100043D28(0, (unint64_t *)&qword_10008B728, OS_os_log_ptr);
  v4 = (void *)static OS_os_log.default.getter(v2, v3);
  v6 = static os_log_type_t.default.getter(v4, v5);
  os_log(_:dso:log:type:_:)("StorageManager is ready to find disks", 37, 2, &_mh_execute_header, v4, v6, &_swiftEmptyArrayStorage);

  KeyPath = swift_getKeyPath(&unk_100055F10);
  v10[2] = v1;
  v11 = 1;
  v12 = v1;
  v8 = sub_100043BE4(&qword_10008B8A0, type metadata accessor for DebugInfoState, (uint64_t)&unk_100055EF0);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, sub_100042728, v10, (char *)&type metadata for () + 8, v8);
  swift_release(KeyPath);
  sub_100041408();
  sub_100041564();
  sub_100041208();
  return sub_100041890();
}

uint64_t sub_100042574(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5)
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  else
    v8 = 0;
  sub_100043D28(0, (unint64_t *)&qword_10008B728, OS_os_log_ptr);
  v9 = a1;
  v11 = (void *)static OS_os_log.default.getter(v9, v10);
  v13 = static os_log_type_t.default.getter(v11, v12);
  os_log(_:dso:log:type:_:)(a4, a5, 2, &_mh_execute_header, v11, v13, &_swiftEmptyArrayStorage);

  sub_100041890();
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_10004264C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[15];

  v4[0] = &unk_100055EA8;
  v4[1] = &unk_100055EC0;
  v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[5] = &unk_100055EC0;
  v4[6] = &unk_100055EA8;
  v4[7] = &unk_100055EA8;
  v4[8] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[9] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[10] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[11] = &unk_100055EC0;
  v4[12] = &unk_100055ED8;
  v4[13] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for ObservationRegistrar(319);
  if (v3 <= 0x3F)
  {
    v4[14] = *(_QWORD *)(result - 8) + 64;
    return swift_updateClassMetadata2(a1, 256, 15, v4, a1 + 80);
  }
  return result;
}

uint64_t sub_100042700@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004094C(a1, (uint64_t)&unk_100055F10, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__skManagerReady, a2);
}

void sub_100042728()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__skManagerReady) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_100042740(uint64_t *a1)
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

_QWORD *sub_100042784(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000427A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1000427D0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040414(a1, (uint64_t)&unk_100055F38, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath, a2);
}

uint64_t sub_1000427F8()
{
  return sub_100042A90(&OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath);
}

uint64_t sub_100042814@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040778(a1, (uint64_t)&unk_100055F60, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize, a2);
}

void sub_10004283C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_100042850@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040778(a1, (uint64_t)&unk_100055F88, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed, a2);
}

void sub_100042878()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_10004288C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040778(a1, (uint64_t)&unk_100055FB0, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage, a2);
}

void sub_1000428B4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_1000428C8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040414(a1, (uint64_t)&unk_100055FD8, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName, a2);
}

uint64_t sub_1000428F0()
{
  return sub_100042A90(&OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName);
}

uint64_t sub_10004290C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004094C(a1, (uint64_t)&unk_100056000, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected, a2);
}

void sub_100042934()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) = *(_BYTE *)(v0 + 24);
}

_QWORD *sub_10004294C(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

_OWORD *sub_100042988(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100042998@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040778(a1, (uint64_t)&unk_100056028, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize, a2);
}

void sub_1000429C0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_1000429D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040778(a1, (uint64_t)&unk_100056050, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed, a2);
}

void sub_1000429FC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_100042A10@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040778(a1, (uint64_t)&unk_100056078, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage, a2);
}

void sub_100042A38()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_100042A4C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100040414(a1, (uint64_t)&unk_1000560A0, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork, a2);
}

uint64_t sub_100042A74()
{
  return sub_100042A90(&OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork);
}

uint64_t sub_100042A90(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = v1[4];
  v3 = (_QWORD *)(v1[2] + *a1);
  v4 = v3[1];
  *v3 = v1[3];
  v3[1] = v2;
  swift_bridgeObjectRetain(v2);
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_100042AD8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100042AFC(char a1)
{
  uint64_t v1;

  return sub_100041324(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100042B04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100042B14(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100042B1C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004094C(a1, (uint64_t)&unk_1000560C8, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning, a2);
}

void sub_100042B44()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning) = *(_BYTE *)(v0 + 24);
}

void sub_100042B64()
{
  sub_100042B80();
}

uint64_t sub_100042B78()
{
  return sub_100040F40();
}

void sub_100042B80()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer) = v2;
  v4 = v2;

}

uint64_t sub_100042BBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10003AB50(&qword_10008B9B0);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100044BE4(v2, (uint64_t)v10, &qword_10008B9B0);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
    return sub_10003AEC4((uint64_t)v10, a1, &qword_10008B9B8);
  v12 = *v10;
  v13 = static os_log_type_t.fault.getter();
  v14 = static Log.runtimeIssuesLog.getter();
  v15 = v13;
  if (os_log_type_enabled(v14, v13))
  {
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    v17 = swift_slowAlloc(32, -1);
    v19[1] = a1;
    v18 = v17;
    v21 = v17;
    *(_DWORD *)v16 = 136315138;
    v20 = sub_100042E6C(0xD000000000000020, 0x800000010006CEB0, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v16 + 4, v16 + 12);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v16, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, v12);
  swift_release(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100042DEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = sub_10003AB50(&qword_10008B9B8);
  __chkstk_darwin(v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100044BE4(a1, (uint64_t)v4, &qword_10008B9B8);
  return EnvironmentValues.horizontalSizeClass.setter(v4);
}

uint64_t sub_100042E6C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100042F3C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10003AC78((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10003AC78((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100043DC0(v12);
  return v7;
}

uint64_t sub_100042F3C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1000430F4(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_1000430F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100043188(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100043360(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100043360(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100043188(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_1000432FC(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000432FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_10003AB50(&qword_10008B9E0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100043360(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    v10 = sub_10003AB50(&qword_10008B9E0);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

__n128 sub_1000434AC@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, char a10, uint64_t a11, uint64_t a12)
{
  unsigned __int8 v16;
  unint64_t v17;
  unsigned __int8 v18;
  unint64_t v19;
  __n128 result;
  uint64_t v21;
  _QWORD v26[2];
  __n128 v27;
  uint64_t v28;

  LOBYTE(v26[0]) = a8;
  State.init(wrappedValue:)(&v27, v26, &type metadata for Bool);
  v16 = v27.n128_u8[0];
  v17 = v27.n128_u64[1];
  LOBYTE(v26[0]) = a10;
  State.init(wrappedValue:)(&v27, v26, &type metadata for Bool);
  v18 = v27.n128_u8[0];
  v19 = v27.n128_u64[1];
  v26[0] = a11;
  v26[1] = a12;
  State.init(wrappedValue:)(&v27, v26, &type metadata for String);
  result = v27;
  v21 = v28;
  *(_BYTE *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_BYTE *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_BYTE *)(a9 + 56) = v16;
  *(_QWORD *)(a9 + 64) = v17;
  *(_BYTE *)(a9 + 72) = v18;
  *(_QWORD *)(a9 + 80) = v19;
  *(__n128 *)(a9 + 88) = result;
  *(_QWORD *)(a9 + 104) = v21;
  return result;
}

uint64_t destroy for DebugInfoView(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));

  swift_release(*(_QWORD *)(a1 + 64));
  swift_release(*(_QWORD *)(a1 + 80));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 96));
  return swift_release(*(_QWORD *)(a1 + 104));
}

uint64_t initializeWithCopy for DebugInfoView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v6;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v8 = *(_QWORD *)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v7;
  v9 = *(_QWORD *)(a2 + 96);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v9;
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  v11 = v5;
  swift_retain(v6);
  swift_retain(v8);
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  return a1;
}

uint64_t assignWithCopy for DebugInfoView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(void **)(a2 + 48);
  v9 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v8;
  v10 = v8;

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v12;
  swift_retain(v12);
  swift_release(v11);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v14;
  swift_retain(v14);
  swift_release(v13);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v15 = *(_QWORD *)(a2 + 96);
  v16 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  v17 = *(_QWORD *)(a1 + 104);
  v18 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v18;
  swift_retain(v18);
  swift_release(v17);
  return a1;
}

__n128 initializeWithTake for DebugInfoView(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for DebugInfoView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release(v7);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release(v8);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 96));
  v9 = *(_QWORD *)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_release(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugInfoView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DebugInfoView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DebugInfoView()
{
  return &type metadata for DebugInfoView;
}

uint64_t sub_100043948(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100071D1C, 1);
}

uint64_t sub_100043958()
{
  uint64_t v0;

  return sub_10003EA9C(*(_QWORD *)(v0 + 16));
}

unint64_t sub_100043960()
{
  unint64_t result;

  result = qword_10008B930;
  if (!qword_10008B930)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10008B930);
  }
  return result;
}

uint64_t sub_1000439A8()
{
  uint64_t v0;
  uint64_t v1;
  char v3;
  __int128 v4;

  v4 = *(_OWORD *)(v0 + 88);
  v3 = 0;
  v1 = sub_10003AB50(&qword_10008B918);
  return State.wrappedValue.setter(&v3, v1);
}

_QWORD *sub_1000439F0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = a1[2];
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = a1[8];
  v6 = a1[10];
  v7 = a1[12];
  swift_retain(a1[13]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  v8 = v4;
  swift_retain(v5);
  swift_retain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t sub_100043A6C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100043A94(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_100043AB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  sub_100043B04(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return a1;
}

uint64_t sub_100043B04(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100043B14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  sub_100043B60(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_100043B60(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100043B74()
{
  return sub_10003E318();
}

uint64_t sub_100043B94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10003E764(*(_QWORD *)(v1 + 16), a1);
}

uint64_t type metadata accessor for TestButtonLabel(uint64_t a1)
{
  return sub_100043BB0(a1, (uint64_t *)&unk_10008BA80, (uint64_t)&nominal type descriptor for TestButtonLabel);
}

uint64_t sub_100043BB0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100043BE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100043C24@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100043C50(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_100043C74()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_100043C84(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

void sub_100043CA0()
{
  sub_10003E8E8();
}

uint64_t sub_100043CA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10003E96C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_100043CB0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100043CC0()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_100043CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TestButtonLabel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100043D28(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100043D64()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));

  swift_release(*(_QWORD *)(v0 + 80));
  swift_release(*(_QWORD *)(v0 + 96));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
  swift_release(*(_QWORD *)(v0 + 120));
  return swift_deallocObject(v0, 128, 7);
}

uint64_t sub_100043DB8()
{
  uint64_t v0;

  return sub_10003EBC0(v0 + 16);
}

uint64_t sub_100043DC0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

double sub_100043DE4(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_100043E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22)
{
  uint64_t result;

  if (a7)
  {
    sub_100043B04(a4, a5, a6 & 1);
    swift_bridgeObjectRetain(a7);
    sub_100043B04(a8, a9, a10 & 1);
    swift_bridgeObjectRetain(a11);
    sub_100043B04(a15, a16, a17 & 1);
    swift_bridgeObjectRetain(a18);
    sub_100043B04(a19, a20, a21 & 1);
    return swift_bridgeObjectRetain(a22);
  }
  return result;
}

_QWORD *sub_100043EE0(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21]);
  return a1;
}

uint64_t sub_100043F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22)
{
  uint64_t result;

  if (a7)
  {
    sub_100043B60(a4, a5, a6 & 1);
    swift_bridgeObjectRelease(a7);
    sub_100043B60(a8, a9, a10 & 1);
    swift_bridgeObjectRelease(a11);
    sub_100043B60(a15, a16, a17 & 1);
    swift_bridgeObjectRelease(a18);
    sub_100043B60(a19, a20, a21 & 1);
    return swift_bridgeObjectRelease(a22);
  }
  return result;
}

uint64_t *sub_100044024(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v15);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[2];
    v7 = a2[3];
    a1[2] = v6;
    a1[3] = v7;
    v8 = *(int *)(a3 + 28);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain(v5);
    swift_retain(v6);
    swift_retain(v7);
    v11 = sub_10003AB50(&qword_10008B9B0);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for UserInterfaceSizeClass(0);
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        v14 = sub_10003AB50(&qword_10008B9B8);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v13 + 16))(v9, v10, v12);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      v17 = v9;
      v18 = v11;
      v19 = 1;
    }
    else
    {
      v16 = *v10;
      *v9 = *v10;
      swift_retain(v16);
      v17 = v9;
      v18 = v11;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  return a1;
}

uint64_t sub_100044178(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  swift_bridgeObjectRelease(a1[1]);
  swift_release(a1[2]);
  swift_release(a1[3]);
  v4 = (_QWORD *)((char *)a1 + *(int *)(a2 + 28));
  v5 = sub_10003AB50(&qword_10008B9B0);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for UserInterfaceSizeClass(0);
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(_QWORD *, uint64_t))(v7 + 8))(v4, v6);
  return result;
}

_QWORD *sub_100044238(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  v7 = *(int *)(a3 + 28);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  swift_bridgeObjectRetain(v4);
  swift_retain(v5);
  swift_retain(v6);
  v10 = sub_10003AB50(&qword_10008B9B0);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for UserInterfaceSizeClass(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
    {
      v13 = sub_10003AB50(&qword_10008B9B8);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      v14 = 1;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v12 + 16))(v8, v9, v11);
      v14 = 1;
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
    }
  }
  else
  {
    v15 = *v9;
    *v8 = *v9;
    swift_retain(v15);
    v14 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v10, v14);
  return a1;
}

_QWORD *sub_100044360(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_retain(v8);
  swift_release(v9);
  v10 = a2[3];
  v11 = a1[3];
  a1[3] = v10;
  swift_retain(v10);
  swift_release(v11);
  if (a1 != a2)
  {
    v12 = *(int *)(a3 + 28);
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    sub_100044BA8((uint64_t)a1 + v12, &qword_10008B9B0);
    v15 = sub_10003AB50(&qword_10008B9B0);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for UserInterfaceSizeClass(0);
      v17 = *(_QWORD *)(v16 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16))
      {
        v18 = sub_10003AB50(&qword_10008B9B8);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
        v19 = 1;
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v17 + 16))(v13, v14, v16);
        v19 = 1;
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
      }
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v13, v15, v19);
  }
  return a1;
}

_OWORD *sub_1000444D4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_10003AB50(&qword_10008B9B0);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    v9 = type metadata accessor for UserInterfaceSizeClass(0);
    v10 = *(_QWORD *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9))
    {
      v11 = sub_10003AB50(&qword_10008B9B8);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v6, v7, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
    }
    swift_storeEnumTagMultiPayload(v6, v8, 1);
  }
  else
  {
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_1000445DC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a1[2];
  a1[2] = a2[2];
  swift_release(v8);
  v9 = a1[3];
  a1[3] = a2[3];
  swift_release(v9);
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 28);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    sub_100044BA8((uint64_t)a1 + v10, &qword_10008B9B0);
    v13 = sub_10003AB50(&qword_10008B9B0);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for UserInterfaceSizeClass(0);
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
      {
        v16 = sub_10003AB50(&qword_10008B9B8);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v11, v12, v14);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
      }
      swift_storeEnumTagMultiPayload(v11, v13, 1);
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10004472C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100044738);
}

uint64_t sub_100044738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_10003AB50(&qword_10008BA20);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_1000447B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000447C4);
}

uint64_t sub_1000447C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_10003AB50(&qword_10008BA20);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_10004483C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = &unk_100055EA8;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  sub_1000448C0(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

void sub_1000448C0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10008BA90)
  {
    v2 = sub_100042740(&qword_10008B9B8);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10008BA90);
  }
}

unint64_t sub_10004491C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10008BAC8;
  if (!qword_10008BAC8)
  {
    v1 = sub_100042740(&qword_10008B8F8);
    sub_100044F0C(&qword_10008BAD0, &qword_10008B8E8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10008BAC8);
  }
  return result;
}

uint64_t sub_1000449A0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100071D44, 1);
}

uint64_t sub_1000449B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000449D8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100044A00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100044A44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 144);
  v4 = *(_QWORD *)(a1 + 160);
  v5 = *(_QWORD *)(a1 + 168);
  sub_100043B04(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain(v5);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t sub_100044AB0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100044AEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 144);
  v4 = *(_QWORD *)(a1 + 160);
  v5 = *(_QWORD *)(a1 + 168);
  sub_100043B60(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v5);
  return a1;
}

uint64_t sub_100044B58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100044B80(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100044BA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10003AB50(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100044BE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10003AB50(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_100044C2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10008BB10;
  if (!qword_10008BB10)
  {
    v1 = sub_100042740(&qword_10008BB00);
    sub_100044C98();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10008BB10);
  }
  return result;
}

unint64_t sub_100044C98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10008BB18;
  if (!qword_10008BB18)
  {
    v1 = sub_100042740(&qword_10008BAF8);
    sub_100044D1C();
    sub_100044F0C(&qword_10008BB80, &qword_10008BB88, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10008BB18);
  }
  return result;
}

unint64_t sub_100044D1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10008BB20;
  if (!qword_10008BB20)
  {
    v1 = sub_100042740(&qword_10008BAF0);
    sub_100044DA0();
    sub_100044F0C(&qword_10008BB78, &qword_10008BAD8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10008BB20);
  }
  return result;
}

unint64_t sub_100044DA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10008BB28;
  if (!qword_10008BB28)
  {
    v1 = sub_100042740(&qword_10008BB30);
    sub_100044E24();
    sub_100044F0C(&qword_10008BB68, &qword_10008BB70, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10008BB28);
  }
  return result;
}

unint64_t sub_100044E24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10008BB38;
  if (!qword_10008BB38)
  {
    v1 = sub_100042740(&qword_10008BB40);
    sub_100044EA8();
    sub_100044F0C(&qword_10008BB58, &qword_10008BB60, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10008BB38);
  }
  return result;
}

unint64_t sub_100044EA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10008BB48;
  if (!qword_10008BB48)
  {
    v1 = sub_100042740(&qword_10008BB50);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10008BB48);
  }
  return result;
}

uint64_t sub_100044F0C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100042740(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_100044F64()
{
  sub_10004283C();
}

void sub_100044F78()
{
  sub_100042878();
}

void sub_100044F8C()
{
  sub_1000428B4();
}

void sub_100044FA0()
{
  sub_100042A38();
}

void sub_100044FB4()
{
  sub_1000429FC();
}

void sub_100044FC8()
{
  sub_1000429C0();
}

void sub_100044FE0()
{
  sub_100042728();
}

void sub_100044FF4()
{
  sub_100042934();
}

void sub_100045008()
{
  sub_100042B44();
}

uint64_t sub_10004501C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC12CheckerBoardP33_8D5B8DB70B812ED24A7BEE76B45D81DE19ResourceBundleClass);
}

void sub_10004504C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CF4((void *)&_mh_execute_header, a2, a3, "Remote setup requested we present a pascode of unsupported type %@", a5, a6, a7, a8, 2u);
}

void sub_1000450B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Remote setup requested we present a pin with no pin!", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_1000450E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Unable to initialize QR code scanner to authenticate with client deivce", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_100045114(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CF4((void *)&_mh_execute_header, a2, a3, "Remote setup wants us to answer authentication with invalid password type %@", a5, a6, a7, a8, 2u);
}

void sub_10004517C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Failed to start QR code scanner. Failing remote setup.", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_1000451AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "notify_register_check(kSunlightState) failed", a5, a6, a7, a8, 0);
}

void sub_1000451E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "notify_get_state(sunlightStateToken) failed", a5, a6, a7, a8, 0);
}

void sub_100045214(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Battery device state change occured without any internal batteries present!", v1, 2u);
}

void sub_100045254(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to find url to package %@:", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[OBWelcomeController(Animation) bundleUrlForPackageName:]", "OBWelcomeController+Animation.m", 47, "0");
}

void sub_1000452EC(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  unsigned int v7;

  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a2, "broadcastingForSetup");
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Unable to set override pin to (%@) - broadcasting: (%d)", (uint8_t *)&v4, 0x12u);
}

void sub_100045388(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "sendPasswordAuth called while not performing remote setup!", a5, a6, a7, a8, 0);
}

void sub_1000453BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Setup server unexpectedly stopped", a5, a6, a7, a8, 0);
}

void sub_1000453F0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Network selected in wifi picker, but selected cell is not a CBNetworkListRecord!", v1, 2u);
}

void sub_100045430(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Primary app exited, resetting flow.", v1, 2u);
}

void sub_100045470(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "App exited", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_1000454A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CF4((void *)&_mh_execute_header, a2, a3, "Operation not permitted: %@", a5, a6, a7, a8, 2u);
}

void sub_100045508(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Could not create process identity for InputUI", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_100045538(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Could not create InputUI scene", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_100045568(void *a1, NSObject *a2)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "passwordType");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected authentication type %d for remote setup. Setup flow will fail when pushed.", (uint8_t *)v3, 8u);
}

void sub_1000455F0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Launched diagnostics with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100045664(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skiping entitlement check. APTicket is not valid", v1, 2u);
}

void sub_1000456A4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get path for APTicket: %@", (uint8_t *)&v2, 0xCu);
  sub_1000215E4();
}

void sub_100045714(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to load data for APTicket from path (%@): %@", (uint8_t *)&v3, 0x16u);
  sub_1000215E4();
}

void sub_100045794(int a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to digest ticket, error %d, digestSize=%zu", (uint8_t *)v3, 0x12u);
  sub_1000215E4();
}

void sub_100045814()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100022FB0();
  sub_100007CE4((void *)&_mh_execute_header, v0, v1, "Failed to discover cameras for QR code scanning", v2, v3, v4, v5, v6);
  sub_100007D04();
}

void sub_100045840()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100022FB0();
  sub_100007CE4((void *)&_mh_execute_header, v0, v1, "Failed to obtain capture device for QR code scanning", v2, v3, v4, v5, v6);
  sub_100007D04();
}

void sub_10004586C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100022FB0();
  sub_100007CE4((void *)&_mh_execute_header, v0, v1, "Failed to set input device for camera capture for QR code scanning", v2, v3, v4, v5, v6);
  sub_100007D04();
}

void sub_100045898()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100022FB0();
  sub_100007CE4((void *)&_mh_execute_header, v0, v1, "AVCaptureMetadataOutput doesn't support QR codes!", v2, v3, v4, v5, v6);
  sub_100007D04();
}

void sub_1000458C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CF4((void *)&_mh_execute_header, a2, a3, "[CBIdleSleepManager] Could not resume AttentionAwareness on undim: %@", a5, a6, a7, a8, 2u);
  sub_1000215E4();
}

void sub_100045928(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CF4((void *)&_mh_execute_header, a2, a3, "[CBIdleSleepManager] Could not suspend Attentionawareness on dim: %@", a5, a6, a7, a8, 2u);
  sub_1000215E4();
}

void sub_10004598C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "[CBIdleSleepManager] IORegisterForSystemPower failed. CheckerBoard will not receive wake and sleep notifications.", v1, 2u);
}

void sub_1000459CC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CF4((void *)&_mh_execute_header, a2, a3, "[CBIdleSleepManager] Unable to set configuration and reset attention lost timeout, error: %@", a5, a6, a7, a8, 2u);
  sub_1000215E4();
}

void sub_100045A30()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100022FB0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "CheckerBoard is running in an environment that prevents initialization of WiFi.", v1, 2u);
  sub_100007D04();
}

void sub_100045A68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100022FB0();
  sub_100007CE4((void *)&_mh_execute_header, v0, v1, "startWiFiNetworkScanRequestFrom called without a requestor", v2, v3, v4, v5, v6);
  sub_100007D04();
}

void sub_100045A94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002B828();
  sub_100007CF4((void *)&_mh_execute_header, v0, v1, "Network scan returned error %@", v2, v3, v4, v5, v6);
  sub_1000215E4();
}

void sub_100045AF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100022FB0();
  sub_100007CE4((void *)&_mh_execute_header, v0, v1, "stopWiFiNetworkScanWithRequestor called without a previously registered requestor!", v2, v3, v4, v5, v6);
  sub_100007D04();
}

void sub_100045B20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002B828();
  sub_100007CF4((void *)&_mh_execute_header, v0, v1, "Encrypted network association returned error %@", v2, v3, v4, v5, v6);
  sub_1000215E4();
}

void sub_100045B80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002B828();
  sub_100007CF4((void *)&_mh_execute_header, v0, v1, "Unencrypted network association returned error %@", v2, v3, v4, v5, v6);
  sub_1000215E4();
}

void sub_100045BE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002B828();
  sub_100007CF4((void *)&_mh_execute_header, v0, v1, "Hidden unencrypted network association returned error %@", v2, v3, v4, v5, v6);
  sub_1000215E4();
}

void sub_100045C40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100022FB0();
  sub_100007CE4((void *)&_mh_execute_header, v0, v1, "Attempting to reconnect to last known good network without a last known good network!", v2, v3, v4, v5, v6);
  sub_100007D04();
}

void sub_100045C6C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out waiting for shutdown tasks to complete", v1, 2u);
}

void sub_100045CAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Invalid password", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_100045CDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Device and/or resources are busy at the moment…", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_100045D0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007CE4((void *)&_mh_execute_header, a1, a3, "Device and/or resources are still busy… Please try again later.", a5, a6, a7, a8, 0);
  sub_100007D04();
}

void sub_100045D3C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CADisplay");
  _convertNSErrorToError(_:)(v0);
}

id objc_msgSend_CBDebugInfoViewDismissButtonPressedNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CBDebugInfoViewDismissButtonPressedNotification");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGImage");
}

id objc_msgSend_RSSI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "RSSI");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_WAPISubtype(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "WAPISubtype");
}

id objc_msgSend___handleHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__handleHIDEvent:");
}

id objc_msgSend__additionalSafeAreaInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_additionalSafeAreaInsets");
}

id objc_msgSend__adjustBackgroundWindowLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustBackgroundWindowLevel");
}

id objc_msgSend__alertNotVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertNotVisible");
}

id objc_msgSend__appClientSettingsDiffInspector(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appClientSettingsDiffInspector");
}

id objc_msgSend__associateToEncryptedNetworkWithScanResult_password_isHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associateToEncryptedNetworkWithScanResult:password:isHidden:");
}

id objc_msgSend__associateToNetworkWithScanResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associateToNetworkWithScanResult:");
}

id objc_msgSend__associateToUnencryptedNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associateToUnencryptedNetwork:");
}

id objc_msgSend__associationParametersFromScanResult_withPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associationParametersFromScanResult:withPassword:");
}

id objc_msgSend__attemptConnectingToWifi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_attemptConnectingToWifi");
}

id objc_msgSend__attemptReconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_attemptReconnect");
}

id objc_msgSend__auditToken_hasEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_auditToken:hasEntitlement:");
}

id objc_msgSend__backlightLuminance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backlightLuminance");
}

id objc_msgSend__backlightSceneEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backlightSceneEnvironment");
}

id objc_msgSend__batteryItemPercentFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_batteryItemPercentFormatter");
}

id objc_msgSend__beginThermalJetsamCPUSampling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginThermalJetsamCPUSampling");
}

id objc_msgSend__calculateAppsCPUTimesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateAppsCPUTimesWithCompletion:");
}

id objc_msgSend__canAttemptJoin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canAttemptJoin");
}

id objc_msgSend__cancelLockButtonTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelLockButtonTimer");
}

id objc_msgSend__checkForAliases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForAliases:");
}

id objc_msgSend__checkForAliasesOrInvalid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForAliasesOrInvalid:");
}

id objc_msgSend__checkOutUserSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkOutUserSettings");
}

id objc_msgSend__checkoutAndPostAssociationCompletedNotificationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkoutAndPostAssociationCompletedNotificationWithError:");
}

id objc_msgSend__cleanUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUp");
}

id objc_msgSend__clearRemoteSetupUX(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearRemoteSetupUX");
}

id objc_msgSend__closeWifiConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closeWifiConnection");
}

id objc_msgSend__createInitialAppScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createInitialAppScene");
}

id objc_msgSend__createInputScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createInputScene");
}

id objc_msgSend__createRecordingIndicatorForStandaloneLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createRecordingIndicatorForStandaloneLocation");
}

id objc_msgSend__createRecordingIndicatorForStatusBarLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createRecordingIndicatorForStatusBarLocation");
}

id objc_msgSend__dataProviderDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataProviderDidUpdate:");
}

id objc_msgSend__deregisterNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deregisterNotifications");
}

id objc_msgSend__deregisterWiFiNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deregisterWiFiNotifications");
}

id objc_msgSend__disableContinousPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableContinousPath");
}

id objc_msgSend__disableTapToWake(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableTapToWake");
}

id objc_msgSend__disableUIAndDisplaySpinnerBarItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableUIAndDisplaySpinnerBarItem");
}

id objc_msgSend__disableUSBRestrictedMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableUSBRestrictedMode");
}

id objc_msgSend__enableAndUpdateUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableAndUpdateUI");
}

id objc_msgSend__enableLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableLeftBarButtonItem:");
}

id objc_msgSend__enableRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableRightBarButtonItem:");
}

id objc_msgSend__enableUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableUI:");
}

id objc_msgSend__getEntitlementLevelForConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEntitlementLevelForConnection:");
}

id objc_msgSend__groupSeparatorSpecifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupSeparatorSpecifier");
}

id objc_msgSend__handleCWInterfaceEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCWInterfaceEvent:");
}

id objc_msgSend__handleNewDomainData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNewDomainData:");
}

id objc_msgSend__handleRemoteSetupFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRemoteSetupFinished");
}

id objc_msgSend__handleSetupServerFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSetupServerFinished");
}

id objc_msgSend__hasHomeButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasHomeButton");
}

id objc_msgSend__hasLaunchedDiagnosticsProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasLaunchedDiagnosticsProcess");
}

id objc_msgSend__hidEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hidEvent");
}

id objc_msgSend__hideActivityView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hideActivityView");
}

id objc_msgSend__homeButtonDown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeButtonDown");
}

id objc_msgSend__homeButtonUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeButtonUp");
}

id objc_msgSend__indicatorIdentifierForSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indicatorIdentifierForSensorType:");
}

id objc_msgSend__indicatorTypeForSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indicatorTypeForSensorType:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_init");
}

id objc_msgSend__initRoutingRules(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initRoutingRules");
}

id objc_msgSend__initTapToWake(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initTapToWake");
}

id objc_msgSend__initWithFrame_debugName_scene_attached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithFrame:debugName:scene:attached:");
}

id objc_msgSend__initialStatusBarSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initialStatusBarSetup");
}

id objc_msgSend__isLevelBlocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isLevelBlocked:");
}

id objc_msgSend__isLockButtonTimerValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isLockButtonTimerValid");
}

id objc_msgSend__isLowPowerModeActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isLowPowerModeActive");
}

id objc_msgSend__isPermittedToUpdateASTDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPermittedToUpdateASTDefaults");
}

id objc_msgSend__joinTapped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_joinTapped");
}

id objc_msgSend__killThermallyActiveDiagnosticsApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_killThermallyActiveDiagnosticsApplication");
}

id objc_msgSend__lightSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightSystemFontOfSize:");
}

id objc_msgSend__loadAPTicket(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadAPTicket");
}

id objc_msgSend__lockButtonDown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lockButtonDown");
}

id objc_msgSend__lockButtonUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lockButtonUp");
}

id objc_msgSend__maxLevelForLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maxLevelForLayer:");
}

id objc_msgSend__modalNotVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modalNotVisible:");
}

id objc_msgSend__networkNameIsValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_networkNameIsValid");
}

id objc_msgSend__networkNameSpecifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_networkNameSpecifier");
}

id objc_msgSend__notifyObserversOfActivityChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversOfActivityChange");
}

id objc_msgSend__passwordIsValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passwordIsValid");
}

id objc_msgSend__passwordSpecifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passwordSpecifier");
}

id objc_msgSend__performDirectedScanIncludingHidden_AndAssociateToNetworkWithName_password_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performDirectedScanIncludingHidden:AndAssociateToNetworkWithName:password:");
}

id objc_msgSend__peripheryInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peripheryInsets");
}

id objc_msgSend__pointImageOfColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointImageOfColor:");
}

id objc_msgSend__postDidAssociateToEncryptedNetworkNotificationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postDidAssociateToEncryptedNetworkNotificationWithError:");
}

id objc_msgSend__postDidAssociateToOpenNetworkNotificationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postDidAssociateToOpenNetworkNotificationWithError:");
}

id objc_msgSend__postStatusBarUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postStatusBarUpdates");
}

id objc_msgSend__powerStateDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_powerStateDidChange");
}

id objc_msgSend__presentAlternateNetworkViewControllerWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlternateNetworkViewControllerWithInfo:");
}

id objc_msgSend__presentFailedAssociationAlertWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentFailedAssociationAlertWithTitle:message:");
}

id objc_msgSend__presentOpenNetworkAssociationFailureAlertWithNetworkName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentOpenNetworkAssociationFailureAlertWithNetworkName:");
}

id objc_msgSend__presentVC_onLayer_backgroundTunnel_statusBarVisible_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentVC:onLayer:backgroundTunnel:statusBarVisible:animated:completion:");
}

id objc_msgSend__presentWiFiNetworkTimeoutAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentWiFiNetworkTimeoutAlert");
}

id objc_msgSend__preventIdleSleep(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preventIdleSleep");
}

id objc_msgSend__preventIdleSleepForNumberOfSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preventIdleSleepForNumberOfSeconds:");
}

id objc_msgSend__privateNotificationOccurred_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_privateNotificationOccurred:");
}

id objc_msgSend__processBasicConfigFromEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processBasicConfigFromEvent:");
}

id objc_msgSend__pushedViewControllerBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushedViewControllerBackgroundColor");
}

id objc_msgSend__recentCameraAndMicrophoneActivityAttributions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recentCameraAndMicrophoneActivityAttributions");
}

id objc_msgSend__rectTuckedInBoundingPathCorner_withSize_cornerRadii_minimumPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rectTuckedInBoundingPathCorner:withSize:cornerRadii:minimumPadding:");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_referenceBounds");
}

id objc_msgSend__refreshLanguageStrings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshLanguageStrings");
}

id objc_msgSend__registerForNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerForNotifications");
}

id objc_msgSend__registerWiFiNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerWiFiNotifications");
}

id objc_msgSend__rekeyWindows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rekeyWindows");
}

id objc_msgSend__respondToCurrentThermalCondition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_respondToCurrentThermalCondition");
}

id objc_msgSend__restartTimeItemTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restartTimeItemTimer");
}

id objc_msgSend__restartWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restartWiFiNetworkScan");
}

id objc_msgSend__ringerSwitchDown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ringerSwitchDown");
}

id objc_msgSend__ringerSwitchUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ringerSwitchUp");
}

id objc_msgSend__rootStatusBarViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rootStatusBarViewController");
}

id objc_msgSend__savePendingInfoWithScanResult_password_isHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_savePendingInfoWithScanResult:password:isHidden:");
}

id objc_msgSend__scanComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scanComplete:");
}

id objc_msgSend__scanWifiList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scanWifiList");
}

id objc_msgSend__sceneForFBSScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sceneForFBSScene:");
}

id objc_msgSend__securitySpecifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_securitySpecifier");
}

id objc_msgSend__selectLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectLanguage:");
}

id objc_msgSend__setAllowsHighContrastForBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsHighContrastForBackgroundColor:");
}

id objc_msgSend__setAutoDiagsFromNVRamWithNavController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAutoDiagsFromNVRamWithNavController:");
}

id objc_msgSend__setClassesForProxyServerOnInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setClassesForProxyServerOnInterface:");
}

id objc_msgSend__setClassesForRemoteAlertsOnInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setClassesForRemoteAlertsOnInterface:");
}

id objc_msgSend__setDesiredUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDesiredUserDefaults");
}

id objc_msgSend__setDrawsSeparatorAtTopOfSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDrawsSeparatorAtTopOfSections:");
}

id objc_msgSend__setHIDUILockedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHIDUILockedState:");
}

id objc_msgSend__setIndicatorVisible_atLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIndicatorVisible:atLocation:");
}

id objc_msgSend__setItem_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setItem:enabled:");
}

id objc_msgSend__setLanguageFromNVRam(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLanguageFromNVRam");
}

id objc_msgSend__setReturnKeyEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setReturnKeyEnabled:");
}

id objc_msgSend__setShowsBackButtonIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowsBackButtonIndicator:");
}

id objc_msgSend__setSkipDiagsTermsAndConditionsFromNVRam(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSkipDiagsTermsAndConditionsFromNVRam");
}

id objc_msgSend__setWiFiFromNVRam(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWiFiFromNVRam");
}

id objc_msgSend__setupBattery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupBattery");
}

id objc_msgSend__setupLanguageButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupLanguageButton");
}

id objc_msgSend__setupLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupLock");
}

id objc_msgSend__setupNavBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupNavBar");
}

id objc_msgSend__setupOnboardingButtons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupOnboardingButtons");
}

id objc_msgSend__setupTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupTime");
}

id objc_msgSend__setupVersionFooter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupVersionFooter");
}

id objc_msgSend__setupWiFi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupWiFi");
}

id objc_msgSend__showActivityView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showActivityView");
}

id objc_msgSend__showPowerDownView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showPowerDownView");
}

id objc_msgSend__showSceneStatusBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSceneStatusBar:");
}

id objc_msgSend__showWiFiSettingsAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showWiFiSettingsAction");
}

id objc_msgSend__sortWiFiScanResultsAlphabetically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortWiFiScanResultsAlphabetically:");
}

id objc_msgSend__startInactivityTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startInactivityTimer");
}

id objc_msgSend__startLockButtonTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startLockButtonTimer");
}

id objc_msgSend__startNetworkScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startNetworkScan");
}

id objc_msgSend__startSystemStatusServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startSystemStatusServer");
}

id objc_msgSend__startWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startWiFiNetworkScan");
}

id objc_msgSend__startWifiScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startWifiScan");
}

id objc_msgSend__statusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_statusBarStyle:");
}

id objc_msgSend__stopInactivityTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopInactivityTimer");
}

id objc_msgSend__stopNetworkScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopNetworkScan");
}

id objc_msgSend__stopTimeItemTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopTimeItemTimer");
}

id objc_msgSend__stopWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopWiFiNetworkScan");
}

id objc_msgSend__stopWiFiTimeroutTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopWiFiTimeroutTimer");
}

id objc_msgSend__supportsSecureIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportsSecureIndicator");
}

id objc_msgSend__supportsStatusBarItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportsStatusBarItem");
}

id objc_msgSend__synchronizeDrawingWithFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronizeDrawingWithFence:");
}

id objc_msgSend__terminateApps_reason_reportCrash_description_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_terminateApps:reason:reportCrash:description:completion:");
}

id objc_msgSend__timeItemDateFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeItemDateFormatter");
}

id objc_msgSend__timeItemShortDateFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeItemShortDateFormatter");
}

id objc_msgSend__topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_topViewController");
}

id objc_msgSend__undimDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_undimDisplay");
}

id objc_msgSend__updateBatteryItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBatteryItems");
}

id objc_msgSend__updateDataNetworkItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDataNetworkItem");
}

id objc_msgSend__updateForAssociationChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForAssociationChange");
}

id objc_msgSend__updateIndicatorStyleForSensorActivityAttributions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateIndicatorStyleForSensorActivityAttributions:");
}

id objc_msgSend__updateIndicatorViewForSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateIndicatorViewForSensorType:");
}

id objc_msgSend__updateLevelForScene_transitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLevelForScene:transitionContext:");
}

id objc_msgSend__updateLockItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLockItem");
}

id objc_msgSend__updatePowerState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePowerState");
}

id objc_msgSend__updateRecordingIndicatorForStatusBarChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRecordingIndicatorForStatusBarChanges");
}

id objc_msgSend__updateReturnKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateReturnKey");
}

id objc_msgSend__updateSensorActivityItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSensorActivityItem");
}

id objc_msgSend__updateSignalStrength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSignalStrength");
}

id objc_msgSend__updateSignalStrengthFromRawRSSI_andScaledRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSignalStrengthFromRawRSSI:andScaledRSSI:");
}

id objc_msgSend__updateSystemApertureElementAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSystemApertureElementAssertion");
}

id objc_msgSend__updateTimeItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTimeItems");
}

id objc_msgSend__verifyAPTicketDigest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyAPTicketDigest:");
}

id objc_msgSend__welcomeImageForSymbol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_welcomeImageForSymbol:");
}

id objc_msgSend__wifiScanCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wifiScanCompleted:");
}

id objc_msgSend_accessoryIcons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryIcons");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithSettingsKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithSettingsKeyPath:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeAttributionData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAttributionData");
}

id objc_msgSend_activeCameraAndMicrophoneActivityAttributions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeCameraAndMicrophoneActivityAttributions");
}

id objc_msgSend_activeEntity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeEntity");
}

id objc_msgSend_activeKeyboard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeKeyboard");
}

id objc_msgSend_activeSensorActivityAttributions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeSensorActivityAttributions");
}

id objc_msgSend_activityAttribution(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityAttribution");
}

id objc_msgSend_activityDidChangeForSensorActivityDataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityDidChangeForSensorActivityDataProvider:");
}

id objc_msgSend_activityView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityView");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addBatteryDeviceObserver_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBatteryDeviceObserver:queue:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletion:");
}

id objc_msgSend_addContentSubView_heightConstraintForLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentSubView:heightConstraintForLayout:");
}

id objc_msgSend_addElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addElement:");
}

id objc_msgSend_addGestureRecognizer_toDisplayWithIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:toDisplayWithIdentity:");
}

id objc_msgSend_addInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInput:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_forHostname_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:forHostname:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOutput:");
}

id objc_msgSend_addScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScene:");
}

id objc_msgSend_addShutdownTask_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addShutdownTask:forReason:");
}

id objc_msgSend_addSpecifiersFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSpecifiersFromArray:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_affineTransform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "affineTransform");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertVisible");
}

id objc_msgSend_aliasDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aliasDict");
}

id objc_msgSend_allApplicationProcesses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allApplicationProcesses");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowWiFiSettingsAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowWiFiSettingsAction");
}

id objc_msgSend_animationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationController");
}

id objc_msgSend_animationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationController:");
}

id objc_msgSend_animationController_animatedStates_startAtFirstState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationController:animatedStates:startAtFirstState:");
}

id objc_msgSend_animationFence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationFence");
}

id objc_msgSend_animationView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationView");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_apTicket(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apTicket");
}

id objc_msgSend_appClientSettingsDiffInspector(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appClientSettingsDiffInspector");
}

id objc_msgSend_appendBodySectionWithName_multilinePrefix_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBodySectionWithName:multilinePrefix:block:");
}

id objc_msgSend_appendBool_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBool:withName:");
}

id objc_msgSend_appendHashingBlocks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendHashingBlocks:");
}

id objc_msgSend_appendInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendInteger:");
}

id objc_msgSend_appendInteger_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendInteger:counterpart:");
}

id objc_msgSend_appendObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:");
}

id objc_msgSend_appendObject_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:counterpart:");
}

id objc_msgSend_appendObject_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:withName:");
}

id objc_msgSend_applicationProcessesForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProcessesForBundleIdentifier:");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applyPostUISettingsFromNvramWithNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyPostUISettingsFromNvramWithNavigationController:");
}

id objc_msgSend_applyPreUISettingsFromNvram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyPreUISettingsFromNvram");
}

id objc_msgSend_applyThemeToNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyThemeToNavigationController:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assignProxyServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assignProxyServer:");
}

id objc_msgSend_associateToEncryptedNetworkWithName_password_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateToEncryptedNetworkWithName:password:");
}

id objc_msgSend_associateToEncryptedNetworkWithScanResult_password_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateToEncryptedNetworkWithScanResult:password:");
}

id objc_msgSend_associateToHiddenEncryptedNetworkWithName_password_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateToHiddenEncryptedNetworkWithName:password:");
}

id objc_msgSend_associateToHiddenUnencryptedNetworkWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateToHiddenUnencryptedNetworkWithName:");
}

id objc_msgSend_associateWithParameters_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateWithParameters:reply:");
}

id objc_msgSend_attemptsNetworkReconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptsNetworkReconnect");
}

id objc_msgSend_attentionAwarenessClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attentionAwarenessClient");
}

id objc_msgSend_attributedEntity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedEntity");
}

id objc_msgSend_audioRecordingActivityAttribution(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioRecordingActivityAttribution");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditToken");
}

id objc_msgSend_autoAdvanceToNextScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoAdvanceToNextScene");
}

id objc_msgSend_availableLocaleIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableLocaleIdentifiers");
}

id objc_msgSend_availableMetadataObjectTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableMetadataObjectTypes");
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "background");
}

id objc_msgSend_backgroundTunnel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTunnel");
}

id objc_msgSend_backgroundWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundWindow");
}

id objc_msgSend_baseLanguageIdentifierFromIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseLanguageIdentifierFromIdentifier:");
}

id objc_msgSend_baseSystemLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseSystemLanguages");
}

id objc_msgSend_basicConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "basicConfig");
}

id objc_msgSend_batteryDetailString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryDetailString");
}

id objc_msgSend_batteryDeviceController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryDeviceController");
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryLevel");
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryState");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldButton");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bootIntentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootIntentLocale");
}

id objc_msgSend_bootIntentManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootIntentManager");
}

id objc_msgSend_bootIntentSSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootIntentSSID");
}

id objc_msgSend_bootIntentWifiPassword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootIntentWifiPassword");
}

id objc_msgSend_bootIntentWifiSSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootIntentWifiSSID");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_broadcastingForSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastingForSetup");
}

id objc_msgSend_bs_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_map:");
}

id objc_msgSend_bs_safeObjectForKey_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_safeObjectForKey:ofType:");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "build");
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builder");
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builderWithObject:");
}

id objc_msgSend_builderWithObject_ofExpectedClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builderWithObject:ofExpectedClass:");
}

id objc_msgSend_builtinDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builtinDisplay");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundlePath");
}

id objc_msgSend_bundleUrlForPackageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleUrlForPackageName:");
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonTray");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cachedLinkDownStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedLinkDownStatus");
}

id objc_msgSend_cameraCaptureAttribution(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraCaptureAttribution");
}

id objc_msgSend_canAddInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAddInput:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelRequestsWithUUID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelRequestsWithUUID:error:");
}

id objc_msgSend_canonicalLocaleIdentifierFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalLocaleIdentifierFromString:");
}

id objc_msgSend_capturePreviewLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capturePreviewLayer");
}

id objc_msgSend_captureSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureSession");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "center");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_cgColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cgColor");
}

id objc_msgSend_changeDesiredAuthType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeDesiredAuthType:");
}

id objc_msgSend_characterLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterLimit");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkedInWiFiSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkedInWiFiSettings");
}

id objc_msgSend_checkoutAndReboot_userInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkoutAndReboot:userInitiated:");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clearNVRamVariable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNVRamVariable:");
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientInterface");
}

id objc_msgSend_clientProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientProcess");
}

id objc_msgSend_clientSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientSettings");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_coldTempToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coldTempToken");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commit");
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitConfiguration");
}

id objc_msgSend_componentsFromLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsFromLocaleIdentifier:");
}

id objc_msgSend_configurationWithAttentionLostTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithAttentionLostTimeout:");
}

id objc_msgSend_configureForRemoteSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureForRemoteSetup");
}

id objc_msgSend_connectToSSID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToSSID:completion:");
}

id objc_msgSend_connectToSSID_password_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToSSID:password:completion:");
}

id objc_msgSend_connectedNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedNetwork:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constant");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_containerFooterView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerFooterView");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerView");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_continueButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueButton");
}

id objc_msgSend_continueTapped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueTapped");
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyPathForPersonalizedData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyPathForPersonalizedData:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countryCode");
}

id objc_msgSend_createRepresentationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRepresentationWithIdentifier:");
}

id objc_msgSend_createSceneWithDefinition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSceneWithDefinition:");
}

id objc_msgSend_createSceneWithDefinition_initialParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSceneWithDefinition:initialParameters:");
}

id objc_msgSend_currentBatteryDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentBatteryDevice");
}

id objc_msgSend_currentBootIntentReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentBootIntentReason");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentLocaleCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocaleCode");
}

id objc_msgSend_currentLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocaleIdentifier:");
}

id objc_msgSend_currentNetwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentNetwork");
}

id objc_msgSend_currentNetworkSSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentNetworkSSID");
}

id objc_msgSend_currentOpenAppBundleIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentOpenAppBundleIDs");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentScanResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentScanResult");
}

id objc_msgSend_currentSecurityGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSecurityGroup");
}

id objc_msgSend_currentStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentStyle");
}

id objc_msgSend_currentlyActiveTextField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentlyActiveTextField");
}

id objc_msgSend_customBackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customBackButton");
}

id objc_msgSend_cwInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cwInterface");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataAccessAttributions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataAccessAttributions");
}

id objc_msgSend_dataAccessType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataAccessType");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_debugInfoVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugInfoVisible");
}

id objc_msgSend_debugInfoWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugInfoWindow");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultDeviceWithDeviceType_mediaType_position_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDeviceWithDeviceType:mediaType:position:");
}

id objc_msgSend_defaultFocusPredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultFocusPredicate");
}

id objc_msgSend_defaultScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultScale");
}

id objc_msgSend_defaultSystemPredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSystemPredicate");
}

id objc_msgSend_definition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "definition");
}

id objc_msgSend_delayBeforeFadeIn180(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayBeforeFadeIn180");
}

id objc_msgSend_delayBeforeFadeIn90(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayBeforeFadeIn90");
}

id objc_msgSend_delayBeforeFadeOut180(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayBeforeFadeOut180");
}

id objc_msgSend_delayBeforeFadeOut90(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayBeforeFadeOut90");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteBootIntentSourceData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteBootIntentSourceData");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionBuilderWithMultilinePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionBuilderWithMultilinePrefix:");
}

id objc_msgSend_descriptorWithEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorWithEventType:");
}

id objc_msgSend_descriptorWithPage_usage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorWithPage:usage:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_destroyScene_withTransitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyScene:withTransitionContext:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device");
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceClass");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devices");
}

id objc_msgSend_diagnosticsRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagnosticsRunning:");
}

id objc_msgSend_diagsLaunchDependenciesSemaphore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagsLaunchDependenciesSemaphore");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didLaunchApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didLaunchApp");
}

id objc_msgSend_didMoveToEndgame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToEndgame");
}

id objc_msgSend_didTappedLanguageSelectorButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didTappedLanguageSelectorButton");
}

id objc_msgSend_dimDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dimDisplay");
}

id objc_msgSend_disableBackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableBackButton");
}

id objc_msgSend_disableNetworkReconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableNetworkReconnect");
}

id objc_msgSend_disableS2R(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableS2R");
}

id objc_msgSend_disableTouchButtonEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableTouchButtonEvents");
}

id objc_msgSend_discoverySessionWithDeviceTypes_mediaType_position_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverySessionWithDeviceTypes:mediaType:position:");
}

id objc_msgSend_dismissThermalWarningWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissThermalWarningWithCompletion:");
}

id objc_msgSend_dismissViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissed");
}

id objc_msgSend_dispatchDiscreteEventsForReason_withRules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchDiscreteEventsForReason:withRules:");
}

id objc_msgSend_displayDimmed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayDimmed:");
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayIdentity");
}

id objc_msgSend_displayMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayMode");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_elapsedCPUTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedCPUTime");
}

id objc_msgSend_enableBackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableBackButton");
}

id objc_msgSend_enableContinueButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableContinueButton:");
}

id objc_msgSend_enableIdleSleep(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableIdleSleep");
}

id objc_msgSend_enableNetworkReconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableNetworkReconnect");
}

id objc_msgSend_enableTouchButtonEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableTouchButtonEvents");
}

id objc_msgSend_endRemoteSetupBroadcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endRemoteSetupBroadcast");
}

id objc_msgSend_enumerateScenesWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateScenesWithBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventMask");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventType");
}

id objc_msgSend_eventWithName_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithName:handler:");
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executablePath");
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute");
}

id objc_msgSend_exitAndRelaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitAndRelaunch:");
}

id objc_msgSend_exitRequestedWithServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitRequestedWithServer:");
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exportedInterface");
}

id objc_msgSend_fadeInDuration180(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fadeInDuration180");
}

id objc_msgSend_fadeInDuration90(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fadeInDuration90");
}

id objc_msgSend_fadeOutDuration180(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fadeOutDuration180");
}

id objc_msgSend_fadeOutDuration90(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fadeOutDuration90");
}

id objc_msgSend_fallbackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fallbackButton");
}

id objc_msgSend_fbsSceneWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fbsSceneWithIdentifier:");
}

id objc_msgSend_filterWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithName:");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_filteredWiFiScanResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredWiFiScanResults");
}

id objc_msgSend_finishedBoot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedBoot");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstResponder");
}

id objc_msgSend_forceUpdateStatusBarData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceUpdateStatusBarData");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_getCString_maxLength_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCString:maxLength:encoding:");
}

id objc_msgSend_guessedCountries(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guessedCountries");
}

id objc_msgSend_guessedLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guessedLanguages");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleSetupEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSetupEvent:");
}

id objc_msgSend_hasBeenShown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenShown");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerView");
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "height");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_heightConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightConstraint");
}

id objc_msgSend_hiddenLockView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hiddenLockView");
}

id objc_msgSend_hiddenNetworkWithNoPasswordGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hiddenNetworkWithNoPasswordGroup");
}

id objc_msgSend_hiddenNetworkWithPasswordGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hiddenNetworkWithPasswordGroup");
}

id objc_msgSend_hideBackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideBackButton");
}

id objc_msgSend_hideSceneStatusBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideSceneStatusBar");
}

id objc_msgSend_hideStatusBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideStatusBar");
}

id objc_msgSend_hidesBusyIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidesBusyIndicator");
}

id objc_msgSend_homeButtonPressedWithDisplayDim(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeButtonPressedWithDisplayDim");
}

id objc_msgSend_homeButtonType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeButtonType");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForAngelJobLabel:");
}

id objc_msgSend_identityForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForIdentifier:");
}

id objc_msgSend_identityForProcessIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForProcessIdentity:");
}

id objc_msgSend_idleTimerDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idleTimerDisabled");
}

id objc_msgSend_idleTimerDisabledReasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idleTimerDisabledReasons");
}

id objc_msgSend_imageByApplyingTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageByApplyingTransform:");
}

id objc_msgSend_imageForGraphicSymbolDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForGraphicSymbolDescriptor:");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:");
}

id objc_msgSend_inactivityTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inactivityTimer");
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_indexOfSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierID:");
}

id objc_msgSend_indexPathForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForIndex:");
}

id objc_msgSend_indexToSelect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexToSelect");
}

id objc_msgSend_indicatorContainerView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicatorContainerView");
}

id objc_msgSend_indicatorState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicatorState");
}

id objc_msgSend_indicatorType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicatorType");
}

id objc_msgSend_indicatorView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicatorView");
}

id objc_msgSend_infoButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoButton");
}

id objc_msgSend_initForLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForLocation:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithApplicationBundleID_executionContextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithApplicationBundleID:executionContextProvider:");
}

id objc_msgSend_initWithBackgroundTunnel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackgroundTunnel:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBootIntentSSID_passwordProtected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBootIntentSSID:passwordProtected:");
}

id objc_msgSend_initWithBundleID_backgrounded_native_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:backgrounded:native:");
}

id objc_msgSend_initWithCADisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCADisplay:");
}

id objc_msgSend_initWithCIImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCIImage:");
}

id objc_msgSend_initWithCalloutQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalloutQueue:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDataAccessAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataAccessAttribution:");
}

id objc_msgSend_initWithDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:error:");
}

id objc_msgSend_initWithDeviceInfoValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceInfoValues:");
}

id objc_msgSend_initWithDisplayConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayConfiguration:");
}

id objc_msgSend_initWithDisplayContext_deviceContext_persistedSceneIdentifiers_supportAppSceneRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:");
}

id objc_msgSend_initWithDuration_curve_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:curve:animations:");
}

id objc_msgSend_initWithDuration_dampingRatio_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:dampingRatio:animations:");
}

id objc_msgSend_initWithFireDate_serviceIdentifier_target_selector_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFireDate:serviceIdentifier:target:selector:userInfo:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_showForegroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:showForegroundView:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHeight:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithMainNavController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMainNavController:");
}

id objc_msgSend_initWithPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPassword:");
}

id objc_msgSend_initWithPriority_displayConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPriority:displayConfiguration:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRect:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithScanCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScanCompletion:");
}

id objc_msgSend_initWithScanResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScanResult:");
}

id objc_msgSend_initWithScanResult_prepopulatedPassword_prepopulatedSSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScanResult:prepopulatedPassword:prepopulatedSSID:");
}

id objc_msgSend_initWithServerHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServerHandle:");
}

id objc_msgSend_initWithSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:");
}

id objc_msgSend_initWithSetupPresentationTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSetupPresentationTheme:");
}

id objc_msgSend_initWithSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSourceView:");
}

id objc_msgSend_initWithStateName_darkStateName_transitionDuration_transitionSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStateName:darkStateName:transitionDuration:transitionSpeed:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithSymbolName_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSymbolName:bundleURL:");
}

id objc_msgSend_initWithSystemColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSystemColor:");
}

id objc_msgSend_initWithSystemStatusServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSystemStatusServer:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTitle_detailText_icon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:detailText:icon:");
}

id objc_msgSend_initWithTitle_detailText_icon_remoteSetupManager_captureSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:detailText:icon:remoteSetupManager:captureSession:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithTop_left_bottom_right_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTop:left:bottom:right:");
}

id objc_msgSend_initWithUrlToPackage_animationView_animatedStates_startAtFirstState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUrlToPackage:animationView:animatedStates:startAtFirstState:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_initWithWindowScene_debugName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:debugName:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_inspectDiff_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inspectDiff:withContext:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAllTimelinesForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAllTimelinesForReason:");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_isApplicationProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplicationProcess");
}

id objc_msgSend_isAssociatedToNetwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAssociatedToNetwork");
}

id objc_msgSend_isBootIntentRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBootIntentRecord");
}

id objc_msgSend_isCharging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCharging");
}

id objc_msgSend_isCurrentProcessFirstToReadIntent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentProcessFirstToReadIntent");
}

id objc_msgSend_isDisplayDim(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDisplayDim");
}

id objc_msgSend_isEAP(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEAP");
}

id objc_msgSend_isEntitledForTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEntitledForTag:");
}

id objc_msgSend_isEqual(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEqualToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToValue:");
}

id objc_msgSend_isEquivalentRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEquivalentRecord:");
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForeground");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isInHardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInHardwareKeyboardMode");
}

id objc_msgSend_isInSunlight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInSunlight");
}

id objc_msgSend_isIndicatorVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIndicatorVisible");
}

id objc_msgSend_isIndicatorVisibleAtStatusBarLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIndicatorVisibleAtStatusBarLocation");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternal");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isMinimized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMinimized");
}

id objc_msgSend_isMovingToParentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMovingToParentViewController");
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNetworkReachable");
}

id objc_msgSend_isPersonalHotspot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPersonalHotspot");
}

id objc_msgSend_isPresentedForSetupFlow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPresentedForSetupFlow");
}

id objc_msgSend_isRecent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecent");
}

id objc_msgSend_isRunningOnPhysicalHardware(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningOnPhysicalHardware");
}

id objc_msgSend_isSecure(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSecure");
}

id objc_msgSend_isSystemApplicationProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSystemApplicationProcess");
}

id objc_msgSend_isSystemService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSystemService");
}

id objc_msgSend_isThermalBlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isThermalBlocked");
}

id objc_msgSend_isUISubclass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUISubclass");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_isWAPI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWAPI");
}

id objc_msgSend_isWEP(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWEP");
}

id objc_msgSend_isWPA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWPA");
}

id objc_msgSend_isWPA2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWPA2");
}

id objc_msgSend_isWPA3(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWPA3");
}

id objc_msgSend_isWiFiPoweredOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWiFiPoweredOn");
}

id objc_msgSend_joinTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinTapped:");
}

id objc_msgSend_joinTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinTimer");
}

id objc_msgSend_joining(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joining");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_keyboardFocusTarget(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardFocusTarget");
}

id objc_msgSend_keyboardScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardScene");
}

id objc_msgSend_killForReason_andReport_withDescription_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "killForReason:andReport:withDescription:completion:");
}

id objc_msgSend_languageButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageButton");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageCode");
}

id objc_msgSend_languageCodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageCodes");
}

id objc_msgSend_languageComposite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageComposite");
}

id objc_msgSend_languageIdentifierFromIdentifier_withRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageIdentifierFromIdentifier:withRegion:");
}

id objc_msgSend_languageStrings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageStrings");
}

id objc_msgSend_languageTableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageTableView");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBaselineAnchor");
}

id objc_msgSend_lastGoodNetwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastGoodNetwork");
}

id objc_msgSend_lastLockState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastLockState");
}

id objc_msgSend_lastLockStateSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastLockStateSet");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launch");
}

id objc_msgSend_launchAdvisorWithOmniscientDelegate_sceneDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAdvisorWithOmniscientDelegate:sceneDelegate:");
}

id objc_msgSend_launchAppWithBundleID_suspended_native_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAppWithBundleID:suspended:native:completion:");
}

id objc_msgSend_launchDiagnostics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchDiagnostics");
}

id objc_msgSend_launchDiagnosticsApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchDiagnosticsApp");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layers");
}

id objc_msgSend_layoutElementInvalidator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutElementInvalidator");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftBarButtonItem");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "level");
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightGrayColor");
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkButton");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listener");
}

id objc_msgSend_localIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localIdentity");
}

id objc_msgSend_localServiceClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localServiceClient");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCaseInsensitiveCompare:");
}

id objc_msgSend_localizedDisplayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDisplayName");
}

id objc_msgSend_localizedExecutableDisplayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedExecutableDisplayName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForLanguage_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForLanguage:context:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_locationAttribution(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationAttribution");
}

id objc_msgSend_lockButtonLongPressed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockButtonLongPressed");
}

id objc_msgSend_lockButtonPressedWithDisplayDim(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockButtonPressedWithDisplayDim");
}

id objc_msgSend_lockButtonTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockButtonTimer");
}

id objc_msgSend_lockView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockView");
}

id objc_msgSend_loseFocus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loseFocus");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainConfiguration");
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainDisplay");
}

id objc_msgSend_mainNavController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainNavController");
}

id objc_msgSend_mainNavigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainNavigationController");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyWindow");
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_moduleWithTitle_contents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moduleWithTitle:contents:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nativeScale");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_networkConnectionInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkConnectionInProgress");
}

id objc_msgSend_networkListViewController_didTapRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkListViewController:didTapRecord:");
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkName");
}

id objc_msgSend_networkNameCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkNameCell");
}

id objc_msgSend_networkPassword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkPassword");
}

id objc_msgSend_networkReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkReachable");
}

id objc_msgSend_networkReconnectEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkReconnectEnabled:");
}

id objc_msgSend_networkRequiresPassword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkRequiresPassword");
}

id objc_msgSend_networkScaledRSSIStrength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkScaledRSSIStrength");
}

id objc_msgSend_networkScanSemaphore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkScanSemaphore");
}

id objc_msgSend_networkScanWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkScanWithCompletion:");
}

id objc_msgSend_networkStateChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkStateChanged");
}

id objc_msgSend_networkViewControllerVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkViewControllerVisible");
}

id objc_msgSend_newPowerDownViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newPowerDownViewController");
}

id objc_msgSend_newSceneIdentityTokenForIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newSceneIdentityTokenForIdentity:");
}

id objc_msgSend_notificationFeedbackGenerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationFeedbackGenerator");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_nullDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nullDisplay");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_observeDataWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeDataWithBlock:");
}

id objc_msgSend_observeIdleTimerDisabledWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeIdleTimerDisabledWithBlock:");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observers");
}

id objc_msgSend_onExit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onExit");
}

id objc_msgSend_onLaunch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onLaunch");
}

id objc_msgSend_openApps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApps");
}

id objc_msgSend_openingViewControllerForBootIntent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openingViewControllerForBootIntent");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSet");
}

id objc_msgSend_otherNetworkViewActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "otherNetworkViewActive");
}

id objc_msgSend_otherNetworkWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "otherNetworkWindow");
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputImage");
}

id objc_msgSend_overridePin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overridePin");
}

id objc_msgSend_pairingCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairingCode");
}

id objc_msgSend_parametersForSpecification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parametersForSpecification:");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "password");
}

id objc_msgSend_passwordCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passwordCell");
}

id objc_msgSend_passwordType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passwordType");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pendingLastGoodNetwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingLastGoodNetwork");
}

id objc_msgSend_percentCharge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "percentCharge");
}

id objc_msgSend_performScanWithParameters_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performScanWithParameters:reply:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performSelector_withObject_afterDelay_inModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:inModes:");
}

id objc_msgSend_performUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUpdate:");
}

id objc_msgSend_pinCodeLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinCodeLabel");
}

id objc_msgSend_ping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ping:");
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plainButtonConfiguration");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointSize");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_possibleValues_titles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "possibleValues:titles:");
}

id objc_msgSend_postEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postEvent:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postStatusBarData_withActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postStatusBarData:withActions:");
}

id objc_msgSend_powerDownResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerDownResponse");
}

id objc_msgSend_powerDownVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerDownVisible");
}

id objc_msgSend_powerDownWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerDownWindow");
}

id objc_msgSend_powerOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerOn");
}

id objc_msgSend_powerSourceState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerSourceState");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredLanguagesForRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLanguagesForRegion:");
}

id objc_msgSend_preferredLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLevel");
}

id objc_msgSend_preferredPasswordType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredPasswordType");
}

id objc_msgSend_preferredSceneHostIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredSceneHostIdentifier");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:completion:");
}

id objc_msgSend_presentViewController_onLayer_backgroundTunnel_statusBarVisible_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:");
}

id objc_msgSend_presentedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedView");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_previewView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previewView");
}

id objc_msgSend_privacyIndicatorType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyIndicatorType");
}

id objc_msgSend_privateConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateConfiguration");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_proxyServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyServer");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_qrCodeView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "qrCodeView");
}

id objc_msgSend_queueWithDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueWithDispatchQueue:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_reachabilityFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reachabilityFlags");
}

id objc_msgSend_readNVRamVariable_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readNVRamVariable:value:");
}

id objc_msgSend_recentAttributionData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentAttributionData");
}

id objc_msgSend_recentSensorActivityAttributions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentSensorActivityAttributions");
}

id objc_msgSend_reconnectTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconnectTimer");
}

id objc_msgSend_reconnecting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconnecting");
}

id objc_msgSend_recordingIndicatorManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordingIndicatorManager");
}

id objc_msgSend_recordingIndicatorViewController_didUpdateIndicatorState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordingIndicatorViewController:didUpdateIndicatorState:");
}

id objc_msgSend_reevaluateNetworkList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reevaluateNetworkList");
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refresh");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerSensorActivityIndicator_forScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSensorActivityIndicator:forScreen:");
}

id objc_msgSend_relaunchToDiagnosticsApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relaunchToDiagnosticsApp");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadNetworkList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadNetworkList");
}

id objc_msgSend_remoteAlertsDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteAlertsDelegate");
}

id objc_msgSend_remoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteContextWithOptions:");
}

id objc_msgSend_remoteLocaleCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteLocaleCode");
}

id objc_msgSend_remoteSetupAuthController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSetupAuthController");
}

id objc_msgSend_remoteSetupConfiguringController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSetupConfiguringController");
}

id objc_msgSend_remoteSetupManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSetupManager");
}

id objc_msgSend_remoteSetupQRCodeScanner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSetupQRCodeScanner");
}

id objc_msgSend_remoteSetupQRCodeScannerController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSetupQRCodeScannerController");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeBatteryDeviceObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeBatteryDeviceObserver:");
}

id objc_msgSend_removeContiguousSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forHostname_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forHostname:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeShutdownTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeShutdownTask:");
}

id objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectsInRange:withObjectsFromArray:");
}

id objc_msgSend_requestParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestParameters");
}

id objc_msgSend_requiresPassword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresPassword");
}

id objc_msgSend_resetIdleTimerAndUndim_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetIdleTimerAndUndim:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_restartRemoteSetupBroadcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restartRemoteSetupBroadcast");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeWithError:");
}

id objc_msgSend_retryJoinAttemptCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryJoinAttemptCount");
}

id objc_msgSend_returnKeyType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "returnKeyType");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rightBarButtonItem");
}

id objc_msgSend_rootSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootSettings");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_rootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController:");
}

id objc_msgSend_rootWindowRecordingIndicatorManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootWindowRecordingIndicatorManager");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "row");
}

id objc_msgSend_rowWithTitle_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:action:");
}

id objc_msgSend_rowWithTitle_valueKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:valueKeyPath:");
}

id objc_msgSend_rssiBarImages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rssiBarImages");
}

id objc_msgSend_rssiBarsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rssiBarsView");
}

id objc_msgSend_ruleForDispatchingDiscreteEventsMatchingPredicate_toTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:");
}

id objc_msgSend_sampling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sampling");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scanCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanCompleted");
}

id objc_msgSend_scanCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanCompletion");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scanParametersWithSSID_isHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanParametersWithSSID:isHidden:");
}

id objc_msgSend_scanRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanRecord");
}

id objc_msgSend_scanResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanResult");
}

id objc_msgSend_scanTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanTimer");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scanning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanning");
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene");
}

id objc_msgSend_sceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneIdentifier:");
}

id objc_msgSend_sceneTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneTransaction");
}

id objc_msgSend_sceneWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneWithIdentifier:");
}

id objc_msgSend_scheduleInRunLoop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleInRunLoop:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screen");
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondarySystemBackgroundColor");
}

id objc_msgSend_sectionWithRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWithRows:");
}

id objc_msgSend_sectionWithRows_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWithRows:title:");
}

id objc_msgSend_selectLanguage_restartAfterCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectLanguage:restartAfterCompletion:");
}

id objc_msgSend_sendAuthPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAuthPassword:");
}

id objc_msgSend_sensor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensor");
}

id objc_msgSend_sensorActivityDataProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensorActivityDataProvider");
}

id objc_msgSend_sensorType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensorType");
}

id objc_msgSend_sentinelWithQueue_signalCount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sentinelWithQueue:signalCount:completion:");
}

id objc_msgSend_server_createAlert_timeout_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "server:createAlert:timeout:completion:");
}

id objc_msgSend_server_receiveResponseFromAlertWithIdentifier_timeout_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "server:receiveResponseFromAlertWithIdentifier:timeout:completion:");
}

id objc_msgSend_serverInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverInterface");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActiveSensorActivityAttributions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveSensorActivityAttributions:");
}

id objc_msgSend_setActivityView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityView:");
}

id objc_msgSend_setAdditionalSafeAreaInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalSafeAreaInsets:");
}

id objc_msgSend_setAdditionalScaleForAnimation_headerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalScaleForAnimation:headerView:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAlertVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertVisible:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllowWiFiSettingsAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowWiFiSettingsAction:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnimationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationController:");
}

id objc_msgSend_setAppClientSettingsDiffInspector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppClientSettingsDiffInspector:");
}

id objc_msgSend_setArtworkSubtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkSubtype:");
}

id objc_msgSend_setAttemptsNetworkReconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttemptsNetworkReconnect:");
}

id objc_msgSend_setAttentionLostTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttentionLostTimeout:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundImage_forBarMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forBarMetrics:");
}

id objc_msgSend_setBackgroundTunnel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTunnel:");
}

id objc_msgSend_setBatteryDetailString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryDetailString:");
}

id objc_msgSend_setBatteryDeviceController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryDeviceController:");
}

id objc_msgSend_setBatteryMonitoringEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryMonitoringEnabled:");
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBeginTime:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setBroadcastingForSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBroadcastingForSetup:");
}

id objc_msgSend_setButtonTray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonTray:");
}

id objc_msgSend_setByAddingEmergencyCallAppToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingEmergencyCallAppToSet:");
}

id objc_msgSend_setCaptionText_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptionText:style:");
}

id objc_msgSend_setCapturePreviewLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCapturePreviewLayer:");
}

id objc_msgSend_setCellAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellAction:");
}

id objc_msgSend_setCellTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellTarget:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setCharacterLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCharacterLimit:");
}

id objc_msgSend_setCheckedInWiFiSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCheckedInWiFiSettings:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentity:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setConfiguration_shouldReset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:shouldReset:");
}

id objc_msgSend_setConfiguration_shouldReset_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:shouldReset:error:");
}

id objc_msgSend_setContainerFooterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerFooterView:");
}

id objc_msgSend_setContainerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerView:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsets:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContinueButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinueButton:");
}

id objc_msgSend_setContinueButtonAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinueButtonAvailable");
}

id objc_msgSend_setContinueButtonBusy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinueButtonBusy");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentBatteryDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentBatteryDevice:");
}

id objc_msgSend_setCurrentNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentNetwork:");
}

id objc_msgSend_setCurrentNetworkState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentNetworkState:");
}

id objc_msgSend_setCurrentSecurityGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSecurityGroup:");
}

id objc_msgSend_setCurrentlyActiveTextField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlyActiveTextField:");
}

id objc_msgSend_setCustomBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomBackButton:");
}

id objc_msgSend_setCwInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCwInterface:");
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDamping:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDebugInfoVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugInfoVisible:");
}

id objc_msgSend_setDebugInfoWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugInfoWindow:");
}

id objc_msgSend_setDefaultSceneToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultSceneToken:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptors:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDeviceInfoValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceInfoValue:forKey:");
}

id objc_msgSend_setDeviceOrientationEventsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceOrientationEventsEnabled:");
}

id objc_msgSend_setDiagsLaunchDependenciesSemaphore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiagsLaunchDependenciesSemaphore:");
}

id objc_msgSend_setDidMoveToEndgame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidMoveToEndgame:");
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectionalLayoutMargins:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDismissed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissed:");
}

id objc_msgSend_setDisplayConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayConfiguration:");
}

id objc_msgSend_setDisplayDim_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayDim:");
}

id objc_msgSend_setDisplayEdgeInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayEdgeInfo:");
}

id objc_msgSend_setDisplays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplays:");
}

id objc_msgSend_setDistribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistribution:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnclosureColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnclosureColors:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setEventHandlerWithQueue_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventHandlerWithQueue:block:");
}

id objc_msgSend_setEventMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventMask:");
}

id objc_msgSend_setExclusionArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExclusionArea:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFallbackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackButton:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFilteredWiFiScanResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteredWiFiScanResults:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFinishedBoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinishedBoot:");
}

id objc_msgSend_setFirstGuessedLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstGuessedLanguages:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForeground:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setGuessedCountries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuessedCountries:");
}

id objc_msgSend_setHasBeenShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenShown:");
}

id objc_msgSend_setHeightConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeightConstraint:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHiddenNetworkWithNoPasswordGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHiddenNetworkWithNoPasswordGroup:");
}

id objc_msgSend_setHiddenNetworkWithPasswordGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHiddenNetworkWithPasswordGroup:");
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesBackButton:");
}

id objc_msgSend_setHomeAffordanceOverlayAllowance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeAffordanceOverlayAllowance:");
}

id objc_msgSend_setHomeButtonPressedWithDisplayDim_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeButtonPressedWithDisplayDim:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentity:");
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdleTimerDisabled:forReason:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInSunlight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInSunlight:");
}

id objc_msgSend_setInactivityTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInactivityTimer:");
}

id objc_msgSend_setIncludeHiddenNetworks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeHiddenNetworks:");
}

id objc_msgSend_setIncludeProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeProperties:");
}

id objc_msgSend_setIndexToSelect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexToSelect:");
}

id objc_msgSend_setIndicatorColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorColor:");
}

id objc_msgSend_setIndicatorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorType:");
}

id objc_msgSend_setIndicatorVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorVisible:");
}

id objc_msgSend_setInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceOrientation:");
}

id objc_msgSend_setInterfaceOrientationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceOrientationMode:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsHidden:");
}

id objc_msgSend_setJoinTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoinTimer:");
}

id objc_msgSend_setJoining_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJoining:");
}

id objc_msgSend_setLanguageButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageButton:");
}

id objc_msgSend_setLanguageCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageCodes:");
}

id objc_msgSend_setLanguageComposite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageComposite:");
}

id objc_msgSend_setLanguageStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageStrings:");
}

id objc_msgSend_setLanguageToPreferredLanguages_fallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageToPreferredLanguages:fallback:");
}

id objc_msgSend_setLastGoodNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastGoodNetwork:");
}

id objc_msgSend_setLastLockState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastLockState:");
}

id objc_msgSend_setLastLockStateSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastLockStateSet:");
}

id objc_msgSend_setLaunchIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchIntent:");
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayer:");
}

id objc_msgSend_setLayoutElementInvalidator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutElementInvalidator:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevel:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setListDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListDelegate:");
}

id objc_msgSend_setLocalServiceClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalServiceClient:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocaleAfterLanguageChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocaleAfterLanguageChange:");
}

id objc_msgSend_setLocaleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocaleIdentifier:completion:");
}

id objc_msgSend_setLockButtonLongPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockButtonLongPressed:");
}

id objc_msgSend_setLockButtonPressedWithDisplayDim_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockButtonPressedWithDisplayDim:");
}

id objc_msgSend_setLockButtonTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockButtonTimer:");
}

id objc_msgSend_setMainNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainNavigationController:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMass:");
}

id objc_msgSend_setMatchesAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchesAlpha:");
}

id objc_msgSend_setMergeScanResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMergeScanResults:");
}

id objc_msgSend_setMetadataObjectTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataObjectTypes:");
}

id objc_msgSend_setMetadataObjectsDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataObjectsDelegate:queue:");
}

id objc_msgSend_setMinimized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimized:");
}

id objc_msgSend_setMinimumEarlyFireProportion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumEarlyFireProportion:");
}

id objc_msgSend_setMinimumHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumHeight:");
}

id objc_msgSend_setMinimumRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumRSSI:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNetworkConnectionInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkConnectionInProgress:");
}

id objc_msgSend_setNetworkNameCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkNameCell:");
}

id objc_msgSend_setNetworkReachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkReachable:");
}

id objc_msgSend_setNetworkReconnectEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkReconnectEnabled:");
}

id objc_msgSend_setNetworkRequiresPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkRequiresPassword:");
}

id objc_msgSend_setNetworkStateChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkStateChanged:");
}

id objc_msgSend_setNetworkViewControllerVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkViewControllerVisible:");
}

id objc_msgSend_setNetworks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworks:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOldClientSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOldClientSettings:");
}

id objc_msgSend_setOnExit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnExit:");
}

id objc_msgSend_setOnLaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnLaunch:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOtherNetworkWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherNetworkWindow:");
}

id objc_msgSend_setOverrideAuthPin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideAuthPin:");
}

id objc_msgSend_setOverridePin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverridePin:");
}

id objc_msgSend_setPairingCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairingCode:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPasswordCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPasswordCell:");
}

id objc_msgSend_setPasswordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPasswordType:");
}

id objc_msgSend_setPendingLastGoodNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingLastGoodNetwork:");
}

id objc_msgSend_setPeripheryInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeripheryInsets:");
}

id objc_msgSend_setPinCodeLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinCodeLabel:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPower_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPower:error:");
}

id objc_msgSend_setPowerDownDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerDownDelegate:");
}

id objc_msgSend_setPowerDownResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerDownResponse:");
}

id objc_msgSend_setPowerDownVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerDownVisible:");
}

id objc_msgSend_setPowerDownWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerDownWindow:");
}

id objc_msgSend_setPowered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowered:");
}

id objc_msgSend_setPreferencesValue_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferencesValue:key:domain:");
}

id objc_msgSend_setPreferredPasswordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredPasswordType:");
}

id objc_msgSend_setPresentViewControllerWithStatusBarShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentViewControllerWithStatusBarShown:");
}

id objc_msgSend_setPresentedView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentedView:");
}

id objc_msgSend_setPreventIdleSleep_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventIdleSleep:forReason:");
}

id objc_msgSend_setPreviewView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviewView:");
}

id objc_msgSend_setPreviousScanFilteredWiFiScanResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousScanFilteredWiFiScanResults:");
}

id objc_msgSend_setPrivacyIndicatorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyIndicatorType:");
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrompt:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setProxyServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyServer:");
}

id objc_msgSend_setQrCodeView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQrCodeView:");
}

id objc_msgSend_setRebootType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRebootType:");
}

id objc_msgSend_setRecentSensorActivityAttributions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecentSensorActivityAttributions:");
}

id objc_msgSend_setReconnectTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReconnectTimer:");
}

id objc_msgSend_setReconnecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReconnecting:");
}

id objc_msgSend_setRecordingIndicatorManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordingIndicatorManager:");
}

id objc_msgSend_setReferenceFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferenceFrame:");
}

id objc_msgSend_setRegisterAdditionalServicesBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisterAdditionalServicesBlock:");
}

id objc_msgSend_setRememberUponSuccessfulAssociation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRememberUponSuccessfulAssociation:");
}

id objc_msgSend_setRemoteLocaleCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteLocaleCode:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteSetupAuthController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteSetupAuthController:");
}

id objc_msgSend_setRemoteSetupConfiguringController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteSetupConfiguringController:");
}

id objc_msgSend_setRemoteSetupManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteSetupManager:");
}

id objc_msgSend_setRemoteSetupQRCodeScanner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteSetupQRCodeScanner:");
}

id objc_msgSend_setRemoteSetupQRCodeScannerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteSetupQRCodeScannerController:");
}

id objc_msgSend_setRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderingMode:");
}

id objc_msgSend_setRequiresPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPassword:");
}

id objc_msgSend_setRetryJoinAttemptCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryJoinAttemptCount:");
}

id objc_msgSend_setReturnKeyEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyEnabled:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSSID:");
}

id objc_msgSend_setSafeAreaInsetsPortrait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSafeAreaInsetsPortrait:");
}

id objc_msgSend_setSampling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSampling:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setScanCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanCompleted:");
}

id objc_msgSend_setScanResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanResult:");
}

id objc_msgSend_setScanTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanTimer:");
}

id objc_msgSend_setScanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanning:");
}

id objc_msgSend_setScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScene:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSecure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecure:");
}

id objc_msgSend_setSenderDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderDescriptors:");
}

id objc_msgSend_setSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSensorType:");
}

id objc_msgSend_setSessionPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionPreset:");
}

id objc_msgSend_setSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettings:");
}

id objc_msgSend_setSetupAssistantHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupAssistantHeaderView:");
}

id objc_msgSend_setSetupServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupServer:");
}

id objc_msgSend_setSetupState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupState:");
}

id objc_msgSend_setShouldWaitForMigrator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldWaitForMigrator:");
}

id objc_msgSend_setShowLockIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowLockIcon:");
}

id objc_msgSend_setShowNetworkSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowNetworkSettings:");
}

id objc_msgSend_setShowOtherNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowOtherNetwork:");
}

id objc_msgSend_setShowingDeviceInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowingDeviceInformation:");
}

id objc_msgSend_setShutdownTasksPendingSemaphore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShutdownTasksPendingSemaphore:");
}

id objc_msgSend_setSignalStrengthBars_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignalStrengthBars:");
}

id objc_msgSend_setSignalStrengthRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignalStrengthRSSI:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpecification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecification:");
}

id objc_msgSend_setStandardScaleForAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStandardScaleForAnimation");
}

id objc_msgSend_setStatusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusBarStyle:");
}

id objc_msgSend_setStatusBarView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusBarView:");
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStiffness:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSupportsCellularActivation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsCellularActivation:");
}

id objc_msgSend_setSymbolColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSymbolColors:");
}

id objc_msgSend_setSystem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystem:");
}

id objc_msgSend_setSystemMinimumMargin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemMinimumMargin:");
}

id objc_msgSend_setSystemServicesDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemServicesDelegate:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableView:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTargetNetworkForBootIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetNetworkForBootIntent:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setThermalWarningVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThermalWarningVisible:");
}

id objc_msgSend_setThermalWarningWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThermalWarningWindow:");
}

id objc_msgSend_setTimeItemShortTimeString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeItemShortTimeString:");
}

id objc_msgSend_setTimeItemTimeString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeItemTimeString:");
}

id objc_msgSend_setTimeItemTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeItemTimer:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleHyphenationFactor:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTouchSensitiveButtonEnabledAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchSensitiveButtonEnabledAssertion:");
}

id objc_msgSend_setTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransition:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUpdatedClientSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedClientSettings:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInterfaceStyle:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKeyPath:");
}

id objc_msgSend_setVideoGravity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoGravity:");
}

id objc_msgSend_setWiFiPickerVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiPickerVisible:");
}

id objc_msgSend_setWiFiPickerWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiFiPickerWindow:");
}

id objc_msgSend_setWifiJoinAttemptCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiJoinAttemptCount:");
}

id objc_msgSend_setWifiManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiManager:");
}

id objc_msgSend_setWifiPasswordFromNvram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiPasswordFromNvram:");
}

id objc_msgSend_setWifiPowerStateOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiPowerStateOn:");
}

id objc_msgSend_setWifiPoweredOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiPoweredOn:");
}

id objc_msgSend_setWifiReconnectTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiReconnectTimer:");
}

id objc_msgSend_setWifiRequiresPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiRequiresPassword:");
}

id objc_msgSend_setWifiSSIDFromNvram_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiSSIDFromNvram:");
}

id objc_msgSend_setWifiTimeoutTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiTimeoutTimer:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setWindowLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowLevel:");
}

id objc_msgSend_setWindowManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowManager:");
}

id objc_msgSend_setWindowManagerLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowManagerLayer:");
}

id objc_msgSend_setWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowScene:");
}

id objc_msgSend_setWirelessScanStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWirelessScanStartDate:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settings");
}

id objc_msgSend_setupAssistantHeaderView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupAssistantHeaderView");
}

id objc_msgSend_setupFailed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupFailed");
}

id objc_msgSend_setupHeaderView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupHeaderView");
}

id objc_msgSend_setupInfoButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupInfoButton");
}

id objc_msgSend_setupQRCodeScanner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupQRCodeScanner");
}

id objc_msgSend_setupServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupServer");
}

id objc_msgSend_setupState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupState");
}

id objc_msgSend_setupTableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupTableView");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupView");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDataAccessor");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLocationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedLocationController");
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedNetworkObserver");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sharedStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedStyle");
}

id objc_msgSend_shouldShowInfoPane(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowInfoPane");
}

id objc_msgSend_showBackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showBackButton");
}

id objc_msgSend_showDebugInfoWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDebugInfoWithCompletion:");
}

id objc_msgSend_showDiagnostics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDiagnostics");
}

id objc_msgSend_showExitConfirmationWithCompletion_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showExitConfirmationWithCompletion:response:");
}

id objc_msgSend_showLockIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showLockIcon");
}

id objc_msgSend_showMenuSheetWithOptions_completion_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showMenuSheetWithOptions:completion:response:");
}

id objc_msgSend_showPowerDownWithCompletion_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showPowerDownWithCompletion:response:");
}

id objc_msgSend_showSceneStatusBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSceneStatusBar");
}

id objc_msgSend_showStatusBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showStatusBar");
}

id objc_msgSend_showThermalWarningWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showThermalWarningWithCompletion:");
}

id objc_msgSend_showWiFiPickerWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showWiFiPickerWithCompletion:");
}

id objc_msgSend_showsBusyIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsBusyIndicator");
}

id objc_msgSend_shutdownTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shutdownTasks");
}

id objc_msgSend_shutdownTasksPendingSemaphore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shutdownTasksPendingSemaphore");
}

id objc_msgSend_shutdownWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shutdownWithOptions:");
}

id objc_msgSend_shutdownWithOptions_forSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shutdownWithOptions:forSource:");
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signal");
}

id objc_msgSend_signalStrengthBars(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalStrengthBars");
}

id objc_msgSend_signalStrengthRSSI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalStrengthRSSI");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_sortWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortWithOptions:usingComparator:");
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specification");
}

id objc_msgSend_ssid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ssid");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimation");
}

id objc_msgSend_startAnimationAfterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimationAfterDelay:");
}

id objc_msgSend_startListeningForThermalEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startListeningForThermalEvents");
}

id objc_msgSend_startMonitoringEventType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoringEventType:error:");
}

id objc_msgSend_startRemoteSetupBroadcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRemoteSetupBroadcast");
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRunning");
}

id objc_msgSend_startScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startScan");
}

id objc_msgSend_startWiFiNetworkScanRequestFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWiFiNetworkScanRequestFrom:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_statusBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBar");
}

id objc_msgSend_statusBarFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarFrame");
}

id objc_msgSend_statusBarManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarManager");
}

id objc_msgSend_statusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarStyle:");
}

id objc_msgSend_statusBarView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarView");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stopAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAnimation:");
}

id objc_msgSend_stopMonitoringAllEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringAllEvents");
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRunning");
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopScan");
}

id objc_msgSend_stopWiFiNetworkScanRequestFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWiFiNetworkScanRequestFrom:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_succinctDescriptionBuilder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "succinctDescriptionBuilder");
}

id objc_msgSend_sunlightStateToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sunlightStateToken");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_supportedEAPTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedEAPTypes");
}

id objc_msgSend_suspendWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendWithError:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "system");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemName");
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemOrangeColor");
}

id objc_msgSend_systemServicesDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemServicesDelegate");
}

id objc_msgSend_systemTarget(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemTarget");
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemVersion");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView");
}

id objc_msgSend_tapToWakeGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapToWakeGestureRecognizer");
}

id objc_msgSend_tapToWakeSupported(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapToWakeSupported");
}

id objc_msgSend_targetForDeferringEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetForDeferringEnvironment:");
}

id objc_msgSend_targetNetworkForBootIntent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetNetworkForBootIntent");
}

id objc_msgSend_terminateAppWithBundleID_reason_reportCrash_description_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminateAppWithBundleID:reason:reportCrash:description:completion:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textField");
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textInputTraits");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textLabel");
}

id objc_msgSend_thermalWarningVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thermalWarningVisible");
}

id objc_msgSend_thermalWarningWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thermalWarningWindow");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeItemShortTimeString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeItemShortTimeString");
}

id objc_msgSend_timeItemTimeString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeItemTimeString");
}

id objc_msgSend_timeItemTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeItemTimer");
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topViewController");
}

id objc_msgSend_touchSensitiveButtonEnabledAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchSensitiveButtonEnabledAssertion");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_ui_cameraCaptureButtonEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ui_cameraCaptureButtonEnvironment");
}

id objc_msgSend_unConfigureForRemoteSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unConfigureForRemoteSetup");
}

id objc_msgSend_undimDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undimDisplay");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_updateClientSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClientSettingsWithBlock:");
}

id objc_msgSend_updateIndicatorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIndicatorType:");
}

id objc_msgSend_updateIndicatorVisibilityWithFastFadeAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIndicatorVisibilityWithFastFadeAnimation:");
}

id objc_msgSend_updateLanguageComposite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLanguageComposite");
}

id objc_msgSend_updateNetworkList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNetworkList");
}

id objc_msgSend_updateRecordingIndicatorForStatusBarChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecordingIndicatorForStatusBarChanges");
}

id objc_msgSend_updateSceneWithIdentifier_parameters_transitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSceneWithIdentifier:parameters:transitionContext:");
}

id objc_msgSend_updateSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingsWithBlock:");
}

id objc_msgSend_updateStatusBarItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStatusBarItem:");
}

id objc_msgSend_updateWiFiState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWiFiState");
}

id objc_msgSend_updatedClientSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedClientSettings");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirection");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerDidDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerDidDismiss");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewIfLoaded");
}

id objc_msgSend_wasRemoteSetupPerformed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasRemoteSetupPerformed");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_website(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "website");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_whitelist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitelist");
}

id objc_msgSend_wiFiPickerVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wiFiPickerVisible");
}

id objc_msgSend_wiFiPickerWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wiFiPickerWindow");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_wifiJoinAttemptCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiJoinAttemptCount");
}

id objc_msgSend_wifiManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiManager");
}

id objc_msgSend_wifiPasswordFromNvram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiPasswordFromNvram");
}

id objc_msgSend_wifiPowerStateOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiPowerStateOn");
}

id objc_msgSend_wifiReconnectTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiReconnectTimer");
}

id objc_msgSend_wifiRequiresPassword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiRequiresPassword");
}

id objc_msgSend_wifiSSIDFromNvram(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiSSIDFromNvram");
}

id objc_msgSend_wifiScanRequestors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiScanRequestors");
}

id objc_msgSend_wifiTimeoutTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiTimeoutTimer");
}

id objc_msgSend_willLaunchApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willLaunchApp");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_window_changedBackgroundTunnel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window:changedBackgroundTunnel:");
}

id objc_msgSend_windowDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowDict");
}

id objc_msgSend_windowDidAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowDidAppear:");
}

id objc_msgSend_windowDidDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowDidDismiss:");
}

id objc_msgSend_windowLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowLevel");
}

id objc_msgSend_windowLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowLevel:");
}

id objc_msgSend_windowManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowManager");
}

id objc_msgSend_windowManagerLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowManagerLayer");
}

id objc_msgSend_windowRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowRepresentation");
}

id objc_msgSend_windowRepresentationForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowRepresentationForIdentifier:");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_windowWillAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowWillAppear:");
}

id objc_msgSend_windowWillDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowWillDismiss:");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windows");
}
