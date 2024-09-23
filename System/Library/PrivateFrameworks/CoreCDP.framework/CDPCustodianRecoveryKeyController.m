@implementation CDPCustodianRecoveryKeyController

- (void)createRecoveryKeyWithContext:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  uint8_t buf[4];
  os_signpost_id_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_4:
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (os_signpost_id_t)v8;
      _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Asking security to create custodian recovery key for %@\", buf, 0xCu);
    }

    _CDPSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = _CDPSignpostCreate(v13);
    v16 = v15;

    _CDPSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20D7E6000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CustodianCreateRecoveryKey", " enableTelemetry=YES ", buf, 2u);
    }

    _CDPSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = v14;
      _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianCreateRecoveryKey  enableTelemetry=YES ", buf, 0xCu);
    }

    objc_msgSend(v7, "cliqueConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDE84B0];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __85__CDPCustodianRecoveryKeyController_createRecoveryKeyWithContext_forUUID_completion___block_invoke;
    v23[3] = &unk_24C7C11B0;
    v26 = v14;
    v27 = v16;
    v25 = v9;
    v24 = v8;
    objc_msgSend(v21, "createCustodianRecoveryKey:uuid:reply:", v20, v24, v23);

    goto LABEL_12;
  }
  objc_msgSend(v7, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    -[CDPCustodianRecoveryKeyController createRecoveryKeyWithContext:forUUID:completion:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5003);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v20);
LABEL_12:

}

void __85__CDPCustodianRecoveryKeyController_createRecoveryKeyWithContext_forUUID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  double v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  CDPCustodianRecoveryInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  CDPCustodianRecoveryInfo *v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v30 = 67240192;
    LODWORD(v31) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianCreateRecoveryKey", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v30, 8u);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = (void *)a1[6];
    v14 = objc_msgSend(v6, "code");
    v30 = 134218496;
    v31 = v13;
    v32 = 2048;
    v33 = v12;
    v34 = 1026;
    LODWORD(v35) = v14;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CustodianCreateRecoveryKey  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v30, 0x1Cu);
  }

  if (v6)
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __85__CDPCustodianRecoveryKeyController_createRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_1();

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend(v5, "wrappedKey");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16
      && (v17 = (void *)v16,
          objc_msgSend(v5, "wrappingKey"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          v17,
          v18))
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)a1[4];
        v23 = CFSTR("not equal ❌");
        v30 = 138412802;
        v31 = v20;
        if (v21 == v22)
          v23 = CFSTR("equal ✅");
        v32 = 2112;
        v33 = *(double *)&v23;
        v34 = 2112;
        v35 = v22;
        _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, "\"OT CRK uuid %@ is %@ to AA custodianID %@\", (uint8_t *)&v30, 0x20u);

      }
      v24 = [CDPCustodianRecoveryInfo alloc];
      objc_msgSend(v5, "wrappedKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wrappingKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[CDPCustodianRecoveryInfo initWithWrappedRKC:wrappingKey:custodianUUID:](v24, "initWithWrappedRKC:wrappingKey:custodianUUID:", v25, v26, v27);

      (*(void (**)(_QWORD, CDPCustodianRecoveryInfo *, _QWORD))(a1[5] + 16))(a1[5], v28, 0);
    }
    else
    {
      v29 = a1[5];
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
      v28 = (CDPCustodianRecoveryInfo *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, CDPCustodianRecoveryInfo *))(v29 + 16))(v29, 0, v28);
    }

  }
}

- (void)deleteRecoveryKeyWithContext:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  uint8_t buf[4];
  os_signpost_id_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_4:
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (os_signpost_id_t)v8;
      _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Asking security to delete custodian recovery key for %@\", buf, 0xCu);
    }

    _CDPSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = _CDPSignpostCreate(v13);
    v16 = v15;

    _CDPSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20D7E6000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CustodianDeleteRecoveryKey", " enableTelemetry=YES ", buf, 2u);
    }

    _CDPSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = v14;
      _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianDeleteRecoveryKey  enableTelemetry=YES ", buf, 0xCu);
    }

    objc_msgSend(v7, "cliqueConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDE84B0];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke;
    v23[3] = &unk_24C7C11D8;
    v26 = v14;
    v27 = v16;
    v25 = v9;
    v24 = v8;
    objc_msgSend(v21, "removeCustodianRecoveryKey:custodianRecoveryKeyUUID:reply:", v20, v24, v23);

    goto LABEL_12;
  }
  objc_msgSend(v7, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    -[CDPCustodianRecoveryKeyController createRecoveryKeyWithContext:forUUID:completion:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5003);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v9 + 2))(v9, v20);
LABEL_12:

}

