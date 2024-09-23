@implementation VCVideoCaptureServer

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_3(uint64_t a1, void *a2)
{
  VideoAttributes *v5;
  void *v6;
  uint64_t v7;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localVideoAttributes")));
  objc_msgSend(*(id *)(a1 + 32), "setLocalVideoAttributes:", v5);
  v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "localVideoAttributes"), "copyEncodedDictionary");
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("localVideoAttributes"), 0);

  return v7;
}

- (id)localVideoAttributes
{
  NSObject *captureServerQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCVideoCaptureServer_localVideoAttributes__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captureServerQueue, block);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)setLocalVideoAttributes:(id)a3
{
  NSObject *captureServerQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    captureServerQueue = self->captureServerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(captureServerQueue, block);
  }
  return a3 != 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_8(uint64_t a1, void *a2)
{
  int v4;
  _BOOL8 v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraCinematicFraming")), "intValue");
    if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraCinematicFramingSet")))
      v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraCinematicFramingSet")), "intValue") != 0;
    else
      v5 = 1;
    objc_msgSend(*(id *)(a1 + 32), "updateCenterStageEnabled:requestCaptureChange:", v4 != 0, v5);
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  unsigned int v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (v4)
    {
      v5 = (void *)v4;
      v12 = 0;
      v11 = 0;
      objc_msgSend(*(id *)(a1 + 32), "captureVideoWidth:height:frameRate:", (char *)&v12 + 4, &v12, &v11);
      if ((_DWORD)v12 * HIDWORD(v12) * v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count");
            v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
            *(_DWORD *)buf = 136316162;
            v14 = v6;
            v15 = 2080;
            v16 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke_2";
            v17 = 1024;
            v18 = 787;
            v19 = 1024;
            v20 = v8;
            v21 = 2112;
            v22 = v9;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d StartPreview when cameraVideoSinks count=%u, array=%@.", buf, 0x2Cu);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "startCaptureWithWidth:height:frameRate:", HIDWORD(v12), v12, v11);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "startPreview");
      }
      objc_msgSend(v5, "setStarted:", 1);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_cold_1();
      }
      objc_msgSend(*(id *)(a1 + 32), "handleAVCaptureError:domain:", 2148073489, CFSTR("avCaptureStartPreviewFail"));
    }
  }
  return 0;
}

- (BOOL)captureVideoWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5
{
  NSObject *captureClientQueue;
  char v6;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  captureClientQueue = self->captureClientQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__VCVideoCaptureServer_captureVideoWidth_height_frameRate___block_invoke;
  v8[3] = &unk_1E9E57450;
  v8[6] = a3;
  v8[7] = a4;
  v8[8] = a5;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(captureClientQueue, v8);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoSlotFacing"));
  v6 = objc_msgSend(*(id *)(a1 + 32), "setLocalVideoDestination:facing:", 0, objc_msgSend(v5, "BOOLValue"));
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ previewGetLocalVideoSlot");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v12 = v7;
      v13 = 2080;
      v14 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke_5";
      v15 = 1024;
      v16 = 907;
      v17 = 1024;
      v18 = v6;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ previewGetLocalVideoSlot slot=%u front=%@", buf, 0x2Cu);
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v6);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("videoSlotNumber"), 0);

  return v4;
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_3(uint64_t a1)
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidStart", *(_QWORD *)(a1 + 32));

}

uint64_t __79__VCVideoCaptureServer_setCameraZoomAvailable_currentZoomFactor_maxZoomFactor___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewCameraZoomAvailablilty", *(_QWORD *)(a1 + 32));
}

uint64_t __42__VCVideoCaptureServer_updatePreviewState__block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "updatePreviewState", *(_QWORD *)(a1 + 32));
}

uint64_t __50__VCVideoCaptureServer_reconnectClientLayerFront___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidLocalVideoSlotChange", *(_QWORD *)(a1 + 32));
}

- (void)startPreview
{
  -[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:](self, "startPreviewWithWidth:height:frameRate:", 0, 0, 0);
}

- (void)reconnectClientLayerFront:(BOOL)a3
{
  _BOOL8 v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  NSObject *delegateNotificationQueue;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD block[5];
  __int128 v18;
  _BYTE v19[48];
  unsigned __int8 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v18 = xmmword_1D910F5E0;
  *(_OWORD *)v19 = unk_1D910F5F0;
  *(_OWORD *)&v19[16] = xmmword_1D910F600;
  *(_OWORD *)&v19[32] = unk_1D910F610;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)&v19[8] = *MEMORY[0x1E0C9D648];
  v20 = 0;
  *(_QWORD *)&v18 = 0;
  BYTE8(v18) = a3;
  *(_QWORD *)v19 = &v20;
  *(_OWORD *)&v19[24] = v5;
  *(_WORD *)&v19[40] = 256;
  v6 = -[VCVideoCaptureServer setLocalVideoDestination:](self, "setLocalVideoDestination:", &v18);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCVideoCaptureServer-connect layers");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v22 = v7;
      v23 = 2080;
      v24 = "-[VCVideoCaptureServer reconnectClientLayerFront:]";
      v25 = 1024;
      v26 = 1360;
      v27 = 1024;
      v28 = v3;
      v29 = 1024;
      v30 = v6;
      v31 = 1024;
      v32 = v20;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ VCVideoCaptureServer-connect layers reconnectClientLayerFront=%d(1-front), slot=%u layerHostMode=%d", buf, 0x2Eu);
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v3);
  v11 = v20;
  v12 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (v11)
  {
    v13 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v9, CFSTR("videoContextId"), v10, CFSTR("videoSlotFacing"), 0);
    delegateNotificationQueue = self->delegateNotificationQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__VCVideoCaptureServer_reconnectClientLayerFront___block_invoke_2;
    v16[3] = &unk_1E9E521C0;
    v16[4] = v13;
    v15 = v16;
  }
  else
  {
    v13 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v9, CFSTR("videoSlotNumber"), v10, CFSTR("videoSlotFacing"), 0);
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__VCVideoCaptureServer_reconnectClientLayerFront___block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = v13;
    v15 = block;
  }
  dispatch_async(delegateNotificationQueue, v15);

}

- (unsigned)setLocalVideoDestination:(id)a3 facing:(BOOL)a4
{
  __int128 v4;
  __int128 v6;
  _BYTE v7[48];
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = xmmword_1D910F5E0;
  *(_OWORD *)v7 = unk_1D910F5F0;
  *(_OWORD *)&v7[16] = xmmword_1D910F600;
  *(_OWORD *)&v7[32] = unk_1D910F610;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)&v7[8] = *MEMORY[0x1E0C9D648];
  v8 = 0;
  *(_QWORD *)&v6 = a3;
  BYTE8(v6) = a4;
  *(_QWORD *)v7 = &v8;
  *(_OWORD *)&v7[24] = v4;
  *(_WORD *)&v7[40] = 0;
  return -[VCVideoCaptureServer setLocalVideoDestination:](self, "setLocalVideoDestination:", &v6);
}

uint64_t __44__VCVideoCaptureServer_localVideoAttributes__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = +[VideoAttributes videoAttributesWithVideoAttributes:](VideoAttributes, "videoAttributesWithVideoAttributes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "camera");
  if ((_DWORD)result != 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315650;
        v6 = v3;
        v7 = 2080;
        v8 = "-[VCVideoCaptureServer localVideoAttributes]_block_invoke";
        v9 = 1024;
        v10 = 3432;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d VideoAttributes camera should be only used for remote. Setting videoAttributes.camera to VideoAttributeCameraInvalid for local", (uint8_t *)&v5, 0x1Cu);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCamera:", 3);
  }
  return result;
}

void __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  CFMutableDictionaryRef EncodedCFDictionary;
  int v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD block[4];
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
      if (v4)
        v5 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      else
        v5 = "<nil>";
      v6 = *(void **)(a1 + 40);
      if (v6)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v26 = v2;
      v27 = 2080;
      v28 = "-[VCVideoCaptureServer setLocalVideoAttributes:]_block_invoke";
      v29 = 1024;
      v30 = 3383;
      v31 = 2080;
      v32 = v5;
      v33 = 2080;
      v34 = v7;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d camera and orientation changed from %s to %s", buf, 0x30u);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientation"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientation"));
  if (objc_msgSend(*(id *)(a1 + 32), "shouldSendVideoAttributeCallback:", *(_QWORD *)(a1 + 40)))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v8)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        v12 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v26 = v10;
            v27 = 2080;
            v28 = "-[VCVideoCaptureServer setLocalVideoAttributes:]_block_invoke";
            v29 = 1024;
            v30 = 3392;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying app of video attributes change", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_cold_2();
        }
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_255;
      block[3] = &unk_1E9E52238;
      v24 = *(_OWORD *)(a1 + 32);
      dispatch_async(*(dispatch_queue_t *)(v24 + 296), block);
    }
    else
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        v15 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v26 = v13;
            v27 = 2080;
            v28 = "-[VCVideoCaptureServer setLocalVideoAttributes:]_block_invoke_2";
            v29 = 1024;
            v30 = 3400;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying clients of video attributes change", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_cold_1();
        }
      }
      v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyEncodedDictionary");
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v16, CFSTR("localVideoAttributes"), 0);
      v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 296);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_259;
      v22[3] = &unk_1E9E521C0;
      v22[4] = v17;
      dispatch_async(v18, v22);

    }
    EncodedCFDictionary = VideoAttributes_CreateEncodedCFDictionary(*(void **)(*(_QWORD *)(a1 + 32) + 152));
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
    v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "camera");
    v21 = 416;
    if (!v20)
      v21 = 408;
    VCImageQueue_EnqueueAttributes(*(_QWORD *)(*(_QWORD *)(a1 + 32) + v21), EncodedCFDictionary);
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
    if (EncodedCFDictionary)
      CFRelease(EncodedCFDictionary);
  }
}

- (BOOL)shouldSendVideoAttributeCallback:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  BOOL result;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[VCVideoSource isPortraitResolutionCaptureActive](self->avCapture, "isPortraitResolutionCaptureActive"))return 1;
  if (objc_msgSend(a3, "orientation") && objc_msgSend(a3, "orientation") != 1)
  {
    if (objc_msgSend(a3, "orientation") != 3 && objc_msgSend(a3, "orientation") != 2)
      return 1;
    objc_msgSend(a3, "ratio");
    v8 = v7;
    objc_msgSend(a3, "ratio");
    if (v8 >= v9)
      return 1;
  }
  else
  {
    objc_msgSend(a3, "ratio");
    v5 = v4;
    objc_msgSend(a3, "ratio");
    if (v5 <= v6)
      return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v12)
      return result;
    v14 = objc_msgSend(a3, "orientation");
    objc_msgSend(a3, "ratio");
    v16 = v15;
    objc_msgSend(a3, "ratio");
    v18 = 136316418;
    v19 = v10;
    v20 = 2080;
    v21 = "-[VCVideoCaptureServer shouldSendVideoAttributeCallback:]";
    v22 = 1024;
    v23 = 3371;
    v24 = 1024;
    v25 = v14;
    v26 = 2048;
    v27 = v16;
    v28 = 2048;
    v29 = v17;
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Should not callback. isPortraitResolutionCaptureActive=YES, orientation=%d, width=%.0f, height=%.0f", (uint8_t *)&v18, 0x36u);
  }
  return 0;
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_52(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48)));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(a1 + 48);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      v9 = 1024;
      v10 = 758;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Initialized camera preview client pid=%u", (uint8_t *)&v5, 0x22u);
    }
  }
}

- (int)bestCameraCaptureFrameRate
{
  return self->_bestCameraCaptureFrameRate;
}

- (void)setCameraZoomAvailable:(BOOL)a3 currentZoomFactor:(double)a4 maxZoomFactor:(double)a5
{
  _BOOL8 v7;
  id v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  NSObject *captureServerQueue;
  _QWORD v18[6];

  v7 = a3;
  v18[5] = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7);
  v11 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v12 = a4;
  v13 = (void *)objc_msgSend(v11, "initWithFloat:", v12);
  v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v15 = a5;
  v16 = (void *)objc_msgSend(v14, "initWithFloat:", v15);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("previewCameraZoomAvailabilty"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("previewCameraZoomFactor"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("previewCameraZoomMaxFactor"));
  captureServerQueue = self->captureServerQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__VCVideoCaptureServer_setCameraZoomAvailable_currentZoomFactor_maxZoomFactor___block_invoke;
  v18[3] = &unk_1E9E521C0;
  v18[4] = v9;
  dispatch_async(captureServerQueue, v18);

}

void __28__VCVideoCaptureServer_init__block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  int ErrorLogLevelForModule;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 328))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "frameCount:", 1);
    else
      v2 = 0;
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "frameCount");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "resetFrameCount");
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "frameCount");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "resetFrameCount");
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_DWORD *)(v7 + 44);
        LODWORD(v7) = *(_DWORD *)(v7 + 48);
        *(_DWORD *)buf = 136317186;
        v16 = v5;
        v17 = 2080;
        v18 = "-[VCVideoCaptureServer init]_block_invoke";
        v19 = 1024;
        v20 = 457;
        v21 = 1024;
        v22 = v2;
        v23 = 1024;
        v24 = v2;
        v25 = 1024;
        v26 = v8;
        v27 = 1024;
        v28 = v7;
        v29 = 1024;
        v30 = v3;
        v31 = 1024;
        v32 = v4;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @=@ Health: VideoCapture cameraPreviewCount=%d, cameraCaptureCount=%d, serverPreviewCount=%d, serverCaptureCount=%d, frontQueueCount=%d, backQueueCount=%d", buf, 0x40u);
      }
    }
    if (!v2 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = 0;
      v13 = 0;
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "frameBecameAvailableCount:figBufferQueueEmptyCount:figBufferQueueErrorCount:", (char *)&v14 + 4, &v14, &v13);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v9 < 0)
      {
        if (ErrorLogLevelForModule >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __28__VCVideoCaptureServer_init__block_invoke_cold_1();
        }
      }
      else if (ErrorLogLevelForModule >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v16 = v11;
          v17 = 2080;
          v18 = "-[VCVideoCaptureServer init]_block_invoke";
          v19 = 1024;
          v20 = 467;
          v21 = 1024;
          v22 = HIDWORD(v14);
          v23 = 1024;
          v24 = v14;
          v25 = 1024;
          v26 = v13;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d frameBecameAvailableCount = %d, figBufferQueueEmptyCount = %d, figBufferQueueErrorCount = %d", buf, 0x2Eu);
        }
      }
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  }
}

uint64_t __61__VCVideoCaptureServer_handleCaptureSourcePositionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "captureSourcePositionDidChange:", *(unsigned __int8 *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)updatePreviewState
{
  id v3;
  void *v4;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPreviewRunning), CFSTR("previewState"), 0);
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCVideoCaptureServer_updatePreviewState__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = v4;
  dispatch_async(delegateNotificationQueue, block);

}

- (void)updateImageQueueFrameRate:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[VCImageQueue frameRate](self->frontQueue, "frameRate");
      v8 = -[VCImageQueue frameRate](self->backQueue, "frameRate");
      v9 = 136316418;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCVideoCaptureServer updateImageQueueFrameRate:]";
      v13 = 1024;
      v14 = 2872;
      v15 = 1024;
      v16 = v7;
      v17 = 1024;
      v18 = v8;
      v19 = 1024;
      v20 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setting both front queue framerate %d and back queue framerate %d to %d", (uint8_t *)&v9, 0x2Eu);
    }
  }
  pthread_mutex_lock(&self->_enqueueLock);
  -[VCImageQueue setFrameRate:](self->frontQueue, "setFrameRate:", v3);
  -[VCImageQueue setFrameRate:](self->backQueue, "setFrameRate:", v3);
  pthread_mutex_unlock(&self->_enqueueLock);
}

- (void)setUpImageRotationConverter
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create VCImageRotationConverter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)previewVideoWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5
{
  void *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int *p_currentFrameRate;
  uint64_t v14;
  NSObject *v15;
  int v16;
  int v17;
  int v18;
  float v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
  {
    if (a3)
      *a3 = -[VCDefaults forceCaptureWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceCaptureWidth");
    if (a4)
      *a4 = -[VCDefaults forceCaptureHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceCaptureHeight");
    if (a5)
      *a5 = -[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
  }
  else
  {
    v19 = NAN;
    v9 = (void *)MEMORY[0x1DF088A10]();
    -[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getBestFrameWidth:frameHeight:frameRate:", a3, a4, &v19);
    objc_autoreleasePoolPop(v9);
    if (a5)
    {
      v10 = (int)v19;
      if ((int)v19 <= 5)
        v10 = 5;
      if (v10 >= 0x3C)
        v10 = 60;
      *a5 = v10;
    }
    if (a3)
    {
      v11 = *a3;
      if (*a3 <= 320)
        v11 = 320;
      if (v11 >= 0x800)
        v11 = 2048;
      *a3 = v11;
    }
    if (a4)
    {
      v12 = *a4;
      if (*a4 <= 240)
        v12 = 240;
      if (v12 >= 0x800)
        v12 = 2048;
      *a4 = v12;
    }
  }
  if (a5)
    p_currentFrameRate = a5;
  else
    p_currentFrameRate = &self->currentFrameRate;
  self->_bestCameraCaptureFrameRate = *p_currentFrameRate;
  if (a3 && a4 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *a3;
      v17 = *a4;
      v18 = *p_currentFrameRate;
      v19 = 4.8155e-34;
      v20 = v14;
      v21 = 2080;
      v22 = "-[VCVideoCaptureServer previewVideoWidth:height:frameRate:]";
      v23 = 1024;
      v24 = 1418;
      v25 = 1024;
      v26 = v16;
      v27 = 1024;
      v28 = v17;
      v29 = 1024;
      v30 = v18;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Camera preview settings %dx%d@%dfps", (uint8_t *)&v19, 0x2Eu);
    }
  }
}

- (void)dispatchedSetCaptureFrameRate:(int)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[VCVideoCaptureServer getCappedFrameRate:](self, "getCappedFrameRate:", *(_QWORD *)&a3);
  v5 = -[VCVideoSource setFrameRate:](self->avCapture, "setFrameRate:", v4);
  if ((v5 & 0x80000000) != 0)
    -[VCVideoCaptureServer handleAVCaptureError:domain:](self, "handleAVCaptureError:domain:", v5, CFSTR("avCaptureSetFrameRateFail"));
  else
    self->currentFrameRate = v4;
}

- (int)getCappedFrameRate:(int)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  int currentFrameRate;
  int thermalLevel;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->captureServerQueue);
  if (!self->_forceDisableThermal)
  {
    v5 = -[VCVideoCaptureServer getFrameRateForThermalLevel:peakPowerPressure:](self, "getFrameRateForThermalLevel:peakPowerPressure:", self->_thermalLevel, self->_peakPowerLevel);
    if (v5 < a3)
      a3 = v5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      currentFrameRate = self->currentFrameRate;
      thermalLevel = self->_thermalLevel;
      v11 = 136316418;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VCVideoCaptureServer getCappedFrameRate:]";
      v15 = 1024;
      v16 = 2781;
      v17 = 1024;
      v18 = currentFrameRate;
      v19 = 1024;
      v20 = a3;
      v21 = 1024;
      v22 = thermalLevel;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setting current camera framerate %d to %d, with thermal level %d", (uint8_t *)&v11, 0x2Eu);
    }
  }
  return a3;
}

- (int)getFrameRateForThermalLevel:(int)a3 peakPowerPressure:(int)a4
{
  uint64_t v4;
  int v6;
  int result;

  v4 = *(_QWORD *)&a3;
  v6 = -[VCVideoCaptureServer getFrameRateForPeakPowerLevel:](self, "getFrameRateForPeakPowerLevel:", *(_QWORD *)&a4);
  result = -[VCVideoCaptureServer getFrameRateForThermalLevel:](self, "getFrameRateForThermalLevel:", v4);
  if (v6 < result)
    return v6;
  return result;
}

- (int)getFrameRateForThermalLevel:(int)a3
{
  int v5;
  int maxFrameRate;
  int v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BYTE v26[10];
  VCVideoCaptureServer *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3 > 29)
  {
    if (a3 == 30 || a3 == 40 || a3 == 50)
      maxFrameRate = 5;
    else
      maxFrameRate = 0;
  }
  else if (a3)
  {
    if (a3 == 20)
      v5 = 15;
    else
      v5 = 0;
    if (a3 == 10)
      maxFrameRate = 30;
    else
      maxFrameRate = v5;
  }
  else
  {
    maxFrameRate = self->_maxFrameRate;
  }
  v7 = self->_maxFrameRate;
  if (v7 >= maxFrameRate)
    v8 = maxFrameRate;
  else
    v8 = v7;
  v9 = -[VCDefaults forceThermalLevelFramerate:](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceThermalLevelFramerate:", v8);
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136316162;
        v20 = v11;
        v21 = 2080;
        v22 = "-[VCVideoCaptureServer getFrameRateForThermalLevel:]";
        v23 = 1024;
        v24 = 1987;
        v25 = 1024;
        *(_DWORD *)v26 = v9;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = a3;
        v13 = "VCVideoCaptureServer [%s] %s:%d Framerate is %d for thermalLevel:%d";
        v14 = v12;
        v15 = 40;
LABEL_28:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCVideoCaptureServer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136316674;
        v20 = v16;
        v21 = 2080;
        v22 = "-[VCVideoCaptureServer getFrameRateForThermalLevel:]";
        v23 = 1024;
        v24 = 1987;
        v25 = 2112;
        *(_QWORD *)v26 = v10;
        *(_WORD *)&v26[8] = 2048;
        v27 = self;
        v28 = 1024;
        v29 = v9;
        v30 = 1024;
        v31 = a3;
        v13 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Framerate is %d for thermalLevel:%d";
        v14 = v17;
        v15 = 60;
        goto LABEL_28;
      }
    }
  }
  return v9;
}

- (int)getFrameRateForPeakPowerLevel:(int)a3
{
  int v5;
  int v6;
  int maxFrameRate;
  int v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[10];
  VCVideoCaptureServer *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3 <= 19)
  {
    if (a3)
    {
      if (a3 == 10)
        maxFrameRate = 30;
      else
        maxFrameRate = 0;
    }
    else
    {
      maxFrameRate = self->_maxFrameRate;
    }
  }
  else
  {
    if (a3 == 40)
      v5 = 5;
    else
      v5 = 0;
    if (a3 == 30)
      v6 = 5;
    else
      v6 = v5;
    if (a3 == 20)
      maxFrameRate = 15;
    else
      maxFrameRate = v6;
  }
  v8 = self->_maxFrameRate;
  if (v8 >= maxFrameRate)
    v9 = maxFrameRate;
  else
    v9 = v8;
  v10 = -[VCDefaults forceThermalLevelFramerate:](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceThermalLevelFramerate:", v9);
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136316162;
        v21 = v12;
        v22 = 2080;
        v23 = "-[VCVideoCaptureServer getFrameRateForPeakPowerLevel:]";
        v24 = 1024;
        v25 = 2018;
        v26 = 1024;
        *(_DWORD *)v27 = v10;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = a3;
        v14 = "VCVideoCaptureServer [%s] %s:%d Framerate is %d for peakPowerLevel:%d";
        v15 = v13;
        v16 = 40;
LABEL_29:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCVideoCaptureServer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136316674;
        v21 = v17;
        v22 = 2080;
        v23 = "-[VCVideoCaptureServer getFrameRateForPeakPowerLevel:]";
        v24 = 1024;
        v25 = 2018;
        v26 = 2112;
        *(_QWORD *)v27 = v11;
        *(_WORD *)&v27[8] = 2048;
        v28 = self;
        v29 = 1024;
        v30 = v10;
        v31 = 1024;
        v32 = a3;
        v14 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Framerate is %d for peakPowerLevel:%d";
        v15 = v18;
        v16 = 60;
        goto LABEL_29;
      }
    }
  }
  return v10;
}

- (int)createVideoCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5 useBackFacingCamera:(BOOL)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  VCAVFoundationCapture *v15;
  BOOL cinematicFramingEnabled;
  VCVideoSource *avCapture;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, CMSampleBufferRef, CMTime *, uint64_t, uint64_t, int);
  int v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  v22 = -2146893808;
  v21 = VCVideoCaptureServer_OnCaptureVideoFrame;
  v10 = (id)VCDefaults_CopyStringValueForKey(CFSTR("cannedReplay"));
  if ((v10
     || (v10 = +[VCDefaults copyStringValueForKey:](VCDefaults, "copyStringValueForKey:", CFSTR("videoCannedReplay"))) != 0)&& objc_msgSend(v10, "length")&& !-[VCDefaults useVirtualCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useVirtualCapture"))
  {
    LOBYTE(v20) = 1;
    self->avCapture = (VCVideoSource *)-[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:]([CannedVideoCapture alloc], "initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:", self, &v21, v8, v7, v6, self->_currentVideoSourceToken.var0.var1, v10, v20, &v22);
  }

  if (!self->avCapture)
  {
    if (!self->_currentVideoSourceToken.var0.var1)
    {
      if (self->_followSystemCamera)
      {
        v11 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C8B0A0], "systemPreferredCamera"), "uniqueID");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v24 = v12;
            v25 = 2080;
            v26 = "-[VCVideoCaptureServer createVideoCaptureWithWidth:height:frameRate:useBackFacingCamera:]";
            v27 = 1024;
            v28 = 1089;
            v29 = 2112;
            v30 = v11;
            _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Creating capture with system preferred camera=%@", buf, 0x26u);
          }
        }
      }
      else
      {
        v11 = CFSTR("com.apple.avfoundation.avcapturedevice.built-in_video:1");
      }
      v14 = objc_msgSend(+[VCVideoSourceTokenManager sharedManager](VCVideoSourceTokenManager, "sharedManager"), "tokenForDeviceName:sourceType:", v11, 1);
      self->_currentVideoSourceToken.var0.var1 = v14;
      if (!v14 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoCaptureServer createVideoCaptureWithWidth:height:frameRate:useBackFacingCamera:].cold.1();
      }
    }
    if (self->_useAVCaptureSession)
    {
      v15 = [VCAVFoundationCapture alloc];
      cinematicFramingEnabled = self->_cinematicFramingEnabled;
      HIDWORD(v19) = -[VideoAttributes orientation](self->localVideoAttributes, "orientation");
      LODWORD(v20) = self->_defaultCapturePixelFormat;
      LOBYTE(v19) = cinematicFramingEnabled;
      avCapture = -[VCAVFoundationCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cinematicFramingEnabled:videoOrientation:capturePixelFormat:](v15, "initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:cinematicFramingEnabled:videoOrientation:capturePixelFormat:", self, &v21, v8, v7, v6, self->_currentVideoSourceToken.var0.var1, v19, v20);
      self->avCapture = avCapture;
      if (!avCapture)
        return v22;
    }
    else
    {
      avCapture = self->avCapture;
      if (!avCapture)
        return v22;
    }
    -[VCVideoCaptureServer handleCaptureSourcePositionDidChange:](self, "handleCaptureSourcePositionDidChange:", -[VCVideoSource isFrontCamera](avCapture, "isFrontCamera"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[VCVideoSource setBufferStatsBuffer:](self->avCapture, "setBufferStatsBuffer:", &self->_bufferStatsData);
    return 0;
  }
  return v22;
}

