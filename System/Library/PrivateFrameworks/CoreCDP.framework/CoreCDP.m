id CDPDaemonExportedInterface()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D5718);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchEscrowRecordDevicesWithContext_usingCache_completion_, 0, 0);

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_fetchEscrowRecordDevicesWithContext_usingCache_completion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_fetchEscrowRecordDevicesWithContext_usingCache_completion_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_walrusStatusWithContext_completion_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_combinedWalrusStatusWithContext_completion_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_combinedWalrusStatusWithContext_completion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_combinedWalrusStatusWithContext_completion_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_updateWalrusStatus_completion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_updateWalrusStatus_completion_, 1, 1);

  CDPUIProviderExportedInterface();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_handleCloudDataProtectionStateWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_repairCloudDataProtectionStateWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_recoverAndSynchronizeSquirrelWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_recoverSquirrelWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_localSecretChangedTo_secretType_context_uiProvider_completion_, 3, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_finishOfflineLocalSecretChangeWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_performRecoveryWithContext_uiProvider_authProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_authenticateAndGenerateNewRecoveryKeyWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_authenticateAndDeleteRecoveryKeyWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_generateNewRecoveryKeyWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_verifyRecoveryKeyWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_deleteRecoveryKeyWithContext_uiProvider_completion_, 1, 0);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion_, 1, 0);
  CDPAuthProviderExportedInterface();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_performRecoveryWithContext_uiProvider_authProvider_completion_, 2, 0);

  return v0;
}

id getUMUserManagerClass()
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
  v0 = (void *)getUMUserManagerClass_softClass;
  v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_24C7C0D60;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20D7E7F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CDPStateError(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), a1, a2);
}

id _CDPLogSystem()
{
  if (_CDPLogSystem_onceToken != -1)
    dispatch_once(&_CDPLogSystem_onceToken, &__block_literal_global_8);
  return (id)_CDPLogSystem_log;
}

uint64_t UserManagementLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = UserManagementLibraryCore_frameworkLibrary;
  v6 = UserManagementLibraryCore_frameworkLibrary;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24C7C0EB0;
    v8 = *(_OWORD *)&off_24C7C0EC0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    UserManagementLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20D7E8120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_2_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id CDPUIProviderExportedInterface()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CE720);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_cdpContext_promptForInteractiveAuthenticationWithCompletion_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CD580);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_validateSecret_devices_type_withCompletion_, 1, 0);

  v33 = (void *)MEMORY[0x24BDBCF20];
  v32 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v32, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_validateSecret_devices_type_withCompletion_, 2, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_resetAccountCDPStateWithEscapeOptionsOffered_andSetSecret_, 1, 0);

  objc_msgSend(v7, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator_, 3, 0);
  objc_msgSend(v7, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator_, 2, 0);
  objc_msgSend(v7, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator_, 4, 0);
  objc_msgSend(v7, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_cdpContext_promptForRecoveryKeyWithSecretValidator_completion_, 1, 0);
  v21 = (void *)MEMORY[0x24BDBCF20];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator_, 1, 0);

  v24 = (void *)MEMORY[0x24BDBCF20];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D0508);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterface:forSelector:argumentIndex:ofReply:", v27, sel_cdpContext_presentRecoveryKeyWithValidator_completion_, 1, 0);
  objc_msgSend(v7, "setInterface:forSelector:argumentIndex:ofReply:", v27, sel_cdpContext_promptForRecoveryKeyWithValidator_completion_, 1, 0);
  v28 = (void *)MEMORY[0x24BDBCF20];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  v35[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_cdpContext_promptForBeneficiaryAccessKeyWithCompletion_, 0, 1);

  return v7;
}

id CDPAuthProviderExportedInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CDB80);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_cdpContext_performSilentRecoveryTokenRenewal_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_cdpContext_performSilentRecoveryTokenRenewal_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_cdpContext_verifyMasterKey_completion_, 1, 1);

  return v0;
}

void sub_20D7E8AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D7E9170(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20D7EA898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D7EAB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (ProtectedCloudStorageLibraryCore_frameworkLibrary)
  {
    v2 = (void *)ProtectedCloudStorageLibraryCore_frameworkLibrary;
  }
  else
  {
    ProtectedCloudStorageLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)ProtectedCloudStorageLibraryCore_frameworkLibrary;
    if (!ProtectedCloudStorageLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "PCSIdentitySetIsWalrusWithForceFetch");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20D7EC748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x2Au);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t UserManagementLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = UserManagementLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

const __CFString *__getUMUserManagerClass_block_invoke(uint64_t a1)
{
  const __CFString *result;
  uint64_t v3;

  UserManagementLibrary();
  result = (const __CFString *)objc_getClass("UMUserManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUMUserManagerClass_block_invoke_cold_1();
    return CDPContextTypeAnalyticsString(v3);
  }
  return result;
}

const __CFString *CDPContextTypeAnalyticsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xB)
    return CFSTR("Unknown");
  else
    return off_24C7C0EF8[a1 - 1];
}

void sub_20D7EF4D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D7EF56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D7EF7D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D7EF87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = 1752392040;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

id OUTLINED_FUNCTION_11(void *a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_20D7F45BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state,char a22)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D7F49E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D7F558C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D7F5790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void cdp_dispatch_async_with_qos(void *a1, dispatch_qos_class_t a2, void *a3)
{
  NSObject *v5;
  id v6;

  v5 = a1;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, a2, 0, a3);
  dispatch_async(v5, v6);

}

void cdp_dispatch_sync_with_qos(void *a1, dispatch_qos_class_t a2, void *a3)
{
  NSObject *v5;
  id v6;

  v5 = a1;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, a2, 0, a3);
  dispatch_sync(v5, v6);

}

void cdp_dispatch_after_with_qos(dispatch_time_t a1, void *a2, dispatch_qos_class_t a3, void *a4)
{
  NSObject *v7;
  id v8;

  v7 = a2;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, a3, 0, a4);
  dispatch_after(a1, v7, v8);

}

void sub_20D7F8668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D7F8920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20D7F8BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D7F8EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v27 - 96));
  _Unwind_Resume(a1);
}

void sub_20D7F911C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D7F95A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_20D7F98B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_20D7F9B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D7F9E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 80));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_20D7FA130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

const __CFString *CDPEscrowRecordStateString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_24C7C15A8[a1 - 1];
}

const __CFString *CDPEscrowRecordSecretViabilityString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_24C7C15C8[a1 - 1];
}

void sub_20D7FCB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_20D7FCEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

id CDPDeviceClassToLocKey(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = CDPDeviceClassToLocKey_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&CDPDeviceClassToLocKey_onceToken, &__block_literal_global_3);
  v3 = (void *)CDPDeviceClassToLocKey_mapping;
  objc_msgSend(v2, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _CDPSuffixForDeviceClass(void *a1)
{
  uint64_t v1;
  __CFString *v2;
  void *v3;

  CDPDeviceClassToLocKey(a1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (__CFString *)v1;
  else
    v2 = CFSTR("DEVICE");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

const __CFString *CDPUnqualifiedDeviceClassToLocKey(void *a1)
{
  id v1;
  void *v2;
  char v3;
  const __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  int v16;

  v1 = a1;
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("iphone"));

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("IPHONE");
  }
  else
  {
    objc_msgSend(v1, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsString:", CFSTR("ipad"));

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("IPAD");
    }
    else
    {
      objc_msgSend(v1, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsString:", CFSTR("ipod touch"));

      if ((v8 & 1) != 0)
      {
        v4 = CFSTR("IPOD_TOUCH");
      }
      else
      {
        objc_msgSend(v1, "lowercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsString:", CFSTR("apple tv"));

        if ((v10 & 1) != 0)
        {
          v4 = CFSTR("ATV");
        }
        else
        {
          objc_msgSend(v1, "lowercaseString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsString:", CFSTR("mac"));

          if ((v12 & 1) != 0)
          {
            v4 = CFSTR("MAC");
          }
          else
          {
            objc_msgSend(v1, "lowercaseString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "containsString:", CFSTR("apple watch"));

            if ((v14 & 1) != 0)
            {
              v4 = CFSTR("WATCH");
            }
            else
            {
              objc_msgSend(v1, "lowercaseString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "containsString:", CFSTR("apple vision"));

              if (v16)
                v4 = CFSTR("VISION");
              else
                v4 = 0;
            }
          }
        }
      }
    }
  }

  return v4;
}

id _CDPSuffixForUnqualifiedDeviceClass(void *a1)
{
  uint64_t v1;
  __CFString *v2;
  void *v3;

  CDPUnqualifiedDeviceClassToLocKey(a1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (__CFString *)v1;
  else
    v2 = CFSTR("DEVICE");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

const __CFString *_CDPSuffixForSecretType(uint64_t a1)
{
  if (a1 == 2)
    return CFSTR("_PASSWORD");
  else
    return CFSTR("_PASSCODE");
}

id _CDPStateErrorWithUnderlying(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v11 = *MEMORY[0x24BDD1398];
    v12[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = 0;
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), a1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

void HandleWalrusStateChangedNotification()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  _CDPLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_20D7E6000, v0, OS_LOG_TYPE_DEFAULT, "\"Walrus state change notification received, posting local notification.\"", v2, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("CDPWalrusStateChangeNotification"), 0);

}

void sub_20D7FFFC0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D800210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void HandleWebAccessStateChangedNotification()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  _CDPLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_20D7E6000, v0, OS_LOG_TYPE_DEFAULT, "\"Web access state change notification received, posting local notification.\"", v2, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("CDPWebAccessStateChangeNotification"), 0);

}

void sub_20D80224C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D802D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_20D802F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D803198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D80342C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id _CDPSignpostLogSystem()
{
  if (_CDPSignpostLogSystem_onceToken != -1)
    dispatch_once(&_CDPSignpostLogSystem_onceToken, &__block_literal_global_3);
  return (id)_CDPSignpostLogSystem_log;
}

id _CDPLogSystemAnalytics()
{
  if (_CDPLogSystemAnalytics_onceToken != -1)
    dispatch_once(&_CDPLogSystemAnalytics_onceToken, &__block_literal_global_5);
  return (id)_CDPLogSystemAnalytics_log;
}

os_signpost_id_t _CDPSignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1;

  v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

unint64_t _CDPSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (_CDPSignpostGetNanoseconds_onceToken != -1)
    dispatch_once(&_CDPSignpostGetNanoseconds_onceToken, &__block_literal_global_7);
  v3 = mach_continuous_time();
  LODWORD(v4) = _CDPSignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_253D1C16C;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

void sub_20D8038C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_20D803BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D803FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D804340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D804760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D804D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SetupAssistantLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = SetupAssistantLibraryCore_frameworkLibrary;
  v6 = SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24C7C1A28;
    v8 = *(_OWORD *)&off_24C7C1A38;
    v1 = _sl_dlopen();
    v4[3] = v1;
    SetupAssistantLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20D8053EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = SetupAssistantLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getBYSetupAssistantNeedsToRunSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v6 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    v1 = (void *)SetupAssistantLibrary();
    v0 = dlsym(v1, "BYSetupAssistantNeedsToRun");
    v4[3] = (uint64_t)v0;
    getBYSetupAssistantNeedsToRunSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20D8054D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _BYSetupAssistantNeedsToRun()
{
  uint64_t (*BYSetupAssistantNeedsToRunSymbolLoc)(void);
  void *v2;
  SEL v3;

  BYSetupAssistantNeedsToRunSymbolLoc = (uint64_t (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc();
  if (BYSetupAssistantNeedsToRunSymbolLoc)
    return BYSetupAssistantNeedsToRunSymbolLoc();
  v2 = (void *)__85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke_cold_1();
  return +[CDPUtilities hasFullCDPSupport](v2, v3);
}

id CDPLocalizedString(void *a1)
{
  return CDPLocalizedStringInTable(a1, 0);
}

id CDPLocalizedStringInTable(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = CDPLocalizedStringInTable_onceToken;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&CDPLocalizedStringInTable_onceToken, &__block_literal_global_102);
  objc_msgSend((id)CDPLocalizedStringInTable_bundle, "localizedStringForKey:value:table:", v5, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_20D80627C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D80673C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
  _Block_object_dispose(&a24, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_20D806D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
  _Block_object_dispose(&a24, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D80724C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D80763C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D807988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D807CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D8080E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_20D808718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D808AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D808E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_20D809128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_20D8093D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_20D809790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D809B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void sub_20D809F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  uint64_t v22;

  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D80A2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void sub_20D80A6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  uint64_t v22;

  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D80AA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void sub_20D80AE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  uint64_t v22;

  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v22 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20D80B158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  uint64_t v22;

  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D80B3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void sub_20D80B870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  uint64_t v22;

  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D80BAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  os_activity_scope_leave(&state);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void sub_20D80BF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_20D80C1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20D80C5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_20D80C95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_20D80CC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a17, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D80D05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  uint64_t v27;

  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose(&a23, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D80D588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D80DA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D80DF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_20D80E3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v29 - 128));
  _Unwind_Resume(a1);
}

void sub_20D80E82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_10_1()
{
  JUMPOUT(0x212BA9A30);
}

void sub_20D80ECA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_20D80F278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initCDPDLocalDeviceSecretProxyImpl()
{
  Class result;

  if (CoreCDPInternalLibrary_sOnce != -1)
    dispatch_once(&CoreCDPInternalLibrary_sOnce, &__block_literal_global_106);
  result = objc_getClass("CDPDLocalDeviceSecretProxyImpl");
  classCDPDLocalDeviceSecretProxyImpl = (uint64_t)result;
  getCDPDLocalDeviceSecretProxyImplClass = (uint64_t (*)())CDPDLocalDeviceSecretProxyImplFunction;
  return result;
}

id CDPDLocalDeviceSecretProxyImplFunction()
{
  return (id)classCDPDLocalDeviceSecretProxyImpl;
}

void sub_20D810E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_20D8114A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t lib_platform_rng()
{
  uint64_t v0;

  v0 = ccrng();
  REQUIRE_func(v0 != 0, 22, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  REQUIRE_func(0, 23, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  return v0;
}

uint64_t lib_platform_read_random(uint64_t a1, unsigned int a2)
{
  unsigned int (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  _BOOL8 v6;

  v4 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t))platform_rng();
  v5 = platform_rng();
  v6 = v4(v5, a2, a1) == 0;
  return REQUIRE_func(v6, 31, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
}

uint64_t rfc3394_wrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unint64_t a6, _QWORD *a7, unint64_t *a8)
{
  size_t v14;
  size_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  unint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _OWORD __s[4];
  uint64_t v43;

  v39 = a1;
  v40 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  ccaes_cbc_encrypt_mode();
  MEMORY[0x24BDAC7A8]();
  v41 = (char *)&v34 - v14;
  bzero((char *)&v34 - v14, v14);
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v34 - v15, v15);
  v16 = 0xFFFFFFFFLL;
  if (HIDWORD(a6) || (a6 - 40) < 0xFFFFFFE0)
    goto LABEL_30;
  v37 = &v34;
  v38 = a8;
  v36 = a7;
  if (!a4)
  {
    v18 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v18 || !a8 || *a8 < a6 + 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_31;
    }
    v35 = a6 + 8;
    cccbc_init();
    goto LABEL_15;
  }
  if (a8)
  {
    v17 = *v38;
    v35 = a6 + 8;
    if (v17 >= a6 + 8)
    {
LABEL_15:
      v19 = 0;
      v20 = a6 >> 3;
      if (a6 >> 3 <= 1)
        v21 = 1;
      else
        v21 = v20;
      do
      {
        v22 = *a5++;
        *((_QWORD *)&__s[v19++] + 1) = v22;
      }
      while (v21 != v19);
      v23 = 0;
      *(_QWORD *)&__s[0] = v40;
      v24 = 1;
      v39 = v20;
      do
      {
        v40 = v23;
        v25 = 0;
        v26 = (uint64_t *)__s;
        do
        {
          if (a4)
          {
            if ((a4(1, &firebloom_null_iv, v26, v26, 16) & 1) == 0)
              goto LABEL_6;
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f();
          }
          v27 = *v26;
          v26 += 2;
          v28 = v27 ^ bswap64(v24 + v25++);
          *(_QWORD *)&__s[v25 % v20] = v28;
        }
        while (v21 != v25);
        v23 = v40 + 1;
        v24 += v39;
      }
      while (v40 != 5);
      v29 = v36;
      *v36 = *(_QWORD *)&__s[0];
      v30 = v29 + 1;
      v31 = (uint64_t *)__s + 1;
      do
      {
        v32 = *v31;
        v31 += 2;
        *v30++ = v32;
        --v21;
      }
      while (v21);
      v16 = 0;
      *v38 = v35 & 0xFFFFFFF8;
LABEL_30:
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4)
        return v16;
LABEL_31:
      cc_clear();
      return v16;
    }
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_wrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v9;
  unint64_t v11;

  v11 = *a8;
  v9 = rfc3394_wrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_unwrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), _QWORD *a5, unint64_t a6, _QWORD *a7, _QWORD *a8)
{
  size_t v14;
  size_t v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  unint64_t *v26;
  int v27;
  unsigned int v28;
  BOOL v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  _QWORD *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  char *v44;
  _OWORD __s[4];
  uint64_t v46;

  v43 = a5;
  v41 = a1;
  v46 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  ccaes_cbc_decrypt_mode();
  MEMORY[0x24BDAC7A8]();
  v44 = (char *)&v35 - v14;
  bzero((char *)&v35 - v14, v14);
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v35 - v15, v15);
  v16 = 0xFFFFFFFFLL;
  if (HIDWORD(a6))
    goto LABEL_33;
  v37 = a3;
  v17 = a6 >> 3;
  if ((a6 >> 3) - 6 < 0xFFFFFFFC)
    goto LABEL_33;
  v38 = &v35;
  v39 = a8;
  v36 = a7;
  v42 = a6;
  if (!a4)
  {
    v18 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v18 || !a8 || *a8 < a6 - 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_34;
    }
    cccbc_init();
    goto LABEL_15;
  }
  if (a8 && *v39 >= v42 - 8)
  {
LABEL_15:
    *(_QWORD *)&__s[0] = *v43;
    v19 = v17 - 1;
    if (v17 != 1)
    {
      v20 = (_QWORD *)__s + 1;
      v21 = v43 + 1;
      v22 = v17 - 1;
      do
      {
        v23 = *v21++;
        *v20 = v23;
        v20 += 2;
        --v22;
      }
      while (v22);
    }
    v24 = 6 * v17 - 6;
    LODWORD(v41) = 1 - v17;
    v25 = 5;
    v40 = (unint64_t *)&__s[v17 - 2];
    do
    {
      LODWORD(v43) = v25;
      if (v42 >= 0x10)
      {
        v26 = v40;
        v27 = v19;
        v28 = v24;
        do
        {
          *v26 = *(_QWORD *)&__s[v27 % v19] ^ bswap64(v28);
          if (a4)
          {
            if ((a4(0, &firebloom_null_iv, v26, v26, 16) & 1) == 0)
              goto LABEL_6;
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f();
          }
          --v28;
          v26 -= 2;
          v29 = __OFSUB__(v27--, 1);
        }
        while (!((v27 < 0) ^ v29 | (v27 == 0)));
      }
      v25 = (_DWORD)v43 - 1;
      v24 += v41;
    }
    while ((_DWORD)v43);
    if (*(_QWORD *)&__s[0] == v37)
    {
      v30 = v36;
      if ((_DWORD)v19)
      {
        v31 = (uint64_t *)__s + 1;
        v32 = v19;
        do
        {
          v33 = *v31;
          v31 += 2;
          *v30++ = v33;
          --v32;
        }
        while (v32);
      }
      v16 = 0;
      *v39 = (8 * v19);
    }
    else
    {
      v16 = 0xFFFFFFFFLL;
    }
LABEL_33:
    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (a4)
      return v16;
LABEL_34:
    cc_clear();
    return v16;
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_unwrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), _QWORD *a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v9;
  uint64_t v11;

  v11 = *a8;
  v9 = rfc3394_unwrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 261, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_wrapped_size_legacy(unsigned int a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int v5;

  v2 = a1 + 15;
  v3 = v2 << 31 >> 31;
  v4 = v3 != v2 || v3 < 0;
  v5 = v4;
  if (!v4)
    *a2 = v3 & 0xFFFFFFF8;
  return v5 ^ 1u;
}

uint64_t rfc3394_wrapped_size(unint64_t a1, unint64_t *a2)
{
  uint64_t v2;
  BOOL v3;
  int v4;

  v2 = a1 >= 0xFFFFFFFFFFFFFFF1;
  v3 = v2 << 63 >> 63 != v2 || v2 << 63 >> 63 == -1;
  v4 = v3;
  if (!v3)
    *a2 = (a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  return v4 ^ 1u;
}

BOOL rfc3394_unwrapped_size_legacy(unsigned int a1, unsigned int *a2)
{
  unsigned int v2;
  _BOOL8 result;

  v2 = a1 - 8;
  result = a1 > 7;
  *a2 = v2;
  return result;
}

BOOL rfc3394_unwrapped_size(unint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  _BOOL8 result;

  v2 = a1 - 8;
  result = a1 > 7;
  *a2 = v2;
  return result;
}

uint64_t aks_fv_new_vek()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t aks_client_connection;
  mach_port_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  size_t v19;
  uint64_t input[2];
  _BYTE __s[4096];
  _QWORD v22[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v22[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v18 = __s;
  *((_QWORD *)&v18 + 1) = v22;
  v19 = 4096;
  v12 = 3758097090;
  if (v6 && v4)
  {
    aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_new_vek", ":", 179, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v12 = 3758097084;
      goto LABEL_16;
    }
    v14 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v18, v8)
      || !der_utils_encode_fv_data(&v18, v10)
      || !der_utils_encode_fv_params(&v18, v11)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_14;
    }
    input[0] = *((_QWORD *)&v18 + 1);
    input[1] = (uint64_t)v22 - *((_QWORD *)&v18 + 1);
    v15 = IOConnectCallMethod(v14, 0x4Au, input, 2u, 0, 0, 0, 0, __s, &v19);
    if ((_DWORD)v15)
    {
      v12 = v15;
      goto LABEL_16;
    }
    *(_QWORD *)&v17 = __s;
    *((_QWORD *)&v17 + 1) = &__s[v19];
    if (!ccder_blob_decode_range() || !der_utils_decode_fv_data(&v17, 0, v4))
      goto LABEL_14;
    if (!v2)
    {
      v12 = 0;
      goto LABEL_16;
    }
    v12 = 0;
    if ((der_utils_decode_fv_key(&v17, 0, v2) & 1) == 0)
LABEL_14:
      v12 = 3758097098;
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v12;
}

uint64_t get_aks_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_150);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

unint64_t _aks_save_file(char *a1, const void *a2, size_t a3)
{
  unint64_t v3;
  int v6;
  int v7;
  ssize_t v8;
  int *v10;
  char *v11;
  int *v12;
  char *v13;

  v3 = (unint64_t)a1;
  if (a1)
  {
    v6 = open_dprotected_np(a1, 1793, 4, 0, 384);
    if (v6 == -1)
    {
      v10 = __error();
      v11 = strerror(*v10);
      syslog(3, "could not create file: %s (%s)\n", (const char *)v3, v11);
      return 0;
    }
    else
    {
      v7 = v6;
      v8 = write(v6, a2, a3);
      v3 = v8 != -1;
      if (v8 == -1)
      {
        v12 = __error();
        v13 = strerror(*v12);
        syslog(3, "failed to write restore bag to disk %s\n", v13);
      }
      close(v7);
    }
  }
  return v3;
}

const char *_aks_load_file(char *a1, _QWORD *a2, size_t *a3)
{
  const char *v3;
  size_t st_size;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int *v12;
  char *v13;
  stat v14;

  v3 = a1;
  memset(&v14, 0, sizeof(v14));
  if (a1)
  {
    if (!stat(a1, &v14))
    {
      st_size = v14.st_size;
      v7 = open(v3, 0);
      if (v7 == -1)
      {
        v12 = __error();
        v13 = strerror(*v12);
        syslog(3, "could not open file: %s (%s)\n", v3, v13);
      }
      else
      {
        v8 = v7;
        v9 = calloc(st_size, 1uLL);
        v3 = (const char *)(v9 != 0);
        if (!v9)
        {
LABEL_7:
          close(v8);
          return v3;
        }
        v10 = v9;
        if (read(v8, v9, st_size) == st_size)
        {
          *a2 = v10;
          *a3 = st_size;
          goto LABEL_7;
        }
        close(v8);
        free(v10);
      }
    }
    return 0;
  }
  return v3;
}

uint64_t aks_delete_xart_leak(unsigned int a1, const void *a2)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x6Cu, input, 1u, a2, 0x10uLL, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_delete_xart_leak", ":", 268, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

char *_iterate_path(char *result, uint64_t a2, uint64_t a3)
{
  FTS *v5;
  FTSENT *v6;
  FTSENT *v7;
  int fts_info;
  char *v9[3];

  v9[2] = *(char **)MEMORY[0x24BDAC8D0];
  if (result)
  {
    v9[0] = result;
    v9[1] = 0;
    result = (char *)fts_open(v9, 84, 0);
    if (result)
    {
      v5 = (FTS *)result;
      v6 = fts_read((FTS *)result);
      if (v6)
      {
        v7 = v6;
        do
        {
          fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
                if (((*(uint64_t (**)(uint64_t, FTSENT *))(a2 + 16))(a2, v7) & 1) == 0)
                  fts_set(v5, v7, 4);
              }
            }
            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }
          v7 = fts_read(v5);
        }
        while (v7);
      }
      return (char *)fts_close(v5);
    }
  }
  return result;
}

