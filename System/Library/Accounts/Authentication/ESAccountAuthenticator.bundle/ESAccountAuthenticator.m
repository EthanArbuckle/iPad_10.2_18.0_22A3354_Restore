uint64_t sub_230E8282C(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = objc_alloc(MEMORY[0x24BDD17F0]);
  v4 = objc_msgSend_initWithTarget_selector_object_(v2, v3, *(_QWORD *)(a1 + 32), sel_parkBackgroundThread_, 0);
  v5 = (void *)qword_255EA9EE0;
  qword_255EA9EE0 = v4;

  return MEMORY[0x24BEDD108](qword_255EA9EE0, sel_start, v6);
}

uint64_t sub_230E82F38(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_discoverInitialPropertiesWithConsumer_, *(_QWORD *)(a1 + 40));
}

void sub_230E832A0(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_230E81000, v2, v3, "Delaying release of account %@ by terrible means", (uint8_t *)&v5, 0xCu);
  }

}

void sub_230E83748(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  char isAuthenticated;
  uint64_t v7;
  id v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  void *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  os_log_type_t v47;
  void *v48;
  const char *v49;
  NSObject *v50;
  os_log_type_t v51;
  void *v52;
  NSObject *v53;
  os_log_type_t v54;
  void *v55;
  const char *v56;
  void *v57;
  uint64_t v58;
  const char *v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  char v65;
  _QWORD v66[4];
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  char v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  if (a2 == (const char *)1)
  {
    objc_msgSend_setCredential_(v4, (const char *)1, a3);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, 0);
    return;
  }
  isAuthenticated = objc_msgSend_isAuthenticated(v4, a2, a3);
  v7 = MEMORY[0x24BDAC760];
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = sub_230E83D88;
  v71[3] = &unk_24FF97ED8;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v72 = v8;
  v73 = v9;
  v74 = *(id *)(a1 + 32);
  v75 = *(id *)(a1 + 56);
  v77 = isAuthenticated;
  v76 = *(id *)(a1 + 64);
  v12 = (void *)MEMORY[0x2348C5C58](v71);
  if (a2 == (const char *)2)
  {
    if (!*(_BYTE *)(a1 + 72))
    {
      DALoggingwithCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (!os_log_type_enabled(v13, v14))
      {
LABEL_22:

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        goto LABEL_23;
      }
      v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v79 = v15;
      v16 = "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@ Networking Error";
LABEL_21:
      _os_log_impl(&dword_230E81000, v13, v14, v16, buf, 0xCu);
      goto LABEL_22;
    }
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 72))
  {
LABEL_8:
    if (!objc_msgSend_migrationStatus(*(void **)(a1 + 32), v10, v11))
      objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v17, 3);
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v18, v19))
    {
      v22 = *(void **)(a1 + 32);
      objc_msgSend_migrationStatusString(v22, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v79 = v22;
      v80 = 2048;
      v81 = a2;
      v82 = 2112;
      v83 = v23;
      _os_log_impl(&dword_230E81000, v18, v19, "Authenticator FAILED to migrate the account %@, saving with status %lu, migration state: %@", buf, 0x20u);

    }
    v24 = *(void **)(a1 + 56);
    v25 = *(void **)(a1 + 32);
    v66[0] = v7;
    v66[1] = 3221225472;
    v66[2] = sub_230E83E20;
    v66[3] = &unk_24FF97F00;
    v26 = v25;
    v27 = *(_QWORD *)(a1 + 48);
    v28 = *(void **)(a1 + 56);
    v67 = v26;
    v68 = v27;
    v69 = v28;
    v70 = *(id *)(a1 + 64);
    objc_msgSend_saveAccount_withHandler_(v24, v29, (uint64_t)v26, v66);

    v30 = v67;
    goto LABEL_13;
  }
  if (!objc_msgSend_isAuthenticated(*(void **)(a1 + 32), v10, v11))
  {
    if (!*(_BYTE *)(a1 + 73))
    {
      v40 = *MEMORY[0x24BE2FDD0];
      objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v31, *MEMORY[0x24BE2FDD0]);
      v41 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__currentDateString(*(void **)(a1 + 48), v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      DALoggingwithCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = MEMORY[0x24BE2AD38];
      v47 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
      if (os_log_type_enabled(v45, v47))
      {
        v48 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v79 = v48;
        v80 = 2112;
        v81 = v41;
        v82 = 2112;
        v83 = v44;
        _os_log_impl(&dword_230E81000, v45, v47, "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Last prompt date %@. Current date %@", buf, 0x20u);
      }

      if (v41 && objc_msgSend_isEqualToString_(v44, v49, (uint64_t)v41))
      {
        DALoggingwithCategory();
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = *(_BYTE *)(v46 + 3);
        if (os_log_type_enabled(v50, v51))
        {
          v52 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v79 = v52;
          _os_log_impl(&dword_230E81000, v50, v51, "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Not presenting an Auth prompt.", buf, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
      else
      {
        DALoggingwithCategory();
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = *(_BYTE *)(v46 + 3);
        if (os_log_type_enabled(v53, v54))
        {
          v55 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v79 = v55;
          _os_log_impl(&dword_230E81000, v53, v54, "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Presenting an Auth prompt.", buf, 0xCu);
        }

        objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v56, (uint64_t)v44, v40);
        v57 = *(void **)(a1 + 56);
        v58 = *(_QWORD *)(a1 + 32);
        v60[0] = v7;
        v60[1] = 3221225472;
        v60[2] = sub_230E83F64;
        v60[3] = &unk_24FF97F50;
        v61 = v12;
        objc_msgSend_saveAccount_withHandler_(v57, v59, v58, v60);

      }
      goto LABEL_23;
    }
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (!os_log_type_enabled(v13, v14))
      goto LABEL_22;
    v39 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v79 = v39;
    v16 = "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Reporting Credential failed error back.";
    goto LABEL_21;
  }
  DALoggingwithCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v32, v33))
  {
    v34 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v79 = v34;
    _os_log_impl(&dword_230E81000, v32, v33, "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Marking Account as UnAuthenticated and Saving.", buf, 0xCu);
  }

  objc_msgSend_setAuthenticated_(*(void **)(a1 + 32), v35, 0);
  v36 = *(void **)(a1 + 56);
  v37 = *(_QWORD *)(a1 + 32);
  v62[0] = v7;
  v62[1] = 3221225472;
  v62[2] = sub_230E83F3C;
  v62[3] = &unk_24FF97F28;
  v65 = *(_BYTE *)(a1 + 73);
  v63 = v12;
  v64 = *(id *)(a1 + 64);
  objc_msgSend_saveAccount_withHandler_(v36, v38, v37, v62);

  v30 = v63;
