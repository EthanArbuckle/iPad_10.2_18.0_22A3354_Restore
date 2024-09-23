@implementation CDPDRemoteDeviceSecretValidator

- (void)setValidSecretHandler:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__CDPDRemoteDeviceSecretValidator_setValidSecretHandler___block_invoke;
  v7[3] = &unk_24C81C7D0;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)CDPDRemoteDeviceSecretValidator;
  -[CDPDDeviceSecretValidator setValidSecretHandler:](&v6, sel_setValidSecretHandler_, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __57__CDPDRemoteDeviceSecretValidator_setValidSecretHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!v5)
    objc_msgSend(WeakRetained, "cancelApproveFromAnotherDevice");
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id requestToJoinCompletion;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDRemoteDeviceSecretValidator approveFromAnotherDeviceWithCompletion:].cold.1();

  v6 = _Block_copy(v4);
  requestToJoinCompletion = self->_requestToJoinCompletion;
  self->_requestToJoinCompletion = v6;

  self->_isWaitingForRemoteApproval = 1;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81C7F8;
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  -[CDPDRemoteDeviceSecretValidator _decoratedDelegate](self, "_decoratedDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2;
  v12[3] = &unk_24C81C558;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "remoteSecretValidator:applyToJoinCircleWithJoinHandler:", self, v12);

}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  }
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  char v6;
  _BYTE *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CDPDRemoteSecretValidationResult *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a2)
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_4((uint64_t)v5, v16);

    if (v5)
    {
      v19 = *MEMORY[0x24BDD1398];
      v20[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v17 = *(_QWORD *)(a1 + 40);
    _CDPStateError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

    goto LABEL_19;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "isAttemptingRecovery");
  v7 = *(_BYTE **)(a1 + 32);
  if ((v6 & 1) != 0 || !v7[120])
  {
    if (objc_msgSend(v7, "isAttemptingRecovery"))
    {
      _CDPLogSystem();
      v14 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEBUG))
        __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_1();
    }
    else
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 120))
        goto LABEL_20;
      _CDPLogSystem();
      v14 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEBUG))
        __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_2();
    }
    goto LABEL_19;
  }
  v7[120] = 0;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_3();

  v9 = *(_QWORD **)(a1 + 32);
  v10 = v9[14];
  if (v10)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v10 + 16))(v9[14], 1, 0);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 112);
    *(_QWORD *)(v11 + 112) = 0;

    v9 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v9, "validSecretHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(CDPDRemoteSecretValidationResult);
    -[CDPDRemoteSecretValidationResult setSecretType:](v14, "setSecretType:", 4);
    objc_msgSend(*(id *)(a1 + 32), "validSecretHandler");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CDPDRemoteSecretValidationResult *, _QWORD))v15)[2](v15, v14, 0);

LABEL_19:
  }
LABEL_20:

}

- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[CDPDRemoteDeviceSecretValidator _decoratedDelegate](self, "_decoratedDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke;
  v10[3] = &unk_24C81C558;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteSecretValidator:attemptCustodianRecoveryWithInfo:completion:", self, v7, v10);

}

void __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  CDPDRemoteSecretValidationResult *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v5 = a3;
  if (a2)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "validSecretHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      -[CDPDRemoteSecretValidationResult setSecretType:](v8, "setSecretType:", 6);
      objc_msgSend(*(id *)(a1 + 32), "validSecretHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, CDPDRemoteSecretValidationResult *, _QWORD))v9)[2](v9, v8, 0);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[CDPDRemoteDeviceSecretValidator _decoratedDelegate](self, "_decoratedDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__CDPDRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke;
  v10[3] = &unk_24C81C558;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteSecretValidator:attemptCircleJoinWithPiggybackingContext:completion:", self, v7, v10);

}

void __86__CDPDRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  CDPDRemoteSecretValidationResult *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v5 = a3;
  if (a2)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __86__CDPDRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "validSecretHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      -[CDPDRemoteSecretValidationResult setSecretType:](v8, "setSecretType:", 7);
      objc_msgSend(*(id *)(a1 + 32), "validSecretHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, CDPDRemoteSecretValidationResult *, _QWORD))v9)[2](v9, v8, 0);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_decoratedDelegate
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CDPDRemoteDeviceSecretValidator _decoratedDelegate].cold.1(self, v3);

  -[CDPDDeviceSecretValidator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2549DFAD8);

  if (v5)
  {
    -[CDPDDeviceSecretValidator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)cancelApproveFromAnotherDevice
{
  void *v3;
  id requestToJoinCompletion;

  self->_isWaitingForRemoteApproval = 0;
  -[CDPDRemoteDeviceSecretValidator _decoratedDelegate](self, "_decoratedDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRemoteSecretValidatorApplicationToJoinCircle:", self);

  requestToJoinCompletion = self->_requestToJoinCompletion;
  if (requestToJoinCompletion)
    (*((void (**)(id, _QWORD, _QWORD))requestToJoinCompletion + 2))(requestToJoinCompletion, 0, 0);
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CDPDRemoteDeviceSecretValidator resetAccountCDPStateWithEscapeOptionsOffered:]";
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"%s: was called\", (uint8_t *)&v6, 0xCu);
  }

  -[CDPDRemoteDeviceSecretValidator resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:](self, "resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:", a3, 0);
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  CDPDRemoteSecretValidationResult *v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[CDPDRemoteDeviceSecretValidator resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:]";
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"%s: was called\", (uint8_t *)&v14, 0xCu);
  }

  -[CDPDDeviceSecretValidator validSecretHandler](self, "validSecretHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(CDPDRemoteSecretValidationResult);
    -[CDPDRemoteSecretValidationResult setUserDidReset:](v9, "setUserDidReset:", 1);
    -[CDPDRemoteSecretValidationResult setRequiredEscapeOffers:](v9, "setRequiredEscapeOffers:", -[CDPDDeviceSecretValidator supportedEscapeOfferMask](self, "supportedEscapeOfferMask"));
    -[CDPDRemoteSecretValidationResult setEscapeOffersPresentedMask:](v9, "setEscapeOffersPresentedMask:", a3);
    if (v6)
    {
      v10 = objc_alloc(MEMORY[0x24BE1A450]);
      objc_msgSend(v6, "validatedSecret");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithValidatedSecret:secretType:", v11, objc_msgSend(v6, "secretType"));
      -[CDPDRemoteSecretValidationResult setCachedSecretForReenrollment:](v9, "setCachedSecretForReenrollment:", v12);

    }
    -[CDPDDeviceSecretValidator validSecretHandler](self, "validSecretHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CDPDRemoteSecretValidationResult *, _QWORD))v13)[2](v13, v9, 0);

  }
}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  id v5;

  if (a3)
  {
    v5 = a3;
    (*((void (**)(id, unint64_t))a3 + 2))(v5, -[CDPDDeviceSecretValidator supportedEscapeOfferMask](self, "supportedEscapeOfferMask"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestToJoinCompletion, 0);
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

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Attempting to join the circle using remote approval...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Ignoring circle state change because a recovery is in progress\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Ignoring circle state change because we're not supposed to be waiting for remote approval\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Circle join was approved from another device\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to request circle join approval from another device - %@\", (uint8_t *)&v2, 0xCu);
}

void __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Circle join was successfull with custodian recovery\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __86__CDPDRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Circle join was successfull with piggybacking recovery\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_decoratedDelegate
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Fetching decorated delegate: %@\", (uint8_t *)&v4, 0xCu);

}

@end
