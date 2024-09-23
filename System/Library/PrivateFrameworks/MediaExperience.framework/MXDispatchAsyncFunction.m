@implementation MXDispatchAsyncFunction

uint64_t __MXDispatchAsyncFunction_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

void __MXDispatchAsyncFunction_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = (void *)MEMORY[0x194035B20]();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(unsigned int *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  if (CMSMDeviceState_IsMediaserverd() && !MX_FeatureFlags_IsAudiomxdEnabled()
    || CMSMDeviceState_IsAudiomxd() && MX_FeatureFlags_IsAudiomxdEnabled())
  {
    if (MXGetSerialQueue_onceToken != -1)
      dispatch_once(&MXGetSerialQueue_onceToken, &__block_literal_global_59);
    if (gSerialQueue == v3)
      MEMORY[0x1940347A0](a1 + 48, 1, "MXDispatchAsyncFunction_block_invoke_2", v4, v5, v6, v7, v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  v12 = *(unsigned int *)(a1 + 104);
  v13 = *(_QWORD *)(a1 + 88);
  v14 = *(_QWORD *)(a1 + 96);
  if (CMSMDeviceState_IsMediaserverd() && !MX_FeatureFlags_IsAudiomxdEnabled()
    || CMSMDeviceState_IsAudiomxd() && MX_FeatureFlags_IsAudiomxdEnabled())
  {
    if (MXGetSerialQueue_onceToken != -1)
      dispatch_once(&MXGetSerialQueue_onceToken, &__block_literal_global_59);
    if (gSerialQueue == v9)
      MEMORY[0x1940347A0](a1 + 48, 2, "MXDispatchAsyncFunction_block_invoke_2", v10, v11, v12, v13, v14);
  }
  objc_autoreleasePoolPop(v2);
  _Block_release(*(const void **)(a1 + 40));
}

@end
