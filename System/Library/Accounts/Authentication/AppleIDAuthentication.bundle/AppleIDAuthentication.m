uint64_t sub_230E61F38(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKey:", CFSTR("date-last-modified"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("date-last-modified"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void sub_230E626B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E626D0(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_230E5F000, v2, OS_LOG_TYPE_DEFAULT, "We timed out waiting on the server", v3, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "cancelAllOperations");
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_230E62748(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      v7 = "Something went wrong and we couldn't contact the server. %@";
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      v7 = "Got an error, may still be in Grey Mode. %@";
LABEL_7:
      _os_log_impl(&dword_230E5F000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E5F000, v5, OS_LOG_TYPE_DEFAULT, "Server auth was successful, not in Grey Mode anymore", buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "aa_updateWithProvisioningResponse:", v3);
  objc_msgSend(*(id *)(a1 + 32), "aa_setNeedsToVerifyTerms:", 0);
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_230E62930;
  v12[3] = &unk_24FF93D98;
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v13 = v10;
  v14 = v11;
  objc_msgSend(v8, "saveVerifiedAccount:withCompletionHandler:", v9, v12);

LABEL_12:
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));

}

void sub_230E62930(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "Failed to save account after marking it as not in grey mode anymore. %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_230E634C8(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_230E5F000, v5, OS_LOG_TYPE_DEFAULT, "Account save failed: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void sub_230E6360C()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24FF95900);
  v1 = (void *)qword_25414ADD0;
  qword_25414ADD0 = v0;

}

void sub_230E63B0C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  Nanoseconds = _AASignpostGetNanoseconds();
  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    _AAErrorUnderlyingError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v11, "code");
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "DiscoverProperties", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v14 = *(_QWORD *)(a1 + 40);
    _AAErrorUnderlyingError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "code");
    v17 = 134218496;
    v18 = v14;
    v19 = 2048;
    v20 = v13;
    v21 = 1026;
    v22 = v16;
    _os_log_impl(&dword_230E5F000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DiscoverProperties  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_230E63CD8(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_230E6B698();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_230E6B6C4();
  }

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BDB44E0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) != 0)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_230E6B66C();

    v12 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_230E63E40;
    v13[3] = &unk_24FF93E90;
    v16 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 40);
    v15 = v5;
    objc_msgSend(v11, "saveVerifiedAccount:withCompletionHandler:", v12, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_230E63E40(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_230E6B724();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_230E6B750();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_230E6459C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230E645B8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  Nanoseconds = _AASignpostGetNanoseconds();
  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    _AAErrorUnderlyingError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v11, "code");
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "VerifyCredentials", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v14 = *(_QWORD *)(a1 + 40);
    _AAErrorUnderlyingError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "code");
    v17 = 134218496;
    v18 = v14;
    v19 = 2048;
    v20 = v13;
    v21 = 1026;
    v22 = v16;
    _os_log_impl(&dword_230E5F000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: VerifyCredentials  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_230E64784(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

uint64_t sub_230E647A4(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void sub_230E6499C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_230E5F000, v7, OS_LOG_TYPE_DEFAULT, "Oops, something went wrong with password-less auth! %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_tryPasswordLoginWithAccount:store:services:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      _AALogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "username");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v10;
        _os_log_impl(&dword_230E5F000, v9, OS_LOG_TYPE_DEFAULT, "Password-less auth succeeded! Time for login with Apple ID %@...", (uint8_t *)&v15, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_beginPETBasedLoginWithAccount:PET:store:completion:", *(_QWORD *)(a1 + 40), v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB98]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*(id *)(a1 + 56), "count")
        && objc_msgSend(v12, "count")
        && objc_msgSend(*(id *)(a1 + 56), "aaf_isSubsetOfArray:", v12))
      {
        _AALogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_230E5F000, v13, OS_LOG_TYPE_DEFAULT, "Password-less auth returned all the requested tokens!", (uint8_t *)&v15, 2u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
      else
      {
        _AALogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_230E5F000, v14, OS_LOG_TYPE_DEFAULT, "Password-less auth appeared to succeed, but auth results do not have a value for AKAuthenticationPasswordKey or AKAuthenticationIDMSTokenKey!", (uint8_t *)&v15, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_tryPasswordLoginWithAccount:store:services:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      }

    }
  }

}

void sub_230E64EF0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_beginPETBasedLoginWithAccount:PET:store:completion:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "Both password-less and password auth have failed. Login has officially failed. Error: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_230E6524C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "Oops, something went wrong with password-based auth! %@", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_230E5F000, v8, OS_LOG_TYPE_DEFAULT, "Password-based auth succeeded! Time for login with Apple ID %@...", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_230E658B4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  int v16;
  void *v17;
  int v18;
  _BYTE v19[10];
  double v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  Nanoseconds = _AASignpostGetNanoseconds();
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 64);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v18 = 67240448;
    *(_DWORD *)v19 = a2;
    *(_WORD *)&v19[4] = 1026;
    *(_DWORD *)&v19[6] = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "LoginAndUpdateAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0xEu);
  }

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v15 = *(_QWORD *)(a1 + 64);
    v16 = objc_msgSend(v7, "code");
    v18 = 134218752;
    *(_QWORD *)v19 = v15;
    *(_WORD *)&v19[8] = 2048;
    v20 = v14;
    v21 = 1026;
    v22 = a2;
    v23 = 1026;
    v24 = v16;
    _os_log_impl(&dword_230E5F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LoginAndUpdateAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x22u);
  }

  objc_msgSend(v8, "convertToLoginDelegatesResponse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_handleDelegatesResponseForAccount:store:response:error:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v17, v7, *(_QWORD *)(a1 + 56));
}

