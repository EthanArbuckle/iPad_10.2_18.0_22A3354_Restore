@implementation AVConferencePreview

id __37__AVConferencePreview_localCameraUID__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 144);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BYTE v26[20];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 | objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = 136316162;
          v20 = v16;
          v21 = 2080;
          v22 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          v23 = 1024;
          v24 = 557;
          v25 = 2112;
          *(_QWORD *)v26 = v5;
          *(_WORD *)&v26[8] = 2048;
          *(_QWORD *)&v26[10] = v18;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) previewDidLocalVideoSlotChange failed", (uint8_t *)&v19, 0x30u);
        }
      }
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoSlotNumber"));
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoSlotFacing"));
    v8 = objc_msgSend(v7, "BOOLValue");
    v9 = 32;
    if (v8)
      v9 = 24;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v9);
    if (v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136316418;
          v20 = v11;
          v21 = 2080;
          v22 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          v23 = 1024;
          v24 = 564;
          v25 = 1024;
          *(_DWORD *)v26 = objc_msgSend(v6, "intValue");
          *(_WORD *)&v26[4] = 2048;
          *(_QWORD *)&v26[6] = v10;
          *(_WORD *)&v26[14] = 1024;
          *(_DWORD *)&v26[16] = objc_msgSend(v7, "BOOLValue");
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidLocalVideoSlotChange: Received slot %u for layer %p facing %d", (uint8_t *)&v19, 0x32u);
        }
      }
      v13 = objc_msgSend(v7, "BOOLValue");
      v14 = *(char **)(a1 + 32);
      v15 = 48;
      if (v13)
        v15 = 40;
      if (*(_QWORD *)&v14[v15])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_cold_2();
        }
      }
      else
      {
        objc_msgSend(v14, "connectLayer:withSlot:", v10, objc_msgSend(v6, "unsignedIntValue"));
      }
    }
  }
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  VideoAttributes *v6;

  if (!(a3 | objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"))))
  {
    v6 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localVideoAttributes")));
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v6;

    objc_msgSend(*(id *)(a1 + 32), "didChangeLocalVideoAttributes:", v6);
  }
}

uint64_t __53__AVConferencePreview_didChangeLocalVideoAttributes___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        v7 = 136316162;
        v8 = v3;
        v9 = 2080;
        v10 = "-[AVConferencePreview didChangeLocalVideoAttributes:]_block_invoke";
        v11 = 1024;
        v12 = 226;
        v13 = 2048;
        v14 = v5;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d (%p) videoAttributes=%@", (uint8_t *)&v7, 0x30u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "didChangeLocalVideoAttributes:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)didChangeLocalVideoAttributes:(id)a3
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVConferencePreview_didChangeLocalVideoAttributes___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

- (id)localCameraUID
{
  NSObject *avConferencePreviewQueue;
  void *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__32;
  v10 = __Block_byref_object_dispose__32;
  v11 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AVConferencePreview_localCameraUID__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(avConferencePreviewQueue, block);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)AVConferencePreviewSingleton
{
  void *v3;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  if (!_avConferencePreviewSingleton)
    _avConferencePreviewSingleton = (uint64_t)objc_alloc_init((Class)a1);
  objc_sync_exit(v3);
  return (id)_avConferencePreviewSingleton;
}

- (AVConferencePreview)init
{
  AVConferencePreview *v2;
  NSObject *CustomRootQueue;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  VideoAttributes *v8;
  int ErrorLogLevelForModule;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 isPreviewRunning;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  AVConferencePreview *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)AVConferencePreview;
  v2 = -[AVConferencePreview init](&v21, sel_init);
  if (v2)
  {
    VRTraceReset();
    v2->clientWantsPreview = 0;
    v2->connectionAttempts = 0;
    v2->connection = (AVConferenceXPCClient *)+[AVConferenceXPCClient AVConferenceXPCClientSingleton](AVConferenceXPCClient, "AVConferenceXPCClientSingleton");
    v2->caLayerFront = 0;
    v2->caLayerBack = 0;
    -[AVConferencePreview cleanupPreviewLayerHost:](v2, "cleanupPreviewLayerHost:", &v2->_caLayerHostFront);
    -[AVConferencePreview cleanupPreviewLayerHost:](v2, "cleanupPreviewLayerHost:", &v2->_caLayerHostBack);
    v2->localVideoAttributes = 0;
    v2->localScreenPortraitAspectRatio = (CGSize)xmmword_1D910F690;
    v2->localScreenLandscapeAspectRatio = (CGSize)xmmword_1D910F6A0;
    v2->delegate = 0;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->avConferencePreviewQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.camera", 0, CustomRootQueue);
    v4 = VCDispatchQueue_GetCustomRootQueue(37);
    v2->avConferencePreviewNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.camera.notification", 0, v4);
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    v6 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("CACHEAUTHTOKEN"), 0);
    v7 = -[AVConferenceXPCClient sendMessageSync:arguments:](v2->connection, "sendMessageSync:arguments:", "previewInitialize", v6);
    if (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localVideoAttributes")))
      v8 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localVideoAttributes")));
    else
      v8 = objc_alloc_init(VideoAttributes);
    v2->localVideoAttributes = v8;
    v2->_isPreviewRunning = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("previewState")), "BOOLValue");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v10 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        isPreviewRunning = v2->_isPreviewRunning;
        *(_DWORD *)buf = 136315906;
        v23 = v11;
        v24 = 2080;
        v25 = "-[AVConferencePreview init]";
        v26 = 1024;
        v27 = 727;
        v28 = 1024;
        LODWORD(v29) = isPreviewRunning;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d _isPreviewRunning=%d", buf, 0x22u);
      }
    }
    v2->_localCameraUID = (NSString *)(id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localCameraUIDString"));

    -[AVConferencePreview registerBlocksForDelegateNotifications](v2, "registerBlocksForDelegateNotifications");
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = v14;
        v24 = 2080;
        v25 = "-[AVConferencePreview init]";
        v26 = 1024;
        v27 = 741;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d VICEROY_FEATURE_CINEMATICFRAMING", buf, 0x1Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v23 = v16;
        v24 = 2080;
        v25 = "-[AVConferencePreview init]";
        v26 = 1024;
        v27 = 743;
        v28 = 2048;
        v29 = v2;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Done initialization of singleton %p", buf, 0x26u);
      }
    }
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v23 = v18;
        v24 = 2080;
        v25 = "-[AVConferencePreview init]";
        v26 = 1024;
        v27 = 745;
        v28 = 2048;
        v29 = v2;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-init (%p)", buf, 0x26u);
      }
    }
  }
  return v2;
}

void __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  int8x16_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  int8x16_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRootPreviewLayer:front:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v2, CFSTR("videoSlotFacing"), 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = *(_BYTE *)(a1 + 48);
  v5 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  v8[1] = 3221225472;
  v8[2] = __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke_2;
  v8[3] = &unk_1E9E57758;
  v10 = v4;
  v9 = v5;
  objc_msgSend(v7, "sendMessageAsync:arguments:reply:queue:", "previewGetLocalVideoSlot", v3, v8, *(_QWORD *)(v6 + 104));

}

void __35__AVConferencePreview_startPreview__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v2 = objc_alloc(MEMORY[0x1E0C99D80]);
  v3 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("CACHEAUTHTOKEN"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewStartPreview", v3, 0);

}

uint64_t __50__AVConferencePreview_setCinematicFramingEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("previewCameraCinematicFraming");
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4[1] = CFSTR("previewCameraCinematicFramingSet");
  v5[0] = v2;
  v5[1] = MEMORY[0x1E0C9AAB0];
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewCameraCinematicFraming", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2), 0);
}

void __47__AVConferencePreview_setLocalVideoAttributes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(id *)(a1 + 40);

  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copyEncodedDictionary");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("localVideoAttributes"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewSetLocalVideoAttributes", v3, 0);

}

