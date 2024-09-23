@implementation VCScreenCapture

- (void)processAndSendIdleBlackFrame
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCScreenCapture [%s] %s:%d Failed to get image buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (VCScreenCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 sourceConfig:(id)a5
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  char *v13;
  char *v14;
  _OWORD *v15;
  int v16;
  int v17;
  CFDictionaryRef DictionaryRepresentation;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  signed int v43;
  _QWORD *v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  double v55;
  uint64_t v56;
  void *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  int v64;
  int v65;
  const __CFAllocator *v66;
  uint64_t *v67;
  CVPixelBufferPoolRef *v68;
  int PixelBufferPool;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  uint64_t v74;
  CVPixelBufferPoolRef v75;
  uint64_t v76;
  int v77;
  char v78;
  char v79;
  unsigned int v81;
  unsigned int v82;
  objc_super v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  _BYTE v91[10];
  CVPixelBufferPoolRef v92;
  __int16 v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[3];
  CGSize v97;

  v96[1] = *MEMORY[0x1E0C80C00];
  v82 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("VideoWidth")), "intValue");
  v81 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("VideoHeight")), "intValue");
  v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:"), "intValue");
  v78 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ShouldSendBlackFramesOnClearScreen")), "BOOLValue");
  v77 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ResolutionScaling")), "intValue");
  v79 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("EnableIdleFrameAdjustments")), "BOOLValue");
  if (objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("CaptureSourceID")))
    v9 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("CaptureSourceID")), "integerValue");
  else
    v9 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v85 = v10;
      v86 = 2080;
      v87 = "-[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]";
      v88 = 1024;
      v89 = 765;
      v90 = 1024;
      *(_DWORD *)v91 = v82;
      *(_WORD *)&v91[4] = 1024;
      *(_DWORD *)&v91[6] = v81;
      LOWORD(v92) = 1024;
      *(_DWORD *)((char *)&v92 + 2) = v8;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCScreenCapture [%s] %s:%d width=%d, height=%d, frameRate=%d", buf, 0x2Eu);
    }
  }
  if (!a3 || !v82 || !v81 || !v8)
  {

    return 0;
  }
  if (v9)
    v12 = 0;
  else
    v12 = a3;
  v83.receiver = self;
  v83.super_class = (Class)VCScreenCapture;
  v13 = -[VCVideoCapture initWithCaptureServer:protocolFunctions:](&v83, sel_initWithCaptureServer_protocolFunctions_, v12, a4);
  v14 = v13;
  if (v13)
  {
    *((_QWORD *)v13 + 20) = v9;
    v15 = (_OWORD *)MEMORY[0x1E0CA2E68];
    *(_QWORD *)(v13 + 412) = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)(v13 + 396) = *v15;
    v13[486] = 0;
    v13[376] = v78;
    *((_DWORD *)v13 + 120) = v77;
    *((_DWORD *)v13 + 114) = v82;
    *((_DWORD *)v13 + 115) = v81;
    *((_DWORD *)v13 + 77) = v8;
    v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("VideoWidth")), "intValue");
    v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("VideoHeight")), "intValue");
    v97.width = (double)v16;
    v97.height = (double)v17;
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v97);
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0CC6648]);
    v20 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ScreenCaptureUUID"));
    if (v20 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      v21 = 0;
    else
      v21 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ScreenCaptureUUID"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CC6650]);
    v22 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("RemoteDeviceName"));
    if ((objc_msgSend(v22, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
    {
      v23 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("RemoteDeviceName"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CC6638]);
    }
    CFRelease(DictionaryRepresentation);
    v24 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("HDRMode")), "intValue");
    v25 = v24;
    v26 = (uint64_t *)MEMORY[0x1E0CC6788];
    v27 = (uint64_t *)MEMORY[0x1E0CC6500];
    v28 = (uint64_t *)MEMORY[0x1E0CC6780];
    v29 = (uint64_t *)MEMORY[0x1E0CC6508];
    if (v24 == 2)
    {
      v29 = (uint64_t *)MEMORY[0x1E0CC64F8];
      v28 = (uint64_t *)MEMORY[0x1E0CC6788];
    }
    if (v24 != 1)
    {
      v27 = v29;
      v26 = v28;
    }
    v30 = *v27;
    v31 = *v26;
    v95 = *MEMORY[0x1E0CC6510];
    v96[0] = v30;
    v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, &v95, 1);
    v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("FrameRate"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CC66E0]);
    v35 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("FrameRate"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0CC6538]);
    v36 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PixelFormat"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CC6540]);
    objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E9EF4190, *MEMORY[0x1E0CC65E0]);
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CC6600]);
    objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E9EF41A8, *MEMORY[0x1E0CC6570]);
    v37 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ShouldSupressDRMContent"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0CC65E8]);
    v38 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ScreenCaptureUUID"));
    if (v38 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      v39 = 0;
    else
      v39 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ScreenCaptureUUID"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0CC65D0]);
    if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceScreenCaptureToMod16"), 0))
    {
      objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC6558]);
    }
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ClientPid")), "intValue"))
    {
      v40 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ClientPid"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0CC6528]);
    }
    v41 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ClientBundleID"));
    if (v41)
    {
      v42 = v41;
      if ((objc_msgSend(v41, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0CC6520]);
    }
    v43 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ScreenCaptureConfigurationDisplayMode")), "intValue");
    v44 = (_QWORD *)MEMORY[0x1E0CC6590];
    if (v43 <= 2)
    {
      v45 = qword_1E9E53CD0[v43];
      objc_msgSend(v33, "setObject:forKeyedSubscript:", qword_1E9E53CB8[v43], *MEMORY[0x1E0CC6588]);
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v45, *v44);
    }
    v46 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("HasPrivateCaptureEntitlement")), "BOOLValue");
    v47 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-screen-capture-private-content-capture-disabled"), CFSTR("screenCaptureDisablePrivateContentCapture"), &unk_1E9EF41C0, 0), "BOOLValue");
    if (v46)
    {
      v48 = v47;
      if ((v47 & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v49 = VRTraceErrorLogLevelToCSTR();
          v50 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v85 = v49;
            v86 = 2080;
            v87 = "_VCScreenCapture_canCapturePrivateContent";
            v88 = 1024;
            v89 = 654;
            v90 = 1024;
            *(_DWORD *)v91 = 1;
            *(_WORD *)&v91[4] = 1024;
            *(_DWORD *)&v91[6] = v48;
            _os_log_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_DEFAULT, "VCScreenCapture [%s] %s:%d hasPrivateCaptureEntitlement=%d privateContentCaptureDisable=%d", buf, 0x28u);
          }
        }
        objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC6560]);
        v44 = (_QWORD *)MEMORY[0x1E0CC6590];
      }
    }
    v51 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ScreenVirtualDisplayLabel"));
    if (v51)
    {
      v52 = v51;
      if ((objc_msgSend(v51, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
      {
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v52, *MEMORY[0x1E0CC6548]);
        objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC6608]);
        v53 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay"), "pointScale"));
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0CC6668]);
        v54 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay"), "bounds");
        v56 = objc_msgSend(v54, "numberWithDouble:", v55);
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0CC65A8]);
        v57 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay"), "bounds");
        v59 = objc_msgSend(v57, "numberWithDouble:", v58);
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v59, *MEMORY[0x1E0CC65A0]);
      }
    }
    v60 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("AllowRemoteControlLayers"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0CC6518]);
    v61 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("NotifyOnDisallowedCloningLayers"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v61, *MEMORY[0x1E0CC6598]);
    if (v25)
    {
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CC6658]);
      objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E9EF4190, *v44);
    }
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CC66F0]);

    *((_QWORD *)v14 + 18) = v33;
    v14[468] = v79;
    *((_DWORD *)v14 + 118) = 0;
    v14[476] = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v62 = VRTraceErrorLogLevelToCSTR();
      v63 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v64 = *((_DWORD *)v14 + 114);
        v65 = *((_DWORD *)v14 + 115);
        *(_DWORD *)buf = 136316162;
        v85 = v62;
        v86 = 2080;
        v87 = "-[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]";
        v88 = 1024;
        v89 = 789;
        v90 = 1024;
        *(_DWORD *)v91 = v64;
        *(_WORD *)&v91[4] = 1024;
        *(_DWORD *)&v91[6] = v65;
        _os_log_impl(&dword_1D8A54000, v63, OS_LOG_TYPE_DEFAULT, "VCScreenCapture [%s] %s:%d VCScreenCapture init width=%d height=%d", buf, 0x28u);
      }
    }
    pthread_mutex_init((pthread_mutex_t *)(v14 + 168), 0);
    pthread_mutex_init((pthread_mutex_t *)(v14 + 312), 0);
    pthread_cond_init((pthread_cond_t *)(v14 + 248), 0);
    v66 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v67 = (uint64_t *)(v14 + 440);
    VTImageRotationSessionCreate();
    v68 = (CVPixelBufferPoolRef *)(v14 + 448);
    createPixelBufferPool((CVPixelBufferPoolRef *)v14 + 56, v82, v81);
    VTPixelTransferSessionCreate(v66, (VTPixelTransferSessionRef *)v14 + 54);
    VTSessionSetProperty(*((VTSessionRef *)v14 + 54), (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB38]);
    PixelBufferPool = createPixelBufferPool((CVPixelBufferPoolRef *)v14 + 53, v82, v81);
    if (!*((_QWORD *)v14 + 56) || !*v67 || !*((_QWORD *)v14 + 18) || PixelBufferPool)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v70 = VRTraceErrorLogLevelToCSTR();
        v71 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v74 = *v67;
          v75 = *v68;
          v76 = *((_QWORD *)v14 + 18);
          *(_DWORD *)buf = 136316418;
          v85 = v70;
          v86 = 2080;
          v87 = "-[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:]";
          v88 = 1024;
          v89 = 808;
          v90 = 2048;
          *(_QWORD *)v91 = v74;
          *(_WORD *)&v91[8] = 2048;
          v92 = v75;
          v93 = 2048;
          v94 = v76;
          _os_log_error_impl(&dword_1D8A54000, v71, OS_LOG_TYPE_ERROR, "VCScreenCapture [%s] %s:%d VCScreenCapture init failed rotationSession(%p) rotationBufferPool(%p) options(%p)", buf, 0x3Au);
        }
      }
      if (*v68)
        CVPixelBufferPoolRelease(*v68);
      if (*v67)
        VTImageRotationSessionRelease();
      v72 = (void *)*((_QWORD *)v14 + 18);
      if (v72)

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCScreenCapture initWithCaptureServer:protocolFunctions:sourceConfig:].cold.1();
      }

      return 0;
    }
  }
  return (VCScreenCapture *)v14;
}