LABEL_13:

LABEL_23:
}

void sub_230E83D88(uint64_t a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), a2, *MEMORY[0x24BDB4518]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend_client(*(void **)(a1 + 56), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedAppName(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__displayBadCredentialsAlertForAccount_clientName_reason_accountStore_resetAuthenticatedOnAlertFailure_handler_(v3, v11, v4, v10, v12, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

void sub_230E83E20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  const __CFString *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = CFSTR("with");
    if (!v4)
      v7 = CFSTR("without");
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_230E81000, v5, v6, "Account saved %@ error: %@", (uint8_t *)&v11, 0x16u);
  }

  if (objc_msgSend_migrationStatus(*(void **)(a1 + 32), v8, v9) == 1)
    objc_msgSend__displayMigrationPendingAlertForAccount_accountStore_handler_(*(void **)(a1 + 40), v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t sub_230E83F3C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_230E83F64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E845A8(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  objc_msgSend_openIDrequestURLFor_(MEMORY[0x24BE2A440], a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend__setNonAppInitiated_(v6, v7, 1);
  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x24BDD1858], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  objc_msgSend_identifier(*(void **)(a1 + 48), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__assignConnectionPropertiesToSessionConfiguration_withAccountId_(v11, v15, (uint64_t)v10, v14);

  objc_msgSend_sessionWithConfiguration_(MEMORY[0x24BDD1850], v16, (uint64_t)v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_230E846C8;
  v22[3] = &unk_24FF97FA0;
  v23 = *(id *)(a1 + 56);
  objc_msgSend_dataTaskWithRequest_completionHandler_(v17, v18, (uint64_t)v6, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resume(v19, v20, v21);

}

void sub_230E846C8(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;

  v7 = (objc_class *)MEMORY[0x24BE2A448];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = [v7 alloc];
  v35 = (id)objc_msgSend_initWithData_urlResponse_error_(v11, v12, (uint64_t)v10, v9, v8);

  objc_msgSend_error(v35, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    goto LABEL_2;
  objc_msgSend_tokenRequestURI(v35, v15, v16);
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_3;
  v17 = (void *)v22;
  objc_msgSend_jwksURI(v35, v18, v19);
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
LABEL_2:

  }
  else
  {
    v26 = (void *)v23;
    objc_msgSend_issuer(v35, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = *(_QWORD *)(a1 + 32);
      objc_msgSend_tokenRequestURI(v35, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_jwksURI(v35, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_issuer(v35, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v28 + 16))(v28, v21, v31, v34, 0);

      goto LABEL_4;
    }
  }
LABEL_3:
  v20 = *(_QWORD *)(a1 + 32);
  objc_msgSend_error(v35, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, 0, v21);
LABEL_4:

}

void sub_230E8492C(uint64_t a1)
{
  id v2;
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;

  v2 = objc_alloc(MEMORY[0x24BDD16B0]);
  v3 = objc_alloc(MEMORY[0x24BDBCF48]);
  v5 = (void *)objc_msgSend_initWithString_(v3, v4, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_msgSend_initWithURL_(v2, v6, (uint64_t)v5);

  objc_msgSend__setNonAppInitiated_(v7, v8, 1);
  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x24BDD1858], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  objc_msgSend_identifier(*(void **)(a1 + 48), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__assignConnectionPropertiesToSessionConfiguration_withAccountId_(v12, v16, (uint64_t)v11, v15);

  objc_msgSend_sessionWithConfiguration_(MEMORY[0x24BDD1850], v17, (uint64_t)v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_230E84A64;
  v23[3] = &unk_24FF97FA0;
  v24 = *(id *)(a1 + 56);
  objc_msgSend_dataTaskWithRequest_completionHandler_(v18, v19, (uint64_t)v7, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resume(v20, v21, v22);

}

uint64_t sub_230E84A64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E84B70(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  objc_msgSend_emptyBearerRequestForHost_(MEMORY[0x24BE2A450], a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend__setNonAppInitiated_(v6, v7, 1);
  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x24BDD1858], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  objc_msgSend_identifier(*(void **)(a1 + 48), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__assignConnectionPropertiesToSessionConfiguration_withAccountId_(v11, v15, (uint64_t)v10, v14);

  objc_msgSend_sessionWithConfiguration_(MEMORY[0x24BDD1850], v16, (uint64_t)v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_230E84C90;
  v22[3] = &unk_24FF97FA0;
  v23 = *(id *)(a1 + 56);
  objc_msgSend_dataTaskWithRequest_completionHandler_(v17, v18, (uint64_t)v6, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resume(v19, v20, v21);

}

void sub_230E84C90(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = (objc_class *)MEMORY[0x24BE2A458];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = [v7 alloc];
  v17 = (id)objc_msgSend_initWithData_urlResponse_error_(v11, v12, (uint64_t)v10, v9, v8);

  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend_authURI(v17, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v16, v8);

}

void sub_230E85648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_230E8569C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  char v31;
  const char *v32;
  uint64_t v33;
  __CFString *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  os_log_type_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  int isTransientNetworkError;
  NSObject *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  const char *v52;
  uint64_t v53;
  void (*v54)(void);
  NSObject *v55;
  os_log_type_t v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  void *v65;
  const char *v66;
  int isEqualToString;
  NSObject *v68;
  _BOOL4 v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  const char *v83;
  const char *v84;
  NSObject *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  int v94;
  const char *v95;
  NSObject *v96;
  os_log_type_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  const char *v112;
  NSObject *v113;
  os_log_type_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  NSObject *v119;
  const char *v120;
  uint64_t v121;
  id v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  void *refreshed;
  void *v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  __CFString *v136;
  const char *v137;
  NSObject *v138;
  _QWORD v139[4];
  id v140;
  _QWORD v141[4];
  id v142;
  _QWORD v143[4];
  id v144;
  id v145;
  uint64_t v146;
  __CFString *v147;
  id v148;
  uint64_t v149;
  uint8_t buf[4];
  id v151;
  __int16 v152;
  uint64_t v153;
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BE2A430];
  v9 = a3;
  v10 = a2;
  v11 = [v8 alloc];
  v13 = (void *)objc_msgSend_initWithData_urlResponse_error_(v11, v12, (uint64_t)v10, v9, v7);

  objc_msgSend_error(v13, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 || objc_msgSend_statusCode(v13, v16, v17) != 200)
  {

    goto LABEL_8;
  }
  objc_msgSend_accessToken(v13, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21
    || (v24 = (void *)v21,
        objc_msgSend_idToken(v13, v22, v23),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        !v25))
  {
LABEL_8:
    if (objc_msgSend_statusCode(v13, v22, v23) >= 400 && objc_msgSend_statusCode(v13, v35, v36) <= 499)
    {
      if (objc_msgSend_migrationStatus(*(void **)(a1 + 32), v35, v36))
      {
        v39 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
      }
      else
      {
        objc_msgSend_errorName(v13, v37, v38);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v65, v66, (uint64_t)CFSTR("invalid_grant"));

        DALoggingwithCategory();
        v68 = objc_claimAutoreleasedReturnValue();
        v39 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
        v69 = os_log_type_enabled(v68, v39);
        if (isEqualToString)
        {
          if (v69)
          {
            objc_msgSend_errorName(v13, v70, v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorMessage(v13, v73, v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v151 = v72;
            v152 = 2112;
            v153 = (uint64_t)v75;
            _os_log_impl(&dword_230E81000, v68, v39, "Received an invalid_grant error. %@ %@", buf, 0x16u);

          }
          DALoggingwithCategory();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, v39))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230E81000, v76, v39, "Switching migration status from 'Attempting' to 'Pending'", buf, 2u);
          }

          objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v77, 1);
        }
        else
        {
          if (v69)
          {
            objc_msgSend_errorName(v13, v70, v71);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorMessage(v13, v79, v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v151 = v78;
            v152 = 2112;
            v153 = (uint64_t)v81;
            _os_log_impl(&dword_230E81000, v68, v39, "Received an error. %@ %@", buf, 0x16u);

          }
          DALoggingwithCategory();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, v39))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230E81000, v82, v39, "Switching migration status from 'Attempting' to 'Failure'", buf, 2u);
          }

          objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v83, 3);
        }
      }
      objc_msgSend_setOauthRefreshToken_(*(void **)(a1 + 48), v37, 0);
      objc_msgSend_setCredential_(*(void **)(a1 + 32), v84, *(_QWORD *)(a1 + 48));
      DALoggingwithCategory();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, v39))
      {
        *(_DWORD *)buf = 138412290;
        v151 = v7;
        _os_log_impl(&dword_230E81000, v85, v39, "Received an Error: refreshing OAuth Token failed with Error %@", buf, 0xCu);
      }

      v86 = *(_QWORD *)(a1 + 32);
      v141[0] = MEMORY[0x24BDAC760];
      v141[1] = 3221225472;
      v141[2] = sub_230E86A94;
      v141[3] = &unk_24FF97F50;
      v87 = *(void **)(a1 + 56);
      v142 = *(id *)(a1 + 64);
      objc_msgSend_saveAccount_withHandler_(v87, v88, v86, v141);
      v64 = v142;
LABEL_45:

      goto LABEL_46;
    }
    objc_msgSend_error(v13, v35, v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {

    }
    else if (objc_msgSend_statusCode(v13, v41, v42) != 200)
    {
      DALoggingwithCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
      if (os_log_type_enabled(v55, v56))
      {
        *(_DWORD *)buf = 138412290;
        v151 = v7;
        _os_log_impl(&dword_230E81000, v55, v56, "Received a response.error nil and response.status != 200. refreshing OAuth Token failed with Error %@", buf, 0xCu);
      }

      if (!objc_msgSend_migrationStatus(*(void **)(a1 + 32), v57, v58))
      {
        DALoggingwithCategory();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, v56))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230E81000, v59, v56, "Switching migration status from 'Attempting' to 'Failure'", buf, 2u);
        }

        objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v60, 3);
      }
      v61 = *(_QWORD *)(a1 + 32);
      v139[0] = MEMORY[0x24BDAC760];
      v139[1] = 3221225472;
      v139[2] = sub_230E86AA8;
      v139[3] = &unk_24FF97F50;
      v62 = *(void **)(a1 + 56);
      v140 = *(id *)(a1 + 64);
      objc_msgSend_saveAccount_withHandler_(v62, v63, v61, v139);
      v64 = v140;
      goto LABEL_45;
    }
    v45 = *(void **)(a1 + 40);
    objc_msgSend_error(v13, v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    isTransientNetworkError = objc_msgSend__isTransientNetworkError_(v45, v47, (uint64_t)v46);

    DALoggingwithCategory();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
    v51 = os_log_type_enabled(v49, v50);
    if (isTransientNetworkError)
    {
      if (v51)
      {
        *(_DWORD *)buf = 138412290;
        v151 = v7;
        _os_log_impl(&dword_230E81000, v49, v50, "Received a Transient Network Error: refreshing OAuth Token failed with Error %@", buf, 0xCu);
      }

      v54 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      goto LABEL_23;
    }
    if (v51)
    {
      *(_DWORD *)buf = 138412546;
      v151 = v7;
      v152 = 2048;
      v153 = objc_msgSend_code(v7, v52, v53);
      _os_log_impl(&dword_230E81000, v49, v50, "Received a unknown error %@ with code %ld. Failing Token refresh", buf, 0x16u);
    }

LABEL_22:
    v54 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_23:
    v54();
    goto LABEL_46;
  }
  objc_msgSend_accountType(*(void **)(a1 + 32), v22, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_isEqualToString_(v29, v30, *MEMORY[0x24BDB4078]);

  if ((v31 & 1) == 0)
  {
    objc_msgSend_accountType(*(void **)(a1 + 32), v32, v33);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_isEqualToString_(v92, v93, *MEMORY[0x24BDB4030]);

    if (v94)
    {
      if (*(_BYTE *)(a1 + 80))
      {
        objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v95, *MEMORY[0x24BE2FDC0]);
      }
      else
      {
        v104 = objc_msgSend__accountOAuthVersion_(*(void **)(a1 + 40), v95, *(_QWORD *)(a1 + 32));
        v106 = *MEMORY[0x24BE2FDC0];
        if (v104 != 1)
        {
          v107 = (void *)MEMORY[0x24BE2A418];
          objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v105, *MEMORY[0x24BE2FDC0]);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_upgradeAuthorizationEndpoint_(v107, v109, (uint64_t)v108);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v111, (uint64_t)v110, v106);

          objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v112, (uint64_t)CFSTR("2"), *MEMORY[0x24BE2FDC8]);
        }
        objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v105, v106);
      }
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v34)
        goto LABEL_57;
      v97 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    }
    else
    {
      DALoggingwithCategory();
      v96 = objc_claimAutoreleasedReturnValue();
      v97 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v96, v97))
      {
        objc_msgSend_accountType(*(void **)(a1 + 32), v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v100, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v151 = v103;
        _os_log_impl(&dword_230E81000, v96, v97, "Account type is neither Hotmail nor Exchange. Account type: %@", buf, 0xCu);

      }
    }
    DALoggingwithCategory();
    v138 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v138, v97))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E81000, v138, v97, "Cannot refresh token for account. oauthURI is nil.", buf, 2u);
    }

    goto LABEL_22;
  }
  v34 = CFSTR("https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize/");
