@implementation GCSonyDualSenseControllerProfile

void __50___GCSonyDualSenseControllerProfile_deviceManager__block_invoke(uint64_t a1)
{
  _GCDefaultDeviceManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _GCDevicePIDVIDMatchingFilter *v6;

  v6 = -[_GCDevicePIDVIDMatchingFilter initWithVendorID:productIDs:]([_GCDevicePIDVIDMatchingFilter alloc], "initWithVendorID:productIDs:", &unk_24D30DF30, &unk_24D30FA70);
  v2 = [_GCDefaultDeviceManager alloc];
  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_GCDefaultDeviceManager initWithIdentifier:matchingFilter:probeScore:](v2, "initWithIdentifier:matchingFilter:probeScore:", v3, v6, *MEMORY[0x24BE3A690]);
  v5 = (void *)deviceManager_deviceManager_1;
  deviceManager_deviceManager_1 = v4;

  objc_msgSend((id)deviceManager_deviceManager_1, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __70___GCSonyDualSenseControllerProfile_physicalDevice_getLightWithReply___block_invoke(uint64_t a1, float a2, float a3, float a4)
{
  GCDeviceLight *v8;
  GCColor *v9;
  double v10;
  double v11;
  double v12;
  GCColor *v13;
  GCDeviceLight *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  GCDeviceLight *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = [GCDeviceLight alloc];
  v9 = [GCColor alloc];
  *(float *)&v10 = a2;
  *(float *)&v11 = a3;
  *(float *)&v12 = a4;
  v13 = -[GCColor initWithRed:green:blue:](v9, "initWithRed:green:blue:", v10, v11, v12);
  v14 = -[GCDeviceLight initWithColor:](v8, "initWithColor:", v13);

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 138412546;
      v18 = v16;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "physicalDevice:%@ getLight ...withReply(%@)", (uint8_t *)&v17, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79___GCSonyDualSenseControllerProfile_physicalDevice_getSensorsEnabledWithReply___block_invoke(uint64_t a1, int a2)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 1024;
      v10 = a2;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "physicalDevice:%@ getSensorsActive ...withReply(%d)", (uint8_t *)&v7, 0x12u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72___GCSonyDualSenseControllerProfile_physicalDevice_getBatteryWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  GCDeviceBattery *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  GCDeviceBattery *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = -[GCDeviceBattery initWithLevel:isCharging:]([GCDeviceBattery alloc], "initWithLevel:isCharging:", a2, a3);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "physicalDevice:%@ getBattery ...withReply(%@)", (uint8_t *)&v7, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __89___GCSonyDualSenseControllerProfile_physicalDevice_getAdaptiveTriggersStatusesWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v11 = -[GCDeviceAdaptiveTriggersStatusPayload initFeedbackWithStatus:armPosition:mode:]([GCDeviceAdaptiveTriggersStatusPayload alloc], "initFeedbackWithStatus:armPosition:mode:", a3, a4, a2);
  v20[0] = v11;
  v12 = -[GCDeviceAdaptiveTriggersStatusPayload initFeedbackWithStatus:armPosition:mode:]([GCDeviceAdaptiveTriggersStatusPayload alloc], "initFeedbackWithStatus:armPosition:mode:", a6, a7, a5);
  v20[1] = v12;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_INFO, "physicalDevice:%@ getAdaptiveTriggerStatuses ...withReply(%@)", (uint8_t *)&v16, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
