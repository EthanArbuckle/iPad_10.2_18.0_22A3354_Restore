@implementation GCControllerManagerAppClient

uint64_t __37___GCControllerManagerAppClient_init__block_invoke()
{
  objc_opt_class();
  return GCLookupSetFallbackProvider();
}

uint64_t __37___GCControllerManagerAppClient_open__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToDaemon");
}

uint64_t __50___GCControllerManagerAppClient_finalizeRecording__block_invoke(uint64_t a1, int a2)
{
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("Failed to move");
      if (a2)
        v6 = CFSTR("Successfully moved");
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "%@ last recording to desktop", (uint8_t *)&v7, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_cold_1();

  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 248);
  *(_QWORD *)(v2 + 248) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 256);
  *(_QWORD *)(v4 + 256) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 264);
  *(_QWORD *)(v10 + 264) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 224);
  *(_QWORD *)(v12 + 224) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 216);
  *(_QWORD *)(v14 + 216) = 0;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 200);
  *(_QWORD *)(v16 + 200) = 0;

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 208);
  *(_QWORD *)(v18 + 208) = 0;

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 192);
  *(_QWORD *)(v20 + 192) = 0;

}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_134(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_134_cold_1();

  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 248);
  *(_QWORD *)(v2 + 248) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 256);
  *(_QWORD *)(v4 + 256) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 264);
  *(_QWORD *)(v10 + 264) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 224);
  *(_QWORD *)(v12 + 224) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 216);
  *(_QWORD *)(v14 + 216) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_135;
  v18[3] = &unk_24D2B2B20;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v16, "pingWithReply:", v18);

}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_135(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_2;
  block[3] = &unk_24D2B2B20;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_2(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_3;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_215181000, "Resume Connection To Game Controller Daemon", OS_ACTIVITY_FLAG_DETACHED, activity_block);
}

uint64_t __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeDaemonConnection");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2;
  v7 = &unk_24D2B5030;
  v8 = v3;
  objc_msgSend(v2, "connectToControllerServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), a2);
    objc_msgSend(*(id *)(a1 + 32), "refreshControllers");
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_cold_1();

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_137(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_138;
  v7 = &unk_24D2B5058;
  v8 = v3;
  objc_msgSend(v2, "connectToPlayerIndicatorXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_138(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), a2);
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_138_cold_1();

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_140(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_141;
  v7 = &unk_24D2B5080;
  v8 = v3;
  objc_msgSend(v2, "connectToLightXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_141(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), a2);
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_141_cold_1();

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_143(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_144;
  v7 = &unk_24D2B50A8;
  v8 = v3;
  objc_msgSend(v2, "connectToAdaptiveTriggersXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_144(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), a2);
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_144_cold_1();

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_146(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_147;
  v7 = &unk_24D2B50D0;
  v8 = v3;
  objc_msgSend(v2, "connectToMotionXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_147(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 256), a2);
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_147_cold_1();

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_149(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_150;
  v7 = &unk_24D2B50F8;
  v8 = v3;
  objc_msgSend(v2, "connectToBatteryXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_150(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), a2);
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_150_cold_1();

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_152(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_153;
  v7 = &unk_24D2B5120;
  v8 = v3;
  objc_msgSend(v2, "connectToSettingsXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_153(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), a2);
    objc_msgSend(*(id *)(a1 + 32), "updateEmulatedControllerEnabled");
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_153_cold_1();

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_155(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_156;
  v7 = &unk_24D2B5148;
  v8 = v3;
  objc_msgSend(v2, "connectToPhotoVideoXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_156(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), a2);
  }
  else if (gc_isInternalBuild())
  {
    v8 = a1;
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v8 + 32) + 192);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "Could not connect to 'photo/video XPC proxy service' on connection %@: %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_158(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_159;
  v7 = &unk_24D2B5170;
  v8 = v3;
  objc_msgSend(v2, "connectToGameIntentXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_159(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 280), a2);
  }
  else if (gc_isInternalBuild())
  {
    v8 = a1;
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v8 + 32) + 192);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "Could not connect to 'game intent XPC proxy service' on connection %@: %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_161(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "remoteProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_162;
  v7 = &unk_24D2B5198;
  v8 = v3;
  objc_msgSend(v2, "connectToSystemGestureXPCProxyServiceWithClient:reply:");

}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_162(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 288), a2);
  }
  else if (gc_isInternalBuild())
  {
    v8 = a1;
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v8 + 32) + 192);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "Could not connect to 'system gesture XPC proxy service' on connection %@: %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

void __44___GCControllerManagerAppClient_controllers__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "allValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

void __62___GCControllerManagerAppClient__onqueue_unpublishController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "updateCurrentControllerAndProfileForUnpublishedController:", *(_QWORD *)(a1 + 40));
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "Posting GCControllerDidDisconnectNotification for controller: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  +[GCAnalytics instance](GCAnalytics, "instance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unpublishController:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "setPublished:", 0);
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("GCControllerDidDisconnectNotification"), *(_QWORD *)(a1 + 40), 0);

}

void __60___GCControllerManagerAppClient__onqueue_publishController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentController:", *(_QWORD *)(a1 + 40));
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "Posting GCControllerDidConnectNotification for controller: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  +[GCAnalytics instance](GCAnalytics, "instance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishController:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "setPublished:", 1);
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("GCControllerDidConnectNotification"), *(_QWORD *)(a1 + 40), 0);

}

void __64___GCControllerManagerAppClient_updateEmulatedControllerEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_INFO, "emulatedControllerEnabled is: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    +[NSUserDefaults standardUserDefaults](&off_254DEF040, "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("GCEnableKeyboardMouseController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "intValue");

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setEmulatedControllerMapping:", v4);

}

uint64_t __51___GCControllerManagerAppClient_onHIDServiceAdded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshPublishedControllers");
}