- (void)registerBlocksForDelegateNotifications
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke;
  v20[3] = &unk_1E9E52730;
  v20[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:](self->connection, "registerBlockForService:block:", "previewDidReceiveFirstFrame", v20);
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_77;
  v19[3] = &unk_1E9E52730;
  v19[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewCameraUIDChanged", v19, self->avConferencePreviewQueue);
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_79;
  v18[3] = &unk_1E9E52730;
  v18[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewDidStart", v18, self->avConferencePreviewQueue);
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_83;
  v17[3] = &unk_1E9E52730;
  v17[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewDidPause", v17, self->avConferencePreviewQueue);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_85;
  v16[3] = &unk_1E9E52730;
  v16[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewDidStop", v16, self->avConferencePreviewQueue);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_87;
  v15[3] = &unk_1E9E52730;
  v15[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewDidGetSnapShot", v15, self->avConferencePreviewQueue);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_2;
  v14[3] = &unk_1E9E52730;
  v14[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewDidLocalVideoAttributesChange", v14, self->avConferencePreviewQueue);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_3;
  v13[3] = &unk_1E9E52730;
  v13[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:](self->connection, "registerBlockForService:block:", "previewDidLocalScreenAttributesChange", v13);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_4;
  v12[3] = &unk_1E9E52730;
  v12[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:](self->connection, "registerBlockForService:block:", "previewDidReceiveCameraError", v12);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5;
  v11[3] = &unk_1E9E52730;
  v11[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewDidLocalVideoSlotChange", v11, self->avConferencePreviewQueue);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_102;
  v10[3] = &unk_1E9E52730;
  v10[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewDidLocalVideoContextChange", v10, self->avConferencePreviewQueue);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_106;
  v9[3] = &unk_1E9E52730;
  v9[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:](self->connection, "registerBlockForService:block:", "previewCameraDidBecomeAvailable", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_2_108;
  v8[3] = &unk_1E9E52730;
  v8[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:](self->connection, "registerBlockForService:block:", "previewCameraDidBecomeInterrupted", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_3_112;
  v7[3] = &unk_1E9E52730;
  v7[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewCameraZoomAvailablilty", v7, self->avConferencePreviewQueue);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_4_118;
  v6[3] = &unk_1E9E52730;
  v6[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewCameraCinematicFramingAvailablilty", v6, self->avConferencePreviewQueue);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_122;
  v5[3] = &unk_1E9E52730;
  v5[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "updatePreviewState", v5, self->avConferencePreviewQueue);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_126;
  v4[3] = &unk_1E9E52730;
  v4[4] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->connection, "registerBlockForService:block:queue:", "previewFollowSystemCameraDidChange", v4, self->avConferencePreviewQueue);
}

- (id)localVideoAttributes
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__32;
  v14 = __Block_byref_object_dispose__32;
  v15 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__AVConferencePreview_localVideoAttributes__block_invoke;
  v9[3] = &unk_1E9E52938;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)v11[5];
      if (v5)
        v6 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v6 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v17 = v3;
      v18 = 2080;
      v19 = "-[AVConferencePreview localVideoAttributes]";
      v20 = 1024;
      v21 = 1337;
      v22 = 2080;
      v23 = v6;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Returning %s", buf, 0x26u);
    }
  }
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)setLocalVideoAttributes:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *avConferencePreviewQueue;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v11 = v5;
      v12 = 2080;
      v13 = "-[AVConferencePreview setLocalVideoAttributes:]";
      v14 = 1024;
      v15 = 1297;
      v16 = 2080;
      v17 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d videoAttrs=%s", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__AVConferencePreview_setLocalVideoAttributes___block_invoke;
  v9[3] = &unk_1E9E52238;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(avConferencePreviewQueue, v9);
}

VideoAttributes *__43__AVConferencePreview_localVideoAttributes__block_invoke(uint64_t a1)
{
  VideoAttributes *result;

  result = +[VideoAttributes videoAttributesWithVideoAttributes:](VideoAttributes, "videoAttributesWithVideoAttributes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke_2_cold_1();
    }
  }
  else
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoSlotNumber"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(void **)(a1 + 32);
        v8 = objc_msgSend(v7, "name");
        v9 = *(unsigned __int8 *)(a1 + 48);
        v10 = 136316674;
        v11 = v5;
        v12 = 2080;
        v13 = "-[AVConferencePreview setLocalVideoLayer:front:]_block_invoke_2";
        v14 = 1024;
        v15 = 970;
        v16 = 2112;
        v17 = v4;
        v18 = 2048;
        v19 = v7;
        v20 = 2112;
        v21 = v8;
        v22 = 1024;
        v23 = v9;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Received slot %@ for layer %p named \"%@\" facing %d", (uint8_t *)&v10, 0x40u);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "connectLayer:withSlot:", *(_QWORD *)(a1 + 32), objc_msgSend(v4, "unsignedIntValue"));
  }
}

uint64_t ___AVConferencePreview_DidReceiveFirstPreviewFrameFromCamera_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = +[VideoAttributes videoAttributeCameraForCameraUID:](VideoAttributes, "videoAttributeCameraForCameraUID:", *(_QWORD *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-didReceiveFirstPreviewFrameFromCamera");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v5 = *(_QWORD *)(a1 + 40);
        v12 = 136316162;
        v13 = v3;
        v14 = 2080;
        v15 = "_AVConferencePreview_DidReceiveFirstPreviewFrameFromCamera_block_invoke";
        v16 = 1024;
        v17 = 202;
        v18 = 2048;
        v19 = v5;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didReceiveFirstPreviewFrameFromCamera (%p) cameraUID=%@", (uint8_t *)&v12, 0x30u);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "didReceiveFirstPreviewFrameFromCamera:", v2);
  }
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-didReceiveFirstPreviewFrameFromCameraUniqueID");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v12 = 136316162;
        v13 = v8;
        v14 = 2080;
        v15 = "_AVConferencePreview_DidReceiveFirstPreviewFrameFromCamera_block_invoke";
        v16 = 1024;
        v17 = 206;
        v18 = 2048;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didReceiveFirstPreviewFrameFromCameraUniqueID (%p) cameraUID=%@", (uint8_t *)&v12, 0x30u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "didReceiveFirstPreviewFrameFromCameraUniqueID:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

- (void)connectLayer:(id)a3 withSlot:(unsigned int)a4
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  unsigned int v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BYTE v20[14];
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__AVConferencePreview_connectLayer_withSlot___block_invoke;
    v11[3] = &unk_1E9E52300;
    v11[4] = a3;
    v12 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], v11);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(a3, "name");
        *(_DWORD *)buf = 136316418;
        v14 = v6;
        v15 = 2080;
        v16 = "-[AVConferencePreview connectLayer:withSlot:]";
        v17 = 1024;
        v18 = 348;
        v19 = 1024;
        *(_DWORD *)v20 = a4;
        *(_WORD *)&v20[4] = 2048;
        *(_QWORD *)&v20[6] = a3;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Connected slot %u to layer %p named \"%@\", buf, 0x36u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v14 = v9;
      v15 = 2080;
      v16 = "-[AVConferencePreview connectLayer:withSlot:]";
      v17 = 1024;
      v18 = 335;
      v19 = 2048;
      *(_QWORD *)v20 = a3;
      *(_WORD *)&v20[8] = 1024;
      *(_DWORD *)&v20[10] = a4;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d Invalid layer or slot: layer=%p, slot=%u", buf, 0x2Cu);
    }
  }
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *avConferencePreviewQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AVConferencePreview_setCinematicFramingEnabled___block_invoke;
  v7[3] = &unk_1E9E521E8;
  v8 = a3;
  v7[4] = self;
  dispatch_async(avConferencePreviewQueue, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVConferencePreview setCinematicFramingEnabled:]";
      v13 = 1024;
      v14 = 1551;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d enabled=%d", buf, 0x22u);
    }
  }
}

- (void)startPreview
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *avConferencePreviewQueue;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVConferencePreview *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVConferencePreview startPreview]";
      v15 = 1024;
      v16 = 804;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=%p", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVConferencePreview_startPreview__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-startPreview");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v8;
      v13 = 2080;
      v14 = "-[AVConferencePreview startPreview]";
      v15 = 1024;
      v16 = 824;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-startPreview (%p)", buf, 0x26u);
    }
  }
}

- (void)cameraZoomAvailabilityDidChange:(BOOL)a3 currentZoomFactor:(double)a4 maxZoomFactor:(double)a5
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[7];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__AVConferencePreview_cameraZoomAvailabilityDidChange_currentZoomFactor_maxZoomFactor___block_invoke;
  block[3] = &unk_1E9E57730;
  v7 = a3;
  block[4] = self;
  *(double *)&block[5] = a4;
  *(double *)&block[6] = a5;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

uint64_t __38__AVConferencePreview_didStartPreview__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-didStartPreview");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 136315906;
        v7 = v3;
        v8 = 2080;
        v9 = "-[AVConferencePreview didStartPreview]_block_invoke";
        v10 = 1024;
        v11 = 167;
        v12 = 2048;
        v13 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didStartPreview (%p)", (uint8_t *)&v6, 0x26u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "didStartPreview");
  }
  return result;
}

- (void)didStartPreview
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__AVConferencePreview_didStartPreview__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, v3);
  VCPacketFilterGetCMBaseObject("didStartPreview", 2);
}

void __87__AVConferencePreview_cameraZoomAvailabilityDidChange_currentZoomFactor_maxZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 56);
      v7 = 136315906;
      v8 = v2;
      v9 = 2080;
      v10 = "-[AVConferencePreview cameraZoomAvailabilityDidChange:currentZoomFactor:maxZoomFactor:]_block_invoke";
      v11 = 1024;
      v12 = 294;
      v13 = 1024;
      v14 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d zoomAvailabilty=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "cameraZoomAvailabilityDidChange:currentZoomFactor:maxZoomFactor:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "cameraZoomAvailabilityDidChange:", *(unsigned __int8 *)(a1 + 56));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVConferencePreview cameraZoomAvailabilityDidChange:currentZoomFactor:maxZoomFactor:]_block_invoke";
      v11 = 1024;
      v12 = 300;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Delegate does not respond to cameraZoomAvailabilityDidChange:", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)setLocalVideoLayer:(id)a3 front:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSObject *v8;
  NSObject *avConferencePreviewQueue;
  _QWORD block[6];
  BOOL v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v13 = v7;
      v14 = 2080;
      v15 = "-[AVConferencePreview setLocalVideoLayer:front:]";
      v16 = 1024;
      v17 = 951;
      v18 = 2048;
      v19 = a3;
      v20 = 1024;
      v21 = v4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d layer=%p, front=%d", buf, 0x2Cu);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke;
  block[3] = &unk_1E9E52210;
  block[4] = self;
  block[5] = a3;
  v11 = v4;
  dispatch_async(avConferencePreviewQueue, block);
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  dispatch_time_t v11;
  NSObject *current_queue;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[5];
  _BYTE buf[24];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    objc_msgSend(*(id *)(a1 + 32), "didReceiveCommError");
    objc_msgSend(*(id *)(a1 + 32), "didStopPreview");
    LODWORD(v6) = ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
    if ((double)v6 + (double)v6 > 10.0)
      v7 = 10.0;
    else
      v7 = 2.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v18) = 409;
        WORD2(v18) = 2048;
        *(double *)((char *)&v18 + 6) = v7;
        HIWORD(v18) = 1024;
        LODWORD(v19) = v10;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidReceiveFirstFrame: Retrying connection to server in %g seconds, connection attempts %u", buf, 0x2Cu);
      }
    }
    v11 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    current_queue = dispatch_get_current_queue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_66;
    block[3] = &unk_1E9E521C0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v11, current_queue, block);
  }
  else if (!a3)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 0;
    v13 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localCameraUIDString"));
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      v15 = *(NSObject **)(v14 + 112);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___AVConferencePreview_DidReceiveFirstPreviewFrameFromCamera_block_invoke;
      *(_QWORD *)&v18 = &unk_1E9E52238;
      *((_QWORD *)&v18 + 1) = v13;
      v19 = v14;
      dispatch_async(v15, buf);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_cold_1();
    }
  }
}

- (void)setDelegate:(id)a3
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVConferencePreview_setDelegate___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

- (AVConferencePreviewClientDelegate)delegate
{
  NSObject *avConferencePreviewNotificationQueue;
  AVConferencePreviewClientDelegate *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__32;
  v10 = __Block_byref_object_dispose__32;
  v11 = 0;
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AVConferencePreview_delegate__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(avConferencePreviewNotificationQueue, block);
  v3 = (AVConferencePreviewClientDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __31__AVConferencePreview_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __35__AVConferencePreview_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  SEL *p_name;
  NSString *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  objc_method_description *v18;
  unsigned int outCount;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[28];
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(id *)(a1 + 40);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v8 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316674;
      v21 = v2;
      v22 = 2080;
      v23 = "-[AVConferencePreview setDelegate:]_block_invoke";
      v24 = 1024;
      v25 = 156;
      v26 = 2048;
      *(_QWORD *)v27 = v4;
      *(_WORD *)&v27[8] = 2112;
      *(_QWORD *)&v27[10] = v6;
      *(_WORD *)&v27[18] = 2048;
      *(_QWORD *)&v27[20] = v7;
      v28 = 2112;
      v29 = NSStringFromClass(v8);
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=%p (%@), delegate=%p (%@)", buf, 0x44u);
    }
  }
  outCount = 0;
  v18 = protocol_copyMethodDescriptionList((Protocol *)&unk_1F023CC50, 0, 1, &outCount);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = v9;
      v22 = 2080;
      v23 = "-[AVConferencePreview setDelegate:]_block_invoke";
      v24 = 1024;
      v25 = 156;
      v26 = 1024;
      *(_DWORD *)v27 = outCount;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Protocol AVConferencePreviewClientDelegate contains %u optional methods.", buf, 0x22u);
    }
  }
  if (outCount)
  {
    v11 = 0;
    p_name = &v18->name;
    do
    {
      v13 = NSStringFromSelector(*p_name);
      NSSelectorFromString(v13);
      v14 = objc_opt_respondsToSelector();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v17 = "does NOT respond";
          if ((v14 & 1) != 0)
            v17 = "responds";
          v21 = v15;
          v22 = 2080;
          v23 = "-[AVConferencePreview setDelegate:]_block_invoke";
          v24 = 1024;
          v25 = 156;
          v26 = 1024;
          *(_DWORD *)v27 = v11;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = v17;
          *(_WORD *)&v27[14] = 2112;
          *(_QWORD *)&v27[16] = v13;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d %u: Delegate %s to \"%@\", buf, 0x36u);
        }
      }
      ++v11;
      p_name += 2;
    }
    while (v11 < outCount);
  }
  free(v18);
}

