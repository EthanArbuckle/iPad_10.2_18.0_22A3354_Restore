void sub_230E9E1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E9E3F8(uint64_t a1)
{
  const void *v2;
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0.0, &responseFlags);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
    CFRelease(v2);
}

uint64_t sub_230E9E874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (!a2 || a3)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
}

void sub_230E9E89C(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BDB4200];
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = CFSTR("The account could not be verified because it does not have the necessary credentials.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  }
}

void sub_230E9ED40(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  char v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void (**v19)(_QWORD);
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  void (**v32)(_QWORD);
  id v33;
  char v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  char v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 == 3)
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_230EA086C(a1, v7, v8, v9, v10, v11, v12, v13);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_7;
  }
  if (a2 != 1)
  {
    v14 = (id *)(a1 + 32);
    v15 = objc_msgSend(*(id *)(a1 + 32), "isAuthenticated");
    v16 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_230E9F008;
    v35[3] = &unk_24FF9BEB8;
    v17 = *(id *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v36 = v17;
    v37 = v18;
    v38 = *(id *)(a1 + 32);
    v39 = *(id *)(a1 + 56);
    v41 = v15;
    v40 = *(id *)(a1 + 64);
    v19 = (void (**)(_QWORD))MEMORY[0x2348C6524](v35);
    if (a2 == 2)
    {
      _ACDLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_230EA0804(a1 + 32, v20, v21, v22, v23, v24, v25, v26);

    }
    else
    {
      if (objc_msgSend(*v14, "isAuthenticated"))
      {
        _ACDLogSystem();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *v14;
          *(_DWORD *)buf = 138412290;
          v43 = v28;
          _os_log_impl(&dword_230E9D000, v27, OS_LOG_TYPE_DEFAULT, "\"Yahoo! plugin marking account %@ as un-authenticated\"", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "setAuthenticated:", 0);
        v29 = *(void **)(a1 + 56);
        v30 = *(_QWORD *)(a1 + 32);
        v31[0] = v16;
        v31[1] = 3221225472;
        v31[2] = sub_230E9F0A0;
        v31[3] = &unk_24FF9BEE0;
        v34 = *(_BYTE *)(a1 + 72);
        v32 = v19;
        v33 = *(id *)(a1 + 64);
        objc_msgSend(v29, "saveAccount:withHandler:", v30, v31);

        goto LABEL_18;
      }
      if (!*(_BYTE *)(a1 + 72))
      {
        v19[2](v19);
        goto LABEL_18;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCredential:", v5);
  v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_7:
  v6();
LABEL_19:

}

void sub_230E9F008(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BDB4518]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_displayBadCredentialsAlertForAccount:clientName:reason:accountStore:resetAuthenticatedOnAlertFailure:handler:", v3, v5, v6, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

uint64_t sub_230E9F0A0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E9F2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_230E9F2D0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_230E9F2E0(uint64_t a1)
{

}

void sub_230E9F2E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDE98F0];
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithData:urlResponse:error:", v10, v9, v7);

  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218242;
    v18 = objc_msgSend(v11, "statusCode");
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_230E9D000, v12, OS_LOG_TYPE_DEFAULT, "\"Yahoo! legacy token exchange got status %ld error %{public}@\"", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(v11, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || objc_msgSend(v11, "statusCode") != 200)
    goto LABEL_7;
  objc_msgSend(v11, "loginToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "loginToken");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;
LABEL_7:

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_230E9F780(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDE9918];
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithData:urlResponse:error:", v10, v9, v7);

  objc_msgSend(v11, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || objc_msgSend(v11, "statusCode") != 200)
  {

  }
  else
  {
    objc_msgSend(v11, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _ACDLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v11, "statusCode");
        objc_msgSend(v11, "errorMessage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "data");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v40 = v15;
        v41 = 2114;
        v42 = v7;
        v43 = 2114;
        v44 = v16;
        v45 = 2112;
        v46 = v17;
        _os_log_impl(&dword_230E9D000, v14, OS_LOG_TYPE_DEFAULT, "\"Yahoo! token refresh did succeed with status %ld error %{public}@ errorMessage %{public}@ response data %@\"", buf, 0x2Au);

      }
      v18 = objc_alloc(MEMORY[0x24BDB4388]);
      objc_msgSend(v11, "token");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "oauthRefreshToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "expiryDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v18, "initWithOAuth2Token:refreshToken:expiryDate:", v19, v20, v21);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_33;
    }
  }
  if (objc_msgSend(v11, "statusCode") < 400 || objc_msgSend(v11, "statusCode") > 499)
  {
    objc_msgSend(v11, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27 && objc_msgSend(v11, "statusCode") != 200)
      goto LABEL_22;
    objc_msgSend(v11, "error");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(v11, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "code") == -1005)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v11, "error");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "code") == -1001)
      {

        goto LABEL_21;
      }
      objc_msgSend(v11, "error");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "domain");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "isEqualToString:", *MEMORY[0x24BDD1308]))
      {
        objc_msgSend(v11, "error");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "code");

        if (v36 != -1009)
        {
LABEL_30:
          _ACDLogSystem();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            sub_230EA0970();
          goto LABEL_32;
        }
