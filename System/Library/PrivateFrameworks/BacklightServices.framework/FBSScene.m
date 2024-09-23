@implementation FBSScene

BLSBacklightFBSSceneEnvironment *__56__FBSScene_BacklightServices__backlightSceneEnvironment__block_invoke(uint64_t a1)
{
  NSObject *v2;

  bls_scenes_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__FBSScene_BacklightServices__backlightSceneEnvironment__block_invoke_cold_1(a1, v2);

  return -[BLSBacklightFBSSceneEnvironment initWithFBSScene:]([BLSBacklightFBSSceneEnvironment alloc], "initWithFBSScene:", *(_QWORD *)(a1 + 32));
}

void __56__FBSScene_BacklightServices__backlightSceneEnvironment__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_DEBUG, "create BLSBacklightFBSSceneEnvironment for fbsScene:%@", (uint8_t *)&v4, 0xCu);

}

@end