- (void)didPausePreview
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__AVConferencePreview_didPausePreview__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, v3);
}

uint64_t __38__AVConferencePreview_didPausePreview__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-didPausePreview");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 136315906;
        v7 = v3;
        v8 = 2080;
        v9 = "-[AVConferencePreview didPausePreview]_block_invoke";
        v10 = 1024;
        v11 = 178;
        v12 = 2048;
        v13 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didPausePreview (%p)", (uint8_t *)&v6, 0x26u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "didPausePreview");
  }
  return result;
}

- (void)didStopPreview
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__AVConferencePreview_didStopPreview__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, v3);
  VCPacketFilterGetCMBaseObject("didStopPreview", 2);
}

uint64_t __37__AVConferencePreview_didStopPreview__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-didStopPreview");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 136315906;
        v7 = v3;
        v8 = 2080;
        v9 = "-[AVConferencePreview didStopPreview]_block_invoke";
        v10 = 1024;
        v11 = 187;
        v12 = 2048;
        v13 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didStopPreview (%p)", (uint8_t *)&v6, 0x26u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "didStopPreview");
  }
  return result;
}

- (void)didChangeLocalCameraUID:(id)a3
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVConferencePreview_didChangeLocalCameraUID___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

uint64_t __47__AVConferencePreview_didChangeLocalCameraUID___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        v7 = 136316162;
        v8 = v3;
        v9 = 2080;
        v10 = "-[AVConferencePreview didChangeLocalCameraUID:]_block_invoke";
        v11 = 1024;
        v12 = 217;
        v13 = 2048;
        v14 = v5;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=[%p] cameraUID=%@", (uint8_t *)&v7, 0x30u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "didChangeLocalCameraUID:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)didChangeLocalScreenAttributes:(id)a3
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVConferencePreview_didChangeLocalScreenAttributes___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

uint64_t __54__AVConferencePreview_didChangeLocalScreenAttributes___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        v7 = 136316162;
        v8 = v3;
        v9 = 2080;
        v10 = "-[AVConferencePreview didChangeLocalScreenAttributes:]_block_invoke";
        v11 = 1024;
        v12 = 235;
        v13 = 2048;
        v14 = v5;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d (%p) screenAttributes=%@", (uint8_t *)&v7, 0x30u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "didChangeLocalScreenAttributes:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVConferencePreview_didReceiveErrorFromCameraUniqueID_error___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(avConferencePreviewNotificationQueue, v5);
}

uint64_t __63__AVConferencePreview_didReceiveErrorFromCameraUniqueID_error___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v4 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        __63__AVConferencePreview_didReceiveErrorFromCameraUniqueID_error___block_invoke_cold_1(v5, (uint64_t)a1, v6);
    }
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-didReceiveErrorFromCamera");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v9 = a1[4];
        v10 = a1[5];
        v11 = a1[6];
        v12 = 136316418;
        v13 = v7;
        v14 = 2080;
        v15 = "-[AVConferencePreview didReceiveErrorFromCameraUniqueID:error:]_block_invoke";
        v16 = 1024;
        v17 = 245;
        v18 = 2048;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-didReceiveErrorFromCamera (%p) cameraUID=%@, error=%@", (uint8_t *)&v12, 0x3Au);
      }
    }
    return objc_msgSend(*(id *)(a1[4] + 96), "didReceiveErrorFromCameraUniqueID:error:", a1[5], a1[6]);
  }
  return result;
}

- (void)didReceiveCommError
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__AVConferencePreview_didReceiveCommError__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, v3);
}

uint64_t __42__AVConferencePreview_didReceiveCommError__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "didReceiveCommError");
  return result;
}

- (void)didGetSnapshot:(id)a3
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVConferencePreview_didGetSnapshot___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

void __38__AVConferencePreview_didGetSnapshot___block_invoke(uint64_t a1)
{
  char v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_respondsToSelector();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((v2 & 1) != 0)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315906;
        v7 = v4;
        v8 = 2080;
        v9 = "-[AVConferencePreview didGetSnapshot:]_block_invoke";
        v10 = 1024;
        v11 = 262;
        v12 = 2048;
        v13 = 8;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d size=%lu", (uint8_t *)&v6, 0x26u);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "didGetSnapshot:", *(_QWORD *)(a1 + 40));
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __38__AVConferencePreview_didGetSnapshot___block_invoke_cold_1();
  }
}

- (void)cameraDidBecomeAvailableForUniqueID:(id)a3
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVConferencePreview_cameraDidBecomeAvailableForUniqueID___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

void __59__AVConferencePreview_cameraDidBecomeAvailableForUniqueID___block_invoke(uint64_t a1)
{
  char v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_respondsToSelector();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((v2 & 1) != 0)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_msgSend(*(id *)(a1 + 40), "UTF8String");
        v7 = 136315906;
        v8 = v4;
        v9 = 2080;
        v10 = "-[AVConferencePreview cameraDidBecomeAvailableForUniqueID:]_block_invoke";
        v11 = 1024;
        v12 = 273;
        v13 = 2080;
        v14 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraUniqueID=%s", (uint8_t *)&v7, 0x26u);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "cameraDidBecomeAvailableForUniqueID:", *(_QWORD *)(a1 + 40));
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __59__AVConferencePreview_cameraDidBecomeAvailableForUniqueID___block_invoke_cold_1();
  }
}

- (void)cameraDidBecomeInterruptedForForUniqueID:(id)a3 reason:(int64_t)a4
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__AVConferencePreview_cameraDidBecomeInterruptedForForUniqueID_reason___block_invoke;
  v5[3] = &unk_1E9E53820;
  v5[5] = self;
  v5[6] = a4;
  v5[4] = a3;
  dispatch_async(avConferencePreviewNotificationQueue, v5);
}

void __71__AVConferencePreview_cameraDidBecomeInterruptedForForUniqueID_reason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "UTF8String");
      v5 = *(_QWORD *)(a1 + 48);
      v6 = 136316162;
      v7 = v2;
      v8 = 2080;
      v9 = "-[AVConferencePreview cameraDidBecomeInterruptedForForUniqueID:reason:]_block_invoke";
      v10 = 1024;
      v11 = 283;
      v12 = 2080;
      v13 = v4;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraUID=%s, reason=%d", (uint8_t *)&v6, 0x2Cu);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "cameraDidBecomeInterruptedForForUniqueID:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __71__AVConferencePreview_cameraDidBecomeInterruptedForForUniqueID_reason___block_invoke_cold_1();
  }
}

- (void)cameraCFramingAvailabilityDidChange:(BOOL)a3
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVConferencePreview_cameraCFramingAvailabilityDidChange___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

void __59__AVConferencePreview_cameraCFramingAvailabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 40);
      v7 = 136315906;
      v8 = v2;
      v9 = 2080;
      v10 = "-[AVConferencePreview cameraCFramingAvailabilityDidChange:]_block_invoke";
      v11 = 1024;
      v12 = 308;
      v13 = 1024;
      v14 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d availability=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "cameraCinematicFramingAvailabilityDidChange:", *(unsigned __int8 *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVConferencePreview cameraCFramingAvailabilityDidChange:]_block_invoke";
      v11 = 1024;
      v12 = 313;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Delegate does not respond to cameraCinematicFramingAvailabilityDidChange:", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)followSystemCameraDidChange:(BOOL)a3
{
  NSObject *avConferencePreviewNotificationQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  avConferencePreviewNotificationQueue = self->avConferencePreviewNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVConferencePreview_followSystemCameraDidChange___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_async(avConferencePreviewNotificationQueue, block);
}

void __51__AVConferencePreview_followSystemCameraDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 40);
      v7 = 136315906;
      v8 = v2;
      v9 = 2080;
      v10 = "-[AVConferencePreview followSystemCameraDidChange:]_block_invoke";
      v11 = 1024;
      v12 = 321;
      v13 = 1024;
      v14 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d enabled=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "followSystemCameraDidChange:", *(unsigned __int8 *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVConferencePreview followSystemCameraDidChange:]_block_invoke";
      v11 = 1024;
      v12 = 325;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Delegate does not respond to followSystemCameraDidChange:", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

uint64_t __45__AVConferencePreview_connectLayer_withSlot___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "setContents:", objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", *(unsigned int *)(a1 + 40)));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)connectLayer:(id)a3 layerHost:(id)a4 withContextId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  int v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = *(_QWORD *)&a5;
    if ((id)objc_msgSend(a4, "superlayer") == a3)
    {
      if (objc_msgSend(a4, "contextId") != (_DWORD)v5)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __60__AVConferencePreview_connectLayer_layerHost_withContextId___block_invoke;
        v11[3] = &unk_1E9E52300;
        v11[4] = a4;
        v12 = v5;
        dispatch_async(MEMORY[0x1E0C80D38], v11);
      }
    }
    else
    {
      -[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:](self, "createPreviewCALayerHostForRootLayer:withContextId:front:", a3, v5, self->_caLayerHostFront == a4);
    }
    objc_msgSend(a3, "bounds");
    -[AVConferencePreview setBounds:forLayerHost:](self, "setBounds:forLayerHost:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v14 = v9;
        v15 = 2080;
        v16 = "-[AVConferencePreview connectLayer:layerHost:withContextId:]";
        v17 = 1024;
        v18 = 368;
        v19 = 1024;
        v20 = v5;
        v21 = 2048;
        v22 = a3;
        v23 = 2048;
        v24 = a4;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Connected contextId=%u to layer=%p layerHost=%p", buf, 0x36u);
      }
    }
  }
}