LABEL_22:
        _ACDLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_230EA0A0C();
LABEL_32:

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        goto LABEL_33;
      }

    }
    goto LABEL_30;
  }
  _ACDLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_230EA08D4();

  objc_msgSend(*(id *)(a1 + 32), "setOauthRefreshToken:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setCredential:", *(_QWORD *)(a1 + 32));
  _ACDLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E9D000, v24, OS_LOG_TYPE_DEFAULT, "\"will clear Yahoo! credential.oauthRefreshToken\"", buf, 2u);
  }

  v26 = *(_QWORD *)(a1 + 40);
  v25 = *(void **)(a1 + 48);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = sub_230E9FC38;
  v37[3] = &unk_24FF9BF58;
  v38 = *(id *)(a1 + 56);
  objc_msgSend(v25, "saveAccount:withHandler:", v26, v37);

LABEL_33:
}

void sub_230E9FC38(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_230E9D000, v5, OS_LOG_TYPE_DEFAULT, "\"did clear Yahoo! credential.oauthRefreshToken with error %{public}@\"", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E9FE88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (*v23)(void);
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDE9900];
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithData:urlResponse:error:", v10, v9, v7);

  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134218242;
    v25 = objc_msgSend(v11, "statusCode");
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_230E9D000, v12, OS_LOG_TYPE_DEFAULT, "\"Yahoo! legacy token exchange got status %ld error %{public}@\"", (uint8_t *)&v24, 0x16u);
  }

  objc_msgSend(v11, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else if (objc_msgSend(v11, "statusCode") != 200)
  {
    v23 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_13;
  }
  objc_msgSend(v11, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || objc_msgSend(v11, "statusCode") != 200)
  {

LABEL_12:
    v23 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_13:
    v23();
    goto LABEL_14;
  }
  objc_msgSend(v11, "accessToken");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_12;
  v16 = (void *)v15;
  objc_msgSend(v11, "refreshToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_12;
  v18 = objc_alloc(MEMORY[0x24BDB4388]);
  objc_msgSend(v11, "accessToken");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refreshToken");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expiryDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithOAuth2Token:refreshToken:expiryDate:", v19, v20, v21);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_14:

}

void sub_230EA039C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint8_t buf[16];

  if (a3 == 3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "setAuthenticated:", 1);
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(a1 + 40);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_230EA057C;
      v13[3] = &unk_24FF9BFD0;
      v14 = *(id *)(a1 + 48);
      v15 = 2;
      objc_msgSend(v5, "saveAccount:withHandler:", v6, v13);

      return;
    }
  }
  else
  {
    if (a3)
    {
      _ACDLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E9D000, v7, OS_LOG_TYPE_DEFAULT, "\"User requested transfer to settings from Yahoo! authentication alert\"", buf, 2u);
      }

      v8 = (void *)MEMORY[0x24BDBCF48];
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("prefs:root=ACCOUNTS_AND_PASSWORDS&path=%@&%@=%@"), v10, CFSTR("slYahooAction"), CFSTR("showAuthSheet"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLWithString:", v11);
      v4 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "openSensitiveURL:withOptions:", v4, 0);

    }
    else
    {
      _ACDLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E9D000, v4, OS_LOG_TYPE_DEFAULT, "\"User cancelled out of Yahoo! authentication alert\"", buf, 2u);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_230EA057C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

