@implementation GDSManager

void __48___GDSManager_managerWithID_locationBundlePath___block_invoke(uint64_t a1)
{
  _GDSManager *v1;
  void *v2;

  if (!managerWithID_locationBundlePath__instance)
  {
    v1 = -[_GDSManager initWithID:locationBundlePath:]([_GDSManager alloc], "initWithID:locationBundlePath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v2 = (void *)managerWithID_locationBundlePath__instance;
    managerWithID_locationBundlePath__instance = (uint64_t)v1;

  }
}

void __51___GDSManager_registerClientID_locationBundlePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51___GDSManager_registerClientID_locationBundlePath___block_invoke_cold_1();

}

void __51___GDSManager_registerClientID_locationBundlePath___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51___GDSManager_registerClientID_locationBundlePath___block_invoke_60_cold_1();

  }
}

void __42___GDSManager_triggerBAUpdateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51___GDSManager_registerClientID_locationBundlePath___block_invoke_cold_1();

}

void __42___GDSManager_triggerBAUpdateWithHandler___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42___GDSManager_triggerBAUpdateWithHandler___block_invoke_61_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke()
{
  return &unk_250E0F698;
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke_76()
{
  return &unk_250E0F6C0;
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke_85()
{
  return &unk_250E0F6E8;
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke_96()
{
  return &unk_250E0F710;
}

void *__49___GDSManager_latestBalancingAuthorityWithError___block_invoke_2()
{
  return &unk_250E0F738;
}

void __51___GDSManager_registerClientID_locationBundlePath___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  NSStringFromSelector(*(SEL *)(v0 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D1EF000, v2, v3, "Error calling %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __51___GDSManager_registerClientID_locationBundlePath___block_invoke_60_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  NSStringFromSelector(*(SEL *)(v0 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D1EF000, v2, v3, "Error executing %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __42___GDSManager_triggerBAUpdateWithHandler___block_invoke_61_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  NSStringFromSelector(*(SEL *)(v0 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D1EF000, v2, v3, "Error executing %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
