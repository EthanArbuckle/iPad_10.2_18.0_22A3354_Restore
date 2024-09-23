@implementation BWRemoteQueueSinkNode

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef v6;
  __CVBuffer *ImageBuffer;
  BOOL v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  __IOSurface *IOSurface;
  _BOOL4 v14;
  int64_t totalNumberOfFrames;
  const __CFString *v16;
  const __CFDictionary *v17;
  uint64_t v18;
  const __CFString *v19;
  CFTypeRef v20;
  id v21;
  id v22;
  id ClientSpecifiedMetadataForPanorama;
  const void *v24;
  const __CFString *v25;
  CFTypeRef v26;
  id v27;
  id v28;
  void *v29;
  BWSceneStabilityMonitor *stabilityMonitor;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const void *v35;
  CFDictionaryRef v36;
  CFDictionaryRef v37;
  CMCaptureFrameSenderService *frameSender;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  OpaqueCMClock *HostTimeClock;
  _BOOL4 cameraSupportsFlash;
  char attachDetectedObjectsInfo;
  _BOOL4 disableFlatDictionaryVDOMetadata;
  char v46;
  void *v47;
  void *v48;
  OpaqueFigFlatDictionaryKeySpec **p_makerNoteKeySpec;
  _BOOL4 IsExtensionDeviceType;
  int v51;
  __CFDictionary *MetadataAttachments;
  const void *MakerNoteFlatDictionary;
  __CFDictionary *Mutable;
  void *FormatDescription;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v58;
  const opaqueCMFormatDescription *v59;
  unint64_t Dimensions;
  FourCharCode MediaSubType;
  CVImageBufferRef v62;
  CVImageBufferRef v63;
  int v64;
  uint64_t v65;
  __CVBuffer *v66;
  CFDictionaryRef v67;
  CFDictionaryRef v68;
  _BOOL8 IsHDR;
  CMTime *v70;
  uint64_t v71;
  unsigned int receiverPID;
  __CFAllocator *sharedMemoryPoolCFAllocator;
  _BOOL4 v74;
  void *v75;
  __CVBuffer *v76;
  CFTypeRef v77;
  CMTime rhs;
  CMTime v79;
  CMTime v80;
  CMTime v81;
  CMTime time[5];
  CMTime v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA2660], 0);
  memset(&v81, 0, sizeof(v81));
  CMSampleBufferGetPresentationTimeStamp(&v81, a3);
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CVPixelBufferGetPixelFormatType(ImageBuffer);
  v8 = self->_mediaTypeIsVideo && v6 == 0;
  if (v8 && (v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    BWActiveDeviceTypeFromPortType(v10);
  }
  else
  {
    v10 = 0;
  }
  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time[0] = v81;
    CMTimeGetSeconds(time);
    IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  if (self->_remoteQueueSender || self->_localQueue)
  {
    if (!self->_mediaTypeIsVideo || v6 != 0)
    {
      v14 = 0;
      if (v6)
        goto LABEL_81;
      goto LABEL_77;
    }
    totalNumberOfFrames = self->_totalNumberOfFrames;
    v74 = totalNumberOfFrames == 0;
    self->_totalNumberOfFrames = totalNumberOfFrames + 1;
    if (v10)
      -[BWVideoDataOutputAnalyticsPayload setDeviceMask:](self->_analyticsPayload, "setDeviceMask:", -[BWVideoDataOutputAnalyticsPayload deviceMask](self->_analyticsPayload, "deviceMask") | BWActiveDeviceTypeFromPortType(v10));
    v16 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v17 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v75 = v10;
    if (v17)
    {
      time[0].value = 0;
      v18 = *MEMORY[0x1E0D06CF8];
      if (CFDictionaryGetValueIfPresent(v17, (const void *)*MEMORY[0x1E0D06CF8], (const void **)time))
      {
        v19 = (const __CFString *)*MEMORY[0x1E0D05C18];
        v20 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C18], 0);
        if (v20)
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v20);
        else
          v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v22 = v21;
        objc_msgSend(v22, "setObject:forKeyedSubscript:", time[0].value, v18);
        CMSetAttachment(a3, v19, v22, 1u);
      }
    }
    if (self->_removeCameraIntrinsicMatrixAttachment)
      CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA2638]);
    if (self->_attachPanoramaMetadata)
    {
      ClientSpecifiedMetadataForPanorama = FigCaptureMetadataUtilitiesCreateClientSpecifiedMetadataForPanorama(a3, self->_panoramaRequiresLTMLocking);
      if (ClientSpecifiedMetadataForPanorama)
      {
        v24 = ClientSpecifiedMetadataForPanorama;
        v25 = (const __CFString *)*MEMORY[0x1E0D05C18];
        v26 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C18], 0);
        if (v26)
          v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v26);
        else
          v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v28 = v27;
        objc_msgSend(v28, "addEntriesFromDictionary:", v24);
        CMSetAttachment(a3, v25, v28, 1u);
        CFRelease(v24);
      }
    }
    v76 = ImageBuffer;
    v77 = v6;
    if (ImageBuffer)
    {
      if (self->_stabilityMonitor)
      {
        v29 = (void *)CMGetAttachment(a3, v16, 0);
        objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D06798]);
        stabilityMonitor = self->_stabilityMonitor;
        CMSampleBufferGetPresentationTimeStamp(&v80, a3);
        -[BWSceneStabilityMonitor calculateStabilityWithPixelBuffer:pts:metadataDictionary:forceSceneMotion:](stabilityMonitor, "calculateStabilityWithPixelBuffer:pts:metadataDictionary:forceSceneMotion:", ImageBuffer, &v80, v29, 0);
        v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BWSceneStabilityMonitor isStable](self->_stabilityMonitor, "isStable"));
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D05D78]);
        v33 = (void *)MEMORY[0x1E0CB37E8];
        -[BWSceneStabilityMonitor stabilityMetric](self->_stabilityMonitor, "stabilityMetric");
        v34 = objc_msgSend(v33, "numberWithFloat:");
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D05D70]);
      }
      else
      {
        v31 = 0;
      }
      if (self->_requestedBufferAttachmentsTrie)
      {
        v36 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, 1u);
        if (v36)
        {
          v37 = v36;
          if (!v31)
            v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          -[FigCaptureTrie extractFrom:writeInto:assumeMutable:overwrite:](self->_requestedBufferAttachmentsTrie, "extractFrom:writeInto:assumeMutable:overwrite:", v37, v31, 0, 0);

        }
      }
      if (self->_frameSenderSupportEnabled)
      {
        frameSender = self->_frameSender;
        if (!frameSender)
        {
          v39 = getpid();
          receiverPID = self->_receiverPID;
          v40 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_receiverAuditToken, 32);
          if (self->_receiverPID == (_DWORD)v39)
          {
            v39 = 0;
            v41 = 0;
          }
          else
          {
            memset(time, 0, 32);
            v41 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", time, 32, FigCaptureGetCurrentProcessAuditToken(time));
          }
          frameSender = -[CMCaptureFrameSenderService initWithEndpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:]([CMCaptureFrameSenderService alloc], "initWithEndpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:", CFSTR("VideoDataOutput"), receiverPID, v39, v40, v41, CFSTR("unknown"));
          self->_frameSender = frameSender;
        }
        -[CMCaptureFrameSenderService sendFrame:](frameSender, "sendFrame:", a3);
      }
      memset(&v83, 0, sizeof(v83));
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&v83, HostTimeClock);
      if (*v11 == 1)
      {
        time[0] = v81;
        CMTimeGetSeconds(time);
        time[0] = v83;
        rhs = v81;
        CMTimeSubtract(&v79, time, &rhs);
        time[0] = v79;
        CMTimeGetSeconds(time);
        kdebug_trace();
      }
      v35 = v31;
    }
    else
    {
      v35 = 0;
    }
    sharedMemoryPoolCFAllocator = self->_sharedMemoryPoolCFAllocator;
    cameraSupportsFlash = self->_cameraSupportsFlash;
    attachDetectedObjectsInfo = self->_attachDetectedObjectsInfo;
    disableFlatDictionaryVDOMetadata = self->_disableFlatDictionaryVDOMetadata;
    v46 = -[BWGraph clientExpectsCameraMountedInLandscapeOrientation](-[BWNode graph](self, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
    v47 = (void *)CMGetAttachment(a3, v16, 0);
    if (!v47)
    {
      v10 = v75;
      ImageBuffer = v76;
      v14 = v74;
      v6 = v77;
LABEL_77:
      if (!self->_cachedFormatDescription)
      {
        FormatDescription = CMSampleBufferGetFormatDescription(a3);
        if (FormatDescription)
          FormatDescription = (void *)CFRetain(FormatDescription);
        self->_cachedFormatDescription = (opaqueCMFormatDescription *)FormatDescription;
      }
LABEL_81:
      BWSampleBufferRemoveAllAttachedMedia(a3);
      BWNodeSanitizeMetadataIfNecessary(a3);
      if (self->_remoteQueueSender)
      {
        if (-[BWRemoteQueueSinkNode _finishRenderingSampleBufferUsingTheRemoteCaptureStack:isDroppedSample:]((uint64_t)self, a3, v6 != 0))goto LABEL_83;
      }
      else if (self->_localQueue
             && -[BWRemoteQueueSinkNode _finishRenderingSampleBufferUsingTheLocalQueue:]((uint64_t)self, a3))
      {
LABEL_83:
        if (!v14)
          return;
LABEL_88:
        if (dword_1ECFE9750)
        {
          LODWORD(rhs.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          value = rhs.value;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT))
            v58 = value;
          else
            v58 = value & 0xFFFFFFFE;
          if (v58)
          {
            LODWORD(v83.value) = 136315394;
            *(CMTimeValue *)((char *)&v83.value + 4) = (CMTimeValue)"-[BWRemoteQueueSinkNode renderSampleBuffer:forInput:]";
            LOWORD(v83.flags) = 2114;
            *(_QWORD *)((char *)&v83.flags + 2) = self;
            LODWORD(v71) = 22;
            v70 = &v83;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        self->_firstPTS = ($95D729B680665BEAEFA1D6FCA8238556)v81;
        -[BWVideoDataOutputAnalyticsPayload setClientApplicationID:](self->_analyticsPayload, "setClientApplicationID:", self->_clientApplicationID, v70, v71);
        v59 = CMSampleBufferGetFormatDescription(a3);
        Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v59);
        MediaSubType = CMFormatDescriptionGetMediaSubType(v59);
        if (v10)
          -[BWVideoDataOutputAnalyticsPayload setDevicePosition:](self->_analyticsPayload, "setDevicePosition:", BWCaptureDevicePositionFromPortType(v10));
        -[BWVideoDataOutputAnalyticsPayload setHeight:](self->_analyticsPayload, "setHeight:", HIDWORD(Dimensions));
        -[BWVideoDataOutputAnalyticsPayload setWidth:](self->_analyticsPayload, "setWidth:", Dimensions);
        v62 = CMSampleBufferGetImageBuffer(a3);
        if (v62)
        {
          v63 = v62;
          v64 = objc_msgSend((id)CMGetAttachment(v62, CFSTR("MirroredHorizontal"), 0), "BOOLValue");
          v65 = v64 ^ objc_msgSend((id)CMGetAttachment(v63, CFSTR("MirroredVertical"), 0), "BOOLValue");
        }
        else
        {
          v65 = 0;
        }
        -[BWVideoDataOutputAnalyticsPayload setVideoMirrored:](self->_analyticsPayload, "setVideoMirrored:", v65);
        v66 = CMSampleBufferGetImageBuffer(a3);
        if (v66 && (v67 = CVBufferCopyAttachments(v66, kCVAttachmentMode_ShouldPropagate)) != 0)
        {
          v68 = v67;
          IsHDR = BWColorSpacePropertiesIsHDR(+[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:](BWVideoFormat, "colorSpacePropertiesForPixelBufferAttachments:", v67));
          CFRelease(v68);
        }
        else
        {
          IsHDR = 0;
        }
        -[BWVideoDataOutputAnalyticsPayload setHdrVideo:](self->_analyticsPayload, "setHdrVideo:", IsHDR);
        if (ImageBuffer)
          -[BWVideoDataOutputAnalyticsPayload setColorSpace:](self->_analyticsPayload, "setColorSpace:", BWPixelBufferColorSpace(ImageBuffer));
        self->_proresVideo = FigCapturePixelFormatIs422(MediaSubType);
        return;
      }
      self->_lastPTS = ($95D729B680665BEAEFA1D6FCA8238556)v81;
      if (!v14)
        return;
      goto LABEL_88;
    }
    v48 = v47;
    p_makerNoteKeySpec = &self->_makerNoteKeySpec;
    IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]), "integerValue"));
    if (FigCapturePlatformMountsCamerasInLandscapeOrientation())
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      if (FigCFEqual() || FigCFEqual())
      {
        if (IsExtensionDeviceType)
          v51 = 3;
        else
          v51 = 4;
      }
      else
      {
        v51 = 3;
      }
    }
    else
    {
      v51 = 1;
    }
    MetadataAttachments = FigCaptureMetadataUtilitiesCreateMetadataAttachments(a3, v51, 0, cameraSupportsFlash, 0, 0, 0, 0, attachDetectedObjectsInfo, disableFlatDictionaryVDOMetadata, 0, 1, 1, 1, v35, 0, 0, 0, 0,
                            v46);
    if (disableFlatDictionaryVDOMetadata)
      MakerNoteFlatDictionary = 0;
    else
      MakerNoteFlatDictionary = (const void *)FigCaptureMetadataUtilitiesCreateMakerNoteFlatDictionary(a3, (const __CFAllocator *)*MEMORY[0x1E0C9AE00], sharedMemoryPoolCFAllocator, (const void **)p_makerNoteKeySpec);
    v6 = v77;
    CMRemoveAllAttachments(a3);
    CMSetAttachments(a3, MetadataAttachments, 1u);
    if (MetadataAttachments)
      CFRelease(MetadataAttachments);
    if (disableFlatDictionaryVDOMetadata)
    {
      ImageBuffer = v76;
    }
    else
    {
      ImageBuffer = v76;
      if (MakerNoteFlatDictionary)
      {
        v10 = v75;
        if (*p_makerNoteKeySpec)
        {
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D08750], *p_makerNoteKeySpec);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D08748], MakerNoteFlatDictionary);
          CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CBCF70], Mutable, 1u);
          if (Mutable)
            CFRelease(Mutable);
          CFRelease(MakerNoteFlatDictionary);
        }
        goto LABEL_76;
      }
    }
    v10 = v75;