- (void)dealloc
{
  OpaqueVTPixelRotationSession *rotationSession;
  OpaqueVTPixelTransferSession *resizeBufferPool;
  __CVPixelBufferPool *v5;
  opaqueCMSampleBuffer *blackFrame;
  opaqueCMSampleBuffer *previousCompleteFrame;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[VCScreenCapture stop:](self, "stop:", 1);
  rotationSession = self->_rotationSession;
  if (rotationSession)
    CVPixelBufferPoolRelease(rotationSession);
  if (self->_resizeTransferSession)
    VTImageRotationSessionRelease();
  resizeBufferPool = self->_resizeBufferPool;
  if (resizeBufferPool)
  {
    VTPixelTransferSessionInvalidate(resizeBufferPool);
    v5 = self->_resizeBufferPool;
    if (v5)
    {
      CFRelease(v5);
      self->_resizeBufferPool = 0;
    }
  }
  CVPixelBufferPoolRelease(*(CVPixelBufferPoolRef *)&self->_shouldClearScreen);
  blackFrame = self->_blackFrame;
  if (blackFrame)
    CFRelease(blackFrame);
  previousCompleteFrame = self->_previousCompleteFrame;
  if (previousCompleteFrame)
    CFRelease(previousCompleteFrame);
  pthread_mutex_destroy(&self->_clearScreenLock);
  pthread_cond_destroy(&self->_clearScreenChanged);
  pthread_mutex_destroy(&self->_screenCaptureLock);

  v8.receiver = self;
  v8.super_class = (Class)VCScreenCapture;
  -[VCVideoCapture dealloc](&v8, sel_dealloc);
}

