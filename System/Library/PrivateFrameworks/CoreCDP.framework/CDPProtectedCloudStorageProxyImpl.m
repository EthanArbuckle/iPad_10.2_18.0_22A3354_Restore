@implementation CDPProtectedCloudStorageProxyImpl

- (BOOL)pcsIdentitySetCompanionInCircle:(_PCSIdentitySetData *)a3 error:(id *)a4
{
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  if (+[CDPUtilities hasFullCDPSupport](CDPUtilities, "hasFullCDPSupport"))
    return 0;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"setting companion in circle\", buf, 2u);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetCompanionInCircle_error___block_invoke;
  v9[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
  v9[4] = a3;
  return -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v9, a4);
}

uint64_t __75__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetCompanionInCircle_error___block_invoke()
{
  return PCSIdentitySetCompanionCircleMember();
}

- (_PCSIdentitySetData)pcsIdentityCreateWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _PCSIdentitySetData *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__CDPProtectedCloudStorageProxyImpl_pcsIdentityCreateWithInfo_error___block_invoke;
  v10[3] = &unk_24C7C0CE8;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v10, a4);
  v8 = (_PCSIdentitySetData *)v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __69__CDPProtectedCloudStorageProxyImpl_pcsIdentityCreateWithInfo_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PCSIdentitySetCreate();
  return 1;
}

- (BOOL)pcsIdentitySetIsInICDPNetwork:(_PCSIdentitySetData *)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _PCSIdentitySetData *v13;

  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetIsInICDPNetwork_options_error___block_invoke;
  v11[3] = &unk_24C7C0D10;
  v12 = v8;
  v13 = a3;
  v9 = v8;
  LOBYTE(a5) = -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v11, a5);

  return (char)a5;
}

uint64_t __81__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetIsInICDPNetwork_options_error___block_invoke()
{
  return PCSIdentitySetIsICDPNetworkWithOptions();
}

- (BOOL)pcsIdentitySetIsInICDPLocal:(_PCSIdentitySetData *)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetIsInICDPLocal_error___block_invoke;
  v5[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
  v5[4] = a3;
  return -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v5, a4);
}

uint64_t __71__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetIsInICDPLocal_error___block_invoke()
{
  return PCSIdentitySetIsICDP();
}

- (_PCSIdentitySetData)pcsIdentitySetupWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _PCSIdentitySetData *v8;
  _QWORD v10[4];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  if (+[CDPUtilities hasFullCDPSupport](CDPUtilities, "hasFullCDPSupport"))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"pcsIdentitySetupWithInfo:\", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x2020000000;
    v16 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetupWithInfo_error___block_invoke;
    v10[3] = &unk_24C7C0CE8;
    v12 = buf;
    v11 = v6;
    -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v10, a4);
    v8 = (_PCSIdentitySetData *)*((_QWORD *)v14 + 3);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __68__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetupWithInfo_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PCSIdentitySetup();
  return 1;
}

- (BOOL)pcsIdentityMigrateToiCDPWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v6 = a3;
  if (+[CDPUtilities hasFullCDPSupport](CDPUtilities, "hasFullCDPSupport"))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"pcsIdentityMigrateToiCDPWithInfo:\", buf, 2u);
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __76__CDPProtectedCloudStorageProxyImpl_pcsIdentityMigrateToiCDPWithInfo_error___block_invoke;
    v10[3] = &unk_24C7C0D38;
    v11 = v6;
    v8 = -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v10, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __76__CDPProtectedCloudStorageProxyImpl_pcsIdentityMigrateToiCDPWithInfo_error___block_invoke()
{
  return PCSIdentityMigrateToiCDP();
}

- (BOOL)pcsSynchronizeKeysWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v6 = a3;
  if (+[CDPUtilities hasFullCDPSupport](CDPUtilities, "hasFullCDPSupport"))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"pcsSynchronizeKeysWithInfo:\", buf, 2u);
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__CDPProtectedCloudStorageProxyImpl_pcsSynchronizeKeysWithInfo_error___block_invoke;
    v10[3] = &unk_24C7C0D38;
    v11 = v6;
    v8 = -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v10, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __70__CDPProtectedCloudStorageProxyImpl_pcsSynchronizeKeysWithInfo_error___block_invoke()
{
  return PCSIdentitySynchronizeKeys();
}