LABEL_76:
    v14 = v74;
    goto LABEL_77;
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  _BOOL4 v9;
  uint64_t v10;
  localQueueOpaque *localQueue;
  objc_super v12;
  unsigned int v13;
  int64_t v14;
  uint64_t v15;
  int v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (self->_remoteQueueSender)
  {
    v9 = 1;
    if (!a4)
      goto LABEL_13;
  }
  else
  {
    v9 = self->_localQueue != 0;
    if (!a4)
      goto LABEL_13;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (self->_remoteQueueSender)
        {
          v13 = 5;
          v15 = 0;
          v14 = 0;
          v16 = 0;
          v19 = 0;
          v17 = a3;
          v18 = objc_msgSend(a4, "formatDescription");
          if (FigRemoteOperationSenderEnqueueOperation(self->_remoteQueueSender, &v13) == -16665)
            -[BWRemoteQueueSinkNode _handlePeerTerminated]((uint64_t)self);
        }
        else if (self->_localQueue)
        {
          v10 = objc_msgSend(a4, "formatDescription");
          localQueue = self->_localQueue;
          v13 = 5;
          v14 = a3;
          v15 = v10;
          FigLocalQueueEnqueue((uint64_t)localQueue, &v13, 0);
        }
      }
    }
  }
LABEL_13:
  v12.receiver = self;
  v12.super_class = (Class)BWRemoteQueueSinkNode;
  -[BWSinkNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v12, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (uint64_t)_finishRenderingSampleBufferUsingTheRemoteCaptureStack:(int)a3 isDroppedSample:
{
  char v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const opaqueCMFormatDescription *FormatDescription;
  CMTime v11;
  CFTypeRef v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef cf;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  unsigned int v21[2];
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = a3;
  v23 = 0u;
  v22 = 0u;
  v21[0] = 6;
  v21[1] = a3 ^ 1;
  *(_QWORD *)&v23 = a2;
  v25[0] = *MEMORY[0x1E0D05CB0];
  v25[1] = CFSTR("ReactionEffectComplexity");
  v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v6 = FigRemoteOperationSenderEnqueueOperation(*(_QWORD **)(a1 + 176), v21);
  v7 = v6;
  if ((_DWORD)v6 == -16665)
  {
    -[BWRemoteQueueSinkNode _handlePeerTerminated](a1);
    return 4294950631;
  }
  else if ((_DWORD)v6 == -16669)
  {
    if ((v3 & 1) != 0 || !*(_BYTE *)(a1 + 236))
    {
      return 4294950627;
    }
    else
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v8 = *(_QWORD *)(a1 + 176);
      v20 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __96__BWRemoteQueueSinkNode__finishRenderingSampleBufferUsingTheRemoteCaptureStack_isDroppedSample___block_invoke;
      v16[3] = &unk_1E4927D88;
      v16[4] = &v17;
      FigRemoteOperationSenderResetWithApplier(v8, (uint64_t)v16);
      if (*((_BYTE *)v18 + 24))
      {
        cf = 0;
        FormatDescription = CMSampleBufferGetFormatDescription(a2);
        v11 = *(CMTime *)(a1 + 264);
        BWSampleBufferCreateForDroppedFrame(&v11, FormatDescription, CFSTR("LateFrame"), &cf);
        LODWORD(v11.value) = 3;
        memset((char *)&v11.value + 4, 0, 20);
        v13 = 0;
        v14 = 0;
        v12 = cf;
        FigRemoteOperationSenderEnqueueOperation(*(_QWORD **)(a1 + 176), (unsigned int *)&v11);
        if (cf)
          CFRelease(cf);
      }
      v7 = FigRemoteOperationSenderEnqueueOperation(*(_QWORD **)(a1 + 176), v21);
      if ((_DWORD)v7)
        FigDebugAssert3();
      _Block_object_dispose(&v17, 8);
    }
  }
  return v7;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  void **p_sharedMemoryPool;
  __int128 v4;
  unsigned int v5;
  const __CFAllocator *v6;
  objc_super v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)BWRemoteQueueSinkNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v7, sel_prepareForCurrentConfigurationToBecomeLive);
  if (self->_clientIsRunningInMediaserverd)
  {
    self->_numberOfMediaBuffersLocallyEnqueued = 0;
    self->_numberOfMediaBuffersLocallyDequeued = 0;
    if (!self->_localQueue)
    {
      if (!FigLocalQueueCreate(*MEMORY[0x1E0C9AE00], 14, &self->_localQueue))
      {
        -[BWRemoteQueueSinkNodeDelegate remoteQueueSinkNode:localQueueBecameReady:](self->_delegate, "remoteQueueSinkNode:localQueueBecameReady:", self, self->_localQueue);
        return;
      }
      goto LABEL_15;
    }
  }
  else if (!self->_remoteQueueSender)
  {
    p_sharedMemoryPool = (void **)&self->_sharedMemoryPool;
    if (!self->_sharedMemoryPool)
    {
      v4 = *(_OWORD *)&self->_receiverAuditToken.val[4];
      v8[0] = *(_OWORD *)self->_receiverAuditToken.val;
      v8[1] = v4;
      if (!FigCaptureAuditTokenIsValid((uint64_t)v8))
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("RemoteQueueSinkNode needs to have a valid client token before prepareForCurrentConfigurationToBecomeLive can be called"), 0));
      if (self->_discardsLateSampleBuffers)
        v5 = 1;
      else
        v5 = 100;
      LODWORD(v8[0]) = 100;
      *(_QWORD *)((char *)v8 + 4) = v5;
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (FigSharedMemPoolCreate(*MEMORY[0x1E0C9AE00], 0x80000uLL, 0, 0, (uint64_t *)&self->_sharedMemoryPool)|| (self->_sharedMemoryPoolCFAllocator = FigSharedMemPoolAllocatorCreate(v6, *p_sharedMemoryPool), FigRemoteQueueSenderCreate(v6, self->_receiverPID, *p_sharedMemoryPool, (int *)v8, 3uLL, 14, (uint64_t *)&self->_remoteQueueSender)))
      {
LABEL_15:
        FigDebugAssert3();
        return;
      }
      -[BWRemoteQueueSinkNodeDelegate remoteQueueSinkNode:queueBecameReady:](self->_delegate, "remoteQueueSinkNode:queueBecameReady:", self, self->_remoteQueueSender);
    }
  }
}

