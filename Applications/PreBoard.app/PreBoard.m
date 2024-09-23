void sub_100002C54(id a1)
{
  PBAHIDEventController *v1;
  void *v2;

  v1 = objc_alloc_init(PBAHIDEventController);
  v2 = (void *)qword_100021C50;
  qword_100021C50 = (uint64_t)v1;

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  objc_class *v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;

  v4 = objc_autoreleasePoolPush();
  v5 = (id)FBSystemShellInitialize(&stru_100018688);
  v6 = (objc_class *)objc_opt_class(PBAApplication);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(PBAAppDelegate);
  v10 = NSStringFromClass(v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
  v12 = UIApplicationMain(a1, a2, v8, v11);

  objc_autoreleasePoolPop(v4);
  return v12;
}

void sub_100002F98(id a1, FBMutableSystemShellInitializationOptions *a2)
{
  FBMutableSystemShellInitializationOptions *v2;

  v2 = a2;
  -[FBMutableSystemShellInitializationOptions setShouldWaitForMigrator:](v2, "setShouldWaitForMigrator:", 0);
  -[FBMutableSystemShellInitializationOptions setRegisterAdditionalServicesBlock:](v2, "setRegisterAdditionalServicesBlock:", &stru_1000186A8);

}

void sub_100002FD4(id a1)
{
  void *v1;
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v2 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v1);

}

void sub_100003774(uint64_t a1, float a2)
{
  _QWORD v3[4];
  id v4;
  float v5;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000037EC;
  v3[3] = &unk_1000186D0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

id sub_1000037EC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProgress:", *(float *)(a1 + 40));
}

void sub_100003800(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000038A8;
  v6[3] = &unk_100018770;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_1000038A8(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  NSObject *v11;
  PBADataRecoveryErrorViewController *v12;
  id v13;
  NSObject *v14;
  PBAAppleLogoViewController *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD block[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  PBADataRecoveryErrorViewController *v30;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resetIdleTimerAndUndim:", 1);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100003BF0;
  v27[3] = &unk_100018720;
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v28 = v2;
  v29 = v3;
  AnalyticsSendEventLazy(CFSTR("com.apple.preboard.recovery.completed"), v27);
  if (!*(_QWORD *)(a1 + 40))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SBFMobileKeyBag sharedInstance](SBFMobileKeyBag, "sharedInstance"));
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003CDC;
    block[3] = &unk_100018748;
    v26 = v10;
    v12 = v10;
    dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_group_enter(v11);
    v13 = objc_msgSend(objc_alloc((Class)SBFMobileKeyBagUnlockOptions), "initWithPasscode:skipSEKeepUserDataOperation:", *(_QWORD *)(a1 + 48), 1);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100003D48;
    v23[3] = &unk_100018748;
    v14 = v11;
    v24 = v14;
    -[PBADataRecoveryErrorViewController createStashBagWithOptions:completion:](v12, "createStashBagWithOptions:completion:", v13, v23);
    v15 = objc_alloc_init(PBAAppleLogoViewController);
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100003D50;
    v21[3] = &unk_100018748;
    v22 = v14;
    v17 = v14;
    objc_msgSend(v16, "pushViewController:animated:completion:", v15, 1, v21);

LABEL_8:
    goto LABEL_9;
  }
  v4 = sub_100006038();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000C66C((uint64_t *)(a1 + 40), v5);

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dataRecoveryPossible"))
  {
    v12 = objc_alloc_init(PBADataRecoveryErrorViewController);
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v30 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    objc_msgSend(v18, "setViewControllers:animated:", v19, 1);

    goto LABEL_8;
  }
  v6 = *(void **)(a1 + 56);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PREBOARD_RECOVERY_FAILED"), &stru_100018D78, CFSTR("PreBoard")));
  objc_msgSend(v6, "setStatusText:", v8);

  v9 = dispatch_time(0, 3000000000);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100003D58;
  v20[3] = &unk_100018748;
  v20[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v20);
LABEL_9:

}

id sub_100003BF0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("successful");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)(a1 + 32) == 0));
  v6[1] = CFSTR("recoverable");
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "dataRecoveryPossible")));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

void sub_100003CDC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100006038();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "exiting as result of successful unlock", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "lockSkippingGracePeriod:", 0);
  exit(0);
}