- (BOOL)pcsRestoreLocalBackup:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v6 = a3;
  if (+[CDPUtilities hasFullCDPSupport](CDPUtilities, "hasFullCDPSupport"))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"pcsRestoreLocalBackup:\", buf, 2u);
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__CDPProtectedCloudStorageProxyImpl_pcsRestoreLocalBackup_error___block_invoke;
    v10[3] = &unk_24C7C0D38;
    v11 = v6;
    v8 = -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v10, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __65__CDPProtectedCloudStorageProxyImpl_pcsRestoreLocalBackup_error___block_invoke()
{
  return PCSIdentityMigrateRestoreLocalBackup();
}

- (BOOL)isWalrusEnabledWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  _PCSIdentitySetData *v7;
  NSObject *v8;
  BOOL v9;
  _QWORD v11[4];
  NSObject *v12;
  _PCSIdentitySetData *v13;

  v6 = a3;
  v7 = -[CDPProtectedCloudStorageProxyImpl pcsIdentityCreateWithInfo:error:](self, "pcsIdentityCreateWithInfo:error:", v6, a4);
  if (*a4)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPProtectedCloudStorageProxyImpl isWalrusEnabledWithOptions:error:].cold.1(a4, v8);
    v9 = 0;
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__CDPProtectedCloudStorageProxyImpl_isWalrusEnabledWithOptions_error___block_invoke;
    v11[3] = &unk_24C7C0D10;
    v13 = v7;
    v12 = v6;
    v9 = -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v11, a4);
    v8 = v12;
  }

  return v9;
}

uint64_t __70__CDPProtectedCloudStorageProxyImpl_isWalrusEnabledWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = PCSIdentityiCDPWalrus();
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  return v2;
}

- (BOOL)repairWalrusWithAccountIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _PCSIdentitySetData *v10;
  NSObject *v11;
  BOOL v12;
  _PCSIdentitySetData *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  _QWORD v25[5];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[CDPProtectedCloudStorageProxyImpl pcsIdentityCreateWithInfo:error:](self, "pcsIdentityCreateWithInfo:error:", v9, a5);
  if (!*a5)
  {
    v13 = v10;
    if (!-[CDPProtectedCloudStorageProxyImpl isWalrusEnabledWithOptions:error:](self, "isWalrusEnabledWithOptions:error:", v9, a5))goto LABEL_14;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke;
    v25[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
    v25[4] = v13;
    v14 = -[CDPProtectedCloudStorageProxyImpl _performPCSBlock:error:](self, "_performPCSBlock:error:", v25, a5);
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CDPProtectedCloudStorageProxyImpl repairWalrusWithAccountIdentifier:options:error:].cold.2(v14, v15);

    if (!v14)
    {
LABEL_14:
      v12 = 1;
      if (!v13)
        goto LABEL_16;
LABEL_15:
      CFRelease(v13);
      goto LABEL_16;
    }
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CDPProtectedCloudStorageProxyImpl repairWalrusWithAccountIdentifier:options:error:].cold.1(v16);

    -[CDPProtectedCloudStorageProxyImpl setWalrusEnabled:accountIdentifier:options:error:](self, "setWalrusEnabled:accountIdentifier:options:error:", 1, v8, v9, a5);
    v17 = *a5;
    v12 = *a5 == 0;
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (!v19)
        goto LABEL_20;
      v20 = *a5;
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      v21 = "\"Walrus repair failed: %@\";
      v22 = v18;
      v23 = 12;
    }
    else
    {
      if (!v19)
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v21 = "\"Walrus repair succeeded\";
      v22 = v18;
      v23 = 2;
    }
    _os_log_impl(&dword_20D7E6000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
LABEL_20:

    if (!v13)
      goto LABEL_16;
    goto LABEL_15;
  }
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CDPProtectedCloudStorageProxyImpl isWalrusEnabledWithOptions:error:].cold.1(a5, v11);

  v12 = 0;