char *aks_dump_path(char *result, int a2)
{
  const char *v3;
  _QWORD v4[4];
  int v5;
  _QWORD v6[4];
  int v7;
  char v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    bzero(v8, 0x400uLL);
    result = realpath_DARWIN_EXTSN(v3, v8);
    if (result)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 0x40000000;
      v6[2] = __aks_dump_path_block_invoke;
      v6[3] = &__block_descriptor_tmp;
      v7 = a2;
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 0x40000000;
      v4[2] = __aks_dump_path_block_invoke_2;
      v4[3] = &__block_descriptor_tmp_126;
      v5 = a2;
      return _iterate_path(v8, (uint64_t)v6, (uint64_t)v4);
    }
  }
  return result;
}

uint64_t __aks_dump_path_block_invoke(uint64_t a1, uint64_t a2)
{
  int path_class;
  int v5;

  path_class = _get_path_class(*(const char **)(a2 + 48));
  v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || path_class == v5)
    printf(" dir: %s %i\n", *(const char **)(a2 + 48), path_class);
  return 1;
}

uint64_t _get_path_class(const char *a1)
{
  int v1;
  int v2;
  uint64_t v3;

  v1 = open_dprotected_np(a1, 0, 0, 1);
  if (v1 == -1)
    return 0xFFFFFFFFLL;
  v2 = v1;
  v3 = fcntl(v1, 63);
  if ((v2 & 0x80000000) == 0)
    close(v2);
  return v3;
}

uint64_t __aks_dump_path_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;

  result = _get_path_class(*(const char **)(a2 + 48));
  v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || (_DWORD)result == v5)
    return printf("file: %s %i\n", *(const char **)(a2 + 48), result);
  return result;
}

uint64_t aks_fs_supports_enhanced_apfs()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  _BOOL4 v3;
  unsigned int v4;
  size_t __len;
  char __big[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], "IODeviceTree:/filesystems");
  if (v0)
  {
    v1 = v0;
    CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("e-apfs"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v3 = CFProperty != 0;
    if (CFProperty)
      CFRelease(CFProperty);
    IOObjectRelease(v1);
  }
  else
  {
    v3 = 0;
  }
  __len = 1023;
  bzero(__big, 0x400uLL);
  if ((_aks_check_apfs_shared_datavolume_bootarg_init & 1) == 0)
  {
    if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len))
      _aks_check_apfs_shared_datavolume_bootarg_value = 1;
    _aks_check_apfs_shared_datavolume_bootarg_init = 1;
  }
  v4 = _aks_check_apfs_shared_datavolume_bootarg_value;
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s ioreg: %d, boot_arg: %d%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fs_supports_enhanced_apfs", ":", 437, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, v3, _aks_check_apfs_shared_datavolume_bootarg_value, (const char *)&unk_20D83E577);
  return v3 | v4;
}

uint64_t aks_fs_status(const char *a1)
{
  char __str[1024];
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  bzero(v4, 0x400uLL);
  bzero(__str, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v4))
  {
    snprintf(__str, 0x400uLL, "%s/mobile", v4);
    aks_fs_status_with_map(v4, (uint64_t)&sharedPathMap, 35);
    if ((aks_fs_supports_enhanced_apfs() & 1) == 0)
      aks_fs_status_with_map(__str, (uint64_t)&userPathMap, 72);
  }
  return 0;
}

void aks_fs_status_with_map(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  stat v7;
  char __str[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  bzero(__str, 0x400uLL);
  memset(&v7, 0, sizeof(v7));
  if (a3)
  {
    v6 = a2 + 16;
    do
    {
      snprintf(__str, 0x400uLL, "%s%s", a1, *(const char **)(v6 - 16));
      if (stat(__str, &v7))
      {
        printf("stat failed: %s\n");
      }
      else
      {
        _get_path_class(__str);
        printf("%s: mode=%o, u/g=%i:%i class=%i%s\n");
      }
      v6 += 48;
      --a3;
    }
    while (a3);
  }
}

uint64_t aks_user_fs_status(const char *a1)
{
  char v3[1024];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  bzero(v3, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v3))
    aks_fs_status_with_map(v3, (uint64_t)&userPathMap, 72);
  return 0;
}

const char *aks_show_allowlist()
{
  puts("shared allow list:");
  aks_show_allowlist_with_map("<var>", (uint64_t)&sharedPathMap, 35);
  puts("user allow list:");
  return aks_show_allowlist_with_map("<user>", (uint64_t)&userPathMap, 72);
}

const char *aks_show_allowlist_with_map(const char *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  const char *v4;
  const char **v5;
  const char **v6;
  char v7;

  if (a3)
  {
    v3 = a3;
    v4 = result;
    v5 = (const char **)(a2 + 16);
    v6 = (const char **)(a2 + 16);
    do
    {
      v7 = *(_BYTE *)v6;
      v6 += 6;
      if ((v7 & 1) != 0)
        result = (const char *)printf("%s%s\n", v4, *(v5 - 2));
      v5 = v6;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t aks_fv_new_kek()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t aks_client_connection;
  mach_port_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  size_t v17;
  uint64_t input[3];
  _BYTE __s[4096];
  uint64_t v20;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v20 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v16 = __s;
  *((_QWORD *)&v16 + 1) = &v20;
  v17 = 4096;
  v10 = 3758097090;
  if (v4 && v2)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v12 = aks_client_connection;
      if (!ccder_blob_encode_body_tl()
        || !der_utils_encode_fv_data(&v16, v6)
        || !der_utils_encode_fv_params(&v16, v9)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_10;
      }
      input[0] = v8;
      input[1] = *((_QWORD *)&v16 + 1);
      input[2] = (uint64_t)&v20 - *((_QWORD *)&v16 + 1);
      v13 = IOConnectCallMethod(v12, 0x4Cu, input, 3u, 0, 0, 0, 0, __s, &v17);
      if ((_DWORD)v13)
      {
        v10 = v13;
        goto LABEL_12;
      }
      *(_QWORD *)&v15 = __s;
      *((_QWORD *)&v15 + 1) = &__s[v17];
      if (!ccder_blob_decode_range() || (v10 = 0, (der_utils_decode_fv_data(&v15, 0, v2) & 1) == 0))
LABEL_10:
        v10 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_new_kek", ":", 508, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v10 = 3758097084;
    }
  }
LABEL_12:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t aks_fv_new_sibling_vek()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t aks_client_connection;
  mach_port_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  size_t v17;
  uint64_t input[2];
  _BYTE __s[4096];
  uint64_t v20;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v20 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v16 = __s;
  *((_QWORD *)&v16 + 1) = &v20;
  v17 = 4096;
  v10 = 3758097090;
  if (v6 && v4)
  {
    aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_new_sibling_vek", ":", 543, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v10 = 3758097084;
      goto LABEL_15;
    }
    v12 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v16, v8)
      || !der_utils_encode_fv_params(&v16, v9)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_13;
    }
    input[0] = *((_QWORD *)&v16 + 1);
    input[1] = (uint64_t)&v20 - *((_QWORD *)&v16 + 1);
    v13 = IOConnectCallMethod(v12, 0x63u, input, 2u, 0, 0, 0, 0, __s, &v17);
    if ((_DWORD)v13)
    {
      v10 = v13;
      goto LABEL_15;
    }
    *(_QWORD *)&v15 = __s;
    *((_QWORD *)&v15 + 1) = &__s[v17];
    if (!ccder_blob_decode_range() || !der_utils_decode_fv_data(&v15, 0, v4))
      goto LABEL_13;
    if (!v2)
    {
      v10 = 0;
      goto LABEL_15;
    }
    v10 = 0;
    if ((der_utils_decode_fv_key(&v15, 0, v2) & 1) == 0)
LABEL_13:
      v10 = 3758097098;
  }
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t aks_fv_rewrap_kek()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t aks_client_connection;
  mach_port_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  size_t v19;
  uint64_t input[2];
  _BYTE __s[4096];
  _QWORD v22[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v22[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v18 = __s;
  *((_QWORD *)&v18 + 1) = v22;
  v19 = 4096;
  v12 = 3758097090;
  if (v8 && v6 && v4 && v2)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v14 = aks_client_connection;
      if (!der_utils_encode_fv_data(&v18, v4)
        || !ccder_blob_encode_body_tl()
        || !der_utils_encode_fv_data(&v18, v8)
        || !der_utils_encode_fv_data(&v18, v10)
        || !der_utils_encode_fv_params(&v18, v11)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_14;
      }
      input[0] = *((_QWORD *)&v18 + 1);
      input[1] = (uint64_t)v22 - *((_QWORD *)&v18 + 1);
      v15 = IOConnectCallMethod(v14, 0x4Du, input, 2u, 0, 0, 0, 0, __s, &v19);
      if ((_DWORD)v15)
      {
        v12 = v15;
        goto LABEL_16;
      }
      *(_QWORD *)&v17 = __s;
      *((_QWORD *)&v17 + 1) = &__s[v19];
      if (!ccder_blob_decode_range() || (v12 = 0, (der_utils_decode_fv_data(&v17, 0, v2) & 1) == 0))
LABEL_14:
        v12 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_rewrap_kek", ":", 582, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v12 = 3758097084;
    }
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v12;
}

uint64_t aks_fv_set_protection()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  mach_port_t aks_client_connection;
  mach_port_t v15;
  uint64_t v16;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  size_t v21;
  uint64_t input[4];
  _BYTE __s[4096];
  _QWORD v24[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v18 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v0;
  v24[0] = *MEMORY[0x24BDAC8D0];
  v13 = 3758097098;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v20 = __s;
  *((_QWORD *)&v20 + 1) = v24;
  v21 = 4096;
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_set_protection", ":", 616, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v13 = 3758097084;
    goto LABEL_14;
  }
  v15 = aks_client_connection;
  if (der_utils_encode_fv_data(&v20, v3)
    && der_utils_encode_fv_data(&v20, v5)
    && der_utils_encode_fv_data(&v20, v7)
    && der_utils_encode_fv_params(&v20, v12)
    && ccder_blob_encode_tl())
  {
    input[0] = v11;
    input[1] = v9;
    input[2] = *((_QWORD *)&v20 + 1);
    input[3] = (uint64_t)v24 - *((_QWORD *)&v20 + 1);
    v16 = IOConnectCallMethod(v15, 0x54u, input, 4u, 0, 0, 0, 0, __s, &v21);
    if ((_DWORD)v16)
    {
      v13 = v16;
      goto LABEL_14;
    }
    *(_QWORD *)&v19 = __s;
    *((_QWORD *)&v19 + 1) = &__s[v21];
    if (!v21)
      goto LABEL_13;
    if (!ccder_blob_decode_range())
      goto LABEL_14;
    if (!v18)
    {
LABEL_13:
      v13 = 0;
      goto LABEL_14;
    }
    v13 = 0;
    if ((der_utils_decode_fv_data(&v19, 0, v18) & 1) == 0)
      v13 = 3758097098;
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v13;
}

uint64_t aks_fv_unwrap_vek_with_acm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  mach_port_t aks_client_connection;
  mach_port_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  size_t v21;
  uint64_t input[3];
  _BYTE __s[4096];
  _QWORD v24[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = v0;
  v24[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v20 = __s;
  *((_QWORD *)&v20 + 1) = v24;
  v21 = 4096;
  if (!v6)
  {
    v17 = 3758097090;
    goto LABEL_15;
  }
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_unwrap_vek_with_acm", ":", 653, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v17 = 3758097084;
    goto LABEL_15;
  }
  v15 = aks_client_connection;
  if (!der_utils_encode_fv_data(&v20, v4)
    || !der_utils_encode_fv_data(&v20, v6)
    || !der_utils_encode_fv_data(&v20, v8)
    || !der_utils_encode_fv_data(&v20, v10)
    || !der_utils_encode_fv_params(&v20, v13)
    || !ccder_blob_encode_tl())
  {
    goto LABEL_13;
  }
  input[0] = *((_QWORD *)&v20 + 1);
  input[1] = (uint64_t)v24 - *((_QWORD *)&v20 + 1);
  input[2] = v12;
  v16 = IOConnectCallMethod(v15, 0x4Bu, input, 3u, 0, 0, 0, 0, __s, &v21);
  if ((_DWORD)v16)
  {
    v17 = v16;
    goto LABEL_15;
  }
  *(_QWORD *)&v19 = __s;
  *((_QWORD *)&v19 + 1) = &__s[v21];
  if (!ccder_blob_decode_range())
    goto LABEL_13;
  if (!v2)
  {
    v17 = 0;
    goto LABEL_15;
  }
  v17 = 0;
  if ((der_utils_decode_fv_key(&v19, 0, v2) & 1) == 0)
LABEL_13:
    v17 = 3758097098;
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v17;
}

uint64_t aks_fv_unwrap_vek_with_opts()
{
  return aks_fv_unwrap_vek_with_acm();
}

void aks_gather_stats(const char *a1, char a2)
{
  char *v4;
  char *v5;
  uint64_t i;
  char *v7;
  uint64_t k;
  char *v9;
  uint64_t j;
  _QWORD v11[5];
  char v12[1024];
  statfs v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    bzero(&v13, 0x878uLL);
    bzero(v12, 0x400uLL);
    if (realpath_DARWIN_EXTSN(a1, v12))
    {
      v4 = (char *)malloc(0x818uLL);
      memset_s(v4, 0x818uLL, 0, 0x818uLL);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 0x40000000;
      v11[2] = __aks_gather_stats_block_invoke_2;
      v11[3] = &__block_descriptor_tmp_139;
      v11[4] = v4;
      _iterate_path(v12, (uint64_t)&__block_literal_global_15, (uint64_t)v11);
      if (!statfs(v12, &v13))
      {
        if ((a2 & 1) != 0)
          printf("Free Blocks:%lld blocks of size:%d\n");
        else
          printf("%lld,%d\n");
      }
      v5 = v4 + 340;
      for (i = 1; i != 5; ++i)
      {
        if ((a2 & 1) != 0)
        {
          v9 = &v4[296 * i];
          printf("%s:\n\tNum files:\t%u,\n\tNum hardlinks:\t%u,\n\tNum compressed:\t%u,\n\tTotal Size:\t%lld,\n\tMin File Size:\t%lld,\n\tMax File Size:\t%lld,\n", class_names[i], *(_DWORD *)v9, *((_DWORD *)v9 + 2), *((_DWORD *)v9 + 1), *((_QWORD *)v9 + 2), *((_QWORD *)v9 + 3), *((_QWORD *)v9 + 4));
          printf("\tSize Distribution:");
          printf("%i", *((_DWORD *)v9 + 10));
          for (j = 0; j != 252; j += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[j]);
          }
        }
        else
        {
          v7 = &v4[296 * i];
          printf("%i,%u,%u,%u,%lld,%lld,%lld,", i, *(_DWORD *)v7, *((_DWORD *)v7 + 2), *((_DWORD *)v7 + 1), *((_QWORD *)v7 + 2), *((_QWORD *)v7 + 3), *((_QWORD *)v7 + 4));
          printf("%i", *((_DWORD *)v7 + 10));
          for (k = 0; k != 252; k += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[k]);
          }
        }
        putchar(10);
        v5 += 296;
      }
      free(v4);
    }
  }
}

uint64_t __aks_gather_stats_block_invoke()
{
  return 1;
}

uint64_t __aks_gather_stats_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t *v9;
  int64_t v10;
  uint64_t v11;
  int64_t *v12;
  int64_t v13;
  int64_t v14;
  BOOL v15;
  unint64_t v16;

  result = _get_path_class(*(const char **)(a2 + 48));
  if ((result - 7) >= 0xFFFFFFFA)
  {
    v5 = *(_QWORD *)(a2 + 96);
    v6 = *(_QWORD *)(v5 + 96);
    v7 = *(_QWORD *)(a1 + 32);
    ++*(_DWORD *)(v7 + 296 * result);
    if (*(unsigned __int16 *)(v5 + 6) >= 2u)
      ++*(_DWORD *)(v7 + 296 * result + 8);
    if ((*(_BYTE *)(v5 + 116) & 0x20) != 0)
      ++*(_DWORD *)(v7 + 296 * result + 4);
    v8 = v7 + 296 * result;
    v10 = *(_QWORD *)(v8 + 32);
    v9 = (int64_t *)(v8 + 32);
    *(v9 - 2) += v6;
    if (v6 > v10)
      *v9 = v6;
    v11 = v7 + 296 * result;
    v14 = *(_QWORD *)(v11 + 24);
    v12 = (int64_t *)(v11 + 24);
    v13 = v14;
    if (v14)
      v15 = v6 < v13;
    else
      v15 = 1;
    if (v15)
      *v12 = v6;
    if (v6)
      v16 = v7 + 296 * result + 4 * (63 - __clz(v6));
    else
      v16 = v7 + 296 * result;
    ++*(_DWORD *)(v16 + 40);
  }
  return result;
}

uint64_t aks_kext_set_options(unsigned int a1, uint64_t a2)
{
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = 1;
  input[1] = a1;
  input[2] = a2;
  output = 0;
  outputCnt = 1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kext_set_options", ":", 820, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_kext_get_options(unsigned int a1, uint64_t *a2)
{
  uint64_t v2;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v2 = 3758097084;
  if (!a2)
    return 3758097090;
  input[0] = 0;
  input[1] = a1;
  input[2] = 0;
  output = 0;
  outputCnt = 1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v2 = IOConnectCallMethod(aks_client_connection, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
    if (!(_DWORD)v2)
      *a2 = output;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kext_get_options", ":", 841, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v2;
}

uint64_t aks_internal_state()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x10u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_internal_state", ":", 857, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_run_internal_test(unsigned int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x86u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_run_internal_test", ":", 871, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_stash_escrow()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  const void *v7;
  const void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  mach_port_t aks_client_connection;
  uint64_t v17;
  void *v18;
  size_t __count;
  uint64_t input[4];
  _BYTE __src[32768];
  uint64_t v23;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = v0;
  v23 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = v15;
    input[1] = v14;
    input[2] = v12;
    input[3] = v10;
    if (!v14 || (v17 = 3758097090, v4) && v2)
    {
      v17 = IOConnectCallMethod(aks_client_connection, 0x36u, input, 4u, v8, v6, 0, 0, __src, &__count);
      if (!(_DWORD)v17 && v14)
      {
        v18 = calloc(__count, 1uLL);
        *v4 = v18;
        if (v18)
        {
          memcpy(v18, __src, __count);
          v17 = 0;
          *v2 = __count;
        }
        else
        {
          v17 = 3758097085;
        }
      }
    }
  }
  else
  {
    v17 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_stash_escrow", ":", 890, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v17;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection)
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

uint64_t get_akstest_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_154);
  result = get_akstest_client_connection_connection;
  if (!get_akstest_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStoreTest");
    return get_akstest_client_connection_connection;
  }
  return result;
}

void __get_akstest_client_connection_block_invoke()
{
  if (!get_akstest_client_connection_connection)
    get_akstest_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStoreTest", "AppleKeyStoreTest");
}

uint64_t akstest_new_key(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v19;
  uint32_t outputCnt;
  unsigned int outputStruct[256];
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a4;
  input[1] = a3;
  output = 0;
  outputCnt = 1;
  bzero(outputStruct, 0x400uLL);
  v19 = 1024;
  v11 = IOConnectCallMethod(a1, 0xFu, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v19);
  if ((_DWORD)v11)
    return v11;
  v17 = 3758097084;
  if (outputCnt == 1)
  {
    *a7 = output;
    if (aks_unpack_data(outputStruct, v19, 3u, v12, v13, v14, v15, v16, a5))
      return 3758097084;
    else
      return 0;
  }
  return v17;
}

uint64_t akstest_new_ekwk(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  size_t v26;
  uint32_t outputCnt;
  unsigned int outputStruct[256];
  uint64_t output;
  uint64_t v30;
  uint64_t v31;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a4;
  input[1] = a3;
  output = 0;
  v30 = 0;
  v31 = 0;
  outputCnt = 3;
  bzero(outputStruct, 0x400uLL);
  v26 = 1024;
  v17 = IOConnectCallMethod(a1, 0x13u, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v26);
  if ((_DWORD)v17)
    return v17;
  v23 = 3758097084;
  if (outputCnt == 3)
  {
    v24 = v30;
    *a7 = output;
    *a10 = v24;
    *a13 = v31;
    if (aks_unpack_data(outputStruct, v26, 5u, v18, v19, v20, v21, v22, a5))
      return 3758097084;
    else
      return 0;
  }
  return v23;
}

uint64_t akstest_new_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, size_t *a8)
{
  uint64_t v11;
  unsigned int inputStructCnt[3];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, a2);
  v11 = IOConnectCallMethod(a1, 0x14u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, a8);
  free(*(void **)&inputStructCnt[1]);
  return v11;
}

uint64_t akstest_rewrap_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, uint64_t a11, unsigned int a12, void *outputStruct, size_t *a14, _DWORD *a15)
{
  uint64_t v16;
  uint64_t v17;
  uint32_t outputCnt;
  unsigned int inputStructCnt[3];
  uint64_t output;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  input[2] = a9;
  input[3] = a12;
  output = 0;
  outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 4, a4, a5, a6, a7, a8, a2);
  v16 = IOConnectCallMethod(a1, 0x15u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, outputStruct, a14);
  if ((_DWORD)v16)
  {
    v17 = v16;
  }
  else if (outputCnt == 1)
  {
    v17 = 0;
    *a15 = output;
  }
  else
  {
    v17 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t akstest_unwrap_key(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  size_t outputStructCnt;
  unsigned int inputStructCnt[3];
  unsigned int outputStruct[256];
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  outputStructCnt = 1024;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  v15 = IOConnectCallMethod(a1, 0x10u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &outputStructCnt);
  if ((_DWORD)v15)
  {
    v21 = v15;
  }
  else if (aks_unpack_data(outputStruct, outputStructCnt, 2u, v16, v17, v18, v19, v20, a7))
  {
    v21 = 3758097084;
  }
  else
  {
    v21 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v21;
}

uint64_t akstest_unwrap_ek(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v25;
  unsigned int inputStructCnt[3];
  unsigned int outputStruct[256];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  input[2] = a9;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  v25 = 1024;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a2);
  v17 = IOConnectCallMethod(a1, 0x17u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
  if ((_DWORD)v17)
  {
    v23 = v17;
  }
  else if (aks_unpack_data(outputStruct, v25, 2u, v18, v19, v20, v21, v22, a10))
  {
    v23 = 3758097084;
  }
  else
  {
    v23 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v23;
}

uint64_t akstest_check_class(mach_port_t a1, void *inputStruct, unsigned int a3)
{
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  return IOConnectCallMethod(a1, 0x11u, input, 1u, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t akstest_last_user(mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unsigned int inputStructCnt[3];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, a4, a5, a6, a7, a8, a3);
  v9 = IOConnectCallMethod(a1, 0x12u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t aks_get_internal_info_for_key()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  const void *v5;
  const void *v6;
  mach_port_t aks_client_connection;
  size_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  size_t __count;
  _BYTE __src[32768];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v6)
      v8 = 18;
    else
      v8 = 0;
    v9 = IOConnectCallMethod(aks_client_connection, 0x5Du, input, 1u, v6, v8, 0, 0, __src, &__count);
    v10 = __count;
    if ((_DWORD)v9)
    {
      v12 = v9;
    }
    else if (__count - 32769 < 0xFFFFFFFFFFFF8000)
    {
      v12 = 3758097090;
    }
    else
    {
      v11 = calloc(__count, 1uLL);
      *v4 = v11;
      v10 = __count;
      if (v11)
      {
        *v2 = __count;
        memcpy(v11, __src, v10);
        v12 = 0;
        v10 = __count;
      }
      else
      {
        v12 = 3758097085;
      }
    }
  }
  else
  {
    v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_get_internal_info_for_key", ":", 1246, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v10 = 0x8000;
  }
  memset_s(__src, v10, 0, v10);
  return v12;
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  mach_port_t v3;
  io_service_t v4;
  task_port_t *v5;
  io_object_t v6;
  kern_return_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  v3 = *MEMORY[0x24BDD8B20];
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], path);
  v5 = (task_port_t *)MEMORY[0x24BDAEC58];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x24BDAEC58], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sizeof_backup_bag()
{
  ccder_sizeof_implicit_uint64();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_implicit_uint64();
  return ccder_sizeof();
}

uint64_t encode_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  uint64_t v6;

  v6 = a2 + a3;
  if (!ccder_blob_encode_implicit_uint64()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_implicit_uint64())
  {
    return 4294967273;
  }
  v3 = ccder_blob_encode_tl();
  result = 4294967273;
  if (v3)
  {
    if (a2 == v6)
      return 0;
    else
      return 4294967273;
  }
  return result;
}

