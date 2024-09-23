@implementation GCNintendoJoyConDevice

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke(uint64_t a1)
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

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_3;
  v3[3] = &unk_24D2B3E30;
  v3[4] = v2;
  v4 = v1;
  objc_msgSend(v4, "connectToDeviceService:withClient:reply:", &unk_254DEADE8, v2, v3);

}

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a2 && gc_isInternalBuild())
  {
    v6 = a1;
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(v6 + 32);
      v9 = *(_QWORD *)(v6 + 40);
      v10 = 138412802;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'JoyCon Fusion Gesture Service' on connection %@: %@", (uint8_t *)&v10, 0x20u);
    }

  }
}

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_69(uint64_t a1)
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
  v6[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_2_71;
  v6[3] = &unk_24D2B3E58;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "connectToDeviceService:withClient:reply:", &unk_254DEAE48, v3, v6);

  objc_destroyWeak(&v8);
}

void __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_2_71(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_storeStrong(WeakRetained + 9, a2);
      objc_msgSend(v9, "readBattery");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "propagateBattery:", v10);

    }
    else if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v14 = 138412802;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "%@ failed to connect to 'Battery Service' on connection %@: %@", (uint8_t *)&v14, 0x20u);
      }

    }
  }

}

void __46___GCNintendoJoyConDevice_Client___addClient___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeClient:", v2);

}

intptr_t __50___GCNintendoJoyConDevice_Components__readBattery__block_invoke(uint64_t a1, unsigned int a2, unsigned int a3)
{
  GCDeviceBattery *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = [GCDeviceBattery alloc];
  *(float *)&v7 = (float)a2;
  v8 = -[GCDeviceBattery initWithLevel:batteryState:](v6, "initWithLevel:batteryState:", a3, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56___GCNintendoJoyConDevice_Components__propagateBattery___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 8) + 16))();
    v2 = v3;
  }

}

void __62___GCNintendoJoyConDevice_Fusion__homeButtonLongPressGesture___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "device:fusionGestureActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

@end
