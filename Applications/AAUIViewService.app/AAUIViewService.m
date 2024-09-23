uint64_t sub_1000039F0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100003E00(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v3 = a2;
  v4 = _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000703C((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    if ((objc_msgSend(v3, "aa_isAAErrorWithCode:", -1) & 1) == 0)
    {
      v13 = _AAUILogSystem();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_100007010();

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v15, "openURL:withOptions:", a1[4], 0);

      v16 = *(_QWORD *)(a1[5] + 8);
      if (v16)
        (*(void (**)(void))(v16 + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v17 = a1[6];
      v18 = 138412290;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully presented Custodian Invitation UI for UUID - %@", (uint8_t *)&v18, 0xCu);
    }

  }
}

void sub_100004054(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v3 = a2;
  v4 = _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000070A4((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    if ((objc_msgSend(v3, "aa_isAAErrorWithCode:", -1) & 1) == 0)
    {
      v13 = _AAUILogSystem();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_100007010();

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v15, "openURL:withOptions:", a1[4], 0);

      v16 = *(_QWORD *)(a1[5] + 8);
      if (v16)
        (*(void (**)(void))(v16 + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v17 = a1[6];
      v18 = 138412290;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully presented Inheritance Invitation UI for beneficiaryID - %@", (uint8_t *)&v18, 0xCu);
    }

  }
}

void sub_1000043AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000043BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000043CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000466C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004688(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *v6;
  _QWORD *WeakRetained;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t v12[16];

  v5 = a3;
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = _AAUILogSystem(WeakRetained);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully verified manatee. Displaying invitation.", v12, 2u);
    }

    v11 = objc_loadWeakRetained(v6);
    objc_msgSend(v11, "presentViewController:animated:completion:", WeakRetained[6], 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100007138();

    v11 = objc_loadWeakRetained(v6);
    objc_msgSend(v11, "_callCompletionWithError:", v5);
  }

}

void sub_100004F48(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteContextInfo"));

  v3 = _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote context found. Proceeding to launch the authorization flow.", buf, 2u);
    }

    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
    objc_msgSend(v6, "setUpLookupConnection:", v7);

    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteContextInfo"));
    objc_msgSend(v8, "_buildViewModelWithContextInfo:", v9);

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No remote context found. Failed to launch the flow.", v10, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "notifyFlowCompletionToExitScene");
  }
}

void sub_10000521C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005238(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;

  v3 = a2;
  v4 = _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000073B8();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAndExit");

}

id sub_100005684(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAndExit");
}

void sub_1000056CC(id a1)
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

  v1 = _AAUILogSystem(a1);
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

id sub_100005864(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_dismissAndExit");
}

id sub_100005920(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWelcomeController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "endUIService");
}

uint64_t sub_10000594C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100005AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005AF4(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  uint8_t v10[16];

  v5 = a3;
  v6 = _AAUILogSystem(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee state has been verified.", v10, 2u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100007478();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

void sub_100005C90(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_100005CAC(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_respondToInheritanceInvitationWithResponse:", 1);
  else
    objc_msgSend(WeakRetained, "_callCompletionWithError:", v7);

}

void sub_100005ED0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = _AAUILogSystem(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000074D8();

    v7 = *(void **)(a1 + 32);
    v8 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_dismissBeneficiaryInvitationReminderFollowUp");
    v7 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v7, "_showInheritanceInvitationAcceptedView");
      goto LABEL_8;
    }
    v8 = 0;
  }
  objc_msgSend(v7, "_callCompletionWithError:", v8);
LABEL_8:

}

void sub_10000604C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006068(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  uint8_t v10[16];

  v5 = a3;
  v6 = _AAUILogSystem(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee state has been verified.", v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_respondToCustodianInvitationWithResponse:", 1);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100007478();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_callCompletionWithError:", v5);
  }

}

void sub_1000062B8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = _AAUILogSystem(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100007538();

    v7 = *(void **)(a1 + 32);
    v8 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_dismissCustodianInvitationReminderFollowUp");
    v7 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v7, "_showCustodianInvitationAcceptedView");
      goto LABEL_8;
    }
    v8 = 0;
  }
  objc_msgSend(v7, "_callCompletionWithError:", v8);
LABEL_8:

}

void sub_10000641C(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc((Class)AACustodianshipInfo);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[5], "custodianshipInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "custodianID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[5], "custodianshipInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ownerHandle"));
    v7 = objc_msgSend(v2, "initWithID:status:ownerHandle:", v4, 2, v6);

    v8 = objc_msgSend(objc_alloc((Class)AAOBCustodianInvitationModel), "initWithCustodianshipInfo:", v7);
    v9 = objc_msgSend(objc_alloc((Class)AAUIOBCustodianInvitationModel), "initWithModel:", v8);
    v10 = objc_msgSend(objc_alloc((Class)AAUIOBWelcomeController), "initWithViewModel:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryButton"));
    objc_msgSend(v11, "addTarget:action:forEvents:", WeakRetained, "_goToAccountRecoverySettings", 64);

    objc_msgSend(v10, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained[6], "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    v12 = _AAUILogSystem(0);
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100007598();
  }

}