LABEL_57:
  if (*(_BYTE *)(a1 + 80))
  {
    DALoggingwithCategory();
    v113 = objc_claimAutoreleasedReturnValue();
    v114 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v113, v114))
    {
      v115 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v151 = v115;
      _os_log_impl(&dword_230E81000, v113, v114, "Successfully refreshed the OAuth token for on prem OAuth account %@", buf, 0xCu);
    }

    objc_msgSend_refreshToken(v13, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v118)
    {
      DALoggingwithCategory();
      v119 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, v114))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E81000, v119, v114, "Refresh OAuth token response does not contain a refresh token. Keeping the previous refresh token.", buf, 2u);
      }

      objc_msgSend_oauthRefreshToken(*(void **)(a1 + 48), v120, v121);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v122 = objc_alloc(MEMORY[0x24BDB4388]);
    objc_msgSend_accessToken(v13, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expiryDate(v13, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    refreshed = (void *)objc_msgSend_initWithOAuth2Token_refreshToken_expiryDate_(v122, v129, (uint64_t)v125, v118, v128);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v132 = *(_QWORD *)(a1 + 32);
    v131 = *(void **)(a1 + 40);
    v143[0] = MEMORY[0x24BDAC760];
    v143[1] = 3221225472;
    v143[2] = sub_230E860D0;
    v143[3] = &unk_24FF98018;
    v148 = *(id *)(a1 + 64);
    v144 = *(id *)(a1 + 32);
    v133 = v13;
    v134 = *(_QWORD *)(a1 + 40);
    v145 = v133;
    v146 = v134;
    v135 = *(_QWORD *)(a1 + 72);
    v147 = v34;
    v149 = v135;
    v136 = v34;
    objc_msgSend__retrieveOpenIDMetadataForAccount_fromURI_withCompletion_(v131, v137, v132, v136, v143);

  }
LABEL_46:

}