uint64_t __60__AVConferencePreview_connectLayer_layerHost_withContextId___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setContextId:", *(unsigned int *)(a1 + 40));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)resetLayersAfterServerDisconnect
{
  if (self->caLayerFront)
  {
    if (self->_caLayerHostFront)
      -[AVConferencePreview setLocalVideoLayerHost:front:](self, "setLocalVideoLayerHost:front:");
    else
      -[AVConferencePreview setLocalVideoLayer:front:](self, "setLocalVideoLayer:front:");
  }
  if (self->caLayerBack)
  {
    if (self->_caLayerHostBack)
      -[AVConferencePreview setLocalVideoLayerHost:front:](self, "setLocalVideoLayerHost:front:");
    else
      -[AVConferencePreview setLocalVideoLayer:front:](self, "setLocalVideoLayer:front:");
  }
}

- (void)restartPreview
{
  NSObject *avConferencePreviewQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__AVConferencePreview_restartPreview__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(avConferencePreviewQueue, v3);
}

_BYTE *__37__AVConferencePreview_restartPreview__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[16])
    return (_BYTE *)objc_msgSend(result, "startPreview");
  return result;
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_66(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = v2;
      v11 = 2080;
      v12 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
      v13 = 1024;
      v14 = 418;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidReceiveFirstFrame: Sending re-connect message to server", buf, 0x1Cu);
    }
  }
  v4 = objc_alloc(MEMORY[0x1E0C99D80]);
  v5 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("CACHEAUTHTOKEN"), 0);
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageSync:arguments:", "previewInitialize", v5);
  if (!objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TIMEOUT"))
    && !objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v10 = v7;
        v11 = 2080;
        v12 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        v13 = 1024;
        v14 = 425;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidReceiveFirstFrame: Connected to server", buf, 0x1Cu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "resetLayersAfterServerDisconnect");
    objc_msgSend(*(id *)(a1 + 32), "resetLocalCameraAfterServerDisconnect");
    objc_msgSend(*(id *)(a1 + 32), "restartPreview");
  }

}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_77(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!(a3 | objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"))))
  {
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localCameraUIDString"));
    if (v5)
    {
      v6 = (void *)v5;

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = v6;
      objc_msgSend(*(id *)(a1 + 32), "didChangeLocalCameraUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
          v10 = 136315906;
          v11 = v7;
          v12 = 2080;
          v13 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          v14 = 1024;
          v15 = 456;
          v16 = 2112;
          v17 = v9;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewCameraUIDChanged: cameraUID = %@", (uint8_t *)&v10, 0x26u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_77_cold_1();
    }
  }
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_79(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  void *v7;
  int ErrorLogLevelForModule;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
  {
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoSlotNumber"));
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v9 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        v16 = 136316162;
        v17 = v10;
        v18 = 2080;
        v19 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        v20 = 1024;
        v21 = 470;
        v22 = 2112;
        v23 = v7;
        v24 = 2048;
        v25 = v12;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidStart: connect layer to preview slot %@ for layer %p", (uint8_t *)&v16, 0x30u);
      }
    }
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "connectLayer:withSlot:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), objc_msgSend(v7, "unsignedIntValue"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 120);
        v16 = 136315906;
        v17 = v13;
        v18 = 2080;
        v19 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        v20 = 1024;
        v21 = 476;
        v22 = 1024;
        LODWORD(v23) = v15;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidStart: _isPreviewRunning=%d", (uint8_t *)&v16, 0x22u);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "didStartPreview");
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_83(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 120);
        v9 = 136315906;
        v10 = v6;
        v11 = 2080;
        v12 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        v13 = 1024;
        v14 = 486;
        v15 = 1024;
        v16 = v8;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidPause: _isPreviewRunning=%d", (uint8_t *)&v9, 0x22u);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "didPausePreview");
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_85(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 120);
        v9 = 136315906;
        v10 = v6;
        v11 = 2080;
        v12 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
        v13 = 1024;
        v14 = 496;
        v15 = 1024;
        v16 = v8;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidStop: _isPreviewRunning=%d", (uint8_t *)&v9, 0x22u);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "didStopPreview");
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_87(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
    return objc_msgSend(*(id *)(a1 + 32), "didGetSnapshot:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("snapShotFrame")));
  return result;
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  VideoAttributes *v5;

  if (!(a3 | objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"))))
  {
    v5 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localVideoAttributes")));
    objc_msgSend(*(id *)(a1 + 32), "didChangeLocalScreenAttributes:", v5);

  }
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (!(a3 | objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"))))
  {
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localCameraUIDString"));
    v6 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newNSErrorFromNSDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceError")));
    objc_msgSend(*(id *)(a1 + 32), "didReceiveErrorFromCameraUniqueID:error:", v5, v6);

  }
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_102(uint64_t a1, void *a2, uint64_t a3)
{
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[20];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 | objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_102_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(a1 + 32);
          v20 = 136316162;
          v21 = v17;
          v22 = 2080;
          v23 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          v24 = 1024;
          v25 = 578;
          v26 = 2112;
          *(_QWORD *)v27 = v5;
          *(_WORD *)&v27[8] = 2048;
          *(_QWORD *)&v27[10] = v19;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) previewDidLocalVideoContextChange failed", (uint8_t *)&v20, 0x30u);
        }
      }
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoContextId"));
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoSlotFacing"));
    v8 = objc_msgSend(v7, "BOOLValue");
    v9 = 32;
    if (v8)
      v9 = 24;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v9);
    if (v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136316418;
          v21 = v11;
          v22 = 2080;
          v23 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke";
          v24 = 1024;
          v25 = 585;
          v26 = 1024;
          *(_DWORD *)v27 = objc_msgSend(v6, "intValue");
          *(_WORD *)&v27[4] = 2048;
          *(_QWORD *)&v27[6] = v10;
          *(_WORD *)&v27[14] = 1024;
          *(_DWORD *)&v27[16] = objc_msgSend(v7, "BOOLValue");
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d previewDidLocalVideoContextChange: Received context %u for layer %p facing %d", (uint8_t *)&v20, 0x32u);
        }
      }
      v13 = objc_msgSend(v7, "BOOLValue");
      v14 = *(char **)(a1 + 32);
      v15 = 48;
      if (v13)
        v15 = 40;
      v16 = *(_QWORD *)&v14[v15];
      if (v16)
      {
        objc_msgSend(v14, "connectLayer:layerHost:withContextId:", v10, v16, objc_msgSend(v6, "unsignedIntValue"));
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_102_cold_2();
      }
    }
  }
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_106(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraDidBecomeAvailableForUniqueID:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localCameraUIDString")));
    return objc_msgSend(*(id *)(a1 + 32), "restartPreview");
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_2_108(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
    return objc_msgSend(*(id *)(a1 + 32), "cameraDidBecomeInterruptedForForUniqueID:reason:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localCameraUIDString")), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewInterruptionReason")), "integerValue"));
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_3_112(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  float v7;
  float v8;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraZoomAvailabilty")), "BOOLValue");
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraZoomMaxFactor")), "floatValue");
    *(double *)(*(_QWORD *)(a1 + 32) + 128) = v7;
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraZoomMaxFactor")), "floatValue");
    *(double *)(*(_QWORD *)(a1 + 32) + 136) = v8;
    return objc_msgSend(*(id *)(a1 + 32), "cameraZoomAvailabilityDidChange:currentZoomFactor:maxZoomFactor:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121), *(double *)(*(_QWORD *)(a1 + 32) + 128), *(double *)(*(_QWORD *)(a1 + 32) + 136));
  }
  return result;
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_4_118(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 122) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraCinematicFraming")), "intValue") != 0;
    return objc_msgSend(*(id *)(a1 + 32), "cameraCFramingAvailabilityDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 122));
  }
  return result;
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_122(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!(a3 | objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"))))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewState")), "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 120);
        v8 = 136315906;
        v9 = v5;
        v10 = 2080;
        v11 = "-[AVConferencePreview registerBlocksForDelegateNotifications]_block_invoke_5";
        v12 = 1024;
        v13 = 640;
        v14 = 1024;
        v15 = v7;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d updatePreviewState: _isPreviewRunning=%d", (uint8_t *)&v8, 0x22u);
      }
    }
  }
}

uint64_t __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_126(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!(a3 | result))
    return objc_msgSend(*(id *)(a1 + 32), "followSystemCameraDidChange:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewFollowSystemCamera")), "BOOLValue"));
  return result;
}

- (void)deregisterBlocksForDelegateNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidReceiveFirstFrame");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewCameraUIDChanged");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidStart");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidPause");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidStop");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidGetSnapShot");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidLocalVideoAttributesChange");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidLocalScreenAttributesChange");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidReceiveCameraError");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidLocalVideoSlotChange");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewCameraDidBecomeAvailable");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewCameraDidBecomeInterrupted");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewCameraZoomAvailablilty");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewCameraCinematicFramingAvailablilty");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "updatePreviewState");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewFollowSystemCameraDidChange");
  -[AVConferenceXPCClient deregisterFromService:](self->connection, "deregisterFromService:", "previewDidLocalVideoContextChange");
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVConferencePreview *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];

  self->delegate = 0;
  dispatch_release((dispatch_object_t)self->avConferencePreviewQueue);
  dispatch_release((dispatch_object_t)self->avConferencePreviewNotificationQueue);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVConferencePreview dealloc]";
      v10 = 1024;
      v11 = 766;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-dealloc (%p)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVConferencePreview;
  -[AVConferencePreview dealloc](&v5, sel_dealloc);
}

- (AVConferencePreview)allocWithZone:(_NSZone *)a3
{
  return (AVConferencePreview *)_avConferencePreviewSingleton;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)startPreviewUnpausing:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVConferencePreview *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVConferencePreview startPreviewUnpausing:]";
      v11 = 1024;
      v12 = 829;
      v13 = 2048;
      v14 = self;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d !!Deprecating!! Client is recommanded to use startPreview instead. AVConferencePreview startPreviewUnpausing, self %p, unpause=%d.", (uint8_t *)&v7, 0x2Cu);
    }
  }
  -[AVConferencePreview startPreview](self, "startPreview");
}

- (void)pausePreview
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *avConferencePreviewQueue;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVConferencePreview *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVConferencePreview pausePreview]";
      v15 = 1024;
      v16 = 836;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=%p", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVConferencePreview_pausePreview__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-pausePreview");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v8;
      v13 = 2080;
      v14 = "-[AVConferencePreview pausePreview]";
      v15 = 1024;
      v16 = 850;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-pausePreview (%p)", buf, 0x26u);
    }
  }
}

uint64_t __35__AVConferencePreview_pausePreview__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewPausePreview", 0, 0);
}

- (void)stopPreview
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *avConferencePreviewQueue;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVConferencePreview *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVConferencePreview stopPreview]";
      v15 = 1024;
      v16 = 857;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d self=%p", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AVConferencePreview_stopPreview__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVConferencePreview-stopPreview");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v8;
      v13 = 2080;
      v14 = "-[AVConferencePreview stopPreview]";
      v15 = 1024;
      v16 = 872;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d @:@ AVConferencePreview-stopPreview (%p)", buf, 0x26u);
    }
  }
}

