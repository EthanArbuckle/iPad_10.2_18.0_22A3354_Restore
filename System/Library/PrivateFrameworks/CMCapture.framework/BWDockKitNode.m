@implementation BWDockKitNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFString *clientApplicationID;
  SEL v8;
  char v9;
  DKTrackingAgent *agent;
  DKNotificationAgent *dockingNotificationAgent;
  DKTrackingAgent *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  double v17;
  uint64_t v18;
  double v19;
  void *v20;
  _BOOL4 v26;
  void *v27;
  size_t Width;
  double Height;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  DKTrackingAgent *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  __CVBuffer *pixelBuffer;
  double v70;
  CGAffineTransform v71;
  CGAffineTransform t1;
  CGAffineTransform t2;
  os_log_type_t type[8];
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[5];
  _QWORD v83[5];
  const __CFString *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  CGAffineTransform v90;
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[2];
  _QWORD v95[2];
  CGAffineTransform location[2];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  if (!DockKitCoreLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)&location[0].a = xmmword_1E4925B80;
    location[0].c = 0.0;
    DockKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!DockKitCoreLibraryCore_frameworkLibrary || !getDKTrackingAgentClass())
    goto LABEL_73;
  if (!self->_agent)
  {
    if (self->_isRunningForContinuityCapture)
    {
      if (dword_1EE6BE658)
      {
        LODWORD(t1.a) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      clientApplicationID = CFSTR("continuitycapture");
    }
    else
    {
      clientApplicationID = (const __CFString *)self->_clientApplicationID;
    }
    self->_agent = (DKTrackingAgent *)objc_alloc((Class)getDKTrackingAgentClass());
    v8 = NSSelectorFromString(CFSTR("initWithConfiguration:"));
    v9 = objc_opt_respondsToSelector();
    agent = self->_agent;
    if ((v9 & 1) != 0)
    {
      v95[0] = clientApplicationID;
      v94[0] = CFSTR("appID");
      v94[1] = CFSTR("customInferenceEnabled");
      v95[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_customInferenceEnabled);
      -[DKTrackingAgent performSelector:withObject:](agent, "performSelector:withObject:", v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2));
    }
    else
    {
      -[DKTrackingAgent initWithClientApplicationID:](agent, "initWithClientApplicationID:", clientApplicationID);
    }
    -[BWDeviceOrientationMonitor start](self->_deviceOrientationMonitor, "start", v65, v66);
  }
  if (objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider)
    && !self->_dockingNotificationAgent
    && getDKNotificationAgentClass())
  {
    self->_dockingNotificationAgent = (DKNotificationAgent *)objc_msgSend(objc_alloc((Class)getDKNotificationAgentClass()), "init");
    objc_initWeak((id *)location, self);
    dockingNotificationAgent = self->_dockingNotificationAgent;
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __45__BWDockKitNode_renderSampleBuffer_forInput___block_invoke;
    v80[3] = &unk_1E4925B60;
    objc_copyWeak(&v81, (id *)location);
    -[DKNotificationAgent registerNotifications:](dockingNotificationAgent, "registerNotifications:", v80);
    if (-[DKNotificationAgent isTracking](self->_dockingNotificationAgent, "isTracking"))
      objc_msgSend(objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider), "setFocusDetectionProviderEnabled:", 1);
    objc_destroyWeak(&v81);
    objc_destroyWeak((id *)location);
  }
  v12 = self->_agent;
  if (!v12 || !-[DKTrackingAgent tracking](v12, "tracking"))
    goto LABEL_73;
  if (-[BWGraph memoryAnalyticsReportingEnabled](-[BWNode graph](self, "graph"), "memoryAnalyticsReportingEnabled"))
    -[BWMemoryAnalyticsPayload setDockKitDeviceConnected:](-[BWGraph memoryAnalyticsPayload](-[BWNode graph](self, "graph"), "memoryAnalyticsPayload"), "setDockKitDeviceConnected:", 1);
  pixelBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!pixelBuffer)
    goto LABEL_73;
  v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v13)
    goto LABEL_73;
  v78 = 0u;
  v79 = 0u;
  v77 = 0u;
  v14 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA2638], 0);
  v15 = v14;
  if (!v14 || objc_msgSend(v14, "length") != 48)
    goto LABEL_73;
  objc_msgSend(v15, "getBytes:length:", &v77, objc_msgSend(v15, "length"));
  v16 = v77;
  v68 = DWORD1(v78);
  v70 = *(double *)&v79;
  v92[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v79), v77)));
  v92[1] = &unk_1E49FB730;
  v92[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
  v93[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
  v91[0] = &unk_1E49FB730;
  LODWORD(v17) = v68;
  v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  HIDWORD(v19) = HIDWORD(v70);
  v91[1] = v18;
  LODWORD(v19) = HIDWORD(v70);
  v91[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v93[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
  v93[2] = &unk_1E4A01880;
  v67 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 3);
  v20 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
  if (v20)
  {
    *(_QWORD *)type = 0;
    v75 = 0;
    __asm { FMOV            V0.2D, #1.0 }
    v76 = _Q0;
    FigCFDictionaryGetCGRectIfPresent();
    v26 = *((double *)&v76 + 1) != 1.0 || *(double *)&v76 != 1.0;
    v27 = (id)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v20, 1uLL);
    if (v26)
    {
      Width = CVPixelBufferGetWidth(pixelBuffer);
      Height = (double)CVPixelBufferGetHeight(pixelBuffer);
      v30 = v76;
      memset(location, 0, 48);
      CGAffineTransformMakeTranslation(location, -0.0, -0.0);
      CGAffineTransformMakeScale(&t2, *(CGFloat *)&v76, *((CGFloat *)&v76 + 1));
      t1 = location[0];
      CGAffineTransformConcat(&v90, &t1, &t2);
      location[0] = v90;
      FigCaptureMakeMirrorAndRotateVideoTransform((int)(*(double *)&v30 * (double)Width + -1.0), (int)(*((double *)&v30 + 1) * Height + -1.0), 0, 0, (uint64_t)&v71);
      t1 = location[0];
      CGAffineTransformConcat(&v90, &t1, &v71);
      location[0] = v90;
      v31 = *(_OWORD *)&v90.a;
      v32 = *(_OWORD *)&v90.c;
      v33 = *(_OWORD *)&v90.tx;
      v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(HIDWORD(v90.c), v16)));
      v35 = *(double *)&v33 + *(double *)&v32 * *((float *)&v70 + 1) + *(double *)&v31 * *(float *)&v70;
      *(float *)&v35 = v35;
      v88[0] = v34;
      v88[1] = &unk_1E49FB730;
      v88[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
      v89[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
      v87[0] = &unk_1E49FB730;
      LODWORD(v36) = v68;
      v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
      v38 = *((double *)&v33 + 1)
          + *((double *)&v32 + 1) * *((float *)&v70 + 1)
          + *((double *)&v31 + 1) * *(float *)&v70;
      *(float *)&v38 = v38;
      v87[1] = v37;
      v87[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
      v89[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
      v89[2] = &unk_1E4A01898;
      v67 = (void *)objc_msgSend(v67, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 3));
    }
    if (objc_msgSend(v27, "count"))
    {
      v39 = (void *)objc_msgSend(v27, "objectForKey:", CFSTR("HumanBodies"));
      v40 = (void *)objc_msgSend(v27, "objectForKey:", CFSTR("HumanFaces"));
      if (objc_msgSend(v39, "count"))
      {
        v41 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("ObjectsArray"));
        if (!objc_msgSend(v41, "count"))
          v41 = 0;
      }
      else
      {
        v41 = 0;
      }
      if (objc_msgSend(v40, "count"))
      {
        v20 = (void *)objc_msgSend(v40, "objectForKey:", CFSTR("ObjectsArray"));
        if (!objc_msgSend(v20, "count"))
          v20 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      v41 = 0;
    }
    v20 = 0;
  }
  else
  {
    v41 = 0;
  }
LABEL_48:
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v42 = objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (objc_msgSend(v20, "count") || objc_msgSend(v41, "count"))
  {
    if (objc_msgSend(v20, "count"))
      v43 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v20);
    else
      v43 = (void *)MEMORY[0x1E0C9AA60];
    if (objc_msgSend(v41, "count"))
      v43 = (void *)objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v41);
    v44 = 1;
  }
  else
  {
    -[NSDate timeIntervalSinceNow](self->start, "timeIntervalSinceNow");
    v44 = fabs(v64) >= self->minFrameDuration + self->minFrameDuration;
    v43 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (self->_cinematicVideoEnabled
    && objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider)
    && objc_msgSend(objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider), "focusDetectionProviderEnabled"))
  {
    v45 = (void *)objc_msgSend(objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider), "copyCinematicVideoFocusDetections");
    v46 = (void *)objc_msgSend(v45, "firstObject");
    v47 = v46;
    if (v46)
    {
      v48 = objc_msgSend(v46, "identifier");
      objc_msgSend(v47, "rect");
      v50 = v49;
      v52 = v51;
      v54 = v53;
      v56 = v55;
      v84 = CFSTR("cinematography_selected");
      v82[0] = CFSTR("identifier");
      v83[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v48);
      v82[1] = CFSTR("X");
      v83[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
      v82[2] = CFSTR("Y");
      v83[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
      v82[3] = CFSTR("Width");
      v83[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54);
      v82[4] = CFSTR("Height");
      v83[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
      v85 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 5);
      v86 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
      v43 = (void *)objc_msgSend(v43, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1));
    }

  }
  if (v44)
  {
    v57 = (void *)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVImageBuffer:", pixelBuffer);
    v58 = v57;
    if (!v57)
      goto LABEL_73;
    v59 = self->_agent;
    objc_msgSend(v57, "extent");
    -[DKTrackingAgent trackWithMetadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:](v59, "trackWithMetadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:", v43, v58, v42, v67, -[BWDeviceOrientationMonitor mostRecentPortraitLandscapeOrientation](self->_deviceOrientationMonitor, "mostRecentPortraitLandscapeOrientation"), &__block_literal_global_100, v60, v61);
    self->start = (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v62 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[DKTrackingAgent getSelectedFaceIds](self->_agent, "getSelectedFaceIds"));
  v63 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[DKTrackingAgent getSelectedBodyIds](self->_agent, "getSelectedBodyIds"));
  if (objc_msgSend(v62, "count"))
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C50], v62, 1u);
  if (objc_msgSend(v63, "count"))
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C48], v63, 1u);
LABEL_73:
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, a4);
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWDockKitNode)initWithIsRunningForContinuityCapture:(BOOL)a3 cinematicVideoEnabled:(BOOL)a4
{
  BWDockKitNode *v6;
  BWNodeInput *v7;
  BWVideoFormatRequirements *v8;
  BWNodeOutput *v9;
  BWVideoFormatRequirements *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWDockKitNode;
  v6 = -[BWNode init](&v12, sel_init);
  if (v6)
  {
    v7 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v6);
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v7, "setFormatRequirements:", v8);

    -[BWNodeInput setPassthroughMode:](v7, "setPassthroughMode:", 1);
    -[BWNode addInput:](v6, "addInput:", v7);

    v9 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
    v10 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v9, "setFormatRequirements:", v10);

    -[BWNodeOutput setPassthroughMode:](v9, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v6, "addOutput:", v9);

    v6->_deviceOrientationMonitor = objc_alloc_init(BWDeviceOrientationMonitor);
    v6->start = (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6->minFrameDuration = 0.0333333333;
    v6->_isRunningForContinuityCapture = a3;
    v6->_cinematicVideoEnabled = a4;
    v6->_dockingNotificationAgent = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BWDeviceOrientationMonitor stop](self->_deviceOrientationMonitor, "stop");
  -[DKTrackingAgent stop](self->_agent, "stop");

  -[DKNotificationAgent deregisterNotifications](self->_dockingNotificationAgent, "deregisterNotifications");
  v3.receiver = self;
  v3.super_class = (Class)BWDockKitNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("CinematicFraming");
}

uint64_t __45__BWDockKitNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "cinematicVideoFocusDetectionsProvider"), "setFocusDetectionProviderEnabled:", a2);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", a3, a4);
}

- (BWCinematicVideoFocusDetectionProvider)cinematicVideoFocusDetectionsProvider
{
  return (BWCinematicVideoFocusDetectionProvider *)objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider);
}

- (void)setCinematicVideoFocusDetectionsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_cinematicVideoFocusDetectionsProvider, a3);
}

- (BOOL)customInferenceEnabled
{
  return self->_customInferenceEnabled;
}

- (void)setCustomInferenceEnabled:(BOOL)a3
{
  self->_customInferenceEnabled = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cinematicVideoFocusDetectionsProvider);
}

@end