- (BWRemoteQueueSinkNode)initWithMediaType:(unsigned int)a3 clientAuditToken:(id *)a4 sinkID:(id)a5
{
  uint64_t v6;
  char *v7;
  BWNodeInput *v8;
  __int128 *v9;
  BWVideoFormatRequirements *v10;
  __int128 v11;
  BWPointCloudFormatRequirements *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  objc_super v21;

  v6 = *(_QWORD *)&a3;
  v21.receiver = self;
  v21.super_class = (Class)BWRemoteQueueSinkNode;
  v7 = -[BWSinkNode initWithSinkID:](&v21, sel_initWithSinkID_, a5);
  if (v7)
  {
    v8 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", v6, v7);
    v9 = (__int128 *)MEMORY[0x1E0CA2E18];
    if ((_DWORD)v6 == 1885564004)
    {
      v12 = objc_alloc_init(BWPointCloudFormatRequirements);
      -[BWPointCloudFormatRequirements setSupportedDataFormats:](v12, "setSupportedDataFormats:", &unk_1E4A01F40);
      -[BWPointCloudFormatRequirements setMemoryPoolUseAllowed:](v12, "setMemoryPoolUseAllowed:", 0);
      -[BWNodeInput setFormatRequirements:](v8, "setFormatRequirements:", v12);

      v7[169] = 1;
      v7[236] = 1;
      *((_DWORD *)v7 + 58) = 1;
      objc_msgSend(*((id *)v7 + 1), "setRetainedBufferCount:", 1);
      *(_OWORD *)(v7 + 264) = *v9;
      *((_QWORD *)v7 + 35) = *((_QWORD *)v9 + 2);
    }
    else if ((_DWORD)v6 == 1986618469)
    {
      v10 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedCacheModes:](v10, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess](BWVideoFormatRequirements, "cacheModesForOptimizedCPUAccess"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v10, "setSupportedPixelFormats:", &unk_1E4A01F28);
      -[BWVideoFormatRequirements setMemoryPoolUseAllowed:](v10, "setMemoryPoolUseAllowed:", 0);
      -[BWNodeInput setFormatRequirements:](v8, "setFormatRequirements:", v10);

      v7[168] = 1;
      v7[236] = 1;
      *((_DWORD *)v7 + 58) = 1;
      objc_msgSend(*((id *)v7 + 1), "setRetainedBufferCount:", 1);
      *(_OWORD *)(v7 + 264) = *v9;
      *((_QWORD *)v7 + 35) = *((_QWORD *)v9 + 2);
      v7[250] = 1;
      v11 = *(_OWORD *)&a4->var0[4];
      v19 = *(_OWORD *)a4->var0;
      v20 = v11;
      v7[249] = FigCaptureClientIsContinuityCapture(&v19) != 0;
    }
    else
    {
      v7[236] = 0;
    }
    v7[352] = 0;
    v13 = *(_OWORD *)&a4->var0[4];
    v19 = *(_OWORD *)a4->var0;
    v20 = v13;
    *((_DWORD *)v7 + 72) = FigCaptureGetPIDFromAuditToken(&v19);
    v14 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)(v7 + 292) = *(_OWORD *)a4->var0;
    *(_OWORD *)(v7 + 308) = v14;
    v15 = *(_OWORD *)&a4->var0[4];
    v19 = *(_OWORD *)a4->var0;
    v20 = v15;
    v7[324] = FigCaptureClientIsRunningInMediaserverd(&v19) != 0;
    *((_QWORD *)v7 + 23) = FigSimpleMutexCreate();
    v7[239] = 0;
    *((_QWORD *)v7 + 49) = objc_alloc_init(BWVideoDataOutputAnalyticsPayload);
    v16 = *v9;
    *((_OWORD *)v7 + 25) = *v9;
    v17 = *((_QWORD *)v9 + 2);
    *((_QWORD *)v7 + 52) = v17;
    *(_OWORD *)(v7 + 264) = v16;
    *((_QWORD *)v7 + 35) = v17;
    objc_msgSend(v7, "addInput:", v8);

    v7[237] = 0;
    v7[325] = 1;
    v7[424] = 0;
  }
  return (BWRemoteQueueSinkNode *)v7;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BWRemoteQueueSinkNodeDelegate *)a3;
}