uint64_t __34__AVConferencePreview_stopPreview__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewStopPreview", 0, 0);
}

- (BOOL)isPreviewRunning
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__AVConferencePreview_isPreviewRunning__block_invoke;
  v9[3] = &unk_1E9E52938;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    v5 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *((unsigned __int8 *)v11 + 24);
        *(_DWORD *)buf = 136315906;
        v15 = v3;
        v16 = 2080;
        v17 = "-[AVConferencePreview isPreviewRunning]";
        v18 = 1024;
        v19 = 883;
        v20 = 1024;
        v21 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d _isPreviewRunning=%d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferencePreview isPreviewRunning].cold.1();
    }
  }
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __39__AVConferencePreview_isPreviewRunning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (BOOL)isCameraZoomAvailable
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__AVConferencePreview_isCameraZoomAvailable__block_invoke;
  v9[3] = &unk_1E9E52938;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    v5 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *((unsigned __int8 *)v11 + 24);
        *(_DWORD *)buf = 136315906;
        v15 = v3;
        v16 = 2080;
        v17 = "-[AVConferencePreview isCameraZoomAvailable]";
        v18 = 1024;
        v19 = 894;
        v20 = 1024;
        v21 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d returning %d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferencePreview isCameraZoomAvailable].cold.1();
    }
  }
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __44__AVConferencePreview_isCameraZoomAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 121);
  return result;
}

- (double)currentZoomFactor
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AVConferencePreview_currentZoomFactor__block_invoke;
  v9[3] = &unk_1E9E52938;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    v5 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *((_QWORD *)v11 + 3);
        *(_DWORD *)buf = 136315906;
        v15 = v3;
        v16 = 2080;
        v17 = "-[AVConferencePreview currentZoomFactor]";
        v18 = 1024;
        v19 = 905;
        v20 = 2048;
        v21 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d returning %f", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferencePreview currentZoomFactor].cold.1();
    }
  }
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

double __40__AVConferencePreview_currentZoomFactor__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 128);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)maxZoomFactor
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__AVConferencePreview_maxZoomFactor__block_invoke;
  v9[3] = &unk_1E9E52938;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(avConferencePreviewQueue, v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    v5 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *((_QWORD *)v11 + 3);
        *(_DWORD *)buf = 136315906;
        v15 = v3;
        v16 = 2080;
        v17 = "-[AVConferencePreview maxZoomFactor]";
        v18 = 1024;
        v19 = 916;
        v20 = 2048;
        v21 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d returning %f", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferencePreview maxZoomFactor].cold.1();
    }
  }
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

double __36__AVConferencePreview_maxZoomFactor__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 136);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)getSnapshot
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d ERROR: cannot get snapshot if preview is not running!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (BOOL)setRootPreviewLayer:(id)a3 front:(BOOL)a4
{
  uint64_t v5;
  id v6;
  _BOOL4 v7;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  CALayer *caLayerFront;
  CALayer *caLayerBack;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  CALayer *v21;
  CALayer *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BYTE v33[24];
  __int16 v34;
  CALayer *v35;
  __int16 v36;
  CALayer *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a4)
    v5 = 24;
  else
    v5 = 32;
  v6 = *(Class *)((char *)&self->super.isa + v5);
  if (v6 != a3)
  {
    v7 = a4;
    v9 = 48;
    if (a4)
      v9 = 40;
    -[AVConferencePreview cleanupPreviewLayerHost:](self, "cleanupPreviewLayerHost:", (char *)self + v9);
    v10 = *(Class *)((char *)&self->super.isa + v5);
    *(Class *)((char *)&self->super.isa + v5) = (Class)a3;

    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          caLayerFront = self->caLayerFront;
          caLayerBack = self->caLayerBack;
          v24 = 136316674;
          v25 = v12;
          v26 = 2080;
          v27 = "-[AVConferencePreview setRootPreviewLayer:front:]";
          v28 = 1024;
          v29 = 943;
          v30 = 2048;
          v31 = a3;
          v32 = 1024;
          *(_DWORD *)v33 = v7;
          *(_WORD *)&v33[4] = 2048;
          *(_QWORD *)&v33[6] = caLayerFront;
          *(_WORD *)&v33[14] = 2048;
          *(_QWORD *)&v33[16] = caLayerBack;
          v16 = "AVConferencePreview [%s] %s:%d rootLayer=%p front=%d caLayerFront=%p caLayerBack=%p ";
          v17 = v13;
          v18 = 64;
LABEL_17:
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v18);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->caLayerFront;
          v22 = self->caLayerBack;
          v24 = 136317186;
          v25 = v19;
          v26 = 2080;
          v27 = "-[AVConferencePreview setRootPreviewLayer:front:]";
          v28 = 1024;
          v29 = 943;
          v30 = 2112;
          v31 = (id)v11;
          v32 = 2048;
          *(_QWORD *)v33 = self;
          *(_WORD *)&v33[8] = 2048;
          *(_QWORD *)&v33[10] = a3;
          *(_WORD *)&v33[18] = 1024;
          *(_DWORD *)&v33[20] = v7;
          v34 = 2048;
          v35 = v21;
          v36 = 2048;
          v37 = v22;
          v16 = "AVConferencePreview [%s] %s:%d %@(%p) rootLayer=%p front=%d caLayerFront=%p caLayerBack=%p ";
          v17 = v20;
          v18 = 84;
          goto LABEL_17;
        }
      }
    }
  }
  return v6 != a3;
}

- (id)localVideoLayer:(BOOL)a3
{
  NSObject *avConferencePreviewQueue;
  void *v4;
  _QWORD v6[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__32;
  v12 = __Block_byref_object_dispose__32;
  v13 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__AVConferencePreview_localVideoLayer___block_invoke;
  v6[3] = &unk_1E9E56258;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(avConferencePreviewQueue, v6);
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __39__AVConferencePreview_localVideoLayer___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = 24;
  if (!*(_BYTE *)(result + 48))
    v1 = 32;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + v1);
  return result;
}

- (id)newXPCObjectForFenceHandle:(id *)a3 forLayerHost:(id)a4
{
  void *v7;
  id result;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_5;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CD2778], "newFenceFromDefaultServer");
  *a3 = v7;
  if (v7)
  {
    if ((objc_msgSend((id)objc_msgSend(a4, "context"), "addFence:", *a3) & 1) != 0)
    {
      result = (id)objc_msgSend(*a3, "createXPCRepresentation");
      if (result)
        return result;
      goto LABEL_5;
    }
    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_5;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v13 = (const __CFString *)*a3;
      v22 = 136316418;
      v23 = v11;
      v24 = 2080;
      v25 = "-[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:]";
      v26 = 1024;
      v27 = 1038;
      v28 = 2048;
      v29 = v13;
      v30 = 2048;
      v31 = a4;
      v32 = 2048;
      v33 = objc_msgSend(a4, "context");
      v14 = "AVConferencePreview [%s] %s:%d Failed to add fence=%p for layer=%p with context=%p";
      v15 = v12;
      v16 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_5;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v21 = *a3;
      v22 = 136316930;
      v23 = v19;
      v24 = 2080;
      v25 = "-[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:]";
      v26 = 1024;
      v27 = 1038;
      v28 = 2112;
      v29 = v10;
      v30 = 2048;
      v31 = self;
      v32 = 2048;
      v33 = (uint64_t)v21;
      v34 = 2048;
      v35 = a4;
      v36 = 2048;
      v37 = objc_msgSend(a4, "context");
      v14 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to add fence=%p for layer=%p with context=%p";
      v15 = v20;
      v16 = 78;
    }
    goto LABEL_28;
  }
  if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:].cold.1();
    }
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v9 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v22 = 136316162;
      v23 = v17;
      v24 = 2080;
      v25 = "-[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:]";
      v26 = 1024;
      v27 = 1035;
      v28 = 2112;
      v29 = v9;
      v30 = 2048;
      v31 = self;
      v14 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to create new fence";
      v15 = v18;
      v16 = 48;
LABEL_28:
      _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v22, v16);
    }
  }
LABEL_5:
  result = *a3;
  if (*a3)
  {
    objc_msgSend(result, "invalidate");

    result = 0;
    *a3 = 0;
  }
  return result;
}