- (void)handleCaptureSourcePositionDidChange:(BOOL)a3
{
  NSObject *captureClientQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VCVideoCaptureServer_handleCaptureSourcePositionDidChange___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureClientQueue, block);
}

void *__47__VCVideoCaptureServer_registerBlocksForServer__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  VCCameraPreview *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD v18[6];
  _QWORD block[6];
  int v20;
  _BYTE buf[24];
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "localVideoAttributes"), "copyEncodedDictionary");
  v6 = objc_alloc_init(VCCameraPreview);
  v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), "intValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      v22 = 755;
      v23 = 1024;
      v24 = v7;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Adding PID %d to client monitor", buf, 0x22u);
    }
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 280);
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_52;
  block[3] = &unk_1E9E522D8;
  v20 = v7;
  block[4] = v10;
  block[5] = v6;
  dispatch_async(v11, block);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v22) = 0;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(NSObject **)(v13 + 256);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_54;
  v18[3] = &unk_1E9E52938;
  v18[4] = v13;
  v18[5] = buf;
  dispatch_sync(v14, v18);
  v15 = objc_alloc(MEMORY[0x1E0C99E08]);
  v4 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", v5, CFSTR("localVideoAttributes"), v6, CFSTR("CONTEXT"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24)), CFSTR("previewState"), 0);
  v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "deviceNameForToken:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 104));
  if (v16)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("localCameraUIDString"));

  _Block_object_dispose(buf, 8);
  return v4;
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t *v30;
  id v31;
  NSObject *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  uint64_t v53;
  uint64_t v54;
  _QWORD block[6];
  _QWORD v56[5];
  _BYTE buf[12];
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  _BYTE v63[10];
  uint64_t v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v2;
      v58 = 2080;
      v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke";
      v60 = 1024;
      v61 = 1247;
      v62 = 2112;
      *(_QWORD *)v63 = v4;
      *(_WORD *)&v63[8] = 2112;
      v64 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d eventType=%@, subType=%@", buf, 0x30u);
    }
  }
  v6 = (id *)(a1 + 48);
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "deviceNameForToken:", *(unsigned int *)(*(_QWORD *)(a1 + 48) + 104));
  v8 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("avCaptureFail")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v9;
        v58 = 2080;
        v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke";
        v60 = 1024;
        v61 = 1250;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d received AVCAPTURE_FAILURE_CAPTURE", buf, 0x1Cu);
      }
    }
    *(_QWORD *)buf = 0;
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32023, 114, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoCaptureServer.m", 1255), CFSTR("Video capture failed."), CFSTR("Camera unavailable"));
    v11 = *v6;
    v12 = *(_QWORD *)buf;
    v13 = 32023;
LABEL_14:
    objc_msgSend(v11, "handleAVCaptureError:error:", v13, v12);
    return;
  }
  if (objc_msgSend(*v8, "isEqualToString:", CFSTR("avCaptureServerDied")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v14;
        v58 = 2080;
        v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke";
        v60 = 1024;
        v61 = 1261;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d received AVCAPTURE_FAILURE_CAPTURE_SERVER_DIED", buf, 0x1Cu);
      }
    }
    *(_QWORD *)buf = 0;
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32032, 114, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoCaptureServer.m", 1266), CFSTR("Video capture failed."), CFSTR("Capture Server Died"));
    v11 = *v6;
    v12 = *(_QWORD *)buf;
    v13 = 32032;
    goto LABEL_14;
  }
  if (objc_msgSend(*v8, "isEqualToString:", CFSTR("avCaptureCameraBecameAvailable")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v16;
        v58 = 2080;
        v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke";
        v60 = 1024;
        v61 = 1271;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d received AVCAPTURE_EVENT_CAMERA_AVAILABLE", buf, 0x1Cu);
      }
    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = v18;
    if (v7)
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, CFSTR("localCameraUIDString"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_1();
    }
    v23 = *((_QWORD *)*v6 + 37);
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_161;
    v56[3] = &unk_1E9E521C0;
    v56[4] = v19;
    dispatch_async(v23, v56);

    v24 = *v6;
    v25 = *((_QWORD *)*v6 + 15);
    v26 = 1;
LABEL_32:
    objc_msgSend(v24, "notifyCameraDidChangeAvailability:available:", v25, v26);
    return;
  }
  if ((objc_msgSend(*v8, "isEqualToString:", CFSTR("vcScreenCaptureFailStart")) & 1) != 0
    || objc_msgSend(*v8, "isEqualToString:", CFSTR("vcScreenCaptureFailPreempt")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_2();
    }
    objc_msgSend(*v6, "stopCapture");
    v20 = *v6;
    v21 = *((_QWORD *)*v6 + 33);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_168;
    block[3] = &unk_1E9E52238;
    v22 = *v8;
    block[4] = v20;
    block[5] = v22;
    dispatch_async(v21, block);
    objc_msgSend(*v6, "sendBiomeEventIsStarting:", 0);
    return;
  }
  if (objc_msgSend(*v8, "isEqualToString:", CFSTR("avCaptureCameraDidStart")))
  {
    v27 = *v6;
    v28 = *((_QWORD *)*v6 + 37);
    if (*((_QWORD *)*v6 + 48))
    {
      v54 = MEMORY[0x1E0C809B0];
      v29 = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_2;
      v30 = &v54;
    }
    else
    {
      v27 = 0;
      v53 = MEMORY[0x1E0C809B0];
      v29 = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_3;
      v30 = &v53;
    }
    v30[1] = 3221225472;
    v30[2] = (uint64_t)v29;
    v30[3] = (uint64_t)&unk_1E9E521C0;
    v30[4] = (uint64_t)v27;
    dispatch_async(v28, v30);
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return;
    v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v38 = *((_DWORD *)*v6 + 2);
    v39 = *((_DWORD *)*v6 + 3);
    v40 = *((_DWORD *)*v6 + 4);
    v41 = *((unsigned __int8 *)*v6 + 454);
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = v36;
    v58 = 2080;
    v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke_4";
    v60 = 1024;
    v61 = 1310;
    v62 = 1024;
    *(_DWORD *)v63 = v38;
    *(_WORD *)&v63[4] = 1024;
    *(_DWORD *)&v63[6] = v39;
    LOWORD(v64) = 1024;
    *(_DWORD *)((char *)&v64 + 2) = v40;
    HIWORD(v64) = 1024;
    v65 = v41;
    v42 = "VCVideoCaptureServer [%s] %s:%d %dx%d @ %d, _isPreviewRunning=%d";
    v43 = v37;
    v44 = 52;
LABEL_52:
    _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
    return;
  }
  if (!objc_msgSend(*v8, "isEqualToString:", CFSTR("avCaptureCameraDidStop")))
  {
    if (objc_msgSend(*v8, "isEqualToString:", CFSTR("avCaptureCameraInterrupted")))
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", *(_QWORD *)(a1 + 40), CFSTR("previewInterruptionReason"), 0);
      v35 = v34;
      if (v7)
      {
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v7, CFSTR("localCameraUIDString"));
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_3();
      }
      v50 = *((_QWORD *)*v6 + 37);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_189;
      v51[3] = &unk_1E9E521C0;
      v51[4] = v35;
      dispatch_async(v50, v51);
      v24 = *v6;
      v25 = *((_QWORD *)*v6 + 15);
      v26 = 0;
      goto LABEL_32;
    }
    if (objc_msgSend(*v8, "isEqualToString:", CFSTR("vcScreenCaptureScreenAndCameraMixingEnabled")))
    {
      v45 = *v6;
      v46 = 1;
    }
    else
    {
      if (!objc_msgSend(*v8, "isEqualToString:", CFSTR("vcScreenCaptureScreenAndCameraMixingDisabled")))
        return;
      v45 = *v6;
      v46 = 0;
    }
    objc_msgSend(v45, "screenAndCameraMixingEnable:", v46);
    return;
  }
  v31 = *v6;
  v32 = *((_QWORD *)*v6 + 37);
  if (*((_QWORD *)*v6 + 48))
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_179;
    v52[3] = &unk_1E9E521C0;
    v52[4] = v31;
    v33 = v52;
  }
  else
  {
    v33 = &__block_literal_global_74;
  }
  dispatch_async(v32, v33);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v47 = VRTraceErrorLogLevelToCSTR();
    v48 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v49 = *((unsigned __int8 *)*v6 + 454);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v47;
      v58 = 2080;
      v59 = "-[VCVideoCaptureServer handleCaptureEvent:subType:]_block_invoke_3";
      v60 = 1024;
      v61 = 1323;
      v62 = 1024;
      *(_DWORD *)v63 = v49;
      v42 = "VCVideoCaptureServer [%s] %s:%d _isPreviewRunning=%d";
      v43 = v48;
      v44 = 34;
      goto LABEL_52;
    }
  }
}

- (void)handleCaptureEvent:(id)a3 subType:(id)a4
{
  NSObject *captureServerQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = self;
  dispatch_async(captureServerQueue, v5);
}

- (void)handleCaptureEvent:(id)a3
{
  -[VCVideoCaptureServer handleCaptureEvent:subType:](self, "handleCaptureEvent:subType:", a3, 0);
}

void __59__VCVideoCaptureServer_captureVideoWidth_height_frameRate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _DWORD *v7;
  int *v8;
  int *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count"))
  {
    v13 = 2048;
    *(_DWORD *)buf = 2048;
    v12 = 60;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(a1 + 32), "updateCaptureWidth:height:frameRate:withVideoRule:", buf, &v13, &v12, objc_msgSend(*(id *)(a1 + 32), "videoRuleForClient:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)));
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      }
      while (v4);
    }
    v7 = *(_DWORD **)(a1 + 48);
    if (v7)
      *v7 = *(_DWORD *)buf;
    v8 = *(int **)(a1 + 56);
    if (v8)
      *v8 = v13;
    v9 = *(int **)(a1 + 64);
    if (v9)
      *v9 = v12;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VCVideoCaptureServer captureVideoWidth:height:frameRate:]_block_invoke";
      v18 = 1024;
      v19 = 1481;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d cameraVideoSinks is empty", buf, 0x1Cu);
    }
  }
}

+ (id)VCVideoCaptureServerSingleton
{
  void *v3;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  if (!_vcVideoCaptureServerSingleton)
    _vcVideoCaptureServerSingleton = (uint64_t)objc_alloc_init((Class)a1);
  objc_sync_exit(v3);
  return (id)_vcVideoCaptureServerSingleton;
}

- (VCVideoCaptureServer)init
{
  VCVideoCaptureServer *v2;
  VCVideoCaptureServer *v3;
  VideoAttributes *v4;
  NSObject *CustomRootQueue;
  NSObject *v6;
  const dispatch_source_type_s *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int thermalNotificationToken;
  int v13;
  NSObject *v14;
  int peakPowerNotificationToken;
  int v16;
  OpaqueCMClock *HostTimeClock;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  CMTime time;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD handler[5];
  objc_super v27;
  _BYTE state64[12];
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)VCVideoCaptureServer;
  v2 = -[VCVideoCaptureServer init](&v27, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->snapshotRequestCount = 0;
    *(_QWORD *)&v2->currentWidth = 0;
    *(_QWORD *)&v2->currentFrameRate = 0;
    v2->_screenCurrentFrameRate = 0;
    v2->_defaultCapturePixelFormat = VCVideoUtil_DefaultCameraCapturePixelFormat();
    v3->avCapture = 0;
    v3->appDelegate = 0;
    v3->_screenShareCaptureConfig = 0;
    v3->frontQueue = 0;
    v3->backQueue = 0;
    v3->_screenCaptureSource = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_screenCaptureConfig = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_screenClientToCaptureSourceID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_screenCaptureThermalFrameRateThresholds = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_systemAudioCapture = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_systemAudioCaptureConfig = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_systemAudioSourceToClients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->cameraVideoSinks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->screenCaptureClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_cameraPreviewClients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_cameraSinkVideoRules = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = objc_alloc_init(VideoAttributes);
    v3->localVideoAttributes = v4;
    -[VideoAttributes setOrientation:](v4, "setOrientation:", 0);
    v3->_tokenManager = (VCVideoSourceTokenManager *)+[VCVideoSourceTokenManager sharedManager](VCVideoSourceTokenManager, "sharedManager");
    v3->_useAVCaptureSession = 1;
    -[VCVideoCaptureServer setUpDefaultAspectRatios](v3, "setUpDefaultAspectRatios");
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v3->captureClientQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.captureClientQueue", 0, CustomRootQueue);
    v3->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.xpcCommandQueue", 0, CustomRootQueue);
    v3->delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.delegateNotificationQueue", 0, CustomRootQueue);
    v6 = VCDispatchQueue_GetCustomRootQueue(37);
    v3->captureServerQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.captureServerQueue", 0, v6);
    v3->variablesQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.variablesQueue", MEMORY[0x1E0C80D50], v6);
    v3->snapshotQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.snapshotQueue", 0, v6);
    v3->_cameraPreviewClientMonitorQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.clientMonitorQueue", 0, v6);
    v7 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DD0];
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v3->captureServerQueue);
    v3->cameraHealthMonitor = (OS_dispatch_source *)v8;
    dispatch_source_set_timer(v8, 0, 0x12A05F200uLL, 0x11E1A300uLL);
    v9 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __28__VCVideoCaptureServer_init__block_invoke;
    handler[3] = &unk_1E9E521C0;
    handler[4] = v3;
    dispatch_source_set_event_handler((dispatch_source_t)v3->cameraHealthMonitor, handler);
    dispatch_source_set_cancel_handler((dispatch_source_t)v3->cameraHealthMonitor, handler);
    v10 = dispatch_source_create(v7, 0, 0, (dispatch_queue_t)v3->captureClientQueue);
    v3->screenHealthMonitor = (OS_dispatch_source *)v10;
    dispatch_source_set_timer(v10, 0, 0x12A05F200uLL, 0x11E1A300uLL);
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __28__VCVideoCaptureServer_init__block_invoke_22;
    v25[3] = &unk_1E9E521C0;
    v25[4] = v3;
    dispatch_source_set_event_handler((dispatch_source_t)v3->screenHealthMonitor, v25);
    dispatch_source_set_cancel_handler((dispatch_source_t)v3->screenHealthMonitor, v25);
    -[VideoAttributes setCamera:](v3->localVideoAttributes, "setCamera:", 3);
    *(_WORD *)&v3->_viewPointCorrectionEnabledByThermal = 257;
    if (!-[VCVideoCaptureServer isAirPlayXPCHelper](v3, "isAirPlayXPCHelper"))
      -[VCVideoCaptureServer registerBlocksForServer](v3, "registerBlocksForServer");
    v11 = (const char *)*MEMORY[0x1E0C83A00];
    notify_register_check((const char *)*MEMORY[0x1E0C83A00], &v3->_thermalNotificationToken);
    thermalNotificationToken = v3->_thermalNotificationToken;
    *(_QWORD *)state64 = 0;
    notify_get_state(thermalNotificationToken, (uint64_t *)state64);
    v13 = *(_DWORD *)state64;
    v3->_newThermalLevel = *(_DWORD *)state64;
    v3->_thermalLevel = v13;
    v3->_forceDisableThermal = -[VCDefaults forceDisableThermal](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableThermal");
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __28__VCVideoCaptureServer_init__block_invoke_26;
    v24[3] = &unk_1E9E53170;
    v24[4] = v3;
    v14 = MEMORY[0x1E0C80D38];
    notify_register_dispatch(v11, &v3->_thermalNotificationToken, MEMORY[0x1E0C80D38], v24);
    notify_register_check("com.apple.system.peakpowerpressurelevel", &v3->_peakPowerNotificationToken);
    peakPowerNotificationToken = v3->_peakPowerNotificationToken;
    *(_QWORD *)state64 = 0;
    notify_get_state(peakPowerNotificationToken, (uint64_t *)state64);
    v16 = *(_DWORD *)state64;
    v3->_newPeakPowerLevel = *(_DWORD *)state64;
    v3->_peakPowerLevel = v16;
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __28__VCVideoCaptureServer_init__block_invoke_2;
    v23[3] = &unk_1E9E53170;
    v23[4] = v3;
    notify_register_dispatch("com.apple.system.peakpowerpressurelevel", &v3->_peakPowerNotificationToken, v14, v23);
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&time, HostTimeClock);
    v3->_previousFrameTime = CMTimeGetSeconds(&time);
    if (!-[VCVideoCaptureServer isAirPlayXPCHelper](v3, "isAirPlayXPCHelper")
      && +[VCHardwareSettings isExternalCameraSupported](VCHardwareSettings, "isExternalCameraSupported"))
    {
      -[VCVideoCaptureServer setFollowSystemCamera:](v3, "setFollowSystemCamera:", 1);
    }
    v3->_skipPreviewRotation = VCFeatureFlagManager_PreviewMSROptimizationForEmbedded();
    v3->_is1080pCameraAvailable = 1;
    -[VCVideoCaptureServer setupStreamInputs](v3, "setupStreamInputs");
    -[VCVideoCaptureServer setUpImageRotationConverter](v3, "setUpImageRotationConverter");
    -[VCVideoCaptureServer setupLogFiles](v3, "setupLogFiles");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v20 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)state64 = 136315650;
          *(_QWORD *)&state64[4] = v18;
          v29 = 2080;
          v30 = "-[VCVideoCaptureServer init]";
          v31 = 1024;
          v32 = 549;
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d done initialization of singleton", state64, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoCaptureServer init].cold.1();
      }
    }
    pthread_mutex_init(&v3->_enqueueLock, 0);
  }
  return v3;
}

void __28__VCVideoCaptureServer_init__block_invoke_22(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "frameCount:", 1);
    else
      v2 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "frameDropsWithShouldReset:", 1);
    else
      v3 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136316162;
        v7 = v4;
        v8 = 2080;
        v9 = "-[VCVideoCaptureServer init]_block_invoke";
        v10 = 1024;
        v11 = 494;
        v12 = 1024;
        v13 = v2;
        v14 = 1024;
        v15 = v3;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @=@ Health: ScreenCapture screenCaptureCount=%d screenCaptureFrameDrops=%d", (uint8_t *)&v6, 0x28u);
      }
    }
  }
}

uint64_t __28__VCVideoCaptureServer_init__block_invoke_26(uint64_t a1, int token)
{
  void *v2;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v4[0] = 0;
  notify_get_state(token, v4);
  return objc_msgSend(v2, "thermalLevelDidChange:", LODWORD(v4[0]));
}

uint64_t __28__VCVideoCaptureServer_init__block_invoke_2(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  result = notify_get_state(token, v4);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 448) = v4[0];
  return result;
}

- (BOOL)isAirPlayXPCHelper
{
  pid_t v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  __int128 v9;
  int pid[4];
  __int128 v11;
  uint64_t v12;
  _BYTE __b[4096];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  v12 = 0;
  *(_OWORD *)pid = 0u;
  v11 = 0u;
  v9 = 0u;
  v2 = getpid();
  if (proc_pidinfo(v2, 17, 1uLL, &v9, 56) != 56)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer isAirPlayXPCHelper].cold.2();
    }
    goto LABEL_11;
  }
  v3 = proc_pidpath(pid[0], __b, 0x1000u);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (void *)objc_msgSend(v4, "initWithBytes:length:encoding:", __b, v3, 4, v9);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer isAirPlayXPCHelper].cold.1();
    }
LABEL_11:
    v6 = 0;
    v7 = 0;
    goto LABEL_4;
  }
  v6 = v5;
  v7 = objc_msgSend(CFSTR("AirPlayXPCHelper"), "isEqualToString:", objc_msgSend(v5, "lastPathComponent"));
LABEL_4:

  return v7;
}

- (void)setupLogFiles
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d failed to open capture_statistics.log", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpDefaultAspectRatios
{
  unsigned int v3;
  unsigned int v4;
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;
  NSSize defaultPortraitAspectRatio;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = +[VCHardwareSettings screenWidth](VCHardwareSettings, "screenWidth");
  v4 = +[VCHardwareSettings screenHeight](VCHardwareSettings, "screenHeight");
  self->_defaultPortraitAspectRatio.width = (double)v4;
  self->_defaultPortraitAspectRatio.height = (double)v3;
  self->_defaultLandscapeAspectRatio.width = (double)v3;
  self->_defaultLandscapeAspectRatio.height = (double)v4;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      defaultPortraitAspectRatio = self->_defaultPortraitAspectRatio;
      v12 = 136315906;
      v13 = v7;
      v14 = 2080;
      v15 = "-[VCVideoCaptureServer setUpDefaultAspectRatios]";
      v16 = 1024;
      v17 = 615;
      v18 = 2112;
      v19 = NSStringFromSize(defaultPortraitAspectRatio);
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d _defaultPortraitAspectRatio=%@", (uint8_t *)&v12, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSStringFromSize(self->_defaultLandscapeAspectRatio);
      v12 = 136315906;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCVideoCaptureServer setUpDefaultAspectRatios]";
      v16 = 1024;
      v17 = 616;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d _defaultLandscapeAspectRatio=%@", (uint8_t *)&v12, 0x26u);
    }
  }
  -[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:](self, "updateLocalAspectRatios:localScreenAspectRatio:", 0, self->_defaultPortraitAspectRatio.width, self->_defaultPortraitAspectRatio.height);
  -[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:](self, "updateLocalAspectRatios:localScreenAspectRatio:", 2, self->_defaultLandscapeAspectRatio.width, self->_defaultLandscapeAspectRatio.height);
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *cameraHealthMonitor;
  NSObject *v12;
  NSObject *screenHealthMonitor;
  NSObject *v14;
  OpaqueVTPixelTransferSession *transferSession;
  __CVPixelBufferPool *bufferPool;
  FILE *bufferStatsDumpFile;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCVideoCaptureServer *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = v4;
        v21 = 2080;
        v22 = "-[VCVideoCaptureServer dealloc]";
        v23 = 1024;
        v24 = 622;
        v6 = "VCVideoCaptureServer [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoCaptureServer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v20 = v9;
        v21 = 2080;
        v22 = "-[VCVideoCaptureServer dealloc]";
        v23 = 1024;
        v24 = 622;
        v25 = 2112;
        v26 = v3;
        v27 = 2048;
        v28 = self;
        v6 = "VCVideoCaptureServer [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  notify_cancel(self->_thermalNotificationToken);
  notify_cancel(self->_peakPowerNotificationToken);
  if (self->_followSystemCamera)
    -[VCVideoCaptureServer removeObserveSystemPreferredCamera](self, "removeObserveSystemPreferredCamera");
  pthread_mutex_lock(&self->_enqueueLock);

  self->frontQueue = 0;
  self->backQueue = 0;
  pthread_mutex_unlock(&self->_enqueueLock);
  pthread_mutex_destroy(&self->_enqueueLock);

  -[NSMutableArray removeAllObjects](self->cameraVideoSinks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->screenCaptureClients, "removeAllObjects");

  dispatch_release((dispatch_object_t)self->_cameraPreviewClientMonitorQueue);
  cameraHealthMonitor = self->cameraHealthMonitor;
  if (cameraHealthMonitor)
  {
    dispatch_source_cancel(cameraHealthMonitor);
    v12 = self->cameraHealthMonitor;
    if (v12)
    {
      dispatch_release(v12);
      self->cameraHealthMonitor = 0;
    }
  }
  screenHealthMonitor = self->screenHealthMonitor;
  if (screenHealthMonitor)
  {
    dispatch_source_cancel(screenHealthMonitor);
    v14 = self->screenHealthMonitor;
    if (v14)
    {
      dispatch_release(v14);
      self->screenHealthMonitor = 0;
    }
  }
  dispatch_release((dispatch_object_t)self->captureServerQueue);
  dispatch_release((dispatch_object_t)self->captureClientQueue);
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);
  dispatch_release((dispatch_object_t)self->delegateNotificationQueue);
  dispatch_release((dispatch_object_t)self->variablesQueue);
  dispatch_release((dispatch_object_t)self->snapshotQueue);
  transferSession = self->transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    CFRelease(self->transferSession);
  }
  bufferPool = self->bufferPool;
  if (bufferPool)
    CVPixelBufferPoolRelease(bufferPool);
  -[VCVideoCaptureServer tearDownImageRotationConverter](self, "tearDownImageRotationConverter");
  -[VCVideoCaptureServer cleanupStreamInputs](self, "cleanupStreamInputs");
  bufferStatsDumpFile = self->_bufferStatsDumpFile;
  if (bufferStatsDumpFile)
    fclose(bufferStatsDumpFile);
  v18.receiver = self;
  v18.super_class = (Class)VCVideoCaptureServer;
  -[VCVideoCaptureServer dealloc](&v18, sel_dealloc);
}

- (VCVideoCaptureServer)allocWithZone:(_NSZone *)a3
{
  return (VCVideoCaptureServer *)_vcVideoCaptureServerSingleton;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)tearDownImageRotationConverter
{

  self->_previewImageRotationConverter = 0;
}

