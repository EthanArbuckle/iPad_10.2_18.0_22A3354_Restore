@implementation AppAttestEligibilityManager

- (NSArray)allowlistedDaemons
{
  NSArray *allowlistedDaemons;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  allowlistedDaemons = self->_allowlistedDaemons;
  if (!allowlistedDaemons)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
    if (objc_msgSend(v4, "BOOLForKey:", CFSTR("addTestDaemonToAllowlist")))
    {
      objc_msgSend(&unk_24D598768, "arrayByAddingObject:", CFSTR("com.apple.dctestd"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &unk_24D598768;
    }
    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v5);
    v7 = self->_allowlistedDaemons;
    self->_allowlistedDaemons = v6;

    allowlistedDaemons = self->_allowlistedDaemons;
  }
  return allowlistedDaemons;
}

- (NSArray)allowlistedExtensions
{
  NSArray *allowlistedExtensions;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  allowlistedExtensions = self->_allowlistedExtensions;
  if (!allowlistedExtensions)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
    if (objc_msgSend(v4, "BOOLForKey:", CFSTR("addTestExtensionToAllowlist")))
    {
      objc_msgSend(&unk_24D598780, "arrayByAddingObject:", CFSTR("com.apple.DCAppContainer.Extension"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &unk_24D598780;
    }
    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v5);
    v7 = self->_allowlistedExtensions;
    self->_allowlistedExtensions = v6;

    allowlistedExtensions = self->_allowlistedExtensions;
  }
  return allowlistedExtensions;
}

- (BOOL)isEligibleApplicationFor:(id *)a3
{
  __int128 v3;
  void *v4;
  char isKindOfClass;
  NSObject *v6;
  _OWORD v8[2];

  v3 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v3;
  -[AppAttestEligibilityManager fetchBundleRecordFor:](self, "fetchBundleRecordFor:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    _DCAALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AppAttestEligibilityManager isEligibleApplicationFor:].cold.1();

    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isEligibleApplicationExtensionFor:(id *)a3
{
  __int128 v5;
  void *v6;
  NSObject *v7;
  const __CFAllocator *v8;
  __int128 v9;
  __SecTask *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  void *v14;
  void (**v15)(_QWORD);
  NSObject *v16;
  void *v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  CFErrorRef error;
  _QWORD v28[5];
  audit_token_t token;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  -[AppAttestEligibilityManager fetchBundleRecordFor:](self, "fetchBundleRecordFor:", &token);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v9 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)token.val = *(_OWORD *)a3->var0;
      *(_OWORD *)&token.val[4] = v9;
      v10 = SecTaskCreateWithAuditToken(v8, &token);
      v11 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke;
      v28[3] = &__block_descriptor_40_e5_v8__0l;
      v28[4] = v10;
      v12 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v28);
      v26[4] = 0;
      error = 0;
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke_2;
      v26[3] = &__block_descriptor_40_e5_v8__0l;
      v13 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v26);
      v14 = (void *)SecTaskCopyValueForEntitlement(v10, CFSTR("com.apple.devicecheck.extension-client"), &error);
      v25[0] = v11;
      v25[1] = 3221225472;
      v25[2] = __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke_3;
      v25[3] = &__block_descriptor_40_e5_v8__0l;
      v25[4] = v14;
      v15 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v25);
      if (error)
      {
        _DCAALogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[__CFError localizedDescription](error, "localizedDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:].cold.3(v17, (uint64_t)&token, v16);
        }
      }
      else
      {
        if (objc_msgSend(v14, "intValue") == 1)
        {
          -[NSObject teamIdentifier](v7, "teamIdentifier");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend((id)v19, "isEqualToString:", CFSTR("0000000000"));

          -[NSObject bundleIdentifier](v7, "bundleIdentifier");
          v21 = objc_claimAutoreleasedReturnValue();
          LOBYTE(v19) = objc_msgSend((id)v21, "hasPrefix:", CFSTR("com.apple."));

          -[AppAttestEligibilityManager allowlistedExtensions](self, "allowlistedExtensions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject bundleIdentifier](v7, "bundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v21) = objc_msgSend(v22, "containsObject:", v23);

          v18 = v20 & v19 & v21;
LABEL_17:
          v15[2](v15);

          v13[2](v13);
          v12[2](v12);

          goto LABEL_18;
        }
        _DCAALogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:].cold.2();
      }

      v18 = 0;
      goto LABEL_17;
    }
    _DCAALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:].cold.4();
  }
  else
  {
    _DCAALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:].cold.1();
  }
  v18 = 0;
LABEL_18:

  return v18;
}

