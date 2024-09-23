@implementation GCDefaultPhysicalDevice

void __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

void __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke_3;
  v6[3] = &unk_24D2B3E58;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "connectToDeviceService:withClient:reply:", &unk_254DEB028, v3, v6);

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_storeStrong(WeakRetained + 23, a2);
    }
    else if (gc_isInternalBuild())
    {
      getGCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138412802;
        v14 = v11;
        v15 = 2112;
        v16 = v12;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Game Intent Service' on connection %@: %@", (uint8_t *)&v13, 0x20u);
      }

    }
  }

}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3;
  v6[3] = &unk_24D2B3E58;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "connectToDeviceService:withClient:reply:", &unk_254DEAF08, v3, v6);

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  _QWORD *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[4];
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!v6)
    {
      if (!gc_isInternalBuild())
        goto LABEL_8;
      getGCLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        v21 = 2112;
        v22 = v7;
        v11 = v12;
        _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Light Service' on connection %@: %@", buf, 0x20u);
      }
      else
      {
        v11 = v12;
      }
      goto LABEL_6;
    }
    v10 = WeakRetained + 20;
    objc_storeStrong((id *)WeakRetained + 20, a2);
    if (v9[5] && *v10)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_211;
      block[3] = &unk_24D2B2B20;
      v16 = v9;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v11 = v16;
LABEL_6:

    }
  }
LABEL_8:

}

uint64_t __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_211(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_212(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3_214;
  v6[3] = &unk_24D2B3E58;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "connectToDeviceService:withClient:reply:", &unk_254DEAF68, v3, v6);

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3_214(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  _QWORD *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[4];
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!v6)
    {
      if (!gc_isInternalBuild())
        goto LABEL_8;
      getGCLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        v21 = 2112;
        v22 = v7;
        v11 = v12;
        _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Adaptive Triggers Service' on connection %@: %@", buf, 0x20u);
      }
      else
      {
        v11 = v12;
      }
      goto LABEL_6;
    }
    v10 = WeakRetained + 19;
    objc_storeStrong((id *)WeakRetained + 19, a2);
    if (v9[6] && *v10)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_215;
      block[3] = &unk_24D2B2B20;
      v16 = v9;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v11 = v16;
LABEL_6:

    }
  }
LABEL_8:

}

uint64_t __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_215(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_216(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3_218;
  v6[3] = &unk_24D2B3E58;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "connectToDeviceService:withClient:reply:", &unk_254DEAFC8, v3, v6);

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_3_218(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_storeStrong(WeakRetained + 21, a2);
    }
    else if (gc_isInternalBuild())
    {
      getGCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138412802;
        v14 = v11;
        v15 = 2112;
        v16 = v12;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Motion Service' on connection %@: %@", (uint8_t *)&v13, 0x20u);
      }

    }
  }

}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_219(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_221;
  v6[3] = &unk_24D2B3E58;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "connectToDeviceService:withClient:reply:", &unk_254DEAE48, v3, v6);

  objc_destroyWeak(&v8);
}

void __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_221(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[4];
  _QWORD *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v10 = WeakRetained + 22;
      objc_storeStrong((id *)WeakRetained + 22, a2);
      if (v9[11] && *v10)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_222;
        block[3] = &unk_24D2B2B20;
        v15 = v9;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
      objc_msgSend(v9, "createPowerSource");
    }
    else if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v17 = v12;
        v18 = 2112;
        v19 = v13;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Battery Service' on connection %@: %@", buf, 0x20u);
      }

    }
  }

}

uint64_t __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 16))();
}

void __75___GCDefaultPhysicalDevice_Motion__setDeviceMotionServiceConnectedHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[8] + 16))();
    WeakRetained = v2;
  }

}

intptr_t __49___GCDefaultPhysicalDevice_Motion__sensorsActive__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73___GCDefaultPhysicalDevice_Light__setDeviceLightServiceConnectedHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[5] + 16))();
    WeakRetained = v2;
  }

}

void __40___GCDefaultPhysicalDevice_Light__light__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __95___GCDefaultPhysicalDevice_AdaptiveTriggers__setDeviceAdaptiveTriggersServiceConnectedHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[6] + 16))();
    WeakRetained = v2;
  }

}

void __61___GCDefaultPhysicalDevice_AdaptiveTriggers__triggerStatuses__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __158___GCDefaultPhysicalDevice_AdaptiveTriggersClient__updateAdaptiveTriggerStatusWithLeftMode_leftStatus_leftArmPosition_rightMode_rightStatus_rightArmPosition___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = -[GCDeviceAdaptiveTriggersStatusPayload initFeedbackWithStatus:armPosition:mode:]([GCDeviceAdaptiveTriggersStatusPayload alloc], "initFeedbackWithStatus:armPosition:mode:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42));
    v9[0] = v3;
    v4 = -[GCDeviceAdaptiveTriggersStatusPayload initFeedbackWithStatus:armPosition:mode:]([GCDeviceAdaptiveTriggersStatusPayload alloc], "initFeedbackWithStatus:armPosition:mode:", *(unsigned __int8 *)(a1 + 43), *(unsigned __int8 *)(a1 + 44), *(unsigned __int8 *)(a1 + 45));
    v9[1] = v4;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_INFO, "Updating adaptive trigger status from plugin... %@", (uint8_t *)&v7, 0xCu);
      }

    }
    (*(void (**)(void))(WeakRetained[7] + 16))();

  }
}

void __77___GCDefaultPhysicalDevice_Battery__setDeviceBatteryServiceConnectedHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[11] + 16))();
    WeakRetained = v2;
  }

}

void __44___GCDefaultPhysicalDevice_Battery__battery__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __54___GCDefaultPhysicalDevice_Battery__createPowerSource__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFMutableDictionaryRef *WeakRetained;
  CFMutableDictionaryRef *v6;
  NSObject *v7;

  WeakRetained = (CFMutableDictionaryRef *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    CFDictionarySetValue(WeakRetained[10], CFSTR("Is Charging"), +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", a3));
    CFDictionarySetValue(v6[10], CFSTR("Max Capacity"), &unk_24D30E188);
    CFDictionarySetValue(v6[10], CFSTR("Current Capacity"), +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:", a2));
    if (IOPSSetPowerSourceDetails())
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __54___GCDefaultPhysicalDevice_Battery__createPowerSource__block_invoke_cold_1();

      }
    }
  }

}

void __68___GCDefaultPhysicalDevice_BatteryClient__updateBattery_isCharging___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  GCDeviceBattery *v3;
  NSObject *v4;
  int v5;
  GCDeviceBattery *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = -[GCDeviceBattery initWithLevel:isCharging:]([GCDeviceBattery alloc], "initWithLevel:isCharging:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = 138412290;
        v6 = v3;
        _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "Updating battery from plugin... %@", (uint8_t *)&v5, 0xCu);
      }

    }
    (*(void (**)(void))(WeakRetained[12] + 16))();

  }
}

void __73___GCDefaultPhysicalDevice_GameIntentClient__triggerGameIntentWithEvent___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(a1 + 40);
        v5 = 134217984;
        v6 = v4;
        _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "triggerGameIntentWithEvent %ld", (uint8_t *)&v5, 0xCu);
      }

    }
    (*(void (**)(void))(WeakRetained[14] + 16))();
  }

}

void __54___GCDefaultPhysicalDevice_Battery__createPowerSource__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_0_16(&dword_215181000, v0, v1, "Failed to set game controller power source details: %{mach.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_15();
}

@end