- (void)registerBlocksForServer
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
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke;
  v23[3] = &unk_1E9E53848;
  v23[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewInitialize", v23, self->_xpcCommandQueue);
  v22[0] = v3;
  v22[1] = 3221225472;
  v22[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2;
  v22[3] = &unk_1E9E53848;
  v22[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewStartPreview", v22, self->_xpcCommandQueue);
  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_69;
  v21[3] = &unk_1E9E53848;
  v21[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewPausePreview", v21, self->_xpcCommandQueue);
  v20[0] = v3;
  v20[1] = 3221225472;
  v20[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_73;
  v20[3] = &unk_1E9E53848;
  v20[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewStopPreview", v20, self->_xpcCommandQueue);
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_76;
  v19[3] = &unk_1E9E53848;
  v19[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewSetLocalCamera", v19, self->_xpcCommandQueue);
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_78;
  v18[3] = &unk_1E9E53848;
  v18[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewGetLocalCamera", v18, self->_xpcCommandQueue);
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_3;
  v17[3] = &unk_1E9E53848;
  v17[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewSetLocalVideoAttributes", v17, self->_xpcCommandQueue);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_4;
  v16[3] = &unk_1E9E53848;
  v16[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewSetLocalScreenAttributes", v16, self->_xpcCommandQueue);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_5;
  v15[3] = &unk_1E9E53848;
  v15[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewGetLocalVideoSlot", v15, self->_xpcCommandQueue);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_88;
  v14[3] = &unk_1E9E53848;
  v14[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewGetLocalVideoContext", v14, self->_xpcCommandQueue);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94;
  v13[3] = &unk_1E9E53848;
  v13[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewSetLayerBounds", v13, self->_xpcCommandQueue);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_100;
  v12[3] = &unk_1E9E53848;
  v12[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewGetSnapShot", v12, self->_xpcCommandQueue);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_102;
  v11[3] = &unk_1E9E53848;
  v11[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewBeginPreviewToPIPAnimation", v11, self->_xpcCommandQueue);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_3_104;
  v10[3] = &unk_1E9E53848;
  v10[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewEndPreviewToPIPAnimation", v10, self->_xpcCommandQueue);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_4_106;
  v9[3] = &unk_1E9E53848;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewBeginPIPToPreviewAnimation", v9, self->_xpcCommandQueue);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_5_108;
  v8[3] = &unk_1E9E53848;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewEndPIPToPreviewAnimation", v8, self->_xpcCommandQueue);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_6;
  v7[3] = &unk_1E9E53848;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewCameraZoomFactor", v7, self->_xpcCommandQueue);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_7;
  v6[3] = &unk_1E9E53848;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewCameraZoomFactorRate", v6, self->_xpcCommandQueue);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_8;
  v5[3] = &unk_1E9E53848;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewCameraCinematicFraming", v5, self->_xpcCommandQueue);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_9;
  v4[3] = &unk_1E9E53848;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "previewFollowSystemCamera", v4, self->_xpcCommandQueue);
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_54(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 454);
  return result;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_69(uint64_t a1, void *a2)
{
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (v4)
    {
      objc_msgSend(v4, "setStarted:", 0);
      objc_msgSend(*(id *)(a1 + 32), "pausePreview");
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_69_cold_1();
      }
      objc_msgSend(*(id *)(a1 + 32), "handleAVCaptureError:domain:", 2148073489, CFSTR("avCaptureStopFail"));
    }
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_73(uint64_t a1, void *a2)
{
  char isKindOfClass;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v14[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _WORD v22[9];

  *(_QWORD *)&v22[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((isKindOfClass & 1) != 0)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
        v19 = 1024;
        v20 = 827;
        v21 = 1024;
        *(_DWORD *)v22 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("CLIENTPID")), "intValue");
        v22[2] = 1024;
        *(_DWORD *)&v22[3] = objc_msgSend(a2, "objectForKey:", CFSTR("CLIENTDIED")) != 0;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d stopPreview invoked by %d, client died %d", buf, 0x28u);
      }
    }
    v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(NSObject **)(v9 + 280);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_74;
      v14[3] = &unk_1E9E52238;
      v14[4] = a2;
      v14[5] = v9;
      dispatch_async(v10, v14);
    }
    else
    {
      objc_msgSend(v8, "setStarted:", 0);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "canStopPreview"))
      objc_msgSend(*(id *)(a1 + 32), "stopPreview");
  }
  else if (ErrorLogLevelForModule >= 5)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      v19 = 1024;
      v20 = 823;
      v21 = 2112;
      *(_QWORD *)v22 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "description");
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d VCVideoCaptureServer: context is not of type VCCameraPreview, %@", buf, 0x26u);
    }
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("CLIENTPID")), "intValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      v10 = 1024;
      v11 = 835;
      v12 = 1024;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Removing camera preview client pid=%u", (uint8_t *)&v6, 0x22u);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2));
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_76(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend(*(id *)(a1 + 32), "setLocalCamera:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localCameraUIDString")));
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_78(uint64_t a1, void *a2)
{
  uint64_t v4;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "deviceNameForToken:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 104));
  return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("localCameraUIDString"), 0);
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_4(uint64_t a1, void *a2)
{
  VideoAttributes *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localVideoAttributes")));
    objc_msgSend(*(id *)(a1 + 32), "setLocalScreenAttributes:", v4);

  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  NSRect v35;

  v34 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoSlotFacing"));
  v35 = NSRectFromString((NSString *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceVisualRectangle")));
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  v23 = 1;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v22 = unk_1D910F618;
  v15 = 0;
  LOBYTE(v16) = objc_msgSend(v5, "BOOLValue");
  v17 = &v23;
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  LOWORD(v22) = 1;
  v10 = objc_msgSend(*(id *)(a1 + 32), "setLocalVideoDestination:", &v15);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ previewGetLocalVideoContext");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v25 = v11;
      v26 = 2080;
      v27 = "-[VCVideoCaptureServer registerBlocksForServer]_block_invoke";
      v28 = 1024;
      v29 = 932;
      v30 = 1024;
      v31 = v10;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ previewGetLocalVideoContext contextId=%u front=%@", buf, 0x2Cu);
    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v10);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v13, CFSTR("videoContextId"), 0);

  return v4;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v6;
  NSString *v7;
  double x;
  double y;
  double width;
  double height;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSRect v17;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("videoSlotFacing"));
  v7 = (NSString *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceVisualRectangle"));
  if (v6 && v7)
  {
    v17 = NSRectFromString(v7);
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    if (VideoUtil_LayerBoundsAreValid(v17.origin.x, v17.origin.y, v17.size.width, v17.size.height))
    {
      v12 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS"));
      v13 = objc_msgSend(MEMORY[0x1E0CD2778], "handleFromXPCRepresentation:", v12);
      if (v13)
      {
        v14 = (void *)v13;
        v15 = (int)objc_msgSend(*(id *)(a1 + 32), "setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:", objc_msgSend(v6, "BOOLValue"), v13, x, y, width, height);
        objc_msgSend(v14, "invalidate");
        if (!a3)
          return 0;
        goto LABEL_7;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94_cold_2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94_cold_3();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94_cold_1();
  }
  v15 = 1;
  if (!a3)
    return 0;
LABEL_7:
  if (v15)
    *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GKVoiceChatServiceErrorDomain"), v15, 0);
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_100(uint64_t a1, void *a2)
{
  unsigned int *v3;
  unsigned int v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 112);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_102(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend(*(id *)(a1 + 32), "beginPreviewToPIPAnimation");
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_3_104(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend(*(id *)(a1 + 32), "endPreviewToPIPAnimation");
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_4_106(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend(*(id *)(a1 + 32), "beginPIPToPreviewAnimation");
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_5_108(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend(*(id *)(a1 + 32), "endPIPToPreviewAnimation");
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_6(uint64_t a1, void *a2)
{
  void *v4;
  float v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraZoomFactor")), "floatValue");
    objc_msgSend(v4, "setCameraZoomFactor:", v5);
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_7(uint64_t a1, void *a2)
{
  void *v4;
  float v5;
  double v6;
  float v7;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraZoomFactor")), "floatValue");
    v6 = v5;
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewCameraZoomRate")), "floatValue");
    objc_msgSend(v4, "setCameraZoomFactor:withRate:", v6, v7);
  }
  return 0;
}

uint64_t __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_9(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend(*(id *)(a1 + 32), "setFollowSystemCamera:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previewFollowSystemCamera")), "BOOLValue"));
  return 0;
}

- (void)handleAVCaptureError:(int)a3 domain:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  if (a3 == -2146893807)
    v6 = 32006;
  else
    v6 = 0;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", a4, v6, 0);
  -[VCVideoCaptureServer handleAVCaptureError:error:](self, "handleAVCaptureError:error:", v4, v7);

}

- (void)handleAVCaptureError:(int)a3 error:(id)a4
{
  void *v6;
  int v7;
  int v8;
  int ErrorLogLevelForModule;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  AVConferencePreviewDelegate *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *delegateNotificationQueue;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *captureClientQueue;
  uint64_t v28;
  NSObject *v29;
  int v30;
  AVConferencePreviewDelegate *appDelegate;
  uint64_t v32;
  _QWORD v33[6];
  _QWORD v34[5];
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _BYTE v43[10];
  _BYTE v44[10];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a4, "domain", *(_QWORD *)&a3);
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("avCaptureSetCameraWithUIDFail")) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("avCaptureStartPreviewFail")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("avCaptureStopFail")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("avCaptureStartCaptureFail")) & 1) != 0)
    {
      v8 = 1;
      v7 = 1;
      goto LABEL_7;
    }
    if (objc_msgSend(a4, "code") != 32023)
    {
      objc_msgSend(a4, "code");
      v8 = 0;
      v7 = 0;
      goto LABEL_7;
    }
  }
  v7 = 0;
  v8 = 1;
LABEL_7:
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v10 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 3
    && (v11 = VRTraceErrorLogLevelToCSTR(), v12 = *v10, os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)))
  {
    v30 = objc_msgSend(a4, "code");
    appDelegate = self->appDelegate;
    *(_DWORD *)buf = 136316418;
    v37 = v11;
    v38 = 2080;
    v39 = "-[VCVideoCaptureServer handleAVCaptureError:error:]";
    v40 = 1024;
    v41 = 1195;
    v42 = 1024;
    *(_DWORD *)v43 = v30;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v8;
    *(_WORD *)v44 = 2048;
    *(_QWORD *)&v44[2] = appDelegate;
    _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d err=%d, informClient=%d, appDelegate=%p", buf, 0x32u);
    if (!v8)
      goto LABEL_32;
  }
  else if (!v8)
  {
    goto LABEL_32;
  }
  v13 = -[VCVideoSourceTokenManager deviceNameForToken:](self->_tokenManager, "deviceNameForToken:", self->_currentVideoSourceToken.var0.var1);
  v14 = self->appDelegate;
  v15 = VRTraceGetErrorLogLevelForModule();
  if (v14)
  {
    if (v15 >= 8)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *v10;
      v18 = *v10;
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v37 = v16;
          v38 = 2080;
          v39 = "-[VCVideoCaptureServer handleAVCaptureError:error:]";
          v40 = 1024;
          v41 = 1199;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying app of acvapture error", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoCaptureServer handleAVCaptureError:error:].cold.3();
      }
    }
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = v13;
    block[6] = a4;
    dispatch_async(delegateNotificationQueue, block);
  }
  else
  {
    if (v15 >= 8)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *v10;
      v21 = *v10;
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v37 = v19;
          v38 = 2080;
          v39 = "-[VCVideoCaptureServer handleAVCaptureError:error:]";
          v40 = 1024;
          v41 = 1206;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying clients of avcapture error", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoCaptureServer handleAVCaptureError:error:].cold.2();
      }
    }
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = v23;
    if (v13)
    {
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v13, CFSTR("localCameraUIDString"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer handleAVCaptureError:error:].cold.1();
    }
    v25 = (void *)objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "newNSDictionaryFromNSError:", a4);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("conferenceError"));

    v26 = self->delegateNotificationQueue;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke_143;
    v34[3] = &unk_1E9E521C0;
    v34[4] = v24;
    dispatch_async(v26, v34);

  }
LABEL_32:
  if (objc_msgSend(a4, "code") == 32023)
  {
    -[VCVideoCaptureServer pausePreview](self, "pausePreview");
  }
  else if (v7)
  {
    -[VCVideoCaptureServer stopPreview](self, "stopPreview");
    captureClientQueue = self->captureClientQueue;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke_2;
    v33[3] = &unk_1E9E52238;
    v33[4] = self;
    v33[5] = v6;
    dispatch_async(captureClientQueue, v33);
  }
  -[VCVideoCaptureServer updatePreviewState](self, "updatePreviewState");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend((id)objc_msgSend(a4, "domain"), "UTF8String");
      *(_DWORD *)buf = 136316418;
      v37 = v28;
      v38 = 2080;
      v39 = "-[VCVideoCaptureServer handleAVCaptureError:error:]";
      v40 = 1024;
      v41 = 1238;
      v42 = 2080;
      *(_QWORD *)v43 = v32;
      *(_WORD *)&v43[8] = 1024;
      *(_DWORD *)v44 = v8;
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)&v44[6] = v7;
      _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d Error encountered while accessing camera in %s, informed client %d, stopped preview %d", buf, 0x32u);
    }
  }
}

uint64_t __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1[4] + 384), "didReceiveErrorFromCameraUniqueID:error:", a1[5], a1[6]);
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke_143(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidReceiveCameraError", *(_QWORD *)(a1 + 32));
}

uint64_t __51__VCVideoCaptureServer_handleAVCaptureError_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "avConferencePreviewError:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_161(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewCameraDidBecomeAvailable", *(_QWORD *)(a1 + 32));
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_168(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "avConferenceScreenCaptureError:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "didStartPreview");
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_179(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "didStopPreview");
  return result;
}

uint64_t __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_2_182()
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidStop", 0);
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_189(uint64_t a1)
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewCameraDidBecomeInterrupted", *(_QWORD *)(a1 + 32));

}

- (void)screenAndCameraMixingEnable:(BOOL)a3
{
  _BOOL8 v3;
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCVideoCaptureServer screenAndCameraMixingEnable:]";
      v10 = 1024;
      v11 = 1345;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d enabled=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  -[VCSessionManager setScreenAndCameraMixingEnabled:](+[VCSessionManager sharedInstance](VCSessionManager, "sharedInstance"), "setScreenAndCameraMixingEnabled:", v3);
}

uint64_t __50__VCVideoCaptureServer_reconnectClientLayerFront___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidLocalVideoContextChange", *(_QWORD *)(a1 + 32));
}

- (id)videoRuleForClient:(id)a3
{
  id result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->captureClientQueue);
  if (!a3)
    return 0;
  result = (id)objc_msgSend(a3, "clientCaptureRule");
  if (!result)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    if (result)
      return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cameraSinkVideoRules, "objectForKeyedSubscript:", result);
  }
  return result;
}

- (void)updateCaptureWidth:(int *)a3 height:(int *)a4 frameRate:(int *)a5 withVideoRule:(id)a6
{
  float v10;
  float v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->captureClientQueue);
  if (a6)
  {
    if ((int)objc_msgSend(a6, "iWidth") < *a3)
      *a3 = objc_msgSend(a6, "iWidth");
    if ((int)objc_msgSend(a6, "iHeight") < *a4)
      *a4 = objc_msgSend(a6, "iHeight");
    objc_msgSend(a6, "fRate");
    if (v10 < (float)*a5)
    {
      objc_msgSend(a6, "fRate");
      *a5 = (int)v11;
    }
  }
}

- (int)thermalPressureLevel
{
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dispatch_get_current_queue() == (dispatch_queue_t)MEMORY[0x1E0C80D38])
    return self->_newThermalLevel;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCVideoCaptureServer_thermalPressureLevel__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__VCVideoCaptureServer_thermalPressureLevel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 436);
  return result;
}

- (void)notifyThermalPressureObservers:(int)a3
{
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("VCVideoCaptureServer_NotificationKeyThermalPressureLevel");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0, v3);
}

- (void)populateThermalFrameRateThresholdsForCaptureSourceID:(int64_t)a3 captureConfig:(id)a4
{
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("CaptureThermalLevelModerate")))
  {
    if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("CaptureThermalLevelHeavy")))
    {
      v8[0] = &unk_1E9EF6428;
      v8[1] = &unk_1E9EF6440;
      v9[0] = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("CaptureThermalLevelModerate"));
      v9[1] = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("CaptureThermalLevelHeavy"));
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_screenCaptureThermalFrameRateThresholds, "setObject:forKeyedSubscript:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
    }
  }
}

- (void)setCameraZoomFactor:(double)a3
{
  NSObject *captureServerQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCVideoCaptureServer_setCameraZoomFactor___block_invoke;
  block[3] = &unk_1E9E52960;
  *(double *)&block[5] = a3;
  block[4] = self;
  dispatch_async(captureServerQueue, block);
}

uint64_t __44__VCVideoCaptureServer_setCameraZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 136315906;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCVideoCaptureServer setCameraZoomFactor:]_block_invoke";
      v10 = 1024;
      v11 = 1792;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setting Camera Zoom Factor to %f", (uint8_t *)&v6, 0x26u);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setCameraZoomFactor:", *(double *)(a1 + 40));
}

- (void)setCameraZoomFactor:(double)a3 withRate:(double)a4
{
  NSObject *captureServerQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VCVideoCaptureServer_setCameraZoomFactor_withRate___block_invoke;
  v5[3] = &unk_1E9E52910;
  *(double *)&v5[5] = a3;
  *(double *)&v5[6] = a4;
  v5[4] = self;
  dispatch_async(captureServerQueue, v5);
}

uint64_t __53__VCVideoCaptureServer_setCameraZoomFactor_withRate___block_invoke(double *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *((_QWORD *)a1 + 5);
      v5 = *((_QWORD *)a1 + 6);
      v7 = 136316162;
      v8 = v2;
      v9 = 2080;
      v10 = "-[VCVideoCaptureServer setCameraZoomFactor:withRate:]_block_invoke";
      v11 = 1024;
      v12 = 1800;
      v13 = 2048;
      v14 = v4;
      v15 = 2048;
      v16 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setting Camera Zoom Factor to %f with Rate: %f", (uint8_t *)&v7, 0x30u);
    }
  }
  return objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 328), "setCameraZoomFactor:withRate:", a1[5], a1[6]);
}

- (void)updateCenterStageEnabled:(BOOL)a3 requestCaptureChange:(BOOL)a4
{
  NSObject *captureServerQueue;
  _QWORD block[5];
  BOOL v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VCVideoCaptureServer_updateCenterStageEnabled_requestCaptureChange___block_invoke;
  block[3] = &unk_1E9E52A50;
  block[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(captureServerQueue, block);
}

uint64_t __70__VCVideoCaptureServer_updateCenterStageEnabled_requestCaptureChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 458) = *(_BYTE *)(a1 + 40);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "updateCenterStageEnabled:requestCaptureChange:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  return result;
}

- (void)setFollowSystemCamera:(BOOL)a3
{
  NSObject *captureServerQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCVideoCaptureServer_setFollowSystemCamera___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureServerQueue, block);
}

void __46__VCVideoCaptureServer_setFollowSystemCamera___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  _BYTE *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v2 + 88) == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v16 = v4;
        v17 = 2080;
        v18 = "-[VCVideoCaptureServer setFollowSystemCamera:]_block_invoke";
        v19 = 1024;
        v20 = 1828;
        v21 = 1024;
        v22 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ignoring, _followSystemCamera=%d already", buf, 0x22u);
      }
    }
  }
  else
  {
    *(_BYTE *)(v2 + 88) = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v16 = v7;
        v17 = 2080;
        v18 = "-[VCVideoCaptureServer setFollowSystemCamera:]_block_invoke";
        v19 = 1024;
        v20 = 1819;
        v21 = 1024;
        v22 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d updating _followSystemCamera=%d", buf, 0x22u);
      }
    }
    v10 = *(_BYTE **)(a1 + 32);
    if (v10[88])
    {
      objc_msgSend(v10, "setSystemPreferredAsLocalCamera");
      objc_msgSend(*(id *)(a1 + 32), "addObserveSystemPreferredCamera");
    }
    else
    {
      objc_msgSend(v10, "removeObserveSystemPreferredCamera");
    }
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 88));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v11, CFSTR("previewFollowSystemCamera"), 0);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 296);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCVideoCaptureServer_setFollowSystemCamera___block_invoke_205;
  block[3] = &unk_1E9E521C0;
  block[4] = v12;
  dispatch_async(v13, block);

}

uint64_t __46__VCVideoCaptureServer_setFollowSystemCamera___block_invoke_205(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewFollowSystemCameraDidChange", *(_QWORD *)(a1 + 32));
}

uint64_t __VCVideoCaptureServer_ApplyPressureLevelChanges_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 432) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 436);
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "updateThermalLevel:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 432));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 432) < 0x15u;
  if (*(unsigned __int8 *)(v2 + 452) != v3)
  {
    *(_BYTE *)(v2 + 452) = v3;
    objc_msgSend(*(id *)(a1 + 32), "updateViewPointCorrectionStatus");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v2, "notifyThermalChangeForClients:", *(_QWORD *)(v2 + 120));
  return objc_msgSend(*(id *)(a1 + 32), "notifyThermalChangeForClients:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
}

uint64_t __VCVideoCaptureServer_ApplyPressureLevelChanges_block_invoke_208(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 444) = *(_DWORD *)(*(_QWORD *)(result + 32) + 448);
  return result;
}

- (int)getScreenFrameRateForThermalLevel:(int)a3
{
  int v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  VCVideoCaptureServer *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!self->_isScreenCaptureForScreenShare)
  {
    if ((VCVideoCaptureServer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return 60;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 60;
      v24 = 136315906;
      v25 = v16;
      v26 = 2080;
      v27 = "-[VCVideoCaptureServer getScreenFrameRateForThermalLevel:]";
      v28 = 1024;
      v29 = 1913;
      v30 = 1024;
      *(_DWORD *)v31 = a3;
      v18 = "VCVideoCaptureServer [%s] %s:%d Ignoring thermalLevel=%d for this capture source";
      v19 = v17;
      v20 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCVideoCaptureServer performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return 60;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 60;
      v24 = 136316418;
      v25 = v21;
      v26 = 2080;
      v27 = "-[VCVideoCaptureServer getScreenFrameRateForThermalLevel:]";
      v28 = 1024;
      v29 = 1913;
      v30 = 2112;
      *(_QWORD *)v31 = v8;
      *(_WORD *)&v31[8] = 2048;
      v32 = self;
      v33 = 1024;
      v34 = a3;
      v18 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Ignoring thermalLevel=%d for this capture source";
      v19 = v22;
      v20 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, v20);
    return 60;
  }
  if (a3 == 20)
    v5 = 15;
  else
    v5 = 0;
  if (((1 << a3) & 0x401) != 0)
    v5 = 60;
  if (((1 << a3) & 0x4010040000000) != 0)
    v5 = 5;
  if (a3 <= 0x32)
    v6 = v5;
  else
    v6 = 0;
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136316162;
        v25 = v9;
        v26 = 2080;
        v27 = "-[VCVideoCaptureServer getScreenFrameRateForThermalLevel:]";
        v28 = 1024;
        v29 = 1932;
        v30 = 1024;
        *(_DWORD *)v31 = v6;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = a3;
        v11 = "VCVideoCaptureServer [%s] %s:%d Screen framerate=%d for thermalLevel=%d";
        v12 = v10;
        v13 = 40;
LABEL_25:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v24, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCVideoCaptureServer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136316674;
        v25 = v14;
        v26 = 2080;
        v27 = "-[VCVideoCaptureServer getScreenFrameRateForThermalLevel:]";
        v28 = 1024;
        v29 = 1932;
        v30 = 2112;
        *(_QWORD *)v31 = v7;
        *(_WORD *)&v31[8] = 2048;
        v32 = self;
        v33 = 1024;
        v34 = v6;
        v35 = 1024;
        v36 = a3;
        v11 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Screen framerate=%d for thermalLevel=%d";
        v12 = v15;
        v13 = 60;
        goto LABEL_25;
      }
    }
  }
  return v6;
}

- (int)screenFrameRateForThermalLevel:(int)a3 configuredFrameRate:(int)a4 captureSourceID:(id)a5
{
  int v6;
  int v9;
  uint64_t v10;
  NSMutableDictionary **p_screenCaptureThermalFrameRateThresholds;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[10];
  VCVideoCaptureServer *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  if (a3 <= 39)
  {
    if (a3 == 20)
    {
      v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_screenCaptureThermalFrameRateThresholds, "objectForKeyedSubscript:", a5);
      v9 = v6;
      if (!v13)
        goto LABEL_12;
      p_screenCaptureThermalFrameRateThresholds = &self->_screenCaptureThermalFrameRateThresholds;
      v12 = &unk_1E9EF6428;
      goto LABEL_11;
    }
    v9 = a4;
    if (a3 != 30)
      goto LABEL_12;
LABEL_7:
    v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_screenCaptureThermalFrameRateThresholds, "objectForKeyedSubscript:", a5);
    v9 = v6;
    if (!v10)
      goto LABEL_12;
    p_screenCaptureThermalFrameRateThresholds = &self->_screenCaptureThermalFrameRateThresholds;
    v12 = &unk_1E9EF6440;
LABEL_11:
    v9 = objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](*p_screenCaptureThermalFrameRateThresholds, "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", v12), "intValue");
    goto LABEL_12;
  }
  if (a3 == 40)
    goto LABEL_7;
  v9 = a4;
  if (a3 == 50)
    goto LABEL_7;
LABEL_12:
  if (v9 < v6)
    v6 = v9;
  if ((VCVideoCaptureServer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136316162;
        v24 = v15;
        v25 = 2080;
        v26 = "-[VCVideoCaptureServer screenFrameRateForThermalLevel:configuredFrameRate:captureSourceID:]";
        v27 = 1024;
        v28 = 1957;
        v29 = 1024;
        *(_DWORD *)v30 = v6;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = a3;
        v17 = "VCVideoCaptureServer [%s] %s:%d Screen framerate=%d for thermalLevel=%d";
        v18 = v16;
        v19 = 40;
LABEL_24:
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCVideoCaptureServer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136316674;
        v24 = v20;
        v25 = 2080;
        v26 = "-[VCVideoCaptureServer screenFrameRateForThermalLevel:configuredFrameRate:captureSourceID:]";
        v27 = 1024;
        v28 = 1957;
        v29 = 2112;
        *(_QWORD *)v30 = v14;
        *(_WORD *)&v30[8] = 2048;
        v31 = self;
        v32 = 1024;
        v33 = v6;
        v34 = 1024;
        v35 = a3;
        v17 = "VCVideoCaptureServer [%s] %s:%d %@(%p) Screen framerate=%d for thermalLevel=%d";
        v18 = v21;
        v19 = 60;
        goto LABEL_24;
      }
    }
  }
  return v6;
}

- (void)notifyThermalChangeForClients:(id)a3
{
  NSObject *captureClientQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCVideoCaptureServer_notifyThermalChangeForClients___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __54__VCVideoCaptureServer_notifyThermalChangeForClients___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(void **)(a1 + 40);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "thermalLevelDidChange:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 436));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)notifyCameraDidChangeAvailability:(id)a3 available:(BOOL)a4
{
  NSObject *captureClientQueue;
  _QWORD block[5];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCVideoCaptureServer_notifyCameraDidChangeAvailability_available___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = a3;
  v6 = a4;
  dispatch_async(captureClientQueue, block);
}

uint64_t __68__VCVideoCaptureServer_notifyCameraDidChangeAvailability_available___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "cameraAvailabilityDidChange:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)notifyFrameRateBeingThrottledForClients:(id)a3 newFrameRate:(int)a4 thermalLevelDidChange:(BOOL)a5 powerLevelDidChange:(BOOL)a6
{
  NSObject *captureClientQueue;
  _QWORD block[5];
  int v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__VCVideoCaptureServer_notifyFrameRateBeingThrottledForClients_newFrameRate_thermalLevelDidChange_powerLevelDidChange___block_invoke;
  block[3] = &unk_1E9E55EF8;
  block[4] = a3;
  v8 = a4;
  v9 = a5;
  v10 = a6;
  dispatch_async(captureClientQueue, block);
}

uint64_t __119__VCVideoCaptureServer_notifyFrameRateBeingThrottledForClients_newFrameRate_thermalLevelDidChange_powerLevelDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "frameRateIsBeingThrottled:thermalLevelDidChange:powerLevelDidChange:", *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44), *(unsigned __int8 *)(a1 + 45));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)onCaptureScreenFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 orientation:(int)a5
{
  uint64_t v8;
  NSObject *captureClientQueue;
  _QWORD block[6];
  int v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = FigSampleBufferRetain();
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VCVideoCaptureServer_onCaptureScreenFrame_frameTime_orientation___block_invoke;
  block[3] = &unk_1E9E57378;
  v11 = a5;
  block[4] = self;
  block[5] = v8;
  v12 = *a4;
  dispatch_async(captureClientQueue, block);
  if (!self->_forceDisableThermal)
    VCVideoCaptureServer_ApplyPressureLevelChanges((uint64_t)self);
}