- (void)setDiscardsLateSampleBuffers:(BOOL)a3
{
  self->_discardsLateSampleBuffers = a3;
}

- (void)setClientVideoRetainedBufferCount:(int)a3
{
  if (self->_clientVideoRetainedBufferCount != a3)
  {
    self->_clientVideoRetainedBufferCount = a3;
    -[BWNodeInput setRetainedBufferCount:](self->super.super._input, "setRetainedBufferCount:");
  }
}

- (void)setSceneStabilityMetadataEnabled:(BOOL)a3
{
  BWSceneStabilityMonitor *stabilityMonitor;
  BWSceneStabilityMonitor *v5;

  stabilityMonitor = self->_stabilityMonitor;
  if (a3)
  {
    if (stabilityMonitor)
      return;
    v5 = objc_alloc_init(BWSceneStabilityMonitor);
  }
  else
  {
    if (!stabilityMonitor)
      return;

    v5 = 0;
  }
  self->_stabilityMonitor = v5;
}

- (void)setRequestedBufferAttachmentsTrie:(id)a3
{
  FigCaptureTrie *requestedBufferAttachmentsTrie;

  requestedBufferAttachmentsTrie = self->_requestedBufferAttachmentsTrie;
  self->_requestedBufferAttachmentsTrie = (FigCaptureTrie *)a3;
  if (a3)
    CFRetain(a3);
  if (requestedBufferAttachmentsTrie)
    CFRelease(requestedBufferAttachmentsTrie);
}