- (int)_startCapture
{
  _opaque_pthread_mutex_t *p_screenCaptureLock;
  opaqueCMSampleBuffer *blackFrame;
  opaqueCMSampleBuffer *previousCompleteFrame;
  __objc2_class **v6;
  VCScreenCaptureSource *v7;
  int v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  p_screenCaptureLock = &self->_screenCaptureLock;
  pthread_mutex_lock(&self->_screenCaptureLock);
  blackFrame = self->_blackFrame;
  if (blackFrame)
  {
    CFRelease(blackFrame);
    self->_blackFrame = 0;
  }
  previousCompleteFrame = self->_previousCompleteFrame;
  if (previousCompleteFrame)
  {
    CFRelease(previousCompleteFrame);
    self->_previousCompleteFrame = 0;
  }
  v10[0] = self;
  v10[1] = _VCScreenCapture_handleFrame;
  v6 = off_1E9E4D658;
  if ((VCFeatureFlagManager_UseAvconferencedOniOSSpecficFeatures(-[VCScreenCapture startClearScreenProc](self, "startClearScreenProc")) & 1) == 0
    && !+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("useScreenCaptureController"), 0))
  {
    v6 = off_1E9E4D660;
  }
  v7 = (VCScreenCaptureSource *)objc_msgSend(objc_alloc(*v6), "initWithDelegate:screenCaptureSourceContext:", self, v10);
  self->_screenCapture = v7;
  if (!v7)
  {
    v8 = -2146893820;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCScreenCapture _startCapture].cold.1();
    }
    goto LABEL_18;
  }
  v8 = -[VCScreenCaptureSource startScreenCaptureWithConfig:](v7, "startScreenCaptureWithConfig:", self->_options);
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[VCScreenCapture _startCapture].cold.2();
      if ((v8 & 0x80000000) == 0)
        goto LABEL_11;
    }
    else if ((v8 & 0x80000000) == 0)
    {
      goto LABEL_11;
    }