uint64_t decode_backup_bag(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int v4;
  uint64_t result;
  __int128 v6;

  *(_QWORD *)&v6 = a1;
  *((_QWORD *)&v6 + 1) = a1 + a2;
  if (!ccder_blob_decode_range()
    || !der_utils_decode_implicit_uint64(&v6, 0x8000000000000000, a3)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000001, (uint64_t)(a3 + 1), 16)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000002, (uint64_t)(a3 + 3), 40)
    || !der_utils_decode_implicit_raw_octet_string_copy(&v6, 0x8000000000000003, (uint64_t)(a3 + 8), 16))
  {
    return 4294967277;
  }
  v4 = der_utils_decode_implicit_uint64(&v6, 0x8000000000000004, a3 + 10);
  result = 4294967277;
  if (v4)
  {
    if ((_QWORD)v6 == *((_QWORD *)&v6 + 1))
      return 0;
    else
      return 4294967277;
  }
  return result;
}

uint64_t wrap_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  _OWORD __s[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  v12 = 40;
  *(_QWORD *)a4 = 0;
  uuid_copy((unsigned __int8 *)(a4 + 8), (const unsigned __int8 *)(a1 + 32));
  *(_QWORD *)(a4 + 80) = 1;
  platform_read_random(a4 + 64, 0x10u);
  v8 = ccsha256_di();
  if (firebloom_ccpbkdf2_hmac(v8, a3, a2, 16, a4 + 64, *(_QWORD *)(a4 + 80), 32, __s))
  {
    v10 = 4294967286;
  }
  else
  {
    v9 = rfc3394_wrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a1, 0x20u, (_QWORD *)(a4 + 24), &v12);
    if ((_DWORD)v9)
    {
      v10 = v9;
    }
    else if (v12 == 40)
    {
      v10 = 0;
    }
    else
    {
      v10 = 4294967286;
    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t unwrap_backup_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  _OWORD __s[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  v12 = 32;
  if (*(_QWORD *)a1)
  {
    v10 = 4294967284;
  }
  else
  {
    v8 = ccsha256_di();
    if (firebloom_ccpbkdf2_hmac(v8, a3, a2, 16, a1 + 64, *(_QWORD *)(a1 + 80), 32, __s))
      goto LABEL_9;
    v9 = rfc3394_unwrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (_QWORD *)(a1 + 24), 0x28u, (_QWORD *)a4, &v12);
    if ((_DWORD)v9)
    {
      v10 = v9;
      goto LABEL_8;
    }
    if (v12 != 32)
    {
LABEL_9:
      v10 = 4294967286;
    }
    else
    {
      cccurve25519_make_pub();
      if (uuid_compare((const unsigned __int8 *)(a1 + 8), (const unsigned __int8 *)(a4 + 32)))
        v10 = 4294967272;
      else
        v10 = 0;
    }
  }
LABEL_8:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t aks_stash_create_for_bag_and_kek()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  mach_port_t aks_client_connection;
  mach_port_t v14;
  __int128 v16;
  uint64_t input[7];
  _BYTE v18[4096];
  uint64_t v19;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 3758097098;
  bzero(v18, 0x1000uLL);
  *(_QWORD *)&v16 = v18;
  *((_QWORD *)&v16 + 1) = &v19;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v14 = aks_client_connection;
    if (der_utils_encode_fv_data(&v16, v2) && ccder_blob_encode_tl())
    {
      input[0] = v11;
      input[1] = v10;
      input[2] = v6;
      input[3] = v4;
      input[4] = v8;
      input[5] = *((_QWORD *)&v16 + 1);
      input[6] = (uint64_t)&v19 - *((_QWORD *)&v16 + 1);
      return IOConnectCallMethod(v14, 0x21u, input, 7u, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_stash_create_for_bag_and_kek", ":", 50, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return v12;
}

uint64_t aks_stash_create()
{
  return aks_stash_create_for_bag_and_kek();
}

uint64_t aks_stash_load(int a1)
{
  return _aks_stash_load(a1, 0, 0);
}

uint64_t _aks_stash_load(int a1, unsigned int a2, BOOL *a3)
{
  mach_port_t aks_client_connection;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(aks_client_connection, 0x22u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (!(_DWORD)result)
    {
      result = 0;
      if (a3)
        *a3 = output != 0;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "_aks_stash_load", ":", 77, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return result;
}

uint64_t aks_stash_verify(int a1, _BYTE *a2)
{
  uint64_t result;
  BOOL v4;

  v4 = 0;
  if (!a2)
    return _aks_stash_load(a1, 1u, &v4);
  *a2 = 0;
  result = _aks_stash_load(a1, 1u, &v4);
  if (!(_DWORD)result)
    *a2 = v4;
  return result;
}

uint64_t aks_stash_destroy()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x25u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_stash_destroy", ":", 125, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_stash_commit(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x24u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_stash_commit", ":", 138, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_stash_enable(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x33u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_stash_enable", ":", 154, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_stash_persist(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x35u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_stash_persist", ":", 170, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_prederived_free(void **a1)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != 1634431856)
    return 0xFFFFFFFFLL;
  free(a1[1]);
  free(a1);
  return 0;
}

uint64_t aks_prederived_create(int a1, uint64_t a2, unint64_t a3, int a4, void ***a5)
{
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void **v14;

  v14 = 0;
  if (!a2 && a3)
    return 0xFFFFFFFFLL;
  if (_aks_prederived_create_ctx(a4, &v14) || (v9 = calloc(0x20uLL, 1uLL)) == 0)
  {
    v12 = 0xFFFFFFFFLL;
  }
  else
  {
    v10 = v9;
    v11 = _aks_prederive_passcode(v14, a2, a3, (uint64_t)v9);
    v12 = 0xFFFFFFFFLL;
    if (a3 <= 0x7FFFFFFE
      && !v11
      && !_set_prederived_configuration(a1, a2, a3, (uint64_t)v10, (uint64_t)v14))
    {
      v12 = 0;
      if (a5)
      {
        *a5 = v14;
        v14 = 0;
      }
    }
    memset_s(v10, 0x20uLL, 0, 0x20uLL);
    free(v10);
  }
  if (v14)
    aks_prederived_free(v14);
  return v12;
}

uint64_t _aks_prederived_create_ctx(int a1, _QWORD *a2)
{
  uint64_t result;
  _DWORD *v6;
  _DWORD *v7;
  void *v8;
  int v9;
  void *v10;

  if ((a1 - 1) > 2 || a2 == 0)
    return 0xFFFFFFFFLL;
  v6 = calloc(0x20uLL, 1uLL);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  *((_QWORD *)v6 + 2) = 20;
  v8 = calloc(0x14uLL, 1uLL);
  *((_QWORD *)v7 + 1) = v8;
  if (!v8)
  {
LABEL_19:
    free(v7);
    return 0xFFFFFFFFLL;
  }
  *v7 = 1634431856;
  v7[6] = a1;
  result = CCRandomCopyBytes();
  if ((_DWORD)result)
  {
    v10 = (void *)*((_QWORD *)v7 + 1);
    if (v10)
      free(v10);
    goto LABEL_19;
  }
  if (a1 == 3)
    v9 = 2000;
  else
    v9 = 10000000;
  if (a1 == 2)
    v9 = 1000;
  v7[1] = v9;
  *a2 = v7;
  return result;
}

uint64_t _aks_prederive_passcode(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*a1 != 1634431856 || !a2 && a3)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a4 && (a1[6] - 4) >= 0xFFFFFFFD)
  {
    ccsha256_di();
    if (ccpbkdf2_hmac())
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t _set_prederived_configuration(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  mach_port_t v12;
  void *v14;
  rsize_t __n;
  void *__s;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  __n = 0;
  __s = 0;
  v10 = 3758097090;
  v14 = 0;
  if ((a2 || !a3) && a4 && a5)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v12 = aks_client_connection;
      if (!encode_list_add_data(&v14, (uint64_t)der_key_config_prederived_salt, *(_QWORD *)(a5 + 8))
        && !encode_list_add_data(&v14, (uint64_t)der_key_config_prederived_passcode, a4)
        && !encode_list_add_number(&v14, (uint64_t)der_key_config_prederived_iterations, *(unsigned int *)(a5 + 4))&& !encode_list_add_number(&v14, (uint64_t)der_key_config_prederived_type, *(unsigned int *)(a5 + 24))&& (a3 < 1 || !encode_list_add_data(&v14, (uint64_t)der_key_passcode, a2))&& !encode_list_is_empty(&v14)&& !encode_list_dict(&v14, &__s, &__n))
      {
        input[0] = a1;
        input[1] = (uint64_t)__s;
        input[2] = __n;
        v10 = IOConnectCallMethod(v12, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "_set_prederived_configuration", ":", 218, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v10 = 3758097084;
    }
  }
  encode_list_free(&v14);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v10;
}

uint64_t aks_prederived_is_enabled()
{
  int v0;
  uint64_t *v1;
  uint64_t *v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  mach_port_t aks_client_connection;
  mach_port_t v7;
  CFMutableDictionaryRef Mutable;
  uint64_t v9;
  const void *v10;
  void *v11;
  int v12;
  size_t v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  uint64_t input;
  _BYTE outputStruct[32768];
  uint64_t v24;

  v0 = MEMORY[0x24BDAC7A8]();
  v24 = *MEMORY[0x24BDAC8D0];
  if (!v1)
    return 0;
  v2 = v1;
  v3 = v0;
  result = (uint64_t)calloc(0x20uLL, 1uLL);
  if (!result)
    return result;
  v5 = result;
  *(_DWORD *)result = 1634431856;
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "_get_prederived_configuration", ":", 384, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
LABEL_16:
    aks_prederived_free((void **)v5);
    return 0;
  }
  v7 = aks_client_connection;
  bzero(outputStruct, 0x8000uLL);
  v13[0] = 0x8000;
  input = v3;
  if (IOConnectCallMethod(v7, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v13) || v13[0] > 0x8000)
    goto LABEL_16;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v15 = 0u;
  v17 = 0u;
  v18 = 0;
  v14 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13[1] = (size_t)der_key_config_prederived_salt;
  v16 = (unint64_t)der_key_config_prederived_iterations;
  v19 = der_key_config_prederived_type;
  der_dict_iterate();
  v9 = ccder_decode_tl();
  if (v9)
  {
    v10 = (const void *)v9;
    v11 = calloc(*(_QWORD *)(v5 + 16), 1uLL);
    *(_QWORD *)(v5 + 8) = v11;
    if (!v11)
    {
      v12 = 0;
      if (!Mutable)
        goto LABEL_11;
      goto LABEL_10;
    }
    memcpy(v11, v10, *(_QWORD *)(v5 + 16));
    *(_DWORD *)(v5 + 4) = der_get_number();
    *(_DWORD *)(v5 + 24) = der_get_number();
  }
  v12 = 1;
  if (Mutable)
LABEL_10:
    CFRelease(Mutable);
LABEL_11:
  if (!v12 || !*(_QWORD *)(v5 + 16))
    goto LABEL_16;
  *v2 = v5;
  return 1;
}

uint64_t aks_prederived_unlock_keybag(int a1, uint64_t a2, int a3, _DWORD *a4)
{
  BOOL v4;
  BOOL v5;
  uint64_t v7;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(v9, 0, sizeof(v9));
  if (a3)
    v4 = a2 == 0;
  else
    v4 = 0;
  v5 = v4 || a4 == 0;
  if (v5 || *a4 != 1634431856 || _aks_prederive_passcode(a4, a2, a3, (uint64_t)v9))
    v7 = 0xFFFFFFFFLL;
  else
    v7 = aks_unlock_bag(a1, (uint64_t)v9, 32);
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t aks_unlock_bag(int a1, uint64_t a2, int a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    return IOConnectCallMethod(aks_client_connection, 0xCu, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_unlock_bag", ":", 807, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_prederived_change_secret(int a1, uint64_t a2, int a3, uint64_t a4, int a5, void ***a6)
{
  void **v7;
  int v11;
  void **v12;
  int v13;
  uint64_t v14;
  void **v16;
  _OWORD v17[2];
  _OWORD __s[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  memset(v17, 0, sizeof(v17));
  v16 = 0;
  if (!a6)
    goto LABEL_17;
  v7 = *a6;
  if (!*a6 || *(_DWORD *)v7 != 1634431856 || !a2 && a3)
    goto LABEL_17;
  if (!a4 && a5 || _aks_prederive_passcode(*a6, a2, a3, (uint64_t)__s))
    goto LABEL_17;
  v11 = _aks_prederived_create_ctx(*((_DWORD *)v7 + 6), &v16);
  v12 = v16;
  if (v11 || (v13 = _aks_prederive_passcode(v16, a4, a5, (uint64_t)v17), v12 = v16, v13))
  {
LABEL_15:
    if (v12)
      aks_prederived_free(v12);
LABEL_17:
    v14 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (_set_prederived_configuration(a1, (uint64_t)__s, 32, (uint64_t)v17, (uint64_t)v16))
  {
    v12 = v16;
    goto LABEL_15;
  }
  aks_prederived_free(v7);
  v14 = 0;
  *a6 = v16;
LABEL_13:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v17, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t aks_create_bag(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, a3, -1, a4);
}

uint64_t _create_bag(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  uint64_t v14;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[7];

  input[6] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      input[2] = a1;
      input[3] = a2;
      input[4] = a3;
      input[5] = a4;
      output = 0;
      outputCnt = 1;
      v14 = IOConnectCallMethod(aks_client_connection, 2u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v14)
        *a7 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "_create_bag", ":", 187, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v14;
}

uint64_t aks_create_escrow_bag(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, 2u, a3, a4);
}

uint64_t aks_create_escrow_bag_with_auth(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return _create_bag(a3, a4, a1, a2, 2u, a5, a6);
}

uint64_t aks_create_sync_bag(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0, 0, 0x8000002u, a3, a4);
}

uint64_t aks_create_sync_bag_with_auth(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return _create_bag(a3, a4, a1, a2, 0x8000002u, a5, a6);
}

uint64_t aks_invalidate_sync_bags()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x42u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_invalidate_sync_bags", ":", 544, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_unlock_with_sync_bag(const void *a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a1)
    {
      input[0] = a5;
      input[1] = a3;
      input[2] = a4;
      return IOConnectCallMethod(aks_client_connection, 0x43u, input, 3u, a1, a2, 0, 0, 0, 0);
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_unlock_with_sync_bag", ":", 557, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v10;
}

uint64_t aks_load_bag(const void *a1, int a2, _DWORD *a3)
{
  uint64_t v6;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  v6 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v6 = 3758097090;
    if (a1)
    {
      if (a3)
      {
        output[0] = 0;
        outputCnt = 1;
        v6 = IOConnectCallMethod(aks_client_connection, 6u, 0, 0, a1, a2, output, &outputCnt, 0, 0);
        if (!(_DWORD)v6)
          *a3 = output[0];
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_load_bag", ":", 574, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v6;
}

uint64_t aks_invalidate_bag(const void *a1, int a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;

  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a1)
      return IOConnectCallMethod(aks_client_connection, 0x57u, 0, 0, a1, a2, 0, 0, 0, 0);
    return 3758097090;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_invalidate_bag", ":", 596, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v4;
}

uint64_t aks_unload_bag(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_unload_bag", ":", 612, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_unload_session_bags(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x37u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_unload_session_bags", ":", 629, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_save_bag()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  mach_port_t aks_client_connection;
  mach_port_t v7;
  uint64_t result;
  void *v9;
  size_t __count;
  uint64_t input;
  _BYTE __src[32768];
  uint64_t v13;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v13 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v7 = aks_client_connection;
    result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input = v5;
        result = IOConnectCallMethod(v7, 3u, &input, 1u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          v9 = calloc(__count, 1uLL);
          *v4 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            result = 0;
            *v2 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_save_bag", ":", 646, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return result;
}

uint64_t aks_change_secret_opts(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, unsigned int a12, _DWORD *a13)
{
  mach_port_t aks_client_connection;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[13];

  input[12] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a11;
    input[2] = a10;
    input[3] = a2;
    input[4] = a3;
    input[5] = a4;
    input[6] = a5;
    input[7] = a6;
    input[8] = a7;
    input[9] = a8;
    input[10] = a9;
    input[11] = a12;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(aks_client_connection, 0xFu, input, 0xCu, 0, 0, &output, &outputCnt, 0, 0);
    if (a13)
    {
      if (!(_DWORD)result)
        *a13 = output;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_change_secret_opts", ":", 678, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return result;
}

uint64_t aks_change_secret_se(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, _DWORD *a12)
{
  return aks_change_secret_opts(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

uint64_t aks_change_secret(int a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, _DWORD *a7)
{
  return aks_change_secret_opts(a1, a2, a3, a4, a5, 0, 0, 0, 0, 0xFFu, a6, 0, a7);
}

uint64_t aks_get_bag_uuid(int a1, _OWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  size_t v7;
  uint64_t input;
  __int128 outputStruct;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v7 = 16;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      outputStruct = 0uLL;
      input = a1;
      v4 = IOConnectCallMethod(aks_client_connection, 0x17u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v7);
      if (!(_DWORD)v4)
        *a2 = outputStruct;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_get_bag_uuid", ":", 729, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v4;
}

uint64_t aks_copy_volume_cookie(int a1, _QWORD *a2, size_t *a3)
{
  return aks_copy_volume_cookie_persona(a1, (uint64_t)&UUID_NULL, a2, a3);
}

uint64_t aks_copy_volume_cookie_persona(int a1, uint64_t a2, _QWORD *a3, size_t *a4)
{
  mach_port_t aks_client_connection;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t v15;
  uint64_t v16;
  void *v17;
  unsigned int inputStructCnt[3];
  size_t __count;
  uint64_t input;
  _OWORD __src[2];
  __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  memset(__src, 0, sizeof(__src));
  __count = 34;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v14 = 3758097090;
    if (a3 && a4)
    {
      v15 = aks_client_connection;
      input = a1;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v9, v10, v11, v12, v13, a2);
      if (*(_QWORD *)&inputStructCnt[1])
      {
        v16 = IOConnectCallMethod(v15, 0x44u, &input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if ((_DWORD)v16)
        {
          v14 = v16;
        }
        else
        {
          v17 = calloc(__count, 1uLL);
          *a3 = v17;
          v14 = 3758097085;
          if (v17)
          {
            memcpy(v17, __src, __count);
            v14 = 0;
            *a4 = __count;
          }
        }
      }
      else
      {
        v14 = 3758097085;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_copy_volume_cookie_persona", ":", 760, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v14 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v14;
}

uint64_t aks_lock_bag(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0xDu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_lock_bag", ":", 790, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_get_lock_state(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(aks_client_connection, 7u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_get_lock_state", ":", 824, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v4;
}

uint64_t aks_wrap_key(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t v14;
  mach_port_t aks_client_connection;
  uint64_t v16;
  size_t v18;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v14 = 3758097090;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      output = 0;
      outputCnt = 1;
      v18 = *a6;
      v16 = IOConnectCallMethod(aks_client_connection, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if ((_DWORD)v16)
      {
        return v16;
      }
      else
      {
        *a6 = v18;
        v14 = 0;
        if (a7)
          *a7 = output;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_wrap_key", ":", 848, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v14;
}

uint64_t aks_unwrap_key(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t v12;
  mach_port_t aks_client_connection;
  size_t v15;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v12 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v12 = 3758097090;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          v15 = *a6;
          v12 = IOConnectCallMethod(aks_client_connection, 0xBu, input, 2u, a1, a2, 0, 0, a5, &v15);
          if (!(_DWORD)v12)
            *a6 = v15;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_unwrap_key", ":", 877, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v12;
}

uint64_t aks_rewrap_key_for_backup(const void *a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v14;
  mach_port_t aks_client_connection;
  size_t v17;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v14 = 3758097090;
    if (a1 && a7)
    {
      input[0] = a3;
      input[1] = a4;
      input[2] = a5;
      input[3] = a6;
      v17 = 108;
      return IOConnectCallMethod(aks_client_connection, 0x18u, input, 4u, a1, a2, 0, 0, a7, &v17);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_rewrap_key_for_backup", ":", 901, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v14;
}

uint64_t aks_get_system(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(aks_client_connection, 0xEu, input, a1 != 0, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_get_system", ":", 922, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v4;
}

uint64_t aks_set_system_with_passcode(int a1, int a2, uint64_t a3, int a4)
{
  mach_port_t aks_client_connection;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a4;
    return IOConnectCallMethod(aks_client_connection, 5u, input, 4u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_set_system_with_passcode", ":", 950, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_set_system(int a1, int a2)
{
  return aks_set_system_with_passcode(a1, a2, 0, 0);
}

uint64_t aks_set_keybag_for_volume(int a1, uint64_t a2, unsigned int a3)
{
  return aks_set_keybag_for_volume_with_cookie_persona(a1, a2, a3);
}

uint64_t aks_set_keybag_for_volume_with_cookie(int a1, uint64_t a2, unsigned int a3)
{
  return aks_set_keybag_for_volume_with_cookie_persona(a1, a2, a3);
}

uint64_t aks_set_keybag_for_volume_with_cookie_persona(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  mach_port_t aks_client_connection;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t v13;
  void *v14;
  unsigned int inputStructCnt[3];
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v13 = aks_client_connection;
    input[0] = a1;
    input[1] = a3;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v8, v9, v10, v11, v12, a2);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v6 = IOConnectCallMethod(v13, 0x41u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      v14 = *(void **)&inputStructCnt[1];
    }
    else
    {
      v14 = 0;
      v6 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_set_keybag_for_volume_with_cookie_persona", ":", 987, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v14 = 0;
  }
  free(v14);
  return v6;
}

uint64_t aks_backup_enable_volume()
{
  uint64_t v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  uint64_t v18;
  void *v19;
  size_t __count;
  unsigned int inputStructCnt[3];
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v25;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = 3758097085;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v17 = aks_client_connection;
    input[0] = v8;
    input[1] = v6;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, v9);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v18 = IOConnectCallMethod(v17, 0x6Eu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if ((_DWORD)v18)
      {
        v10 = v18;
      }
      else
      {
        v19 = calloc(__count, 1uLL);
        *v4 = v19;
        if (v19)
        {
          memcpy(v19, __src, __count);
          v10 = 0;
          *v2 = __count;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_backup_enable_volume", ":", 1014, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v10 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t aks_backup_disable_volume(uint64_t a1)
{
  uint64_t v2;
  mach_port_t aks_client_connection;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_t v9;
  char *v10;
  int v12;
  char *v13;

  v2 = 3758097084;
  v13 = 0;
  v12 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v9 = aks_client_connection;
    aks_pack_data(&v13, (unsigned int *)&v12, 1, v4, v5, v6, v7, v8, a1);
    if (v13)
    {
      v2 = IOConnectCallMethod(v9, 0x6Fu, 0, 0, v13, v12, 0, 0, 0, 0);
      v10 = v13;
    }
    else
    {
      v10 = 0;
      v2 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_backup_disable_volume", ":", 1044, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v10 = 0;
  }
  free(v10);
  return v2;
}

uint64_t aks_backup_copy_current_bag_uuid(uint64_t a1, void *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  char *v12;
  size_t v14;
  int v15;
  char *v16;

  v4 = 3758097084;
  v16 = 0;
  v15 = 0;
  v14 = 16;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v11 = aks_client_connection;
    aks_pack_data(&v16, (unsigned int *)&v15, 1, v6, v7, v8, v9, v10, a1);
    if (v16)
    {
      v4 = IOConnectCallMethod(v11, 0x70u, 0, 0, v16, v15, 0, 0, a2, &v14);
      v12 = v16;
    }
    else
    {
      v12 = 0;
      v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_backup_copy_current_bag_uuid", ":", 1066, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t aks_backup_rewrap_key(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v13;
  mach_port_t aks_client_connection;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t v20;
  void *v21;
  size_t v23;
  unsigned int inputStructCnt[3];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v13 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v20 = aks_client_connection;
    v21 = 0;
    v13 = 3758097090;
    if (a2 && a7)
    {
      input[0] = a4;
      input[1] = a5;
      input[2] = a6;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v15, v16, v17, v18, v19, a1);
      v23 = 108;
      v13 = IOConnectCallMethod(v20, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, &v23);
      v21 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_backup_rewrap_key", ":", 1087, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v21 = 0;
  }
  free(v21);
  return v13;
}

uint64_t aks_backup_rewrap_ek(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *outputStruct)
{
  uint64_t v15;
  mach_port_t aks_client_connection;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  mach_port_t v22;
  void *v23;
  size_t v25;
  unsigned int inputStructCnt[3];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v15 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v22 = aks_client_connection;
    v23 = 0;
    v15 = 3758097090;
    if (a2 && a4 && outputStruct)
    {
      input[0] = a6;
      input[1] = a7;
      input[2] = a8;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v17, v18, v19, v20, v21, a1);
      v25 = 108;
      v15 = IOConnectCallMethod(v22, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
      v23 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_backup_rewrap_ek", ":", 1113, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v23 = 0;
  }
  free(v23);
  return v15;
}

uint64_t aks_backup_unwrap_bag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[5];
  uint64_t v14;
  __int128 __s;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  __s = 0u;
  v16 = 0u;
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = decode_backup_bag(a1, a2, v13);
  if ((_DWORD)v8)
  {
    v9 = v8;
  }
  else
  {
    v9 = unwrap_backup_bag((uint64_t)v13, a3, a4, (uint64_t)&__s);
    if (!(_DWORD)v9)
    {
      v10 = v16;
      *a5 = __s;
      a5[1] = v10;
      v11 = v18;
      a5[2] = v17;
      a5[3] = v11;
    }
  }
  memset_s(v13, 0x58uLL, 0, 0x58uLL);
  memset_s(&__s, 0x40uLL, 0, 0x40uLL);
  return err_sks_to_aks(v9);
}

uint64_t aks_backup_copy_bag_uuid(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v4;
  _OWORD v6[5];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v4 = decode_backup_bag(a1, a2, v6);
  if (!(_DWORD)v4)
    uuid_copy(a3, (const unsigned __int8 *)v6 + 8);
  memset_s(v6, 0x58uLL, 0, 0x58uLL);
  return err_sks_to_aks(v4);
}

uint64_t aks_backup_unwrap_key(__int128 *a1, _QWORD *a2, unsigned int a3, _QWORD *a4, _QWORD *a5)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  unsigned int v10;
  int __s;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a1[1];
  v12 = *a1;
  v13 = v6;
  v7 = a1[3];
  v14 = a1[2];
  v15 = v7;
  v10 = *a5;
  __s = 1;
  v8 = unwrap_data((uint64_t)&__s, 0, 0, a2, a3, a4, &v10);
  *a5 = v10;
  memset_s(&__s, 0x44uLL, 0, 0x44uLL);
  return err_sks_to_aks(v8);
}

uint64_t aks_kc_backup_unwrap_key(uint64_t a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      input[1] = 64;
      return IOConnectCallMethod(aks_client_connection, 0x82u, input, 2u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kc_backup_unwrap_key", ":", 1193, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v10;
}

uint64_t aks_kc_backup_wrap_key(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      return IOConnectCallMethod(aks_client_connection, 0x81u, input, 1u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kc_backup_wrap_key", ":", 1212, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v10;
}

uint64_t aks_kc_backup_get_handle(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(aks_client_connection, 0x83u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kc_backup_get_handle", ":", 1231, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v4;
}

uint64_t aks_kc_backup_get_uuid(int a1, unsigned __int8 *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  size_t v8;
  unsigned __int8 src[8];
  uint64_t v10;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      v10 = 0;
      input[0] = a1;
      v8 = 16;
      *(_QWORD *)src = 0;
      v6 = IOConnectCallMethod(aks_client_connection, 0x84u, input, 1u, 0, 0, 0, 0, src, &v8);
      if ((_DWORD)v6)
      {
        return v6;
      }
      else if (v8 == 16)
      {
        uuid_copy(a2, src);
        return 0;
      }
      else
      {
        return 3758604298;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kc_backup_get_uuid", ":", 1253, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v4;
}

uint64_t aks_kc_backup_open_keybag(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, _OWORD *a6)
{
  int v7;
  int v9;
  int v11;
  FILE **v12;
  FILE *v13;
  uint64_t bag;
  int is_enabled;
  int v16;
  uint64_t v17;

  if (a5)
  {
    v7 = a4;
    v9 = a2;
    *a5 = -1;
    v11 = aks_backup_unwrap_bag((uint64_t)a1, a2, a3, a4, a6);
    v12 = (FILE **)MEMORY[0x24BDAC8E8];
    v13 = (FILE *)*MEMORY[0x24BDAC8E8];
    if (!v11)
    {
      fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Unwrapped DER backup bag%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kc_backup_open_keybag", ":", 1302, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v17 = 0;
      goto LABEL_9;
    }
    fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unwrap backup bag as DER: 0x%08x%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kc_backup_open_keybag", ":", 1290, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, v11, (const char *)&unk_20D83E577);
    bag = aks_load_bag(a1, v9, a5);
    if ((_DWORD)bag)
    {
      v17 = bag;
      fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to load in-kernel backup bag: 0x%08x%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_kc_backup_open_keybag", ":", 1292, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, bag, (const char *)&unk_20D83E577);
    }
    else
    {
      is_enabled = aks_prederived_is_enabled();
      v16 = *a5;
      if (is_enabled)
      {
        v17 = aks_prederived_unlock_keybag(v16, a3, v7, 0);
        if (!(_DWORD)v17)
          goto LABEL_9;
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag with prederived secret: 0x%08x%s\n", "aks", &unk_20D83E577, &unk_20D83E577, &unk_20D83E577, "aks_kc_backup_open_keybag", ":");
      }
      else
      {
        v17 = aks_unlock_bag(v16, a3, v7);
        if (!(_DWORD)v17)
          goto LABEL_9;
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag: 0x%08x%s\n", "aks", &unk_20D83E577, &unk_20D83E577, &unk_20D83E577, "aks_kc_backup_open_keybag", ":");
      }
    }
  }
  else
  {
    v17 = 3758097090;
  }
  if (*a5 != -1)
  {
    aks_unload_bag(*a5);
    *a5 = -1;
  }
LABEL_9:
  aks_prederived_free(0);
  return v17;
}

uint64_t aks_keybag_persona_create(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  mach_port_t aks_client_connection;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t v15;
  char *v16;
  int v18;
  char *v19;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v8 = 3758097084;
  v19 = 0;
  v18 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v15 = aks_client_connection;
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    aks_pack_data(&v19, (unsigned int *)&v18, 1, v10, v11, v12, v13, v14, a4);
    if (v19)
    {
      v8 = IOConnectCallMethod(v15, 0x60u, input, 3u, v19, v18, 0, 0, 0, 0);
      v16 = v19;
    }
    else
    {
      v16 = 0;
      v8 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_keybag_persona_create", ":", 1324, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v16 = 0;
  }
  free(v16);
  return v8;
}

uint64_t aks_keybag_persona_create_with_flags(int a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  void *v18;
  unsigned int inputStructCnt[3];
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v17 = aks_client_connection;
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a5;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, a4);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v10 = IOConnectCallMethod(v17, 0x75u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      v18 = *(void **)&inputStructCnt[1];
    }
    else
    {
      v18 = 0;
      v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_keybag_persona_create_with_flags", ":", 1346, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v18 = 0;
  }
  free(v18);
  return v10;
}

uint64_t aks_keybag_persona_list()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  uint64_t v6;
  mach_port_t aks_client_connection;
  uint64_t v8;
  void *v9;
  size_t v10;
  size_t __count;
  uint64_t input;
  _BYTE __src[8192];
  uint64_t v15;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v15 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x2000uLL);
  __count = 0x2000;
  input = v5;
  v6 = 3758097090;
  if (v4 && v2)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v8 = IOConnectCallMethod(aks_client_connection, 0x61u, &input, 1u, 0, 0, 0, 0, __src, &__count);
      if ((_DWORD)v8)
      {
        v6 = v8;
      }
      else
      {
        if (__count)
        {
          v9 = calloc(__count, 1uLL);
          *v4 = v9;
          if (!v9)
          {
            v6 = 3758097085;
            goto LABEL_10;
          }
          memcpy(v9, __src, __count);
          v10 = __count;
        }
        else
        {
          v10 = 0;
          *v4 = 0;
        }
        v6 = 0;
        *v2 = v10;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_keybag_persona_list", ":", 1372, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v6 = 3758097084;
    }
  }
LABEL_10:
  memset_s(__src, 0x2000uLL, 0, 0x2000uLL);
  return v6;
}

uint64_t aks_keybag_persona_delete(int a1, uint64_t a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  char *v12;
  int v14;
  char *v15;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v15 = 0;
  v14 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v11 = aks_client_connection;
    input[0] = a1;
    aks_pack_data(&v15, (unsigned int *)&v14, 1, v6, v7, v8, v9, v10, a2);
    if (v15)
    {
      v4 = IOConnectCallMethod(v11, 0x62u, input, 1u, v15, v14, 0, 0, 0, 0);
      v12 = v15;
    }
    else
    {
      v12 = 0;
      v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_keybag_persona_delete", ":", 1394, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t aks_auth_token_create(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  uint64_t v12;
  mach_port_t aks_client_connection;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v12 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v12 = 3758097090;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      input[2] = a2;
      input[3] = a3;
      return IOConnectCallMethod(aks_client_connection, 0x26u, input, 4u, 0, 0, 0, 0, a5, a6);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_auth_token_create", ":", 1415, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v12;
}

uint64_t aks_set_configuration(int a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4)
{
  uint64_t v7;
  mach_port_t aks_client_connection;
  mach_port_t v9;
  CFTypeID TypeID;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  CFTypeID v14;
  CFTypeID v15;
  CFTypeID v16;
  CFTypeID v17;
  CFTypeID v18;
  void *v20;
  rsize_t __n;
  void *__s;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  __n = 0;
  __s = 0;
  v7 = 3758097090;
  v20 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v9 = aks_client_connection;
    TypeID = CFNumberGetTypeID();
    if (!_copy_cf_key(a4, CFSTR("GracePeriod"), TypeID, (uint64_t)der_key_config_graceperiod, &v20))
    {
      v11 = CFNumberGetTypeID();
      if (!_copy_cf_key(a4, CFSTR("BackOffDelay"), v11, (uint64_t)der_key_config_backoff_delay, &v20))
      {
        v12 = CFNumberGetTypeID();
        if (!_copy_cf_key(a4, CFSTR("MaxUnlockAttempts"), v12, (uint64_t)der_key_config_max_unlock_attempts, &v20))
        {
          v13 = CFNumberGetTypeID();
          if (!_copy_cf_key(a4, CFSTR("EscrowPasscodePeriod"), v13, (uint64_t)der_key_config_escrow_passcode_period, &v20))
          {
            v14 = CFNumberGetTypeID();
            if (!_copy_cf_key(a4, CFSTR("EscrowTokenPeriod"), v14, (uint64_t)der_key_config_escrow_token_period, &v20))
            {
              v15 = CFDataGetTypeID();
              if (!_copy_cf_key(a4, CFSTR("UserUUID"), v15, (uint64_t)der_key_config_user_uuid, &v20))
              {
                v16 = CFDataGetTypeID();
                if (!_copy_cf_key(a4, CFSTR("BindKEKToKB"), v16, (uint64_t)der_key_config_bind_kek, &v20))
                {
                  v17 = CFBooleanGetTypeID();
                  if (!_copy_cf_key(a4, CFSTR("InactivityRebootEnabled"), v17, (uint64_t)der_key_inactivity_reboot_enabled, &v20))
                  {
                    v18 = CFBooleanGetTypeID();
                    if (!_copy_cf_key(a4, CFSTR("OnenessAutomaticMode"), v18, (uint64_t)der_key_oneness_automatic_mode, &v20)&& !encode_list_is_empty(&v20)&& (!a2 || !encode_list_add_data(&v20, (uint64_t)der_key_passcode, a2))&& !encode_list_dict(&v20, &__s, &__n))
                    {
                      input[0] = a1;
                      input[1] = (uint64_t)__s;
                      input[2] = __n;
                      v7 = IOConnectCallMethod(v9, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
                    }
                  }
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
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_set_configuration", ":", 1488, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v7 = 3758097084;
  }
  encode_list_free(&v20);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t _copy_cf_key(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  const UInt8 *BytePtr;
  uint64_t v10;
  void *value;

  value = 0;
  result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if ((_DWORD)result)
  {
    if (CFGetTypeID(value) == a3)
    {
      if (CFNumberGetTypeID() == a3)
      {
        v10 = 0;
        if (!CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v10)
          || encode_list_add_number(a5, a4, v10))
        {
          return 0xFFFFFFFFLL;
        }
        return 0;
      }
      if (CFBooleanGetTypeID() == a3)
      {
        CFBooleanGetValue((CFBooleanRef)value);
        if (encode_list_add_BOOL(a5, a4))
          return 0xFFFFFFFFLL;
      }
      else
      {
        if (CFDataGetTypeID() != a3)
          return 0xFFFFFFFFLL;
        BytePtr = CFDataGetBytePtr((CFDataRef)value);
        CFDataGetLength((CFDataRef)value);
        if (encode_list_add_data(a5, a4, (uint64_t)BytePtr))
          return 0xFFFFFFFFLL;
      }
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t aks_get_configuration()
{
  int v0;
  __CFDictionary **v1;
  __CFDictionary **v2;
  int v3;
  uint64_t v4;
  mach_port_t aks_client_connection;
  mach_port_t v6;
  uint64_t v7;
  __CFDictionary *Mutable;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeID TypeID;
  CFTypeID v18;
  CFTypeID v19;
  CFTypeID v20;
  CFTypeID v21;
  CFTypeID v22;
  CFTypeID v23;
  CFTypeID v24;
  CFTypeID v25;
  CFTypeID v26;
  CFTypeID v27;
  CFTypeID v28;
  CFTypeID v29;
  CFTypeID v30;
  CFTypeID v31;
  char number;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFDictionary **v45;
  size_t v46[2];
  _QWORD v47[74];
  uint64_t input;
  _BYTE outputStruct[32768];
  uint64_t v50;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  v50 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v2)
    {
      v6 = aks_client_connection;
      bzero(outputStruct, 0x8000uLL);
      v46[0] = 0x8000;
      input = v3;
      v7 = IOConnectCallMethod(v6, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v46);
      if ((_DWORD)v7)
      {
        return v7;
      }
      else if (v46[0] > 0x8000)
      {
        return 3758604298;
      }
      else
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        bzero(v47, 0x250uLL);
        v46[1] = (size_t)der_key_config_graceperiod;
        v47[4] = der_key_config_backoff_delay;
        v47[9] = der_key_config_max_unlock_attempts;
        v47[14] = der_key_config_escrow_passcode_period;
        v47[19] = der_key_config_escrow_token_period;
        v47[24] = der_key_config_flags;
        v47[29] = der_key_config_user_uuid;
        v47[34] = der_key_config_group_uuid;
        v47[39] = der_key_config_recovery_iterations;
        v47[44] = der_key_config_recovery_flags;
        v47[49] = der_key_config_recovery_target_iterations;
        v47[54] = der_key_memento_supported;
        v47[59] = der_key_memento_blob_exists;
        v47[64] = der_key_config_memento_passcode_generation;
        v47[69] = der_key_config_passcode_generation;
        der_dict_iterate();
        v9 = v47[0];
        v10 = v47[5];
        v11 = v47[10];
        v12 = v47[15];
        v13 = v47[20];
        v14 = v47[25];
        v15 = v47[30];
        v45 = v2;
        v16 = v47[35];
        v38 = v47[40];
        v39 = v47[45];
        v40 = v47[50];
        v41 = v47[55];
        v42 = v47[60];
        v43 = v47[65];
        v44 = v47[70];
        TypeID = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("GracePeriod"), TypeID, v9);
        v18 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("BackOffDelay"), v18, v10);
        v19 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("MaxUnlockAttempts"), v19, v11);
        v20 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("EscrowPasscodePeriod"), v20, v12);
        v21 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("EscrowTokenPeriod"), v21, v13);
        v22 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("ConfigFlags"), v22, v14);
        v23 = CFDataGetTypeID();
        _set_cf_key(Mutable, CFSTR("UserUUID"), v23, v15);
        v24 = CFDataGetTypeID();
        _set_cf_key(Mutable, CFSTR("GroupUUID"), v24, v16);
        v25 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("RecoveryIterations"), v25, v38);
        v26 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("RecoveryFlags"), v26, v39);
        v27 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("RecoveryTargetIterations"), v27, v40);
        v28 = CFBooleanGetTypeID();
        _set_cf_key(Mutable, CFSTR("MementoSupported"), v28, v41);
        v29 = CFBooleanGetTypeID();
        _set_cf_key(Mutable, CFSTR("MementoBlobExists"), v29, v42);
        v30 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("MementoPasscodeGeneration"), v30, v43);
        v31 = CFNumberGetTypeID();
        _set_cf_key(Mutable, CFSTR("PasscodeGeneration"), v31, v44);
        number = der_get_number();
        v33 = (const void *)*MEMORY[0x24BDBD268];
        v34 = (const void *)*MEMORY[0x24BDBD270];
        if ((number & 2) != 0)
          v35 = (const void *)*MEMORY[0x24BDBD270];
        else
          v35 = (const void *)*MEMORY[0x24BDBD268];
        CFDictionarySetValue(Mutable, CFSTR("InactivityRebootEnabled"), v35);
        if ((number & 8) != 0)
          v36 = v34;
        else
          v36 = v33;
        CFDictionarySetValue(Mutable, CFSTR("OnenessAutomaticMode"), v36);
        v4 = 0;
        *v45 = Mutable;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_get_configuration", ":", 1556, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v4;
}

void _set_cf_key(__CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  CFNumberRef v7;
  int v8;
  const void **v9;
  const UInt8 *v10;
  CFNumberRef v11;
  CFIndex valuePtr;

  if (a4)
  {
    if (CFNumberGetTypeID() == a3)
    {
      valuePtr = der_get_number();
      v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
      if (!v7)
        return;
LABEL_12:
      v11 = v7;
      CFDictionaryAddValue(a1, a2, v7);
      CFRelease(v11);
      return;
    }
    if (CFBooleanGetTypeID() == a3)
    {
      v8 = der_get_BOOL();
      v9 = (const void **)MEMORY[0x24BDBD270];
      if (!v8)
        v9 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a1, a2, *v9);
    }
    else if (CFDataGetTypeID() == a3)
    {
      valuePtr = 0;
      v10 = (const UInt8 *)ccder_decode_tl();
      if (v10)
      {
        v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, valuePtr);
        goto LABEL_12;
      }
    }
  }
}

uint64_t aks_assert_hold(int a1, unsigned int a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x1Au, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_assert_hold", ":", 1654, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_assert_drop(int a1, unsigned int a2)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x1Bu, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_assert_drop", ":", 1672, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_assert_promote(int a1, unsigned int a2)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a2;
    input[1] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x64u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_assert_promote", ":", 1687, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_oneness_heartbeat(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x91u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_oneness_heartbeat", ":", 1707, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_assert_consume(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x65u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_assert_consume", ":", 1722, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_recover_with_escrow_bag(int a1, uint64_t a2)
{
  mach_port_t aks_client_connection;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_port_t v10;
  uint64_t v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v14 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = aks_client_connection;
    aks_pack_data((char **)&v15, (unsigned int *)&v14, 3, v5, v6, v7, v8, v9, a2);
    input[0] = a1;
    input[1] = (uint64_t)v15;
    input[2] = v14;
    v11 = IOConnectCallMethod(v10, 0x12u, input, 3u, 0, 0, 0, 0, 0, 0);
    v12 = v15;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_recover_with_escrow_bag", ":", 1739, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v12 = 0;
    v11 = 3758097084;
  }
  free(v12);
  return v11;
}

uint64_t aks_fdr_hmac_data()
{
  uint64_t v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  const void *v7;
  uint64_t v8;
  mach_port_t aks_client_connection;
  uint64_t v10;
  void *v11;
  size_t __count;
  _BYTE __src[32768];
  uint64_t v15;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = (const void *)v0;
  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 3758097090;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v7 && v4 && v2)
    {
      v10 = IOConnectCallMethod(aks_client_connection, 0x29u, 0, 0, v7, v6, 0, 0, __src, &__count);
      if ((_DWORD)v10)
      {
        v8 = v10;
      }
      else
      {
        v11 = calloc(__count, 1uLL);
        *v4 = v11;
        if (v11)
        {
          memcpy(v11, __src, __count);
          v8 = 0;
          *v2 = __count;
        }
        else
        {
          v8 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fdr_hmac_data", ":", 1758, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v8 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v8;
}

uint64_t aks_generation(int a1, unsigned int a2, _DWORD *a3)
{
  mach_port_t aks_client_connection;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(aks_client_connection, 0x28u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (a3)
    {
      if (!(_DWORD)result)
        *a3 = output;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_generation", ":", 1781, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return result;
}

uint64_t _aks_verify_password(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  mach_port_t v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v9 = 3758097084;
  v21 = 0;
  v20 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v16 = aks_client_connection;
    if (a2)
      v17 = a2;
    else
      v17 = &unk_20D83E577;
    aks_pack_data((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      input[2] = (uint64_t)v21;
      input[3] = v20;
      v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      v18 = v21;
    }
    else
    {
      v18 = 0;
      v9 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "_aks_verify_password", ":", 1807, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t aks_verify_password(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 0);
}

uint64_t aks_verify_password_memento(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 1u);
}

uint64_t aks_register_for_notifications()
{
  if (get_aks_client_connection())
    JUMPOUT(0x212BA9214);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_register_for_notifications", ":", 1840, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_create_signing_key(int a1, int a2, _QWORD *a3, size_t *a4)
{
  uint64_t result;
  mach_port_t aks_client_connection;
  void *v8;
  size_t __count;
  uint64_t input[2];
  _OWORD __src[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  __count = 256;
  input[0] = a1;
  input[1] = a2;
  result = 3758097090;
  if (a3 && a4)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      memset(__src, 0, sizeof(__src));
      result = IOConnectCallMethod(aks_client_connection, 0x31u, input, 2u, 0, 0, 0, 0, __src, &__count);
      if (!(_DWORD)result)
      {
        if (__count > 0x100)
        {
          return 3758604298;
        }
        else
        {
          v8 = calloc(__count, 1uLL);
          *a3 = v8;
          if (v8)
          {
            memcpy(v8, __src, __count);
            result = 0;
            *a4 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_create_signing_key", ":", 1859, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_create_signing_key_with_params()
{
  int v0;
  const void *v1;
  size_t v2;
  _QWORD *v3;
  size_t *v4;
  int v5;
  uint64_t result;
  size_t *v7;
  _QWORD *v8;
  size_t v9;
  const void *v10;
  mach_port_t aks_client_connection;
  mach_port_t v12;
  void *v13;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v17;

  v0 = MEMORY[0x24BDAC7A8]();
  v17 = *MEMORY[0x24BDAC8D0];
  __count = 0x8000;
  input[0] = v0;
  input[1] = v5;
  result = 3758097090;
  if (v3)
  {
    v7 = v4;
    if (v4)
    {
      v8 = v3;
      v9 = v2;
      v10 = v1;
      aks_client_connection = get_aks_client_connection();
      if (aks_client_connection)
      {
        v12 = aks_client_connection;
        bzero(__src, 0x8000uLL);
        result = IOConnectCallMethod(v12, 0x31u, input, 2u, v10, v9, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count > 0x8000)
          {
            return 3758604298;
          }
          else
          {
            v13 = calloc(__count, 1uLL);
            *v8 = v13;
            if (v13)
            {
              memcpy(v13, __src, __count);
              result = 0;
              *v7 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_create_signing_key_with_params", ":", 1881, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
        return 3758097084;
      }
    }
  }
  return result;
}

uint64_t aks_obliterate_signing_keys()
{
  return remote_session_operate();
}

uint64_t remote_session_operate()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint32_t v5;
  uint32_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_t aks_client_connection;
  mach_port_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  size_t v14;
  size_t __count;
  uint64_t input[3];
  _BYTE __src[15360];
  uint64_t v19;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v19 = *MEMORY[0x24BDAC8D0];
  __count = 15360;
  input[0] = v0;
  input[1] = v7;
  input[2] = v8;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = aks_client_connection;
    bzero(__src, 0x3C00uLL);
    v11 = IOConnectCallMethod(v10, v6, input, 3u, 0, 0, 0, 0, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }
    else if (__count > 0x3C00)
    {
      return 3758604298;
    }
    else
    {
      v12 = 0;
      if (v4 && v2)
      {
        if (__count)
        {
          v13 = calloc(__count, 1uLL);
          *v4 = v13;
          if (!v13)
            return 3758097085;
          memcpy(v13, __src, __count);
          v14 = __count;
        }
        else
        {
          v14 = 0;
        }
        v12 = 0;
        *v2 = v14;
      }
    }
  }
  else
  {
    v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "remote_session_operate", ":", 2017, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v12;
}

uint64_t aks_sign_signing_key(int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, _QWORD *a8, size_t *a9)
{
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  mach_port_t v18;
  uint64_t v19;
  void *v20;
  unsigned int inputStructCnt[3];
  size_t __count;
  uint64_t input[3];
  _OWORD __src[16];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  memset(__src, 0, sizeof(__src));
  __count = 256;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  input[0] = a1;
  input[1] = a2;
  v9 = 3758097090;
  input[2] = a5;
  if (a8 && a9)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v18 = aks_client_connection;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v13, v14, v15, v16, v17, a3);
      if (*(_QWORD *)&inputStructCnt[1])
      {
        v19 = IOConnectCallMethod(v18, 0x32u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if ((_DWORD)v19)
        {
          v9 = v19;
        }
        else if (__count > 0x100)
        {
          v9 = 3758604298;
        }
        else
        {
          v20 = calloc(__count, 1uLL);
          *a8 = v20;
          v9 = 3758097085;
          if (v20)
          {
            memcpy(v20, __src, __count);
            v9 = 0;
            *a9 = __count;
          }
        }
      }
      else
      {
        v9 = 3758097085;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_sign_signing_key", ":", 1911, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v9 = 3758097084;
    }
  }
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t aks_remote_session(int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  uint64_t v10;
  mach_port_t aks_client_connection;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  uint64_t v18;
  uint32_t outputCnt;
  unsigned int inputStructCnt[3];
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  input[0] = a2;
  input[1] = a1;
  output = 0;
  outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v17 = aks_client_connection;
    aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a3);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v18 = IOConnectCallMethod(v17, 0x2Cu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, 0, 0);
      v10 = v18;
      if (a9 && !(_DWORD)v18)
        *a9 = output;
    }
    else
    {
      v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_remote_session", ":", 1938, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t aks_validate_local_key(int a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v8;
  uint64_t v11;
  void *v12;
  rsize_t __smax;
  rsize_t __n;
  uint64_t v16;
  void *v17;
  void *__s;
  __int128 v19;

  v17 = 0;
  __s = 0;
  v4 = 3758097084;
  __n = 0;
  v16 = 0;
  v5 = 3758097090;
  __smax = 0;
  if (!a3 || !a4)
    goto LABEL_12;
  v8 = -536870212;
  *(_QWORD *)&v19 = a3;
  *((_QWORD *)&v19 + 1) = a3 + a4;
  if (!(a3 + a4))
    goto LABEL_19;
  v16 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    v8 = -536870198;
LABEL_19:
    syslog(3, "error parsing signing key: %d", v8);
    v5 = 3758097084;
LABEL_12:
    v12 = __s;
    v4 = v5;
    goto LABEL_13;
  }
  der_utils_decode_implicit_uint64(&v19, 0x8000000000000001, &v16);
  if (v16)
  {
    v5 = remote_session_operate();
    if ((_DWORD)v5)
      syslog(3, "error: validating v1 local signing key failed: %d");
    goto LABEL_12;
  }
  v11 = aks_create_signing_key(a1, 11, &__s, &__n);
  if ((_DWORD)v11)
  {
    v5 = v11;
    syslog(3, "error: validating (create) v0 local signing key failed: %d", v11);
    goto LABEL_12;
  }
  v12 = __s;
  if (__s && __n)
  {
    v5 = aks_sign_signing_key(a1, a2, a3, a4, 11, (uint64_t)__s, __n, &v17, &__smax);
    if ((_DWORD)v5)
      syslog(3, "error: validating (sign) v0 local signing key failed: %d");
    goto LABEL_12;
  }
LABEL_13:
  if (v12)
  {
    memset_s(v12, __n, 0, __n);
    free(__s);
  }
  if (v17)
  {
    memset_s(v17, __smax, 0, __smax);
    free(v17);
  }
  return v4;
}

uint64_t aks_remote_session_step()
{
  return remote_session_operate();
}

uint64_t aks_remote_peer_setup()
{
  return remote_session_operate();
}

uint64_t aks_remote_peer_setup_with_acm()
{
  return remote_session_operate();
}

uint64_t aks_remote_peer_confirm()
{
  return remote_session_operate();
}

uint64_t aks_remote_session_token()
{
  return remote_session_operate();
}

uint64_t aks_drain_backup_keys()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  mach_port_t aks_client_connection;
  mach_port_t v7;
  uint64_t result;
  void *v9;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v13;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v13 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v7 = aks_client_connection;
    result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input[0] = v5;
        input[1] = 0;
        result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            v9 = calloc(__count, 1uLL);
            *v4 = v9;
            if (v9)
            {
              memcpy(v9, __src, __count);
              result = 0;
              *v2 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_drain_backup_keys", ":", 2072, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return result;
}

uint64_t aks_drain_backup_keys_info()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  mach_port_t aks_client_connection;
  mach_port_t v7;
  uint64_t result;
  void *v9;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v13;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v13 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v7 = aks_client_connection;
    result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input[0] = v5;
        input[1] = 1;
        result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            if (__ROR8__(0xEF7BDEF7BDEF7BDFLL * __count, 2) > 0x210842108421084uLL)
            {
              return 3758604298;
            }
            else
            {
              v9 = calloc(__count, 1uLL);
              *v4 = v9;
              if (v9)
              {
                memcpy(v9, __src, __count);
                result = 0;
                *v2 = __count / 0x7C;
              }
              else
              {
                return 3758097085;
              }
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_drain_backup_keys_info", ":", 2100, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return result;
}

uint64_t aks_clear_backup_bag(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 0x16u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_clear_backup_bag", ":", 2129, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_set_backup_bag()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  mach_port_t aks_client_connection;
  mach_port_t v13;
  _BYTE *outputStruct;
  size_t *p_count;
  uint64_t v16;
  uint64_t result;
  void *v18;
  size_t __count;
  uint64_t input[5];
  _BYTE __src[32768];
  uint64_t v22;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v22 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_set_backup_bag", ":", 2146, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  v13 = aks_client_connection;
  if (v4)
  {
    if (!v2)
      return 3758097090;
    outputStruct = __src;
    p_count = &__count;
    v16 = 1;
  }
  else
  {
    p_count = 0;
    outputStruct = 0;
    v16 = 0;
  }
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  input[0] = v11;
  input[1] = v10;
  input[2] = v16;
  input[3] = v8;
  input[4] = v6;
  result = IOConnectCallMethod(v13, 0x15u, input, 5u, 0, 0, 0, 0, outputStruct, p_count);
  if (v4 && !(_DWORD)result)
  {
    v18 = calloc(__count, 1uLL);
    *v4 = v18;
    if (v18)
    {
      memcpy(v18, __src, __count);
      result = 0;
      *v2 = __count;
    }
    else
    {
      return 3758097085;
    }
  }
  return result;
}

uint64_t aks_make_public_backup_bag(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(aks_client_connection, 0x52u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_make_public_backup_bag", ":", 2178, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v4;
}

uint64_t aks_remote_session_reset()
{
  return remote_session_operate();
}

uint64_t aks_remote_session_reset_all()
{
  return remote_session_operate();
}

uint64_t aks_get_device_state()
{
  return _get_device_state();
}

uint64_t _get_device_state()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint32_t v3;
  uint32_t v4;
  uint64_t v5;
  mach_port_t aks_client_connection;
  mach_port_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  int v12[2];
  __int128 __s;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  _BYTE outputStruct[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  *(_QWORD *)v12 = 4096;
  v5 = 3758097084;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  __s = 0u;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v2)
    {
      v7 = aks_client_connection;
      bzero(outputStruct, 0x1000uLL);
      v8 = IOConnectCallMethod(v7, v4, input, 1u, 0, 0, 0, 0, outputStruct, (size_t *)v12);
      if ((_DWORD)v8)
      {
        return v8;
      }
      else
      {
        v5 = 0;
        if (!decode_extended_state((uint64_t)outputStruct, v12[0], (char *)&__s))
        {
          v9 = v16;
          *(_OWORD *)(v2 + 32) = v15;
          *(_OWORD *)(v2 + 48) = v9;
          *(_WORD *)(v2 + 64) = v17;
          v10 = v14;
          *(_OWORD *)v2 = __s;
          *(_OWORD *)(v2 + 16) = v10;
        }
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "_get_device_state", ":", 2224, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v5;
}

uint64_t aks_get_extended_device_state()
{
  return _get_device_state();
}

uint64_t aks_remote_peer_get_state()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  size_t v3;
  size_t v4;
  const void *v5;
  const void *v6;
  uint64_t v7;
  mach_port_t aks_client_connection;
  mach_port_t v9;
  uint64_t v10;
  size_t v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t input;
  _BYTE outputStruct[4096];
  uint64_t v26;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = 3758097084;
  v12[0] = 4096;
  input = v0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v2)
    {
      v9 = aks_client_connection;
      bzero(outputStruct, 0x1000uLL);
      memset_s(v2, 0x10uLL, 0, 0x10uLL);
      v10 = IOConnectCallMethod(v9, 0x39u, &input, 1u, v6, v4, 0, 0, outputStruct, v12);
      if ((_DWORD)v10)
      {
        return v10;
      }
      else
      {
        v17 = 0;
        v21 = 0u;
        v13 = 0u;
        v14 = 0u;
        v16 = 0u;
        v19 = 0u;
        v20 = 0u;
        v22 = 0u;
        v23 = 0;
        v12[1] = (size_t)der_key_peer_unlock_token_status;
        v15 = (unint64_t)der_key_peer_unwrapped_escrow_record_status;
        v18 = der_key_peer_wrapped_escrow_record_status;
        *(_QWORD *)&v21 = der_key_peer_flags;
        der_dict_iterate();
        *v2 = der_get_number();
        v2[1] = der_get_number();
        v2[2] = der_get_number();
        v7 = 0;
        v2[3] = der_get_number();
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_remote_peer_get_state", ":", 2255, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v7;
}

uint64_t aks_remote_peer_drop(int a1, const void *a2, size_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x3Au, input, 1u, a2, a3, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_remote_peer_drop", ":", 2292, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_lock_device(int a1, int a2)
{
  mach_port_t aks_client_connection;
  uint32_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
      v4 = 32;
    else
      v4 = 8;
    return IOConnectCallMethod(aks_client_connection, v4, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_lock_device", ":", 2307, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_lock_cx(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x8Du, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_lock_cx", ":", 2327, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_unlock_device(int a1, uint64_t a2, int a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 9u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_unlock_device", ":", 2342, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_obliterate_class_d()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x13u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_obliterate_class_d", ":", 2355, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_migrate_s_key(int a1, unsigned int a2, uint64_t a3, unsigned int a4, const void *a5, int a6)
{
  mach_port_t aks_client_connection;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a4;
    return IOConnectCallMethod(aks_client_connection, 0x3Fu, input, 4u, a5, a6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_migrate_s_key", ":", 2367, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_smartcard_register(int a1, uint64_t a2, uint64_t a3, unsigned int a4, const void *a5, size_t a6, _QWORD *a7, size_t *a8)
{
  mach_port_t aks_client_connection;
  mach_port_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  size_t v17;
  size_t __count;
  _BYTE __src[2048];
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a4;
  input[2] = a2;
  input[3] = a3;
  __count = 2048;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v13 = aks_client_connection;
    bzero(__src, 0x800uLL);
    v14 = IOConnectCallMethod(v13, 0x3Bu, input, 4u, a5, a6, 0, 0, __src, &__count);
    if ((_DWORD)v14)
    {
      return v14;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      v15 = 0;
      if (a7 && a8)
      {
        if (__count)
        {
          v16 = calloc(__count, 1uLL);
          *a7 = v16;
          if (!v16)
            return 3758097085;
          memcpy(v16, __src, __count);
          v17 = __count;
        }
        else
        {
          v17 = 0;
        }
        v15 = 0;
        *a8 = v17;
      }
    }
  }
  else
  {
    v15 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_smartcard_register", ":", 2388, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v15;
}

uint64_t aks_smartcard_unregister(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x3Cu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_smartcard_unregister", ":", 2412, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_smartcard_request_unlock(int a1, const void *a2, size_t a3, _QWORD *a4, size_t *a5)
{
  mach_port_t aks_client_connection;
  mach_port_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  size_t v14;
  size_t __count;
  _BYTE __src[2048];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  __count = 2048;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = aks_client_connection;
    bzero(__src, 0x800uLL);
    v11 = IOConnectCallMethod(v10, 0x3Du, input, 1u, a2, a3, 0, 0, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      v12 = 0;
      if (a4 && a5)
      {
        if (__count)
        {
          v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (!v13)
            return 3758097085;
          memcpy(v13, __src, __count);
          v14 = __count;
        }
        else
        {
          v14 = 0;
        }
        v12 = 0;
        *a5 = v14;
      }
    }
  }
  else
  {
    v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_smartcard_request_unlock", ":", 2429, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  return v12;
}

uint64_t aks_smartcard_unlock(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, size_t *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t aks_client_connection;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  size_t v19;
  size_t __count;
  unsigned int inputStructCnt[3];
  _BYTE __src[2048];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x800uLL);
  __count = 2048;
  aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  if (!*(_QWORD *)&inputStructCnt[1])
  {
    v17 = 3758097085;
    goto LABEL_12;
  }
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_smartcard_unlock", ":", 2460, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v17 = 3758097084;
    goto LABEL_12;
  }
  v16 = IOConnectCallMethod(aks_client_connection, 0x3Eu, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
  if ((_DWORD)v16)
  {
    v17 = v16;
    goto LABEL_12;
  }
  if (__count > 0x800)
  {
    v17 = 3758604298;
    goto LABEL_12;
  }
  v17 = 0;
  if (a6 && a7)
  {
    if (!__count)
    {
      v19 = 0;
      goto LABEL_11;
    }
    v18 = calloc(__count, 1uLL);
    *a6 = v18;
    v17 = 3758097085;
    if (v18)
    {
      memcpy(v18, __src, __count);
      v19 = __count;
LABEL_11:
      v17 = 0;
      *a7 = v19;
    }
  }
LABEL_12:
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t aks_smartcard_get_sc_usk(unint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (aks_smartcard_get_foo((uint64_t)der_key_sc_enc_sc_usk, 0, a1, a2, a3, a4))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t aks_smartcard_get_foo(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t number;
  uint64_t v11;
  uint64_t v12;

  result = 0xFFFFFFFFLL;
  if (a6 && a3 && a4 && a5 && a3 + a4 > a3)
  {
    der_dict_iterate();
    if (a2)
    {
      if (*a6 == 8)
      {
        number = der_get_number();
        result = 0;
        *a5 = number;
        return result;
      }
      return 0xFFFFFFFFLL;
    }
    v11 = ccder_decode_tl();
    if (!v11)
      return 0xFFFFFFFFLL;
    v12 = v11;
    result = 0;
    *a5 = v12;
    *a6 = 0;
  }
  return result;
}

uint64_t aks_smartcard_get_ec_pub(unint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (aks_smartcard_get_foo((uint64_t)der_key_sc_auth_eph_pub, 0, a1, a2, a3, a4))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t aks_smartcard_get_mode(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 8;
  if (!a3)
    return 0xFFFFFFFFLL;
  v6 = 0;
  result = aks_smartcard_get_foo((uint64_t)der_key_sc_auth_mode, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *a3 = v6;
  return result;
}

uint64_t aks_smartcard_get_version(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 8;
  if (!a3)
    return 0xFFFFFFFFLL;
  v6 = 0;
  result = aks_smartcard_get_foo((uint64_t)der_key_sc_auth_version, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *a3 = v6;
  return result;
}

uint64_t aks_se_fail(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x47u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_fail", ":", 2589, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_se_set_healthy(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x49u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_set_healthy", ":", 2605, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_se_set_secret(int a1, uint64_t a2, uint64_t a3)
{
  return __aks_se_set_secret(a1, a2, a3, 0x45u);
}

uint64_t __aks_se_set_secret(int a1, uint64_t a2, uint64_t a3, uint32_t a4)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, a4, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "__aks_se_set_secret", ":", 2621, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_se_set_secret_memento(int a1, uint64_t a2, uint64_t a3)
{
  return __aks_se_set_secret(a1, a2, a3, 0x8Cu);
}

uint64_t aks_se_recover(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x46u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_recover", ":", 2649, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_change_secret_epilogue(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x69u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_change_secret_epilogue", ":", 2665, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_se_get_reset_token_for_memento_secret()
{
  int v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  mach_port_t aks_client_connection;
  uint64_t v6;
  unint64_t number;
  uint64_t v8;
  rsize_t __n[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE __s[4096];
  uint64_t input[4];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  input[1] = v3;
  input[2] = v4;
  bzero(__s, 0x1000uLL);
  __n[0] = 4096;
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    v8 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_get_reset_token_for_memento_secret", ":", 2683, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    goto LABEL_10;
  }
  v6 = IOConnectCallMethod(aks_client_connection, 0x48u, input, 3u, 0, 0, 0, 0, __s, __n);
  if ((_DWORD)v6)
  {
    v8 = v6;
    goto LABEL_10;
  }
  if (__n[0] - 4097 < 0xFFFFFFFFFFFFF000)
  {
    v8 = 3758604298;
    goto LABEL_10;
  }
  v15 = 0;
  v14 = 0u;
  v12 = 0u;
  v11 = 0u;
  __n[1] = (rsize_t)der_key_config_se_reset_token;
  v13 = (unint64_t)der_key_config_se_slot;
  der_dict_iterate();
  if ((_QWORD)v11)
  {
    ccder_decode_tl();
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (!*((_QWORD *)&v13 + 1))
    goto LABEL_9;
  number = der_get_number();
  if (number > 0xFF)
    goto LABEL_9;
  v8 = 0;
  *v2 = number;
LABEL_10:
  memset_s(__s, __n[0], 0, __n[0]);
  return v8;
}

uint64_t aks_se_get_reset_token()
{
  return aks_se_get_reset_token_for_memento_secret();
}

uint64_t aks_se_set_nonce(int a1, const void *a2, size_t a3)
{
  mach_port_t aks_client_connection;
  size_t v6;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a2)
      v6 = a3;
    else
      v6 = 0;
    return IOConnectCallMethod(aks_client_connection, 0x58u, input, 1u, a2, v6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_set_nonce", ":", 2737, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
}

uint64_t aks_se_get_reset_sig()
{
  int v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v11;
  _BYTE *v12;
  int v13;
  void *v14;
  size_t v15;
  size_t __n;
  int __s;
  char v19;
  _BYTE v20[3];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  bzero(&__s, 0x1000uLL);
  __n = 4096;
  v9 = 3758097090;
  if (v8)
  {
    if (v6)
    {
      v9 = 3758097090;
      if (v4)
      {
        if (v2)
        {
          aks_client_connection = get_aks_client_connection();
          if (aks_client_connection)
          {
            v11 = IOConnectCallMethod(aks_client_connection, 0x5Au, input, 1u, 0, 0, 0, 0, &__s, &__n);
            if ((_DWORD)v11)
            {
              v9 = v11;
            }
            else if (__n - 4097 < 0xFFFFFFFFFFFFF005)
            {
              v9 = 3758604298;
            }
            else
            {
              v12 = calloc(5uLL, 1uLL);
              *v4 = v12;
              if (v12)
              {
                *v2 = 5;
                v13 = __s;
                v12[4] = v19;
                *(_DWORD *)v12 = v13;
                v14 = calloc(__n - 5, 1uLL);
                *v8 = v14;
                v9 = 3758097085;
                if (v14)
                {
                  v15 = __n;
                  *v6 = __n - 5;
                  memcpy(v14, v20, v15);
                  v9 = 0;
                }
              }
              else
              {
                v9 = 3758097085;
              }
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_get_reset_sig", ":", 2759, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
            v9 = 3758097084;
          }
        }
      }
    }
  }
  memset_s(&__s, __n, 0, __n);
  return v9;
}

uint64_t aks_se_get_reset_pubkey()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  size_t v5;
  uint64_t v6;
  mach_port_t aks_client_connection;
  uint64_t v8;
  void *v9;
  size_t __count;
  _BYTE __src[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  v5 = 4096;
  bzero(__src, 0x1000uLL);
  __count = 4096;
  v6 = 3758097090;
  if (v4 && v2)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v8 = IOConnectCallMethod(aks_client_connection, 0x59u, input, 1u, 0, 0, 0, 0, __src, &__count);
      v5 = __count;
      if ((_DWORD)v8)
      {
        v6 = v8;
      }
      else if (__count - 4097 < 0xFFFFFFFFFFFFF000)
      {
        v6 = 3758604298;
      }
      else
      {
        v9 = calloc(__count, 1uLL);
        *v4 = v9;
        v5 = __count;
        if (v9)
        {
          *v2 = __count;
          memcpy(v9, __src, v5);
          v6 = 0;
          v5 = __count;
        }
        else
        {
          v6 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_get_reset_pubkey", ":", 2791, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v5 = 4096;
      v6 = 3758097084;
    }
  }
  memset_s(__src, v5, 0, v5);
  return v6;
}

uint64_t aks_se_delete_reset_token(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x5Bu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_delete_reset_token", ":", 2815, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_se_support_in_rm(unsigned int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x5Eu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_support_in_rm", ":", 2832, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_se_support_in_rm_is_set(BOOL *a1)
{
  mach_port_t aks_client_connection;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    result = IOConnectCallMethod(aks_client_connection, 0x6Bu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
    if (a1)
    {
      if (!(_DWORD)result)
        *a1 = output[0] != 0;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_support_in_rm_is_set", ":", 2848, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return result;
}

uint64_t aks_se_stage_stash()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x5Fu, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_stage_stash", ":", 2865, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_fv_lock_volume_bag()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_unwrap_vek()
{
  return aks_fv_unwrap_vek_with_acm();
}

uint64_t aks_fv_get_blob_state()
{
  uint64_t v0;
  _DWORD *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  mach_port_t aks_client_connection;
  mach_port_t v8;
  uint64_t v9;
  __int128 v11;
  int v12[2];
  _BYTE __s[4096];
  uint64_t v14;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v14 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v11 = __s;
  *((_QWORD *)&v11 + 1) = &v14;
  *(_QWORD *)v12 = 4096;
  v6 = 3758097090;
  if (v4 && v2)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v8 = aks_client_connection;
      if (der_utils_encode_fv_data(&v11, v4) && der_utils_encode_fv_params(&v11, v5))
      {
        v6 = 3758097098;
        if (ccder_blob_encode_tl())
        {
          v9 = IOConnectCallMethod(v8, 0x55u, 0, 0, *((const void **)&v11 + 1), (size_t)&v14 - *((_QWORD *)&v11 + 1), 0, 0, __s, (size_t *)v12);
          if (!(_DWORD)v9)
            v9 = decode_fv_blob_state((uint64_t)__s, *(uint64_t *)v12, v2);
          v6 = v9;
        }
      }
      else
      {
        v6 = 3758097098;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_get_blob_state", ":", 2900, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v6 = 3758097084;
    }
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v6;
}

uint64_t aks_fv_get_last_known_gp_state()
{
  return aks_fv_get_blob_state();
}

uint64_t aks_fv_get_size()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  mach_port_t aks_client_connection;
  mach_port_t v7;
  __int128 v9;
  uint32_t outputCnt;
  _BYTE __s[4096];
  uint64_t output;
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097098;
  output = 0;
  input[0] = v5;
  outputCnt = 1;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v9 = __s;
  *((_QWORD *)&v9 + 1) = &output;
  if (v2)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v7 = aks_client_connection;
      if (der_utils_encode_fv_params(&v9, v3))
      {
        if (ccder_blob_encode_tl())
        {
          v4 = IOConnectCallMethod(v7, 0x4Eu, input, 1u, *((const void **)&v9 + 1), (size_t)&input[-1] - *((_QWORD *)&v9 + 1), &output, &outputCnt, 0, 0);
          if (!(_DWORD)v4)
            *v2 = output;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_get_size", ":", 2943, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v4 = 3758097084;
    }
  }
  else
  {
    v4 = 3758097090;
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v4;
}

uint64_t aks_fv_import()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  mach_port_t aks_client_connection;
  mach_port_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  size_t v16;
  _BYTE __s[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = v0;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v8;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v15 = __s;
  *((_QWORD *)&v15 + 1) = input;
  v16 = 4096;
  v9 = 3758097090;
  if (v6 && v4)
  {
    aks_client_connection = get_aks_client_connection();
    if (!aks_client_connection)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fv_import", ":", 2971, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v9 = 3758097084;
      goto LABEL_14;
    }
    v11 = aks_client_connection;
    if (!ccder_blob_encode_body_tl()
      || !der_utils_encode_fv_data(&v15, v6)
      || !der_utils_encode_fv_params(&v15, v7)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_12;
    }
    v12 = IOConnectCallMethod(v11, 0x4Fu, input, 1u, *((const void **)&v15 + 1), (size_t)input - *((_QWORD *)&v15 + 1), 0, 0, __s, &v16);
    if ((_DWORD)v12)
    {
      v9 = v12;
      goto LABEL_14;
    }
    *(_QWORD *)&v14 = __s;
    *((_QWORD *)&v14 + 1) = &__s[v16];
    if (!ccder_blob_decode_range())
      goto LABEL_12;
    if (!v2)
    {
      v9 = 0;
      goto LABEL_14;
    }
    v9 = 0;
    if ((der_utils_decode_fv_data(&v14, 0, v2) & 1) == 0)
LABEL_12:
      v9 = 3758097098;
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v9;
}

uint64_t aks_fv_get_verifier_size()
{
  return aks_fv_get_size();
}

uint64_t aks_fv_get_access_token_size()
{
  return aks_fv_get_size();
}

uint64_t aks_fv_new_verifier()
{
  return aks_fv_new_kek();
}

uint64_t aks_fv_rewrap_verifier()
{
  return aks_fv_rewrap_kek();
}

uint64_t aks_fv_new_access_token()
{
  return aks_fv_new_vek();
}

uint64_t aks_fv_new_unbound_access_token()
{
  return aks_fv_new_vek();
}

uint64_t aks_fv_bind_access_token()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_is_access_token_unbound(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 3758097090;
  result = aks_fv_get_blob_state();
  if (!(_DWORD)result)
    return 3758604312;
  return result;
}

uint64_t aks_fv_load_access_token_as_system_keychain()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_verify_user_opts()
{
  return aks_fv_unwrap_vek_with_acm();
}

uint64_t aks_fv_grant_ownership()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  _BYTE v12[4096];
  _BYTE v13[4096];
  uint64_t v14;

  MEMORY[0x24BDAC7A8]();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v14 = *MEMORY[0x24BDAC8D0];
  v8 = 3758097098;
  bzero(v13, 0x1000uLL);
  bzero(v12, 0x1000uLL);
  *(_QWORD *)&v11 = v13;
  *((_QWORD *)&v11 + 1) = &v14;
  *(_QWORD *)&v10 = v12;
  *((_QWORD *)&v10 + 1) = v13;
  if (der_utils_encode_fv_data(&v11, v7)
    && der_utils_encode_fv_data(&v11, v5)
    && ccder_blob_encode_tl()
    && der_utils_encode_fv_data(&v10, v3)
    && der_utils_encode_fv_data(&v10, v1)
    && ccder_blob_encode_tl())
  {
    return aks_fv_set_protection();
  }
  return v8;
}

uint64_t aks_fv_owners_exist()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_remove_external_kek_group()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_sidp_status()
{
  _BYTE *v0;
  _BYTE *v1;
  _BYTE *v2;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[16384];
  uint64_t v6;

  MEMORY[0x24BDAC7A8]();
  v1 = v0;
  v3 = v2;
  v6 = *MEMORY[0x24BDAC8D0];
  bzero(v5, 0x4000uLL);
  result = aks_fv_set_protection();
  if (!(_DWORD)result)
  {
    if (ccder_decode_sequence_tl() && ccder_decode_tl())
    {
      __memcpy_chk();
      if (v3)
        *v3 = 0;
      if (v1)
        *v1 = 0;
      return 0;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_fv_stash_kek()
{
  return aks_fv_set_protection();
}

uint64_t aks_fv_stash_kek_with_secret(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = 8;
  if (a1)
    v1 = 12;
  v4 = v1;
  v2 = aks_fv_set_protection();
  syslog(6, "aks_fv_prot_cmd_stash_kek(%llu) = %d", v4, v2);
  return v2;
}

uint64_t aks_fv_commit_stashed_kek()
{
  uint64_t v0;

  v0 = aks_fv_set_protection();
  syslog(6, "aks_fv_prot_cmd_stash_commit = %d", v0);
  return v0;
}

uint64_t aks_fv_destroy_stashed_kek()
{
  uint64_t v0;

  v0 = aks_fv_set_protection();
  syslog(6, "aks_fv_prot_cmd_stash_destroy = %d", v0);
  return v0;
}

uint64_t aks_fv_verify_user()
{
  return aks_fv_unwrap_vek_with_acm();
}

uint64_t aks_fv_delete_verifier()
{
  return aks_fv_set_protection();
}

uint64_t aks_absinthe_collection()
{
  unsigned int v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  mach_port_t aks_client_connection;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  mach_port_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int inputStructCnt[3];
  size_t __count;
  _BYTE __src[32768];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  input[1] = *MEMORY[0x24BDAC8D0];
  v7 = 3758097084;
  input[0] = v0;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  if (v4)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v14 = aks_client_connection;
      if (v6)
        v15 = v6;
      else
        v15 = &unk_20D83E577;
      aks_pack_data((char **)&inputStructCnt[1], inputStructCnt, 2, v9, v10, v11, v12, v13, (uint64_t)v15);
      v16 = IOConnectCallMethod(v14, 0x50u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if ((_DWORD)v16)
      {
        v7 = v16;
      }
      else
      {
        v17 = calloc(__count, 1uLL);
        *v4 = v17;
        if (v17)
        {
          memcpy(v17, __src, __count);
          v7 = 0;
          *v2 = (int)__count;
        }
        else
        {
          v7 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_absinthe_collection", ":", 3220, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    }
  }
  else
  {
    v7 = 3758097090;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  free(*(void **)&inputStructCnt[1]);
  return v7;
}

uint64_t aks_absinthe_generate(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  uint64_t v7;
  mach_port_t aks_client_connection;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  size_t v19;
  int v20;
  char *v21;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  input[0] = a1;
  v20 = 0;
  v7 = 3758097090;
  if (a2 && a6 && a7)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v17 = aks_client_connection;
      aks_pack_data(&v21, (unsigned int *)&v20, 2, v12, v13, v14, v15, v16, a2);
      v19 = *a7;
      v7 = IOConnectCallMethod(v17, 0x51u, input, 1u, v21, v20, 0, 0, a6, &v19);
      if (!(_DWORD)v7)
        *a7 = (int)v19;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_absinthe_generate", ":", 3253, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      v7 = 3758097084;
    }
  }
  free(v21);
  return v7;
}

uint64_t aks_drop_auxiliary_auth_by_uid(unsigned int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 0;
  input[1] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_drop_auxiliary_auth_by_uid", ":", 3280, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_drop_auxiliary_auth_by_handle(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 1;
  input[1] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_drop_auxiliary_auth_by_handle", ":", 3296, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_lower_iteration_count()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x5Cu, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_lower_iteration_count", ":", 3310, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_se_secret_drop(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x6Au, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_se_secret_drop", ":", 3326, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_get_current_sep_measurement(uint64_t a1, uint64_t a2)
{
  if (a1 && a2 && !aks_get_internal_info_for_key())
    der_dict_get_data((uint64_t)der_key_sep_measurement);
  free(0);
  return 3758097084;
}

uint64_t aks_get_internal_info()
{
  return aks_get_internal_info_for_key();
}

uint64_t aks_get_seconds_since_passcode_change(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  time_t v4;
  time_t v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = 3758097084;
  v8 = 0;
  v9 = 0;
  v7 = 0;
  if (!aks_get_internal_info_for_key()
    && der_dict_get_number((uint64_t)der_key_passcode_change_time, (uint64_t)v9, (uint64_t)v9 + v8, (uint64_t)&v7))
  {
    if (a2)
    {
      v4 = time(0);
      v3 = 0;
      v5 = v4 - v7;
      if (v4 <= v7)
        v5 = 0;
      *a2 = v5;
    }
    else
    {
      v3 = 0;
    }
  }
  free(v9);
  return v3;
}

uint64_t aks_get_internal_state()
{
  int v0;
  char *v1;
  char *v2;
  uint64_t v3;
  mach_port_t aks_client_connection;
  uint64_t v5;
  rsize_t v6;
  rsize_t __n;
  _BYTE __s[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  input[1] = *MEMORY[0x24BDAC8D0];
  v3 = 3758097090;
  input[0] = v0;
  bzero(__s, 0x1000uLL);
  __n = 4096;
  aks_client_connection = get_aks_client_connection();
  if (!aks_client_connection)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_get_internal_state", ":", 3405, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v3 = 3758097084;
    goto LABEL_11;
  }
  if (!v2)
  {
LABEL_11:
    v6 = 4096;
    goto LABEL_9;
  }
  v5 = IOConnectCallMethod(aks_client_connection, 0x8Eu, input, 1u, 0, 0, 0, 0, __s, &__n);
  v6 = __n;
  if ((_DWORD)v5)
  {
    v3 = v5;
  }
  else if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
  {
    if (decode_extended_state((uint64_t)__s, __n, v2))
      v3 = 3758097090;
    else
      v3 = 0;
    v6 = __n;
  }
LABEL_9:
  memset_s(__s, v6, 0, v6);
  return v3;
}

uint64_t aks_fairplay_wrap(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t result;
  mach_port_t aks_client_connection;
  size_t v10;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = 266;
  result = 3758097090;
  if (a3 && a4)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v10 = *a4;
      result = IOConnectCallMethod(aks_client_connection, 0x68u, input, 1u, a1, a2, 0, 0, a3, &v10);
      if (!(_DWORD)result)
        *a4 = (int)v10;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_fairplay_wrap", ":", 3431, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      return 3758097084;
    }
  }
  return result;
}

uint64_t _fairplay_generate_csk_internal(unsigned int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t result;
  mach_port_t aks_client_connection;
  size_t v11;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = ((unint64_t)a1 << 8) | 1;
  result = 3758097090;
  if (a4 && a5)
  {
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v11 = *a5;
      result = IOConnectCallMethod(aks_client_connection, 0x68u, input, 1u, a2, a3, 0, 0, a4, &v11);
      if (!(_DWORD)result)
        *a5 = (int)v11;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "_fairplay_generate_csk_internal", ":", 3455, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
      return 3758097084;
    }
  }
  return result;
}

uint64_t aks_fairplay_generate_csk(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return _fairplay_generate_csk_internal(0, a1, a2, a3, a4);
}

uint64_t aks_fairplay_generate_csk_v1(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return _fairplay_generate_csk_internal(1u, a1, a2, a3, a4);
}

uint64_t aks_bak_get_beacon_internal()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  size_t v5;
  size_t v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  size_t v15;
  uint64_t input[2];
  _BYTE __s[16384];
  __int128 v18;
  _BYTE v19[28];
  uint64_t v20;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v20 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  memset(v19, 0, sizeof(v19));
  bzero(__s, 0x4000uLL);
  v15 = 0x4000;
  input[0] = 1;
  input[1] = v9;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v11 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, v8, v6, 0, 0, __s, &v15);
    if ((_DWORD)v11)
    {
      v13 = v11;
    }
    else
    {
      __memcpy_chk();
      *v2 = 44;
      v12 = calloc(0x2CuLL, 1uLL);
      *v4 = v12;
      if (v12)
      {
        __memcpy_chk();
        v13 = 0;
      }
      else
      {
        v13 = 3758097085;
      }
    }
  }
  else
  {
    v13 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_bak_get_beacon_internal", ":", 3491, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v13;
}

uint64_t aks_bak_get_beacon()
{
  uint64_t beacon_internal;

  beacon_internal = aks_bak_get_beacon_internal();
  if ((_DWORD)beacon_internal)
    return beacon_internal;
  else
    return 3758604312;
}

uint64_t aks_bak_get_swizzler_internal()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  mach_port_t aks_client_connection;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  size_t v24;
  _BYTE __s[16384];
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  uint64_t input[3];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 2;
  input[1] = v0;
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  memset(v26, 0, sizeof(v26));
  bzero(__s, 0x4000uLL);
  v24 = 0x4000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v10 = IOConnectCallMethod(aks_client_connection, 0x87u, input, 2u, 0, 0, 0, 0, __s, &v24);
    if ((_DWORD)v10)
    {
      v11 = v10;
    }
    else
    {
      v11 = 3758097085;
      __memcpy_chk();
      v12 = calloc(0x28uLL, 1uLL);
      *v8 = v12;
      if (v12)
      {
        *v6 = 40;
        v13 = *(_OWORD *)&v26[1];
        v14 = *(_OWORD *)&v26[3];
        v12[4] = v26[5];
        *(_OWORD *)v12 = v13;
        *((_OWORD *)v12 + 1) = v14;
        v15 = calloc(0x91uLL, 1uLL);
        *v4 = v15;
        if (v15)
        {
          v11 = 0;
          *v2 = 145;
          v16 = v28;
          *v15 = v27;
          v15[1] = v16;
          v17 = v29;
          v18 = v30;
          v19 = v32;
          v15[4] = v31;
          v15[5] = v19;
          v15[2] = v17;
          v15[3] = v18;
          v20 = v33;
          v21 = v34;
          v22 = v35;
          *((_BYTE *)v15 + 144) = v36;
          v15[7] = v21;
          v15[8] = v22;
          v15[6] = v20;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_bak_get_swizzler_internal", ":", 3551, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v11 = 3758097084;
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  memset_s(v26, 0xC4uLL, 0, 0xC4uLL);
  return v11;
}

uint64_t aks_bak_get_swizzler()
{
  return aks_bak_get_swizzler_internal();
}

uint64_t aks_test_stashed_kek(uint64_t a1)
{
  mach_port_t akstest_client_connection;

  akstest_client_connection = get_akstest_client_connection();
  if (akstest_client_connection)
    return IOConnectCallMethod(akstest_client_connection, 0xCu, 0, 0, *(const void **)a1, *(_QWORD *)(a1 + 8), 0, 0, 0, 0);
  else
    return 3758097084;
}

uint64_t aks_get_dsme_key()
{
  uint64_t v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  mach_port_t aks_client_connection;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  size_t v8;
  size_t __count;
  _BYTE __src[16384];
  uint64_t v12;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = (_QWORD *)v0;
  v12 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x4000uLL);
  __count = 0x4000;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v5 = 3758097090;
    if (v3 && v2)
    {
      v6 = IOConnectCallMethod(aks_client_connection, 0x96u, 0, 0, 0, 0, 0, 0, __src, &__count);
      if ((_DWORD)v6)
      {
        v5 = v6;
      }
      else
      {
        v7 = calloc(__count, 1uLL);
        *v3 = v7;
        if (v7)
        {
          v8 = __count;
          *v2 = __count;
          memcpy(v7, __src, v8);
          v5 = 0;
        }
        else
        {
          v5 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_get_dsme_key", ":", 3600, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v5 = 3758097084;
  }
  memset_s(__src, 0x4000uLL, 0, 0x4000uLL);
  return v5;
}

BOOL aks_bag_in_xart(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 32;
}

uint64_t aks_prewarm_sps()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x73u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_prewarm_sps", ":", 3627, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_sealed_hashes_set(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  mach_port_t aks_client_connection;
  mach_port_t v6;
  size_t v7;
  uint64_t v8;
  char *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = 4294967285;
  if (a3 && a4 <= 0x30)
  {
    v4 = 3758097084;
    aks_client_connection = get_aks_client_connection();
    if (aks_client_connection)
    {
      v6 = aks_client_connection;
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_uint64();
      ccder_sizeof_raw_octet_string();
      v7 = ccder_sizeof();
      MEMORY[0x24BDAC7A8]();
      v9 = (char *)v11 - v8;
      bzero((char *)v11 - v8, v7);
      ccder_encode_raw_octet_string();
      ccder_encode_uint64();
      ccder_encode_raw_octet_string();
      if ((char *)ccder_encode_constructed_tl() == v9)
        return IOConnectCallMethod(v6, 0x72u, 0, 0, v9, v7, 0, 0, 0, 0);
      else
        return 3758097090;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_sealed_hashes_set", ":", 3644, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    }
  }
  return v4;
}

uint64_t aks_measure_and_seal_cryptex_manifest(const void *a1, size_t a2)
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x90u, 0, 0, a1, a2, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_measure_and_seal_cryptex_manifest", ":", 3674, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_seal_cryptex_manifest_lock()
{
  mach_port_t aks_client_connection;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x95u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_seal_cryptex_manifest_lock", ":", 3688, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_lkgp_recover(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t aks_client_connection;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x85u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_lkgp_recover", ":", 3704, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_memento_efface_blob(int a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x8Au, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_memento_efface_blob", ":", 3720, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_memento_get_state()
{
  int v0;
  _BYTE *v1;
  _BYTE *v2;
  mach_port_t aks_client_connection;
  uint64_t v4;
  rsize_t v5;
  uint64_t v6;
  rsize_t __n;
  _BYTE __s[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  bzero(__s, 0x1000uLL);
  __n = 4096;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v4 = IOConnectCallMethod(aks_client_connection, 0x8Bu, input, 1u, 0, 0, 0, 0, __s, &__n);
    v5 = __n;
    if ((_DWORD)v4)
    {
      v6 = v4;
    }
    else
    {
      v6 = 3758097090;
      if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
      {
        if (decode_memento_state((uint64_t)__s, __n, v2))
          v6 = 3758097090;
        else
          v6 = 0;
        v5 = __n;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_memento_get_state", ":", 3738, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v6 = 3758097084;
    v5 = 4096;
  }
  memset_s(__s, v5, 0, v5);
  return v6;
}

uint64_t aks_set_jcop_supports_updated_kud_policy()
{
  mach_port_t aks_client_connection;
  uint64_t input;

  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x89u, &input, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_set_jcop_supports_updated_kud_policy", ":", 3758, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_set_cx_window(uint64_t a1)
{
  mach_port_t aks_client_connection;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
    return IOConnectCallMethod(aks_client_connection, 0x97u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_set_cx_window", ":", 3774, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 3758097084;
}

uint64_t aks_get_cx_window()
{
  uint64_t v0;
  _QWORD *v1;
  mach_port_t aks_client_connection;
  mach_port_t v3;
  uint64_t result;
  size_t v5;
  _QWORD outputStruct[513];

  v0 = MEMORY[0x24BDAC7A8]();
  outputStruct[512] = *MEMORY[0x24BDAC8D0];
  v5 = 4096;
  if (!v0)
    return 4294967285;
  v1 = (_QWORD *)v0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v3 = aks_client_connection;
    bzero(outputStruct, 0x1000uLL);
    result = IOConnectCallMethod(v3, 0x98u, 0, 0, 0, 0, 0, 0, outputStruct, &v5);
    if (!(_DWORD)result)
    {
      if (v5 == 8)
      {
        result = 0;
        *v1 = outputStruct[0];
      }
      else
      {
        return 3758604298;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "aks_get_cx_window", ":", 3791, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 3758097084;
  }
  return result;
}

uint64_t get_aks_log_pid()
{
  return 0;
}

uint64_t compress_uuid()
{
  ccsha256_di();
  ccdigest();
  return 0;
}

unint64_t time_seconds_to_abs_interval(unsigned int a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return 1000000000 * info.denom * (unint64_t)a1 / info.numer;
}

unint64_t time_absolute_to_nanoseconds(uint64_t a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

uint64_t get_usec_time()
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t get_clock_time()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec;
}

uint64_t ipc_seconds_to_microsecond_interval(uint64_t a1)
{
  return 1000000 * a1;
}

unint64_t ipc_microseconds_to_seconds(uint64_t a1)
{
  return (a1 + 999999) / 0xF4240uLL;
}

_QWORD *circular_queue_init(unsigned int a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;
  size_t v7;
  void *v8;

  v2 = a1 + 1;
  v3 = v2 << 31 >> 31;
  if (v3 != v2 || v3 < 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s overflow%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "circular_queue_init", ":", 341, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    return 0;
  }
  else
  {
    v5 = calloc(0x20uLL, 1uLL);
    v6 = v5;
    if (v5)
    {
      v5[1] = 0;
      v7 = (v3 & 0x1FFFFFFFFLL) * a2;
      *(_DWORD *)v5 = a2;
      *((_DWORD *)v5 + 1) = v2;
      v8 = calloc(v7, 1uLL);
      v6[2] = v7;
      v6[3] = v8;
    }
  }
  return v6;
}

uint64_t circular_queue_size(_DWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  v3 = a1[2];
  v2 = a1[3];
  result = v2 - v3;
  if (v2 < v3)
    return (result + a1[1]);
  return result;
}

uint64_t circular_queue_enqueue(unsigned int *a1, const void *a2)
{
  unsigned int v3;
  unsigned int v4;

  v3 = a1[3];
  v4 = (v3 + 1) % a1[1];
  memcpy((void *)(*((_QWORD *)a1 + 3) + *a1 * v3), a2, *a1);
  a1[3] = v4;
  if (v4 == a1[2])
    a1[2] = (v4 + 1) % a1[1];
  return 0;
}

uint64_t circular_queue_dequeue(unsigned int *a1, void *__dst)
{
  unsigned int v2;
  uint64_t result;

  v2 = a1[2];
  if (v2 == a1[3])
    return 0xFFFFFFFFLL;
  if (__dst)
  {
    memcpy(__dst, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1);
    v2 = a1[2];
  }
  memset_s((void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1, 0, *a1);
  result = 0;
  a1[2] = (a1[2] + 1) % a1[1];
  return result;
}

uint64_t circular_queue_peek(unsigned int *a1, void *__dst)
{
  unsigned int v2;

  v2 = a1[2];
  if (v2 == a1[3])
    return 0xFFFFFFFFLL;
  memcpy(__dst, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1);
  return 0;
}

uint64_t circular_queue_dequeue_all(int *a1, _QWORD *a2, unsigned int *a3)
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  const void *v14;
  size_t v15;
  uint64_t result;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v7 = a1[2];
  v6 = a1[3];
  v8 = v6 - v7;
  if (v6 < v7)
    v8 += a1[1];
  if (!v8)
    return 0;
  v9 = *a1 * v8;
  v10 = (char *)calloc(v9, 1uLL);
  if (!v10)
    return 0xFFFFFFFFLL;
  v11 = v10;
  v12 = a1[2];
  v13 = a1[3];
  if (v13 <= v12)
  {
    if (v12 <= v13)
      goto LABEL_13;
    v17 = a1[1] - v12;
    memcpy(v10, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v12), *a1 * v17);
    if (v8 <= v17)
      goto LABEL_13;
    v10 = &v11[*a1 * v17];
    v14 = (const void *)*((_QWORD *)a1 + 3);
    v15 = *a1 * (v8 - v17);
  }
  else
  {
    v14 = (const void *)(*((_QWORD *)a1 + 3) + *a1 * v12);
    v15 = *a1 * v8;
  }
  memcpy(v10, v14, v15);
LABEL_13:
  v18 = a1[1];
  v19 = *a1;
  a1[2] = (a1[2] + v8) % v18;
  memset_s(*((void **)a1 + 3), v19 * v18, 0, v19 * v18);
  result = 0;
  *a2 = v11;
  *a3 = v9;
  return result;
}

uint64_t circular_queue_clear(uint64_t a1)
{
  rsize_t v1;

  *(_QWORD *)(a1 + 8) = 0;
  v1 = (*(_DWORD *)a1 * *(_DWORD *)(a1 + 4));
  return memset_s(*(void **)(a1 + 24), v1, 0, v1);
}

void circular_queue_free(void *a1)
{
  rsize_t v2;

  *((_QWORD *)a1 + 1) = 0;
  v2 = (*(_DWORD *)a1 * *((_DWORD *)a1 + 1));
  memset_s(*((void **)a1 + 3), v2, 0, v2);
  memset_s(*((void **)a1 + 3), *((_QWORD *)a1 + 2), 0, *((_QWORD *)a1 + 2));
  free(*((void **)a1 + 3));
  memset_s(a1, 0x20uLL, 0, 0x20uLL);
  free(a1);
}

uint64_t class_gen_get(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

BOOL persona_uuid_is_valid(uint8x16_t *a1)
{
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;

  v1 = (int8x16_t)vmovl_high_u8(*a1);
  v2 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a1->i8);
  v3 = (int8x16_t)vmovl_u16((uint16x4_t)vorr_s8(vorr_s8(*(int8x8_t *)v2.i8, *(int8x8_t *)v1.i8), vorr_s8((int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
  return vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) != 0;
}

BOOL is_non_zero(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  v2 = 0;
  do
  {
    v3 = *a1++;
    v2 |= v3;
    --a2;
  }
  while (a2);
  return v2 != 0;
}

_DWORD *pfk_params_is_valid(_DWORD *result)
{
  if (result)
    return (_DWORD *)(*result != 0);
  return result;
}

uint64_t class_gen_set(char a1, int a2)
{
  return a1 & 0x1F | (32 * a2);
}

uint64_t class_persona_get(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t class_persona_unset(int a1)
{
  return a1 & 0xFFFFFFBF;
}

uint64_t class_persona_set(int a1)
{
  return a1 | 0x40u;
}

uint64_t keychain_key(char a1)
{
  char v1;

  v1 = a1 & 0x1F;
  if ((a1 & 0x1Fu) >= 0x14)
    v1 = -1;
  return ((a1 & 0x1Fu) < 0x14) & (0xC3FC0u >> v1);
}

uint64_t class_id_get(char a1)
{
  if ((a1 & 0x1Fu) > 0x13)
    return 0xFFFFFFFFLL;
  else
    return a1 & 0x1F;
}

uint64_t fs_class_key(char a1)
{
  unsigned int v1;

  v1 = a1 & 0x1F;
  if (v1 > 0x13)
    v1 = -1;
  return (v1 < 0x12) & (0x2E03Eu >> v1);
}

uint64_t keystore_type(char a1)
{
  return a1 & 0xF;
}

BOOL store_type_equal(int a1, int a2)
{
  return ((a2 ^ a1) & 0xF) == 0;
}

uint64_t memcmp_c()
{
  return cc_cmp_safe();
}

uint64_t dump_bytes_internal(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  const char *v4;
  FILE **v5;
  unint64_t v6;
  FILE **v7;
  uint64_t v8;
  unsigned __int8 *v9;
  char *v10;
  uint64_t v11;
  int v12;
  unint64_t v15;
  char __str[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  uint64_t v25;

  v3 = a3;
  v4 = a1;
  v25 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)__str = 0u;
  v17 = 0u;
  v5 = (FILE **)MEMORY[0x24BDAC8E8];
  if (a3 >= 0x41)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "dump_bytes_internal", ":", 786, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, a1, a3, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
    v4 = (const char *)&unk_20D83E577;
  }
  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }
  v6 = 0;
  v15 = v3;
  do
  {
    v7 = v5;
    if (v3 - v6 >= 0x40)
      v8 = 64;
    else
      v8 = v3 - v6;
    if (v8)
    {
      v9 = (unsigned __int8 *)(a2 + v6);
      v10 = __str;
      v11 = v8;
      do
      {
        v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }
      while (v11);
    }
    v5 = v7;
    fprintf(*v7, "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "dump_bytes_internal", ":", 796, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, v4, (const char *)&unk_20D83E577, v6, v8 + v6, (const char *)&unk_20D83E577, __str,
      (const char *)&unk_20D83E577,
      (const char *)&unk_20D83E577);
    v6 += v8;
    v3 = v15;
  }
  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

_BYTE *bytes_to_str_hint(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v2;
  char *v4;
  uint64_t v5;
  int v6;

  if (a2 >= 0x10)
    v2 = 16;
  else
    v2 = a2;
  if (v2)
  {
    v4 = bytes_to_str_hint_buf;
    v5 = v2;
    do
    {
      v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }
    while (v5);
  }
  bytes_to_str_hint_buf[2 * v2] = 0;
  return bytes_to_str_hint_buf;
}

uint64_t get_kcv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _OWORD __s[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  if (a4 == 3)
  {
    ccsha256_di();
    cchmac();
    v5 = 0;
    *(_WORD *)a3 = __s[0];
    *(_BYTE *)(a3 + 2) = BYTE2(__s[0]);
  }
  else
  {
    v5 = 0xFFFFFFFFLL;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v5;
}

uint64_t print_kcv(const char *a1, uint64_t a2, uint64_t a3)
{
  __int16 v5;
  char v6;

  v6 = 0;
  v5 = 0;
  get_kcv(a2, a3, (uint64_t)&v5, 3);
  return dump_bytes_internal(a1, (uint64_t)&v5, 3uLL);
}

char *byte_swap_val(char *result, unint64_t a2)
{
  unint64_t v2;
  char *v3;
  char v4;

  if (a2 >= 2)
  {
    v2 = a2 >> 1;
    v3 = &result[a2 - 1];
    do
    {
      v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t ascii_hex_to_bytes(unsigned __int8 *a1, unint64_t a2, _QWORD *a3, unint64_t *a4)
{
  uint64_t v5;
  unsigned __int8 *v6;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  char v17;
  char v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  char v22;
  char v23;

  v5 = 0xFFFFFFFFLL;
  if ((a2 & 1) == 0)
  {
    v6 = a1;
    if (a1)
    {
      if (a3 && a4)
      {
        v9 = a2 >> 1;
        v10 = calloc(a2 >> 1, 1uLL);
        if (v10)
        {
          if (a2 >= 2)
          {
            if (v9 <= 1)
              v11 = 1;
            else
              v11 = a2 >> 1;
            v12 = v10;
            do
            {
              v13 = *v6;
              v14 = v13 - 48;
              v15 = v13 - 97;
              if ((v13 - 65) >= 6)
                v16 = -1;
              else
                v16 = v13 - 55;
              v17 = v13 - 87;
              if (v15 > 5)
                v17 = v16;
              if (v14 < 0xA)
                v17 = v14;
              v18 = 16 * v17;
              v19 = v6[1];
              v20 = v19 - 48;
              v21 = v19 - 97;
              if ((v19 - 65) >= 6)
                v22 = -1;
              else
                v22 = v19 - 55;
              v23 = v19 - 87;
              if (v21 > 5)
                v23 = v22;
              if (v20 < 0xA)
                v23 = v20;
              *v12++ = v23 | v18;
              v6 += 2;
              --v11;
            }
            while (v11);
          }
          v5 = 0;
          *a3 = v10;
          *a4 = v9;
        }
        else
        {
          return 4294967279;
        }
      }
    }
  }
  return v5;
}

uint64_t err_sks_to_aks(uint64_t result)
{
  if ((_DWORD)result == 0 || result >= 0xFFFFFFDA)
    return dword_20D831E30[(int)result + 38];
  return result;
}

uint64_t fv_init_cred_from_secret(_QWORD *a1, uint64_t a2, char a3)
{
  uint64_t result;
  size_t v7;
  void *v8;
  const void *v9;

  memset_s(a1, 0x10uLL, 0, 0x10uLL);
  if ((a3 & 1) != 0)
    return 4294967285;
  if (a2 && *(_QWORD *)a2 && (v7 = *(_QWORD *)(a2 + 8)) != 0)
  {
    v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      v9 = *(const void **)a2;
      a1[1] = *(_QWORD *)(a2 + 8);
      memcpy(v8, v9, *(_QWORD *)(a2 + 8));
      return 0;
    }
    else
    {
      return 4294967279;
    }
  }
  else
  {
    result = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t REQUIRE_func(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "REQUIRE_func", ":", 1047, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, a3, a2, (const char *)&unk_20D83E577);
    abort();
  }
  return result;
}

uint64_t generate_wrapping_key_curve25519(__int128 *a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  int __s;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  platform_read_random((uint64_t)v14, 0x20u);
  cccurve25519_make_pub();
  v8 = 0u;
  v9 = 0u;
  __s = 0x1000000;
  v4 = a2[1];
  v10 = *a2;
  v11 = v4;
  v5 = a1[1];
  v12 = *a1;
  v13 = v5;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  memset_s(v14, 0x20uLL, 0, 0x20uLL);
  return 0;
}

uint64_t wrap_data(int *a1, uint64_t (*a2)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), char a3, uint64_t *a4, unsigned int a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v8;
  int v14;
  unsigned int v15;
  _OWORD *v18;
  unsigned int v19;
  uint64_t (*v20)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t);
  uint64_t *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 *v26;
  _QWORD *v27;
  int v29;
  unsigned int v30;
  _OWORD __s[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  memset(__s, 0, sizeof(__s));
  v8 = 0xFFFFFFFFLL;
  if (!a6 || !a7)
    goto LABEL_40;
  if (!a1)
  {
LABEL_14:
    if (a2)
    {
      if (rfc3394_wrapped_size_legacy(a5, &v30))
      {
        if (*a7 < v30)
          goto LABEL_40;
        v18 = 0;
        v19 = 0;
        v20 = a2;
        v21 = a4;
        goto LABEL_38;
      }
    }
    else
    {
      if ((a3 & 4) != 0)
      {
        if ((a5 & 0xF) != 0 || *a7 < a5)
          goto LABEL_40;
        v30 = a5;
        ccaes_cbc_encrypt_mode();
        firebloom_cbc_one_shot_f();
LABEL_39:
        v8 = 0;
        *a7 = v30;
        goto LABEL_40;
      }
      if (rfc3394_wrapped_size_legacy(a5, &v30))
      {
        if (*a7 < v30)
          goto LABEL_40;
        if ((a3 & 8) != 0)
        {
          ccsha256_di();
          cchkdf();
          v18 = __s;
        }
        else
        {
          v18 = a1 + 2;
        }
        v19 = 32;
        v20 = 0;
        v21 = a4;
LABEL_38:
        if (rfc3394_wrap_legacy((uint64_t)v18, v19, 0xA6A6A6A6A6A6A6A6, v20, v21, a5, (_QWORD *)a6, &v30))goto LABEL_40;
        goto LABEL_39;
      }
    }
    v8 = 4294967285;
    if ((a3 & 8) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
  v14 = *a1;
  if ((*a1 - 1) >= 2)
  {
    if (v14)
      goto LABEL_40;
    goto LABEL_14;
  }
  if ((a3 & 4) != 0)
    v15 = 64;
  else
    v15 = 72;
  v30 = v15;
  if (!a2 && a5 == 32 && *a7 >= v15)
  {
    if (v14 == 1)
    {
      generate_wrapping_key_curve25519((__int128 *)(a1 + 9), &v32);
    }
    else
    {
      v23 = *(_OWORD *)(a1 + 5);
      v32 = *(_OWORD *)(a1 + 1);
      v33 = v23;
      v24 = *(_OWORD *)(a1 + 13);
      v34 = *(_OWORD *)(a1 + 9);
      v35 = v24;
    }
    if ((a3 & 0x80) == 0)
    {
      v25 = v33;
      *(_OWORD *)a6 = v32;
      *(_OWORD *)(a6 + 16) = v25;
      if ((a3 & 4) != 0)
      {
        ccaes_cbc_encrypt_mode();
        firebloom_cbc_one_shot_f();
        goto LABEL_34;
      }
      v29 = 40;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        v27 = (_QWORD *)(a6 + 32);
        v26 = __s;
      }
      else
      {
        v26 = &v34;
        v27 = (_QWORD *)(a6 + 32);
      }
      if (!rfc3394_wrap_legacy((uint64_t)v26, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, a4, 0x20u, v27, &v29))
      {
LABEL_34:
        v8 = 0;
        *a7 = v15;
        if ((a3 & 8) == 0)
          goto LABEL_42;
        goto LABEL_41;
      }
    }
  }
LABEL_40:
  if ((a3 & 8) != 0)
LABEL_41:
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_42:
  memset_s(&v32, 0x40uLL, 0, 0x40uLL);
  return v8;
}

uint64_t generate_unwrap_shared_key_curve25519(__int128 *a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  int __s;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v7 = 0u;
  v3 = a1[1];
  v9 = *a1;
  v10 = v3;
  v4 = a3[1];
  v11 = *a3;
  __s = 0x1000000;
  v12 = v4;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  return 0;
}

uint64_t unwrap_data(uint64_t a1, uint64_t (*a2)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), char a3, _QWORD *a4, unsigned int a5, _QWORD *a6, unsigned int *a7)
{
  uint64_t v8;
  _OWORD *v15;
  unsigned int v16;
  uint64_t (*v17)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t);
  _QWORD *v18;
  _OWORD *v19;
  int v21;
  unsigned int v22;
  _OWORD __s[2];
  _OWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  memset(v24, 0, sizeof(v24));
  v8 = 0xFFFFFFFFLL;
  if (a4 && a5)
  {
    if (!a1)
      goto LABEL_6;
    if (*(_DWORD *)a1 != 1)
    {
      if (!*(_DWORD *)a1)
      {
LABEL_6:
        if (a5 <= 0x28)
        {
          if (a2)
          {
            if (rfc3394_unwrapped_size_legacy(a5, &v22) && *a7 >= v22)
            {
              v15 = 0;
              v16 = 0;
              v17 = a2;
              goto LABEL_30;
            }
          }
          else if ((a3 & 4) != 0)
          {
            if ((a5 & 0xF) == 0 && *a7 >= a5)
            {
              v22 = a5;
              ccaes_cbc_decrypt_mode();
              firebloom_cbc_one_shot_f();
LABEL_31:
              v8 = 0;
              *a7 = v22;
              goto LABEL_35;
            }
          }
          else if (rfc3394_unwrapped_size_legacy(a5, &v22) && *a7 >= v22)
          {
            if ((a3 & 8) != 0)
            {
              ccsha256_di();
              cchkdf();
              v15 = v24;
            }
            else
            {
              v15 = (_OWORD *)(a1 + 8);
            }
            v16 = 32;
            v17 = 0;
LABEL_30:
            if (!rfc3394_unwrap_legacy((uint64_t)v15, v16, 0xA6A6A6A6A6A6A6A6, v17, a4, a5, a6, &v22))
              goto LABEL_31;
            goto LABEL_40;
          }
        }
LABEL_38:
        v8 = 4294967285;
        goto LABEL_35;
      }
LABEL_22:
      v8 = 0xFFFFFFFFLL;
      goto LABEL_35;
    }
    v22 = 32;
    if (*a7 < 0x20)
      goto LABEL_38;
    memset(__s, 0, sizeof(__s));
    if ((a3 & 4) != 0)
    {
      if (a5 != 64)
        goto LABEL_38;
      generate_unwrap_shared_key_curve25519((__int128 *)a4, a1 + 4, (__int128 *)(a1 + 36));
      ccaes_cbc_decrypt_mode();
      firebloom_cbc_one_shot_f();
    }
    else
    {
      if (a5 != 72)
        goto LABEL_38;
      generate_unwrap_shared_key_curve25519((__int128 *)a4, a1 + 4, (__int128 *)(a1 + 36));
      if (a3 < 0)
        goto LABEL_22;
      v21 = 32;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        v18 = a4 + 4;
        v19 = v24;
      }
      else
      {
        v18 = a4 + 4;
        v19 = __s;
      }
      if (rfc3394_unwrap_legacy((uint64_t)v19, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, v18, 0x28u, a6, &v21))
      {
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_40:
        v8 = 4294967277;
        goto LABEL_35;
      }
    }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    v8 = 0;
    *a7 = 32;
  }
LABEL_35:
  if ((a3 & 8) != 0)
    memset_s(v24, 0x20uLL, 0, 0x20uLL);
  return v8;
}

uint64_t firebloom_export_pub_key(uint64_t a1, _QWORD *a2, size_t *a3)
{
  size_t v5;
  void *v6;
  void *v7;
  uint64_t result;

  v5 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  v6 = calloc(v5, 1uLL);
  if (!v6)
    return 4294967279;
  v7 = v6;
  ccec_export_pub();
  result = 0;
  *a2 = v7;
  *a3 = v5;
  return result;
}

unint64_t firebloom_cp_prime_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

unint64_t firebloom_sign_max_size()
{
  return (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
}

unint64_t firebloom_ec_export_pub_size()
{
  return ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
}

unint64_t firebloom_ec_compact_export_pub_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

uint64_t firebloom_cbc_one_shot_f()
{
  return cccbc_one_shot();
}

uint64_t firebloom_ecb_one_shot_f()
{
  return ccecb_one_shot();
}

uint64_t firebloom_cbc_update_f()
{
  return cccbc_update();
}

BOOL firebloom_ec_import()
{
  return !ccec_import_pub() && ccn_read_uint() == 0;
}

uint64_t firebloom_ec_export()
{
  ccn_write_uint_padded();
  return 1;
}

uint64_t dict_find_params_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  char v12;
  char v13;
  _QWORD *v14;

  if (*(_QWORD *)(a5 + 8) >= *(_QWORD *)a5)
  {
    v13 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = der_equal(*(const void **)(*(_QWORD *)(a5 + 24) + v9), *(_QWORD *)(*(_QWORD *)(a5 + 24) + v9)+ *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a5 + 24) + v9) + 1)+ 2, a1);
      if (v11)
        break;
      ++v10;
      v9 += 40;
      if (v10 >= *(_QWORD *)a5)
        goto LABEL_10;
    }
    v14 = (_QWORD *)(*(_QWORD *)(a5 + 24) + v9);
    if (v14[1])
    {
      v12 = 0;
      *(_BYTE *)(a5 + 16) = 1;
    }
    else
    {
      ++*(_QWORD *)(a5 + 8);
      v14[1] = a3;
      v14[2] = a3 + a4;
      v14[3] = a3;
      v14[4] = a3 + a4;
      v12 = 1;
    }
LABEL_10:
    v13 = v12 | !v11;
  }
  return v13 & 1;
}

BOOL der_key_equal(unsigned __int8 *a1, const void *a2)
{
  return der_equal(a1, (uint64_t)&a1[a1[1] + 2], a2);
}

BOOL der_equal(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5;

  v5 = der_get_sizeof((uint64_t)a1);
  return v5 == der_get_sizeof((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t der_get_sizeof(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len())
    return a1 - a1;
  else
    return 0;
}

uint64_t der_dict_iterate()
{
  uint64_t result;

  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t der_dict_find_value(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (a1)
  {
    der_dict_iterate();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL _dict_find_value_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v8;

  v8 = der_equal(*(const void **)a5, *(_QWORD *)a5 + *(unsigned __int8 *)(*(_QWORD *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(_QWORD *)(a5 + 8) = a3;
    *(_QWORD *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t der_dict_get_number(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
    return 0;
  if (result)
  {
    der_dict_iterate();
    return 0;
  }
  return result;
}

uint64_t der_get_number()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t der_dict_get_data(uint64_t result)
{
  if (result)
  {
    der_dict_iterate();
    return 0;
  }
  return result;
}

double der_utils_decode_implicit_raw_octet_string(__int128 *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  double result;
  __int128 v8;

  v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t der_array_iterate(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, _QWORD, uint64_t), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  *(_QWORD *)&v12 = a1;
  *((_QWORD *)&v12 + 1) = a2;
  v6 = ccder_blob_decode_range();
  if ((_DWORD)v6)
  {
    v11 = 0;
    v7 = v12;
    if (der_utils_decode_tl(&v12, &v10, &v11))
    {
      do
      {
        v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4))
          break;
        *(_QWORD *)&v12 = v8;
        v7 = v8;
      }
      while ((der_utils_decode_tl(&v12, &v10, &v11) & 1) != 0);
    }
  }
  return v6;
}

uint64_t der_utils_decode_tl(__int128 *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  __int128 v7;

  v7 = *a1;
  result = ccder_blob_decode_tag();
  if ((_DWORD)result)
  {
    result = ccder_blob_decode_len();
    if ((_DWORD)result)
    {
      *a1 = v7;
      *a2 = 0;
      *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t der_get_BOOL()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t encode_list_free(void **a1)
{
  void *v2;
  void *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v2 = *a1;
    if (!*a1)
      break;
    v3 = (void *)*((_QWORD *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((_QWORD *)v2 + 2), 0, *((_QWORD *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t encode_list_remove_key(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD **v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *i;
  void *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (_QWORD **)a1;
  result = (uint64_t)_encode_list_find_key(a1, a2);
  if (result)
  {
    v4 = result;
    for (i = *v2; i != (_QWORD *)result; i = (_QWORD *)*i)
      v2 = (_QWORD **)i;
    *v2 = *(_QWORD **)result;
    v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(_QWORD *)(v4 + 16), 0, *(_QWORD *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

_QWORD *_encode_list_find_key(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  const void *v5;

  if (!a1)
    return 0;
  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && der_equal(a2, (uint64_t)&a2[a2[1] + 2], v5))
        break;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t encode_list_get_data(_QWORD *a1, unsigned __int8 *a2, int a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *key;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;

  key = _encode_list_find_key(a1, a2);
  if (!key)
    return 0;
  v9 = 1;
  if (a4)
  {
    if (a5)
    {
      v10 = key[1] + key[2];
      *(_QWORD *)&v15 = key[1];
      *((_QWORD *)&v15 + 1) = v10;
      v9 = ccder_blob_decode_sequence_tl();
      if ((_DWORD)v9)
      {
        if (der_utils_decode_implicit_raw_octet_string_copy(&v15, 12, 0, 0))
        {
          v11 = v15;
          if (ccder_blob_decode_tag())
          {
            if (ccder_blob_decode_len())
            {
              v13 = 0;
              v12 = v15;
              if (a3)
              {
                v13 = (v15 - v11);
                v12 = v11;
              }
              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }
  return v9;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy(__int128 *a1, uint64_t a2, uint64_t a3, int a4)
{
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4)
    return 0;
  *a1 = v8;
  return 1;
}

uint64_t encode_list_cstr_get_data(_QWORD *a1, char *__s, void *a3, size_t a4)
{
  unsigned __int8 *v7;
  uint64_t result;
  void *__src;
  uint64_t v10;
  _BYTE v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[31];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11[0] = 12;
  v11[1] = strlen(__s);
  v7 = (unsigned __int8 *)der_key_validate((uint64_t)v11);
  result = 0xFFFFFFFFLL;
  if (a3 && v7)
  {
    __memcpy_chk();
    __src = 0;
    v10 = 0;
    if (encode_list_get_data(a1, v7, 0, &__src, &v10))
    {
      if (v10 == a4)
      {
        memcpy(a3, __src, a4);
        return 0;
      }
      else
      {
        return 4294967277;
      }
    }
    else
    {
      return 4294967293;
    }
  }
  return result;
}

uint64_t der_key_validate(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", &unk_20D83E577, &unk_20D83E577, &unk_20D83E577, "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t encode_list_get_number(_QWORD *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t data;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  data = encode_list_get_data(a1, a2, 1, &v7, &v8);
  v5 = data;
  if (a3 && (_DWORD)data)
    *a3 = der_get_number();
  return v5;
}

uint64_t encode_list_get_BOOL(_QWORD *a1, unsigned __int8 *a2, _BYTE *a3)
{
  uint64_t data;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  data = encode_list_get_data(a1, a2, 1, &v7, &v8);
  v5 = data;
  if (a3 && (_DWORD)data)
    *a3 = der_get_BOOL();
  return v5;
}

uint64_t encode_list_merge_dict(uint64_t a1)
{
  if (a1)
    return der_dict_iterate() - 1;
  else
    return 4294967285;
}

uint64_t _merge_dict_cb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned __int8 *v8;
  uint64_t v9;

  v8 = (unsigned __int8 *)der_key_validate(a1);
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (!encode_list_remove_key(a5, v8) && !encode_list_add_der(a5, v9, a3, a3 + a4))
      return 1;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577, "_merge_dict_cb", ":", 647, (const char *)&unk_20D83E577, 0, (const char *)&unk_20D83E577, (const char *)&unk_20D83E577);
  return 0;
}

uint64_t encode_list_dict(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  uint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  rsize_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _OWORD *v15;
  size_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  char *v25;
  char *v26;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v7 = (_QWORD *)*a1;
        if (*a1)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          do
          {
            v10 += v7[2];
            v7 = (_QWORD *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            v13 = v12;
            v14 = (_QWORD *)*a1;
            if (*a1)
            {
              v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                v14 = (_QWORD *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))_qsort_compare);
            v16 = ccder_sizeof();
            v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              v19 = v8 - 1;
              v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                v22 = v20 - 16;
                v23 = ccder_blob_encode_body();
                v20 = v22;
                if ((v23 & 1) == 0)
                  goto LABEL_16;
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t encode_list_add_der(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  size_t v6;
  char *v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  char *v12;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  char *v17;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (der_get_sizeof(a3) <= (unint64_t)(a4 - a3))
    {
      v6 = ccder_sizeof();
      v7 = (char *)calloc(v6, 1uLL);
      if (!v7)
        return 4294967279;
      v8 = v7;
      v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        v9 = ccder_blob_encode_body();
        v10 = v16;
        if (!v9)
          v10 = 0;
        v17 = v10;
        v11 = ccder_blob_encode_tl();
        v12 = v17;
        if (!v11)
          v12 = 0;
        if (v12 && v12 == v8)
        {
          v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            v15 = v14;
            result = 0;
            v15[1] = v8;
            v15[2] = v6;
            *v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t encode_list_add_key(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return encode_list_add_der(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t encode_list_add_data(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  size_t v5;
  char *v6;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    v5 = ccder_sizeof();
    v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      v7 = v6;
      v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_19;
      v8 = ccder_blob_encode_body();
      v9 = v15;
      if (!v8)
        v9 = 0;
      v16 = v9;
      v10 = ccder_blob_encode_tl();
      v11 = v16;
      if (!v10)
        v11 = 0;
      v12 = v11 && v11 == v7;
      if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v14 = v13;
        result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_cstr_add_data(_QWORD *a1, char *__s, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  _BYTE v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[31];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7[0] = 12;
  v7[1] = strlen(__s);
  v5 = der_key_validate((uint64_t)v7);
  result = 4294967285;
  if (a3)
  {
    if (v5)
    {
      __memcpy_chk();
      return encode_list_add_data(a1, v5, a3);
    }
  }
  return result;
}

uint64_t encode_list_add_BOOL(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  size_t v4;
  char *v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  BOOL v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  char *v15;

  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    v4 = ccder_sizeof();
    v5 = (char *)calloc(v4, 1uLL);
    if (v5)
    {
      v6 = v5;
      v14 = &v5[v4];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_18;
      v7 = ccder_blob_encode_body();
      v8 = v14;
      if (!v7)
        v8 = 0;
      v15 = v8;
      v9 = ccder_blob_encode_tl();
      v10 = v15;
      if (!v9)
        v10 = 0;
      v11 = v10 && v10 == v6;
      if (v11 && (v12 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v13 = v12;
        result = 0;
        v13[1] = v6;
        v13[2] = v4;
        *v13 = *a1;
        *a1 = v13;
      }
      else
      {
LABEL_18:
        memset_s(v6, v4, 0, v4);
        free(v6);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_number(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int v16;
  char *v17;
  int v18;
  char *v19;
  BOOL v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  char *v24;
  _QWORD v25[2];

  v3 = a3;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    v10 = 8;
  }
  else
  {
    v6 = 9;
    v7 = 48;
    v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if ((_DWORD)v5 != v9)
      {
        v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0)
      v10 = v6;
    else
      v10 = v8;
  }
  v25[0] = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    v12 = ccder_sizeof();
    v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      v14 = v13;
      v15 = v10;
      do
      {
        *((_BYTE *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl())
        goto LABEL_30;
      v16 = ccder_blob_encode_body();
      v17 = v23;
      if (!v16)
        v17 = 0;
      v24 = v17;
      v18 = ccder_blob_encode_tl();
      v19 = v24;
      if (!v18)
        v19 = 0;
      v20 = v19 && v19 == v14;
      if (v20 && (v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v22 = v21;
        result = 0;
        v22[1] = v14;
        v22[2] = v12;
        *v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_string(_QWORD *a1, uint64_t a2, char *__s)
{
  uint64_t result;
  size_t v5;
  char *v6;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    strlen(__s);
    ccder_sizeof();
    v5 = ccder_sizeof();
    v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      v7 = v6;
      v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_19;
      v8 = ccder_blob_encode_body();
      v9 = v15;
      if (!v8)
        v9 = 0;
      v16 = v9;
      v10 = ccder_blob_encode_tl();
      v11 = v16;
      if (!v10)
        v11 = 0;
      v12 = v11 && v11 == v7;
      if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v14 = v13;
        result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_list(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  size_t v5;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  char *v15;
  void *__s;
  rsize_t __n;
  char *v18;
  char *v19;

  v3 = 0;
  __s = 0;
  __n = 0;
  v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v5 = 0;
    if (a3)
    {
      if (encode_list_dict(a3, &__s, &__n))
      {
        v3 = 0;
        v5 = 0;
      }
      else
      {
        v5 = ccder_sizeof();
        v7 = (char *)calloc(v5, 1uLL);
        v3 = v7;
        if (v7)
        {
          v15 = &v7[v5];
          if (!ccder_blob_encode_body())
            goto LABEL_23;
          v18 = v3;
          v19 = v15;
          v8 = ccder_blob_encode_body();
          v9 = v19;
          if (!v8)
            v9 = 0;
          v18 = v3;
          v19 = v9;
          v10 = ccder_blob_encode_tl();
          v11 = v19;
          if (!v10)
            v11 = 0;
          v12 = v11 && v11 == v3;
          if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
          {
            v4 = 0;
            v13[1] = v3;
            v13[2] = v5;
            *v13 = *a1;
            *a1 = v13;
            v3 = 0;
          }
          else
          {
LABEL_23:
            v4 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          v4 = 4294967279;
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  if (v3)
  {
    memset_s(v3, v5, 0, v5);
    free(v3);
  }
  return v4;
}

BOOL encode_list_is_empty(_QWORD *a1)
{
  return *a1 == 0;
}

uint64_t ccder_sizeof_fv_data()
{
  return ccder_sizeof();
}

uint64_t ccder_sizeof_fv_key()
{
  uint64_t v0;

  v0 = ccder_sizeof();
  return ccder_sizeof() + v0;
}

uint64_t der_utils_encode_fv_key(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    result = ccder_blob_encode_body_tl();
    if (!(_DWORD)result)
      return result;
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else if (!ccder_blob_encode_body_tl() || (ccder_blob_encode_tl() & 1) == 0)
  {
    return 0;
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_key(__int128 *a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  int v10;
  __int128 v11;
  int *v12;
  uint64_t v13;
  __int128 v14;

  v6 = *(_QWORD *)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v7 = *(_DWORD *)(a3 + 20);
  v11 = *a1;
  if (a2)
  {
    v14 = *a1;
    v12 = 0;
    v13 = 0;
    if ((ccder_blob_decode_range() & 1) == 0)
      return 0;
    v6 = (uint64_t)v12;
    v8 = v13 - (_DWORD)v12;
    v11 = v14;
  }
  else
  {
    LODWORD(v14) = v5;
    result = der_utils_decode_implicit_raw_octet_string_copy_len(&v11, 4, v6, &v14);
    if (!(_DWORD)result)
      return result;
    v8 = v14;
  }
  v14 = v11;
  v12 = 0;
  v13 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  v11 = v14;
  if ((v13 - (_DWORD)v12) > 4)
    return 0;
  v10 = *v12;
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy_len(__int128 *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  if (a3)
  {
    if (a4)
      *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_encode_fv_data(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else
  {
    result = ccder_blob_encode_tl();
    if (!(_DWORD)result)
      return result;
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_data(__int128 *a1, int a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unsigned int v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v6 = *a3;
  v5 = a3[1];
  v9 = *a1;
  if (a2)
  {
    v12 = *a1;
    v10 = 0;
    v11 = 0;
    result = ccder_blob_decode_range();
    if (!(_DWORD)result)
      return result;
    v6 = v10;
    v8 = v11 - v10;
    v9 = v12;
  }
  else
  {
    LODWORD(v12) = v5;
    result = der_utils_decode_implicit_raw_octet_string_copy_len(&v9, 4, v6, &v12);
    if (!(_DWORD)result)
      return result;
    v8 = v12;
  }
  *a3 = v6;
  a3[1] = v8;
  *a1 = v9;
  return 1;
}

uint64_t der_utils_encode_fv_params(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else
  {
    result = ccder_blob_encode_tl();
    if (!(_DWORD)result)
      return result;
  }
  *a1 = v4;
  return 1;
}

uint64_t der_utils_decode_fv_params(__int128 *a1)
{
  __int128 v3;

  v3 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  *a1 = v3;
  return 1;
}

uint64_t encode_extended_state(unsigned int *a1, int a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v8;
  uint64_t v10;
  size_t v11;
  void *v12;

  v12 = 0;
  if (encode_list_add_number(&v12, (uint64_t)der_key_state_state, *a1)
    || encode_list_add_number(&v12, (uint64_t)der_key_state_lock_state, a1[1])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_backoff, *((_QWORD *)a1 + 1))
    || encode_list_add_number(&v12, (uint64_t)der_key_state_failed_attempts, a1[4])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_generation_state, a1[5])
    || encode_list_add_number(&v12, (uint64_t)der_key_state_recovery_countdown, *(_QWORD *)((char *)a1 + 26))|| encode_list_add_number(&v12, (uint64_t)der_key_state_more_state, *(_QWORD *)((char *)a1 + 34))|| encode_list_add_number(&v12, (uint64_t)der_key_keybag_handle, *(int *)((char *)a1 + 42))|| encode_list_add_number(&v12, (uint64_t)der_key_config_max_unlock_attempts, *(unsigned int *)((char *)a1 + 46))|| encode_list_add_data(&v12, (uint64_t)der_key_config_user_uuid, (uint64_t)a1 + 50)|| a2&& (encode_list_add_number(&v12, (uint64_t)der_key_state_assertion_set, *((char *)a1 + 66))|| encode_list_add_number(&v12, (uint64_t)der_key_state_grace_period_enabled, *((char *)a1 + 67))|| encode_list_add_number(&v12, (uint64_t)der_key_lock_time, *(_QWORD *)(a1 + 17))|| encode_list_add_number(&v12, (uint64_t)der_key_cx_window, *(_QWORD *)(a1 + 19)))|| (v10 = 0, v11 = 0, encode_list_dict(&v12, &v10, &v11)))
  {
    v8 = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
    *a3 = v10;
    *a4 = v11;
  }
  encode_list_free(&v12);
  return v8;
}

uint64_t decode_extended_state(uint64_t a1, int a2, char *__s)
{
  uint64_t result;
  uint64_t number;
  _QWORD v7[57];
  __int128 v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v7, 0x228uLL);
      v7[4] = der_key_state_lock_state;
      v7[9] = der_key_state_backoff;
      v7[14] = der_key_state_failed_attempts;
      v7[19] = der_key_state_generation_state;
      v7[24] = der_key_state_assertion_set;
      v7[29] = der_key_state_grace_period_enabled;
      v7[34] = der_key_state_recovery_countdown;
      v7[39] = der_key_state_more_state;
      v7[44] = der_key_keybag_handle;
      v7[49] = der_key_config_max_unlock_attempts;
      v7[54] = der_key_config_user_uuid;
      v9 = der_key_lock_time;
      v10 = der_key_cx_window;
      der_dict_iterate();
      *(_DWORD *)__s = der_get_number();
      *((_DWORD *)__s + 1) = der_get_number();
      *((_QWORD *)__s + 1) = der_get_number();
      *((_DWORD *)__s + 4) = der_get_number();
      *((_DWORD *)__s + 5) = der_get_number();
      *(_QWORD *)(__s + 26) = der_get_number();
      *(_QWORD *)(__s + 34) = der_get_number();
      *(_DWORD *)(__s + 42) = der_get_number();
      *(_DWORD *)(__s + 46) = der_get_number();
      der_utils_decode_implicit_raw_octet_string_copy(&v8, 4, (uint64_t)(__s + 50), 16);
      __s[66] = der_get_number();
      __s[67] = der_get_number();
      *(_QWORD *)(__s + 68) = der_get_number();
      number = der_get_number();
      result = 0;
      *(_QWORD *)(__s + 76) = number;
    }
  }
  return result;
}

uint64_t decode_memento_state(uint64_t a1, int a2, _BYTE *__s)
{
  uint64_t result;
  int number;

  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (der_dict_iterate())
    {
      *__s = der_get_number();
      *((_DWORD *)__s + 1) = der_get_number();
      *((_DWORD *)__s + 2) = der_get_number();
      number = der_get_number();
      result = 0;
      *((_DWORD *)__s + 3) = number;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t decode_primary_identity_state(uint64_t a1, int a2, void *__s, void *a4, uint64_t a5)
{
  uint64_t result;
  __int128 v10[2];
  __int128 v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    v12 = 0;
    v10[0] = 0u;
    v11 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10[1] = (unint64_t)der_key_group_uuid;
    v13 = der_key_uuid;
    der_dict_iterate();
    if (der_utils_decode_implicit_raw_octet_string_copy(v10, 4, (uint64_t)__s, 16)
      && der_utils_decode_implicit_raw_octet_string_copy((__int128 *)((char *)&v11 + 8), 4, (uint64_t)a4, 16))
    {
      return der_utils_decode_implicit_raw_octet_string_copy(&v15, 4, a5, 16) - 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t decode_fv_blob_state(uint64_t a1, uint64_t a2, _DWORD *__s)
{
  uint64_t result;
  int v6;
  int number;
  __int128 v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    v24 = 0u;
    v26 = 0;
    v27 = 0u;
    v28 = 0;
    v30 = 0u;
    v31 = 0u;
    v33 = 0;
    v34 = 0u;
    v35 = 0;
    v37 = 0u;
    v38 = 0u;
    v40 = 0;
    v41 = 0u;
    v42 = 0;
    v44 = 0u;
    v45 = 0u;
    v8 = 0u;
    v9 = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0;
    v23 = 0u;
    v10 = der_key_id;
    *(_QWORD *)&v13 = der_key_flags;
    v16 = der_key_version;
    *(_QWORD *)&v19 = der_key_state_reserved;
    v22 = der_key_state_failed_attempts;
    v25 = der_key_state_failed_attempts_other;
    v29 = der_key_config_max_unlock_attempts;
    v32 = der_key_state_backoff;
    v36 = der_key_state_backoff_other;
    v39 = der_key_config_capabilities;
    v43 = der_key_state_refcount;
    der_dict_iterate();
    *__s = der_get_number();
    if (der_utils_decode_implicit_raw_octet_string_copy((__int128 *)((char *)&v8 + 8), 4, (uint64_t)(__s + 1), 16)&& der_utils_decode_implicit_raw_octet_string_copy(&v12, 4, (uint64_t)(__s + 5), 16)&& (__s[9] = der_get_number(), __s[10] = der_get_number(), __s[11] = der_get_number(), __s[12] = der_get_number(), __s[15] = der_get_number(), __s[13] = der_get_number(), __s[14] = der_get_number(), der_utils_decode_implicit_raw_octet_string_copy_partial((__int128 *)((char *)&v20 + 8))))
    {
      v6 = __s[9];
      if ((v6 & 0x400) != 0)
      {
        *((_QWORD *)__s + 9) = der_get_number();
        v6 = __s[9];
      }
      if ((v6 & 0x800) != 0)
      {
        number = der_get_number();
        result = 0;
        __s[20] = number;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy_partial(__int128 *a1)
{
  uint64_t v2;
  __int128 v4;

  v4 = *a1;
  v2 = ccder_blob_decode_range();
  if ((v2 & 1) != 0)
    *a1 = v4;
  return v2;
}

uint64_t encode_pfk_params_public(int *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  int v7;
  uint64_t v9;
  size_t v10;
  void *v11;

  v11 = 0;
  v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1 && (v7 = *a1) != 0)
    {
      if ((v7 & 1) != 0)
      {
        encode_list_cstr_add_data(&v11, "persona_uuid", (uint64_t)(a1 + 1));
        v7 = *a1;
      }
      if ((v7 & 2) != 0)
        encode_list_cstr_add_data(&v11, "volume_uuid", (uint64_t)(a1 + 5));
      v9 = 0;
      v10 = 0;
      if (!encode_list_dict(&v11, &v9, &v10))
      {
        v3 = 0;
        *a2 = v9;
        *a3 = v10;
      }
    }
    else
    {
      v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  encode_list_free(&v11);
  return v3;
}

uint64_t decode_pfk_params_internal(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3;
  void *v6;

  v6 = 0;
  v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (der_dict_iterate())
    {
      if (!encode_list_cstr_get_data(&v6, "volume_uuid", __s + 20, 0x10uLL))
        *(_DWORD *)__s |= 2u;
      v3 = 0;
      if (!encode_list_cstr_get_data(&v6, "persona_uuid", __s + 4, 0x10uLL))
        *(_DWORD *)__s |= 1u;
    }
    else
    {
      v3 = 0xFFFFFFFFLL;
    }
  }
  encode_list_free(&v6);
  return v3;
}

uint64_t encode_fv_params_internal(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v8;
  size_t v9;
  void *v10;

  v10 = 0;
  v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!encode_list_cstr_add_data(&v10, "options", a1)
        && !encode_list_cstr_add_data(&v10, "kc", a1 + 8))
      {
        v8 = 0;
        v9 = 0;
        if (!encode_list_dict(&v10, &v8, &v9))
        {
          v3 = 0;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }
    else
    {
      v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  encode_list_free(&v10);
  return v3;
}

uint64_t decode_fv_params_internal(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3;
  void *v6;

  v6 = 0;
  v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (der_dict_iterate())
    {
      encode_list_cstr_get_data(&v6, "options", __s, 8uLL);
      encode_list_cstr_get_data(&v6, "kc", __s + 8, 4uLL);
      v3 = 0;
    }
    else
    {
      v3 = 0xFFFFFFFFLL;
    }
  }
  encode_list_free(&v6);
  return v3;
}

uint64_t ref_key_op_der_to_enum(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = 0;
  v4 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    if (der_key_op)
      der_dict_iterate();
    return 0;
  }
  return result;
}

uint64_t der_utils_decode_implicit_raw_octet_string_alloc(__int128 *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  uint64_t result;
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  if (a3 && a4)
  {
    result = (uint64_t)calloc(0, 1uLL);
    if (!result)
      return result;
    *a3 = result;
    *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_decode_implicit_uint64(__int128 *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  __int128 v6;

  if (a3)
    *a3 = 0;
  v6 = *a1;
  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccn_read_uint())
    {
      return 0;
    }
    else
    {
      *a1 = v6;
      if (a3)
        *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t _qsort_compare(const void **a1, void **a2)
{
  int v2;
  void *__s2;
  const void *v5;

  v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  v2 = memcmp(v5, __s2, 0);
  if (v2 > 0)
    return 1;
  else
    return ((v2 < 0) << 31 >> 31);
}

uint64_t platform_get_measurement()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 36, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return 4294967284;
}

uint64_t platform_rng()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(lib_platform_rng != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return lib_platform_rng();
}

uint64_t platform_read_random(uint64_t a1, unsigned int a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(lib_platform_read_random != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return lib_platform_read_random(a1, a2);
}

uint64_t platform_pka_get_pub_key(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 78, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t platform_pka_ecdh(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 86, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t platform_pka_sign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 94, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t platform_pka_sika_attest(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 106, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t platform_pka_shared_encrypt(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 115, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t platform_ref_key_hw_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 123, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5);
}

uint64_t platform_ref_key_hw_crypt_clear_cache()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 131, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0]();
}

uint64_t platform_get_device_id(uint64_t a1, uint64_t a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 139, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2);
}

uint64_t platform_get_aon_security(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 147, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_att_sep_chip_rev(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 155, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_chip_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 163, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_ecid(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_board_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 179, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_fuse_bits(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 187, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t platform_get_att_board_and_chip_id(uint64_t a1)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 195, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(0, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t aks_get_pad_size(int a1)
{
  return -a1 & 3;
}

char *aks_copy_packed_data(_DWORD *a1, const void *a2, int a3)
{
  char *v3;
  int v5;
  size_t v6;
  int __s;

  v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    v5 = -a3;
    v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *aks_pack_data(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v12;
  int v13;
  uint64_t *v14;
  char *result;
  char *v16;
  int v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  uint64_t *v21;
  const void **v22;

  v21 = &a9;
  v12 = 4;
  if (a3)
  {
    v13 = a3;
    do
    {
      v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  result = (char *)calloc(1uLL, v12);
  v16 = result;
  v22 = (const void **)&a9;
  v17 = 0;
  if (a3)
  {
    v18 = 4;
    do
    {
      v19 = v22;
      v20 = *v22;
      v22 += 2;
      result = aks_copy_packed_data(&v16[v18], v20, *((_DWORD *)v19 + 2));
      v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t aks_unpack_data(unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v9;
  char *v11;
  void **v12;
  void *v13;
  char *v14;
  size_t v15;
  unsigned int v16;
  size_t *v17;
  void **v19;

  if (a2 < 4)
    return 0xFFFFFFFFLL;
  v9 = a3;
  if (*a1 >= a3)
  {
    v19 = (void **)&a9;
    if (!a3)
      return 0;
    v11 = (char *)(a1 + 1);
    while (1)
    {
      v12 = v19;
      v13 = *v19;
      v19 += 2;
      v16 = *(_DWORD *)v11;
      v14 = v11 + 4;
      v15 = v16;
      if (v16 > a2)
        break;
      if (v13)
      {
        v17 = (size_t *)v12[1];
        if (*v17 < v15)
          return 0xFFFFFFFFLL;
        memcpy(v13, v14, v15);
        *v17 = v15;
      }
      v11 = &v14[v15];
      if (!--v9)
        return 0;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[CDPContext contextForPrimaryAccount].cold.1(v0);
}

#error "20D82C500: call analysis failed (funcsize=25)"

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B8]();
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x24BDAC2C8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MKBGetDeviceConfigurations()
{
  return MEMORY[0x24BE67158]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t OctagonPlatformSupportsSOS()
{
  return MEMORY[0x24BDE8530]();
}

uint64_t PCSAccountDisableWalrus()
{
  return MEMORY[0x24BE7AD98]();
}

uint64_t PCSAccountEnableWalrus()
{
  return MEMORY[0x24BE7ADA0]();
}

uint64_t PCSIdentityMigrateRestoreLocalBackup()
{
  return MEMORY[0x24BE7ADC0]();
}

uint64_t PCSIdentityMigrateToiCDP()
{
  return MEMORY[0x24BE7ADC8]();
}

uint64_t PCSIdentitySetCompanionCircleMember()
{
  return MEMORY[0x24BE7ADD8]();
}

uint64_t PCSIdentitySetCreate()
{
  return MEMORY[0x24BE7ADE0]();
}

uint64_t PCSIdentitySetIsICDP()
{
  return MEMORY[0x24BE7AE00]();
}

uint64_t PCSIdentitySetIsICDPNetworkWithOptions()
{
  return MEMORY[0x24BE7AE10]();
}

uint64_t PCSIdentitySetup()
{
  return MEMORY[0x24BE7AE20]();
}

uint64_t PCSIdentitySynchronizeKeys()
{
  return MEMORY[0x24BE7AE28]();
}

uint64_t PCSIdentityiCDPWalrus()
{
  return MEMORY[0x24BE7AE38]();
}

uint64_t SOSCCCanAuthenticate()
{
  return MEMORY[0x24BDE8540]();
}

uint64_t SOSCCCopyMyPeerInfo()
{
  return MEMORY[0x24BDE8560]();
}

uint64_t SOSCCCopyPeerPeerInfo()
{
  return MEMORY[0x24BDE8570]();
}

uint64_t SOSCCCopyViewUnawarePeerInfo()
{
  return MEMORY[0x24BDE8578]();
}

uint64_t SOSCCFetchCompatibilityMode()
{
  return MEMORY[0x24BDE8580]();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return MEMORY[0x24BDE8588]();
}

uint64_t SOSCCPeersHaveViewsEnabled()
{
  return MEMORY[0x24BDE85A8]();
}

uint64_t SOSCCRemovePeersFromCircle()
{
  return MEMORY[0x24BDE85B8]();
}

uint64_t SOSCCRemoveThisDeviceFromCircle()
{
  return MEMORY[0x24BDE85C0]();
}

uint64_t SOSCCRequestToJoinCircle()
{
  return MEMORY[0x24BDE85C8]();
}

uint64_t SOSCCRequestToJoinCircleAfterRestore()
{
  return MEMORY[0x24BDE85D0]();
}

uint64_t SOSCCResetToEmpty()
{
  return MEMORY[0x24BDE85D8]();
}

uint64_t SOSCCResetToOffering()
{
  return MEMORY[0x24BDE85E0]();
}

uint64_t SOSCCSetUserCredentialsAndDSID()
{
  return MEMORY[0x24BDE85F0]();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return MEMORY[0x24BDE85F8]();
}

uint64_t SOSCCThisDeviceIsInCircleNonCached()
{
  return MEMORY[0x24BDE8600]();
}

uint64_t SOSCCTryUserCredentialsAndDSID()
{
  return MEMORY[0x24BDE8608]();
}

uint64_t SOSCCView()
{
  return MEMORY[0x24BDE8610]();
}

uint64_t SOSCCViewSet()
{
  return MEMORY[0x24BDE8618]();
}

uint64_t SOSCCWaitForInitialSync()
{
  return MEMORY[0x24BDE8620]();
}

uint64_t SOSPeerInfoGetPeerID()
{
  return MEMORY[0x24BDE8648]();
}

uint64_t SOSPeerInfoGetPeerName()
{
  return MEMORY[0x24BDE8650]();
}

uint64_t SecRKCopyAccountRecoveryVerifier()
{
  return MEMORY[0x24BDE8CA8]();
}

uint64_t SecRKCreateRecoveryKeyString()
{
  return MEMORY[0x24BDE8CB0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x24BDAD358]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x24BDAD360]();
}

uint64_t cccbc_clear_iv()
{
  return MEMORY[0x24BDAD398]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x24BDAD3A0]();
}

uint64_t cccbc_one_shot()
{
  return MEMORY[0x24BDAD3A8]();
}

uint64_t cccbc_update()
{
  return MEMORY[0x24BDAD3B8]();
}

uint64_t cccurve25519()
{
  return MEMORY[0x24BDAD3E0]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x24BDAD3F0]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x24BDAD408]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x24BDAD418]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x24BDAD420]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x24BDAD440]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x24BDAD448]();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return MEMORY[0x24BDAD450]();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return MEMORY[0x24BDAD458]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x24BDAD480]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x24BDAD490]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x24BDAD4B0]();
}

uint64_t ccder_encode_raw_octet_string()
{
  return MEMORY[0x24BDAD4C8]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x24BDAD4D8]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x24BDAD4E0]();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return MEMORY[0x24BDAD4F0]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x24BDAD510]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x24BDAD520]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x24BDAD5B0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x24BDAD5D0]();
}

uint64_t ccecb_one_shot()
{
  return MEMORY[0x24BDAD620]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t cchmac()
{
  return MEMORY[0x24BDAD6A8]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x24BDAD720]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x24BDAD730]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x24BDAD750]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x24BDAE558](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x24BDAE570](a1, a2, *(_QWORD *)&a3);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

int scanf(const char *a1, ...)
{
  return MEMORY[0x24BDAFC50](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