- (void)setRemoveCameraIntrinsicMatrixAttachment:(BOOL)a3
{
  self->_removeCameraIntrinsicMatrixAttachment = a3;
}

- (void)setPanoramaRequiresLTMLocking:(BOOL)a3
{
  self->_panoramaRequiresLTMLocking = a3;
}

- (void)setCameraSupportsFlash:(BOOL)a3
{
  self->_cameraSupportsFlash = a3;
}

- (void)setAttachPanoramaMetadata:(BOOL)a3
{
  self->_attachPanoramaMetadata = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  remoteQueueSenderOpaque *remoteQueueSender;
  shmemPoolOpaque *sharedMemoryPool;
  __CFAllocator *sharedMemoryPoolCFAllocator;
  localQueueOpaque *localQueue;
  OpaqueFigFlatDictionaryKeySpec *makerNoteKeySpec;
  opaqueCMFormatDescription *cachedFormatDescription;
  objc_super v9;

  remoteQueueSender = self->_remoteQueueSender;
  if (remoteQueueSender)
    CFRelease(remoteQueueSender);
  sharedMemoryPool = self->_sharedMemoryPool;
  if (sharedMemoryPool)
    CFRelease(sharedMemoryPool);
  sharedMemoryPoolCFAllocator = self->_sharedMemoryPoolCFAllocator;
  if (sharedMemoryPoolCFAllocator)
    CFRelease(sharedMemoryPoolCFAllocator);
  localQueue = self->_localQueue;
  if (localQueue)
    CFRelease(localQueue);
  makerNoteKeySpec = self->_makerNoteKeySpec;
  if (makerNoteKeySpec)
    CFRelease(makerNoteKeySpec);
  cachedFormatDescription = self->_cachedFormatDescription;
  if (cachedFormatDescription)
    CFRelease(cachedFormatDescription);
  FigSimpleMutexDestroy();

  -[BWRemoteQueueSinkNode _sendAndClearCoreAnalyticsData]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)BWRemoteQueueSinkNode;
  -[BWSinkNode dealloc](&v9, sel_dealloc);
}