void sub_100003D48(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100003D50(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_100003D58(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "popToRootViewControllerAnimated:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDeviceBlockState");
}

id sub_100004A54(uint64_t a1)
{
  const __CFString *v1;
  unsigned int v2;
  const __CFString *v4;
  const __CFString *v5;

  if (*(_BYTE *)(a1 + 40))
  {
    v1 = CFSTR("LAPreboard");
  }
  else
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "requiresDataRecovery");
    v1 = CFSTR("unlock");
    if (v2)
      v1 = CFSTR("recovery");
  }
  v4 = CFSTR("reason");
  v5 = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
}

void sub_100004B00(id a1)
{
  objc_msgSend(UIApp, "_performBlockAfterCATransactionCommits:", &stru_100018800);
}

void sub_100004B18(id a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDisplayRenderOverlay dismissActions](BKSDisplayRenderOverlay, "dismissActions", 0));
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overlayDescriptor"));
        v8 = objc_msgSend(v7, "isInterstitial");

        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSAnimationSettings settingsWithDuration:timingFunction:](BSAnimationSettings, "settingsWithDuration:timingFunction:", v9, 0.75));
          objc_msgSend(v6, "dismissWithAnimation:", v10);

        }
        else
        {
          objc_msgSend(v6, "dismissWithAnimation:", 0);
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

void sub_1000058B4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](FBDisplayManager, "mainConfiguration"));
  objc_msgSend(v6, "setDisplayConfiguration:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "_referenceBounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(v6, "setLevel:", 0.0);
  objc_msgSend(v6, "setForeground:", 1);
  objc_msgSend(v6, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "_computeBootOrientation"));
  if (objc_msgSend(v6, "isUISubclass"))
    objc_msgSend(v6, "setDeviceOrientationEventsEnabled:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ignoreOcclusionReasons"));
  objc_msgSend(v5, "addObject:", CFSTR("SystemApp"));

}

void sub_100005990(uint64_t a1, void *a2)
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

void sub_100005C08(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "setForeground:", 1);
  objc_msgSend(v3, "setLevel:", 1.0);
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 40), "_computeBootOrientation"));
  if (objc_msgSend(v3, "isUISubclass"))
    objc_msgSend(v3, "setInterfaceOrientationMode:", 2);

}

id sub_100005DAC(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addScene:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "updateSettingsWithBlock:", &stru_1000188B8);
}

void sub_100005DE8(id a1, FBSMutableSceneSettings *a2)
{
  -[FBSMutableSceneSettings setLevel:](a2, "setLevel:", 1.0);
}

void sub_100006028(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100006038()
{
  if (qword_100021C68 != -1)
    dispatch_once(&qword_100021C68, &stru_100018900);
  return (id)qword_100021C60;
}

void sub_100006078(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.PreBoard", "common");
  v2 = (void *)qword_100021C60;
  qword_100021C60 = (uint64_t)v1;

}

void sub_100006228(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "state"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "recoveryRequired");

}

void sub_100006304(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "state"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "recoveryPossible");

}

id sub_100006418(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performDataRecoveryWithPasscode:progressHandler:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t sub_1000066CC(_QWORD *a1)
{
  return (*(uint64_t (**)(float))(a1[4] + 16))((float)(uint64_t)(a1[5] - a1[6]) / (float)(uint64_t)a1[5]);
}

uint64_t sub_1000066EC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10000698C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000069A8(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "passcode"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006A6C;
  v4[3] = &unk_1000189F0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v2, "enableCurrentUseCaseWithPasscode:completion:", v3, v4);

  objc_destroyWeak(&v5);
}

void sub_100006A58(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006A6C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  void *v9;

  v3 = a2;
  if (!v3)
    exit(0);
  v4 = v3;
  v5 = sub_100006038();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to set ACM variable with error: %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finish");

}

void sub_100006F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100006F98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100006FAC(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finish");

}

void sub_100007064(id a1, NSError *a2)
{
  NSError *v2;

  v2 = a2;
  exit(0);
}

id sub_10000780C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