void sub_230E65A8C(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int v16;
  _BYTE v17[10];
  double v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  Nanoseconds = _AASignpostGetNanoseconds();
  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v16 = 67240448;
    *(_DWORD *)v17 = a2;
    *(_WORD *)&v17[4] = 1026;
    *(_DWORD *)&v17[6] = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SignInRegisterAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0xEu);
  }

  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v13 = *(_QWORD *)(a1 + 64);
    v14 = objc_msgSend(v6, "code");
    v16 = 134218752;
    *(_QWORD *)v17 = v13;
    *(_WORD *)&v17[8] = 2048;
    v18 = v12;
    v19 = 1026;
    v20 = a2;
    v21 = 1026;
    v22 = v14;
    _os_log_impl(&dword_230E5F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInRegisterAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x22u);
  }

  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_230E5F000, v15, OS_LOG_TYPE_DEFAULT, "Login succeeded! Fetching tokens...", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_fetchTokenForAccount:accountStore:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_230E660B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  Nanoseconds = _AASignpostGetNanoseconds();
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 72);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RenewCredentials", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v13 = *(_QWORD *)(a1 + 72);
    _AAErrorUnderlyingError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v16 = 134218496;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    v20 = 1026;
    v21 = v15;
    _os_log_impl(&dword_230E5F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RenewCredentials  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);

  }
  if (a2 == 2)
    objc_msgSend(*(id *)(a1 + 32), "_handleRenewFailure:forAccount:accountStore:options:completion:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void sub_230E6654C(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_230E665D4;
  v6[3] = &unk_24FF93FF8;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_beginPETBasedLoginWithAccount:PET:store:completion:", v4, a2, v5, v6);

}

uint64_t sub_230E665D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E665F4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v4, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: Exchanging raw password from companion for PET...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BDB4520]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "aa_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_230E66750;
    v9[3] = &unk_24FF94048;
    v10 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 64);
    objc_msgSend(v6, "_convertPasswordToPETForAppleID:altDSID:password:services:completion:", v7, v8, v3, v5, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_230E66750(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (v3)
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_230E5F000, v4, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: Password from companion was successfully exchanged for PET. Logging in...", v5, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_230E66CC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230E66CE0(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (*(_QWORD *)(a1 + 56))
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_230E5F000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing renew-credentials prompt.", (uint8_t *)&v21, 2u);
    }

    CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }
  v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v12);

  if ((a2 & 1) == 0)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v17 = *(void **)(a1 + 40);
    v21 = 138412546;
    v22 = v17;
    v23 = 2112;
    v24 = v8;
    v18 = "Failed to obtain a password from ACRemoteDeviceProxy for account %@! Error: %@";
    v19 = v16;
    v20 = 22;
LABEL_17:
    _os_log_impl(&dword_230E5F000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, v20);
    goto LABEL_18;
  }
  if (!v7)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    LOWORD(v21) = 0;
    v18 = "ACRemoteDeviceProxy reports that renewCredentials succeeded, but no password is in the response!";
    v19 = v16;
    v20 = 2;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v7;
      v18 = "ACRemoteDeviceProxy reports that renewCredentials succeeded, but response is not a string! %@";
      v19 = v16;
      v20 = 12;
      goto LABEL_17;
    }