- (uint64_t)_sendAndClearCoreAnalyticsData
{
  uint64_t v1;
  double Seconds;
  double v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  CMTime time;
  CMTime time2;
  CMTime time1;

  if (result)
  {
    v1 = result;
    time1 = *(CMTime *)(result + 400);
    time2 = *(CMTime *)(result + 264);
    result = CMTimeCompare(&time1, &time2);
    if ((result & 0x80000000) != 0 || *(_QWORD *)(v1 + 376))
    {
      time1 = *(CMTime *)(v1 + 264);
      time2 = *(CMTime *)(v1 + 400);
      CMTimeSubtract(&time, &time1, &time2);
      Seconds = CMTimeGetSeconds(&time);
      objc_msgSend(*(id *)(v1 + 392), "setDuration:");
      objc_msgSend(*(id *)(v1 + 392), "setNumberOfFrames:", *(_QWORD *)(v1 + 368));
      objc_msgSend(*(id *)(v1 + 392), "setNumberOfFramesDropped:", *(_QWORD *)(v1 + 376));
      objc_msgSend(*(id *)(v1 + 392), "setNumberOfISPFramesDropped:", *(_QWORD *)(v1 + 384));
      v3 = (double)(uint64_t)(*(_QWORD *)(v1 + 384) + *(_QWORD *)(v1 + 368) + *(_QWORD *)(v1 + 376)) / Seconds;
      *(float *)&v3 = v3;
      objc_msgSend(*(id *)(v1 + 392), "setNominalFramerate:", v3);
      objc_msgSend(*(id *)(v1 + 392), "setProresVideo:", 0);
      result = -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", *(_QWORD *)(v1 + 392));
      if (*(_BYTE *)(v1 + 424))
      {
        objc_msgSend(*(id *)(v1 + 392), "setProresVideo:", 1);
        result = -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", *(_QWORD *)(v1 + 392));
      }
      v4 = MEMORY[0x1E0CA2E18];
      v5 = *MEMORY[0x1E0CA2E18];
      *(_OWORD *)(v1 + 400) = *MEMORY[0x1E0CA2E18];
      v6 = *(_QWORD *)(v4 + 16);
      *(_QWORD *)(v1 + 416) = v6;
      *(_OWORD *)(v1 + 264) = v5;
      *(_QWORD *)(v1 + 280) = v6;
    }
  }
  return result;
}