uint64_t __67__VCVideoCaptureServer_onCaptureScreenFrame_frameTime_orientation___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  __int16 v14;
  char v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE *)(a1 + 48);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = v2 & 3 | 0x90;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12[0] = 0;
        v12[1] = 0;
        v14 = 0;
        v15 = 0;
        v10 = *(_QWORD *)(a1 + 40);
        v16 = *(_OWORD *)(a1 + 52);
        v17 = *(_QWORD *)(a1 + 68);
        v13 = v6;
        objc_msgSend(v9, "onVideoFrame:frameTime:attribute:", v10, &v16, v12);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v5);
  }
  return FigSampleBufferRelease();
}

- (void)changeCameraToPendingSettingsWithReset:(BOOL)a3
{
  NSObject *captureServerQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VCVideoCaptureServer_changeCameraToPendingSettingsWithReset___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureServerQueue, block);
}

uint64_t __63__VCVideoCaptureServer_changeCameraToPendingSettingsWithReset___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 76) * *(_DWORD *)(*(_QWORD *)(result + 32) + 72))
  {
    v1 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(v1 + 32);
        v5 = *(_DWORD *)(v4 + 72);
        LODWORD(v4) = *(_DWORD *)(v4 + 76);
        v6 = *(unsigned __int8 *)(v1 + 40);
        v7 = 136316418;
        v8 = v2;
        v9 = 2080;
        v10 = "-[VCVideoCaptureServer changeCameraToPendingSettingsWithReset:]_block_invoke";
        v11 = 1024;
        v12 = 2166;
        v13 = 1024;
        v14 = v5;
        v15 = 1024;
        v16 = v4;
        v17 = 1024;
        v18 = v6;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d picking up pending camera change %dx%d reset %d", (uint8_t *)&v7, 0x2Eu);
      }
    }
    result = objc_msgSend(*(id *)(v1 + 32), "setCaptureWidth:height:rate:", *(unsigned int *)(*(_QWORD *)(v1 + 32) + 72), *(unsigned int *)(*(_QWORD *)(v1 + 32) + 76), *(unsigned int *)(*(_QWORD *)(v1 + 32) + 80));
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 72) = 0;
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 76) = 0;
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 80) = 0;
    if (*(_BYTE *)(v1 + 40))
      return objc_msgSend(*(id *)(v1 + 32), "previewVideoWidth:height:frameRate:", *(_QWORD *)(v1 + 32) + 72, *(_QWORD *)(v1 + 32) + 76, *(_QWORD *)(v1 + 32) + 80);
  }
  return result;
}

- (BOOL)canStopPreview
{
  NSObject *cameraPreviewClientMonitorQueue;
  uint64_t v3;
  NSObject *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  cameraPreviewClientMonitorQueue = self->_cameraPreviewClientMonitorQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__VCVideoCaptureServer_canStopPreview__block_invoke;
  v7[3] = &unk_1E9E522B0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(cameraPreviewClientMonitorQueue, v7);
  if (*((_BYTE *)v9 + 24))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v3;
        v14 = 2080;
        v15 = "-[VCVideoCaptureServer canStopPreview]";
        v16 = 1024;
        v17 = 2198;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d All client stopped; can stop preview",
          buf,
          0x1Cu);
      }
    }
  }
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __38__VCVideoCaptureServer_canStopPreview__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__VCVideoCaptureServer_canStopPreview__block_invoke_2;
  v4[3] = &unk_1E9E57478;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __38__VCVideoCaptureServer_canStopPreview__block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  NSObject *v8;
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
  if (objc_msgSend(a3, "isStarted"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCVideoCaptureServer canStopPreview]_block_invoke_2";
        v13 = 1024;
        v14 = 2191;
        v15 = 1024;
        v16 = objc_msgSend(a2, "intValue");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Preview client pid=%u is not stopped", (uint8_t *)&v9, 0x22u);
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)thermalLevelDidChange:(int)a3
{
  NSObject *streamInputQueue;
  _QWORD block[5];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_newThermalLevel != a3)
  {
    self->_newThermalLevel = a3;
    streamInputQueue = self->_streamInputQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__VCVideoCaptureServer_thermalLevelDidChange___block_invoke;
    block[3] = &unk_1E9E52300;
    block[4] = self;
    v6 = a3;
    dispatch_async(streamInputQueue, block);
    -[VCVideoCaptureServer notifyThermalPressureObservers:](self, "notifyThermalPressureObservers:", self->_newThermalLevel);
  }
}

uint64_t __46__VCVideoCaptureServer_thermalLevelDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "allValues");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "thermalLevelDidChange:", *(unsigned int *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)addObserveSystemPreferredCamera
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B0A0], "addObserver:forKeyPath:options:context:", self, CFSTR("systemPreferredCamera"), 1, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315906;
      v5 = v2;
      v6 = 2080;
      v7 = "-[VCVideoCaptureServer addObserveSystemPreferredCamera]";
      v8 = 1024;
      v9 = 2219;
      v10 = 2112;
      v11 = CFSTR("systemPreferredCamera");
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d KeyPath=%@", (uint8_t *)&v4, 0x26u);
    }
  }
}

- (void)removeObserveSystemPreferredCamera
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B0A0], "removeObserver:forKeyPath:context:", self, CFSTR("systemPreferredCamera"), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315906;
      v5 = v2;
      v6 = 2080;
      v7 = "-[VCVideoCaptureServer removeObserveSystemPreferredCamera]";
      v8 = 1024;
      v9 = 2226;
      v10 = 2112;
      v11 = CFSTR("systemPreferredCamera");
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d KeyPath=%@", (uint8_t *)&v4, 0x26u);
    }
  }
}

- (BOOL)registerCaptureConfig:(id)a3 forSource:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if ((a4 - 7) < 3 || a4 == 5)
    return -[VCVideoCaptureServer registerSystemAudioConfig:forSource:](self, "registerSystemAudioConfig:forSource:", a3);
  if (a4 == 1)
    -[VCVideoCaptureServer registerScreenVideoConfig:forSource:](self, "registerScreenVideoConfig:forSource:", a3, v4, v5);
  return 1;
}

- (BOOL)deregisterCaptureConfig:(id)a3 forSource:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if ((a4 - 7) < 3 || a4 == 5)
    return -[VCVideoCaptureServer deregisterSystemAudioConfig:forSource:](self, "deregisterSystemAudioConfig:forSource:", a3);
  if (a4 == 1)
    -[VCVideoCaptureServer deregisterScreenVideoConfig:forSource:](self, "deregisterScreenVideoConfig:forSource:", a3, v4, v5);
  return 1;
}

- (void)registerCaptureClientForScreenShare:(id)a3
{
  NSObject *captureClientQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCVideoCaptureServer_registerCaptureClientForScreenShare___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(captureClientQueue, block);
}

void __60__VCVideoCaptureServer_registerCaptureClientForScreenShare___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "hash")));
    v4 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v5 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 576), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hash"))), "integerValue");
      objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 560), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5)), "addSink:", *(_QWORD *)(a1 + 32));
      objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 568), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5)), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("Client"));
    }
    else if ((objc_msgSend(*(id *)(v4 + 128), "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "addObject:", *(_QWORD *)(a1 + 32));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v9 = 136315906;
          v10 = v6;
          v11 = 2080;
          v12 = "-[VCVideoCaptureServer registerCaptureClientForScreenShare:]_block_invoke";
          v13 = 1024;
          v14 = 2280;
          v15 = 2112;
          v16 = v8;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Client Registered: %@", (uint8_t *)&v9, 0x26u);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __60__VCVideoCaptureServer_registerCaptureClientForScreenShare___block_invoke_cold_1();
  }
}

- (void)deregisterCaptureClientForScreenShare:(id)a3
{
  NSObject *captureClientQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    captureClientQueue = self->captureClientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__VCVideoCaptureServer_deregisterCaptureClientForScreenShare___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(captureClientQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoCaptureServer deregisterCaptureClientForScreenShare:].cold.1();
  }
}

uint64_t __62__VCVideoCaptureServer_deregisterCaptureClientForScreenShare___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "hash")));
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 576), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "hash"))), "integerValue");
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4)), "removeSink:", *(_QWORD *)(a1 + 40));
    return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4)), "setObject:forKeyedSubscript:", 0, CFSTR("Client"));
  }
  else
  {
    result = objc_msgSend(*(id *)(v3 + 128), "containsObject:", *(_QWORD *)(a1 + 40));
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)registerScreenVideoConfig:(id)a3 forSource:(int)a4
{
  NSObject *captureClientQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCVideoCaptureServer_registerScreenVideoConfig_forSource___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(captureClientQueue, block);
}

uint64_t __60__VCVideoCaptureServer_registerScreenVideoConfig_forSource___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  char *v4;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v2 = *(void **)(a1 + 32);
    v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Register screen config=%s", v3);
    if (__str)
    {
      __lasts = 0;
      v4 = strtok_r(__str, "\n", &__lasts);
      v5 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v19 = v6;
            v20 = 2080;
            v21 = "-[VCVideoCaptureServer registerScreenVideoConfig:forSource:]_block_invoke";
            v22 = 1024;
            v23 = 2306;
            v24 = 2080;
            v25 = "";
            v26 = 2080;
            v27 = v4;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CaptureSourceID")), "integerValue");
  v9 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v12 = v8;
    objc_msgSend(*(id *)(v9 + 568), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8));
    v13 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 568), "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12));
    v14 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Client"));
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "setObject:forKeyedSubscript:", v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "hash")));
    return objc_msgSend(*(id *)(a1 + 40), "populateThermalFrameRateThresholdsForCaptureSourceID:captureConfig:", v12, *(_QWORD *)(a1 + 32));
  }
  else
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 344) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", *(_QWORD *)(a1 + 32));
    v10 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 344), "objectForKeyedSubscript:", CFSTR("FrameRate")), "intValue");
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 24) = v10;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 20) = v10;
    result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 344), "objectForKeyedSubscript:", CFSTR("BiomeEventType")), "intValue");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 352) = (int)result;
  }
  return result;
}

- (void)deregisterScreenVideoConfig:(id)a3 forSource:(int)a4
{
  const char *v5;
  char *v6;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *captureClientQueue;
  _QWORD block[7];
  char *__str[3];
  uint64_t v15;
  char *__lasts;
  _BYTE buf[24];
  _BYTE v18[14];
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str[0] = 0;
    v5 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    asprintf(__str, "Deregister screen config=%s", v5);
    if (__str[0])
    {
      __lasts = 0;
      v6 = strtok_r(__str[0], "\n", &__lasts);
      v7 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoCaptureServer deregisterScreenVideoConfig:forSource:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)v18 = 2327;
            *(_WORD *)&v18[4] = 2080;
            *(_QWORD *)&v18[6] = "";
            v19 = 2080;
            v20 = v6;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str[0]);
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_QWORD *)v18 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v18 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CaptureSourceID")), "integerValue");
  v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Client"));
  __str[0] = 0;
  __str[1] = (char *)__str;
  __str[2] = (char *)0x2020000000;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v15 = objc_msgSend(v10, "hash");
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VCVideoCaptureServer_deregisterScreenVideoConfig_forSource___block_invoke;
  block[3] = &unk_1E9E55C68;
  block[4] = self;
  block[5] = buf;
  block[6] = __str;
  dispatch_async(captureClientQueue, block);
  _Block_object_dispose(__str, 8);
  _Block_object_dispose(buf, 8);
}

void __62__VCVideoCaptureServer_deregisterScreenVideoConfig_forSource___block_invoke(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[4];
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend(*(id *)(v2 + 568), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"));
    objc_msgSend(*(id *)(a1[4] + 576), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24)));
  }
  else
  {

    *(_QWORD *)(a1[4] + 344) = 0;
    *(_DWORD *)(a1[4] + 24) = 0;
    *(_DWORD *)(a1[4] + 20) = 0;
  }
}

- (BOOL)registerSystemAudioConfig:(id)a3 forSource:(int)a4
{
  NSObject *captureClientQueue;
  char v5;
  _QWORD block[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCVideoCaptureServer_registerSystemAudioConfig_forSource___block_invoke;
  block[3] = &unk_1E9E54AA0;
  v8 = a4;
  block[4] = a3;
  block[5] = self;
  block[6] = &v9;
  dispatch_sync(captureClientQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __60__VCVideoCaptureServer_registerSystemAudioConfig_forSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  _OWORD v13[5];
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SystemAudioCaptureClient"));
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "hash"));
    v14 = 0u;
    memset(v13, 0, sizeof(v13));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SystemAudioCaptureConfig")), "getValue:", v13);
    v5 = v14;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)buf = 136316674;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCVideoCaptureServer registerSystemAudioConfig:forSource:]_block_invoke";
        v19 = 1024;
        v20 = 2354;
        v21 = 2048;
        v22 = v3;
        v23 = 2112;
        v24 = v4;
        v25 = 1024;
        v26 = v8;
        v27 = 1024;
        v28 = v5 == 1;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d client=%p clientKey=%@ source=%d clientUsesScreenCaptureKit=%d", buf, 0x3Cu);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 600), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32)), v4);
    v9 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v9 + 616) && v5 == 1)
    {
      v10 = objc_msgSend((id)v9, "dispatchedAddScreenCaptureAudioOutputForConfig:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v11 = (void *)objc_msgSend(*(id *)(v9 + 608), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56)));
      if (v11)
      {
        objc_msgSend(v11, "addObject:", v4);
      }
      else
      {
        v12 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", v4, 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 608), "setObject:forKeyedSubscript:", v12, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56)));
      }
      objc_msgSend(*(id *)(a1 + 40), "dispatchedUpdateSystemAudioConfigTapTypeForClientKey:forSource:", v4, *(unsigned int *)(a1 + 56));
      v10 = objc_msgSend(*(id *)(a1 + 40), "dispatchedStartSystemAudioForClientKey:", v4);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __60__VCVideoCaptureServer_registerSystemAudioConfig_forSource___block_invoke_cold_1();
  }
}

- (BOOL)deregisterSystemAudioConfig:(id)a3 forSource:(int)a4
{
  NSObject *captureClientQueue;
  char v5;
  _QWORD block[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VCVideoCaptureServer_deregisterSystemAudioConfig_forSource___block_invoke;
  block[3] = &unk_1E9E54AA0;
  v8 = a4;
  block[4] = a3;
  block[5] = self;
  block[6] = &v9;
  dispatch_sync(captureClientQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __62__VCVideoCaptureServer_deregisterSystemAudioConfig_forSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SystemAudioCaptureClient"));
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "hash"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_DWORD *)(a1 + 56);
        LODWORD(v11[0]) = 136316418;
        *(_QWORD *)((char *)v11 + 4) = v5;
        WORD6(v11[0]) = 2080;
        *(_QWORD *)((char *)v11 + 14) = "-[VCVideoCaptureServer deregisterSystemAudioConfig:forSource:]_block_invoke";
        WORD3(v11[1]) = 1024;
        DWORD2(v11[1]) = 2381;
        WORD6(v11[1]) = 2048;
        *(_QWORD *)((char *)&v11[1] + 14) = v3;
        WORD3(v11[2]) = 2112;
        *((_QWORD *)&v11[2] + 1) = v4;
        LOWORD(v12) = 1024;
        *(_DWORD *)((char *)&v12 + 2) = v7;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d client=%p clientKey=%@ source=%d", (uint8_t *)v11, 0x36u);
      }
    }
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    memset(v11, 0, sizeof(v11));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SystemAudioCaptureConfig"), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), "getValue:", v11);
    v8 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v8 + 616))
      v9 = (_DWORD)v14 == 1;
    else
      v9 = 0;
    if (v9)
    {
      v10 = objc_msgSend((id)v8, "dispatchedRemoveScreenCaptureAudioOutput");
    }
    else
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v8 + 608), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56))), "removeObject:", v4);
      v10 = objc_msgSend(*(id *)(a1 + 40), "dispatchedStopSystemAudioForClientKey:", v4);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 600), "setObject:forKeyedSubscript:", 0, v4);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __62__VCVideoCaptureServer_deregisterSystemAudioConfig_forSource___block_invoke_cold_1();
  }
}

- (void)dispatchedStartSystemAudioForSource:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioSourceToClients, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v19 = v6;
      v20 = 2080;
      v21 = "-[VCVideoCaptureServer dispatchedStartSystemAudioForSource:]";
      v22 = 1024;
      v23 = 2401;
      v24 = 2048;
      v25 = objc_msgSend(v5, "count");
      v26 = 1024;
      v27 = v3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d clients=%lu for source=%d", buf, 0x2Cu);
    }
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[VCVideoCaptureServer dispatchedUpdateSystemAudioConfigTapTypeForClientKey:forSource:](self, "dispatchedUpdateSystemAudioConfigTapTypeForClientKey:forSource:", v12, v3);
        -[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:](self, "dispatchedStartSystemAudioForClientKey:", v12);
      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v9);
  }
}

- (void)dispatchedStopSystemAudioForSource:(int)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioSourceToClients, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v18 = v6;
      v19 = 2080;
      v20 = "-[VCVideoCaptureServer dispatchedStopSystemAudioForSource:]";
      v21 = 1024;
      v22 = 2410;
      v23 = 2048;
      v24 = objc_msgSend(v5, "count");
      v25 = 1024;
      v26 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d clients=%lu for source=%d", buf, 0x2Cu);
    }
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v5);
        -[VCVideoCaptureServer dispatchedStopSystemAudioForClientKey:](self, "dispatchedStopSystemAudioForClientKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v9);
  }
}

- (BOOL)dispatchedStartSystemAudioForClientKey:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  VCSystemAudioCapture *v8;
  VCSystemAudioCapture *v9;
  BOOL v10;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = v5;
      v22 = 2080;
      v23 = "-[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]";
      v24 = 1024;
      v25 = 2441;
      v26 = 2112;
      v27 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d clientKey=%@", buf, 0x26u);
    }
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioCapture, "objectForKeyedSubscript:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v21 = v16;
        v22 = 2080;
        v23 = "-[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]";
        v24 = 1024;
        v25 = 2445;
        v26 = 2112;
        v27 = a3;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d System audio capture already started for clientKey=%@.", buf, 0x26u);
      }
    }
    goto LABEL_22;
  }
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioCaptureConfig, "objectForKeyedSubscript:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:].cold.1();
    }
    goto LABEL_22;
  }
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioCaptureConfig, "objectForKeyedSubscript:", a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SystemAudioCaptureConfig")), "getValue:", &v18);
  *((_QWORD *)&v19 + 1) = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SystemAudioRemoteDeviceInfo"));
  v8 = -[VCSystemAudioCapture initWithConfiguration:]([VCSystemAudioCapture alloc], "initWithConfiguration:", &v18);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:].cold.2();
    }
LABEL_22:
    v9 = 0;
LABEL_23:
    v14 = 0;
    goto LABEL_12;
  }
  v9 = v8;
  v10 = -[VCSystemAudioCapture start](v8, "start");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v10)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:].cold.3();
    }
    goto LABEL_23;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = v12;
      v22 = 2080;
      v23 = "-[VCVideoCaptureServer dispatchedStartSystemAudioForClientKey:]";
      v24 = 1024;
      v25 = 2465;
      v26 = 2112;
      v27 = a3;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d System audio capture started for clientKey=%@.", buf, 0x26u);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemAudioCapture, "setObject:forKeyedSubscript:", v9, a3);
  v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)dispatchedStopSystemAudioForClientKey:(id)a3
{
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315906;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCVideoCaptureServer dispatchedStopSystemAudioForClientKey:]";
      v18 = 1024;
      v19 = 2473;
      v20 = 2112;
      *(_QWORD *)v21 = a3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d clientKey=%@", (uint8_t *)&v14, 0x26u);
    }
  }
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_systemAudioCapture, "objectForKeyedSubscript:", a3);
  if (v9)
  {
    v10 = objc_msgSend(v9, "stop");
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer dispatchedStopSystemAudioForClientKey:].cold.1();
    }
    v10 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316162;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCVideoCaptureServer dispatchedStopSystemAudioForClientKey:]";
      v18 = 1024;
      v19 = 2486;
      v20 = 1024;
      *(_DWORD *)v21 = v10;
      v21[2] = 2112;
      *(_QWORD *)&v21[3] = a3;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d System audio capture didStop=%d for clientKey=%@.", (uint8_t *)&v14, 0x2Cu);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_systemAudioCapture, "setObject:forKeyedSubscript:", 0, a3);
  return v10;
}

- (BOOL)dispatchedAddScreenCaptureAudioOutputForConfig:(id)a3
{
  return 0;
}

- (BOOL)dispatchedRemoveScreenCaptureAudioOutput
{
  return 0;
}

- (__CFDictionary)copyCameraColorInfo
{
  NSObject *captureServerQueue;
  __CFDictionary *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCVideoCaptureServer_copyCameraColorInfo__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(captureServerQueue, block);
  v3 = (__CFDictionary *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__VCVideoCaptureServer_copyCameraColorInfo__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328);
  if (result)
  {
    result = objc_msgSend((id)result, "copyColorInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if ((result & 0x80000000) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)registerForFrames:(id)a3
{
  uint64_t currentWidth;
  uint64_t currentHeight;
  uint64_t currentFrameRate;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  currentWidth = self->currentWidth;
  currentHeight = self->currentHeight;
  v10 = currentHeight;
  v11 = currentWidth;
  currentFrameRate = self->currentFrameRate;
  v9 = currentFrameRate;
  if (!((_DWORD)currentHeight * (_DWORD)currentWidth * (_DWORD)currentFrameRate))
  {
    -[VCVideoCaptureServer previewVideoWidth:height:frameRate:](self, "previewVideoWidth:height:frameRate:", &v11, &v10, &v9);
    currentHeight = v10;
    currentWidth = v11;
    currentFrameRate = v9;
  }
  return -[VCVideoCaptureServer registerForVideoFramesFromSource:withClient:width:height:frameRate:](self, "registerForVideoFramesFromSource:withClient:width:height:frameRate:", 3, a3, currentWidth, currentHeight, currentFrameRate);
}

- (BOOL)registerForVideoFramesFromSource:(int)a3 withClient:(id)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v12[14];
  _QWORD v13[15];

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a3;
  v13[14] = *MEMORY[0x1E0C80C00];
  v13[0] = a4;
  v12[0] = CFSTR("Client");
  v12[1] = CFSTR("VideoWidth");
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a5);
  v12[2] = CFSTR("VideoHeight");
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v12[3] = CFSTR("FrameRate");
  v13[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v13[4] = &unk_1E9EF6458;
  v12[4] = CFSTR("ClientPid");
  v12[5] = CFSTR("ScreenCaptureConfigurationDisplayMode");
  v13[5] = &unk_1E9EF6458;
  v13[6] = MEMORY[0x1E0C9AAA0];
  v12[6] = CFSTR("ShouldSendBlackFramesOnClearScreen");
  v12[7] = CFSTR("ResolutionScaling");
  v13[7] = &unk_1E9EF6470;
  v13[8] = &unk_1E9EF6488;
  v12[8] = CFSTR("PixelFormat");
  v12[9] = CFSTR("ScreenDisplayID");
  v13[9] = &unk_1E9EF6458;
  v13[10] = MEMORY[0x1E0C9AAA0];
  v12[10] = CFSTR("EnableIdleFrameAdjustments");
  v12[11] = CFSTR("ScreenWatcherExempt");
  v13[11] = MEMORY[0x1E0C9AAA0];
  v13[12] = MEMORY[0x1E0C9AAA0];
  v12[12] = CFSTR("ShouldAllowReconfigureForLocalDisplay");
  v12[13] = CFSTR("ShouldOptimizeForLowLatency");
  v13[13] = MEMORY[0x1E0C9AAA0];
  return -[VCVideoCaptureServer registerForVideoFramesFromSource:sourceConfig:](self, "registerForVideoFramesFromSource:sourceConfig:", v9, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 14));
}

- (BOOL)setupScreenCaptureForSource:(int)a3 config:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  VCVideoSource *screenCapture;
  VCScreenCapture *v9;
  int ErrorLogLevelForModule;
  uint64_t v11;
  NSObject *v12;
  void (*v14)(uint64_t, CMSampleBufferRef, CMTime *, uint64_t, uint64_t, int);
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  VCVideoSource *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_screenCapture)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      screenCapture = self->_screenCapture;
      *(_DWORD *)buf = 136315906;
      v16 = v5;
      v17 = 2080;
      v18 = "-[VCVideoCaptureServer setupScreenCaptureForSource:config:]";
      v19 = 1024;
      v20 = 2588;
      v21 = 2048;
      v22 = screenCapture;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d screenCapture=%p already created", buf, 0x26u);
      return 0;
    }
  }
  else
  {
    v14 = VCVideoCaptureServer_OnCaptureVideoFrame;
    v9 = -[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]([VCScreenCapture alloc], "initWithCaptureServer:protocolFunctions:sourceConfig:", self, &v14, a4);
    self->_screenCapture = (VCVideoSource *)v9;
    v7 = v9 != 0;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v9)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v16 = v11;
          v17 = 2080;
          v18 = "-[VCVideoCaptureServer setupScreenCaptureForSource:config:]";
          v19 = 1024;
          v20 = 2609;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setup screen capture source", buf, 0x1Cu);
        }
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer setupScreenCaptureForSource:config:].cold.1();
    }
  }
  return v7;
}

- (void)dispatchedUpdateCaptureRuleForClient:(id)a3 width:(int)a4 height:(int)a5 frameRate:(float)a6
{
  uint64_t v7;
  uint64_t v8;
  VCVideoRule *v11;
  double v12;
  uint64_t v13;
  id v14;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->captureClientQueue);
  if (a3)
  {
    v11 = [VCVideoRule alloc];
    *(float *)&v12 = a6;
    v13 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v11, "initWithFrameWidth:frameHeight:frameRate:", v8, v7, v12);
    if (v13)
    {
      v14 = (id)v13;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cameraSinkVideoRules, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3));

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer dispatchedUpdateCaptureRuleForClient:width:height:frameRate:].cold.1();
    }
  }
}

- (void)updateCaptureRuleForClient:(id)a3 width:(int)a4 height:(int)a5 frameRate:(float)a6
{
  NSObject *captureClientQueue;
  _QWORD block[6];
  int v8;
  int v9;
  float v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__VCVideoCaptureServer_updateCaptureRuleForClient_width_height_frameRate___block_invoke;
  block[3] = &unk_1E9E55A90;
  block[4] = self;
  block[5] = a3;
  v8 = a4;
  v9 = a5;
  v10 = a6;
  dispatch_async(captureClientQueue, block);
}

