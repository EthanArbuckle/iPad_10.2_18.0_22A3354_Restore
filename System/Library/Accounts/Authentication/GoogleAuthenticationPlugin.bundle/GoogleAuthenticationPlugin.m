void sub_230E8EEE0(uint64_t a1)
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

void sub_230E8F5B8(uint64_t a1, uint64_t a2, void *a3)
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
      sub_230E90E8C(a1, v7, v8, v9, v10, v11, v12, v13);

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
    v35[2] = sub_230E8F880;
    v35[3] = &unk_24FF99498;
    v17 = *(id *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v36 = v17;
    v37 = v18;
    v38 = *(id *)(a1 + 32);
    v39 = *(id *)(a1 + 56);
    v41 = v15;
    v40 = *(id *)(a1 + 64);
    v19 = (void (**)(_QWORD))MEMORY[0x2348C5E8C](v35);
    if (a2 == 2)
    {
      _ACDLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_230E90E20(a1 + 32, v20, v21, v22, v23, v24, v25, v26);

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
          _os_log_impl(&dword_230E8D000, v27, OS_LOG_TYPE_DEFAULT, "\"Google plugin marking account %@ as un-authenticated\"", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "setAuthenticated:", 0);
        v29 = *(void **)(a1 + 56);
        v30 = *(_QWORD *)(a1 + 32);
        v31[0] = v16;
        v31[1] = 3221225472;
        v31[2] = sub_230E8F918;
        v31[3] = &unk_24FF994C0;
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

void sub_230E8F880(uint64_t a1)
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

uint64_t sub_230E8F918(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E8FBF0(uint64_t a1, void *a2, void *a3, void *a4)
{
  char *v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDE98C0];
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithData:urlResponse:error:", v10, v9, v7);

  objc_msgSend(v11, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || objc_msgSend(v11, "statusCode") != 200)
  {

    goto LABEL_8;
  }
  objc_msgSend(v11, "token");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_8:
    if (objc_msgSend(v11, "statusCode") >= 400 && objc_msgSend(v11, "statusCode") <= 499)
    {
      _ACDLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_230E90EF8(v11, v7);
LABEL_29:

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_30;
    }
    objc_msgSend(v11, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23 && objc_msgSend(v11, "statusCode") != 200)
      goto LABEL_19;
    objc_msgSend(v11, "error");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(v11, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "code") == -1005)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v11, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "code") == -1001)
      {

        goto LABEL_18;
      }
      objc_msgSend(v11, "error");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "domain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BDD1308]))
      {
        objc_msgSend(v11, "error");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "code");

        if (v31 != -1009)
        {
LABEL_27:
          _ACDLogSystem();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_230E90F64(v11, v7);
          goto LABEL_29;
        }
LABEL_19:
        _ACDLogSystem();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_230E90FD0(v11, v7);
        goto LABEL_29;
      }

    }
    goto LABEL_27;
  }
  _ACDLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v33 = objc_msgSend(v11, "statusCode");
    v34 = 2114;
    v35 = v7;
    _os_log_impl(&dword_230E8D000, v14, OS_LOG_TYPE_DEFAULT, "\"Google token refresh did succeed; status %ld error %{public}@\"",
      buf,
      0x16u);
  }

  v15 = objc_alloc(MEMORY[0x24BDB4388]);
  objc_msgSend(v11, "token");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "oauthRefreshToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expiryDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithOAuth2Token:refreshToken:expiryDate:", v16, v17, v18);

  v20 = *(void **)(a1 + 40);
  objc_msgSend(v11, "grantedDataclasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccountProperty:forKey:", v21, *MEMORY[0x24BDB3F08]);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_30:

}

void sub_230E90120(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void (*v18)(void);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDE98B0];
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithData:urlResponse:error:", v10, v9, v7);

  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v31 = objc_msgSend(v11, "statusCode");
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_230E8D000, v12, OS_LOG_TYPE_DEFAULT, "\"Google legacy token exchange got status %ld error %{public}@\"", buf, 0x16u);
  }

  objc_msgSend(v11, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else if (objc_msgSend(v11, "statusCode") != 200)
  {
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_14;
  }
  objc_msgSend(v11, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || objc_msgSend(v11, "statusCode") != 200)
  {

    goto LABEL_12;
  }
  objc_msgSend(v11, "token");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_12:
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_14:
    v18();
    goto LABEL_15;
  }
  v16 = objc_alloc_init(MEMORY[0x24BDE98D0]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "defaultScope");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v19 = (void *)MEMORY[0x24BDE98A8];
  objc_msgSend(v11, "token");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "urlRequestForAuthCodeFromAuthToken:clientID:scope:", v20, v21, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_230E903E8;
  v26[3] = &unk_24FF99560;
  v23 = *(void **)(a1 + 32);
  v29 = *(id *)(a1 + 40);
  v27 = v16;
  v28 = *(id *)(a1 + 32);
  v24 = v16;
  objc_msgSend(v23, "dataTaskWithRequest:completionHandler:", v22, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "resume");