LABEL_18:
    -[VCScreenCapture stopClearScreenProc](self, "stopClearScreenProc");
    goto LABEL_11;
  }
  self->_isCapturing = 1;
  self->_isPreviewing = 1;
LABEL_11:
  pthread_mutex_unlock(p_screenCaptureLock);
  return v8;
}

- (int)stopScreenCapture
{
  return -[VCScreenCapture stop:](self, "stop:", 1);
}

- (int)stop:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  opaqueCMSampleBuffer *blackFrame;
  opaqueCMSampleBuffer *previousCompleteFrame;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v5;
      v12 = 2080;
      v13 = "-[VCScreenCapture stop:]";
      v14 = 1024;
      v15 = 911;
      v16 = 1024;
      v17 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCScreenCapture [%s] %s:%d shouldClosePreview=%d", (uint8_t *)&v10, 0x22u);
    }
  }
  pthread_mutex_lock(&self->_screenCaptureLock);
  -[VCScreenCaptureSource stopScreenCapture](self->_screenCapture, "stopScreenCapture");
  -[VCScreenCaptureSource finalize](self->_screenCapture, "finalize");

  self->_screenCapture = 0;
  -[VCScreenCapture stopClearScreenProc](self, "stopClearScreenProc");
  blackFrame = self->_blackFrame;
  if (blackFrame)
  {
    CFRelease(blackFrame);
    self->_blackFrame = 0;
  }
  previousCompleteFrame = self->_previousCompleteFrame;
  if (previousCompleteFrame)
  {
    CFRelease(previousCompleteFrame);
    self->_previousCompleteFrame = 0;
  }
  pthread_mutex_unlock(&self->_screenCaptureLock);
  return 0;
}

