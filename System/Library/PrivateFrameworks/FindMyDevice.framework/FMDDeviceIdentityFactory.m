@implementation FMDDeviceIdentityFactory

- (void)identityForPasscodeActivationUnlockWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: identityForPasscodeActivationUnlockWithContext:completion:", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration identityConfiguration](FMNSXPCConnectionConfiguration, "identityConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke;
  v19[3] = &unk_1E829C100;
  v12 = v5;
  v20 = v12;
  objc_msgSend(v10, "addFailureBlock:", v19);
  objc_msgSend(v10, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke_3;
  v16[3] = &unk_1E829C128;
  v17 = v10;
  v18 = v12;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v13, "identityForPasscodeActivationUnlockWithContext:completion:", v6, v16);

}

void __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;

  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke_cold_1(a2, v4);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v5);

}

uint64_t __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)baaIdentityAttestationForSigningRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDDeviceIdentityFactory baaIdentityAttestationForSigningRequest:completion:]";
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration identityConfiguration](FMNSXPCConnectionConfiguration, "identityConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke;
  v19[3] = &unk_1E829C100;
  v12 = v5;
  v20 = v12;
  objc_msgSend(v10, "addFailureBlock:", v19);
  objc_msgSend(v10, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke_5;
  v16[3] = &unk_1E829C150;
  v17 = v10;
  v18 = v12;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v13, "baaIdentityAttestationForSigningRequest:completion:", v6, v16);

}

void __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;

  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke_cold_1(a2, v4);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v5);

}

uint64_t __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __86__FMDDeviceIdentityFactory_identityForPasscodeActivationUnlockWithContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1C9939000, a2, OS_LOG_TYPE_ERROR, "XPC error for identityForPasscodeActivationUnlockWithContext:completion: %li", (uint8_t *)&v2, 0xCu);
}

void __79__FMDDeviceIdentityFactory_baaIdentityAttestationForSigningRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[FMDDeviceIdentityFactory baaIdentityAttestationForSigningRequest:completion:]_block_invoke";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_1C9939000, a2, OS_LOG_TYPE_ERROR, "XPC error for %s %li", (uint8_t *)&v2, 0x16u);
}

@end