void __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke_3(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

- (BOOL)isEligibleDaemonFor:(id *)a3
{
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  CFErrorRef error;
  _QWORD v26[5];
  audit_token_t token;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  v7 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke;
  v26[3] = &__block_descriptor_40_e5_v8__0l;
  v26[4] = v6;
  v8 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v26);
  v24[4] = 0;
  error = 0;
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_2;
  v24[3] = &__block_descriptor_40_e5_v8__0l;
  v9 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v24);
  v10 = (void *)SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.devicecheck.daemon-client"), &error);
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_3;
  v23[3] = &__block_descriptor_40_e5_v8__0l;
  v23[4] = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v23);
  if (error)
  {
    _DCAALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
    {
      -[__CFError localizedDescription](error, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AppAttestEligibilityManager isEligibleDaemonFor:].cold.5(v13, (uint64_t)&token, v12);
    }
LABEL_11:
    LOBYTE(v17) = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v10, "intValue") != 1)
  {
    _DCAALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
      -[AppAttestEligibilityManager isEligibleDaemonFor:].cold.4();
    goto LABEL_11;
  }
  v14 = (void *)SecTaskCopyValueForEntitlement(v6, CFSTR("application-identifier"), &error);
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_33;
  v22[3] = &__block_descriptor_40_e5_v8__0l;
  v22[4] = v14;
  v12 = MEMORY[0x2199FACE4](v22);
  if (v14)
  {
    v15 = v14;
    -[AppAttestEligibilityManager allowlistedDaemons](self, "allowlistedDaemons");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v15);

    if (v17)
    {
      _DCAALogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[AppAttestEligibilityManager isEligibleDaemonFor:].cold.2((uint64_t)v15, v18, v19);
    }
    else
    {
      _DCAALogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[AppAttestEligibilityManager isEligibleDaemonFor:].cold.3((uint64_t)v15, v18, v21);
    }

  }
  else
  {
    _DCAALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AppAttestEligibilityManager isEligibleDaemonFor:].cold.1();
    LOBYTE(v17) = 0;
  }

  (*(void (**)(uint64_t))(v12 + 16))(v12);
LABEL_12:

  v11[2](v11);
  v9[2](v9);

  v8[2](v8);
  return v17;
}

void __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_3(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_33(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

- (id)fetchBundleRecordFor:(id *)a3
{
  const __CFAllocator *v4;
  __int128 v5;
  SecTaskRef v6;
  void (**v7)(_QWORD);
  __int128 v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v15;
  _QWORD v16[5];
  audit_token_t token;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __52__AppAttestEligibilityManager_fetchBundleRecordFor___block_invoke;
  v16[3] = &__block_descriptor_40_e5_v8__0l;
  v16[4] = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v16);
  v15 = 0;
  v8 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v8;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", &token, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v10)
  {
    _DCAALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v10, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AppAttestEligibilityManager fetchBundleRecordFor:].cold.2(v12, (uint64_t)&token, v11);
    }
  }
  else
  {
    if (v9)
    {
      v13 = v9;
      goto LABEL_7;
    }
    _DCAALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[AppAttestEligibilityManager fetchBundleRecordFor:].cold.1();
  }

  v13 = 0;
LABEL_7:

  v7[2](v7);
  return v13;
}

void __52__AppAttestEligibilityManager_fetchBundleRecordFor___block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

- (void)setAllowlistedDaemons:(id)a3
{
  objc_storeStrong((id *)&self->_allowlistedDaemons, a3);
}

- (void)setAllowlistedExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_allowlistedExtensions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowlistedExtensions, 0);
  objc_storeStrong((id *)&self->_allowlistedDaemons, 0);
}

- (void)isEligibleApplicationFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Failed to fetch bundle record, ineligible application.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)isEligibleApplicationExtensionFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Failed to fetch bundle record, ineligible application extension.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)isEligibleApplicationExtensionFor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Extension client entitlement not set.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)isEligibleApplicationExtensionFor:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_2167BD000, a3, (uint64_t)a3, "Failed to fetch extension entitlement. { error=%@ }", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_0();
}

- (void)isEligibleApplicationExtensionFor:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Bundle record is not of application extension type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)isEligibleDaemonFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Daemon client is missing application identifier entitlement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)isEligibleDaemonFor:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_2167BD000, a2, a3, "Daemon client connection is eligible client. { daemon=%@ }", (uint8_t *)&v3);
}

- (void)isEligibleDaemonFor:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_2167BD000, a2, a3, "Daemon client connection is not eligible client. { daemon=%@ }", (uint8_t *)&v3);
}

- (void)isEligibleDaemonFor:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Daemon client entitlement not set.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)isEligibleDaemonFor:(NSObject *)a3 .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_2167BD000, a3, (uint64_t)a3, "Failed to fetch daemon entitlement. { error=%@ }", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_0();
}

- (void)fetchBundleRecordFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Failed to construct bundle record from audit token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)fetchBundleRecordFor:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_2167BD000, a3, (uint64_t)a3, "Failed to fetch bundle record. { error=%@ }", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_0();
}

@end