id sub_100007818(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

id *sub_100007824(id *result)
{
  if (*((_BYTE *)result + 40))
    return (id *)objc_msgSend(result[4], "removeFromParentViewController");
  return result;
}

id *sub_100007838(id *result)
{
  if (*((_BYTE *)result + 48))
    return (id *)objc_msgSend(result[4], "didMoveToParentViewController:", result[5]);
  return result;
}

uint64_t sub_100007854(_QWORD *a1)
{
  uint64_t result;

  (*(void (**)(void))(a1[4] + 16))();
  (*(void (**)(void))(a1[5] + 16))();
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000078A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000078AC(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000078F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100007900(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_1000082E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleBlockedDevice");
}

void sub_100008474(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_100006038();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "exiting as a result of external unlock while we're running", v3, 2u);
  }

  exit(0);
}

void sub_10000870C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100008728(uint64_t a1, int a2, uint64_t a3)
{
  id *WeakRetained;
  PBAPasscodeEntryViewController *v6;
  id v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    v8 = WeakRetained;
    if ((objc_msgSend(WeakRetained[10], "hasPasscodeSet") & 1) != 0)
    {
      v6 = -[PBAPasscodeEntryViewController initWithLightBackground:]([PBAPasscodeEntryViewController alloc], "initWithLightBackground:", a3);
      v7 = v8[4];
      v8[4] = v6;

      objc_msgSend(v8[4], "setDelegate:");
      objc_msgSend(v8[1], "pushViewController:animated:completion:", v8[4], 1, 0);
      objc_msgSend(v8, "_configurePasscodeEntryViewController:", v8[4]);
    }
    else
    {
      objc_msgSend(v8, "_authenticateWithEmptyPasscode");
    }
    WeakRetained = v8;
  }

}

id sub_100008A14(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "successfulAuthHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "resetPasscodeEntryFieldForFailure:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_resetStateAfterHandlingAuthenticationResult");
}

id sub_100008A4C(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "failedAuthHandler:error:", *(_QWORD *)(a1 + 40), a2);
  objc_msgSend(*(id *)(a1 + 48), "resetPasscodeEntryFieldForFailure:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_resetStateAfterHandlingAuthenticationResult");
}

id sub_100008A88(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidAuthHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "resetPasscodeEntryFieldForFailure:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_resetStateAfterHandlingAuthenticationResult");
}

void sub_100008C78(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_100006038();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "exiting as result of successful unlock", v3, 2u);
  }

  exit(0);
}

void sub_10000919C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000091BC(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "blockStatusProvider"));
    v3 = objc_msgSend(v2, "isBlocked");

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "overlayView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitleLabel"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "blockTimer"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subtitleText"));
      objc_msgSend(v5, "setText:", v7);

    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
      objc_msgSend(v4, "deviceBlockOverlayViewControllerDidChangeBlockState:", v8);
    }

    WeakRetained = v8;
  }

}

void sub_1000095D4(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_100006038();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "exiting as result of successful unlock", v3, 2u);
  }

  exit(0);
}

void sub_100009630(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100009658(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000B21C(id a1)
{
  PBAIdleSleepController *v1;
  void *v2;

  v1 = objc_alloc_init(PBAIdleSleepController);
  v2 = (void *)qword_100021C70;
  qword_100021C70 = (uint64_t)v1;

}

void sub_10000B400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B420(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(v3, "eventMask");
  v6 = sub_100006038();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "dimming for idle", (uint8_t *)&v9, 2u);
    }

    objc_msgSend(WeakRetained, "dimDisplay");
  }
  else
  {
    if (v8)
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "reset idle for event %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(WeakRetained, "resetIdleTimerAndUndim:", 1);
  }

}

void sub_10000BDC8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000C66C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Data recovery failed with error %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10000C6E4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "tripleClickOptions:%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000C758(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006028((void *)&_mh_execute_header, a1, a3, "Could not create process identity for InputUI", a5, a6, a7, a8, 0);
}

void sub_10000C78C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006028((void *)&_mh_execute_header, a1, a3, "Could not create InputUI scene", a5, a6, a7, a8, 0);
}

void sub_10000C7C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BDC8((void *)&_mh_execute_header, a2, a3, "Could not resume AttentionAwareness on undim: %{public}@", a5, a6, a7, a8, 2u);
  sub_10000BDD8();
}

void sub_10000C824(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BDC8((void *)&_mh_execute_header, a2, a3, "Could not suspend Attentionawareness on dim: %{public}@", a5, a6, a7, a8, 2u);
  sub_10000BDD8();
}

void sub_10000C888(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BDC8((void *)&_mh_execute_header, a2, a3, "Could not reset idle: %{public}@", a5, a6, a7, a8, 2u);
  sub_10000BDD8();
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend___handleHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__handleHIDEvent:");
}

id objc_msgSend__authenticateWithEmptyPasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authenticateWithEmptyPasscode");
}