void __86___GCControllerManagerAppClient_setProperty_forKey_forHIDServiceClientWithRegistryID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
      objc_msgSend(v7, "registryID", (_QWORD)v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToNumber:", *(_QWORD *)(a1 + 40));

      if ((v9 & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v7;

    if (!v10)
      return;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = *(_QWORD *)(a1 + 48);
        v12 = *(_QWORD *)(a1 + 56);
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v20 = v13;
        v21 = 2112;
        v22 = v12;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "[GCControllerManagerApp] setProperty: %@ forKey: %@ forHIDServiceClientWithRegistryID: %@", buf, 0x20u);
      }

    }
    IOHIDServiceClientSetProperty((IOHIDServiceClientRef)objc_msgSend(v10, "service"), *(CFStringRef *)(a1 + 56), *(CFTypeRef *)(a1 + 48));
  }
  else
  {
LABEL_9:
    v10 = v2;
  }

}

void __52___GCControllerManagerAppClient_startVideoRecording__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[8];
  _QWORD v8[5];

  v3 = a2;
  if (v3)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_cold_1();
LABEL_9:

    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 272);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_184;
    v8[3] = &unk_24D2B4308;
    v8[4] = v5;
    objc_msgSend(v6, "onVideoRecordingStart:", v8);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "Video recording successfully started", v7, 2u);
      }
      goto LABEL_9;
    }
  }

}

void __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_184(uint64_t a1, void *a2)
{
  id v3;
  int isInternalBuild;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  isInternalBuild = gc_isInternalBuild();
  if (!v3)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "onVideoRecordingStart sucessfully finished", v9, 2u);
      }

    }
    +[NSDate date](&off_254DF6DA0, "date");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v7 + 320);
    *(_QWORD *)(v7 + 320) = v6;
    goto LABEL_7;
  }
  if (isInternalBuild)
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_184_cold_1();
LABEL_7:

  }
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[3];
  char v22;

  v5 = a2;
  v6 = a3;
  if (v5 || !gc_isInternalBuild())
  {
    if (v6)
      goto LABEL_4;
LABEL_12:
    v7 = -1;
    goto LABEL_13;
  }
  getGCLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_cold_2();

  if (!v6)
    goto LABEL_12;
LABEL_4:
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  v7 = sandbox_extension_consume();
  if (v7 != -1)
  {
LABEL_13:
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = *(_BYTE *)(a1 + 48);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_191;
    v15[3] = &unk_24D2B5238;
    v20 = v7;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v16 = v10;
    v17 = v11;
    v19 = v21;
    v18 = v12;
    v13 = (void *)MEMORY[0x2199DEBB0](v15);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(getRPScreenRecorderClass(), "sharedRecorder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "exportClipToURL:duration:completionHandler:", v10, v13, 15.0);
    }
    else
    {
      objc_msgSend(getRPScreenRecorderClass(), "sharedRecorder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stopRecordingWithOutputURL:completionHandler:", v10, v13);
    }

    _Block_object_dispose(v21, 8);
    goto LABEL_17;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_cold_1();

  }