- (void)registerSurfacesFromSourcePool:(id)a3
{
  _QWORD v5[5];

  if (!self->_clientIsRunningInMediaserverd)
  {
    pthread_mutex_lock((pthread_mutex_t *)self->_peerTerminationMutex);
    if (self->_remoteQueueSender)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __56__BWRemoteQueueSinkNode_registerSurfacesFromSourcePool___block_invoke;
      v5[3] = &unk_1E49266E0;
      v5[4] = self;
      objc_msgSend(a3, "enumerateSurfacesUsingBlock:", v5);
    }
    pthread_mutex_unlock((pthread_mutex_t *)self->_peerTerminationMutex);
  }
}

uint64_t __56__BWRemoteQueueSinkNode_registerSurfacesFromSourcePool___block_invoke(uint64_t a1, __IOSurface *a2)
{
  return FigRemoteQueueSenderRegisterIOSurface(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), a2);
}

- (void)updateClientAuditToken:(id *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v5 = *(_OWORD *)&a3->var0[4];
  v9 = *(_OWORD *)a3->var0;
  v10 = v5;
  self->_receiverPID = FigCaptureGetPIDFromAuditToken(&v9);
  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_receiverAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_receiverAuditToken.val[4] = v6;
  v7 = *(_OWORD *)&a3->var0[4];
  v9 = *(_OWORD *)a3->var0;
  v10 = v7;
  self->_clientIsRunningInMediaserverd = FigCaptureClientIsRunningInMediaserverd(&v9) != 0;
  v8 = *(_OWORD *)&a3->var0[4];
  v9 = *(_OWORD *)a3->var0;
  v10 = v8;
  self->_attachDetectedObjectsInfo = FigCaptureClientIsContinuityCapture(&v9) != 0;
}

- (int)clientVideoRetainedBufferCount
{
  return self->_clientVideoRetainedBufferCount;
}

- (BOOL)discardsLateSampleBuffers
{
  return self->_discardsLateSampleBuffers;
}

- (BOOL)attachPanoramaMetadata
{
  return self->_attachPanoramaMetadata;
}

- (BOOL)panoramaRequiresLTMLocking
{
  return self->_panoramaRequiresLTMLocking;
}

- (BOOL)sceneStabilityMetadataEnabled
{
  return self->_stabilityMonitor != 0;
}

- (id)requestedBufferAttachmentsTrie
{
  return self->_requestedBufferAttachmentsTrie;
}

- (BOOL)frameSenderSupportEnabled
{
  return self->_frameSenderSupportEnabled;
}

- (void)setFrameSenderSupportEnabled:(BOOL)a3
{
  self->_frameSenderSupportEnabled = a3;
}

- (BOOL)cameraSupportsFlash
{
  return self->_cameraSupportsFlash;
}

- (BOOL)removeCameraIntrinsicMatrixAttachment
{
  return self->_removeCameraIntrinsicMatrixAttachment;
}

- (id)nodeSubType
{
  return CFSTR("RemoteQueue");
}

- (void)_handlePeerTerminated
{
  const void *v2;
  const void *v3;

  if (a1)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 184));
    v2 = *(const void **)(a1 + 176);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 176) = 0;
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 184));
    v3 = *(const void **)(a1 + 192);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 192) = 0;
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  opaqueCMFormatDescription *cachedFormatDescription;
  objc_super v8;
  os_log_type_t type;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_mediaTypeIsVideo && dword_1ECFE9750 != 0)
  {
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  self->_frameSender = 0;
  -[BWRemoteQueueSinkNode _sendAndClearCoreAnalyticsData]((uint64_t)self);
  cachedFormatDescription = self->_cachedFormatDescription;
  if (cachedFormatDescription)
  {
    CFRelease(cachedFormatDescription);
    self->_cachedFormatDescription = 0;
  }
  FigRemoteQueueSenderReleaseIOSurfaces((uint64_t)self->_remoteQueueSender, 0);
  v8.receiver = self;
  v8.super_class = (Class)BWRemoteQueueSinkNode;
  -[BWSinkNode didReachEndOfDataForInput:](&v8, sel_didReachEndOfDataForInput_, a3);
}

- (uint64_t)_finishRenderingSampleBufferUsingTheLocalQueue:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  CMSampleBufferRef v7;
  uint64_t v8;
  _QWORD v9[5];

  if (result)
  {
    v3 = result;
    if (*(_BYTE *)(result + 236) && (CMSampleBufferGetImageBuffer(sbuf) || CMSampleBufferGetDataBuffer(sbuf)))
    {
      ++*(_DWORD *)(v3 + 216);
      FigMemoryBarrier();
      v4 = *(_QWORD *)(v3 + 208);
      v8 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __72__BWRemoteQueueSinkNode__finishRenderingSampleBufferUsingTheLocalQueue___block_invoke;
      v9[3] = &unk_1E4927DB0;
      v9[4] = v3;
      v6 = 3;
      v7 = sbuf;
      v5 = v9;
    }
    else
    {
      v4 = *(_QWORD *)(v3 + 208);
      v6 = 3;
      v7 = sbuf;
      v8 = 0;
      v5 = 0;
    }
    return FigLocalQueueEnqueue(v4, &v6, (uint64_t)v5);
  }
  return result;
}