id objc_msgSend__beginRecovery_fromViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginRecovery:fromViewController:");
}

id objc_msgSend__cancelLockButtonTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelLockButtonTimer");
}

id objc_msgSend__computeBootOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computeBootOrientation");
}

id objc_msgSend__configurePasscodeEntryViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configurePasscodeEntryViewController:");
}

id objc_msgSend__contentHorizontalInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contentHorizontalInset");
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contextId");
}

id objc_msgSend__createInitialAppScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createInitialAppScene");
}

id objc_msgSend__createInputUIScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createInputUIScene");
}

id objc_msgSend__evaluateDeviceBlockState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_evaluateDeviceBlockState");
}

id objc_msgSend__finish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finish");
}

id objc_msgSend__handleBlockedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleBlockedDevice");
}

id objc_msgSend__hidEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hidEvent");
}

id objc_msgSend__layoutCallToActionLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_layoutCallToActionLabel");
}

id objc_msgSend__layoutHomeAffordance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_layoutHomeAffordance");
}

id objc_msgSend__layoutInternalUIWarningLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_layoutInternalUIWarningLabel");
}

id objc_msgSend__localizedRecoveryStringForHomeButtonType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localizedRecoveryStringForHomeButtonType:");
}

id objc_msgSend__lockButtonDown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lockButtonDown");
}

id objc_msgSend__lockButtonUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lockButtonUp");
}

id objc_msgSend__noteDeviceLockStateMayHaveChangedForExternalReasons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_noteDeviceLockStateMayHaveChangedForExternalReasons");
}

id objc_msgSend__numberPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_numberPad");
}

id objc_msgSend__preferredFontForTextStyle_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preferredFontForTextStyle:weight:");
}

id objc_msgSend__preventIdleSleep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preventIdleSleep");
}

id objc_msgSend__preventIdleSleepForNumberOfSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preventIdleSleepForNumberOfSeconds:");
}

id objc_msgSend__reconfigureHomeButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reconfigureHomeButton");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_referenceBounds");
}

id objc_msgSend__setHIDUILockedState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setHIDUILockedState:");
}

id objc_msgSend__setShouldInvokeCancelActionOnDimmingViewTap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldInvokeCancelActionOnDimmingViewTap:");
}

id objc_msgSend__setViewControllers_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setViewControllers:animated:completion:");
}

id objc_msgSend__setupHomeButtonRecognition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupHomeButtonRecognition");
}

id objc_msgSend__setupTapToWakeRecognition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupTapToWakeRecognition");
}

id objc_msgSend__smartCoverClosed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_smartCoverClosed");
}

id objc_msgSend__smartCoverOpen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_smartCoverOpen");
}

id objc_msgSend__undimDisplayForce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_undimDisplayForce");
}

id objc_msgSend__updateContentWidthConstraint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateContentWidthConstraint");
}

id objc_msgSend__updatePasscodeStatusTextAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePasscodeStatusTextAnimated:");
}

id objc_msgSend__userCancelledEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userCancelledEntry");
}

id objc_msgSend_actionTitleWithHomeButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionTitleWithHomeButton:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addScene:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applyDefinitions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyDefinitions:");
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areAnimationsEnabled");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationController");
}

id objc_msgSend_authenticationPolicyEncounteredPolicyError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationPolicyEncounteredPolicyError:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_beginRecovery_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginRecovery:error:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blockStatusProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockStatusProvider");
}

id objc_msgSend_blockTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockTimer");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_combinedTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "combinedTintColor");
}

id objc_msgSend_configurationWithFadeInDuration_fadeOutDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithFadeInDuration:fadeOutDuration:");
}

id objc_msgSend_confirmTransitionToPasscodeWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmTransitionToPasscodeWithCompletion:");
}

id objc_msgSend_confirmationActionTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationActionTitle");
}

id objc_msgSend_confirmationCancelTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationCancelTitle");
}

id objc_msgSend_confirmationMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationMessage");
}

id objc_msgSend_confirmationTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationTitle");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constant");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentInset");
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

id objc_msgSend_createGracePeriodAssertionWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createGracePeriodAssertionWithReason:");
}

id objc_msgSend_createKeybagUnlockAssertionWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createKeybagUnlockAssertionWithReason:");
}

id objc_msgSend_createSceneWithDefinition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSceneWithDefinition:");
}

id objc_msgSend_createSceneWithDefinition_initialParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSceneWithDefinition:initialParameters:");
}