void sub_230E860D0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  char isEqualToString;
  const char *v28;
  uint64_t v29;
  os_log_type_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  char v36;
  const char *v37;
  void *v38;
  const char *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  NSObject *v48;
  os_log_type_t v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *refreshed;
  const char *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  const char *v81;
  os_log_type_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  void *v91;
  void *v92;
  __int128 v93;
  void *v94;
  void *v95;
  _QWORD v96[4];
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint64_t v105;
  __int128 v106;
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v14 = a5;
  if (v14)
  {
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (!os_log_type_enabled(v15, v16))
    {
LABEL_5:

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_6;
    }
    v17 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v108 = v17;
    v109 = 2112;
    v110 = v14;
    v18 = "Couldn't retrieve OpenID metadata from URI: %@ Error: %@";
    v19 = v15;
    v20 = v16;
    v21 = 22;
LABEL_4:
    _os_log_impl(&dword_230E81000, v19, v20, v18, buf, v21);
    goto LABEL_5;
  }
  if (!v10)
  {
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v30 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (!os_log_type_enabled(v15, v30))
      goto LABEL_5;
    *(_WORD *)buf = 0;
    v18 = "Cannot refresh token for account. jwksURI is nil.";
    v19 = v15;
    v20 = v30;
    v21 = 2;
    goto LABEL_4;
  }
  objc_msgSend_accountType(*(void **)(a1 + 32), v12, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v25, v26, *MEMORY[0x24BDB4030]);

  if ((isEqualToString & 1) != 0)
  {
    objc_msgSend_clientIDForOAuthType_(MEMORY[0x24BE2A410], v28, 1);
  }
  else
  {
    objc_msgSend_accountType(*(void **)(a1 + 32), v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_isEqualToString_(v34, v35, *MEMORY[0x24BDB4078]);

    if ((v36 & 1) == 0)
    {
      DALoggingwithCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      v82 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v15, v82))
      {
        v85 = *(void **)(a1 + 32);
        objc_msgSend_accountType(v85, v83, v84);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v95, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v108 = v85;
        v109 = 2112;
        v110 = v88;
        _os_log_impl(&dword_230E81000, v15, v82, "Could not find account identifier %@ for account %@", buf, 0x16u);

      }
      goto LABEL_5;
    }
    objc_msgSend_clientIDForOAuthType_(MEMORY[0x24BE2A410], v37, 0);
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v39, *MEMORY[0x24BE2FD88]);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc(MEMORY[0x24BE2A420]);
  objc_msgSend_idToken(*(void **)(a1 + 40), v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_initWithIdToken_(v40, v44, (uint64_t)v43);

  if (objc_msgSend__jwksDataCacheValidForAccount_(*(void **)(a1 + 48), v46, *(_QWORD *)(a1 + 32))
    && objc_msgSend_idTokenValidWithJWKS_withAudience_withIssuer_(v45, v47, (uint64_t)v94, v38, v11))
  {
    v92 = v38;
    DALoggingwithCategory();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v48, v49))
    {
      v50 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v108 = v50;
      _os_log_impl(&dword_230E81000, v48, v49, "Successfully refreshed the OAuth token for Account %@", buf, 0xCu);
    }

    v51 = objc_alloc(MEMORY[0x24BDB4388]);
    objc_msgSend_accessToken(*(void **)(a1 + 40), v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refreshToken(*(void **)(a1 + 40), v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expiryDate(*(void **)(a1 + 40), v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    refreshed = (void *)objc_msgSend_initWithOAuth2Token_refreshToken_expiryDate_(v51, v61, (uint64_t)v54, v57, v60);

    if (!v11 || !v9 || !*(_QWORD *)(a1 + 56) || !v94)
    {
      objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v63, v64);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v89, v90, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), CFSTR("ESAccountAuthenticator.m"), 541, CFSTR("We have used these objects to fetch and verify the tokens, neither of these should be empty"));

    }
    v91 = v45;
    if ((unint64_t)objc_msgSend_migrationStatus(*(void **)(a1 + 32), v63, v64) <= 1)
    {
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v65, MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2ABB0]);
      objc_msgSend_username(*(void **)(a1 + 32), v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v69, (uint64_t)v68, *MEMORY[0x24BDB3F30]);

      objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v70, 2);
    }
    v71 = *(void **)(a1 + 32);
    v72 = *(void **)(a1 + 48);
    v73 = *(_QWORD *)(a1 + 56);
    objc_msgSend_objectForKeyedSubscript_(v71, v65, *MEMORY[0x24BE2FD98]);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__addPropertiesToAccount_oauthURI_tokenRequestURI_jwksURI_issuer_oauthVersion_jwksData_jwksDataCacheDate_(v72, v75, (uint64_t)v71, v73, v9, v10, v11, CFSTR("2"), v94, v74);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v45 = v91;
    v38 = v92;
  }
  else
  {
    v76 = *(void **)(a1 + 48);
    v77 = *(_QWORD *)(a1 + 32);
    v96[0] = MEMORY[0x24BDAC760];
    v96[1] = 3221225472;
    v96[2] = sub_230E8670C;
    v96[3] = &unk_24FF97FF0;
    v97 = v45;
    v98 = v38;
    v99 = v11;
    v100 = *(id *)(a1 + 32);
    v101 = *(id *)(a1 + 40);
    v102 = *(id *)(a1 + 56);
    v103 = v9;
    v78 = v10;
    v79 = *(_QWORD *)(a1 + 48);
    v104 = v78;
    v105 = v79;
    v93 = *(_OWORD *)(a1 + 64);
    v80 = (id)v93;
    v106 = v93;
    objc_msgSend__retrieveJWKSDataForAccount_fromURI_withCompletion_(v76, v81, v77, v78, v96);

    refreshed = v97;
  }

