id sub_100003F84(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  void *v9;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint8_t v15[16];

  v2 = _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "presenting local upgrade flow manager within hidden app", v15, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
  v5 = objc_msgSend(v4, "isEqualToString:", ICQBundleId);

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverUIURL"));
  if (v6)
  {
    v7 = v6;
    v8 = 0;
LABEL_5:

    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "actionURL"));

  if (!v9)
  {
    v14 = _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100007524(v7);
    v8 = 1;
    goto LABEL_5;
  }
  v8 = 0;
LABEL_8:
  if (objc_msgSend(*(id *)(a1 + 40), "action") == (id)127)
    return objc_msgSend(*(id *)(a1 + 48), "_presentOSLOWithOffer:link:presenter:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  if ((v5 | v8) == 1)
    return objc_msgSend(*(id *)(a1 + 48), "_presentFlowWithOffer:flowOptions:containerViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v11 = objc_msgSend(objc_alloc((Class)ICQUpgradeFlowManager), "initWithOffer:", *(_QWORD *)(a1 + 32));
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "setFlowOptions:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "setIcqLink:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "_configurePresentingViewController:preloadedRemoteUIData:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
}

void sub_100004370(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  _QWORD block[5];
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;

  v5 = a2;
  v6 = a3;
  v7 = ((uint64_t (*)(void))_ICQGetLogSystem)();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "fetchedOffer = %@", buf, 0xCu);
  }

  v9 = ((uint64_t (*)(void))_ICQGetLogSystem)();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "error = %@", buf, 0xCu);
  }

  if (!v5 || v6)
  {
    v30 = _ICQGetLogSystem(objc_msgSend(*(id *)(a1 + 40), "_cancelFlow"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
      *(_DWORD *)buf = 138412290;
      v51 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to launch offer with context = %@", buf, 0xCu);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v33));

    v34 = objc_msgSend(v15, "icq_isICQLaunchURL");
    v35 = (int)v34;
    v36 = _ICQGetLogSystem(v34);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v35)
    {
      if (v38)
      {
        *(_WORD *)buf = 0;
      }

      v39 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", ICQManageStoragePreferencesURL));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v40, "openSensitiveURL:withOptions:", v39, 0);
    }
    else
    {
      if (v38)
      {
        *(_DWORD *)buf = 138412290;
        v51 = v15;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Launching link %@ in safari", buf, 0xCu);
      }

      v39 = objc_alloc_init((Class)_LSOpenConfiguration);
      objc_msgSend(v39, "setAllowURLOverrides:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v40, "openURL:configuration:completionHandler:", v15, v39, &stru_10000C368);
    }

  }
  else
  {
    v12 = _ICQGetLogSystem(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "fetch offer success presenting flow in RemoteApp", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "universalLinkForContext:", v14));

    v17 = _ICQGetLogSystem(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = _ICQStringForAction(objc_msgSend(v15, "action"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412290;
      v51 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using link with action %@", buf, 0xCu);

    }
    v21 = objc_msgSend(v15, "action");
    v22 = *(void **)(a1 + 32);
    if (v21 == (id)118)
    {
      objc_msgSend(v22, "updateOfferWithAction:", 118);
      v23 = *(void **)(a1 + 32);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "actionURL"));
      objc_msgSend(v23, "_updateRequestedServerUIURLWithURL:", v24);

      v25 = objc_msgSend(objc_alloc((Class)ICQUpgradeFlowManager), "initWithOffer:", *(_QWORD *)(a1 + 32));
      v26 = *(_QWORD *)(a1 + 40);
      v27 = *(void **)(v26 + 8);
      *(_QWORD *)(v26 + 8) = v25;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDelegate:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setIcqLink:", v15);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000048F0;
      block[3] = &unk_10000C300;
      v28 = *(void **)(a1 + 48);
      block[4] = *(_QWORD *)(a1 + 40);
      v29 = &v48;
      v48 = v28;
      v49 = *(id *)(a1 + 56);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "context"));
      objc_msgSend(v5, "setContext:", v41);

      v42 = objc_msgSend(objc_alloc((Class)ICQUpgradeFlowManager), "initWithOffer:", v5);
      v43 = *(_QWORD *)(a1 + 40);
      v44 = *(void **)(v43 + 8);
      *(_QWORD *)(v43 + 8) = v42;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDelegate:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setFlowOptions:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setIcqLink:", v15);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10000490C;
      v45[3] = &unk_10000C328;
      v45[4] = *(_QWORD *)(a1 + 40);
      v29 = &v46;
      v46 = *(id *)(a1 + 56);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v45);
    }

  }
}