uint64_t __74__VCVideoCaptureServer_updateCaptureRuleForClient_width_height_frameRate___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateCaptureRuleForClient:width:height:frameRate:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), a2);
}

- (BOOL)registerForVideoFramesFromSource:(int)a3 sourceConfig:(id)a4
{
  uint64_t v7;
  const void *v8;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  int currentWidth;
  int currentHeight;
  int currentFrameRate;
  NSObject *captureClientQueue;
  BOOL v17;
  NSObject *v18;
  const void *v20;
  _QWORD v21[8];
  int v22;
  _QWORD block[10];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  char *__lasts;
  char **p_lasts;
  uint64_t v30;
  int v31;
  char *v32;
  char **v33;
  uint64_t v34;
  int v35;
  const void *v36;
  _BYTE buf[24];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v7 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Client"));
  if (!v7)
    return 0;
  v8 = (const void *)v7;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v32 = 0;
    v20 = v8;
    asprintf(&v32, "source=%d, client=%p, sourceConfig=%s", a3, v8, (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String"));
    if (v32)
    {
      __lasts = 0;
      v9 = strtok_r(v32, "\n", &__lasts);
      v10 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoCaptureServer registerForVideoFramesFromSource:sourceConfig:]";
            *(_WORD *)&buf[22] = 1024;
            v38 = 2647;
            v39 = 2080;
            v40 = "";
            v41 = 2080;
            v42 = v9;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v9 = strtok_r(0, "\n", &__lasts);
      }
      while (v9);
      free(v32);
    }
    v8 = v20;
  }
  v36 = v8;
  -[VCVideoCaptureServer notifyThermalChangeForClients:](self, "notifyThermalChangeForClients:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v38) = 0;
  if (a3 == 3)
  {
    -[VCVideoCaptureServer deregisterForVideoFramesFromSource:withClient:](self, "deregisterForVideoFramesFromSource:withClient:", 1, v8);
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = -1431655766;
    v35 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("VideoWidth")), "intValue");
    __lasts = 0;
    p_lasts = &__lasts;
    v30 = 0x2020000000;
    v31 = -1431655766;
    v31 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("VideoHeight")), "intValue");
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = -1431655766;
    v27 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("FrameRate")), "intValue");
    currentWidth = *((_DWORD *)v33 + 6);
    if (!currentWidth)
      currentWidth = self->currentWidth;
    *((_DWORD *)v33 + 6) = currentWidth;
    currentHeight = *((_DWORD *)p_lasts + 6);
    if (!currentHeight)
      currentHeight = self->currentHeight;
    *((_DWORD *)p_lasts + 6) = currentHeight;
    currentFrameRate = *((_DWORD *)v25 + 6);
    if (!currentFrameRate)
      currentFrameRate = self->currentFrameRate;
    *((_DWORD *)v25 + 6) = currentFrameRate;
    captureClientQueue = self->captureClientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__VCVideoCaptureServer_registerForVideoFramesFromSource_sourceConfig___block_invoke;
    block[3] = &unk_1E9E574A0;
    block[4] = self;
    block[5] = v8;
    block[6] = &v32;
    block[7] = &__lasts;
    block[8] = &v24;
    block[9] = buf;
    dispatch_sync(captureClientQueue, block);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&__lasts, 8);
    _Block_object_dispose(&v32, 8);
  }
  else if ((a3 - 1) > 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer registerForVideoFramesFromSource:sourceConfig:].cold.1();
    }
  }
  else
  {
    -[VCVideoCaptureServer deregisterForVideoFramesFromSource:withClient:](self, "deregisterForVideoFramesFromSource:withClient:", 3, v8);
    v18 = self->captureClientQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__VCVideoCaptureServer_registerForVideoFramesFromSource_sourceConfig___block_invoke_2;
    v21[3] = &unk_1E9E574C8;
    v21[4] = self;
    v21[5] = v8;
    v22 = a3;
    v21[6] = a4;
    v21[7] = buf;
    dispatch_sync(v18, v21);
  }
  v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
  return v17;
}

uint64_t __70__VCVideoCaptureServer_registerForVideoFramesFromSource_sourceConfig___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  *(float *)&a2 = (float)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateCaptureRuleForClient:width:height:frameRate:", *(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), a2);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addObject:", *(_QWORD *)(a1 + 40));
    result = objc_msgSend(*(id *)(a1 + 32), "startCaptureWithWidth:height:frameRate:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __70__VCVideoCaptureServer_registerForVideoFramesFromSource_sourceConfig___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "count");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setupScreenCaptureForSource:config:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  if (!v2 && !*(_BYTE *)(v3 + 455))
  {
    dispatch_resume(*(dispatch_object_t *)(v3 + 64));
    v3 = *(_QWORD *)(a1 + 32);
  }
  result = objc_msgSend(*(id *)(v3 + 336), "startPreview");
  if ((result & 0x80000000) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v18 = v5;
        v19 = 2080;
        v20 = "-[VCVideoCaptureServer registerForVideoFramesFromSource:sourceConfig:]_block_invoke_2";
        v21 = 1024;
        v22 = 2690;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Started screen capture source", buf, 0x1Cu);
      }
    }
    v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("FrameRate")), "intValue");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = v7;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = v7;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = (int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("BiomeEventType")), "intValue");
    objc_msgSend(*(id *)(a1 + 32), "sendBiomeEventIsStarting:", 1);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (result)
    {
      v9 = result;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "sourceFrameRateDidChange:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("FrameRate")), "intValue"));
        }
        while (v9 != v11);
        result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        v9 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BOOL)deregisterForVideoFramesFromSource:(int)a3 withClient:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  NSObject *captureClientQueue;
  _QWORD block[6];
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
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v14 = v7;
        v15 = 2080;
        v16 = "-[VCVideoCaptureServer deregisterForVideoFramesFromSource:withClient:]";
        v17 = 1024;
        v18 = 2713;
        v19 = 1024;
        v20 = a3;
        v21 = 2048;
        v22 = a4;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d source=%d, client=%p", buf, 0x2Cu);
      }
    }
    captureClientQueue = self->captureClientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__VCVideoCaptureServer_deregisterForVideoFramesFromSource_withClient___block_invoke;
    block[3] = &unk_1E9E522D8;
    v12 = a3;
    block[4] = self;
    block[5] = a4;
    dispatch_async(captureClientQueue, block);
  }
  return a4 != 0;
}

void __70__VCVideoCaptureServer_deregisterForVideoFramesFromSource_withClient___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  char v9;

  v1 = *(_DWORD *)(a1 + 48) - 1;
  if (v1 >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __70__VCVideoCaptureServer_deregisterForVideoFramesFromSource_withClient___block_invoke_cold_1();
    }
  }
  else
  {
    v3 = qword_1D910F650[v1];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + v3);
    if (v5 && objc_msgSend(*(id *)(v4 + v3), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 40)));
      objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));
      v6 = *(_DWORD *)(a1 + 48);
      if ((v6 - 1) >= 2)
      {
        if (v6 == 3 && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count"))
          objc_msgSend(*(id *)(a1 + 32), "stopCapture");
      }
      else if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "count"))
      {
        v7 = *(void **)(*(_QWORD *)(a1 + 32) + 336);
        if (v7)
        {
          objc_msgSend(v7, "stop:", 1);

          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = 0;
          *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
          *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 0;
          v8 = *(_QWORD *)(a1 + 32);
          if (!*(_BYTE *)(v8 + 455))
          {
            dispatch_suspend(*(dispatch_object_t *)(v8 + 64));
            v8 = *(_QWORD *)(a1 + 32);
          }
          if (*(_QWORD *)(v8 + 384))
          {
            v9 = objc_opt_respondsToSelector();
            v8 = *(_QWORD *)(a1 + 32);
            if ((v9 & 1) != 0)
            {
              objc_msgSend(*(id *)(v8 + 384), "didStopCapture");
              v8 = *(_QWORD *)(a1 + 32);
            }
          }
          objc_msgSend((id)v8, "sendBiomeEventIsStarting:", 0);
        }
      }
    }
  }
}

- (BOOL)isClientRegisteredForVideoFrames:(id)a3 fromSource:(int)a4
{
  NSObject *captureClientQueue;
  char v5;
  _QWORD block[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCVideoCaptureServer_isClientRegisteredForVideoFrames_fromSource___block_invoke;
  block[3] = &unk_1E9E574F0;
  v8 = a4;
  block[5] = a3;
  block[6] = &v9;
  block[4] = self;
  dispatch_sync(captureClientQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __68__VCVideoCaptureServer_isClientRegisteredForVideoFrames_fromSource___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;

  v2 = *(_DWORD *)(a1 + 56);
  if ((v2 - 1) < 2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "containsObject:", v3);
    return;
  }
  if (v2 == 3)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __68__VCVideoCaptureServer_isClientRegisteredForVideoFrames_fromSource___block_invoke_cold_1();
  }
}

- (void)setCaptureFrameRate:(int)a3
{
  NSObject *captureServerQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCVideoCaptureServer_setCaptureFrameRate___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureServerQueue, block);
}

uint64_t __44__VCVideoCaptureServer_setCaptureFrameRate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetCaptureFrameRate:", *(unsigned int *)(a1 + 40));
}

- (void)setScreenCaptureFrameRate:(int)a3
{
  -[VCVideoCaptureServer setScreenCaptureFrameRate:captureSourceID:](self, "setScreenCaptureFrameRate:captureSourceID:", *(_QWORD *)&a3, 0);
}

- (void)setScreenCaptureFrameRate:(int)a3 captureSourceID:(id)a4
{
  NSObject *captureClientQueue;
  _QWORD v5[6];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke;
  v5[3] = &unk_1E9E522D8;
  v5[4] = a4;
  v5[5] = self;
  v6 = a3;
  dispatch_async(captureClientQueue, v5);
}

void __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)objc_msgSend(*(id *)(v2 + 560), "objectForKeyedSubscript:");
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(void **)(v2 + 336);
    if (v3)
    {
LABEL_3:
      if ((objc_msgSend(v3, "setFrameRate:", *(unsigned int *)(a1 + 48)) & 0x80000000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke_cold_2();
        }
      }
      else
      {
        v4 = *(_QWORD *)(a1 + 40);
        if (v3 == *(void **)(v4 + 336))
          *(_DWORD *)(v4 + 24) = *(_DWORD *)(a1 + 48);
        else
          objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 568), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48)), CFSTR("CurrentFrameRate"));
      }
      return;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke_cold_1();
  }
}

- (int)getCaptureFrameRateForSource:(int)a3
{
  NSObject *captureServerQueue;
  int v4;
  _QWORD v6[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  captureServerQueue = self->captureServerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__VCVideoCaptureServer_getCaptureFrameRateForSource___block_invoke;
  v6[3] = &unk_1E9E54AC8;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(captureServerQueue, v6);
  v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __53__VCVideoCaptureServer_getCaptureFrameRateForSource___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 48) - 1) > 1)
  {
    v4 = (void *)objc_msgSend(*(id *)(v2 + 536), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"));
    if (v4)
      result = objc_msgSend(v4, "frameRate");
    else
      result = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    result = objc_msgSend(*(id *)(v2 + 336), "getFrameRate");
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setViewPointCorrectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 BoolValueForKey;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("disableViewPointCorrectionForSharing"), +[VCHardwareSettings disableViewPointCorrectionForSharing](VCHardwareSettings, "disableViewPointCorrectionForSharing"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCVideoCaptureServer setViewPointCorrectionEnabled:]";
      v12 = 1024;
      v13 = 2847;
      v14 = 1024;
      v15 = v3;
      v16 = 1024;
      v17 = BoolValueForKey;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d enabled=%d, shouldUpdateViewPointCorrection=%d", (uint8_t *)&v8, 0x28u);
    }
  }
  if (BoolValueForKey && self->_viewPointCorrectionEnabledByClient != v3)
  {
    self->_viewPointCorrectionEnabledByClient = v3;
    -[VCVideoCaptureServer updateViewPointCorrectionStatus](self, "updateViewPointCorrectionStatus");
  }
}

- (void)updateViewPointCorrectionStatus
{
  NSObject *captureServerQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__VCVideoCaptureServer_updateViewPointCorrectionStatus__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(captureServerQueue, v3);
}

uint64_t __55__VCVideoCaptureServer_updateViewPointCorrectionStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 453))
    v3 = *(_BYTE *)(v2 + 452) != 0;
  else
    v3 = 0;
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setViewPointCorrectionEnabled:", v3);
  return result;
}

- (BOOL)isFaceTimeScreenSharingWithDict:(id)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v8;

  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ScreenCaptureUUID"));
  if (v5)
    v6 = v5 != objc_msgSend(MEMORY[0x1E0C99E38], "null");
  else
    v6 = 0;
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8
    && v5 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
  {
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CaptureSourceID"));
    return self->_screenShareCaptureConfig
        && (!v8
         || -[NSMutableDictionary objectForKeyedSubscript:](self->_screenCaptureConfig, "objectForKeyedSubscript:", v8) == 0);
  }
  return v6;
}

- (BOOL)setUpScreenVideoCaptureSource:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  VCVideoSource **p_screenCapture;
  uint64_t v9;
  uint64_t screenConfiguredFrameRate;
  int v11;
  NSMutableArray *screenCaptureClients;
  uint64_t screenCurrentFrameRate;
  VCVideoCaptureServer *v14;
  uint64_t v15;
  uint64_t v16;
  VCScreenCapture *v17;
  VCScreenCapture *v18;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  void (*v23)(uint64_t, CMSampleBufferRef, CMTime *, uint64_t, uint64_t, int);
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = -[VCVideoCaptureServer isFaceTimeScreenSharingWithDict:](self, "isFaceTimeScreenSharingWithDict:");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CaptureSourceID"));
  if (!v5)
  {
    v7 = (NSMutableDictionary *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_screenCaptureConfig, "objectForKeyedSubscript:", v6), "mutableCopy");
    p_screenCapture = &self->_screenCapture;
    if (!self->_screenCapture)
      goto LABEL_8;
LABEL_28:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer setUpScreenVideoCaptureSource:].cold.4();
    }
    goto LABEL_38;
  }
  v7 = self->_screenShareCaptureConfig;
  p_screenCapture = &self->_screenCapture;
  if (self->_screenCapture)
    goto LABEL_28;
  if (-[NSMutableDictionary count](self->_screenCaptureSource, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer setUpScreenVideoCaptureSource:].cold.3();
    }
LABEL_38:
    v18 = 0;
    v21 = 0;
    goto LABEL_27;
  }
LABEL_8:
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer setUpScreenVideoCaptureSource:].cold.1();
    }
    v7 = 0;
    goto LABEL_38;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ScreenCaptureIsWindowed")), CFSTR("ScreenCaptureIsWindowed"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ScreenCaptureUUID")), CFSTR("ScreenCaptureUUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ScreenDisplayID")), CFSTR("ScreenDisplayID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IsCursorCapturedForScreen")), CFSTR("IsCursorCapturedForScreen"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CaptureExcludedBundleIDs")), CFSTR("CaptureExcludedBundleIDs"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HasPrivateCaptureEntitlement")), CFSTR("HasPrivateCaptureEntitlement"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ScreenVirtualDisplayLabel")), CFSTR("ScreenVirtualDisplayLabel"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ScreenCaptureConfigurationDisplayMode")), CFSTR("ScreenCaptureConfigurationDisplayMode"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ClientBundleID")))
    v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ClientBundleID"));
  else
    v9 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, CFSTR("ClientBundleID"));
  if (v5)
  {
    screenConfiguredFrameRate = self->_screenConfiguredFrameRate;
    if (!self->_forceDisableThermal)
    {
      v11 = -[VCVideoCaptureServer getScreenFrameRateForThermalLevel:](self, "getScreenFrameRateForThermalLevel:", self->_thermalLevel);
      if ((int)screenConfiguredFrameRate >= v11)
        screenConfiguredFrameRate = v11;
      else
        screenConfiguredFrameRate = screenConfiguredFrameRate;
    }
    self->_screenCurrentFrameRate = screenConfiguredFrameRate;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_screenShareCaptureConfig, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", screenConfiguredFrameRate), CFSTR("FrameRate"));
    screenCaptureClients = self->screenCaptureClients;
    screenCurrentFrameRate = self->_screenCurrentFrameRate;
    v14 = self;
  }
  else
  {
    v15 = -[VCVideoCaptureServer screenFrameRateForThermalLevel:configuredFrameRate:captureSourceID:](self, "screenFrameRateForThermalLevel:configuredFrameRate:captureSourceID:", self->_thermalLevel, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("FrameRate")), "intValue"), v6);
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
    objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_screenCaptureConfig, "objectForKeyedSubscript:", v6), "setObject:forKeyedSubscript:", v16, CFSTR("CurrentFrameRate"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v16, CFSTR("CurrentFrameRate"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15), CFSTR("FrameRate"));
    v30[0] = -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("Client"));
    screenCaptureClients = (NSMutableArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v14 = self;
    screenCurrentFrameRate = v15;
  }
  -[VCVideoCaptureServer notifyFrameRateBeingThrottledForClients:newFrameRate:thermalLevelDidChange:powerLevelDidChange:](v14, "notifyFrameRateBeingThrottledForClients:newFrameRate:thermalLevelDidChange:powerLevelDidChange:", screenCaptureClients, screenCurrentFrameRate, 0, 0);
  v23 = VCVideoCaptureServer_OnCaptureVideoFrame;
  v17 = -[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]([VCScreenCapture alloc], "initWithCaptureServer:protocolFunctions:sourceConfig:", self, &v23, v7);
  if (!v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer setUpScreenVideoCaptureSource:].cold.2();
    }
    goto LABEL_38;
  }
  v18 = v17;
  if (v5)
  {
    *p_screenCapture = (VCVideoSource *)v17;
  }
  else
  {
    -[VCVideoCapture addSink:](v17, "addSink:", -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("Client")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_screenCaptureSource, "setObject:forKeyedSubscript:", v18, v6);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v25 = v19;
      v26 = 2080;
      v27 = "-[VCVideoCaptureServer setUpScreenVideoCaptureSource:]";
      v28 = 1024;
      v29 = 2956;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Setup screen capture source", buf, 0x1Cu);
    }
  }
  v21 = 1;
LABEL_27:

  return v21;
}

- (BOOL)startScreenShareCapture:(id)a3
{
  NSObject *captureClientQueue;
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  captureClientQueue = self->captureClientQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke;
  v6[3] = &unk_1E9E550C8;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = &v7;
  dispatch_sync(captureClientQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  char *v4;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v2 = *(void **)(a1 + 32);
    v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Starting Screen Capture with screenShareDict=%s", v3);
    if (__str)
    {
      __lasts = 0;
      v4 = strtok_r(__str, "\n", &__lasts);
      v5 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v18 = v6;
            v19 = 2080;
            v20 = "-[VCVideoCaptureServer startScreenShareCapture:]_block_invoke";
            v21 = 1024;
            v22 = 2968;
            v23 = 2080;
            v24 = "";
            v25 = 2080;
            v26 = v4;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  v8 = objc_msgSend(*(id *)(a1 + 40), "isFaceTimeScreenSharingWithDict:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 455) = v8;
  if ((objc_msgSend(*(id *)(a1 + 40), "setUpScreenVideoCaptureSource:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v8)
      v10 = *(void **)(v9 + 336);
    else
      v10 = (void *)objc_msgSend(*(id *)(v9 + 560), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CaptureSourceID")));
    if (v10)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (int)objc_msgSend(v10, "startScreenCapture") >= 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = v11;
          v19 = 2080;
          v20 = "-[VCVideoCaptureServer startScreenShareCapture:]_block_invoke";
          v21 = 1024;
          v22 = 2982;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Start screen capture", buf, 0x1Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke_cold_1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke_cold_2();
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v14 = v8;
  else
    v14 = 0;
  if (v14 == 1)
  {
    dispatch_resume(*(dispatch_object_t *)(v13 + 64));
    objc_msgSend(*(id *)(a1 + 40), "sendBiomeEventIsStarting:", 1);
  }
  else
  {
    *(_BYTE *)(v13 + 455) = 0;
  }
}

- (BOOL)stopScreenShareCapture:(int64_t)a3
{
  NSObject *captureClientQueue;
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  captureClientQueue = self->captureClientQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__VCVideoCaptureServer_stopScreenShareCapture___block_invoke;
  v6[3] = &unk_1E9E55810;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  dispatch_sync(captureClientQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __47__VCVideoCaptureServer_stopScreenShareCapture___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
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
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)));
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = (void *)objc_msgSend(*(id *)(v3 + 560), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)));
    if (v4)
    {
LABEL_3:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)objc_msgSend(v4, "stopScreenCapture") >= 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v9 = 136315906;
          v10 = v5;
          v11 = 2080;
          v12 = "-[VCVideoCaptureServer stopScreenShareCapture:]_block_invoke";
          v13 = 1024;
          v14 = 3009;
          v15 = 1024;
          v16 = v7;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d didStop=%d", (uint8_t *)&v9, 0x22u);
        }
      }
      goto LABEL_6;
    }
  }
  else
  {
    v4 = *(void **)(v3 + 336);
    if (v4)
      goto LABEL_3;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __47__VCVideoCaptureServer_stopScreenShareCapture___block_invoke_cold_1();
  }
LABEL_6:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      objc_msgSend(*(id *)(v8 + 560), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)));
    }
    else
    {
      *(_BYTE *)(v8 + 455) = 0;
      dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64));
      objc_msgSend(*(id *)(a1 + 32), "sendBiomeEventIsStarting:", 0);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = 0;
    }
  }
}

- (id)updateScreenCapture:(int64_t)a3 withConfig:(id)a4
{
  NSObject *captureClientQueue;
  void *v5;
  _QWORD block[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke;
  block[3] = &unk_1E9E56F18;
  block[4] = a4;
  block[5] = self;
  block[6] = &v8;
  block[7] = a3;
  dispatch_sync(captureClientQueue, block);
  v5 = 0;
  if ((v9[3] & 0x80000000) != 0)
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GKVoiceChatServiceErrorDomain"));
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke(_QWORD *a1)
{
  void *v2;
  const char *v3;
  char *v4;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v2 = (void *)a1[4];
    v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Updating Screen Capture with screenShareDict=%s", v3);
    if (__str)
    {
      __lasts = 0;
      v4 = strtok_r(__str, "\n", &__lasts);
      v5 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v13 = v6;
            v14 = 2080;
            v15 = "-[VCVideoCaptureServer updateScreenCapture:withConfig:]_block_invoke";
            v16 = 1024;
            v17 = 3038;
            v18 = 2080;
            v19 = "";
            v20 = 2080;
            v21 = v4;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  if (objc_msgSend(*(id *)(a1[5] + 560), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7])))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke_cold_2();
    }
  }
  else
  {
    v8 = a1[5];
    v9 = *(void **)(v8 + 344);
    if (v9)
    {
      objc_msgSend(*(id *)(v8 + 344), "addEntriesFromDictionary:", a1[4]);
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("CaptureSourceID"));
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[5] + 336), "updateScreenCapture:", v9);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke_cold_1();
    }
  }
}

- (void)sendBiomeEventIsStarting:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  unint64_t biomeEventType;
  _BYTE v11[22];
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02738]), "initWithIsStart:type:", v3, self->_biomeEventType);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("stop");
      biomeEventType = self->_biomeEventType;
      *(_DWORD *)v11 = 136316162;
      *(_QWORD *)&v11[4] = v7;
      *(_WORD *)&v11[12] = 2080;
      if (v3)
        v9 = CFSTR("start");
      *(_QWORD *)&v11[14] = "-[VCVideoCaptureServer sendBiomeEventIsStarting:]";
      v12 = 1024;
      v13 = 3064;
      v14 = 2112;
      v15 = v9;
      v16 = 2048;
      v17 = biomeEventType;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Sending Biome event for screen %@ of type=%lu", v11, 0x30u);
    }
  }
  objc_msgSend((id)objc_msgSend(v5, "source", *(_OWORD *)v11), "sendEvent:", v6);

}

- (BOOL)isValidStreamInput:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend((id)objc_msgSend(a3, "streamInputID"), "unsignedIntValue");
  return v3 > 9 || (v3 & 0x3FF) == 6;
}

- (BOOL)setupStreamInputs
{
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoCaptureServer.streamInput", 0, CustomRootQueue);
  self->_streamInputQueue = v4;
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_streamInputs = v5;
    if (v5)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_streamInputCaptureSources = v6;
      if (v6)
        return 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoCaptureServer setupStreamInputs].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoCaptureServer setupStreamInputs].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoCaptureServer setupStreamInputs].cold.1();
  }
  -[VCVideoCaptureServer cleanupStreamInputs](self, "cleanupStreamInputs");
  return 0;
}

- (void)cleanupStreamInputs
{
  NSObject *streamInputQueue;

  self->_streamInputs = 0;
  self->_streamInputCaptureSources = 0;
  streamInputQueue = self->_streamInputQueue;
  if (streamInputQueue)
  {
    dispatch_release(streamInputQueue);
    self->_streamInputQueue = 0;
  }
}

- (void)registerVideoSink:(id)a3 withCaptureSource:(int)a4
{
  NSObject *streamInputQueue;
  _QWORD v5[6];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__VCVideoCaptureServer_registerVideoSink_withCaptureSource___block_invoke;
  v5[3] = &unk_1E9E522D8;
  v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_sync(streamInputQueue, v5);
}