LABEL_18:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_19;
  }
  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(void **)(a1 + 40);
    v21 = 138412290;
    v22 = v14;
    _os_log_impl(&dword_230E5F000, v13, OS_LOG_TYPE_DEFAULT, "ACRemoteDeviceProxy successfully provided us with a password for %@", (uint8_t *)&v21, 0xCu);
  }

  v15 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_19:
  objc_sync_exit(v10);

}

void sub_230E66FA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230E6740C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E6742C(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (!v5 && (a2 & 1) == 0)
  {
LABEL_3:
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_18:
    v7();
    goto LABEL_19;
  }
  if (!a2)
  {
LABEL_17:
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "code") != 401)
  {
    if (objc_msgSend(v6, "code") == 409 || objc_msgSend(v6, "code") == 403)
    {
      _AALogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_230E5F000, v9, OS_LOG_TYPE_DEFAULT, "Got a 409/403, the account really is in Grey Mode", v14, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_frontmostApplicationId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Preferences"));

      if (v11)
        goto LABEL_3;
      _AALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_230E5F000, v12, OS_LOG_TYPE_DEFAULT, "Failing due to out of date terms...", v13, 2u);
      }

    }
    goto LABEL_17;
  }
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E5F000, v8, OS_LOG_TYPE_DEFAULT, "Auth was bad, re-authenticate...", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_authenticateAccount:inStore:options:errorMessage:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
LABEL_19:

}

void sub_230E67AE8(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  __int16 v41;
  char v42;
  uint8_t buf[4];
  uint64_t v44;
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
  objc_msgSend(*(id *)(a1 + 32), "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsername:", v3);

  objc_msgSend(v2, "setIsUsernameEditable:", 0);
  objc_msgSend(v2, "setReason:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "aa_personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDSID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "aa_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAltDSID:", v5);

  objc_msgSend(v2, "setAnticipateEscrowAttempt:", 1);
  v6 = 0;
  if (!*(_BYTE *)(a1 + 120))
  {
    objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _AALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E5F000, v8, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will try auth with cached password first...", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_setPassword:", v9);

      v6 = 1;
      objc_msgSend(v2, "setAuthenticationType:", 1);
    }
    else
    {
      v6 = 0;
    }
  }
  objc_msgSend(v2, "_setProxyingForApp:", 1);
  objc_msgSend(*(id *)(a1 + 48), "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setProxiedAppName:", v11);

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v2, "_setProxiedAppBundleID:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setProxiedAppBundleID:", v13);

  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v2, "setProxiedDevice:");
    goto LABEL_17;
  }
  if (*(_BYTE *)(a1 + 120))
  {
    v14 = v2;
    v15 = 2;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 121))
      goto LABEL_17;
    v14 = v2;
    v15 = 1;
  }
  objc_msgSend(v14, "setAuthenticationType:", v15);
LABEL_17:
  v16 = *(_QWORD *)(a1 + 32);
  v45[0] = CFSTR("account");
  v45[1] = CFSTR("accountStore");
  v17 = *(_QWORD *)(a1 + 48);
  v46[0] = v16;
  v46[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClientInfo:", v18);

  v19 = *(_QWORD *)(a1 + 112);
  if (!v19)
  {
    if (!*(_BYTE *)(a1 + 122))
      goto LABEL_21;
    v19 = 1;
  }
  objc_msgSend(v2, "setServiceType:", v19);
LABEL_21:
  if (*(_QWORD *)(a1 + 72))
  {
    _AALogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138412290;
      v44 = v21;
      _os_log_impl(&dword_230E5F000, v20, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will request GS service tokens for %@.", buf, 0xCu);
    }

    objc_msgSend(v2, "setServiceIdentifiers:", *(_QWORD *)(a1 + 72));
    if (*(_QWORD *)(a1 + 72))
      goto LABEL_26;
  }
  objc_msgSend(*(id *)(a1 + 32), "accountType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqual:", *MEMORY[0x24BDB3FD8]);

  if (v24)
  {
LABEL_26:
    _AALogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v25, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will persist GS service tokens resulting from auth.", buf, 2u);
    }

    objc_msgSend(v2, "setShouldUpdatePersistentServiceTokens:", 1);
  }
  _AALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E5F000, v26, OS_LOG_TYPE_DEFAULT, "Calling out to AKAppleIDAuthenticationController...", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 80), "_authController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = sub_230E67FD8;
  v31[3] = &unk_24FF94188;
  v40 = v6;
  v28 = *(id *)(a1 + 32);
  v29 = *(_QWORD *)(a1 + 80);
  v32 = v28;
  v33 = v29;
  v34 = *(id *)(a1 + 48);
  v35 = *(id *)(a1 + 88);
  v36 = *(id *)(a1 + 96);
  v39 = *(id *)(a1 + 104);
  v41 = *(_WORD *)(a1 + 120);
  v37 = *(id *)(a1 + 64);
  v38 = v2;
  v42 = *(_BYTE *)(a1 + 123);
  v30 = v2;
  objc_msgSend(v27, "authenticateWithContext:completion:", v30, v31);

}

