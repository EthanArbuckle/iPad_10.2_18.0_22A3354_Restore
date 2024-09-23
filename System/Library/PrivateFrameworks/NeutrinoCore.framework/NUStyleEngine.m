@implementation NUStyleEngine

uint64_t __106___NUStyleEngine_usingSharedStyleEngineForUsage_withMetalCommandQueue_configuration_tuningParams_perform___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "matchesUsage:metalCommandQueue:configuration:tuning:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __106___NUStyleEngine_usingSharedStyleEngineForUsage_withMetalCommandQueue_configuration_tuningParams_perform___block_invoke_482(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "processor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalMemoryResource:", v4);

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "processor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  return v8;
}

@end