LABEL_15:
}

void sub_230E903E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (*v25)(void);
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDE98A0];
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithData:urlResponse:error:", v10, v9, v7);

  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v29 = objc_msgSend(v11, "statusCode");
    v30 = 2114;
    v31 = v7;
    _os_log_impl(&dword_230E8D000, v12, OS_LOG_TYPE_DEFAULT, "\"Google auth token exchange got status %ld error %{public}@\"", buf, 0x16u);
  }

  objc_msgSend(v11, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else if (objc_msgSend(v11, "statusCode") != 200)
  {
    v25 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_13;
  }
  objc_msgSend(v11, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || objc_msgSend(v11, "statusCode") != 200)
  {

    goto LABEL_11;
  }
  objc_msgSend(v11, "code");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_11:
    v25 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_13:
    v25();
    goto LABEL_14;
  }
  v16 = (void *)MEMORY[0x24BDE98B8];
  objc_msgSend(*(id *)(a1 + 32), "clientID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientSecret");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientRedirect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "code");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tokenURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "urlRequestForClientID:secret:redirectURI:authCode:tokenURL:codeVerifier:", v17, v18, v19, v20, v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_230E90698;
  v26[3] = &unk_24FF99538;
  v23 = *(void **)(a1 + 40);
  v27 = *(id *)(a1 + 48);
  objc_msgSend(v23, "dataTaskWithRequest:completionHandler:", v22, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resume");

LABEL_14:
}

void sub_230E90698(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (*v21)(void);
  int v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDE98C0];
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithData:urlResponse:error:", v10, v9, v7);

  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134218242;
    v23 = objc_msgSend(v11, "statusCode");
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_230E8D000, v12, OS_LOG_TYPE_DEFAULT, "\"Google auth code exchange got status %ld error %{public}@\"", (uint8_t *)&v22, 0x16u);
  }

  objc_msgSend(v11, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else if (objc_msgSend(v11, "statusCode") != 200)
  {
    v21 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_13;
  }
  objc_msgSend(v11, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || objc_msgSend(v11, "statusCode") != 200)
  {

    goto LABEL_11;
  }
  objc_msgSend(v11, "token");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_11:
    v21 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_13:
    v21();
    goto LABEL_14;
  }
  v16 = objc_alloc(MEMORY[0x24BDB4388]);
  objc_msgSend(v11, "token");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refreshToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expiryDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithOAuth2Token:refreshToken:expiryDate:", v17, v18, v19);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_14:

}

void sub_230E90BE0(uint64_t a1, uint64_t a2, uint64_t a3)
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
      v13[2] = sub_230E90DC0;
      v13[3] = &unk_24FF995B0;
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
        _os_log_impl(&dword_230E8D000, v7, OS_LOG_TYPE_DEFAULT, "\"User requested transfer to settings from Google authentication alert\"", buf, 2u);
      }

      v8 = (void *)MEMORY[0x24BDBCF48];
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("prefs:root=ACCOUNTS_AND_PASSWORDS&path=%@&%@=%@"), v10, CFSTR("slGoogleAction"), CFSTR("showAuthSheet"));
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
        _os_log_impl(&dword_230E8D000, v4, OS_LOG_TYPE_DEFAULT, "\"User cancelled out of Google authentication alert\"", buf, 2u);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_230E90DC0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_230E90DD0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_230E90E08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_230E90E18(void *a1, const char *a2)
{
  return objc_msgSend(a1, "statusCode");
}

void sub_230E90E20(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230E90E08(&dword_230E8D000, a2, a3, "\"Google plugin: Unable to renew %@ because of an network issue.\"", a5, a6, a7, a8, 2u);
}

void sub_230E90E8C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230E90E08(&dword_230E8D000, a2, a3, "\"Google plugin: Unable to renew %@ because the keychain was locked.\"", a5, a6, a7, a8, 2u);
}

void sub_230E90EF8(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_230E90E18(a1, a2);
  sub_230E90DE4();
  sub_230E90DD0(&dword_230E8D000, v2, v3, "\"Google token refresh did fail with auth problem; status %ld error %{public}@\"",
    v4,
    v5,
    v6,
    v7,
    v8);
  sub_230E90DFC();
}

void sub_230E90F64(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_230E90E18(a1, a2);
  sub_230E90DE4();
  sub_230E90DD0(&dword_230E8D000, v2, v3, "\"Google token refresh did fail with unknown issue; status %ld error %{public}@\"",
    v4,
    v5,
    v6,
    v7,
    v8);
  sub_230E90DFC();
}

void sub_230E90FD0(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_230E90E18(a1, a2);
  sub_230E90DE4();
  sub_230E90DD0(&dword_230E8D000, v2, v3, "\"Google token refresh did fail with network issue; status %ld error %{public}@\"",
    v4,
    v5,
    v6,
    v7,
    v8);
  sub_230E90DFC();
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