id sub_1000048F0(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "_configurePresentingViewController:andPresentedViewController:", a1[5], a1[6]);
}

id sub_10000490C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_configurePresentingViewController:", *(_QWORD *)(a1 + 40));
}

void sub_100004920(id a1, NSDictionary *a2, NSError *a3)
{
  NSDictionary *v4;
  NSError *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  int v10;
  NSDictionary *v11;
  __int16 v12;
  NSError *v13;

  v4 = a2;
  v5 = a3;
  v6 = _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      v9 = "Success %@ %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v8)
  {
    v10 = 138412546;
    v11 = 0;
    v12 = 2112;
    v13 = v5;
    v9 = "Failure %@ %@";
    goto LABEL_6;
  }

}

void sub_100004D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_100004D34(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;

  v3 = a2;
  v4 = _ICQGetLogSystem(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "listener lookup connection error %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAndExit");

}

id sub_100004E54(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = _ICQGetLogSystem(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Exiting Hidden App Process", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_main_dismissAndExit");
}

void sub_100004F34(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v4, "invalidate");

}

void sub_100005150(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = _ICQGetLogSystem(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error creating remoteVCProxy: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cancelFlow");
}

Class sub_10000579C(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100012218)
  {
    v5 = off_10000C450;
    v6 = 0;
    qword_100012218 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_100012218)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("INDaemonInterface");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100007564();
LABEL_8:
    free(v2);
  }
  qword_100012210 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100005F64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005F88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

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
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

id sub_100006530(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_configurePresentingViewController:");
}

void sub_1000065C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD block[5];
  id v15;
  uint8_t buf[4];
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = _ICQGetLogSystem(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetch offer completed successfully: %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "offer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
    objc_msgSend(v5, "setContext:", v12);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000067AC;
    block[3] = &unk_10000C328;
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch offer with error: %@", buf, 0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000067F4;
    v13[3] = &unk_10000C3E0;
    v13[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }

}

void sub_1000067AC(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "universalLink"));
  objc_msgSend(v1, "_launchUpgradeFlowWithOffer:icqLink:", v2, v3);

}

id sub_1000067F4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleFallback");
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAndExit");
}

void sub_100006A44(id a1, NSDictionary *a2, NSError *a3)
{
  NSDictionary *v4;
  NSError *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  int v10;
  NSDictionary *v11;
  __int16 v12;
  NSError *v13;

  v4 = a2;
  v5 = a3;
  v6 = _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      v9 = "Success %@ %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v8)
  {
    v10 = 138412546;
    v11 = 0;
    v12 = 2112;
    v13 = v5;
    v9 = "Failure %@ %@";
    goto LABEL_6;
  }

}

void sub_100007140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007158(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to connect to remote proxy with error: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10000724C(id a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v1 = _ICQGetLogSystem(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Exiting hidden app process.", buf, 2u);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "openSessions"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        objc_msgSend(v10, "requestSceneSessionDestruction:options:errorHandler:", v9, 0, 0);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  exit(0);
}

Class sub_100007420(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100012228)
  {
    v5 = off_10000C530;
    v6 = 0;
    qword_100012228 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_100012228)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("INDaemonInterface");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100007564();
LABEL_8:
    free(v2);
  }
  qword_100012220 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100007514(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007524(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ICQRemoteViewController offer is missing remoteUI URL. Will fall back to default flow", v1, 2u);
}

uint64_t sub_100007564()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "INDaemonInterface");
  return sub_100007588(v0);
}

void sub_100007588(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sceneIdentifier"));
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "windowScene._sceneIdentifier: %@", (uint8_t *)&v4, 0xCu);

}

void sub_10000761C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100005F7C();
  sub_100005F88((void *)&_mh_execute_header, v0, v1, "Failed to connect to the session.", v2);
  sub_100005F74();
}