void sub_230E67FD8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  NSObject *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD, _QWORD);
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  char v35;
  char v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6 && *(_BYTE *)(a1 + 96))
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_230E5F000, v7, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: auth with cached password failed %@. Clearing and retrying...", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
    objc_msgSend(*(id *)(a1 + 40), "_authenticateAccount:inStore:options:errorMessage:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));
  }
  else
  {
    v8 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_230E682F0;
    v27[3] = &unk_24FF940E8;
    v35 = *(_BYTE *)(a1 + 97);
    v28 = *(id *)(a1 + 56);
    v36 = *(_BYTE *)(a1 + 98);
    v9 = v6;
    v29 = v9;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v30 = v10;
    v31 = v11;
    v32 = v12;
    v33 = *(id *)(a1 + 72);
    v34 = *(id *)(a1 + 88);
    v13 = (void *)MEMORY[0x2348C5488](v27);
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = sub_230E684AC;
    v21[3] = &unk_24FF94138;
    v21[4] = *(_QWORD *)(a1 + 40);
    v22 = *(id *)(a1 + 80);
    v23 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 48);
    v26 = *(_BYTE *)(a1 + 99);
    v14 = v13;
    v25 = v14;
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348C5488](v21);
    if (v6 && objc_msgSend(v9, "aa_isXPCError"))
    {
      _AALogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230E5F000, v16, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: auth failure with connection error, retrying  ", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_authController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 80);
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = sub_230E68654;
      v19[3] = &unk_24FF94160;
      v20 = v15;
      objc_msgSend(v17, "authenticateWithContext:completion:", v18, v19);

    }
    else
    {
      ((void (**)(_QWORD, id, id))v15)[2](v15, v5, v9);
    }

  }
}

void sub_230E682F0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *(unsigned __int8 *)(a1 + 88);
  if (!*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BDB4530]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "BOOLValue") & 1) == 0 && !*(_BYTE *)(a1 + 89))
    {
      v9 = 1;
      goto LABEL_5;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AARenewShouldPostFollowUp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v7)
LABEL_5:

  if ((objc_msgSend(*(id *)(a1 + 40), "ak_isUnableToPromptError") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "ak_isUserCancelError") & 1) != 0)
  {
    v10 = 1;
    if (!a2)
      goto LABEL_15;
  }
  else
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "ak_isAuthenticationErrorWithCode:", -7014);
    if (!a2)
      goto LABEL_15;
  }
  if ((v10 & v9) != 0)
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_230E5F000, v11, OS_LOG_TYPE_DEFAULT, "Failed to renew credentials, posting renew follow up for account: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "_userInfoForRenewCredentialsFollowUpWithAccountStore:proxiedDevice:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "postFollowUpWithIdentifier:forAccount:userInfo:completion:", *MEMORY[0x24BE04838], *(_QWORD *)(a1 + 48), v13, 0);

  }
LABEL_15:
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

void sub_230E684AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_230E685B0;
  v11[3] = &unk_24FF94110;
  v11[4] = v7;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v17 = *(_BYTE *)(a1 + 72);
  v16 = *(id *)(a1 + 64);
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_validateAuthenticationResults:error:forContext:completion:", v10, v9, v8, v11);

}

uint64_t sub_230E685B0(uint64_t a1, int a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if (!a2)
    return objc_msgSend(MEMORY[0x24BE04908], "handleAuthenticationError:resetAuthenticatedOnAlertFailure:forAccount:inStore:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230E5F000, v3, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: Continue authenticating...", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthenticationResults:error:forAccount:inStore:resetAuthenticatedOnAlertFailure:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 72));
}