void __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  double v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  _CDPSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CustodianDeleteRecoveryKey", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 8u);
  }

  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (double)Nanoseconds / 1000000000.0;
    v10 = a1[6];
    v11 = objc_msgSend(v3, "code");
    v20 = 134218496;
    v21 = v10;
    v22 = 2048;
    v23 = v9;
    v24 = 1026;
    v25 = v11;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CustodianDeleteRecoveryKey  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v13)
      __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_2();
  }
  else if (v13)
  {
    __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_1((uint64_t)a1, v12, v14, v15, v16, v17, v18, v19);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)validateRecoveryKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
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
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_4:
    objc_msgSend(v8, "cliqueConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x24BE6E0F0]);
    objc_msgSend(v7, "wrappedRKC");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wrappingKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "custodianUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithWrappedKey:wrappingKey:uuid:error:", v14, v15, v16, 0);

    v18 = (void *)MEMORY[0x24BDE84B0];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke;
    v20[3] = &unk_24C7C1200;
    v22 = v9;
    v21 = v7;
    objc_msgSend(v18, "preflightRecoverOctagonUsingCustodianRecoveryKey:custodianRecoveryKey:reply:", v12, v17, v20);

    goto LABEL_5;
  }
  objc_msgSend(v8, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  _CDPLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[CDPCustodianRecoveryKeyController validateRecoveryKey:withContext:completion:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5003);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v9 + 2))(v9, v12);
LABEL_5:

}

void __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)recoverOctagonUsingCustodianInfo:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v22[16];
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_4:
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __93__CDPCustodianRecoveryKeyController_recoverOctagonUsingCustodianInfo_withContext_completion___block_invoke;
    v24[3] = &unk_24C7C10E8;
    v25 = v10;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BA9A30](v24);
    v23 = 0;
    -[CDPCustodianRecoveryKeyController _initializeRecoveryKeyWithInfo:error:](self, "_initializeRecoveryKeyWithInfo:error:", v8, &v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CDPCircleProxyImpl recoverOctagonUsingCustodianInfo:completion:].cold.1();

      ((void (**)(_QWORD, id))v13)[2](v13, v15);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_20D7E6000, v17, OS_LOG_TYPE_DEFAULT, "\"Attempting to recover octagon usign custodian recovery key\", v22, 2u);
      }

      v18 = (void *)MEMORY[0x24BDE84B0];
      objc_msgSend(v9, "cliqueConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "recoverOctagonUsingCustodianRecoveryKey:custodianRecoveryKey:reply:", v19, v14, v13);

    }
    v20 = v25;
    goto LABEL_12;
  }
  objc_msgSend(v9, "altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_4;
  _CDPLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    -[CDPCustodianRecoveryKeyController recoverOctagonUsingCustodianInfo:withContext:completion:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5003);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v20);
LABEL_12:

}

void __93__CDPCustodianRecoveryKeyController_recoverOctagonUsingCustodianInfo_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  uint8_t buf[2];

  v4 = a2;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v9 = 0;
      v7 = "\"Recover octagon usign custodian recovery key failed.\";
      v8 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    v7 = "\"Recover octagon usign custodian recovery key succeed.\";
    v8 = buf;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
}

- (id)_initializeRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CDPCustodianRecoveryKeyController _initializeRecoveryKeyWithInfo:error:].cold.1(v5);

  v7 = objc_alloc(MEMORY[0x24BE6E0F0]);
  objc_msgSend(v5, "wrappedRKC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wrappingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "custodianUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithWrappedKey:wrappingKey:uuid:error:", v8, v9, v10, a4);

  return v11;
}

- (BOOL)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:(id)a3 error:(id *)a4
{
  id v6;
  CDPRecoveryKeyStatusProvider *v7;
  NSObject *v8;
  int v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[CDPRecoveryKeyStatusProvider initWithContext:]([CDPRecoveryKeyStatusProvider alloc], "initWithContext:", v6);
  if (-[CDPRecoveryKeyStatusProvider idmsHasRK](v7, "idmsHasRK"))
  {
    objc_msgSend(v6, "cliqueConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v26 = 0;
      v9 = -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInOctagonWithError:](v7, "isRecoveryKeySetInOctagonWithError:", &v26);
      v10 = v26;
      if (v10)
      {
        _CDPLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:].cold.4();

        if (a4)
        {
          v12 = objc_retainAutorelease(v10);
LABEL_35:
          LOBYTE(v9) = 0;
          *a4 = v12;
LABEL_41:

          goto LABEL_42;
        }
LABEL_40:
        LOBYTE(v9) = 0;
        goto LABEL_41;
      }
      if (-[CDPCustodianRecoveryKeyController _isSOSTrustAndSyncingEnabled](self, "_isSOSTrustAndSyncingEnabled"))
      {
        if ((objc_msgSend(v6, "isSOSCompatibilityOptInNeeded") & 1) != 0)
        {
          if (-[CDPCustodianRecoveryKeyController _isInSOSCircleWithContext:](self, "_isInSOSCircleWithContext:", v6))
          {
            v25 = 0;
            v14 = -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInSOSWithError:](v7, "isRecoveryKeySetInSOSWithError:", &v25);
            v15 = v25;
            _CDPLogSystem();
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v15)
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:].cold.3();

              if (!a4)
              {
                LOBYTE(v9) = 0;
                goto LABEL_50;
              }
              v18 = objc_retainAutorelease(v15);
            }
            else
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:].cold.2(v9, v14, v17);

              LOBYTE(v9) = v9 & v14;
              if (!a4 || (v9 & 1) != 0)
                goto LABEL_50;
              _CDPStateError(-5317, 0);
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            LOBYTE(v9) = 0;
            *a4 = v18;
