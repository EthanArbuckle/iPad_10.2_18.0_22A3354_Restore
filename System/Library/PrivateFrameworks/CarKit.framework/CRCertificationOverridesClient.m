@implementation CRCertificationOverridesClient

+ (void)setNextSessionOverrideAirPlayFeatureStrings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "setNextSessionOverrideAirPlayFeatureStrings: %{public}@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke;
  v11[3] = &unk_1E5429658;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(a1, "_servicePerformBlock:errorHandler:", v11, &__block_literal_global_25);

}

void __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2;
  v8[3] = &unk_1E5429020;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "setNextSessionOverrideAirPlayFeatureStrings:completion:", v6, v8);

}

void __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16[16];

  v5 = a3;
  CarCertificationOverrideLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "setNextSessionOverrideAirPlayFeatureStrings succeeded", v16, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }

  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();

}

void __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  CarCertificationOverrideLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

+ (void)fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke;
  v6[3] = &unk_1E54296A8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_servicePerformBlock:errorHandler:", v6, &__block_literal_global_19_0);

}

void __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5429680;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion:", v7);

}

void __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  CarCertificationOverrideLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "fetchNextSessionOverrideAirPlayFeatureStrings: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

void __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  CarCertificationOverrideLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_18_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

+ (void)_servicePerformBlock:(id)a3 errorHandler:(id)a4
{
  void (**v5)(id, void *, _QWORD *);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v5 = (void (**)(id, void *, _QWORD *))a3;
  v6 = a4;
  CarCertificationOverrideLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "connecting to CRCertificationOverridesService", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC678);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.certificationOverrides.service"), 4096);
  objc_msgSend(v9, "setRemoteObjectInterface:", v8);
  objc_msgSend(v9, "resume");
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__CRCertificationOverridesClient__servicePerformBlock_errorHandler___block_invoke;
  v15[3] = &unk_1E5427E30;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __68__CRCertificationOverridesClient__servicePerformBlock_errorHandler___block_invoke_2;
    v13[3] = &unk_1E5427E58;
    v14 = v9;
    v5[2](v5, v12, v13);

  }
}

uint64_t __68__CRCertificationOverridesClient__servicePerformBlock_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__CRCertificationOverridesClient__servicePerformBlock_errorHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __89__CRCertificationOverridesClient_setNextSessionOverrideAirPlayFeatureStrings_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "setNextSessionOverrideAirPlayFeatureStrings failed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __94__CRCertificationOverridesClient_fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion___block_invoke_18_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "fetchNextSessionOverrideAirPlayFeatureStringsWithCompletion failed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