Class sub_230EA058C(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!qword_255EAA2E0)
  {
    v4 = xmmword_24FF9C040;
    v5 = 0;
    qword_255EAA2E0 = _sl_dlopen();
  }
  if (!qword_255EAA2E0)
    sub_230EA0AA8(&v3);
  result = objc_getClass("MFAccountLoader");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_230EA0B24();
  qword_255EAA2D8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230EA06A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_230EA06CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_230EA06DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_230EA06F4(void *a1, const char *a2)
{
  return objc_msgSend(a1, "statusCode");
}

void sub_230EA06FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EA06DC(&dword_230E9D000, a2, a3, "\"%@ is entitled for all-account access. Returning Yahoo! credentials.\"", a5, a6, a7, a8, 2u);
  sub_230EA06EC();
}

void sub_230EA0760(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EA06DC(&dword_230E9D000, a2, a3, "\"%@ is a non-entitled client. No Yahoo! credential for you.\"", a5, a6, a7, a8, 2u);
  sub_230EA06EC();
}

void sub_230EA07C4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_230E9D000, log, OS_LOG_TYPE_DEBUG, "\"Yahoo! plugin can't renew Yahoo japan credentials.\"", v1, 2u);
}

void sub_230EA0804(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EA06CC(&dword_230E9D000, a2, a3, "\"Yahoo plugin: Unable to renew %@ because of a network issue.\"", a5, a6, a7, a8, 2u);
  sub_230EA06EC();
}

void sub_230EA086C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EA06CC(&dword_230E9D000, a2, a3, "\"Yahoo plugin: Unable to renew %@ because the keychain was locked.\"", a5, a6, a7, a8, 2u);
  sub_230EA06EC();
}

void sub_230EA08D4()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_230EA06BC();
  sub_230EA06F4(v1, v2);
  objc_msgSend(v0, "errorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230EA0668();
  sub_230EA06A8(&dword_230E9D000, v5, v6, "\"Yahoo! token refresh did fail with auth problem; status %ld error %{public}@ errorMessage %{public}@ response data %@\"",
    v7,
    v8,
    v9,
    v10,
    v11);

  sub_230EA0694();
}

void sub_230EA0970()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_230EA06BC();
  sub_230EA06F4(v1, v2);
  objc_msgSend(v0, "errorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230EA0668();
  sub_230EA06A8(&dword_230E9D000, v5, v6, "\"Yahoo! token refresh did fail with unknown issue; status %ld error %{public}@ errorMessage %{public}@ response data %@\"",
    v7,
    v8,
    v9,
    v10,
    v11);

  sub_230EA0694();
}

void sub_230EA0A0C()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_230EA06BC();
  sub_230EA06F4(v1, v2);
  objc_msgSend(v0, "errorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230EA0668();
  sub_230EA06A8(&dword_230E9D000, v5, v6, "\"Yahoo! token refresh did fail with network issue; status %ld error %{public}@ errorMessage %{public}@ response data %@\"",
    v7,
    v8,
    v9,
    v10,
    v11);

  sub_230EA0694();
}

void sub_230EA0AA8(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MessageLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SLYahooAuthenticationPlugin.m"), 52, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_230EA0B24()
{
  void *v0;
  void *v1;
  CFTypeRef v2;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMFAccountLoaderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SLYahooAuthenticationPlugin.m"), 53, CFSTR("Unable to find class %s"), "MFAccountLoader");

  __break(1u);
  CFRelease(v2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x24BE00EB0]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x24BDB4428]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