- (void)setBounds:(CGRect)a3 forLayerHost:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVCPreviewCALayerHost *caLayerHostFront;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSString *v14;
  CALayer *caLayerFront;
  CALayer *caLayerBack;
  AVCPreviewCALayerHost *v17;
  AVCPreviewCALayerHost *caLayerHostBack;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  NSString *v24;
  CALayer *v25;
  CALayer *v26;
  AVCPreviewCALayerHost *v27;
  AVCPreviewCALayerHost *v28;
  NSString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  NSString *v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  uint64_t v44;
  NSObject *v45;
  NSString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  id v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  CALayer *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  AVCPreviewCALayerHost *v74;
  __int16 v75;
  AVCPreviewCALayerHost *v76;
  __int16 v77;
  AVCPreviewCALayerHost *v78;
  __int16 v79;
  AVCPreviewCALayerHost *v80;
  __int16 v81;
  _BOOL4 v82;
  uint64_t v83;
  NSRect v84;
  NSRect v85;
  NSRect v86;
  NSRect v87;
  NSRect v88;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v83 = *MEMORY[0x1E0C80C00];
  caLayerHostFront = self->_caLayerHostFront;
  if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v84.origin.x = x;
        v84.origin.y = y;
        v84.size.width = width;
        v84.size.height = height;
        v14 = NSStringFromRect(v84);
        caLayerFront = self->caLayerFront;
        caLayerBack = self->caLayerBack;
        v17 = self->_caLayerHostFront;
        caLayerHostBack = self->_caLayerHostBack;
        *(_DWORD *)buf = 136317442;
        v60 = v12;
        v61 = 2080;
        v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
        v63 = 1024;
        v64 = 1054;
        v65 = 2112;
        v66 = (const __CFString *)v14;
        v67 = 2048;
        v68 = a4;
        v69 = 2048;
        v70 = caLayerFront;
        v71 = 2048;
        v72 = caLayerBack;
        v73 = 2048;
        v74 = v17;
        v75 = 2048;
        v76 = caLayerHostBack;
        v77 = 1024;
        LODWORD(v78) = caLayerHostFront == a4;
        v19 = "AVConferencePreview [%s] %s:%d bounds=%@ layerHost=%p caLayerFront=%p caLayerBack=%p caLayerHostFront=%p c"
              "aLayerHostBack=%p front=%d";
        v20 = v13;
        v21 = 94;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v85.origin.x = x;
        v85.origin.y = y;
        v85.size.width = width;
        v85.size.height = height;
        v24 = NSStringFromRect(v85);
        v25 = self->caLayerFront;
        v26 = self->caLayerBack;
        v27 = self->_caLayerHostFront;
        v28 = self->_caLayerHostBack;
        *(_DWORD *)buf = 136317954;
        v60 = v22;
        v61 = 2080;
        v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
        v63 = 1024;
        v64 = 1054;
        v65 = 2112;
        v66 = v11;
        v67 = 2048;
        v68 = self;
        v69 = 2112;
        v70 = (CALayer *)v24;
        v71 = 2048;
        v72 = a4;
        v73 = 2048;
        v74 = (AVCPreviewCALayerHost *)v25;
        v75 = 2048;
        v76 = (AVCPreviewCALayerHost *)v26;
        v77 = 2048;
        v78 = v27;
        v79 = 2048;
        v80 = v28;
        v81 = 1024;
        v82 = caLayerHostFront == a4;
        v19 = "AVConferencePreview [%s] %s:%d %@(%p) bounds=%@ layerHost=%p caLayerFront=%p caLayerBack=%p caLayerHostFro"
              "nt=%p caLayerHostBack=%p front=%d";
        v20 = v23;
        v21 = 114;
        goto LABEL_11;
      }
    }
  }
  if (VideoUtil_LayerBoundsAreValid(x, y, width, height))
  {
    v56 = 0;
    v86.origin.x = x;
    v86.origin.y = y;
    v86.size.width = width;
    v86.size.height = height;
    v29 = NSStringFromRect(v86);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", caLayerHostFront == a4);
    v31 = (void *)v30;
    if (v30)
    {
      v57[0] = CFSTR("videoSlotFacing");
      v57[1] = CFSTR("conferenceVisualRectangle");
      v58[0] = v30;
      v58[1] = v29;
      v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
      v33 = -[AVConferencePreview newXPCObjectForFenceHandle:forLayerHost:](self, "newXPCObjectForFenceHandle:forLayerHost:", &v56, a4);
      if (v33)
      {
        v34 = v33;
        v35 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](self->connection, "sendMessageSync:arguments:xpcArguments:", "previewSetLayerBounds", v32, v33);
        if (!v35
          || (v36 = v35, objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ERROR")))
          || objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
        {
          if ((AVConferencePreview *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[AVConferencePreview setBounds:forLayerHost:].cold.3();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v47 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v47 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v50 = VRTraceErrorLogLevelToCSTR();
              v51 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v60 = v50;
                v61 = 2080;
                v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
                v63 = 1024;
                v64 = 1078;
                v65 = 2112;
                v66 = v47;
                v67 = 2048;
                v68 = self;
                _os_log_error_impl(&dword_1D8A54000, v51, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) Set preview layer bounds xpc call failed", buf, 0x30u);
              }
            }
          }
        }
        goto LABEL_18;
      }
      if ((AVConferencePreview *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVConferencePreview setBounds:forLayerHost:].cold.2();
        }
        goto LABEL_62;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v49 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v49 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v55 = VRTraceErrorLogLevelToCSTR(),
            v53 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_62:
        v34 = 0;
LABEL_18:
        if (v56)
        {
          objc_msgSend(v56, "invalidate");

          v56 = 0;
        }

        xpc_release(v34);
        return;
      }
      *(_DWORD *)buf = 136316162;
      v60 = v55;
      v61 = 2080;
      v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
      v63 = 1024;
      v64 = 1074;
      v65 = 2112;
      v66 = v49;
      v67 = 2048;
      v68 = self;
      v54 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to create XPC representation for fence";
    }
    else
    {
      if ((AVConferencePreview *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVConferencePreview setBounds:forLayerHost:].cold.1();
        }
        goto LABEL_62;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v48 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v48 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_62;
      v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      *(_DWORD *)buf = 136316162;
      v60 = v52;
      v61 = 2080;
      v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
      v63 = 1024;
      v64 = 1066;
      v65 = 2112;
      v66 = v48;
      v67 = 2048;
      v68 = self;
      v54 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate camera facing number";
    }
    _os_log_error_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_ERROR, v54, buf, 0x30u);
    goto LABEL_62;
  }
  if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    v40 = NSStringFromRect(v87);
    *(_DWORD *)buf = 136315906;
    v60 = v38;
    v61 = 2080;
    v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
    v63 = 1024;
    v64 = 1056;
    v65 = 2112;
    v66 = (const __CFString *)v40;
    v41 = "AVConferencePreview [%s] %s:%d Invalid root layer bounds=%@, skip bounds configuration";
    v42 = v39;
    v43 = 38;
LABEL_31:
    _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v37 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v37 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v88.origin.x = x;
      v88.origin.y = y;
      v88.size.width = width;
      v88.size.height = height;
      v46 = NSStringFromRect(v88);
      *(_DWORD *)buf = 136316418;
      v60 = v44;
      v61 = 2080;
      v62 = "-[AVConferencePreview setBounds:forLayerHost:]";
      v63 = 1024;
      v64 = 1056;
      v65 = 2112;
      v66 = v37;
      v67 = 2048;
      v68 = self;
      v69 = 2112;
      v70 = (CALayer *)v46;
      v41 = "AVConferencePreview [%s] %s:%d %@(%p) Invalid root layer bounds=%@, skip bounds configuration";
      v42 = v45;
      v43 = 58;
      goto LABEL_31;
    }
  }
}

- (void)cleanupPreviewLayerHost:(id *)a3
{
  if (*a3)
  {
    objc_msgSend(*a3, "removeFromSuperlayer");

    *a3 = 0;
  }
}

- (void)createPreviewCALayerHostForRootLayer:(id)a3 withContextId:(unsigned int)a4 front:(BOOL)a5
{
  _BOOL4 v7;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  AVCPreviewCALayerHost **p_caLayerHostFront;
  AVCPreviewCALayerHost **p_caLayerHostBack;
  uint64_t v23;
  AVCPreviewCALayerHost **v24;
  AVCPreviewCALayerHost *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  AVCPreviewCALayerHost *v29;
  AVCPreviewCALayerHost *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  AVCPreviewCALayerHost *caLayerHostFront;
  AVCPreviewCALayerHost *caLayerHostBack;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  _QWORD block[11];
  unsigned int v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  AVConferencePreview *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  AVCPreviewCALayerHost *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  unsigned int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:].cold.1();
      }
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v38 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v38 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_50;
    v41 = VRTraceErrorLogLevelToCSTR();
    v42 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_50;
    *(_DWORD *)buf = 136316162;
    v50 = v41;
    v51 = 2080;
    v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
    v53 = 1024;
    v54 = 1106;
    v55 = 2112;
    v56 = v38;
    v57 = 2048;
    v58 = self;
    v43 = "AVConferencePreview [%s] %s:%d %@(%p) Invalid rootLayer or contextId";
    goto LABEL_56;
  }
  v7 = a5;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = "Back";
  if (v7)
    v10 = "Front";
  v11 = objc_msgSend(v9, "initWithFormat:", CFSTR("AVCPreviewVideoCALayerHost%sFor%p"), v10, a3);
  if (!v11)
  {
    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:].cold.2();
      }
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v39 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v39 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v44 = VRTraceErrorLogLevelToCSTR(),
          v42 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_50:
      v12 = 0;
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136316162;
    v50 = v44;
    v51 = 2080;
    v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
    v53 = 1024;
    v54 = 1108;
    v55 = 2112;
    v56 = v39;
    v57 = 2048;
    v58 = self;
    v43 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate layer host name";
LABEL_56:
    _os_log_error_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_ERROR, v43, buf, 0x30u);
    goto LABEL_50;
  }
  v12 = (void *)v11;
  objc_msgSend(a3, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  p_caLayerHostFront = &self->_caLayerHostFront;
  p_caLayerHostBack = &self->_caLayerHostBack;
  if (v7)
    v23 = 40;
  else
    v23 = 48;
  if (v7)
    v24 = &self->_caLayerHostFront;
  else
    v24 = &self->_caLayerHostBack;
  -[AVConferencePreview cleanupPreviewLayerHost:](self, "cleanupPreviewLayerHost:", v24);
  v25 = -[AVCPreviewCALayerHost initWithPreview:]([AVCPreviewCALayerHost alloc], "initWithPreview:", self);
  *(Class *)((char *)&self->super.isa + v23) = (Class)v25;
  if (v25)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__AVConferencePreview_createPreviewCALayerHostForRootLayer_withContextId_front___block_invoke;
    block[3] = &unk_1E9E57780;
    block[5] = a3;
    block[6] = v24;
    v48 = a4;
    block[7] = v14;
    block[8] = v16;
    block[9] = v18;
    block[10] = v20;
    block[4] = v12;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if ((AVConferencePreview *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v29 = *p_caLayerHostFront;
          v30 = *p_caLayerHostBack;
          *(_DWORD *)buf = 136316674;
          v50 = v27;
          v51 = 2080;
          v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
          v53 = 1024;
          v54 = 1136;
          v55 = 2048;
          v56 = (const __CFString *)v29;
          v57 = 2048;
          v58 = (AVConferencePreview *)v30;
          v59 = 2048;
          v60 = a3;
          v61 = 1024;
          LODWORD(v62) = a4;
          v31 = "AVConferencePreview [%s] %s:%d AVConferencePreview: createPreviewCALayerHostForRootLayer caLayerHostFron"
                "t=%p caLayerHostBack=%p rootLayer=%p contextId=%u";
          v32 = v28;
          v33 = 64;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v26 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v34 = VRTraceErrorLogLevelToCSTR();
        v35 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          caLayerHostFront = self->_caLayerHostFront;
          caLayerHostBack = self->_caLayerHostBack;
          *(_DWORD *)buf = 136317186;
          v50 = v34;
          v51 = 2080;
          v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
          v53 = 1024;
          v54 = 1136;
          v55 = 2112;
          v56 = v26;
          v57 = 2048;
          v58 = self;
          v59 = 2048;
          v60 = caLayerHostFront;
          v61 = 2048;
          v62 = caLayerHostBack;
          v63 = 2048;
          v64 = a3;
          v65 = 1024;
          v66 = a4;
          v31 = "AVConferencePreview [%s] %s:%d %@(%p) AVConferencePreview: createPreviewCALayerHostForRootLayer caLayerH"
                "ostFront=%p caLayerHostBack=%p rootLayer=%p contextId=%u";
          v32 = v35;
          v33 = 84;
          goto LABEL_23;
        }
      }
    }
  }
  else if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:].cold.3();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v40 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v40 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v45 = VRTraceErrorLogLevelToCSTR();
      v46 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v50 = v45;
        v51 = 2080;
        v52 = "-[AVConferencePreview createPreviewCALayerHostForRootLayer:withContextId:front:]";
        v53 = 1024;
        v54 = 1114;
        v55 = 2112;
        v56 = v40;
        v57 = 2048;
        v58 = self;
        _os_log_error_impl(&dword_1D8A54000, v46, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate CALayerHost", buf, 0x30u);
      }
    }
  }