uint64_t sub_230E68654(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_230E68660(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E68B28(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: loginDelegates succeeded!", (uint8_t *)&v8, 2u);
    }

  }
  else
  {
    if (v7)
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: loginDelegates failed with error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_230E68E0C(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1[5], "credential");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPassword:", v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB4388], "credentialWithPassword:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setCredential:", v4);
  }

  objc_msgSend(a1[5], "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

  if (v7)
  {
    v8 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_230E68FF8;
    v17[3] = &unk_24FF94228;
    v18 = a1[5];
    v19 = a1[6];
    v20 = a1[7];
    v9 = (void *)MEMORY[0x2348C5488](v17);
    v11 = a1[5];
    v10 = a1[6];
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = sub_230E69248;
    v13[3] = &unk_24FF94278;
    v14 = v10;
    v15 = a1[5];
    v16 = v9;
    v12 = v9;
    objc_msgSend(v14, "aa_loginAndUpdateiCloudAccount:withCompletion:", v11, v13);

  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }

}

void sub_230E68FF8(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE04BB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE04BB8]);

  if (v7)
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v8, OS_LOG_TYPE_DEFAULT, "Looks like we need to verify terms", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "aa_setNeedsToVerifyTerms:", 1);
    goto LABEL_6;
  }
  if (a2)
  {
LABEL_6:
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_230E6914C;
    v11[3] = &unk_24FF93FF8;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v9, "saveVerifiedAccount:withCompletionHandler:", v10, v11);

    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_230E6914C(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      v8 = "Account save success";
      v9 = v6;
      v10 = 2;
LABEL_6:
      _os_log_impl(&dword_230E5F000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    v11 = 138412290;
    v12 = v5;
    v8 = "Account was unable to save with error: %@";
    v9 = v6;
    v10 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
}

void sub_230E69248(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && ((objc_msgSend(v7, "aa_isAARecoverableError") & 1) != 0 || objc_msgSend(v8, "aa_isXPCError")))
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E5F000, v9, OS_LOG_TYPE_DEFAULT, "iCloud login in failed with a recoverable error, retrying once...", buf, 2u);
    }

    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_230E69368;
    v12[3] = &unk_24FF94250;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v10, "aa_loginAndUpdateiCloudAccount:withCompletion:", v11, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t sub_230E69368(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_230E69378(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E6964C(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  _DWORD v14[7];

  *(_QWORD *)&v14[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v14[0] = a2;
    LOWORD(v14[1]) = 2112;
    *(_QWORD *)((char *)&v14[1] + 2) = v5;
    _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: saving raw password result was %d. Error: %@", buf, 0x12u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v14 = v8;
      _os_log_impl(&dword_230E5F000, v7, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin setting raw password for iCloud account %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_setRawPassword:", *(_QWORD *)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_230E697D8;
    v11[3] = &unk_24FF93FF8;
    v10 = *(void **)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v10, "saveVerifiedAccount:withCompletionHandler:", v9, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_230E697D8(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_230E5F000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: saving raw password result was %d. Error: %@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230E6A010()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  _AALogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230E5F000, v0, OS_LOG_TYPE_DEFAULT, "building singleton array of auth delegate plugin principal classes", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE00E90], "pluginBundlesAtSubpath:", CFSTR("/Authentication/AppleIDAuthenticationDelegates/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v13;
    *(_QWORD *)&v3 = 138412290;
    v11 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "principalClass", v11);
        if (v8)
        {
          if (qword_25414ADB8)
            objc_msgSend((id)qword_25414ADB8, "arrayByAddingObject:", v8);
          else
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = qword_25414ADB8;
          qword_25414ADB8 = v9;
        }
        else
        {
          _AALogSystem();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v11;
            v17 = v7;
            _os_log_fault_impl(&dword_230E5F000, v10, OS_LOG_TYPE_FAULT, "Failed to load principal class for %@", buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v4);
  }

}

void sub_230E6A1FC(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = (id)objc_opt_class();
    v3 = v18;
    _os_log_impl(&dword_230E5F000, v2, OS_LOG_TYPE_DEFAULT, "finished with delegate %@", (uint8_t *)&v17, 0xCu);

  }
  Nanoseconds = _AASignpostGetNanoseconds();
  _AASignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");
    v17 = 67240192;
    LODWORD(v18) = v9;
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v6, OS_SIGNPOST_INTERVAL_END, v7, "InvokeDelegateWithAuthResponse", " error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("status"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");
    v17 = 134218496;
    v18 = v11;
    v19 = 2048;
    v20 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_230E5F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: InvokeDelegateWithAuthResponse  error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v14 = *(id *)(a1 + 48);
  objc_sync_enter(v14);
  objc_msgSend(*(id *)(a1 + 48), "removeObject:", objc_opt_class());
  v15 = objc_msgSend(*(id *)(a1 + 48), "count");
  objc_sync_exit(v14);

  if (!v15)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_230E5F000, v16, OS_LOG_TYPE_DEFAULT, "_invokeDelegatesWithAuthenticationResponse completing – last delegate finished", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void sub_230E6A48C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230E6A688(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "httpResponse");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "data");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v5, "mediaType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        _AALogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v5;
          _os_log_impl(&dword_230E5F000, v12, OS_LOG_TYPE_DEFAULT, "Fetched cached response (%@) and attempting to use for delegates", buf, 0xCu);
        }

        v13 = objc_alloc(MEMORY[0x24BE049D0]);
        objc_msgSend(v5, "httpResponse");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mediaType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v13, "initWithHTTPResponse:data:mediaType:", v14, v15, v16);

        v19 = *(void **)(a1 + 32);
        v18 = *(void **)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = sub_230E6A8EC;
        v24[3] = &unk_24FF94360;
        v25 = v18;
        v29 = *(id *)(a1 + 56);
        v21 = v6;
        v22 = *(_QWORD *)(a1 + 32);
        v26 = v21;
        v27 = v22;
        v28 = *(id *)(a1 + 48);
        objc_msgSend(v19, "_handleDelegatesResponseForAccount:store:response:error:handler:", v25, v20, v17, 0, v24);

        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_230E6B8E8();

  objc_msgSend(*(id *)(a1 + 32), "_performLoginDelegatesRequestForAccount:store:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_11:

}