LABEL_6:
}

void sub_230E8670C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  int v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *refreshed;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  if (v7)
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      v10 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 138412546;
      v58 = v10;
      v59 = 2112;
      v60 = v7;
      v11 = "Couldn't retrieve JWKS data from URI: %@ Error: %@";
      v12 = v8;
      v13 = v9;
      v14 = 22;
LABEL_17:
      _os_log_impl(&dword_230E81000, v12, v13, v11, buf, v14);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v15 = objc_msgSend_idTokenValidWithJWKS_withAudience_withIssuer_(*(void **)(a1 + 32), v6, (uint64_t)v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v15)
  {
    v52 = *(unsigned __int8 *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v16, *(os_log_type_t *)(MEMORY[0x24BE2AD38] + 3)))
    {
      *(_WORD *)buf = 0;
      v11 = "Could not validate the id_token received from the server";
      v12 = v8;
      v13 = v52;
      v14 = 2;
      goto LABEL_17;
    }
LABEL_18:

    (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
    goto LABEL_19;
  }
  v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v16, v17))
  {
    v18 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    v58 = v18;
    _os_log_impl(&dword_230E81000, v8, v17, "Successfully refreshed the OAuth token for Account %@", buf, 0xCu);
  }

  v19 = objc_alloc(MEMORY[0x24BDB4388]);
  objc_msgSend_accessToken(*(void **)(a1 + 64), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_refreshToken(*(void **)(a1 + 64), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expiryDate(*(void **)(a1 + 64), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  refreshed = (void *)objc_msgSend_initWithOAuth2Token_refreshToken_expiryDate_(v19, v29, (uint64_t)v22, v25, v28);

  if (!*(_QWORD *)(a1 + 72) || !*(_QWORD *)(a1 + 80) || !*(_QWORD *)(a1 + 88) || !v5 || !*(_QWORD *)(a1 + 48))
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v30, v31);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 96), CFSTR("ESAccountAuthenticator.m"), 571, CFSTR("We have used these objects to fetch and verify the tokens, neither of these should be empty"));

  }
  if ((unint64_t)objc_msgSend_migrationStatus(*(void **)(a1 + 56), v30, v31) <= 1)
  {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 56), v32, MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2ABB0]);
    objc_msgSend_username(*(void **)(a1 + 56), v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 56), v37, (uint64_t)v36, *MEMORY[0x24BDB3F30]);

    objc_msgSend_setMigrationStatus_(*(void **)(a1 + 56), v38, 2);
  }
  v39 = *(_QWORD *)(a1 + 80);
  v55 = *(_QWORD *)(a1 + 72);
  v41 = *(_QWORD *)(a1 + 88);
  v40 = *(void **)(a1 + 96);
  v43 = *(_QWORD *)(a1 + 48);
  v42 = *(_QWORD *)(a1 + 56);
  v44 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_date(MEMORY[0x24BDBCE60], v32, v33);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v45, v46, v47);
  objc_msgSend_numberWithDouble_(v44, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addPropertiesToAccount_oauthURI_tokenRequestURI_jwksURI_issuer_oauthVersion_jwksData_jwksDataCacheDate_(v40, v51, v42, v55, v39, v41, v43, CFSTR("2"), v5, v50);

  (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
LABEL_19:

}

uint64_t sub_230E86A94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_230E86AA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_230E86ABC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_230E86ACC(uint64_t a1)
{

}

void sub_230E86AD4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const char *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  char v23;

  v5 = a2;
  v7 = a3;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v6, (uint64_t)v5, *MEMORY[0x24BE2FDC0]);
    }
    else
    {
      objc_msgSend_upgradeAuthorizationEndpoint_(MEMORY[0x24BE2A418], v6, (uint64_t)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v12, (uint64_t)v11, *MEMORY[0x24BE2FDC0]);

    }
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v8, (uint64_t)CFSTR("2"), *MEMORY[0x24BE2FDC8]);
    v13 = *(void **)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_230E86C58;
    v18[3] = &unk_24FF98068;
    v15 = v13;
    v23 = *(_BYTE *)(a1 + 72);
    v16 = *(_QWORD *)(a1 + 64);
    v19 = v15;
    v22 = v16;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    objc_msgSend__retrieveOpenIDMetadataForAccount_fromURI_withCompletion_(v14, v17, (uint64_t)v15, v5, v18);

  }
  else
  {
    objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v6, 3);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }

}