id objc_msgSend_createStashBagWithOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createStashBagWithOptions:completion:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_dataRecoveryPossible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataRecoveryPossible");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultContext");
}

id objc_msgSend_defaultFocusPredicate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultFocusPredicate");
}

id objc_msgSend_defaultSystemPredicate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSystemPredicate");
}

id objc_msgSend_definition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "definition");
}

id objc_msgSend_definitionForHomeButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "definitionForHomeButton");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deviceBlockOverlayViewControllerDidChangeBlockState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceBlockOverlayViewControllerDidChangeBlockState:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dimDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dimDisplay");
}

id objc_msgSend_dismissActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissActions");
}

id objc_msgSend_dismissWithAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissWithAnimation:");
}

id objc_msgSend_dispatchDiscreteEventsForReason_withRules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchDiscreteEventsForReason:withRules:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_enableCurrentUseCaseWithPasscode_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCurrentUseCaseWithPasscode:completion:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_escrowCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "escrowCount");
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventMask");
}

id objc_msgSend_fadeOut(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fadeOut");
}

id objc_msgSend_failedAuthHandler_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedAuthHandler:error:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "functionWithName:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handlePasscodeEntrySuccessful_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePasscodeEntrySuccessful:");
}

id objc_msgSend_hasPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPasscodeSet");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_iconSystemName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconSystemName");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityForAngelJobLabel:");
}

id objc_msgSend_identityForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityForIdentifier:");
}

id objc_msgSend_identityForProcessIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityForProcessIdentity:");
}

id objc_msgSend_ignoreOcclusionReasons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoreOcclusionReasons");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initForPasscode_source_skipSEKeepUserDataOperation_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForPasscode:source:skipSEKeepUserDataOperation:handler:");
}

id objc_msgSend_initForPasscode_source_skipSEKeepUserDataOperation_verifyOnly_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForPasscode:source:skipSEKeepUserDataOperation:verifyOnly:handler:");
}

id objc_msgSend_initWithAssertionManager_policy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssertionManager:policy:");
}

id objc_msgSend_initWithBlockStatusProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBlockStatusProvider:");
}

id objc_msgSend_initWithContainingStackViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainingStackViewController:");
}

id objc_msgSend_initWithContainingStackViewController_authenticationPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainingStackViewController:authenticationPolicy:");
}

id objc_msgSend_initWithContextID_displayUUID_identifier_policy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContextID:displayUUID:identifier:policy:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDeviceBlockStatusProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceBlockStatusProvider:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_progressBarVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:progressBarVisible:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithLightBackground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLightBackground:");
}

id objc_msgSend_initWithMobileKeyBag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMobileKeyBag:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithPasscode_skipSEKeepUserDataOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPasscode:skipSEKeepUserDataOperation:");
}

id objc_msgSend_initWithPriority_displayConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPriority:displayConfiguration:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithRequestedActivityState_explanation_timestamp_sourceEvent_sourceEventMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTarget_action_type_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:type:options:");
}

id objc_msgSend_initWithThermalController_authenticationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithThermalController:authenticationController:");
}

id objc_msgSend_insertArrangedSubview_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertArrangedSubview:atIndex:");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_invalidAuthHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidAuthHandler:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAuthenticated");
}

id objc_msgSend_isBlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBlocked");
}

id objc_msgSend_isDisplayDim(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDisplayDim");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInterstitial(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInterstitial");
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRequired");
}

id objc_msgSend_isUISubclass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUISubclass");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_launchAdvisorWithOmniscientDelegate_sceneDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchAdvisorWithOmniscientDelegate:sceneDelegate:");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lightPasscodeLockViewForUsersCurrentStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lightPasscodeLockViewForUsersCurrentStyle");
}

id objc_msgSend_localIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdentity");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lockButtonTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockButtonTimer");
}

id objc_msgSend_lockScreenActionTitleWithHomeButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockScreenActionTitleWithHomeButton:");
}

id objc_msgSend_lockScreenIconSystemName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockScreenIconSystemName");
}

id objc_msgSend_lockScreenMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockScreenMessage");
}

id objc_msgSend_lockScreenTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockScreenTitle");
}

id objc_msgSend_lockSkippingGracePeriod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockSkippingGracePeriod:");
}

