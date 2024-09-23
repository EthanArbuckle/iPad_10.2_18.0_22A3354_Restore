@implementation MXDispatchAsync

void __MXDispatchAsync_block_invoke(uint64_t a1)
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
  uint64_t v15;

  v2 = (void *)MEMORY[0x194035B20]();
  v3 = a1 + 48;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(unsigned int *)(a1 + 104);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  if (CMSMDeviceState_IsMediaserverd() && !MX_FeatureFlags_IsAudiomxdEnabled()
    || CMSMDeviceState_IsAudiomxd() && MX_FeatureFlags_IsAudiomxdEnabled())
  {
    if (MXGetSerialQueue_onceToken != -1)
      dispatch_once(&MXGetSerialQueue_onceToken, &__block_literal_global_59);
    if (gSerialQueue == v4)
      MEMORY[0x1940347A0](a1 + 48, 1, "MXDispatchAsync_block_invoke", v5, v6, v7, v8, v9);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 80);
  v13 = *(unsigned int *)(a1 + 104);
  v15 = *(_QWORD *)(a1 + 88);
  v14 = *(_QWORD *)(a1 + 96);
  if (CMSMDeviceState_IsMediaserverd() && !MX_FeatureFlags_IsAudiomxdEnabled()
    || CMSMDeviceState_IsAudiomxd() && MX_FeatureFlags_IsAudiomxdEnabled())
  {
    if (MXGetSerialQueue_onceToken != -1)
      dispatch_once(&MXGetSerialQueue_onceToken, &__block_literal_global_59);
    if (gSerialQueue == v10)
      MEMORY[0x1940347A0](v3, 2, "MXDispatchAsync_block_invoke", v11, v12, v13, v15, v14);
  }
  objc_autoreleasePoolPop(v2);
}

@end