void __60__VCVideoCaptureServer_registerVideoSink_withCaptureSource___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (v2)
  {
    objc_msgSend(v2, "addSink:", *(_QWORD *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __60__VCVideoCaptureServer_registerVideoSink_withCaptureSource___block_invoke_cold_1();
  }
}

- (void)unregisterVideoSink:(id)a3 withCaptureSource:(int)a4
{
  NSObject *streamInputQueue;
  _QWORD v5[6];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__VCVideoCaptureServer_unregisterVideoSink_withCaptureSource___block_invoke;
  v5[3] = &unk_1E9E522D8;
  v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_sync(streamInputQueue, v5);
}

void __62__VCVideoCaptureServer_unregisterVideoSink_withCaptureSource___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (v2)
  {
    objc_msgSend(v2, "removeSink:", *(_QWORD *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __62__VCVideoCaptureServer_unregisterVideoSink_withCaptureSource___block_invoke_cold_1();
  }
}

- (void)suspendVideoSink:(id)a3 withCaptureSource:(int)a4
{
  NSObject *streamInputQueue;
  _QWORD v5[6];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__VCVideoCaptureServer_suspendVideoSink_withCaptureSource___block_invoke;
  v5[3] = &unk_1E9E522D8;
  v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(streamInputQueue, v5);
}

void __59__VCVideoCaptureServer_suspendVideoSink_withCaptureSource___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (v2)
  {
    objc_msgSend(v2, "didSuspendVideoSink:", *(_QWORD *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __59__VCVideoCaptureServer_suspendVideoSink_withCaptureSource___block_invoke_cold_1();
  }
}

- (void)resumeVideoSink:(id)a3 withCaptureSource:(int)a4
{
  NSObject *streamInputQueue;
  _QWORD v5[6];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VCVideoCaptureServer_resumeVideoSink_withCaptureSource___block_invoke;
  v5[3] = &unk_1E9E522D8;
  v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(streamInputQueue, v5);
}

void __58__VCVideoCaptureServer_resumeVideoSink_withCaptureSource___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (v2)
  {
    objc_msgSend(v2, "didResumeVideoSink:", *(_QWORD *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __58__VCVideoCaptureServer_resumeVideoSink_withCaptureSource___block_invoke_cold_1();
  }
}

- (opaqueCMFormatDescription)newFormatDescriptionForCaptureSource:(int)a3
{
  NSObject *streamInputQueue;
  uint64_t v6;
  opaqueCMFormatDescription *v7;
  NSObject *captureServerQueue;
  _QWORD v10[5];
  int v11;
  _QWORD block[6];
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VCVideoCaptureServer_newFormatDescriptionForCaptureSource___block_invoke;
  block[3] = &unk_1E9E54D70;
  v13 = a3;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(streamInputQueue, block);
  v7 = (opaqueCMFormatDescription *)v15[3];
  if (!v7)
  {
    captureServerQueue = self->captureServerQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __61__VCVideoCaptureServer_newFormatDescriptionForCaptureSource___block_invoke_2;
    v10[3] = &unk_1E9E57518;
    v11 = a3;
    v10[4] = &v14;
    dispatch_sync(captureServerQueue, v10);
    v7 = (opaqueCMFormatDescription *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  return v7;
}

void *__61__VCVideoCaptureServer_newFormatDescriptionForCaptureSource___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(result, "formatDescription");
    result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (result)
      return (void *)CFRetain(result);
  }
  return result;
}

uint64_t __61__VCVideoCaptureServer_newFormatDescriptionForCaptureSource___block_invoke_2(uint64_t result)
{
  int v1;

  v1 = *(_DWORD *)(result + 40);
  if ((v1 - 1) < 2)
    return CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x76696465u, 0x34323066u, 0, (CMFormatDescriptionRef *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24));
  if (v1 == 3)
    return CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x34323076u, 0, 0, 0, (CMVideoFormatDescriptionRef *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24));
  return result;
}

- (int)findNextAvailableCaptureSourceID
{
  uint64_t v3;

  LODWORD(v3) = 9;
  do
    v3 = (v3 + 1);
  while (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputCaptureSources, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)));
  return v3;
}

- (int64_t)streamInputIDForCaptureSourceID:(int)a3
{
  NSObject *streamInputQueue;
  int64_t v4;
  _QWORD v6[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__VCVideoCaptureServer_streamInputIDForCaptureSourceID___block_invoke;
  v6[3] = &unk_1E9E54D70;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(streamInputQueue, v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __56__VCVideoCaptureServer_streamInputIDForCaptureSourceID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "streamInputID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)registerStreamInputCaptureSourceWithID:(int64_t)a3 frameRate:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  id v9;
  int v10;

  v4 = *(_QWORD *)&a4;
  v7 = -[VCStreamInputManager streamInputWithID:](+[VCStreamInputManager sharedInstance](VCStreamInputManager, "sharedInstance"), "streamInputWithID:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v7, "streamFormat");
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("streamInputID"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("formatDescription"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4), CFSTR("framerate"));
    v10 = -[VCVideoCaptureServer registerStreamInputCaptureSourceWithConfiguration:](self, "registerStreamInputCaptureSourceWithConfiguration:", v9);

    LODWORD(v7) = v10;
  }
  return (int)v7;
}

- (int)registerStreamInputCaptureSourceWithConfiguration:(id)a3
{
  NSObject *streamInputQueue;
  int v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke;
  v6[3] = &unk_1E9E550C8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  dispatch_sync(streamInputQueue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  VCStreamInputCaptureSource *v4;
  VCStreamInputCaptureSource *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "findNextAvailableCaptureSourceID");
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", v3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_4();
    }
    goto LABEL_26;
  }
  v4 = -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:]([VCStreamInputCaptureSource alloc], "initWithCaptureSourceID:configuration:", v2, *(_QWORD *)(a1 + 40));
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_1();
    }
LABEL_26:
    v5 = 0;
    goto LABEL_16;
  }
  v5 = v4;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "allValues");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "streamInputID");
        if (v12 == -[VCStreamInputCaptureSource streamInputID](v5, "streamInputID")
          && !CMFormatDescriptionEqual((CMFormatDescriptionRef)objc_msgSend(v11, "formatDescription"), -[VCStreamInputCaptureSource formatDescription](v5, "formatDescription")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_3();
          }
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCStreamInputCaptureSource streamInputID](v5, "streamInputID")));
  if (!v13)
    goto LABEL_15;
  v14 = v13;
  if ((objc_msgSend(v13, "isEqualFormat:", -[VCStreamInputCaptureSource formatDescription](v5, "formatDescription")) & 1) != 0)
  {
    objc_msgSend(v14, "addSink:", v5);
    -[VCStreamInputCaptureSource setDelegate:](v5, "setDelegate:", v14);
LABEL_15:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setObject:forKeyedSubscript:", v5, v3);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
    goto LABEL_16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_2();
  }
LABEL_16:

}

- (BOOL)unregisterStreamInputCaptureSourceWithCaptureSourceID:(int)a3
{
  NSObject *streamInputQueue;
  char v4;
  _QWORD v6[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__VCVideoCaptureServer_unregisterStreamInputCaptureSourceWithCaptureSourceID___block_invoke;
  v6[3] = &unk_1E9E54D70;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(streamInputQueue, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __78__VCVideoCaptureServer_unregisterStreamInputCaptureSourceWithCaptureSourceID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", v2);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "streamInputID")));
    if (v5)
    {
      objc_msgSend(v5, "removeSink:", v4);
      objc_msgSend(v4, "setDelegate:", 0);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setObject:forKeyedSubscript:", 0, v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __78__VCVideoCaptureServer_unregisterStreamInputCaptureSourceWithCaptureSourceID___block_invoke_cold_1();
  }
}

- (BOOL)internalRegisterStreamInput:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[VCVideoCaptureServer isValidStreamInput:](self, "isValidStreamInput:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v13)
        return v13;
      -[VCVideoCaptureServer internalRegisterStreamInput:].cold.3();
    }
    goto LABEL_18;
  }
  v5 = (void *)objc_msgSend(a3, "streamInputID");
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v13)
        return v13;
      -[VCVideoCaptureServer internalRegisterStreamInput:].cold.2();
    }
LABEL_18:
    LOBYTE(v13) = 0;
    return v13;
  }
  v6 = objc_msgSend(v5, "intValue");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)-[NSMutableDictionary allKeys](self->_streamInputCaptureSources, "allKeys");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (!v8)
  {
LABEL_13:
    objc_msgSend(a3, "thermalLevelDidChange:", self->_newThermalLevel);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamInputs, "setObject:forKeyedSubscript:", a3, v5);
    LOBYTE(v13) = 1;
    return v13;
  }
  v9 = v8;
  v10 = *(_QWORD *)v17;
LABEL_5:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v10)
      objc_enumerationMutation(v7);
    v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputCaptureSources, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
    if (objc_msgSend(v12, "streamInputID") != v6)
      goto LABEL_11;
    if ((objc_msgSend(a3, "isEqualFormat:", objc_msgSend(v12, "formatDescription")) & 1) == 0)
      break;
    objc_msgSend(a3, "addSink:", v12);
    objc_msgSend(v12, "setDelegate:", a3);
LABEL_11:
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (v9)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_18;
  VRTraceErrorLogLevelToCSTR();
  v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v13)
  {
    -[VCVideoCaptureServer internalRegisterStreamInput:].cold.1();
    goto LABEL_18;
  }
  return v13;
}

- (BOOL)internalUnregisterStreamInput:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[VCVideoCaptureServer isValidStreamInput:](self, "isValidStreamInput:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCVideoCaptureServer internalUnregisterStreamInput:].cold.3();
    }
    goto LABEL_24;
  }
  v5 = (void *)objc_msgSend(a3, "streamInputID");
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCVideoCaptureServer internalUnregisterStreamInput:].cold.1();
    }
    goto LABEL_24;
  }
  if ((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", v5) != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCVideoCaptureServer internalUnregisterStreamInput:].cold.2();
    }
LABEL_24:
    LOBYTE(v14) = 0;
    return v14;
  }
  v6 = objc_msgSend(v5, "intValue");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)-[NSMutableDictionary allKeys](self->_streamInputCaptureSources, "allKeys");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = v6;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputCaptureSources, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12));
        if (objc_msgSend(v13, "streamInputID") == v10)
        {
          objc_msgSend(a3, "removeSink:", v13);
          objc_msgSend(v13, "setDelegate:", 0);
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v9);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamInputs, "setObject:forKeyedSubscript:", 0, v5);
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)registerStreamInput:(id)a3
{
  NSObject *streamInputQueue;
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  streamInputQueue = self->_streamInputQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__VCVideoCaptureServer_registerStreamInput___block_invoke;
  v6[3] = &unk_1E9E527A8;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  dispatch_sync(streamInputQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __44__VCVideoCaptureServer_registerStreamInput___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "internalRegisterStreamInput:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)unregisterStreamInput:(id)a3
{
  NSObject *streamInputQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCVideoCaptureServer_unregisterStreamInput___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(streamInputQueue, block);
}

uint64_t __46__VCVideoCaptureServer_unregisterStreamInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalUnregisterStreamInput:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_255(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "didChangeLocalVideoAttributes:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_259(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidLocalVideoAttributesChange", *(_QWORD *)(a1 + 32));
}

uint64_t __VCVideoCaptureServer_CopyLocalVideoAttributes_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)updateLocalAspectRatios:(int)a3 localScreenAspectRatio:(CGSize)a4
{
  uint64_t v5;
  NSObject *v6;
  CGFloat v7;
  CGFloat v8;
  __int128 localScreenPortraitAspectRatio;
  int ErrorLogLevelForModule;
  os_log_t *v11;
  uint64_t v12;
  NSObject *v13;
  CGFloat width;
  CGFloat height;
  __int128 localScreenLandscapeAspectRatio;
  uint64_t v17;
  NSObject *v18;
  CGFloat v19;
  CGFloat v20;
  const char *v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  CGFloat v32;
  __int16 v33;
  CGFloat v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3 > 1)
  {
    self->localScreenLandscapeAspectRatio = a4;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v11 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        width = self->localScreenLandscapeAspectRatio.width;
        height = self->localScreenLandscapeAspectRatio.height;
        v25 = 136316162;
        v26 = v12;
        v27 = 2080;
        v28 = "-[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:]";
        v29 = 1024;
        v30 = 3470;
        v31 = 2048;
        v32 = width;
        v33 = 2048;
        v34 = height;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d [AR_RX] localScreenLandscapeAspectRatio=(%f, %f)", (uint8_t *)&v25, 0x30u);
      }
    }
    if (self->localScreenLandscapeAspectRatio.height / self->localScreenLandscapeAspectRatio.width >= 0.666666667)
      localScreenLandscapeAspectRatio = (__int128)self->localScreenLandscapeAspectRatio;
    else
      localScreenLandscapeAspectRatio = xmmword_1D910F5C0;
    self->localExpectedLandscapeAspectRatio = (CGSize)localScreenLandscapeAspectRatio;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v18 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->localExpectedLandscapeAspectRatio.width;
        v24 = self->localExpectedLandscapeAspectRatio.height;
        v25 = 136316162;
        v26 = v22;
        v27 = 2080;
        v28 = "-[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:]";
        v29 = 1024;
        v30 = 3481;
        v31 = 2048;
        v32 = v23;
        v33 = 2048;
        v34 = v24;
        v21 = "VCVideoCaptureServer [%s] %s:%d [AR_RX] localExpectedLandscapeAspectRatio=(%f, %f)";
        goto LABEL_20;
      }
    }
  }
  else
  {
    self->localScreenPortraitAspectRatio = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->localScreenPortraitAspectRatio.width;
        v8 = self->localScreenPortraitAspectRatio.height;
        v25 = 136316162;
        v26 = v5;
        v27 = 2080;
        v28 = "-[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:]";
        v29 = 1024;
        v30 = 3456;
        v31 = 2048;
        v32 = v7;
        v33 = 2048;
        v34 = v8;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d [AR_RX] localScreenPortraitAspectRatio=(%f, %f)", (uint8_t *)&v25, 0x30u);
      }
    }
    if (self->localScreenPortraitAspectRatio.width / self->localScreenPortraitAspectRatio.height >= 0.666666667)
      localScreenPortraitAspectRatio = (__int128)self->localScreenPortraitAspectRatio;
    else
      localScreenPortraitAspectRatio = xmmword_1D910F5D0;
    self->localExpectedPortraitAspectRatio = (CGSize)localScreenPortraitAspectRatio;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->localExpectedPortraitAspectRatio.width;
        v20 = self->localExpectedPortraitAspectRatio.height;
        v25 = 136316162;
        v26 = v17;
        v27 = 2080;
        v28 = "-[VCVideoCaptureServer updateLocalAspectRatios:localScreenAspectRatio:]";
        v29 = 1024;
        v30 = 3467;
        v31 = 2048;
        v32 = v19;
        v33 = 2048;
        v34 = v20;
        v21 = "VCVideoCaptureServer [%s] %s:%d [AR_RX] localExpectedPortraitAspectRatio=(%f, %f)";
LABEL_20:
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, 0x30u);
      }
    }
  }
}

- (BOOL)setLocalScreenAttributes:(id)a3
{
  double v5;
  double v6;
  NSObject *variablesQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "ratio");
  if (v5 == 0.0)
    return 0;
  objc_msgSend(a3, "ratio");
  if (v6 == 0.0)
    return 0;
  variablesQueue = self->variablesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_barrier_async(variablesQueue, block);
  return 1;
}

void __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD block[4];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "orientation");
  objc_msgSend(*(id *)(a1 + 40), "ratio");
  objc_msgSend(v2, "updateLocalAspectRatios:localScreenAspectRatio:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = v6;
          v19 = 2080;
          v20 = "-[VCVideoCaptureServer setLocalScreenAttributes:]_block_invoke";
          v21 = 1024;
          v22 = 3503;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying app of video attributes change", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_cold_2();
      }
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_261;
    block[3] = &unk_1E9E52238;
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 296), block);
  }
  else
  {
    if (ErrorLogLevelForModule >= 8)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = v9;
          v19 = 2080;
          v20 = "-[VCVideoCaptureServer setLocalScreenAttributes:]_block_invoke_2";
          v21 = 1024;
          v22 = 3511;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d notifying clients of video attributes change", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_cold_1();
      }
    }
    v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyEncodedDictionary");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v12, CFSTR("localVideoAttributes"), 0);
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 296);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_265;
    v15[3] = &unk_1E9E521C0;
    v15[4] = v13;
    dispatch_async(v14, v15);

  }
}

uint64_t __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_261(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "didChangeLocalScreenAttributes:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_265(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidLocalScreenAttributesChange", *(_QWORD *)(a1 + 32));
}

- (CGSize)localScreenRatioForScreenOrientation:(int)a3
{
  NSObject *variablesQueue;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  int v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  const char *v13;
  __int128 v14;
  uint64_t v15;
  CGSize result;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x3010000000;
  v13 = "";
  v14 = *MEMORY[0x1E0C9D820];
  variablesQueue = self->variablesQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__VCVideoCaptureServer_localScreenRatioForScreenOrientation___block_invoke;
  v8[3] = &unk_1E9E54AC8;
  v9 = a3;
  v8[4] = self;
  v8[5] = &v10;
  dispatch_sync(variablesQueue, v8);
  v4 = v11[4];
  v5 = v11[5];
  _Block_object_dispose(&v10, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

__n128 __61__VCVideoCaptureServer_localScreenRatioForScreenOrientation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = 176;
  if (*(_DWORD *)(a1 + 48) < 2u)
    v1 = 160;
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + v1);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (CGSize)localExpectedRatioForScreenOrientation:(int)a3
{
  NSObject *variablesQueue;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  int v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  const char *v13;
  __int128 v14;
  uint64_t v15;
  CGSize result;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x3010000000;
  v13 = "";
  v14 = *MEMORY[0x1E0C9D820];
  variablesQueue = self->variablesQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__VCVideoCaptureServer_localExpectedRatioForScreenOrientation___block_invoke;
  v8[3] = &unk_1E9E54AC8;
  v9 = a3;
  v8[4] = self;
  v8[5] = &v10;
  dispatch_sync(variablesQueue, v8);
  v4 = v11[4];
  v5 = v11[5];
  _Block_object_dispose(&v10, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

__n128 __63__VCVideoCaptureServer_localExpectedRatioForScreenOrientation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = 208;
  if (*(_DWORD *)(a1 + 48) < 2u)
    v1 = 192;
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + v1);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (id)localScreenAttributesForVideoAttributes:(id)a3
{
  VideoAttributes *v4;

  if (!a3)
    return 0;
  v4 = +[VideoAttributes videoAttributesWithVideoAttributes:](VideoAttributes, "videoAttributesWithVideoAttributes:");
  -[VCVideoCaptureServer localScreenRatioForScreenOrientation:](self, "localScreenRatioForScreenOrientation:", -[VideoAttributes orientation](v4, "orientation"));
  -[VideoAttributes setRatio:](v4, "setRatio:");
  return v4;
}

- (id)copyLocalScreenAttributesForVideoAttributes:(id)a3
{
  VideoAttributes *v3;
  void *v5;

  v3 = (VideoAttributes *)a3;
  if (a3)
  {
    v5 = (void *)MEMORY[0x1DF088A10](self, a2);
    v3 = +[VideoAttributes videoAttributesWithVideoAttributes:](VideoAttributes, "videoAttributesWithVideoAttributes:", v3);
    objc_autoreleasePoolPop(v5);
    -[VCVideoCaptureServer localScreenRatioForScreenOrientation:](self, "localScreenRatioForScreenOrientation:", -[VideoAttributes orientation](v3, "orientation"));
    -[VideoAttributes setRatio:](v3, "setRatio:");
  }
  return v3;
}

- (void)centerStageEnabledDidChange:(BOOL)a3
{
  NSObject *captureClientQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VCVideoCaptureServer_centerStageEnabledDidChange___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __52__VCVideoCaptureServer_centerStageEnabledDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "captureSourceCenterStageEnabledDidChange:", *(unsigned __int8 *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)portraitBlurEnabledDidChange:(BOOL)a3
{
  NSObject *captureClientQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCVideoCaptureServer_portraitBlurEnabledDidChange___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __53__VCVideoCaptureServer_portraitBlurEnabledDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "captureSourcePortraitBlurEnabledDidChange:", *(unsigned __int8 *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)captureSourceVideoFeatureStatusDidChange:(tagVCVideoCaptureFeatureStatus)a3
{
  NSObject *captureClientQueue;
  _QWORD block[5];
  tagVCVideoCaptureFeatureStatus v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VCVideoCaptureServer_captureSourceVideoFeatureStatusDidChange___block_invoke;
  block[3] = &unk_1E9E55ED0;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __65__VCVideoCaptureServer_captureSourceVideoFeatureStatusDidChange___block_invoke(uint64_t a1)
{
  unint64_t v1;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v1 = v1 & 0xFFFFFF0000000000 | *(unsigned int *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 44) << 32);
          objc_msgSend(v8, "updateCaptureSourceVideoFeatureStatus:", v1);
        }
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)reactionDidStart:(id)a3
{
  NSObject *captureClientQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCVideoCaptureServer_reactionDidStart___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(captureClientQueue, block);
}

uint64_t __41__VCVideoCaptureServer_reactionDidStart___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "reactionDidStart:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)didStopReacting
{
  NSObject *captureClientQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  captureClientQueue = self->captureClientQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VCVideoCaptureServer_didStopReacting__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(captureClientQueue, v3);
}

uint64_t __39__VCVideoCaptureServer_didStopReacting__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "didStopReacting");
        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 followSystemCamera;
  uint64_t v21;
  _BOOL4 v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("systemPreferredCamera"), a4, a5, a6))
  {
    v8 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    if (v8)
    {
      v9 = v8;
      if ((objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
      {
        v15 = objc_msgSend(v9, "uniqueID");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v23 = 136315906;
            v24 = v16;
            v25 = 2080;
            v26 = "-[VCVideoCaptureServer observeValueForKeyPath:ofObject:change:context:]";
            v27 = 1024;
            v28 = 3649;
            v29 = 2112;
            v30 = v15;
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d receiving updated systemPreferredCamera=%@", (uint8_t *)&v23, 0x26u);
          }
        }
        if (self->_followSystemCamera)
        {
          -[VCVideoCaptureServer setCaptureCameraWithToken:](self, "setCaptureCameraWithToken:", -[VCVideoSourceTokenManager tokenForDeviceName:sourceType:](self->_tokenManager, "tokenForDeviceName:sourceType:", v15, 1));
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return;
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return;
          followSystemCamera = self->_followSystemCamera;
          v23 = 136315906;
          v24 = v18;
          v25 = 2080;
          v26 = "-[VCVideoCaptureServer observeValueForKeyPath:ofObject:change:context:]";
          v27 = 1024;
          v28 = 3653;
          v29 = 1024;
          LODWORD(v30) = followSystemCamera;
          v12 = "VCVideoCaptureServer [%s] %s:%d updating local camera because _followSystemCamera=%d";
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return;
          v21 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return;
          v22 = self->_followSystemCamera;
          v23 = 136315906;
          v24 = v21;
          v25 = 2080;
          v26 = "-[VCVideoCaptureServer observeValueForKeyPath:ofObject:change:context:]";
          v27 = 1024;
          v28 = 3655;
          v29 = 1024;
          LODWORD(v30) = v22;
          v12 = "VCVideoCaptureServer [%s] %s:%d ignoring because _followSystemCamera=%d";
        }
        v13 = v19;
        v14 = 34;
        goto LABEL_18;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315650;
        v24 = v10;
        v25 = 2080;
        v26 = "-[VCVideoCaptureServer observeValueForKeyPath:ofObject:change:context:]";
        v27 = 1024;
        v28 = 3658;
        v12 = "VCVideoCaptureServer [%s] %s:%d receiving updated systemPreferredCamera=NULL";
        v13 = v11;
        v14 = 28;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, v14);
      }
    }
  }
}

- (void)dispatchedSetCaptureCameraWithToken:(_VCVideoSourceToken)a3
{
  uint64_t var1;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t v13;
  NSObject *captureClientQueue;
  uint64_t v15;
  void *v16;
  NSObject *delegateNotificationQueue;
  _QWORD v18[5];
  _QWORD block[5];
  char v20;
  int v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  $948446A44E2BC96870B572155DF52E0B var0;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  var1 = a3.var0.var1;
  v6 = -[VCVideoSourceTokenManager deviceNameForToken:](self->_tokenManager, "deviceNameForToken:", a3.var0.var1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v24 = v7;
      v25 = 2080;
      v26 = "-[VCVideoCaptureServer dispatchedSetCaptureCameraWithToken:]";
      v27 = 1024;
      v28 = 3667;
      v29 = 1024;
      var0 = a3.var0.var0;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d VCVideoSourceToken=0x%x, cameraUID=%@", buf, 0x2Cu);
    }
  }
  if (v6)
  {
    v9 = -[VCVideoSource configureCaptureWithToken:](self->avCapture, "configureCaptureWithToken:", var1);
    if ((v9 & 0x80000000) == 0 || (v10 = v9, (_DWORD)v9 == -2146893775))
    {
      v11 = +[VCHardwareSettings preferPresentationTimestamp](VCHardwareSettings, "preferPresentationTimestamp", v10);
      if (v11)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          LOBYTE(v11) = -[VCVideoSource isInternalCamera](self->avCapture, "isInternalCamera");
        else
          LOBYTE(v11) = 0;
      }
      self->_preferPresentationTimeStamp = v11;
      self->_currentVideoSourceToken = a3;
      self->_firstPreviewFrameReceived = 0;
      v12 = objc_opt_respondsToSelector();
      if ((v12 & 1) != 0)
        v13 = -[VCVideoSource currentVideoFeatureStatus](self->avCapture, "currentVideoFeatureStatus");
      else
        v13 = 0;
      captureClientQueue = self->captureClientQueue;
      v15 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__VCVideoCaptureServer_dispatchedSetCaptureCameraWithToken___block_invoke;
      block[3] = &unk_1E9E55EF8;
      block[4] = self;
      v20 = v12 & 1;
      v21 = v13;
      v22 = BYTE4(v13);
      dispatch_async(captureClientQueue, block);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("localCameraUIDString"), 0);
      delegateNotificationQueue = self->delegateNotificationQueue;
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __60__VCVideoCaptureServer_dispatchedSetCaptureCameraWithToken___block_invoke_2;
      v18[3] = &unk_1E9E521C0;
      v18[4] = v16;
      dispatch_async(delegateNotificationQueue, v18);

    }
    else
    {
      -[VCVideoCaptureServer handleAVCaptureError:domain:](self, "handleAVCaptureError:domain:", v9, CFSTR("avCaptureSetCameraWithUIDFail"));
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoCaptureServer dispatchedSetCaptureCameraWithToken:].cold.1();
  }
}

uint64_t __60__VCVideoCaptureServer_dispatchedSetCaptureCameraWithToken___block_invoke(uint64_t a1)
{
  unint64_t v1;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "captureSource1080pAvailabilityDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 712));
        if (*(_BYTE *)(a1 + 40))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v1 = v1 & 0xFFFFFF0000000000 | *(unsigned int *)(a1 + 41) | ((unint64_t)*(unsigned __int8 *)(a1 + 45) << 32);
            objc_msgSend(v8, "updateCaptureSourceVideoFeatureStatus:", v1);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __60__VCVideoCaptureServer_dispatchedSetCaptureCameraWithToken___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewCameraUIDChanged", *(_QWORD *)(a1 + 32));
}

- (BOOL)setCaptureCameraWithToken:(_VCVideoSourceToken)a3
{
  NSObject *captureServerQueue;
  _QWORD block[5];
  $948446A44E2BC96870B572155DF52E0B var0;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCVideoCaptureServer_setCaptureCameraWithToken___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  var0 = a3.var0.var0;
  dispatch_async(captureServerQueue, block);
  return 1;
}

uint64_t __50__VCVideoCaptureServer_setCaptureCameraWithToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetCaptureCameraWithToken:", *(unsigned int *)(a1 + 40));
}

