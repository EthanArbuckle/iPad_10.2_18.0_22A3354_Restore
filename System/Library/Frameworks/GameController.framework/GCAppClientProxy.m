@implementation GCAppClientProxy

void __48___GCAppClientProxy__initWithConnection_server___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  objc_msgSend(v1, "_invalidate");

}

uint64_t __35___GCAppClientProxy_pingWithReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64___GCAppClientProxy_connectToControllerServiceWithClient_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id obj;

  if (*(_QWORD *)(a1 + 32))
  {
    obj = *(id *)(a1 + 40);
    objc_sync_enter(obj);
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
    {
      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(void **)(v3 + 64);
      *(_QWORD *)(v3 + 64) = v2;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("activeControllerDevices"), 5, 0);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), *(id *)(a1 + 32));
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_sync_exit(obj);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __77___GCAppClientProxy_connectToPlayerIndicatorXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __67___GCAppClientProxy_connectToLightXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __78___GCAppClientProxy_connectToAdaptiveTriggersXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __68___GCAppClientProxy_connectToMotionXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __69___GCAppClientProxy_connectToBatteryXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __70___GCAppClientProxy_connectToSettingsXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __72___GCAppClientProxy_connectToGameIntentXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __75___GCAppClientProxy_connectToSystemGestureXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __72___GCAppClientProxy_connectToPhotoVideoXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

void __38___GCAppClientProxy_settingsSuiteName__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(&stru_24D2B85A8, "stringByAppendingString:", CFSTR("com.apple.gamecontroller.settings"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)settingsSuiteName_suiteName;
  settingsSuiteName_suiteName = v0;

}

void __58___GCAppClientProxy_DeviceClient__addInvalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = WeakRetained;
    objc_sync_enter(v3);
    objc_msgSend(v3, "invalidationHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v6 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "removeObject:", v6);

    objc_msgSend(v3, "setInvalidationHandlers:", v5);
    objc_sync_exit(v3);

    WeakRetained = v7;
  }

}

void __77___GCAppClientProxy_ControllerService__fetchControllerDescriptionsWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = a1 + 32;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 64), "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __77___GCAppClientProxy_ControllerService__fetchControllerDescriptionsWithReply___block_invoke_cold_1(v2, (uint64_t)v5, v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __111___GCAppClientProxy_PlayerIndicatorXPCProxyService__playerIndicatorXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __111___GCAppClientProxy_PlayerIndicatorXPCProxyService__playerIndicatorXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_24D2B5758;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "fetchObjectIdentifierWithReply:", v5);

}

void __111___GCAppClientProxy_PlayerIndicatorXPCProxyService__playerIndicatorXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "IPCObjectWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254DE1150)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_254DC3480))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = v7;
    objc_msgSend(v6, "acceptClient:onConnection:error:", v4, v5, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __91___GCAppClientProxy_LightXPCProxyService__lightXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __91___GCAppClientProxy_LightXPCProxyService__lightXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_24D2B5758;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "fetchObjectIdentifierWithReply:", v5);

}

void __91___GCAppClientProxy_LightXPCProxyService__lightXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "IPCObjectWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254DCE700)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_254DC3480))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = v7;
    objc_msgSend(v6, "acceptClient:onConnection:error:", v4, v5, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __113___GCAppClientProxy_AdaptiveTriggersXPCProxyService__adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __113___GCAppClientProxy_AdaptiveTriggersXPCProxyService__adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_24D2B5758;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "fetchObjectIdentifierWithReply:", v5);

}

void __113___GCAppClientProxy_AdaptiveTriggersXPCProxyService__adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "IPCObjectWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254DD51C0)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_254DC3480))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = v7;
    objc_msgSend(v6, "acceptClient:onConnection:error:", v4, v5, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __93___GCAppClientProxy_MotionXPCProxyService__motionXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93___GCAppClientProxy_MotionXPCProxyService__motionXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_24D2B5758;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "fetchObjectIdentifierWithReply:", v5);

}

void __93___GCAppClientProxy_MotionXPCProxyService__motionXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "IPCObjectWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254DC7DF0)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_254DC3480))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = v7;
    objc_msgSend(v6, "acceptClient:onConnection:error:", v4, v5, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __95___GCAppClientProxy_BatteryXPCProxyService__batteryXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __95___GCAppClientProxy_BatteryXPCProxyService__batteryXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_24D2B5758;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "fetchObjectIdentifierWithReply:", v5);

}

void __95___GCAppClientProxy_BatteryXPCProxyService__batteryXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "IPCObjectWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254DC34F8)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_254DC3480))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = v7;
    objc_msgSend(v6, "acceptClient:onConnection:error:", v4, v5, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __101___GCAppClientProxy_GameIntentXPCProxyService__gameIntentXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __101___GCAppClientProxy_GameIntentXPCProxyService__gameIntentXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_24D2B5758;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "fetchObjectIdentifierWithReply:", v5);

}

void __101___GCAppClientProxy_GameIntentXPCProxyService__gameIntentXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "IPCObjectWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254DCAAB0)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_254DC3480))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = v7;
    objc_msgSend(v6, "acceptClient:onConnection:error:", v4, v5, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __107___GCAppClientProxy_SystemGestureXPCProxyService__systemGestureXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __107___GCAppClientProxy_SystemGestureXPCProxyService__systemGestureXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_24D2B5758;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "fetchObjectIdentifierWithReply:", v5);

}

void __107___GCAppClientProxy_SystemGestureXPCProxyService__systemGestureXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "IPCObjectWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254DD6B30)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_254DC3480))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = v7;
    objc_msgSend(v6, "acceptClient:onConnection:error:", v4, v5, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __97___GCAppClientProxy_SettingsXPCProxyService__settingsXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __97___GCAppClientProxy_SettingsXPCProxyService__settingsXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_24D2B5758;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v6, "fetchObjectIdentifierWithReply:", v5);

}

void __97___GCAppClientProxy_SettingsXPCProxyService__settingsXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "IPCObjectWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254DD0840)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_254DC3480))
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = v7;
    objc_msgSend(v6, "acceptClient:onConnection:error:", v4, v5, 0);
    (*(void (**)(void))(a1[7] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __77___GCAppClientProxy_ControllerService__fetchControllerDescriptionsWithReply___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 24);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_22(&dword_215181000, a2, a3, "Sending published controllers to remote %@\n%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0_23();
}

@end