void sub_230E6A8EC(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_230E5F000, v7, OS_LOG_TYPE_DEFAULT, "Successfully used cached login response for account (%@) to authenticate", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_230E6B948(a1, (uint64_t)v5, v7);

    objc_msgSend(*(id *)(a1 + 48), "_fetchTokenForAccount:accountStore:forceFetch:withHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 1, *(_QWORD *)(a1 + 64));
  }

}

void sub_230E6AD5C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  Nanoseconds = _AASignpostGetNanoseconds();
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    _AAErrorUnderlyingError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v12, "code");
    _os_signpost_emit_with_name_impl(&dword_230E5F000, v10, OS_SIGNPOST_INTERVAL_END, v11, "LoginDelegates", " error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v18, 8u);

  }
  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v15 = *(_QWORD *)(a1 + 64);
    _AAErrorUnderlyingError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "code");
    v18 = 134218496;
    v19 = v15;
    v20 = 2048;
    v21 = v14;
    v22 = 1026;
    v23 = v17;
    _os_log_impl(&dword_230E5F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LoginDelegates  error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v18, 0x1Cu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_handleDelegatesResponseForAccount:store:response:error:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, v6, *(_QWORD *)(a1 + 56));

}

void sub_230E6B170(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*v2, "dirtyProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      _AALogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        sub_230E6B9CC(v2, v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "refresh");
    objc_msgSend(MEMORY[0x24BE00E88], "credentialForAccount:clientID:", *(_QWORD *)(a1 + 32), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPassword:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setCredential:", v7);

  }
  if (+[AppleIDAuthenticationUtil doesRelyOnCompanionAccounts](AppleIDAuthenticationUtil, "doesRelyOnCompanionAccounts")&& (objc_msgSend(*(id *)(a1 + 48), "_parametersForIDSAlertFromLoginResponse:", *(_QWORD *)(a1 + 56)), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  else
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_230E5F000, v11, OS_LOG_TYPE_DEFAULT, "Completed storing tokens", v12, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

void *sub_230E6B4E0(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!qword_25414ADB0)
  {
    v4 = xmmword_24FF94420;
    v5 = 0;
    qword_25414ADB0 = _sl_dlopen();
  }
  if (!qword_25414ADB0)
    sub_230E6BA7C(&v3);
  result = dlsym((void *)qword_25414ADB0, "BYSetupAssistantIsRunningSilentTokenUpgrade");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_25414ADC8 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230E6B5B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_230E6B5C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_230E6B600()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_230E6B5E8();
  _os_log_debug_impl(&dword_230E5F000, v0, OS_LOG_TYPE_DEBUG, "\"Checking if client (%@) is entitled.\"", v1, 0xCu);
  sub_230E6B5D8();
}

void sub_230E6B66C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E6B5F4();
  sub_230E6B5C8(&dword_230E5F000, v0, v1, "Client requested account save, saving...", v2, v3, v4, v5, v6);
  sub_230E6B5E0();
}

void sub_230E6B698()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E6B5F4();
  sub_230E6B5C8(&dword_230E5F000, v0, v1, "Successfully updated properties for account!", v2, v3, v4, v5, v6);
  sub_230E6B5E0();
}