- (int)setBoundsForRemoteLayerWithFacing:(BOOL)a3 frameRect:(CGRect)a4 fenceHandle:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v10;
  _opaque_pthread_mutex_t *p_enqueueLock;
  uint64_t v13;
  void *v14;
  CFMutableDictionaryRef EncodedCFDictionary;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  VCVideoCaptureServer *v33;
  __int16 v34;
  id v35;
  uint64_t v36;
  NSRect v37;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  v13 = 416;
  if (v10)
    v13 = 408;
  v14 = *(Class *)((char *)&self->super.isa + v13);
  if (!v14)
    goto LABEL_10;
  EncodedCFDictionary = VideoAttributes_CreateEncodedCFDictionary(self->localVideoAttributes);
  VCImageQueue_EnqueueAttributes((uint64_t)v14, EncodedCFDictionary);
  if (EncodedCFDictionary)
    CFRelease(EncodedCFDictionary);
  if ((VCImageQueue_setCALayerSize((uint64_t)v14, (uint64_t)a5, x, y, width, height) & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    {
LABEL_10:
      v18 = 0;
      goto LABEL_22;
    }
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v18 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v24 = 136316418;
      v25 = v16;
      v26 = 2080;
      v27 = "-[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]";
      v28 = 1024;
      v29 = 3756;
      v30 = 2080;
      v31 = v19;
      v32 = 2112;
      v33 = (VCVideoCaptureServer *)NSStringFromRect(v37);
      v34 = 2048;
      v35 = a5;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d VCVideoCaptureServer: queue=%s --> set layer bounds=%@ caFenceHandle=%p", (uint8_t *)&v24, 0x3Au);
      goto LABEL_10;
    }
  }
  else
  {
    if ((VCVideoCaptureServer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (const __CFString *)-[VCVideoCaptureServer performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v24 = 136316418;
          v25 = v21;
          v26 = 2080;
          v27 = "-[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]";
          v28 = 1024;
          v29 = 3754;
          v30 = 2112;
          v31 = (uint64_t)v20;
          v32 = 2048;
          v33 = self;
          v34 = 2048;
          v35 = v14;
          _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d %@(%p) Fail to set layer size for queue=%p", (uint8_t *)&v24, 0x3Au);
        }
      }
    }
    v18 = 4;
  }
LABEL_22:
  pthread_mutex_unlock(p_enqueueLock);
  return v18;
}

- (unsigned)setLocalVideoDestination:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  id var0;
  _BOOL4 var1;
  int v9;
  NSString *v10;
  _BOOL4 var4;
  _BOOL4 var5;
  BOOL *var2;
  NSObject *captureServerQueue;
  uint64_t v15;
  NSObject *v16;
  int v17;
  _BOOL4 v18;
  int v19;
  unsigned int v20;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[10];
  _BYTE v39[6];
  int v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCVideoCaptureServer-setLocalVideoDestination");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      var1 = a3->var1;
      v9 = *(unsigned __int8 *)a3->var2;
      v10 = NSStringFromRect(a3->var3);
      var4 = a3->var4;
      var5 = a3->var5;
      *(_DWORD *)buf = 136317186;
      v32 = v5;
      v33 = 2080;
      v34 = "-[VCVideoCaptureServer setLocalVideoDestination:]";
      v35 = 1024;
      v36 = 3778;
      v37 = 2048;
      *(_QWORD *)v38 = var0;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)v39 = var1;
      *(_WORD *)&v39[4] = 1024;
      v40 = v9;
      v41 = 2112;
      v42 = v10;
      v43 = 1024;
      v44 = var4;
      v45 = 1024;
      v46 = var5;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ VCVideoCaptureServer-setLocalVideoDestination layer=%p front=%d layerHostMode=%d frameRect=%@ resetImageQueue=%d reconnectLayer=%d", buf, 0x48u);
    }
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (a3 && (var2 = a3->var2) != 0)
  {
    v26 = *var2;
    captureServerQueue = self->captureServerQueue;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __49__VCVideoCaptureServer_setLocalVideoDestination___block_invoke;
    v22[3] = &unk_1E9E57540;
    v22[4] = self;
    v22[5] = &v23;
    v22[6] = &v27;
    v22[7] = a3;
    dispatch_sync(captureServerQueue, v22);
    *a3->var2 = *((_BYTE *)v24 + 24);
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCVideoCaptureServer-setLocalVideoDestination");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *((_DWORD *)v28 + 6);
        v18 = a3->var1;
        v19 = *(unsigned __int8 *)a3->var2;
        *(_DWORD *)buf = 136316418;
        v32 = v15;
        v33 = 2080;
        v34 = "-[VCVideoCaptureServer setLocalVideoDestination:]";
        v35 = 1024;
        v36 = 3824;
        v37 = 1024;
        *(_DWORD *)v38 = v17;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v18;
        *(_WORD *)v39 = 1024;
        *(_DWORD *)&v39[2] = v19;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ VCVideoCaptureServer-setLocalVideoDestination previewSlot=%u, front=%d layerHostMode=%d", buf, 0x2Eu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoCaptureServer setLocalVideoDestination:].cold.1();
  }
  v20 = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v20;
}

uint64_t __49__VCVideoCaptureServer_setLocalVideoDestination___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  VCImageQueue *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;
  __int128 v9;
  VCImageQueue *v10;
  uint64_t v11;
  uint64_t v12;
  CFMutableDictionaryRef EncodedCFDictionary;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v20;
  _BYTE v21[48];
  __int16 v22;
  VCImageQueue *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  VCImageQueue *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    v4 = *(VCImageQueue **)(v3 + 408);
    if (*(_BYTE *)(v2 + 57))
    {
      v5 = 424;
LABEL_6:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(v3 + v5);
      goto LABEL_8;
    }
  }
  else
  {
    v4 = *(VCImageQueue **)(v3 + 416);
    if (*(_BYTE *)(v2 + 57))
    {
      v5 = 425;
      goto LABEL_6;
    }
  }
  v6 = -[VCImageQueue isLayerHostMode](v4, "isLayerHostMode");
  v2 = *(_QWORD *)(a1 + 56);
  if (**(unsigned __int8 **)(v2 + 16) != v6)
  {

    v2 = *(_QWORD *)(a1 + 56);
    goto LABEL_15;
  }
LABEL_8:
  if (v4)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
      && (VCImageQueue_setCALayerSize((uint64_t)v4, 0, *(CGFloat *)(v2 + 24), *(CGFloat *)(v2 + 32), *(CGFloat *)(v2 + 40), *(CGFloat *)(v2 + 48)) & 1) == 0)
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __49__VCVideoCaptureServer_setLocalVideoDestination___block_invoke_cold_1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v20 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v21 = 136316418;
            *(_QWORD *)&v21[4] = v17;
            *(_WORD *)&v21[12] = 2080;
            *(_QWORD *)&v21[14] = "-[VCVideoCaptureServer setLocalVideoDestination:]_block_invoke";
            *(_WORD *)&v21[22] = 1024;
            *(_DWORD *)&v21[24] = 3817;
            *(_WORD *)&v21[28] = 2112;
            *(_QWORD *)&v21[30] = v7;
            *(_WORD *)&v21[38] = 2048;
            *(_QWORD *)&v21[40] = v20;
            v22 = 2048;
            v23 = v4;
            _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d %@(%p) Fail to set layer size for queue=%p", v21, 0x3Au);
          }
        }
      }
    }
    goto LABEL_34;
  }
LABEL_15:
  *(_OWORD *)&v21[16] = xmmword_1D910F630;
  *(_OWORD *)&v21[32] = unk_1D910F640;
  *(_OWORD *)v21 = xmmword_1D910F620;
  v8 = *(_QWORD *)(a1 + 32);
  v21[0] = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(_OWORD *)&v21[8] = *(_OWORD *)(v2 + 24);
  v9 = *(_OWORD *)(v2 + 40);
  v21[40] = 1;
  *(_OWORD *)&v21[24] = v9;
  v21[41] = *(_BYTE *)(v8 + 460);
  *(_DWORD *)&v21[44] = *(unsigned __int8 *)(v2 + 8) == 0;
  v10 = -[VCImageQueue initWithFrameRate:imageQueueProtected:vcImageQueueConfig:]([VCImageQueue alloc], "initWithFrameRate:imageQueueProtected:vcImageQueueConfig:", 30, 0, v21);
  v4 = v10;
  v11 = 408;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 56) + 8))
    v11 = 416;
  v12 = 424;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 56) + 8))
    v12 = 425;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + v11) = v10;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + v12) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  EncodedCFDictionary = VideoAttributes_CreateEncodedCFDictionary(*(void **)(*(_QWORD *)(a1 + 32) + 152));
  VCImageQueue_EnqueueAttributes((uint64_t)v4, EncodedCFDictionary);
  if (EncodedCFDictionary)
    CFRelease(EncodedCFDictionary);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 56) + 8))
        v16 = "front";
      else
        v16 = "back";
      *(_DWORD *)buf = 136316162;
      v25 = v14;
      v26 = 2080;
      v27 = "-[VCVideoCaptureServer setLocalVideoDestination:]_block_invoke";
      v28 = 1024;
      v29 = 3814;
      v30 = 2080;
      v31 = v16;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d camera=%5s, queueToUse=[%@]", buf, 0x30u);
    }
  }
LABEL_34:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[VCImageQueue setVideoDestination:](v4, "setVideoDestination:", **(_QWORD **)(a1 + 56), *(_OWORD *)v21, *(_OWORD *)&v21[16], *(_OWORD *)&v21[32]);
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
}

- (void)beginPreviewToPIPAnimation
{
  uint64_t v3;
  NSObject *v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCVideoCaptureServer beginPreviewToPIPAnimation]";
      v11 = 1024;
      v12 = 3830;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", (uint8_t *)&v7, 0x1Cu);
    }
  }
  if (self->pendingWidth == 1280 && self->pendingHeight == 720)
  {
    -[VideoAttributes ratio](self->localVideoAttributes, "ratio");
    if (v5 == 768.0)
    {
      -[VideoAttributes ratio](self->localVideoAttributes, "ratio");
      if (v6 == 1024.0)
        self->resize = 1;
    }
  }
}

- (void)endPreviewToPIPAnimation
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoCaptureServer endPreviewToPIPAnimation]";
      v9 = 1024;
      v10 = 3838;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  -[VCVideoCaptureServer changeCameraToPendingSettingsWithReset:](self, "changeCameraToPendingSettingsWithReset:", 1);
}

- (void)beginPIPToPreviewAnimation
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoCaptureServer beginPIPToPreviewAnimation]";
      v9 = 1024;
      v10 = 3849;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  -[VCVideoCaptureServer changeCameraToPendingSettingsWithReset:](self, "changeCameraToPendingSettingsWithReset:", 0);
}

- (void)endPIPToPreviewAnimation
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoCaptureServer endPIPToPreviewAnimation]";
      v9 = 1024;
      v10 = 3860;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  -[VCVideoCaptureServer resetCameraToPreviewSettingsForced:](self, "resetCameraToPreviewSettingsForced:", 1);
}

- (BOOL)supportsPortraitResolution
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[VCVideoSource supportsPortraitResolution](self->avCapture, "supportsPortraitResolution");
  else
    return 0;
}

- (void)setLocalCamera:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  _BOOL4 followSystemCamera;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C8B0A0], "deviceWithUniqueID:"))
  {
    if (!self->_followSystemCamera)
    {
      -[VCVideoCaptureServer setCaptureCameraWithToken:](self, "setCaptureCameraWithToken:", -[VCVideoSourceTokenManager tokenForDeviceName:sourceType:](self->_tokenManager, "tokenForDeviceName:sourceType:", a3, 1));
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        followSystemCamera = self->_followSystemCamera;
        v13 = 136315906;
        v14 = v5;
        v15 = 2080;
        v16 = "-[VCVideoCaptureServer setLocalCamera:]";
        v17 = 1024;
        v18 = 3888;
        v19 = 1024;
        v20 = followSystemCamera;
        v8 = "VCVideoCaptureServer [%s] %s:%d Not setting yet because _followSystemCamera=%d, instead wait for KVO notification";
        v9 = v6;
        v10 = 34;
LABEL_9:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = v11;
      v15 = 2080;
      v16 = "-[VCVideoCaptureServer setLocalCamera:]";
      v17 = 1024;
      v18 = 3884;
      v8 = "VCVideoCaptureServer [%s] %s:%d ignoring because captureDevice is nil";
      v9 = v12;
      v10 = 28;
      goto LABEL_9;
    }
  }
}

- (void)setSystemPreferredAsLocalCamera
{
  void *v3;
  uint64_t v4;
  _VCVideoSourceToken v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->captureServerQueue);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C8B0A0], "systemPreferredCamera");
  if (v3)
  {
    v4 = objc_msgSend(v3, "uniqueID");
    v5.var0.var0 = ($948446A44E2BC96870B572155DF52E0B)-[VCVideoSourceTokenManager tokenForDeviceName:sourceType:](self->_tokenManager, "tokenForDeviceName:sourceType:", v4, 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v6;
        v12 = 2080;
        v13 = "-[VCVideoCaptureServer setSystemPreferredAsLocalCamera]";
        v14 = 1024;
        v15 = 3906;
        v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d systemPreferredCamera=%@", (uint8_t *)&v10, 0x26u);
      }
    }
    -[VCVideoCaptureServer dispatchedSetCaptureCameraWithToken:](self, "dispatchedSetCaptureCameraWithToken:", v5.var0.var1);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCVideoCaptureServer setSystemPreferredAsLocalCamera]";
      v14 = 1024;
      v15 = 3901;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d systemPreferredCamera is nil", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)startPreviewWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  NSObject *captureServerQueue;
  _QWORD v10[5];
  int v11;
  int v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VCVideoCaptureServer reconnectClientLayerFront:](self, "reconnectClientLayerFront:", 1);
  -[VCVideoCaptureServer reconnectClientLayerFront:](self, "reconnectClientLayerFront:", 0);
  captureServerQueue = self->captureServerQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke;
  v10[3] = &unk_1E9E52350;
  v10[4] = self;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  dispatch_async(captureServerQueue, v10);
}

void __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const __CFString *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  unsigned int v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  char v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _BYTE v49[10];
  _BYTE v50[6];
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 454);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v43 = v5;
        v44 = 2080;
        v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
        v46 = 1024;
        v47 = 3922;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Preview is already running", buf, 0x1Cu);
      }
    }
    objc_msgSend(*v2, "updatePreviewState");
    return;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *v2;
      v10 = *((_DWORD *)*v2 + 26);
      *(_DWORD *)buf = 136316162;
      v43 = v7;
      v44 = 2080;
      v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
      v46 = 1024;
      v47 = 3926;
      v48 = 2048;
      *(_QWORD *)v49 = v9;
      *(_WORD *)&v49[8] = 1024;
      *(_DWORD *)v50 = v10;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d self %p, current sourceToken=0x%x", buf, 0x2Cu);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)*v2 + 472));
  objc_msgSend(*((id *)*v2 + 51), "start");
  objc_msgSend(*((id *)*v2 + 52), "start");
  pthread_mutex_unlock((pthread_mutex_t *)((char *)*v2 + 472));
  v11 = *v2;
  if (*((_QWORD *)*v2 + 41))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *((_DWORD *)*v2 + 2);
        v15 = *((_DWORD *)*v2 + 3);
        v16 = *((_DWORD *)*v2 + 4);
        *(_DWORD *)buf = 136316418;
        v43 = v12;
        v44 = 2080;
        v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
        v46 = 1024;
        v47 = 3964;
        v48 = 1024;
        *(_DWORD *)v49 = v14;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v15;
        *(_WORD *)v50 = 1024;
        *(_DWORD *)&v50[2] = v16;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %dx%d@%d", buf, 0x2Eu);
      }
    }
    v17 = objc_msgSend(*((id *)*v2 + 41), "setWidth:height:frameRate:", *((unsigned int *)*v2 + 2), *((unsigned int *)*v2 + 3), *((unsigned int *)*v2 + 4));
    if ((v17 & 0x80000000) != 0)
    {
      v18 = v17;
      v19 = *v2;
      v20 = CFSTR("avCaptureSetCaptureOptionsFail");
LABEL_31:
      objc_msgSend(v19, "handleAVCaptureError:domain:", v18, v20);
      return;
    }
  }
  else
  {
    v22 = *(_DWORD *)(a1 + 40);
    v21 = *(_DWORD *)(a1 + 44);
    v40 = v21;
    v41 = v22;
    v23 = *(_DWORD *)(a1 + 48);
    v39 = v23;
    if (!v22 || !v21 || !v23)
    {
      objc_msgSend(v11, "previewVideoWidth:height:frameRate:", &v41, &v40, &v39);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v43 = v24;
          v44 = 2080;
          v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
          v46 = 1024;
          v47 = 3942;
          v48 = 1024;
          *(_DWORD *)v49 = v41;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)&v49[6] = v40;
          *(_WORD *)v50 = 1024;
          *(_DWORD *)&v50[2] = v39;
          _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Using preview settings=%dx%d@%d", buf, 0x2Eu);
        }
      }
    }
    if ((objc_msgSend(*v2, "createVideoCaptureWithWidth:height:frameRate:useBackFacingCamera:", v41, v40, v39, 0) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke_cold_2();
      }
      return;
    }
    dispatch_resume(*((dispatch_object_t *)*v2 + 7));
    *((_DWORD *)*v2 + 11) = 0;
    *((_DWORD *)*v2 + 12) = 0;
    *((_DWORD *)*v2 + 2) = v41;
    v26 = v39;
    *((_DWORD *)*v2 + 3) = v40;
    *((_DWORD *)*v2 + 7) = v26;
    v27 = *v2;
    if (!*((_DWORD *)*v2 + 4))
    {
      v27[4] = v26;
      v27 = *v2;
    }
    objc_msgSend(v27, "setCurrentFrameRate:");
  }
  objc_msgSend(*v2, "updateImageQueueFrameRate:", *((unsigned int *)*v2 + 4));
  v28 = objc_msgSend(*((id *)*v2 + 41), "startPreview");
  v29 = v28;
  if ((v28 & 0x80000000) != 0 && (_DWORD)v28 != -2146893775)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke_cold_1(v30, (uint64_t)v2, v31);
    }
    v19 = *v2;
    v20 = CFSTR("avCaptureStartPreviewFail");
    v18 = v29;
    goto LABEL_31;
  }
  if ((_DWORD)v28 != -2146893775)
  {
    *((_BYTE *)*v2 + 108) = 0;
    *((_QWORD *)*v2 + 50) = 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)*v2 + 472));
  objc_msgSend(*v2, "setUpImageRotationConverter");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v32 = objc_msgSend(*((id *)*v2 + 41), "isInternalCamera") ^ 1;
  else
    v32 = 0;
  *((_BYTE *)*v2 + 460) = v32;
  objc_msgSend(*((id *)*v2 + 51), "setIsExternalCamera:", *((unsigned __int8 *)*v2 + 460));
  objc_msgSend(*((id *)*v2 + 52), "setIsExternalCamera:", *((unsigned __int8 *)*v2 + 460));
  pthread_mutex_unlock((pthread_mutex_t *)((char *)*v2 + 472));
  if (objc_msgSend(*((id *)*v2 + 15), "count"))
    objc_msgSend(*((id *)*v2 + 41), "startCaptureWithWidth:height:frameRate:", *((unsigned int *)*v2 + 8), *((unsigned int *)*v2 + 9), *((unsigned int *)*v2 + 4));
  *((_BYTE *)*v2 + 454) = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v35 = *((_DWORD *)*v2 + 2);
      v36 = *((_DWORD *)*v2 + 3);
      v37 = *((_DWORD *)*v2 + 4);
      v38 = *((unsigned __int8 *)*v2 + 454);
      *(_DWORD *)buf = 136316674;
      v43 = v33;
      v44 = 2080;
      v45 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
      v46 = 1024;
      v47 = 4001;
      v48 = 1024;
      *(_DWORD *)v49 = v35;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v36;
      *(_WORD *)v50 = 1024;
      *(_DWORD *)&v50[2] = v37;
      v51 = 1024;
      v52 = v38;
      _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d preview-started %dx%d @ %d, _isPreviewRunning=%d", buf, 0x34u);
    }
  }
}

- (void)pausePreview
{
  NSObject *captureServerQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  self->falteredRenderingtimeStamp = 0.0;
  captureServerQueue = self->captureServerQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__VCVideoCaptureServer_pausePreview__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(captureServerQueue, v3);
}

void __36__VCVideoCaptureServer_pausePreview__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD *v10;
  int ErrorLogLevelForModule;
  os_log_t *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v19 = v2;
      v20 = 2080;
      v21 = "-[VCVideoCaptureServer pausePreview]_block_invoke";
      v22 = 1024;
      v23 = 4009;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[41])
  {
    v5 = objc_msgSend(v4, "canStopPreview");
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "stop:", v5);
    if ((_DWORD)v5)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 454) = 0;
    v7 = *(_QWORD *)(a1 + 32);
    if (v6 < 0)
    {
      objc_msgSend((id)v7, "handleAVCaptureError:domain:");
    }
    else
    {
      pthread_mutex_lock((pthread_mutex_t *)(v7 + 472));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "pause");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "pause");
      pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 296);
      if (*(_QWORD *)(v8 + 384))
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __36__VCVideoCaptureServer_pausePreview__block_invoke_294;
        v17[3] = &unk_1E9E521C0;
        v17[4] = v8;
        v10 = v17;
      }
      else
      {
        v10 = &__block_literal_global_297;
      }
      dispatch_async(v9, v10);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v12 = (os_log_t *)MEMORY[0x1E0CF2758];
      if (ErrorLogLevelForModule > 6)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v19 = v13;
          v20 = 2080;
          v21 = "-[VCVideoCaptureServer pausePreview]_block_invoke_3";
          v22 = 1024;
          v23 = 4047;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d completed", buf, 0x1Cu);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v19 = v15;
          v20 = 2080;
          v21 = "-[VCVideoCaptureServer pausePreview]_block_invoke";
          v22 = 1024;
          v23 = 4048;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d preview-paused", buf, 0x1Cu);
        }
      }
    }
  }
  else
  {
    objc_msgSend(v4, "updatePreviewState");
  }
}

uint64_t __36__VCVideoCaptureServer_pausePreview__block_invoke_294(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "didPausePreview");
  return result;
}

uint64_t __36__VCVideoCaptureServer_pausePreview__block_invoke_2()
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidPause", 0);
}

- (void)stopPreview
{
  NSObject *captureServerQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__VCVideoCaptureServer_stopPreview__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(captureServerQueue, v4);
  self->falteredRenderingtimeStamp = 0.0;
  self->resize = 0;
}

void __35__VCVideoCaptureServer_stopPreview__block_invoke(uint64_t a1)
{
  int ErrorLogLevelForModule;
  os_log_t *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v3 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v14 = 136315906;
      v15 = v4;
      v16 = 2080;
      v17 = "-[VCVideoCaptureServer stopPreview]_block_invoke";
      v18 = 1024;
      v19 = 4055;
      v20 = 2048;
      v21 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d self %p", (uint8_t *)&v14, 0x26u);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 328);
  if (v8)
  {
    objc_msgSend(v8, "stop:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "invalidate");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setCFAvailabilityChange:", 0);
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 56));
    v7 = *(_QWORD *)(a1 + 32);
  }
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 472));
  objc_msgSend(*(id *)(a1 + 32), "tearDownImageRotationConverter");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setRatio:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 454) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 454);
      v14 = 136315906;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCVideoCaptureServer stopPreview]_block_invoke";
      v18 = 1024;
      v19 = 4087;
      v20 = 1024;
      LODWORD(v21) = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d _isPreviewRunning=%d", (uint8_t *)&v14, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCVideoCaptureServer stopPreview]_block_invoke";
      v18 = 1024;
      v19 = 4088;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d preview-stopped", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (void)setPauseCapture:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *captureClientQueue;
  NSObject *screenHealthMonitor;
  _QWORD block[5];
  BOOL v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    captureClientQueue = self->captureClientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__VCVideoCaptureServer_setPauseCapture___block_invoke;
    block[3] = &unk_1E9E521E8;
    block[4] = self;
    v8 = v3;
    dispatch_async(captureClientQueue, block);
    screenHealthMonitor = self->screenHealthMonitor;
    if (v3)
      dispatch_suspend(screenHealthMonitor);
    else
      dispatch_resume(screenHealthMonitor);
  }
}

void __40__VCVideoCaptureServer_setPauseCapture___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "setPauseCapture:", *(unsigned __int8 *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 40);
      v6 = 136315906;
      if (v4)
        v5 = "Paused";
      else
        v5 = "Resumed";
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCVideoCaptureServer setPauseCapture:]_block_invoke";
      v10 = 1024;
      v11 = 4101;
      v12 = 2080;
      v13 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d %s screen capture", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  NSObject *captureServerQueue;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  int v13;
  int v14;
  int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  self->_encodingWidth = a3;
  self->_encodingHeight = a4;
  -[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:](self, "startPreviewWithWidth:height:frameRate:");
  if (a4 * a3 * a5)
  {
    captureServerQueue = self->captureServerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__VCVideoCaptureServer_startCaptureWithWidth_height_frameRate___block_invoke;
    block[3] = &unk_1E9E52350;
    block[4] = self;
    v13 = a5;
    v14 = a3;
    v15 = a4;
    dispatch_async(captureServerQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v17 = v10;
      v18 = 2080;
      v19 = "-[VCVideoCaptureServer startCaptureWithWidth:height:frameRate:]";
      v20 = 1024;
      v21 = 4123;
      v22 = 1024;
      v23 = a3;
      v24 = 1024;
      v25 = a4;
      v26 = 1024;
      v27 = a5;
      _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d received invalid settings %dx%d@%dfps, returning early", buf, 0x2Eu);
    }
  }
}

void __63__VCVideoCaptureServer_startCaptureWithWidth_height_frameRate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  _DWORD *v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 328))
  {
    objc_msgSend((id)v2, "updatePreviewState");
    return;
  }
  if (objc_msgSend(*(id *)(v2 + 120), "count"))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = *(_DWORD *)(a1 + 40);
    v3 = objc_msgSend(*(id *)(a1 + 32), "getCappedFrameRate:", *(unsigned int *)(a1 + 40));
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "startCaptureWithWidth:height:frameRate:", *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48), v3);
    v5 = *(_QWORD *)(a1 + 32);
    if (v4 == -2146893775 && *(_DWORD *)(v5 + 16) != (_DWORD)v3)
    {
      objc_msgSend((id)v5, "setCurrentFrameRate:", v3);
      v5 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v5 + 457) = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = v3;
    objc_msgSend(*(id *)(a1 + 32), "updateImageQueueFrameRate:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_DWORD *)(a1 + 44);
        v8 = *(_DWORD *)(a1 + 48);
        v10 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316674;
        v22 = v6;
        v23 = 2080;
        v24 = "-[VCVideoCaptureServer startCaptureWithWidth:height:frameRate:]_block_invoke";
        v25 = 1024;
        v26 = 4164;
        v27 = 1024;
        v28 = v9;
        v29 = 1024;
        v30 = v8;
        v31 = 1024;
        v32 = v10;
        v33 = 1024;
        v34 = v3;
        v11 = "VCVideoCaptureServer [%s] %s:%d capture-started, video settings width=%d height=%d rate=%dfps cappedFrameRate=%dfps";
        v12 = v7;
        v13 = 52;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    v20 = 0;
    v19 = 0;
    objc_msgSend(*(id *)(a1 + 32), "previewVideoWidth:height:frameRate:", (char *)&v20 + 4, &v20, &v19);
    objc_msgSend(*(id *)(a1 + 32), "dispatchedSetCaptureWidth:height:rate:", HIDWORD(v20), v20, v19);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_DWORD **)(a1 + 32);
        v17 = v16[2];
        v18 = v16[3];
        LODWORD(v16) = v16[4];
        *(_DWORD *)buf = 136316418;
        v22 = v14;
        v23 = 2080;
        v24 = "-[VCVideoCaptureServer startCaptureWithWidth:height:frameRate:]_block_invoke";
        v25 = 1024;
        v26 = 4138;
        v27 = 1024;
        v28 = v17;
        v29 = 1024;
        v30 = v18;
        v31 = 1024;
        v32 = (int)v16;
        v11 = "VCVideoCaptureServer [%s] %s:%d Skip startCapture and reset to preview width=%d height=%d and framerate=%d";
        v12 = v15;
        v13 = 46;
        goto LABEL_13;
      }
    }
  }
}