- (int)updateScreenCapture:(id)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCScreenCapture *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((VCScreenCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315650;
        v14 = v5;
        v15 = 2080;
        v16 = "-[VCScreenCapture updateScreenCapture:]";
        v17 = 1024;
        v18 = 927;
        v7 = "VCScreenCapture [%s] %s:%d Update is not supported";
        v8 = v6;
        v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCScreenCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316162;
        v14 = v10;
        v15 = 2080;
        v16 = "-[VCScreenCapture updateScreenCapture:]";
        v17 = 1024;
        v18 = 927;
        v19 = 2112;
        v20 = v4;
        v21 = 2048;
        v22 = self;
        v7 = "VCScreenCapture [%s] %s:%d %@(%p) Update is not supported";
        v8 = v11;
        v9 = 48;
        goto LABEL_11;
      }
    }
  }
  return 0;
}

- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  return 0;
}

- (int)copyColorInfo:(const __CFDictionary *)a3
{
  return 0;
}

- (void)setPauseCapture:(BOOL)a3
{
  VCScreenCaptureSource *screenCapture;

  screenCapture = self->_screenCapture;
  if (screenCapture)
  {
    -[VCScreenCaptureSource pauseScreenCapture:](screenCapture, "pauseScreenCapture:");
    self->_capturePaused = a3;
  }
}

- (BOOL)isPreviewRunning
{
  return self->_isPreviewing;
}

- (void)startClearScreenProc
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCScreenCapture [%s] %s:%d Failed to create clearScreenProc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopClearScreenProc
{
  _opaque_pthread_mutex_t *p_clearScreenLock;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = self;
  p_clearScreenLock = &self->_clearScreenLock;
  pthread_mutex_lock(&self->_clearScreenLock);
  if (self->_clearScreenProc && self->_isClearScreenThreadRunning)
  {
    self->_isClearScreenThreadRunning = 0;
    BYTE4(self->_previousFrameTime.epoch) = 0;
    if ((VCScreenCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_14;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_DWORD *)buf = 136315650;
      v22 = v5;
      v23 = 2080;
      v24 = "-[VCScreenCapture stopClearScreenProc]";
      v25 = 1024;
      v26 = 966;
      v7 = "VCScreenCapture [%s] %s:%d Signal condition clearScreenChanged";
      v8 = v6;
      v9 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)-[VCScreenCapture performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_14;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_DWORD *)buf = 136316162;
      v22 = v10;
      v23 = 2080;
      v24 = "-[VCScreenCapture stopClearScreenProc]";
      v25 = 1024;
      v26 = 966;
      v27 = 2112;
      v28 = v4;
      v29 = 2048;
      v30 = self;
      v7 = "VCScreenCapture [%s] %s:%d %@(%p) Signal condition clearScreenChanged";
      v8 = v11;
      v9 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_14:
    pthread_cond_signal(&self->_clearScreenChanged);
  }
  pthread_mutex_unlock(p_clearScreenLock);
  pthread_join(self->_clearScreenProc, &v20);
  *((_QWORD *)v20 + 30) = 0;
  if ((void *)objc_opt_class() == v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = v13;
        v23 = 2080;
        v24 = "-[VCScreenCapture stopClearScreenProc]";
        v25 = 1024;
        v26 = 972;
        v15 = "VCScreenCapture [%s] %s:%d Stopped clearScreenProc";
        v16 = v14;
        v17 = 28;
LABEL_25:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)objc_msgSend(v20, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v22 = v18;
        v23 = 2080;
        v24 = "-[VCScreenCapture stopClearScreenProc]";
        v25 = 1024;
        v26 = 972;
        v27 = 2112;
        v28 = v12;
        v29 = 2048;
        v30 = v20;
        v15 = "VCScreenCapture [%s] %s:%d %@(%p) Stopped clearScreenProc";
        v16 = v19;
        v17 = 48;
        goto LABEL_25;
      }
    }
  }
}

