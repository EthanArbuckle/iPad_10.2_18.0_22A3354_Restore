@implementation AXBClarityUIManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_25);
  return (id)sharedManager_manager_0;
}

void __36__AXBClarityUIManager_sharedManager__block_invoke()
{
  AXBClarityUIManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBClarityUIManager);
  v1 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v0;

}

- (AXBClarityUIManager)init
{
  AXBClarityUIManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  AXPasscodeAccessor *passcodeHandle;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXBClarityUIManager;
  v2 = -[AXBClarityUIManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE00698]);
    CLFLogCommon();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithServiceName:accountName:groupName:logFacility:", CFSTR("ClarityUI"), CFSTR("user"), CFSTR("com.apple.Accessibility"), v4);
    passcodeHandle = v2->_passcodeHandle;
    v2->_passcodeHandle = (AXPasscodeAccessor *)v5;

  }
  return v2;
}

- (void)setAdminPasscode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 == *MEMORY[0x24BDFFE50])
  {
    -[AXBClarityUIManager passcodeHandle](self, "passcodeHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attemptToSetPasscode:", v4);

  }
  else
  {
    CLFLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXBClarityUIManager setAdminPasscode:].cold.1(v4);

  }
}

- (BOOL)validateAdminPasscode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 == *MEMORY[0x24BDFFE50])
  {
    -[AXBClarityUIManager passcodeHandle](self, "passcodeHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "passcode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  else
  {
    CLFLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[AXBClarityUIManager validateAdminPasscode:].cold.1(v4);

    v8 = 0;
  }

  return v8;
}

- (AXPasscodeAccessor)passcodeHandle
{
  return self->_passcodeHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeHandle, 0);
}

- (void)setAdminPasscode:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_232455000, v1, v2, "Attempted to set admin passcode to a string of %lu characters (expected: %lu).", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)validateAdminPasscode:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_232455000, v1, v2, "Attempted to validate admin passcode as a string of %lu characters (expected: %lu).", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

@end