- (void)stopCapture
{
  NSObject *captureServerQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__VCVideoCaptureServer_stopCapture__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(captureServerQueue, v3);
}

void __35__VCVideoCaptureServer_stopCapture__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD *v11;
  int v12;
  int v13;
  __int128 v14;
  _BYTE *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[10];
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCVideoCaptureServer-stopCapture");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v21 = v2;
      v22 = 2080;
      v23 = "-[VCVideoCaptureServer stopCapture]_block_invoke";
      v24 = 1024;
      v25 = 4170;
      v26 = 2048;
      *(_QWORD *)v27 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d @:@ VCVideoCaptureServer-stopCapture (%p)", buf, 0x26u);
    }
  }
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[41])
  {
    v6 = objc_msgSend(v5, "canStopPreview");
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "stop:", v6);
    if ((_DWORD)v6)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 454) = 0;
    }
    else
    {
      v19 = 0;
      v18 = 0;
      objc_msgSend(*(id *)(a1 + 32), "previewVideoWidth:height:frameRate:", (char *)&v19 + 4, &v19, &v18);
      v8 = v19;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = v18;
      objc_msgSend(*(id *)(a1 + 32), "dispatchedSetCaptureWidth:height:rate:", HIDWORD(v19), v8);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_DWORD **)(a1 + 32);
          v12 = v11[2];
          v13 = v11[3];
          LODWORD(v11) = v11[4];
          *(_DWORD *)buf = 136316418;
          v21 = v9;
          v22 = 2080;
          v23 = "-[VCVideoCaptureServer stopCapture]_block_invoke";
          v24 = 1024;
          v25 = 4188;
          v26 = 1024;
          *(_DWORD *)v27 = v12;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&v27[6] = v13;
          v28 = 1024;
          v29 = (int)v11;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Resetting preview width=%d height=%d and framerate=%d", buf, 0x2Eu);
        }
      }
    }
    v14 = *MEMORY[0x1E0C9D820];
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 224) = *MEMORY[0x1E0C9D820];
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 240) = v14;
    v15 = *(_BYTE **)(a1 + 32);
    if ((v7 & 0x80000000) != 0)
    {
      objc_msgSend(v15, "handleAVCaptureError:domain:", v7, CFSTR("avCaptureStopFail"));
    }
    else
    {
      v15[457] = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v21 = v16;
          v22 = 2080;
          v23 = "-[VCVideoCaptureServer stopCapture]_block_invoke";
          v24 = 1024;
          v25 = 4201;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d capture-stopped", buf, 0x1Cu);
        }
      }
    }
  }
}

- (void)setCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5 forced:(BOOL)a6
{
  NSObject *captureServerQueue;
  _QWORD v7[5];
  int v8;
  int v9;
  int v10;
  BOOL v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__VCVideoCaptureServer_setCaptureWidth_height_rate_forced___block_invoke;
  v7[3] = &unk_1E9E532E0;
  v11 = a6;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v7[4] = self;
  dispatch_async(captureServerQueue, v7);
}

void __59__VCVideoCaptureServer_setCaptureWidth_height_rate_forced___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 52);
      v5 = *(_DWORD *)(a1 + 40);
      v6 = *(_DWORD *)(a1 + 44);
      v7 = *(_DWORD *)(a1 + 48);
      v8 = 136316674;
      v9 = v2;
      v10 = 2080;
      v11 = "-[VCVideoCaptureServer setCaptureWidth:height:rate:forced:]_block_invoke";
      v12 = 1024;
      v13 = 4227;
      v14 = 1024;
      v15 = v4;
      v16 = 1024;
      v17 = v5;
      v18 = 1024;
      v19 = v6;
      v20 = 1024;
      v21 = v7;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d forced %d, %dx%d@%d", (uint8_t *)&v8, 0x34u);
    }
  }
  if (*(_BYTE *)(a1 + 52))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCaptureWidth:height:rate:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48));
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 76) = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_DWORD *)(a1 + 48);
  }
}

- (void)dispatchedSetCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5
{
  VCVideoSource *avCapture;
  uint64_t v7;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  avCapture = self->avCapture;
  if (avCapture)
  {
    v7 = *(_QWORD *)&a5;
    if (self->currentWidth == a3 && self->currentHeight == a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136316418;
          v16 = v10;
          v17 = 2080;
          v18 = "-[VCVideoCaptureServer dispatchedSetCaptureWidth:height:rate:]";
          v19 = 1024;
          v20 = 4247;
          v21 = 1024;
          v22 = a3;
          v23 = 1024;
          v24 = a4;
          v25 = 1024;
          v26 = v7;
          v12 = "VCVideoCaptureServer [%s] %s:%d already at requested dimensions=%dx%d@%d";
LABEL_11:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0x2Eu);
        }
      }
    }
    else
    {
      v13 = -[VCVideoSource setWidth:height:frameRate:](avCapture, "setWidth:height:frameRate:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
      if ((v13 & 0x80000000) != 0)
      {
        -[VCVideoCaptureServer handleAVCaptureError:domain:](self, "handleAVCaptureError:domain:", v13, CFSTR("avCaptureSetCaptureOptionsFail"));
        return;
      }
      self->currentWidth = a3;
      self->currentHeight = a4;
      -[VCVideoCaptureServer setCurrentFrameRate:](self, "setCurrentFrameRate:", v7);
      -[VCVideoCaptureServer updateImageQueueFrameRate:](self, "updateImageQueueFrameRate:", self->currentFrameRate);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136316418;
          v16 = v14;
          v17 = 2080;
          v18 = "-[VCVideoCaptureServer dispatchedSetCaptureWidth:height:rate:]";
          v19 = 1024;
          v20 = 4261;
          v21 = 1024;
          v22 = a3;
          v23 = 1024;
          v24 = a4;
          v25 = 1024;
          v26 = v7;
          v12 = "VCVideoCaptureServer [%s] %s:%d changed to=%dx%d@%dfps";
          goto LABEL_11;
        }
      }
    }
  }
}

- (void)setCaptureWidth:(int)a3 height:(int)a4 rate:(int)a5
{
  NSObject *captureServerQueue;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  int v9;
  int v10;
  int v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4 * a3 * a5)
  {
    captureServerQueue = self->captureServerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__VCVideoCaptureServer_setCaptureWidth_height_rate___block_invoke;
    block[3] = &unk_1E9E52350;
    block[4] = self;
    v9 = a3;
    v10 = a4;
    v11 = a5;
    dispatch_async(captureServerQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCVideoCaptureServer setCaptureWidth:height:rate:]";
      v16 = 1024;
      v17 = 4266;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d received invalid settings, returning", buf, 0x1Cu);
    }
  }
}

uint64_t __52__VCVideoCaptureServer_setCaptureWidth_height_rate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetCaptureWidth:height:rate:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48));
}

- (void)resetCameraToPreviewSettingsForced:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  v6 = -1431655766;
  v7 = -1431655766;
  v5 = -1431655766;
  -[VCVideoCaptureServer previewVideoWidth:height:frameRate:](self, "previewVideoWidth:height:frameRate:", &v7, &v6, &v5);
  -[VCVideoCaptureServer setCaptureWidth:height:rate:forced:](self, "setCaptureWidth:height:rate:forced:", v7, v6, v5, v3);
}

- (BOOL)cameraSupportsWidth:(int)a3 height:(int)a4
{
  NSObject *captureServerQueue;
  char v5;
  _QWORD v7[6];
  int v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  captureServerQueue = self->captureServerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__VCVideoCaptureServer_cameraSupportsWidth_height___block_invoke;
  v7[3] = &unk_1E9E52378;
  v7[4] = self;
  v7[5] = &v10;
  v8 = a3;
  v9 = a4;
  dispatch_sync(captureServerQueue, v7);
  v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __51__VCVideoCaptureServer_cameraSupportsWidth_height___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "cameraSupportsFormatWidth:height:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCFAvailabilityChange:(BOOL)a3
{
  uint64_t v4;
  NSObject *captureServerQueue;
  _QWORD v6[5];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("previewCameraCinematicFraming");
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  captureServerQueue = self->captureServerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__VCVideoCaptureServer_setCFAvailabilityChange___block_invoke;
  v6[3] = &unk_1E9E521C0;
  v6[4] = v4;
  dispatch_async(captureServerQueue, v6);
}

uint64_t __48__VCVideoCaptureServer_setCFAvailabilityChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewCameraCinematicFramingAvailablilty", *(_QWORD *)(a1 + 32));
}

- (__CFDictionary)copyReportingStatsForCaptureSource:(int)a3
{
  __CFDictionary *Mutable;
  NSObject *captureServerQueue;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v11[6];
  int v12;
  _QWORD v13[6];
  int v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    if (a3 < 0xA)
    {
      captureServerQueue = self->captureServerQueue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __59__VCVideoCaptureServer_copyReportingStatsForCaptureSource___block_invoke_2;
      v11[3] = &unk_1E9E52350;
      v12 = a3;
      v11[4] = self;
      v11[5] = Mutable;
      v7 = v11;
    }
    else
    {
      captureServerQueue = self->_streamInputQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__VCVideoCaptureServer_copyReportingStatsForCaptureSource___block_invoke;
      v13[3] = &unk_1E9E52350;
      v13[4] = self;
      v13[5] = Mutable;
      v14 = a3;
      v7 = v13;
    }
    dispatch_sync(captureServerQueue, v7);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v8;
      v17 = 2080;
      v18 = "-[VCVideoCaptureServer copyReportingStatsForCaptureSource:]";
      v19 = 1024;
      v20 = 4319;
      v21 = 1024;
      v22 = a3;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Failed to create the reporting stats dictionary. captureSourceID=%d", buf, 0x22u);
    }
  }
  return Mutable;
}

uint64_t __59__VCVideoCaptureServer_copyReportingStatsForCaptureSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addStreamInputStatsToDict:captureSource:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __59__VCVideoCaptureServer_copyReportingStatsForCaptureSource___block_invoke_2(uint64_t a1)
{
  unsigned int v1;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 48);
  if (v1 <= 9)
  {
    if (((1 << v1) & 0x3F5) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v5 = *(_DWORD *)(a1 + 48);
          v6 = 136315906;
          v7 = v3;
          v8 = 2080;
          v9 = "-[VCVideoCaptureServer copyReportingStatsForCaptureSource:]_block_invoke_2";
          v10 = 1024;
          v11 = 4346;
          v12 = 1024;
          v13 = v5;
          _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Requesting reporting stats for unsupported captureSourceID=%d", (uint8_t *)&v6, 0x22u);
        }
      }
    }
    else if (v1 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "addScreenStatsToDict:", *(_QWORD *)(a1 + 40));
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "getReportingStats:", *(_QWORD *)(a1 + 40));
    }
  }
}

- (__CFDictionary)copyRealtimeStatsDictionary
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCVideoSource getReportingStats:](self->avCapture, "getReportingStats:", Mutable);
  -[VCVideoCaptureServer addScreenStatsToDict:](self, "addScreenStatsToDict:", Mutable);
  return Mutable;
}

- (__CFDictionary)copyInitialStatsDictionary
{
  NSObject *captureServerQueue;
  __CFDictionary *v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  CFMutableDictionaryRef Mutable;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  Mutable = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCVideoCaptureServer_copyInitialStatsDictionary__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(captureServerQueue, block);
  v4 = (__CFDictionary *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __50__VCVideoCaptureServer_copyInitialStatsDictionary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "retrieveInitialReportingStats:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return result;
}

- (void)addStreamInputStatsToDict:(__CFDictionary *)a3 captureSource:(int)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputCaptureSources, "objectForKeyedSubscript:", v6);
  if (v7)
  {
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "streamInputID")));
    if (v8)
      VCUtil_AppendFromDictionary(a3, (CFDictionaryRef)objc_msgSend(v8, "reportingStats"));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = v9;
      v13 = 2080;
      v14 = "-[VCVideoCaptureServer addStreamInputStatsToDict:captureSource:]";
      v15 = 1024;
      v16 = 4381;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d Stream input capture source doesn't exist. captureSourceID=%@", (uint8_t *)&v11, 0x26u);
    }
  }
}

- (void)addScreenStatsToDict:(__CFDictionary *)a3
{
  NSMutableDictionary *screenShareCaptureConfig;
  int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  _BYTE v10[24];
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  screenShareCaptureConfig = self->_screenShareCaptureConfig;
  if (screenShareCaptureConfig)
  {
    v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](screenShareCaptureConfig, "objectForKeyedSubscript:", CFSTR("ScreenCaptureIsWindowed")), "BOOLValue");
    v6 = v5 ^ 1u;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = "YES";
        *(_DWORD *)v10 = 136315906;
        *(_QWORD *)&v10[4] = v7;
        *(_WORD *)&v10[12] = 2080;
        *(_QWORD *)&v10[14] = "-[VCVideoCaptureServer addScreenStatsToDict:]";
        if (v5)
          v9 = "NO";
        *(_WORD *)&v10[22] = 1024;
        v11 = 4395;
        v12 = 2080;
        v13 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d isFullScreen=%s", v10, 0x26u);
      }
    }
  }
  else
  {
    v6 = 0;
  }
  CFDictionaryAddValue(a3, CFSTR("ScreenSharingIsFullScreen"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6, *(_OWORD *)v10, *(_QWORD *)&v10[16]));
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  _BOOL8 var3;
  uint64_t var2;
  _BOOL4 var4;
  uint64_t var5;
  CMTime v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a5->var1)
  {
    var3 = a5->var3;
    var2 = a5->var2;
    var4 = a5->var4;
    v10 = *(CMTime *)a4;
    VCVideoCaptureServer_OnCaptureVideoFrame((uint64_t)self, a3, &v10, var3, var2, var4);
  }
  else
  {
    var5 = a5->var5;
    v10 = *(CMTime *)a4;
    -[VCVideoCaptureServer onCaptureScreenFrame:frameTime:orientation:](self, "onCaptureScreenFrame:frameTime:orientation:", a3, &v10, var5);
  }
  return 1;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
  NSObject *captureServerQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  captureServerQueue = self->captureServerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCVideoCaptureServer_sourceFrameRateDidChange___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(captureServerQueue, block);
}

void __49__VCVideoCaptureServer_sourceFrameRateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  int v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "updateImageQueueFrameRate:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 136315906;
      v10 = v2;
      v11 = 2080;
      v12 = "-[VCVideoCaptureServer sourceFrameRateDidChange:]_block_invoke";
      v13 = 1024;
      v14 = 4428;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d setting camera framerate to %d", buf, 0x22u);
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 264);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__VCVideoCaptureServer_sourceFrameRateDidChange___block_invoke_317;
  v7[3] = &unk_1E9E52300;
  v7[4] = v5;
  v8 = *(_DWORD *)(a1 + 40);
  dispatch_async(v6, v7);
}

uint64_t __49__VCVideoCaptureServer_sourceFrameRateDidChange___block_invoke_317(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "sourceFrameRateDidChange:", *(unsigned int *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (AVConferencePreviewDelegate)appDelegate
{
  return self->appDelegate;
}

- (void)setAppDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (tagAVConferencePreviewDelegateRealtimeRealtimeInstanceVTable)delegateFunctions
{
  return self->delegateFunctions;
}

- (void)setDelegateFunctions:(tagAVConferencePreviewDelegateRealtimeRealtimeInstanceVTable)a3
{
  self->delegateFunctions = a3;
}

- (BOOL)followSystemCamera
{
  return self->_followSystemCamera;
}

- (BOOL)is1080pCameraAvailable
{
  return self->_is1080pCameraAvailable;
}

- (_VCVideoSourceToken)currentVideoSourceToken
{
  return self->_currentVideoSourceToken;
}

void ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  v2 = +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:](VideoUtil, "convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:", *(_QWORD *)(a1 + 40), 0, 0, 0, 1);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v2, CFSTR("snapShotFrame"), 0);
  if (v3)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 296);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke_711;
    block[3] = &unk_1E9E521C0;
    block[4] = v3;
    dispatch_async(v4, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke_cold_1();
  }

}

uint64_t ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke_711(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidGetSnapShot", *(_QWORD *)(a1 + 32));
}

uint64_t ___VCVideoCaptureServer_DidReceiveFirstPreviewFrame_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 384))
  {
    v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 392);
    if (v2)
      return v2(*(_QWORD *)(v1 + 384), *(_QWORD *)(result + 40));
  }
  return result;
}

uint64_t ___VCVideoCaptureServer_DidReceiveFirstPreviewFrame_block_invoke_716(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidReceiveFirstFrame", *(_QWORD *)(a1 + 32));
}

uint64_t ___VCVideoCaptureServer_ProcessFrameSizeChange_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "didChangeLocalVideoAttributes:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t ___VCVideoCaptureServer_ProcessFrameSizeChange_block_invoke_718(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "previewDidLocalVideoAttributesChange", *(_QWORD *)(a1 + 32));
}

uint64_t ___VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  __int128 v23;
  _QWORD v24[2];
  char v25;
  __int16 v26;
  char v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE buf[24];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    v4 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "_VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        v39 = 1664;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoCaptureServer [%s] %s:%d sending frame to VideoConference", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      ___VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke_cold_1();
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v35;
    *(_QWORD *)&v7 = 136315650;
    v23 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v11, "prepareVideoFrame:", *(_QWORD *)(a1 + 40)) & 1) == 0
          && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            *(_QWORD *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "_VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke";
            *(_WORD *)&buf[22] = 1024;
            v39 = 1671;
            _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d prepareVideoFrame returned an error", buf, 0x1Cu);
          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v8);
  }
  v14 = *(_BYTE *)(a1 + 72);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v28, 16, v23);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        v21 = *(_QWORD *)(a1 + 40);
        *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
        *(_QWORD *)&buf[16] = *(_QWORD *)(a1 + 64);
        v24[0] = 0;
        v24[1] = 0;
        v25 = v14;
        v26 = 0;
        v27 = 0;
        objc_msgSend(v20, "onVideoFrame:frameTime:attribute:", v21, buf, v24);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    }
    while (v17);
  }
  return FigSampleBufferRelease();
}

- (void)init
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d done initialization of singleton", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __28__VCVideoCaptureServer_init__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoCaptureServer init]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d frameBecameAvailableCount returned error 0x%x", v2, *(const char **)v3, (unint64_t)"-[VCVideoCaptureServer init]_block_invoke" >> 16, 469);
  OUTLINED_FUNCTION_3();
}

- (void)isAirPlayXPCHelper
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d proc_pidinfo failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_2_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d VCCameraPreview not found. Cannot start preview before initialize.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_69_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d VCCameraPreview not found. Cannot pause preview before initialize.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid camera facing and frameRect arguments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid fenceHandle value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__VCVideoCaptureServer_registerBlocksForServer__block_invoke_94_cold_3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid frameRect value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createVideoCaptureWithWidth:height:frameRate:useBackFacingCamera:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Error no camera available! camera name = %@");
  OUTLINED_FUNCTION_3();
}

- (void)handleAVCaptureError:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Camera is not valid. _currentVideoSourceToken = 0x%x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)handleAVCaptureError:error:.cold.2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying clients of avcapture error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleAVCaptureError:error:.cold.3()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying app of acvapture error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid camera, _currentVideoSourceToken=0x%x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  OUTLINED_FUNCTION_14_2();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v2, "UTF8String");
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  v6 = 1286;
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, "VCVideoCaptureServer [%s] %s:%d received %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

void __51__VCVideoCaptureServer_handleCaptureEvent_subType___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid camera, _currentVideoSourceToken=0x%x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __60__VCVideoCaptureServer_registerCaptureClientForScreenShare___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Attempting to register a nil client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterCaptureClientForScreenShare:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Attempting to deregister a nil client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__VCVideoCaptureServer_registerSystemAudioConfig_forSource___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d client not found in config for source=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __62__VCVideoCaptureServer_deregisterSystemAudioConfig_forSource___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d client not found in config for source=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedStartSystemAudioForClientKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d No audio config found for clientKey=%@.");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedStartSystemAudioForClientKey:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create system audio capture object for clientKey=%@.");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedStartSystemAudioForClientKey:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to start system audio capture clientKey=%@.");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedStopSystemAudioForClientKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to find system audio capture object for clientKey=%@.");
  OUTLINED_FUNCTION_3();
}

- (void)setupScreenCaptureForSource:config:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create screen capture object (iOS)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUpdateCaptureRuleForClient:width:height:frameRate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to allocate video rule", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerForVideoFramesFromSource:sourceConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid VCCaptureSource", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __70__VCVideoCaptureServer_deregisterForVideoFramesFromSource_withClient___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid VCCaptureSource", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __68__VCVideoCaptureServer_isClientRegisteredForVideoFrames_fromSource___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid VCCaptureSource", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d No screen capture object found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __66__VCVideoCaptureServer_setScreenCaptureFrameRate_captureSourceID___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to set screen capture frame rate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpScreenVideoCaptureSource:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d No Capture configuration, bailing set up screen capture source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpScreenVideoCaptureSource:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create screen capture object (iOS)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpScreenVideoCaptureSource:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;
  int v7;
  uint64_t v8;

  OUTLINED_FUNCTION_14_2();
  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v2, "count");
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  v6 = "-[VCVideoCaptureServer setUpScreenVideoCaptureSource:]";
  OUTLINED_FUNCTION_4();
  v7 = 2900;
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, "VCVideoCaptureServer [%s] %s:%d screenCaptures=%lu already created", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)setUpScreenVideoCaptureSource:.cold.4()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;
  int v5;
  const void *v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  LODWORD(v6) = 2899;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v1, v2, "VCVideoCaptureServer [%s] %s:%d screenCapture=%p already created", v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to start screen capture due to empty client list or no screen capture object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCVideoCaptureServer_startScreenShareCapture___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to set up the screen capture source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__VCVideoCaptureServer_stopScreenShareCapture___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to stop a screen capture as we don't have a screen capture object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d No Capture configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__VCVideoCaptureServer_updateScreenCapture_withConfig___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Updating screen sharing configuration is currently not supported for this use case", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamInputs
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to allocate stream input capture source dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__VCVideoCaptureServer_registerVideoSink_withCaptureSource___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Missing stream input capture source. captureSourceID=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __62__VCVideoCaptureServer_unregisterVideoSink_withCaptureSource___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Missing stream input capture source. captureSourceID=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __59__VCVideoCaptureServer_suspendVideoSink_withCaptureSource___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Missing stream input capture source. captureSourceID=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __58__VCVideoCaptureServer_resumeVideoSink_withCaptureSource___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Missing stream input capture source. captureSourceID=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to allocate the stream input capture source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Format doesn't match. streamInputID=%@");
  OUTLINED_FUNCTION_3();
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Format doesn't match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __74__VCVideoCaptureServer_registerStreamInputCaptureSourceWithConfiguration___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Stream input capture source already registered. newCaptureSourceID=%@");
  OUTLINED_FUNCTION_3();
}

void __78__VCVideoCaptureServer_unregisterStreamInputCaptureSourceWithCaptureSourceID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Stream input capture source doesn't exist. captureSourceID=%@");
  OUTLINED_FUNCTION_3();
}

- (void)internalRegisterStreamInput:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Format doesn't match. captureSourceID=%@");
  OUTLINED_FUNCTION_3();
}

- (void)internalRegisterStreamInput:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Stream input already registered. StreamInputID=%@");
  OUTLINED_FUNCTION_3();
}

- (void)internalRegisterStreamInput:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;
  int v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19_2(v2, *MEMORY[0x1E0C80C00]);
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  v6 = "-[VCVideoCaptureServer internalRegisterStreamInput:]";
  OUTLINED_FUNCTION_4();
  v7 = 3293;
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, "VCVideoCaptureServer [%s] %s:%d Stream input is invalid. StreamInputID=%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)internalUnregisterStreamInput:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Stream input not registered. StreamInputID=%@");
  OUTLINED_FUNCTION_3();
}

- (void)internalUnregisterStreamInput:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Different stream input registered with the stream input ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)internalUnregisterStreamInput:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;
  int v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19_2(v2, *MEMORY[0x1E0C80C00]);
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  v6 = "-[VCVideoCaptureServer internalUnregisterStreamInput:]";
  OUTLINED_FUNCTION_4();
  v7 = 3319;
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, "VCVideoCaptureServer [%s] %s:%d Stream input is invalid. StreamInputID=%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

void __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying clients of video attributes change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCVideoCaptureServer_setLocalVideoAttributes___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying app of video attributes change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying clients of video attributes change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__VCVideoCaptureServer_setLocalScreenAttributes___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d notifying app of video attributes change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedSetCaptureCameraWithToken:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid cameraUID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Fail to set layer size for queue=%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoCaptureServer setBoundsForRemoteLayerWithFacing:frameRect:fenceHandle:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setLocalVideoDestination:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Invalid VCLocalDestinationConfig config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__VCVideoCaptureServer_setLocalVideoDestination___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoCaptureServer setLocalVideoDestination:]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Fail to set layer size for queue=%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoCaptureServer setLocalVideoDestination:]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(*(_QWORD *)a2 + 8);
  v4 = *(_DWORD *)(*(_QWORD *)a2 + 12);
  v5 = *(_DWORD *)(*(_QWORD *)a2 + 16);
  v6 = 136316418;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCVideoCaptureServer startPreviewWithWidth:height:frameRate:]_block_invoke";
  v10 = 1024;
  v11 = 3975;
  v12 = 1024;
  v13 = v3;
  v14 = 1024;
  v15 = v4;
  v16 = 1024;
  v17 = v5;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, "VCVideoCaptureServer [%s] %s:%d error starting preview %d %d %d", (uint8_t *)&v6, 0x2Eu);
}

void __63__VCVideoCaptureServer_startPreviewWithWidth_height_frameRate___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d error creating AVCapture handle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCVideoCaptureServer_SendSnapshotFromFrame_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d Failed to create XPC snapshot frame", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCVideoCaptureServer_ProcessCaptureSampleBuffer_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCVideoCaptureServer [%s] %s:%d sending frame to VideoConference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