void sub_230E86C58(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    objc_msgSend_upgradeTokenEndpoint_(MEMORY[0x24BE2A418], v4, (uint64_t)v3);
    v44 = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend_setScheme_(v6, v7, (uint64_t)CFSTR("https"));
    objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v8, *MEMORY[0x24BE2AB88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHost_(v6, v10, (uint64_t)v9);

    objc_msgSend_URL(v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BE2FD38];
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v18, (uint64_t)v16, *MEMORY[0x24BE2FD38]);

    objc_msgSend_URL(v6, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v25, (uint64_t)v24, *MEMORY[0x24BE2FD30]);

    v26 = (void *)MEMORY[0x24BE2A410];
    objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v27, v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultScopeForOAuthType_withResourceIdentifier_isOnPrem_(v26, v29, 1, v28, *(unsigned __int8 *)(a1 + 64));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x24BE2A408];
    objc_msgSend_username(*(void **)(a1 + 32), v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_password(*(void **)(a1 + 40), v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_urlRequestForOAuthTokenFromUsername_tokenRequestURI_password_scope_(v31, v38, (uint64_t)v34, v44, v37, v30);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v41 = *(void **)(v40 + 40);
    *(_QWORD *)(v40 + 40) = v39;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v4, 3);
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v43 = *(void **)(v42 + 40);
    *(_QWORD *)(v42 + 40) = 0;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void sub_230E87B28(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  const char *v8;
  __int128 v9;
  _QWORD v10[5];
  id v11;
  id v12;
  __int128 v13;
  char v14;

  v4 = *(void **)(a1 + 32);
  objc_msgSend_backgroundThread(v4, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230E87C20;
  v10[3] = &unk_24FF980E0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 56);
  v6 = (id)v9;
  v13 = v9;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v14 = *(_BYTE *)(a1 + 72);
  v7 = (void *)MEMORY[0x2348C5C58](v10);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(v4, v8, (uint64_t)sel_invokeAndReleaseBlock_, v5, v7, 0);

}

void sub_230E87C20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  char v9;

  v2 = (void *)MEMORY[0x24BE2FD10];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230E87CE8;
  v5[3] = &unk_24FF980B8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 72);
  objc_msgSend_showUserNotification_groupIdentifier_withCompletionBlock_(v2, v4, v3, 0, v5);
  CFRelease(*(CFTypeRef *)(a1 + 64));

}

