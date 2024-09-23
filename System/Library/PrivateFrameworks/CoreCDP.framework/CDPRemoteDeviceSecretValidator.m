@implementation CDPRemoteDeviceSecretValidator

- (CDPRemoteDeviceSecretValidator)initWithContext:(id)a3 validator:(id)a4
{
  id v7;
  id v8;
  CDPRemoteDeviceSecretValidator *v9;
  CDPRemoteDeviceSecretValidator *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[CDPRemoteDeviceSecretValidator init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_validator, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  CDPRemoteDeviceSecretValidatorProtocol *validator;
  CDPRemoteDeviceSecretValidatorProtocol *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  CDPRemoteDeviceSecretValidatorProtocol *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    validator = self->_validator;
    *(_DWORD *)buf = 138412290;
    v20 = validator;
    _os_log_impl(&dword_20D7E6000, v13, OS_LOG_TYPE_DEFAULT, "\"Attempting to validate secret using validator %@\", buf, 0xCu);
  }

  v15 = self->_validator;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke;
  v17[3] = &unk_24C7C1700;
  v17[4] = self;
  v18 = v10;
  v16 = v10;
  -[CDPRemoteDeviceSecretValidatorProtocol validateSecret:devices:type:withCompletion:](v15, "validateSecret:devices:type:withCompletion:", v12, v11, a5, v17);

}

void __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  char v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v18 = a2;
    v19 = 1024;
    v20 = a3;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Validator returned response of isValid=%i canRetry=%i error=%@ ... dispatching completion block on to main queue\", buf, 0x18u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke_1;
  v12[3] = &unk_24C7C0FE0;
  v9 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v15 = a2;
  v16 = a3;
  v13 = v7;
  v14 = v10;
  v11 = v7;
  objc_msgSend(v9, "_executeSyncOnMainThreadIfNeeded:", v12);

}

uint64_t __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke_1(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke_1_cold_1();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CDPRemoteDeviceSecretValidatorProtocol *validator;
  CDPRemoteDeviceSecretValidatorProtocol *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  CDPRemoteDeviceSecretValidatorProtocol *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    validator = self->_validator;
    *(_DWORD *)buf = 138412290;
    v15 = validator;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Attempting to validate recovery key using validator %@\", buf, 0xCu);
  }

  v10 = self->_validator;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke;
  v12[3] = &unk_24C7C1700;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[CDPRemoteDeviceSecretValidatorProtocol validateRecoveryKey:withCompletion:](v10, "validateRecoveryKey:withCompletion:", v7, v12);

}

void __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  char v15;

  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke_2;
  v11[3] = &unk_24C7C0FE0;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = a2;
  v15 = a3;
  v12 = v7;
  v13 = v9;
  v10 = v7;
  objc_msgSend(v8, "_executeSyncOnMainThreadIfNeeded:", v11);

}

uint64_t __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CDPRemoteDeviceSecretValidatorProtocol *validator;
  CDPRemoteDeviceSecretValidatorProtocol *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  CDPRemoteDeviceSecretValidatorProtocol *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    validator = self->_validator;
    *(_DWORD *)buf = 138412290;
    v15 = validator;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Attempting to validate custodian recovery info using validator %@\", buf, 0xCu);
  }

  v10 = self->_validator;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__CDPRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke;
  v12[3] = &unk_24C7C1750;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[CDPRemoteDeviceSecretValidatorProtocol validateCustodianRecoveryInfo:withCompletion:](v10, "validateCustodianRecoveryInfo:withCompletion:", v7, v12);

}

void __79__CDPRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__CDPRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2;
  v9[3] = &unk_24C7C1728;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "_executeSyncOnMainThreadIfNeeded:", v9);

}

uint64_t __79__CDPRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D7E6000, v2, OS_LOG_TYPE_DEFAULT, "\"InvokingvalidateCustodianRecoveryInfo:withCompletion: completion block on the main queue\", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CDPRemoteDeviceSecretValidatorProtocol *validator;
  CDPRemoteDeviceSecretValidatorProtocol *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  CDPRemoteDeviceSecretValidatorProtocol *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    validator = self->_validator;
    *(_DWORD *)buf = 138412290;
    v15 = validator;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Attempting to join circle with piggybacking using validator %@\", buf, 0xCu);
  }

  v10 = self->_validator;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__CDPRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke;
  v12[3] = &unk_24C7C1750;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[CDPRemoteDeviceSecretValidatorProtocol attemptToJoinCircleWithPiggybacking:withCompletion:](v10, "attemptToJoinCircleWithPiggybacking:withCompletion:", v7, v12);

}