LABEL_16:

  return v12;
}

uint64_t __85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  _Unwind_Exception *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_ptr;
  v11 = getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_ptr;
  if (!getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_block_invoke;
    v7[3] = &unk_24C7C0D60;
    v7[4] = &v8;
    __getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_block_invoke((uint64_t)v7);
    v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v6 = (_Unwind_Exception *)__85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  return v4(v3, 1, a2);
}

- (BOOL)setWalrusEnabled:(BOOL)a3 accountIdentifier:(id)a4 options:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id *v18;
  char v19;
  BOOL v20;
  id v21;
  void *v22;
  unint64_t Nanoseconds;
  NSObject *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  _BYTE v35[10];
  double v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v8 = a3;
  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _CDPSignpostCreate(v11);
  v14 = v13;

  _CDPSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "UpdateAccountCleanupStatus", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v35 = v12;
    _os_log_impl(&dword_20D7E6000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: UpdateAccountCleanupStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  if (v8)
  {
    v33 = 0;
    v18 = (id *)&v33;
    v19 = PCSAccountEnableWalrus();
  }
  else
  {
    v32 = 0;
    v18 = (id *)&v32;
    v19 = PCSAccountDisableWalrus();
  }
  v20 = v19;
  v21 = *v18;
  v22 = v21;
  if (a6)
    *a6 = objc_retainAutorelease(v21);
  Nanoseconds = _CDPSignpostGetNanoseconds(v12, v14);
  _CDPSignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    v26 = objc_msgSend(v22, "code");
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v35 = v8;
    *(_WORD *)&v35[4] = 1026;
    *(_DWORD *)&v35[6] = v26;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v25, OS_SIGNPOST_INTERVAL_END, v12, "UpdateAccountCleanupStatus", " isEnabled=%{public,signpost.telemetry:number1,name=isEnabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  _CDPSignpostLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v22, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v35 = v12;
    *(_WORD *)&v35[8] = 2048;
    v36 = (double)Nanoseconds / 1000000000.0;
    v37 = 1026;
    v38 = v8;
    v39 = 1026;
    v40 = v28;
    _os_log_impl(&dword_20D7E6000, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: UpdateAccountCleanupStatus  isEnabled=%{public,signpost.telemetry:number1,name=isEnabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  if (!v20)
  {
    _CDPLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CDPProtectedCloudStorageProxyImpl setWalrusEnabled:accountIdentifier:options:error:].cold.1((uint64_t)v22, v29, v30);

  }
  return v20;
}

- (BOOL)_performPCSBlock:(id)a3 error:(id *)a4
{
  char v5;
  id v7;

  v7 = 0;
  v5 = (*((uint64_t (**)(id, id *))a3 + 2))(a3, &v7);
  if (a4)
  {
    *a4 = v7;
  }
  else if (v7)
  {
    CFRelease(v7);
  }
  return v5;
}

- (void)isWalrusEnabledWithOptions:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_20D7E6000, a2, v4, "\"Failed to create PCS identity with error: %@\", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

- (void)repairWalrusWithAccountIdentifier:(os_log_t)log options:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D7E6000, log, OS_LOG_TYPE_DEBUG, "\"Trying repair\", v1, 2u);
}

- (void)repairWalrusWithAccountIdentifier:(char)a1 options:(NSObject *)a2 error:.cold.2(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_DEBUG, "\"Walrus state after repair attempt - %i\", (uint8_t *)v2, 8u);
}

uint64_t __85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[CDPProtectedCloudStorageProxyImpl setWalrusEnabled:accountIdentifier:options:error:].cold.1(v0);
}

- (void)setWalrusEnabled:(uint64_t)a3 accountIdentifier:options:error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_20D7E6000, a2, a3, "\"Walrus update failed with error: %@\", (uint8_t *)&v3);
}

@end