void sub_230E6B6C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E6B5E8();
  sub_230E6B5B8(&dword_230E5F000, v0, v1, "Failed to update properties for account, error: %@", v2, v3, v4, v5, v6);
  sub_230E6B5D8();
}

void sub_230E6B724()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E6B5F4();
  sub_230E6B5C8(&dword_230E5F000, v0, v1, "Successfully saved updated account, we're done here.", v2, v3, v4, v5, v6);
  sub_230E6B5E0();
}

void sub_230E6B750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E6B5E8();
  sub_230E6B5B8(&dword_230E5F000, v0, v1, "Failed to save updated account, error: %@", v2, v3, v4, v5, v6);
  sub_230E6B5D8();
}

void sub_230E6B7B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E6B5F4();
  sub_230E6B5C8(&dword_230E5F000, v0, v1, "Missing rp for account, checking in pk...", v2, v3, v4, v5, v6);
  sub_230E6B5E0();
}

void sub_230E6B7DC()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_230E6B5F4();
  _os_log_error_impl(&dword_230E5F000, v0, OS_LOG_TYPE_ERROR, "Auth is not permitted at this time. Not calling companion for password.", v1, 2u);
  sub_230E6B5E0();
}

void sub_230E6B814()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E6B5E8();
  sub_230E6B5B8(&dword_230E5F000, v0, v1, "Auth is not continuable at this time, not calling companion for password. Error: %@", v2, v3, v4, v5, v6);
  sub_230E6B5D8();
}

void sub_230E6B874()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_BYSetupAssistantIsRunningSilentTokenUpgrade(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AppleIDAuthenticationPlugin.m"), 65, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_230E6B8E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230E6B5E8();
  sub_230E6B5B8(&dword_230E5F000, v0, v1, "Failed to get cached login response with error: %@", v2, v3, v4, v5, v6);
  sub_230E6B5D8();
}

void sub_230E6B948(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_230E5F000, log, OS_LOG_TYPE_ERROR, "Failed to use cached login response for account (%@) with error: %@", (uint8_t *)&v4, 0x16u);
  sub_230E6B5D8();
}

void sub_230E6B9CC(id *a1, NSObject *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  objc_msgSend(*a1, "dirtyProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_230E5F000, a2, OS_LOG_TYPE_DEBUG, "AppleIDAuthenticationPlugin about to refresh to pick up changes made by auth delegates, but the account already has the following dirty properties, which might spell t-r-o-u-b-l-e: %@ %@", (uint8_t *)&v5, 0x16u);

}

void sub_230E6BA7C(_QWORD *a1)
{
  void *v2;
  void *v3;
  CFMutableDictionaryRef v4;
  const void *v5;
  const void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SetupAssistantLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AppleIDAuthenticationPlugin.m"), 64, CFSTR("%s"), *a1);

  __break(1u);
  CFDictionaryAddValue(v4, v5, v6);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x24BE2B610]();
}

uint64_t SBSCopyFrontmostApplicationDisplayIdentifier()
{
  return MEMORY[0x24BEB0BE0]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

uint64_t _AAErrorUnderlyingError()
{
  return MEMORY[0x24BE04AA0]();
}

uint64_t _AALogSystem()
{
  return MEMORY[0x24BE04AA8]();
}

uint64_t _AASignpostCreate()
{
  return MEMORY[0x24BE04AB0]();
}

uint64_t _AASignpostGetNanoseconds()
{
  return MEMORY[0x24BE04AB8]();
}

uint64_t _AASignpostLogSystem()
{
  return MEMORY[0x24BE04AC0]();
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x24BE00EB0]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