LABEL_17:

}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_191(_QWORD *a1, void *a2)
{
  id v3;
  int isInternalBuild;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1[8] != -1)
    sandbox_extension_release();
  isInternalBuild = gc_isInternalBuild();
  if (!v3)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = a1[4];
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "Video recording successfully stopped with url: %@", buf, 0xCu);
      }

    }
    v6 = (void *)a1[4];
    v7 = *(void **)(a1[5] + 272);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_192;
    v15[3] = &unk_24D2B5210;
    v8 = v6;
    v10 = (void *)a1[6];
    v9 = a1[7];
    v16 = v8;
    v19 = v9;
    v11 = v10;
    v12 = a1[5];
    v17 = v11;
    v18 = v12;
    objc_msgSend(v7, "onVideoRecordingStopWithURL:reply:", v8, v15);

    v5 = v16;
    goto LABEL_9;
  }
  if (isInternalBuild)
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_191_cold_1();
LABEL_9:

  }
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  int isInternalBuild;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  isInternalBuild = gc_isInternalBuild();
  if (!v3)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "onVideoRecordingStopWithURL successfully finished with url: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    +[GCAnalytics instance](GCAnalytics, "instance");
    v5 = objc_claimAutoreleasedReturnValue();
    currentProcessBundleIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "detailedProductCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSObject sendRPKitInstantCaptureSavedEventForBundleID:productCategory:](v5, "sendRPKitInstantCaptureSavedEventForBundleID:productCategory:", v7, v8);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 320), "timeIntervalSinceNow");
      LODWORD(v10) = llround(-v9);
      -[NSObject sendRPKitManualRecordingSavedEventForBundleID:productCategory:duration:](v5, "sendRPKitManualRecordingSavedEventForBundleID:productCategory:duration:", v7, v8, v10);
    }

    goto LABEL_10;
  }
  if (isInternalBuild)
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_192_cold_1();
LABEL_10:

  }
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(void **)(v11 + 320);
  *(_QWORD *)(v11 + 320) = 0;

}

void __47___GCControllerManagerAppClient_startBuffering__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int isInternalBuild;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a2;
  isInternalBuild = gc_isInternalBuild();
  if (v3)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __47___GCControllerManagerAppClient_startBuffering__block_invoke_cold_1();

    }
  }
  else
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "Clip buffering succesfully started", v10, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v6 + 314))
    {
      +[GCAnalytics instance](GCAnalytics, "instance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      currentProcessBundleIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendRPKitInstantCaptureBufferStartedEventForBundleID:", v8);

      v6 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v6 + 314) = 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = 0;

}

void __46___GCControllerManagerAppClient_stopBuffering__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3 && gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46___GCControllerManagerAppClient_stopBuffering__block_invoke_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 314) = 0;

}

void __69___GCControllerManagerAppClient_onScreenshotTriggeredWithController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __69___GCControllerManagerAppClient_onScreenshotTriggeredWithController___block_invoke_cold_1();

    }
  }
  else
  {
    +[GCAnalytics instance](GCAnalytics, "instance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    currentProcessBundleIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "detailedProductCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendRPKitScreenshotSavedEventForBundleID:productCategory:", v6, v7);

  }
}

void __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "controllersQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke_2;
  v5[3] = &unk_24D2B2B48;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  dispatch_barrier_async(v2, v5);

}

void __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v17;
    *(_QWORD *)&v4 = 138412290;
    v14 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        objc_msgSend(v8, "identifier", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "member:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v14;
              v21 = v9;
              _os_log_debug_impl(&dword_215181000, v11, OS_LOG_TYPE_DEBUG, "Publish controller: '%@'", buf, 0xCu);
            }

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "addObject:", v9);
          objc_msgSend(*(id *)(a1 + 40), "_onqueue_addPendingController:", v8);
        }

        ++v7;
      }
      while (v5 != v7);
      v12 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      v5 = v12;
    }
    while (v12);
  }

  objc_msgSend(*(id *)(a1 + 40), "controllersQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke_340;
  block[3] = &unk_24D2B2B20;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_barrier_async(v13, block);

}

uint64_t __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke_340(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshPublishedControllers");
}

void __88___GCControllerManagerAppClient_ControllerService__unpublishControllersWithIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "controllersQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __88___GCControllerManagerAppClient_ControllerService__unpublishControllersWithIdentifiers___block_invoke_2;
  v5[3] = &unk_24D2B2B48;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  dispatch_barrier_async(v2, v5);

}

uint64_t __88___GCControllerManagerAppClient_ControllerService__unpublishControllersWithIdentifiers___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v14;
    *(_QWORD *)&v4 = 138412290;
    v12 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v12;
            v18 = v8;
            _os_log_debug_impl(&dword_215181000, v9, OS_LOG_TYPE_DEBUG, "Unpublish controller: '%@'", buf, 0xCu);
          }

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "removeObject:", v8, v12, (_QWORD)v13);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "removeObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      v5 = v10;
    }
    while (v10);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_onqueue_refreshPublishedControllers");
}