- (int)frameCount:(BOOL)a3
{
  unsigned int currentTransform;

  currentTransform = self->_currentTransform;
  if (a3)
    self->_currentTransform = 0;
  return currentTransform;
}

- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3
{
  return -2146893808;
}

- (int)setFrameRate:(int)a3
{
  uint64_t v3;
  _opaque_pthread_mutex_t *p_screenCaptureLock;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int captureFramerate;
  uint64_t v16;
  uint64_t v17;
  VCScreenCaptureSource *screenCapture;
  int v19;
  _BYTE v21[24];
  __int128 v22;
  VCScreenCapture *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  p_screenCaptureLock = &self->_screenCaptureLock;
  pthread_mutex_lock(&self->_screenCaptureLock);
  if ((VCScreenCapture *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCScreenCapture performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    captureFramerate = self->_captureFramerate;
    *(_DWORD *)v21 = 136316674;
    *(_QWORD *)&v21[4] = v13;
    *(_WORD *)&v21[12] = 2080;
    *(_QWORD *)&v21[14] = "-[VCScreenCapture setFrameRate:]";
    *(_WORD *)&v21[22] = 1024;
    LODWORD(v22) = 991;
    WORD2(v22) = 2112;
    *(_QWORD *)((char *)&v22 + 6) = v6;
    HIWORD(v22) = 2048;
    v23 = self;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = captureFramerate;
    HIWORD(v24) = 1024;
    LODWORD(v25) = v3;
    v10 = "VCScreenCapture [%s] %s:%d %@(%p) Changing currentFrameRate= %d to newFrameRate=%d";
    v11 = v14;
    v12 = 60;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_captureFramerate;
      *(_DWORD *)v21 = 136316162;
      *(_QWORD *)&v21[4] = v7;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCScreenCapture setFrameRate:]";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 991;
      WORD2(v22) = 1024;
      *(_DWORD *)((char *)&v22 + 6) = v9;
      WORD5(v22) = 1024;
      HIDWORD(v22) = v3;
      v10 = "VCScreenCapture [%s] %s:%d Changing currentFrameRate= %d to newFrameRate=%d";
      v11 = v8;
      v12 = 40;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v21, v12);
    }
  }
LABEL_12:
  self->_captureFramerate = v3;
  v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23, v24, v25);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_options, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CC6538]);
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_options, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CC66E0]);
  screenCapture = self->_screenCapture;
  if (screenCapture && (self->_isCapturing || !self->_capturePaused))
  {
    -[VCScreenCaptureSource stopScreenCapture](screenCapture, "stopScreenCapture");
    v19 = -[VCScreenCaptureSource startScreenCaptureWithConfig:](self->_screenCapture, "startScreenCaptureWithConfig:", self->_options);
    if (v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCScreenCapture setFrameRate:].cold.1();
      }
    }
  }
  else
  {
    v19 = 0;
  }
  pthread_mutex_unlock(p_screenCaptureLock);
  return v19;
}

- (int)getFrameRate
{
  return self->_captureFramerate;
}

- (BOOL)isFrontCamera
{
  return 1;
}

- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4
{
  return 0;
}

- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5
{
  return -2146893808;
}

- (BOOL)isPortraitResolutionCaptureActive
{
  return 0;
}

- (void)screenCaptureSourceShouldClearScreen:(BOOL)a3
{
  _VCScreenCapture_UpdateShouldClearScreen((uint64_t)self, a3);
}

- (void)screenCaptureSourceProcessEventString:(id)a3
{
  -[VCVideoCaptureServer handleCaptureEvent:](-[VCVideoCapture captureServer](self, "captureServer"), "handleCaptureEvent:", a3);
}

- (BOOL)isClearScreenThreadRunning
{
  return self->_isClearScreenThreadRunning;
}

- (void)initWithCaptureServer:protocolFunctions:sourceConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCScreenCapture [%s] %s:%d VCScreenCapture init failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_startCapture
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCScreenCapture [%s] %s:%d Screen Capture start failed error=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setFrameRate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCScreenCapture [%s] %s:%d Screen Capture start failed error=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