LABEL_24:

}

uint64_t __80__AVConferencePreview_createPreviewCALayerHostForRootLayer_withContextId_front___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(**(id **)(a1 + 48), "setContextId:", *(unsigned int *)(a1 + 88));
  objc_msgSend(**(id **)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(**(id **)(a1 + 48), "setPosition:", *(double *)(a1 + 72) * 0.5, *(double *)(a1 + 80) * 0.5);
  objc_msgSend(**(id **)(a1 + 48), "setName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(**(id **)(a1 + 48), "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  objc_msgSend(**(id **)(a1 + 48), "setAllowsHitTesting:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addSublayer:", **(_QWORD **)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setAllowsHitTesting:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  return objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
}

- (void)setLocalVideoLayerHost:(id)a3 front:(BOOL)a4
{
  _BOOL4 v4;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSObject *avConferencePreviewQueue;
  _QWORD block[6];
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BYTE v33[24];
  __int16 v34;
  NSString *v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  NSString *v39;
  __int16 v40;
  NSString *v41;
  uint64_t v42;
  NSRect v43;
  NSRect v44;
  NSRect v45;
  NSRect v46;
  NSRect v47;
  NSRect v48;
  NSRect v49;
  NSRect v50;

  v4 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  if ((AVConferencePreview *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "bounds");
        v10 = NSStringFromRect(v43);
        objc_msgSend(a3, "frame");
        v11 = NSStringFromRect(v44);
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "bounds");
        v12 = NSStringFromRect(v45);
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "frame");
        *(_DWORD *)buf = 136317186;
        v25 = v8;
        v26 = 2080;
        v27 = "-[AVConferencePreview setLocalVideoLayerHost:front:]";
        v28 = 1024;
        v29 = 1144;
        v30 = 2048;
        v31 = a3;
        v32 = 1024;
        *(_DWORD *)v33 = v4;
        *(_WORD *)&v33[4] = 2112;
        *(_QWORD *)&v33[6] = v10;
        *(_WORD *)&v33[14] = 2112;
        *(_QWORD *)&v33[16] = v11;
        v34 = 2112;
        v35 = v12;
        v36 = 2112;
        v37 = NSStringFromRect(v46);
        v13 = "AVConferencePreview [%s] %s:%d layer=%p, front=%d, bounds=%@ frame=%@, super layer bounds=%@ frame=%@";
        v14 = v9;
        v15 = 84;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVConferencePreview performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "bounds");
        v18 = NSStringFromRect(v47);
        objc_msgSend(a3, "frame");
        v19 = NSStringFromRect(v48);
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "bounds");
        v20 = NSStringFromRect(v49);
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "frame");
        *(_DWORD *)buf = 136317698;
        v25 = v16;
        v26 = 2080;
        v27 = "-[AVConferencePreview setLocalVideoLayerHost:front:]";
        v28 = 1024;
        v29 = 1144;
        v30 = 2112;
        v31 = (id)v7;
        v32 = 2048;
        *(_QWORD *)v33 = self;
        *(_WORD *)&v33[8] = 2048;
        *(_QWORD *)&v33[10] = a3;
        *(_WORD *)&v33[18] = 1024;
        *(_DWORD *)&v33[20] = v4;
        v34 = 2112;
        v35 = v18;
        v36 = 2112;
        v37 = v19;
        v38 = 2112;
        v39 = v20;
        v40 = 2112;
        v41 = NSStringFromRect(v50);
        v13 = "AVConferencePreview [%s] %s:%d %@(%p) layer=%p, front=%d, bounds=%@ frame=%@, super layer bounds=%@ frame=%@";
        v14 = v17;
        v15 = 104;
        goto LABEL_11;
      }
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke;
  block[3] = &unk_1E9E52210;
  block[4] = self;
  block[5] = a3;
  v23 = v4;
  dispatch_async(avConferencePreviewQueue, block);
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  int v60;
  uint64_t v61;
  NSRect v62;

  v61 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "setRootPreviewLayer:front:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48)))
  {
    v9 = 40;
    if (!*(_BYTE *)(a1 + 48))
      v9 = 48;
    v11 = *(char **)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)&v11[v9];
    objc_msgSend(v10, "bounds");
    objc_msgSend(v11, "setBounds:forLayerHost:", v12);
    goto LABEL_14;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_1();
      }
      goto LABEL_14;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v36 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        v44 = v34;
        v45 = 2080;
        v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
        v47 = 1024;
        v48 = 1150;
        v49 = 2112;
        v50 = v28;
        v51 = 2048;
        v52 = v36;
        v37 = "AVConferencePreview [%s] %s:%d %@(%p) Invalid layer parameter";
LABEL_61:
        _os_log_error_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_ERROR, v37, buf, 0x30u);
      }
    }
LABEL_14:
    v3 = 0;
LABEL_15:
    v4 = 0;
    goto LABEL_24;
  }
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", *(unsigned __int8 *)(a1 + 48));
  if (!v2)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_2();
      }
      goto LABEL_14;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v39 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        v44 = v38;
        v45 = 2080;
        v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
        v47 = 1024;
        v48 = 1152;
        v49 = 2112;
        v50 = v29;
        v51 = 2048;
        v52 = v39;
        v37 = "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate camera facing";
        goto LABEL_61;
      }
    }
    goto LABEL_14;
  }
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v3, CFSTR("videoSlotFacing"), NSStringFromRect(v62), CFSTR("conferenceVisualRectangle"), 0);
  if (!v4)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v40 = VRTraceErrorLogLevelToCSTR();
        v41 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v42 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v44 = v40;
          v45 = 2080;
          v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
          v47 = 1024;
          v48 = 1156;
          v49 = 2112;
          v50 = v30;
          v51 = 2048;
          v52 = v42;
          _os_log_error_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) Failed to allocate args dictionary", buf, 0x30u);
        }
      }
    }
    goto LABEL_15;
  }
  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageSync:arguments:xpcArguments:", "previewGetLocalVideoContext", v4, 0);
  if (!v5
    || (v6 = v5, objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ERROR")))
    || objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_4();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v27 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v27 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v33 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v44 = v31;
          v45 = 2080;
          v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
          v47 = 1024;
          v48 = 1158;
          v49 = 2112;
          v50 = v27;
          v51 = 2048;
          v52 = v33;
          _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d %@(%p) Set preview layer bounds xpc call failed", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    v7 = (__CFString *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("videoContextId"));
    objc_msgSend(*(id *)(a1 + 32), "createPreviewCALayerHostForRootLayer:withContextId:front:", *(_QWORD *)(a1 + 40), -[__CFString unsignedIntValue](v7, "unsignedIntValue"), *(unsigned __int8 *)(a1 + 48));
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(void **)(a1 + 40);
          v16 = objc_msgSend(v15, "name");
          v17 = *(unsigned __int8 *)(a1 + 48);
          *(_DWORD *)buf = 136316674;
          v44 = v13;
          v45 = 2080;
          v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
          v47 = 1024;
          v48 = 1161;
          v49 = 2112;
          v50 = v7;
          v51 = 2048;
          v52 = v15;
          v53 = 2112;
          v54 = v16;
          v55 = 1024;
          LODWORD(v56) = v17;
          v18 = "AVConferencePreview [%s] %s:%d Received contextId=%@ for layer=%p named=\"%@\" facing=%d";
          v19 = v14;
          v20 = 64;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(void **)(a1 + 32);
          v23 = *(void **)(a1 + 40);
          v25 = objc_msgSend(v23, "name");
          v26 = *(unsigned __int8 *)(a1 + 48);
          *(_DWORD *)buf = 136317186;
          v44 = v21;
          v45 = 2080;
          v46 = "-[AVConferencePreview setLocalVideoLayerHost:front:]_block_invoke";
          v47 = 1024;
          v48 = 1161;
          v49 = 2112;
          v50 = v8;
          v51 = 2048;
          v52 = v24;
          v53 = 2112;
          v54 = (uint64_t)v7;
          v55 = 2048;
          v56 = v23;
          v57 = 2112;
          v58 = v25;
          v59 = 1024;
          v60 = v26;
          v18 = "AVConferencePreview [%s] %s:%d %@(%p) Received contextId=%@ for layer=%p named=\"%@\" facing=%d";
          v19 = v22;
          v20 = 84;
          goto LABEL_23;
        }
      }
    }
  }
LABEL_24:

}

- (void)setLocalCamera:(unsigned int)a3
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      -[AVConferencePreview setLocalCamera:].cold.1();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVConferencePreview setLocalCamera:]";
      v11 = 1024;
      v12 = 1185;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d -setLocalCamera: called on embedded, ignoring", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)resetLocalCameraAfterServerDisconnect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d localCameraUID is nil UID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__AVConferencePreview_resetLocalCameraAfterServerDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
      *(_DWORD *)buf = 136315906;
      v7 = v2;
      v8 = 2080;
      v9 = "-[AVConferencePreview resetLocalCameraAfterServerDisconnect]_block_invoke";
      v10 = 1024;
      v11 = 1203;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Server disconnected, reseting local camera to: %@", buf, 0x26u);
    }
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), CFSTR("localCameraUIDString"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:", "previewSetLocalCamera", v5);

}

- (void)setLocalCameraWithUID:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *avConferencePreviewQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVConferencePreview setLocalCameraWithUID:]";
      v15 = 1024;
      v16 = 1215;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d requestedCameraUniqueID = %@", buf, 0x26u);
    }
  }
  if (a3)
  {
    if ((objc_msgSend(a3, "isEqualToString:", self->_localCameraUID) & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v12 = v7;
          v13 = 2080;
          v14 = "-[AVConferencePreview setLocalCameraWithUID:]";
          v15 = 1024;
          v16 = 1227;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d camera already set", buf, 0x1Cu);
        }
      }
    }
    else
    {

      self->_localCameraUID = (NSString *)a3;
      avConferencePreviewQueue = self->avConferencePreviewQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__AVConferencePreview_setLocalCameraWithUID___block_invoke;
      block[3] = &unk_1E9E521C0;
      block[4] = self;
      dispatch_async(avConferencePreviewQueue, block);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVConferencePreview setLocalCameraWithUID:].cold.1();
  }
}

void __45__AVConferencePreview_setLocalCameraWithUID___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), CFSTR("localCameraUIDString"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:", "previewSetLocalCamera", v2);

}

- (void)setFollowSystemCameraEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[AVConferencePreview setFollowSystemCameraEnabled:]";
      v10 = 1024;
      v11 = 1236;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d enabled=%d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (unsigned)localCamera
{
  int ErrorLogLevelForModule;
  os_log_t *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v3 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v4;
      v11 = 2080;
      v12 = "-[AVConferencePreview localCamera]";
      v13 = 1024;
      v14 = 1260;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d -localCamera called on embedded, ignoring", (uint8_t *)&v9, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = v6;
      v11 = 2080;
      v12 = "-[AVConferencePreview localCamera]";
      v13 = 1024;
      v14 = 1273;
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d localCamera=%u", (uint8_t *)&v9, 0x22u);
    }
  }
  return 0;
}

