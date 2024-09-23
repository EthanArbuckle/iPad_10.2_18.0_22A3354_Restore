@implementation CDPRecoveryKeySecretValidatorProxyImpl

- (CDPRecoveryKeySecretValidatorProxyImpl)initWithRemoteObject:(id)a3
{
  id v5;
  CDPRecoveryKeySecretValidatorProxyImpl *v6;
  CDPRecoveryKeySecretValidatorProxyImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPRecoveryKeySecretValidatorProxyImpl;
  v6 = -[CDPRecoveryKeySecretValidatorProxyImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_validator, a3);

  return v7;
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:].cold.1();

}

- (void)cancelApproveFromAnotherDevice
{
  NSObject *v2;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:].cold.1();

}

- (void)cancelValidationWithError:(id)a3
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:].cold.1();

}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:].cold.1();

}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4
{
  NSObject *v4;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:].cold.1();

}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:].cold.1();

}

- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  NSObject *v4;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:].cold.1();

}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  CDPRemoteDeviceSecretValidatorProtocol *validator;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  validator = self->_validator;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__CDPRecoveryKeySecretValidatorProxyImpl_validateRecoveryKey_withCompletion___block_invoke;
  v9[3] = &unk_24C7C1008;
  v10 = v6;
  v8 = v6;
  -[CDPRemoteDeviceSecretValidatorProtocol validateRecoveryKey:withCompletion:](validator, "validateRecoveryKey:withCompletion:", a3, v9);

}

void __77__CDPRecoveryKeySecretValidatorProxyImpl_validateRecoveryKey_withCompletion___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  char v14;

  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CDPRecoveryKeySecretValidatorProxyImpl_validateRecoveryKey_withCompletion___block_invoke_2;
  block[3] = &unk_24C7C0FE0;
  v8 = *(id *)(a1 + 32);
  v13 = a2;
  v14 = a3;
  v11 = v7;
  v12 = v8;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __77__CDPRecoveryKeySecretValidatorProxyImpl_validateRecoveryKey_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6
{
  NSObject *v6;

  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:].cold.1();

}

- (unint64_t)supportedEscapeOfferMask
{
  return self->supportedEscapeOfferMask;
}

- (void)setSupportedEscapeOfferMask:(unint64_t)a3
{
  self->supportedEscapeOfferMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
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
  OUTLINED_FUNCTION_16(&dword_20D7E6000, v0, v1, "\"Not implemented\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