void sub_100006670(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc((Class)AACustodianshipInfo);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[5], "custodianshipInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "custodianID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[5], "custodianshipInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ownerHandle"));
    v7 = objc_msgSend(v2, "initWithID:status:ownerHandle:", v4, 2, v6);

    v8 = objc_msgSend(objc_alloc((Class)AAOBInheritanceInvitationModel), "initWithAcceptedViewForBenefactorInfo:", v7);
    v9 = objc_msgSend(objc_alloc((Class)AAUIOBInheritanceInvitationViewModel), "initWithModel:", v8);
    v10 = objc_msgSend(objc_alloc((Class)AAUIOBWelcomeController), "initWithViewModel:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryButton"));
    objc_msgSend(v11, "addTarget:action:forEvents:", WeakRetained, "_goToAccountBeneficiarySettings", 64);

    objc_msgSend(v10, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained[6], "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    v12 = _AAUILogSystem(0);
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000075C4();
  }

}

void sub_1000068D8(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];

  v3 = a2;
  v4 = a3;
  v5 = _AAUILogSystem(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100007650();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dismissed followup? %d", (uint8_t *)v8, 8u);
  }

}

void sub_100006AD8(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];

  v3 = a2;
  v4 = a3;
  v5 = _AAUILogSystem(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100007650();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dismissed followup? %d", (uint8_t *)v8, 8u);
  }

}

void sub_100006E54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100006E8C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
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
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_100006FB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043BC((void *)&_mh_execute_header, v0, v1, "Failed to build info from activity.", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_100006FE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043BC((void *)&_mh_execute_header, v0, v1, "Failed to find flow from info.", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_100007010()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043CC((void *)&_mh_execute_header, v0, v1, "Attempting to launch web browser with fallback URL...", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_10000703C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000043AC((void *)&_mh_execute_header, a2, a3, "displayInvitationUIWithUUID completed with error: %@", a5, a6, a7, a8, 2u);
}

void sub_1000070A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000043AC((void *)&_mh_execute_header, a2, a3, "presentInheritanceInvitationUIWithBeneficiaryID completed with error: %@", a5, a6, a7, a8, 2u);
}

void sub_10000710C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043BC((void *)&_mh_execute_header, v0, v1, "Welcome controller already being shown; ignoring",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000043A4();
}

void sub_100007138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_1000043AC((void *)&_mh_execute_header, v0, v1, "Failed to verify CDP for messages invitation - Error: %@", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_100007198()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043BC((void *)&_mh_execute_header, v0, v1, "Missing model data", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_1000071C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_1000043AC((void *)&_mh_execute_header, v0, v1, "Error returned unarchiving with model data: %@", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_100007224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043CC((void *)&_mh_execute_header, v0, v1, "LCInvite: Configuring View for pending Inheritance Invitation Model", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_100007250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043CC((void *)&_mh_execute_header, v0, v1, "LCInvite: Configuring View for non-pending Inheritance Invitation Model", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_10000727C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043CC((void *)&_mh_execute_header, v0, v1, "Providing means for custodianship acceptance.", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_1000072A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043CC((void *)&_mh_execute_header, v0, v1, "Providing means to decline custodianship for ineligible contact.", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_1000072D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043CC((void *)&_mh_execute_header, v0, v1, "Providing means for custodianship management.", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_100007300()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043CC((void *)&_mh_execute_header, v0, v1, "Showing Custodian Model", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_10000732C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_100006E54((void *)&_mh_execute_header, v0, v1, "Setting up look up connection with endpoint %@", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_10000738C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043CC((void *)&_mh_execute_header, v0, v1, "Setting up look up host proxy", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_1000073B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_1000043AC((void *)&_mh_execute_header, v0, v1, "Lookup for remote proxy object failed with rror %@", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_100007418()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_100006E54((void *)&_mh_execute_header, v0, v1, "%@ deallocated", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_100007478()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_1000043AC((void *)&_mh_execute_header, v0, v1, "Unable to repair manatee state with error: %@", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_1000074D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_1000043AC((void *)&_mh_execute_header, v0, v1, "Error occurred while responding to the Inheritance invite: %@", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_100007538()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_1000043AC((void *)&_mh_execute_header, v0, v1, "Error occurred while responding to the invite: %@", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_100007598()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043BC((void *)&_mh_execute_header, v0, v1, "Missing strongSelf. Not showing Custodian Invitation Accepted View", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_1000075C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000043DC();
  sub_1000043BC((void *)&_mh_execute_header, v0, v1, "Missing strongSelf. Not showing Inheritance Invitation Accepted View", v2, v3, v4, v5, v6);
  sub_1000043A4();
}

void sub_1000075F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100006E64();
  sub_100006E54((void *)&_mh_execute_header, v0, v1, "Dismissing followup with ID - %@", v2, v3, v4, v5, v6);
  sub_100006E4C();
}

void sub_100007650()
{
  uint64_t v0;
  os_log_t v1;

  sub_100006E70();
  sub_100006E8C((void *)&_mh_execute_header, v0, v1, "Dismissed followup? %d, with error: %@");
  sub_100006E4C();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__buildURLInfoFromActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_buildURLInfoFromActivity:");
}

id objc_msgSend__buildViewModelWithContextInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_buildViewModelWithContextInfo:");
}

id objc_msgSend__callCompletionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_callCompletionWithError:");
}

id objc_msgSend__checkManateeAvailabilityForFlowType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkManateeAvailabilityForFlowType:completion:");
}

id objc_msgSend__dismissAndExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissAndExit");
}

id objc_msgSend__dismissBeneficiaryInvitationReminderFollowUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissBeneficiaryInvitationReminderFollowUp");
}

id objc_msgSend__dismissCustodianInvitationReminderFollowUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissCustodianInvitationReminderFollowUp");
}

id objc_msgSend__handleMailImportURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleMailImportURL:");
}

id objc_msgSend__invalidateLookupConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateLookupConnection");
}

id objc_msgSend__openCustomDomainManageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openCustomDomainManageURL");
}

id objc_msgSend__openCustomDomainURL_domainState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openCustomDomainURL:domainState:");
}

id objc_msgSend__openPrivateEmailManageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openPrivateEmailManageURL");
}

id objc_msgSend__prepareMessagesInvitation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareMessagesInvitation");
}

id objc_msgSend__presentCustodianInvitationWithUUID_fallBackURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentCustodianInvitationWithUUID:fallBackURL:");
}

id objc_msgSend__presentInheritanceInvitationWithBeneficiaryID_fallBackURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentInheritanceInvitationWithBeneficiaryID:fallBackURL:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__respondToCustodianInvitationWithResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_respondToCustodianInvitationWithResponse:");
}

id objc_msgSend__respondToInheritanceInvitationWithResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_respondToInheritanceInvitationWithResponse:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setupRemoteProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupRemoteProxy");
}

id objc_msgSend__showCustodianInvitationAcceptedView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showCustodianInvitationAcceptedView");
}