id objc_msgSend_lockState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockState");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainConfiguration");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeAuthenticationRequestWithPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeAuthenticationRequestWithPasscode:");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "message");
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_monitorUsingMainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorUsingMainQueue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_newSceneIdentityTokenForIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSceneIdentityTokenForIdentity:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_obliterateDataPartitionShowingProgress_skipDataObliteration_eraseDataPlan_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "obliterateDataPartitionShowingProgress:skipDataObliteration:eraseDataPlan:reason:");
}

id objc_msgSend_overlayDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overlayDescriptor");
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overlayView");
}

id objc_msgSend_parametersForSpecification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parametersForSpecification:");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcode");
}

id objc_msgSend_passcodeEntryScreenSubtitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEntryScreenSubtitle");
}

id objc_msgSend_passcodeEntryScreenTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEntryScreenTitle");
}

id objc_msgSend_passcodeEntryViewControllerCancelButtonPressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEntryViewControllerCancelButtonPressed:");
}

id objc_msgSend_passcodeEntryViewControllerEntryBegan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEntryViewControllerEntryBegan:");
}

id objc_msgSend_passcodeEntryViewControllerEntryCancelled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEntryViewControllerEntryCancelled:");
}

id objc_msgSend_passcodeEntryViewControllerEntryCompleted_passcode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEntryViewControllerEntryCompleted:passcode:");
}

id objc_msgSend_passcodeLockView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockView");
}

id objc_msgSend_passcodeLockViewForUsersCurrentStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockViewForUsersCurrentStyle");
}

id objc_msgSend_passcodeSubtitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeSubtitle");
}

id objc_msgSend_passcodeTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeTitle");
}

id objc_msgSend_performChangeRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performChangeRequest:");
}

id objc_msgSend_performDataRecoveryWithPasscode_progressHandler_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performDataRecoveryWithPasscode:progressHandler:completion:");
}

id objc_msgSend_performSelector_withObject_afterDelay_inModes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:inModes:");
}

id objc_msgSend_performUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performUpdate:");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_presentDataRecovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentDataRecovery");
}

id objc_msgSend_presentDeviceUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentDeviceUnlock");
}

id objc_msgSend_presentLAPasscodeVerification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentLAPasscodeVerification");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_processAuthenticationRequest_responder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAuthenticationRequest:responder:");
}

id objc_msgSend_pushViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:completion:");
}

id objc_msgSend_recoveryPossible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoveryPossible");
}

id objc_msgSend_recoveryRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoveryRequired");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redColor");
}

id objc_msgSend_registerForUnlockNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForUnlockNotification");
}

id objc_msgSend_registerPlatformStyleProvider_forIdiom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerPlatformStyleProvider:forIdiom:");
}

id objc_msgSend_removeArrangedSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeArrangedSubview:");
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

id objc_msgSend_removeViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeViewController:animated:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replaceViewController_withViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceViewController:withViewController:animated:");
}

id objc_msgSend_requiresDataRecovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresDataRecovery");
}

id objc_msgSend_resetAttentionLostTimeoutWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAttentionLostTimeoutWithError:");
}

id objc_msgSend_resetForFailedPasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetForFailedPasscode");
}

id objc_msgSend_resetForSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetForSuccess");
}

id objc_msgSend_resetIdleTimerAndUndim_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetIdleTimerAndUndim:");
}

id objc_msgSend_resetPasscodeEntryFieldForFailure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetPasscodeEntryFieldForFailure:");
}

id objc_msgSend_responderWithSuccessHandler_failureHandler_invalidHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responderWithSuccessHandler:failureHandler:invalidHandler:");
}

id objc_msgSend_resumeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeWithError:");
}

id objc_msgSend_revokeAuthenticationImmediatelyIfNecessaryForPublicReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revokeAuthenticationImmediatelyIfNecessaryForPublicReason:");
}

id objc_msgSend_ruleForDispatchingDiscreteEventsMatchingPredicate_toTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedPressTypes:");
}

id objc_msgSend_setAllowedTouchTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedTouchTypes:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAttentionLostTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttentionLostTimeout:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBiometricAuthenticationAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBiometricAuthenticationAllowed:");
}

id objc_msgSend_setBlockStatusProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlockStatusProvider:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCancelsTouchesInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelsTouchesInView:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClickCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClickCount:");
}

id objc_msgSend_setClientIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientIdentity:");
}

id objc_msgSend_setConfiguration_shouldReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:shouldReset:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCustomBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomBackgroundColor:");
}