uint64_t sub_230E87CE8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__handlePasswordNotification_response_callback_account_accountStore_resetAuthenticatedOnAlertFailure_, a2);
}

uint64_t sub_230E87D04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E88394(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3 == 3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend_setAuthenticated_(*(void **)(a1 + 32), a2, 1);
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(a1 + 40);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = sub_230E88618;
      v24[3] = &unk_24FF98108;
      v25 = *(id *)(a1 + 48);
      v26 = 2;
      objc_msgSend_saveAccount_withHandler_(v6, v8, v7, v24);

      return;
    }
  }
  else
  {
    if (a3)
    {
      DALoggingwithCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E81000, v9, v10, "User requested transfer to settings from OAuth authentication alert", buf, 2u);
      }

      v11 = (void *)MEMORY[0x24BDBCF48];
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_identifier(*(void **)(a1 + 32), v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v12, v16, (uint64_t)CFSTR("prefs:root=MAIL&path=ACCOUNTS/%@&%@=%@"), v15, CFSTR("easOAuthAction"), CFSTR("showAuthSheet"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLWithString_(v11, v18, (uint64_t)v17);
      v4 = objc_claimAutoreleasedReturnValue();

      DALoggingwithCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, v10))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v4;
        _os_log_impl(&dword_230E81000, v19, v10, "Launch URL : %@", buf, 0xCu);
      }

      objc_msgSend_defaultWorkspace(MEMORY[0x24BDC1548], v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_openSensitiveURL_withOptions_(v22, v23, (uint64_t)v4, 0);

    }
    else
    {
      DALoggingwithCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
      if (os_log_type_enabled(v4, v5))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E81000, v4, v5, "User cancelled out of Hotmail authentication alert", buf, 2u);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_230E88618(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_230E887D0(uint64_t a1)
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

uint64_t sub_230E88CF4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC930](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x24BDBC948](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x24BE2ACA8]();
}

