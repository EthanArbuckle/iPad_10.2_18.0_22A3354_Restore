@implementation CDPInheritanceTrustController

- (void)createInheritanceKeyWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  CDPAccount *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "cliqueConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(CDPAccount);
  -[CDPAccount primaryAccountDSID](v8, "primaryAccountDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDPAccount isICDPEnabledForDSID:](CDPAccount, "isICDPEnabledForDSID:", v9);

  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
      -[CDPInheritanceTrustController createInheritanceKeyWithContext:completion:].cold.1(v5);

    v13 = (void *)MEMORY[0x24BDE84B0];
    objc_msgSend(v5, "beneficiaryIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __76__CDPInheritanceTrustController_createInheritanceKeyWithContext_completion___block_invoke;
    v21[3] = &unk_24C7C1258;
    v15 = &v22;
    v22 = v6;
    v16 = v6;
    objc_msgSend(v13, "createInheritanceKey:uuid:reply:", v7, v14, v21);
  }
  else
  {
    if (v12)
      -[CDPInheritanceTrustController createInheritanceKeyWithContext:completion:].cold.2(v5);

    v17 = (void *)MEMORY[0x24BDE84B0];
    objc_msgSend(v5, "beneficiaryIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __76__CDPInheritanceTrustController_createInheritanceKeyWithContext_completion___block_invoke_13;
    v19[3] = &unk_24C7C1258;
    v15 = &v20;
    v20 = v6;
    v18 = v6;
    objc_msgSend(v17, "generateInheritanceKey:uuid:reply:", v7, v14, v19);
  }

}

void __76__CDPInheritanceTrustController_createInheritanceKeyWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "accessCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __76__CDPInheritanceTrustController_createInheritanceKeyWithContext_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "accessCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)recoverOctagonWithContext:(id)a3 inheritanceKey:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E110]), "initFromAccessKey:", v8);
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CDPInheritanceTrustController recoverOctagonWithContext:inheritanceKey:completion:].cold.3(v8);

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CDPInheritanceTrustController recoverOctagonWithContext:inheritanceKey:completion:].cold.2();

    v14 = (void *)MEMORY[0x24BDE84B0];
    objc_msgSend(v7, "cliqueConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recoverOctagonUsingInheritanceKey:inheritanceKey:reply:", v15, v10, v9);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPInheritanceTrustController recoverOctagonWithContext:inheritanceKey:completion:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5216);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v15);
  }

}

- (BOOL)isInheritanceAccessKeyValid:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE6E110];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initFromAccessKey:", v4);

  return v5 != 0;
}

- (void)deleteInheritanceAccessKeyWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDE84B0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "cliqueConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beneficiaryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeInheritanceKey:inheritanceKeyUUID:reply:", v9, v8, v6);
}

- (void)validateAccessKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;

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
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E110]), "initFromAccessKey:", v7);
    v14 = (void *)MEMORY[0x24BDE84B0];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke;
    v16[3] = &unk_24C7C1200;
    v18 = v9;
    v17 = v7;
    objc_msgSend(v14, "preflightRecoverOctagonUsingInheritanceKey:inheritanceKey:reply:", v12, v13, v16);

    goto LABEL_5;
  }
  objc_msgSend(v8, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    -[CDPCustodianRecoveryKeyController validateRecoveryKey:withContext:completion:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5003);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v9 + 2))(v9, v12);
LABEL_5:

}

void __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke(uint64_t a1, void *a2)
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
      __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)recreateInheritanceKeyWithContext:(id)a3 newOTPeerID:(id)a4 inheritanceKey:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CDPInheritanceTrustController recreateInheritanceKeyWithContext:newOTPeerID:inheritanceKey:completion:].cold.2();

  objc_msgSend(v9, "dsid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

LABEL_6:
    objc_msgSend(v9, "cliqueConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E110]), "initFromAccessKey:", v11);
    v18 = (void *)MEMORY[0x24BDE84B0];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __105__CDPInheritanceTrustController_recreateInheritanceKeyWithContext_newOTPeerID_inheritanceKey_completion___block_invoke;
    v20[3] = &unk_24C7C1258;
    v21 = v12;
    objc_msgSend(v18, "recreateInheritanceKey:uuid:oldIK:reply:", v16, v10, v17, v20);

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v9, "altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_6;
  _CDPLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[CDPInheritanceTrustController recreateInheritanceKeyWithContext:newOTPeerID:inheritanceKey:completion:].cold.1();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5003);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v16);
    goto LABEL_7;
  }
LABEL_8:

}

void __105__CDPInheritanceTrustController_recreateInheritanceKeyWithContext_newOTPeerID_inheritanceKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __105__CDPInheritanceTrustController_recreateInheritanceKeyWithContext_newOTPeerID_inheritanceKey_completion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v5, "accessCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

    }
  }

}

- (void)checkInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPInheritanceTrustController checkInheritanceKey:inheritanceKeyUUID:completion:].cold.2();

  objc_msgSend(v7, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_6:
    objc_msgSend(v7, "cliqueConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDE84B0];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke;
    v16[3] = &unk_24C7C1228;
    v17 = v9;
    objc_msgSend(v14, "checkInheritanceKey:inheritanceKeyUUID:reply:", v13, v8, v16);

    goto LABEL_7;
  }
  objc_msgSend(v7, "altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_6;
  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    -[CDPCustodianRecoveryKeyController validateRecoveryKey:withContext:completion:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5003);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v9 + 2))(v9, v13);
LABEL_7:

}

void __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_3();
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if ((a2 & 1) != 0)
  {
    if (v8)
      __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_1();
    goto LABEL_8;
  }
  if (v8)
    __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_2();

  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

LABEL_9:
}

- (void)createInheritanceKeyWithContext:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "beneficiaryIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_0(&dword_20D7E6000, v2, v3, "\"Generating Inheritance access key for CDP account. Beneficiary: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)createInheritanceKeyWithContext:(void *)a1 completion:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "beneficiaryIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_0(&dword_20D7E6000, v2, v3, "\"Generating Inheritance access key for non-CDP account - not saved on OT. Beneficiary: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)recoverOctagonWithContext:inheritanceKey:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_20D7E6000, v0, OS_LOG_TYPE_ERROR, "\"Unable to create the access key without access string or data.\", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)recoverOctagonWithContext:inheritanceKey:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Attempting to recover Octagon with the inheritance key.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)recoverOctagonWithContext:(void *)a1 inheritanceKey:completion:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "beneficiaryID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_0(&dword_20D7E6000, v2, v3, "\"Creating the access key for beneficiary: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "beneficiaryID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_0(&dword_20D7E6000, v2, v3, "\"Inheritance key valid for beneficiary: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Error validating inheritance key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)recreateInheritanceKeyWithContext:newOTPeerID:inheritanceKey:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_20D7E6000, v0, v1, "\"CDPCustodianController init is missing required dsid. Unable to recreate inheritance keys\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)recreateInheritanceKeyWithContext:newOTPeerID:inheritanceKey:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"recreateInheritanceKeyWithContext called\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __105__CDPInheritanceTrustController_recreateInheritanceKeyWithContext_newOTPeerID_inheritanceKey_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Error recreating inheritance key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)checkInheritanceKey:inheritanceKeyUUID:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"checkInheritanceKey called\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Inheritance key for beneficiary exists\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Inheritance key for beneficiary does not exist\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Error checking inheritance key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