id objc_msgSend_setDataRecoveryEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataRecoveryEngine:");
}

id objc_msgSend_setDefaultSceneToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultSceneToken:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceOrientationEventsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceOrientationEventsEnabled:");
}

id objc_msgSend_setDisplayConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayConfiguration:");
}

id objc_msgSend_setDisplayDim_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayDim:");
}

id objc_msgSend_setDistribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDistribution:");
}

id objc_msgSend_setEdges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEdges:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEventHandlerWithQueue_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandlerWithQueue:block:");
}

id objc_msgSend_setEventMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventMask:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForeground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForeground:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setIconSystemName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconSystemName:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentity:");
}

id objc_msgSend_setIdleSleepController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleSleepController:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceOrientation:");
}

id objc_msgSend_setInterfaceOrientationMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceOrientationMode:");
}

id objc_msgSend_setLegibilitySettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLegibilitySettings:");
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLevel:");
}

id objc_msgSend_setLockButtonTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockButtonTimer:");
}

id objc_msgSend_setMainViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMainViewController:");
}

id objc_msgSend_setMainViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMainViewController:animated:");
}

id objc_msgSend_setMaximumMultiplePressTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumMultiplePressTimeInterval:");
}

id objc_msgSend_setMaximumPressCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumPressCount:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMinimumMultiplePressTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumMultiplePressTimeInterval:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfTapsRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfTapsRequired:");
}

id objc_msgSend_setOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientation:");
}

id objc_msgSend_setPressToOpenText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPressToOpenText:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setRecognizesOnPressPhaseBegan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecognizesOnPressPhaseBegan:");
}

id objc_msgSend_setReduceTransparencyButtonColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReduceTransparencyButtonColor:");
}

id objc_msgSend_setRegisterAdditionalServicesBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegisterAdditionalServicesBlock:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSenderDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSenderDescriptors:");
}

id objc_msgSend_setShouldWaitForMigrator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldWaitForMigrator:");
}

id objc_msgSend_setShowsEmergencyCallButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsEmergencyCallButton:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpecification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpecification:");
}

id objc_msgSend_setStatusBarHidden_withAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withAnimation:");
}

id objc_msgSend_setStatusBarStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarStyle:");
}

id objc_msgSend_setStatusText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusText:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSystemIdleSleepDisabled_forReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemIdleSleepDisabled:forReason:");
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

id objc_msgSend_setTitleText_subtitleText_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleText:subtitleText:animated:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:animated:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settings");
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsForPrivateStyle:");
}

id objc_msgSend_settingsWithDuration_timingFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsWithDuration:timingFunction:");
}

id objc_msgSend_shamKeyBagWithRecoveryRequired_correctPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shamKeyBagWithRecoveryRequired:correctPasscode:");
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBacklight");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedInstanceForStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstanceForStyle:");
}

id objc_msgSend_shutdownUsingOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdownUsingOptions:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specification");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startLocalOnlyServiceWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startLocalOnlyServiceWithConfiguration:");
}

id objc_msgSend_startReceivingEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startReceivingEvents");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitleLabel");
}

id objc_msgSend_subtitleText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitleText");
}

id objc_msgSend_successfulAuthHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successfulAuthHandler:");
}

id objc_msgSend_suggestedEdgeSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedEdgeSpacing");
}

id objc_msgSend_suggestedFrameForCallToActionLabel_yOffset_inBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedFrameForCallToActionLabel:yOffset:inBounds:");
}

id objc_msgSend_suggestedFrameForDateTimeViewInScreenCoordinates_centeredX_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:");
}

id objc_msgSend_suggestedSizeForContentWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedSizeForContentWidth:");
}

id objc_msgSend_suspendWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspendWithError:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTarget");
}

id objc_msgSend_terminateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateWithCompletion:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_titleText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleText");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_transitionFromViewController_toViewController_duration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionFromViewController:toViewController:duration:options:animations:completion:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_undimDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "undimDisplay");
}

id objc_msgSend_updateClientSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClientSettingsWithBlock:");
}

id objc_msgSend_updateSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSettingsWithBlock:");
}

id objc_msgSend_updateStatusText_subtitle_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStatusText:subtitle:animated:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_usesInputSystemUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usesInputSystemUI");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_waitForUnlockWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForUnlockWithTimeout:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