void sub_10000764C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100005F64((void *)&_mh_execute_header, v0, v1, "sceneDidDisconnect", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_100007678()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100005F64((void *)&_mh_execute_header, v0, v1, "sceneDidBecomeActive", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_1000076A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100005F64((void *)&_mh_execute_header, v0, v1, "sceneWillResignActive", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_1000076D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100005F64((void *)&_mh_execute_header, v0, v1, "sceneWillEnterForeground", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_1000076FC(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100005F88((void *)&_mh_execute_header, a3, (uint64_t)a3, "No context found. Action unhandled.", a1);
}

void sub_100007730()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100007514((void *)&_mh_execute_header, v0, v1, "No remote context found. Failed to launch the flow.", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_10000775C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100007514((void *)&_mh_execute_header, v0, v1, "Offer received in context is an icqLink and/or missing LiftUI URL, will fetch the default offer and continue if possible.", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_100007788()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100005F64((void *)&_mh_execute_header, v0, v1, "upgradeFlowManagerDidCancel", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_1000077B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100005F64((void *)&_mh_execute_header, v0, v1, "upgradeFlowManagerDidComplete", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_1000077E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100005F64((void *)&_mh_execute_header, v0, v1, "upgradeFlowManager:didPresentViewController:", v2, v3, v4, v5, v6);
  sub_100005F74();
}

void sub_10000780C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005F7C();
  sub_100007514((void *)&_mh_execute_header, v0, v1, "Failed to initiate connection to ind.", v2, v3, v4, v5, v6);
  sub_100005F74();
}

id objc_msgSend_ICQContextFromRemoteAlertContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ICQContextFromRemoteAlertContext:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "XPCInterface");
}

id objc_msgSend__cancelFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelFlow");
}

id objc_msgSend__configurePresentingViewController_preloadedRemoteUIData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configurePresentingViewController:preloadedRemoteUIData:");
}

id objc_msgSend__dismissAndExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissAndExit");
}

id objc_msgSend__dismissFlowWithSuccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissFlowWithSuccess:");
}

id objc_msgSend__fetchDefaultOfferAndLaunchUpgradeFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchDefaultOfferAndLaunchUpgradeFlow");
}

id objc_msgSend__handleFallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleFallback");
}

id objc_msgSend__launchUpgradeFlowWithOffer_icqLink_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchUpgradeFlowWithOffer:icqLink:");
}

id objc_msgSend__main_dismissAndExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_main_dismissAndExit");
}

id objc_msgSend__notifyFlowCompletionToDaemonWithSuccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyFlowCompletionToDaemonWithSuccess:");
}

id objc_msgSend__presentFlowWithOffer_flowOptions_containerViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentFlowWithOffer:flowOptions:containerViewController:");
}

id objc_msgSend__presentFreshmintWithOffer_link_flowOptions_preloadedRemoteUIData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentFreshmintWithOffer:link:flowOptions:preloadedRemoteUIData:");
}

id objc_msgSend__presentOSLOWithOffer_link_presenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentOSLOWithOffer:link:presenter:");
}

id objc_msgSend__registerSceneActionsHandlerArray_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerSceneActionsHandlerArray:forKey:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__sceneIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sceneIdentifier");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setupRemoteProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupRemoteProxy");
}

id objc_msgSend__updateRequestedServerUIURLWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateRequestedServerUIURLWithURL:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionURL");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginOSLOFlowWithPresentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginOSLOFlowWithPresentingViewController:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_contextFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextFromDictionary:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dismissUpgradeFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissUpgradeFlow");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_flowOptionsData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flowOptionsData");
}

id objc_msgSend_flowOptionsFromData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flowOptionsFromData:");
}

id objc_msgSend_getOfferForBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOfferForBundleIdentifier:completion:");
}

id objc_msgSend_icq_isICQLaunchURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icq_isICQLaunchURL");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithOffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOffer:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isDefaultOffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDefaultOffer");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPremiumOffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPremiumOffer");
}

id objc_msgSend_link(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "link");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForSetting:");
}

id objc_msgSend_offer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offer");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openSessions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSessions");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_preloadedRemoteUIData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preloadedRemoteUIData");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentingSceneIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingSceneIdentifier");
}

id objc_msgSend_publishOfferDisplayActionEventWithBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishOfferDisplayActionEventWithBundleId:");
}

id objc_msgSend_remoteContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteContext");
}

id objc_msgSend_remoteFreshmintFlowCompletedWithSuccess_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteFreshmintFlowCompletedWithSuccess:error:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_serverUIURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverUIURL");
}

id objc_msgSend_setAllowURLOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowURLOverrides:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setContentsPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentsPosition:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setFlowOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlowOptions:");
}

id objc_msgSend_setIcqLink_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcqLink:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setModalPresentationCapturesStatusBarAppearance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationCapturesStatusBarAppearance:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
}

id objc_msgSend_setPresentingSceneIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentingSceneIdentifier:");
}

id objc_msgSend_setRemoteContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteContext:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSceneIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSceneIdentifier:");
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisableFadeInAnimation:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedOfferManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedOfferManager");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_teardownCachedOffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownCachedOffer");
}

id objc_msgSend_teardownCachedPremiumOffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownCachedPremiumOffer");
}

id objc_msgSend_universalLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "universalLink");
}

id objc_msgSend_universalLinkForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "universalLinkForContext:");
}

id objc_msgSend_updateOfferWithAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateOfferWithAction:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