- (void)setLocalScreenAttributes:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *avConferencePreviewQueue;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v11 = v5;
      v12 = 2080;
      v13 = "-[AVConferencePreview setLocalScreenAttributes:]";
      v14 = 1024;
      v15 = 1347;
      v16 = 2080;
      v17 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d screenAttributes=%s", buf, 0x26u);
    }
  }
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__AVConferencePreview_setLocalScreenAttributes___block_invoke;
  v9[3] = &unk_1E9E52238;
  v9[4] = a3;
  v9[5] = self;
  dispatch_async(avConferencePreviewQueue, v9);
}

void __48__AVConferencePreview_setLocalScreenAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "orientation")
    && objc_msgSend(*(id *)(a1 + 32), "orientation") != 1)
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "ratio");
    *(_QWORD *)(v5 + 80) = v6;
    *(_QWORD *)(v5 + 88) = v7;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "ratio");
    *(_QWORD *)(v2 + 64) = v3;
    *(_QWORD *)(v2 + 72) = v4;
  }
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "copyEncodedDictionary");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("localVideoAttributes"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sendMessageAsync:arguments:reply:", "previewSetLocalScreenAttributes", v8, 0);

}

- (id)localScreenAttributesForVideoAttributes:(id)a3
{
  NSObject *avConferencePreviewQueue;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__32;
  v15 = __Block_byref_object_dispose__32;
  v16 = 0;
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVConferencePreview_localScreenAttributesForVideoAttributes___block_invoke;
  block[3] = &unk_1E9E527A8;
  block[5] = self;
  block[6] = &v11;
  block[4] = a3;
  dispatch_sync(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)v12[5];
      if (v6)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v18 = v4;
      v19 = 2080;
      v20 = "-[AVConferencePreview localScreenAttributesForVideoAttributes:]";
      v21 = 1024;
      v22 = 1409;
      v23 = 2080;
      v24 = v7;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d Returning %s", buf, 0x26u);
    }
  }
  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __63__AVConferencePreview_localScreenAttributesForVideoAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double *v3;
  double *v4;
  uint64_t v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = +[VideoAttributes videoAttributesWithVideoAttributes:](VideoAttributes, "videoAttributesWithVideoAttributes:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "orientation")
    && objc_msgSend(*(id *)(a1 + 32), "orientation") != 1)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v3 = (double *)(v5 + 80);
    v4 = (double *)(v5 + 88);
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (double *)(v2 + 64);
    v4 = (double *)(v2 + 72);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRatio:", *v3, *v4);
}

- (void)beginPreviewToPIPAnimation
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVConferencePreview_beginPreviewToPIPAnimation__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVConferencePreview beginPreviewToPIPAnimation]";
      v10 = 1024;
      v11 = 1429;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d beginPreviewToPIPAnimation", buf, 0x1Cu);
    }
  }
}

uint64_t __49__AVConferencePreview_beginPreviewToPIPAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewBeginPreviewToPIPAnimation", 0, 0);
}

- (void)endPreviewToPIPAnimation
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVConferencePreview_endPreviewToPIPAnimation__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVConferencePreview endPreviewToPIPAnimation]";
      v10 = 1024;
      v11 = 1447;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d endPreviewToPIPAnimation", buf, 0x1Cu);
    }
  }
}

uint64_t __47__AVConferencePreview_endPreviewToPIPAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewEndPreviewToPIPAnimation", 0, 0);
}

- (void)beginPIPToPreviewAnimation
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVConferencePreview_beginPIPToPreviewAnimation__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVConferencePreview beginPIPToPreviewAnimation]";
      v10 = 1024;
      v11 = 1465;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d beginPIPToPreviewAnimation", buf, 0x1Cu);
    }
  }
}

uint64_t __49__AVConferencePreview_beginPIPToPreviewAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewBeginPIPToPreviewAnimation", 0, 0);
}

- (void)endPIPToPreviewAnimation
{
  NSObject *avConferencePreviewQueue;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVConferencePreview_endPIPToPreviewAnimation__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVConferencePreview endPIPToPreviewAnimation]";
      v10 = 1024;
      v11 = 1483;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d endPIPToPreviewAnimation", buf, 0x1Cu);
    }
  }
}

uint64_t __47__AVConferencePreview_endPIPToPreviewAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewEndPIPToPreviewAnimation", 0, 0);
}

- (void)setCameraZoomFactor:(double)a3
{
  NSObject *avConferencePreviewQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AVConferencePreview_setCameraZoomFactor___block_invoke;
  v7[3] = &unk_1E9E52960;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  dispatch_async(avConferencePreviewQueue, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[AVConferencePreview setCameraZoomFactor:]";
      v12 = 1024;
      v13 = 1515;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraZoomFactor=%f", buf, 0x26u);
    }
  }
}

void __43__AVConferencePreview_setCameraZoomFactor___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
  {
    v2 = objc_alloc(MEMORY[0x1E0C99D80]);
    v5 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40)), CFSTR("previewCameraZoomFactor"), 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewCameraZoomFactor");

  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVConferencePreview setCameraZoomFactor:]_block_invoke";
      v10 = 1024;
      v11 = 1512;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraZoom not available", buf, 0x1Cu);
    }
  }
}

- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4
{
  NSObject *avConferencePreviewQueue;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVConferencePreview_setCameraZoomFactor_withRate___block_invoke;
  block[3] = &unk_1E9E52910;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(avConferencePreviewQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v11 = v7;
      v12 = 2080;
      v13 = "-[AVConferencePreview setCameraZoomFactor:withRate:]";
      v14 = 1024;
      v15 = 1534;
      v16 = 2048;
      v17 = a3;
      v18 = 2048;
      v19 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraZoomFactor=%f with rate=%f", buf, 0x30u);
    }
  }
}

void __52__AVConferencePreview_setCameraZoomFactor_withRate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
  {
    v2 = objc_alloc(MEMORY[0x1E0C99D80]);
    v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v6 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", v3, CFSTR("previewCameraZoomFactor"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48)), CFSTR("previewCameraZoomRate"), 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewCameraZoomFactorRate");

  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v4;
      v9 = 2080;
      v10 = "-[AVConferencePreview setCameraZoomFactor:withRate:]_block_invoke";
      v11 = 1024;
      v12 = 1531;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d cameraZoom not available", buf, 0x1Cu);
    }
  }
}

- (void)notifyCenterStageEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *avConferencePreviewQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  avConferencePreviewQueue = self->avConferencePreviewQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AVConferencePreview_notifyCenterStageEnabled___block_invoke;
  v7[3] = &unk_1E9E521E8;
  v8 = a3;
  v7[4] = self;
  dispatch_async(avConferencePreviewQueue, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVConferencePreview notifyCenterStageEnabled:]";
      v13 = 1024;
      v14 = 1567;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferencePreview [%s] %s:%d enabled=%d", buf, 0x22u);
    }
  }
}

uint64_t __48__AVConferencePreview_notifyCenterStageEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("previewCameraCinematicFraming");
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4[1] = CFSTR("previewCameraCinematicFramingSet");
  v5[0] = v2;
  v5[1] = MEMORY[0x1E0C9AAA0];
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessageAsync:arguments:reply:", "previewCameraCinematicFraming", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2), 0);
}

+ (BOOL)isEyeContactSupported
{
  return +[VCHardwareSettings isViewPointCorrectionSupported](VCHardwareSettings, "isViewPointCorrectionSupported");
}

void __63__AVConferencePreview_didReceiveErrorFromCameraUniqueID_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*(id *)(a2 + 40), "UTF8String");
  v7 = *(_QWORD *)(a2 + 48);
  v8 = 136316162;
  v9 = a1;
  v10 = 2080;
  v11 = "-[AVConferencePreview didReceiveErrorFromCameraUniqueID:error:]_block_invoke";
  v12 = 1024;
  v13 = 244;
  v14 = 2080;
  v15 = v6;
  v16 = 2112;
  v17 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d cameraUID=%s, error=%@", (uint8_t *)&v8, 0x30u);
}

void __38__AVConferencePreview_didGetSnapshot___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Delegate does not respond to didGetSnapshot:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__AVConferencePreview_cameraDidBecomeAvailableForUniqueID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Delegate does not respond to cameraDidBecomeAvailableForUniqueID:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __71__AVConferencePreview_cameraDidBecomeInterruptedForForUniqueID_reason___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Delegate does not respond to cameraDidBecomeInterruptedForForUniqueID:reason:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d preview must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_77_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d previewCameraUIDChanged: cameraUID is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d previewDidLocalVideoSlotChange failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_5_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Mismatched layer configuration, in layerhost mode, ignore reconnect until applications associates the layer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_102_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d previewDidLocalVideoContextChange failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__AVConferencePreview_registerBlocksForDelegateNotifications__block_invoke_102_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Mismatched layer configuration, not in layer host mode, ignore reconnect until applications associates the layer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isPreviewRunning
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d _isPreviewRunning=%d", v2, v3, v4, 883);
  OUTLINED_FUNCTION_3();
}

- (void)isCameraZoomAvailable
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d returning %d", v2, v3, v4, 894);
  OUTLINED_FUNCTION_3();
}

- (void)currentZoomFactor
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  double v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d returning %f", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)maxZoomFactor
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  double v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d returning %f", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __48__AVConferencePreview_setLocalVideoLayer_front___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Received error from server in setLocalVideoLayer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newXPCObjectForFenceHandle:forLayerHost:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to create new fence", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setBounds:forLayerHost:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate camera facing number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setBounds:forLayerHost:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to create XPC representation for fence", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setBounds:forLayerHost:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Set preview layer bounds xpc call failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createPreviewCALayerHostForRootLayer:withContextId:front:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Invalid rootLayer or contextId", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createPreviewCALayerHostForRootLayer:withContextId:front:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate layer host name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createPreviewCALayerHostForRootLayer:withContextId:front:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate CALayerHost", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Invalid layer parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate camera facing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Failed to allocate args dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__AVConferencePreview_setLocalVideoLayerHost_front___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d Set preview layer bounds xpc call failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setLocalCamera:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[AVConferencePreview setLocalCamera:]";
  v6 = 1024;
  v7 = 1179;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, "AVConferencePreview [%s] %s:%d ---- STOP! ---- setLocalCamera is deprecated! Use setLocalCameraWithUID instead! AVConferencePreview setLocalCamera %u", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)setLocalCameraWithUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVConferencePreview [%s] %s:%d requestedCamera returned nil UID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