LABEL_50:

            goto LABEL_41;
          }
          _CDPLogSystem();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D7E6000, v23, OS_LOG_TYPE_DEFAULT, "\"SOS Opt In is needed. First Resolve SOS Compat CFU\", buf, 2u);
          }

          if (!a4)
            goto LABEL_40;
          v22 = -5318;
LABEL_34:
          _CDPStateError(v22, 0);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        _CDPLogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v28 = 1;
          v29 = 1024;
          v30 = v9;
          v20 = "\"SOS Opt In is not needed, SOS RK status does not matter. idMSHasRK=%{BOOL}d, rkSetInOctagon=%{BOOL}d\";
          goto LABEL_28;
        }
      }
      else
      {
        _CDPLogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v28 = 1;
          v29 = 1024;
          v30 = v9;
          v20 = "\"SOS trust and syncing is not enabled. idMSHasRK=%{BOOL}d, rkSetInOctagon=%{BOOL}d\";
LABEL_28:
          _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xEu);
        }
      }

      if (a4)
        v21 = v9;
      else
        v21 = 1;
      if ((v21 & 1) != 0)
        goto LABEL_41;
      v22 = -5317;
      goto LABEL_34;
    }
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", -5217, *a4);
      LOBYTE(v9) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:].cold.5();
    LOBYTE(v9) = 1;
  }
LABEL_42:

  return v9;
}

- (BOOL)_isInSOSCircleWithContext:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CDPSOSCircleProxyImpl syncingStatusForAltDSID:](CDPSOSCircleProxyImpl, "syncingStatusForAltDSID:", v3) == 1;

  return v4;
}

- (void)checkCustodianRecoveryKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  void (**v18)(id, _QWORD, void *);

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPCustodianRecoveryKeyController checkCustodianRecoveryKey:withContext:completion:].cold.3();

  objc_msgSend(v8, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    objc_msgSend(v8, "altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[CDPCustodianRecoveryKeyController checkCustodianRecoveryKey:withContext:completion:].cold.1();

      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5003);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v13);
      goto LABEL_14;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "cliqueConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDE84B0];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke;
    v17[3] = &unk_24C7C1228;
    v18 = v9;
    objc_msgSend(v14, "checkCustodianRecoveryKey:custodianRecoveryKeyUUID:reply:", v13, v7, v17);

LABEL_14:
    goto LABEL_15;
  }
  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CDPCustodianRecoveryKeyController checkCustodianRecoveryKey:withContext:completion:].cold.2();

  v9[2](v9, 0, 0);
LABEL_15:

}

void __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke_cold_1(a2, v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createRecoveryKeyWithContext:forUUID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_20D7E6000, v0, v1, "\"CDPCustodianController init is missing required dsid. Unable to process request, problems lie ahead …\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __85__CDPCustodianRecoveryKeyController_createRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Error creating custodian recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"Deleted custodian recovery key: for %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Error deleting custodian recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)validateRecoveryKey:withContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_20D7E6000, v0, v1, "\"CDPCustodianController init is missing required dsid. Unable to process preflight request\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "custodianUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_0(&dword_20D7E6000, v2, v3, "\"Custodian recovery key is valid for: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Error validating custodian recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)recoverOctagonUsingCustodianInfo:withContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_20D7E6000, v0, v1, "\"CDPCustodianController init is missing required dsid. Unable to process recovery request\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_initializeRecoveryKeyWithInfo:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "custodianUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_0(&dword_20D7E6000, v2, v3, "\"Obtaining recovery key from security for custodian recovery with UUID: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_20D7E6000, v0, OS_LOG_TYPE_ERROR, "\"CDPContext cliqueConfiguration returned nil. Cannot check if RK state matches across systems.\", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:(os_log_t)log error:.cold.2(char a1, char a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109632;
  v3[1] = 1;
  v4 = 1024;
  v5 = a1 & 1;
  v6 = 1024;
  v7 = a2 & 1;
  _os_log_debug_impl(&dword_20D7E6000, log, OS_LOG_TYPE_DEBUG, "\"idMSHasRK=%{BOOL}d, rkSetInOctagon=%{BOOL}d, rkSetInSOS=%{BOOL}d\", (uint8_t *)v3, 0x14u);
  OUTLINED_FUNCTION_5();
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Received error while checking if RK is set in SOS: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Received error while checking if RK is set in Octagon: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Early exit, since idms does not have a verifier\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)checkCustodianRecoveryKey:withContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_20D7E6000, v0, v1, "\"CDPCustodianController init is missing required dsid. Unable to process check Custodian Recovery Key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)checkCustodianRecoveryKey:withContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"OTClique does not respond to selector checkCustodianRecoveryKey:custodianRecoveryKeyUUID:reply:\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)checkCustodianRecoveryKey:withContext:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Checking if CRK exists in Octagon...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_DEBUG, "\"Custodian recovery key exists: %{BOOL}d\", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

void __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Error while checking if custodian recovery key is present: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