uint64_t DAShouldLogPassword()
{
  return MEMORY[0x24BE2ACB0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v16, (uint64_t)a3, *MEMORY[0x24BDBD6D8], a5, *MEMORY[0x24BDBD6F8], a6, *MEMORY[0x24BDBD6F0], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  if (v13)
    objc_msgSend_setObject_forKey_(v17, v18, (uint64_t)v13, *MEMORY[0x24BDBD6E0]);
  if (v14)
    objc_msgSend_setObject_forKey_(v20, v18, (uint64_t)v14, *MEMORY[0x24BDBD720]);
  v21 = (void *)objc_msgSend_copy(v15, v18, v19);

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v28 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0x10000uLL, 0, (CFDictionaryRef)v20);
  dispatch_get_global_queue(2, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230E887D0;
  block[3] = &unk_24FF98158;
  v25 = v21;
  v26 = v27;
  v23 = v21;
  dispatch_async(v22, block);

  _Block_object_dispose(v27, 8);
}

- (void)_handlePasswordNotification:(__CFUserNotification *)a3 response:(unint64_t)a4 callback:(id)a5 account:(id)a6 accountStore:(id)a7 resetAuthenticatedOnAlertFailure:(BOOL)a8
{
  _BOOL4 v8;
  void (**v13)(id, uint64_t, _QWORD);
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  int isEqualToString;
  const __CFString *v67;
  void *v68;
  const char *v69;
  CFIndex v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  NSObject *v84;
  _QWORD v85[4];
  void (**v86)(id, uint64_t, _QWORD);
  uint64_t v87;
  uint8_t buf[4];
  unint64_t v89;
  __int16 v90;
  id v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v8 = a8;
  v94 = *MEMORY[0x24BDAC8D0];
  v13 = (void (**)(id, uint64_t, _QWORD))a5;
  v14 = a6;
  v15 = a7;
  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BE2AD38];
  v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v16, v18))
  {
    objc_msgSend_backingAccountInfo(v14, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v89 = a4;
    v90 = 2112;
    v91 = v14;
    v92 = 2112;
    v93 = v21;
    _os_log_impl(&dword_230E81000, v16, v18, "Authenticator got credential renewal prompt result of %ld for account %@, %@", buf, 0x20u);

  }
  v24 = a4 & 3;
  if (v24 != 3)
  {
    objc_msgSend_identityPersist(v14, v22, v23);
    v47 = objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v50 = (void *)v47;
      objc_msgSend_username(v14, v48, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {

      }
      else
      {
        objc_msgSend_password(v14, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v54)
        {
          DALoggingwithCategory();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, v18))
          {
            *(_WORD *)buf = 0;
            v56 = "User responded to client cert alert";
LABEL_27:
            _os_log_impl(&dword_230E81000, v55, v18, v56, buf, 2u);
          }
LABEL_28:
          v57 = 1;
          goto LABEL_29;
        }
      }
    }
    if (v24)
    {
      if (v24 != 1)
        goto LABEL_16;
      DALoggingwithCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v55, v18))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v56 = "User rejected password entry.";
      goto LABEL_27;
    }
    objc_msgSend_backingAccountInfo(v14, v48, v49);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountType(v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v64, v65, *MEMORY[0x24BDB4130]);

    v67 = (const __CFString *)*MEMORY[0x24BDBD728];
    if (isEqualToString)
    {
      CFUserNotificationGetResponseValue(a3, (CFStringRef)*MEMORY[0x24BDBD728], 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsername_(v14, v69, (uint64_t)v68);

      v70 = 1;
    }
    else
    {
      v70 = 0;
    }
    CFUserNotificationGetResponseValue(a3, v67, v70);
    v55 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v55, v71, v72))
    {
      objc_msgSend_credentialWithPassword_(MEMORY[0x24BDB4388], v73, (uint64_t)v55);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_backingAccountInfo(v14, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCredential_(v77, v78, (uint64_t)v74);

      v79 = (void *)MEMORY[0x24BE00E88];
      objc_msgSend_backingAccountInfo(v14, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCredentialForAccount_(v79, v83, (uint64_t)v82);

      v57 = 0;
LABEL_29:

      goto LABEL_30;
    }
    DALoggingwithCategory();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E81000, v84, v18, "Password rejected because it is blank", buf, 2u);
    }

    goto LABEL_28;
  }
  if (!v8)
  {
LABEL_16:
    v57 = 2;
LABEL_30:
    v13[2](v13, v57, 0);
    goto LABEL_31;
  }
  DALoggingwithCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_BYTE *)(v17 + 4);
  if (os_log_type_enabled(v25, v26))
  {
    objc_msgSend_backingAccountInfo(v14, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_backingAccountInfo(v14, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_username(v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v89 = (unint64_t)v32;
    v90 = 2112;
    v91 = v38;
    _os_log_impl(&dword_230E81000, v25, v26, "Calling _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", buf, 0x16u);

  }
  objc_msgSend_backingAccountInfo(v14, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAuthenticated_(v41, v42, 1);

  objc_msgSend_backingAccountInfo(v14, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = MEMORY[0x24BDAC760];
  v85[1] = 3221225472;
  v85[2] = sub_230E88CF4;
  v85[3] = &unk_24FF98108;
  v86 = v13;
  v87 = 2;
  objc_msgSend_saveAccount_withHandler_(v15, v46, (uint64_t)v45, v85);

LABEL_31:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIDToAccount, 0);
  objc_storeStrong((id *)&self->_accountIDToVerificationHandler, 0);
}

@end