uint64_t __96__BWRemoteQueueSinkNode__finishRenderingSampleBufferUsingTheRemoteCaptureStack_isDroppedSample___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int Type;
  uint64_t result;

  Type = FigRemoteOperationGetType((_DWORD **)a4);
  if (Type == 6)
    goto LABEL_4;
  if (Type != 5)
  {
    if (Type != 3)
      return 0;
LABEL_4:
    result = 1;
    if (*(_DWORD *)(a4 + 16) != 1)
      return result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return 1;
}

void __72__BWRemoteQueueSinkNode__finishRenderingSampleBufferUsingTheLocalQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(uint64_t, _OWORD *);
  const opaqueCMFormatDescription *FormatDescription;
  void (*v8)(uint64_t, _OWORD *);
  _OWORD v9[2];
  CMTime v10;
  CMAttachmentBearerRef v11;

  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 220);
  FigMemoryBarrier();
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 220) == *(_DWORD *)(*(_QWORD *)(a1 + 32) + 216))
  {
    v6 = *(void (**)(uint64_t, _OWORD *))(a3 + 16);
    v9[0] = *(_OWORD *)a2;
    LODWORD(v9[1]) = *(_DWORD *)(a2 + 16);
    v6(a3, v9);
  }
  else
  {
    v11 = 0;
    CMSampleBufferGetPresentationTimeStamp(&v10, *(CMSampleBufferRef *)(a2 + 4));
    FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(a2 + 4));
    BWSampleBufferCreateForDroppedFrame(&v10, FormatDescription, CFSTR("LateFrame"), &v11);
    v8 = *(void (**)(uint64_t, _OWORD *))(a3 + 16);
    LODWORD(v9[0]) = 3;
    *(_OWORD *)((char *)v9 + 4) = (unint64_t)v11;
    v8(a3, v9);
    if (v11)
      CFRelease(v11);
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  _BOOL4 mediaTypeIsVideo;
  opaqueCMFormatDescription *cachedFormatDescription;
  void *v9;
  int *v10;
  CMTime v11;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CFTypeRef cf;

  mediaTypeIsVideo = self->_mediaTypeIsVideo;
  if (!*(_WORD *)&self->_mediaTypeIsVideo)
    return;
  cf = 0;
  cachedFormatDescription = self->_cachedFormatDescription;
  if (cachedFormatDescription)
  {
    formatDescriptionOut = (CMVideoFormatDescriptionRef)CFRetain(cachedFormatDescription);
    mediaTypeIsVideo = self->_mediaTypeIsVideo;
    if (formatDescriptionOut)
    {
      if (!self->_mediaTypeIsVideo)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  else
  {
    formatDescriptionOut = 0;
  }
  if (mediaTypeIsVideo)
  {
    v9 = (void *)objc_msgSend(a4, "liveFormat");
    if (v9)
      CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], objc_msgSend(v9, "pixelFormat"), objc_msgSend(v9, "width"), objc_msgSend(v9, "height"), 0, &formatDescriptionOut);
  }
  else if (self->_mediaTypeIsPointCloud)
  {
    CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x70636C64u, 0, 0, &formatDescriptionOut);
  }
  if (formatDescriptionOut)
  {
    if (!self->_mediaTypeIsVideo)
    {
LABEL_5:
      if (a3)
      {
LABEL_6:
        objc_msgSend(a3, "pts");
LABEL_23:
        BWSampleBufferCreateForDroppedFrame(&v11, formatDescriptionOut, (void *)objc_msgSend(a3, "reason"), &cf);
        -[BWRemoteQueueSinkNode renderSampleBuffer:forInput:](self, "renderSampleBuffer:forInput:", cf, a4);
        if (cf)
          CFRelease(cf);
        if (formatDescriptionOut)
          CFRelease(formatDescriptionOut);
        return;
      }
LABEL_22:
      memset(&v11, 0, sizeof(v11));
      goto LABEL_23;
    }
LABEL_15:
    if (objc_msgSend(a3, "reason") == 0x1E494EF78)
    {
      v10 = &OBJC_IVAR___BWRemoteQueueSinkNode__totalNumberOfISPFramesDropped;
    }
    else
    {
      v10 = &OBJC_IVAR___BWRemoteQueueSinkNode__totalNumberOfISPFramesDropped;
      if ((__CFString *)objc_msgSend(a3, "reason") != CFSTR("VideoDeviceDiscontinuity")
        && (__CFString *)objc_msgSend(a3, "reason") != CFSTR("HighFrameRateAutoFocusDiscontinuity"))
      {
        v10 = &OBJC_IVAR___BWRemoteQueueSinkNode__totalNumberOfFramesDropped;
      }
    }
    ++*(Class *)((char *)&self->super.super.super.isa + *v10);
    if (a3)
      goto LABEL_6;
    goto LABEL_22;
  }
}

- (BWRemoteQueueSinkNodeDelegate)delegate
{
  return self->_delegate;
}

@end