uint64_t __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 216);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke_2;
  v4[3] = &unk_24D2B5288;
  v4[4] = v1;
  return objc_msgSend(v2, "fetchControllerDescriptionsWithReply:", v4);
}

void __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "controllersQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke_3;
  v7[3] = &unk_24D2B2B48;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_barrier_async(v4, v7);

}

void __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int isInternalBuild;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v33;
    *(_QWORD *)&v5 = 138412290;
    v26 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        objc_msgSend(v2, "member:", v9, v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              v38 = v9;
              _os_log_debug_impl(&dword_215181000, v11, OS_LOG_TYPE_DEBUG, "Unpublish controller: '%@'", buf, 0xCu);
            }

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "removeObject:", v9);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "removeObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      v6 = v12;
    }
    while (v12);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = *(id *)(a1 + 32);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v29;
    *(_QWORD *)&v15 = 138412290;
    v27 = v15;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v18);
        objc_msgSend(v19, "identifier", v27, (_QWORD)v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "member:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        isInternalBuild = gc_isInternalBuild();
        if (v21)
        {
          if (isInternalBuild)
          {
            getGCLogger();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              v38 = v20;
              _os_log_debug_impl(&dword_215181000, v23, OS_LOG_TYPE_DEBUG, "Update controller: '%@'", buf, 0xCu);
            }

          }
        }
        else
        {
          if (isInternalBuild)
          {
            getGCLogger();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              v38 = v20;
              _os_log_debug_impl(&dword_215181000, v24, OS_LOG_TYPE_DEBUG, "Publish controller: '%@'", buf, 0xCu);
            }

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "addObject:", v20);
        }
        objc_msgSend(*(id *)(a1 + 40), "_onqueue_addPendingController:", v19);

        ++v18;
      }
      while (v16 != v18);
      v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      v16 = v25;
    }
    while (v25);
  }

  objc_msgSend(*(id *)(a1 + 40), "_onqueue_refreshPublishedControllers");
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_1(&dword_215181000, v0, v1, "Game Controller daemon connection invalidated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_134_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_1(&dword_215181000, v0, v1, "Game Controller daemon connection interrupted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Could not connect to 'controller service' on connection %@: %@");
  OUTLINED_FUNCTION_2_16();
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_138_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Could not connect to 'player indicator XPC proxy service' on connection %@: %@");
  OUTLINED_FUNCTION_2_16();
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_141_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Could not connect to 'light XPC proxy service' on connection %@: %@");
  OUTLINED_FUNCTION_2_16();
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_144_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Could not connect to 'adaptive triggers XPC proxy service' on connection %@: %@");
  OUTLINED_FUNCTION_2_16();
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_147_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Could not connect to 'motion XPC proxy service' on connection %@: %@");
  OUTLINED_FUNCTION_2_16();
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_150_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Could not connect to 'battery XPC proxy service' on connection %@: %@");
  OUTLINED_FUNCTION_2_16();
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_153_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Could not connect to 'settings XPC proxy service' on connection %@: %@");
  OUTLINED_FUNCTION_2_16();
}

void __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_4(&dword_215181000, v0, v1, "Start of video recording session has failed, reason: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_16();
}

void __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_184_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_4(&dword_215181000, v0, v1, "onVideoRecordingStart has failed, reason: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_16();
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Cannot consume extension token: %@ for url: %@");
  OUTLINED_FUNCTION_2_16();
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_1(&dword_215181000, v0, v1, "Daemon couldn't generate a valid URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_191_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "Stop of video recording session with url %@ has failed, reason: %@");
  OUTLINED_FUNCTION_2_16();
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_192_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_18(&dword_215181000, v0, v1, "onVideoRecordingStopWithURL: %@ has failed, reason: %@");
  OUTLINED_FUNCTION_2_16();
}

void __47___GCControllerManagerAppClient_startBuffering__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_4(&dword_215181000, v0, v1, "Clip Buffering start failed with: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_16();
}

void __46___GCControllerManagerAppClient_stopBuffering__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_4(&dword_215181000, v0, v1, "Clip buffering stop failed with: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_16();
}

void __69___GCControllerManagerAppClient_onScreenshotTriggeredWithController___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_4(&dword_215181000, v0, v1, "Cannot take screenshot: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_16();
}

@end