id objc_msgSend__showInheritanceInvitationAcceptedView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showInheritanceInvitationAcceptedView");
}

id objc_msgSend__showInvitedAsFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showInvitedAsFlow");
}

id objc_msgSend_aa_errorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_errorWithCode:");
}

id objc_msgSend_aa_isAAErrorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_isAAErrorWithCode:");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_custodianID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "custodianID");
}

id objc_msgSend_custodianshipInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "custodianshipInfo");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissFollowUpWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissFollowUpWithIdentifier:completion:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayInvitationUIWithUUID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayInvitationUIWithUUID:completion:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_flowFinishedWithError_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flowFinishedWithError:completion:");
}

id objc_msgSend_handleUniversalLinkInUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUniversalLinkInUserActivity:");
}

id objc_msgSend_infoForComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoForComponents:");
}

id objc_msgSend_initWithAcceptedViewForBenefactorInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAcceptedViewForBenefactorInfo:");
}

id objc_msgSend_initWithCustodianID_didAccept_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCustodianID:didAccept:");
}

id objc_msgSend_initWithCustodianshipInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCustodianshipInfo:");
}

id objc_msgSend_initWithFlowContext_withPresentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFlowContext:withPresentingViewController:");
}

id objc_msgSend_initWithID_status_ownerHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithID:status:ownerHandle:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModel:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithViewModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithViewModel:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_notifyFlowCompletionToExitScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyFlowCompletionToExitScene");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openSessions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSessions");
}

id objc_msgSend_openURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withOptions:");
}

id objc_msgSend_ownerHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ownerHandle");
}

id objc_msgSend_prepareViewServiceForPresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareViewServiceForPresentation");
}

id objc_msgSend_presentInheritanceInvitationUIWithBeneficiaryID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentInheritanceInvitationUIWithBeneficiaryID:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_primaryButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryButton");
}

id objc_msgSend_remoteContextInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteContextInfo");
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectInterface");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_respondToCustodianRequestWithResponse_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondToCustodianRequestWithResponse:completion:");
}

id objc_msgSend_respondToInvitation_accepted_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondToInvitation:accepted:completion:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_secondaryButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryButton");
}

id objc_msgSend_sendResponseWithUnHandledEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponseWithUnHandledEvents:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAllowsSiri_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSiri:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
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

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisableFadeInAnimation:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setUpHostProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpHostProxy");
}

id objc_msgSend_setUpLookupConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpLookupConnection:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWelcomeController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWelcomeController:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_verifyAndRepairManateeWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyAndRepairManateeWithCompletion:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
