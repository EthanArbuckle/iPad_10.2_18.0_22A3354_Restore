@implementation DummyRemoteDeviceSecretValidator

- (DummyRemoteDeviceSecretValidator)initWithExpectedSecret:(id)a3
{
  id v5;
  DummyRemoteDeviceSecretValidator *v6;
  DummyRemoteDeviceSecretValidator *v7;

  v5 = a3;
  v6 = -[DummyRemoteDeviceSecretValidator init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_expectedString, a3);

  return v7;
}

- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6
{
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  DummyRemoteDeviceSecretValidator *v15;
  id v16;

  v8 = a3;
  v9 = a6;
  v10 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__DummyRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke;
  block[3] = &unk_24F824B90;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

}

void __79__DummyRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  if ((v2 & 1) == 0)
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) < 3uLL;
    _CDPStateError();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _BOOL8, id))(v3 + 16))(v3, v2, v4, v5);

  }
}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  v5 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__DummyRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke;
  block[3] = &unk_24F824BB8;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

}

uint64_t __71__DummyRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(result + 16))(result, 1, 0, 0);
  return result;
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = dispatch_time(0, 100000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__DummyRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke;
  block[3] = &unk_24F824BB8;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __75__DummyRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __75__DummyRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_cold_1(v2);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (unint64_t)supportedEscapeOfferMask
{
  unint64_t v2;

  if (CFPreferencesGetAppBooleanValue(CFSTR("OfferRemoteApproval"), CFSTR("com.apple.corecdp"), 0))
    v2 = 5;
  else
    v2 = 1;
  if (CFPreferencesGetAppBooleanValue(CFSTR("OfferAccountReset"), CFSTR("com.apple.corecdp"), 0))
    v2 |= 8uLL;
  if (CFPreferencesGetAppBooleanValue(CFSTR("OfferRecoveryKey"), CFSTR("com.apple.corecdp"), 0))
    v2 |= 0x20uLL;
  if (CFPreferencesGetAppBooleanValue(CFSTR("OfferCustodianRecovery"), CFSTR("com.apple.corecdp"), 0))
    v2 |= 0x40uLL;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("ContextTypeRepair"), CFSTR("com.apple.corecdp"), 0))
    v2 |= 0x10uLL;
  if (CFPreferencesGetAppIntegerValue(CFSTR("NumberOfDevices"), CFSTR("com.apple.corecdp"), 0) == 2)
    return v2 | 2;
  else
    return v2;
}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, unint64_t))a3 + 2))(v5, -[DummyRemoteDeviceSecretValidator supportedEscapeOfferMask](self, "supportedEscapeOfferMask"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedString, 0);
}

void __75__DummyRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D08A000, log, OS_LOG_TYPE_DEBUG, "\"Faking remote approval success...\", v1, 2u);
}

@end