void __85__CDPRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__CDPRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke_2;
  v9[3] = &unk_24C7C1728;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "_executeSyncOnMainThreadIfNeeded:", v9);

}

uint64_t __85__CDPRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D7E6000, v2, OS_LOG_TYPE_DEFAULT, "\"Invoking attemptToJoinCircleWithPiggybacking:withCompletion: completion block on the main queue\", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CDPRemoteDeviceSecretValidatorProtocol *validator;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPRemoteDeviceSecretValidator approveFromAnotherDeviceWithCompletion:].cold.1();

  validator = self->_validator;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__CDPRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke;
  v8[3] = &unk_24C7C1750;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[CDPRemoteDeviceSecretValidatorProtocol approveFromAnotherDeviceWithCompletion:](validator, "approveFromAnotherDeviceWithCompletion:", v8);

}

void __73__CDPRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__CDPRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2;
  v9[3] = &unk_24C7C1728;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "_executeSyncOnMainThreadIfNeeded:", v9);

}

uint64_t __73__CDPRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)cancelApproveFromAnotherDevice
{
  NSObject *v3;
  uint8_t v4[16];

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D7E6000, v3, OS_LOG_TYPE_DEFAULT, "\"Cancelling request for remote approval...\", v4, 2u);
  }

  -[CDPRemoteDeviceSecretValidatorProtocol cancelApproveFromAnotherDevice](self->_validator, "cancelApproveFromAnotherDevice");
}

- (void)resetAccountCDPState
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_20D7E6000, v0, OS_LOG_TYPE_ERROR, "\"External clients should not perform RPD.\", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Requesting reset of CDP account state with escape offers presented: %lu\", (uint8_t *)&v6, 0xCu);
  }

  -[CDPRemoteDeviceSecretValidatorProtocol resetAccountCDPStateWithEscapeOptionsOffered:](self->_validator, "resetAccountCDPStateWithEscapeOptionsOffered:", a3);
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Requesting reset of CDP account state with escape offers presented: %lu, and setting secret...\", (uint8_t *)&v8, 0xCu);
  }

  -[CDPRemoteDeviceSecretValidatorProtocol resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:](self->_validator, "resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:", a3, v6);
}

- (void)cancelValidationWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CDPRemoteDeviceSecretValidator cancelValidationWithError:].cold.1((uint64_t)v4, v5);

  -[CDPRemoteDeviceSecretValidatorProtocol cancelValidationWithError:](self->_validator, "cancelValidationWithError:", v4);
}

- (unint64_t)supportedEscapeOfferMask
{
  dispatch_semaphore_t v3;
  CDPRemoteDeviceSecretValidatorProtocol *validator;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_semaphore_create(0);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  validator = self->_validator;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMask__block_invoke;
  v10[3] = &unk_24C7C1778;
  v12 = &v13;
  v5 = v3;
  v11 = v5;
  -[CDPRemoteDeviceSecretValidatorProtocol supportedEscapeOfferMaskCompletion:](validator, "supportedEscapeOfferMaskCompletion:", v10);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[3];
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Supported Escape Offers: %lu\", buf, 0xCu);
  }

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

intptr_t __58__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMask__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  id v4;
  CDPRemoteDeviceSecretValidatorProtocol *validator;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  validator = self->_validator;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMaskCompletion___block_invoke;
  v7[3] = &unk_24C7C17C8;
  v8 = v4;
  v6 = v4;
  -[CDPRemoteDeviceSecretValidatorProtocol supportedEscapeOfferMaskCompletion:](validator, "supportedEscapeOfferMaskCompletion:", v7);

}

void __69__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMaskCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMaskCompletion___block_invoke_2;
  v3[3] = &unk_24C7C17A0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __69__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMaskCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_executeSyncOnMainThreadIfNeeded:(id)a3
{
  void (**v3)(void);
  void (**block)(void);

  v3 = (void (**)(void))a3;
  if (v3)
  {
    block = v3;
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      block[2]();
    else
      dispatch_sync(MEMORY[0x24BDAC9B8], block);
    v3 = block;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

void __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke_1_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Invoking validateSecret:devices:type:withCompletion: completion block on the main queue\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Invoking validateRecoveryKey:withCompletion: completion block on the main queue\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)approveFromAnotherDeviceWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Requesting approval from another device...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cancelValidationWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"Cancelling validation with error %@\", (uint8_t *)&v2, 0xCu);
}

@end
