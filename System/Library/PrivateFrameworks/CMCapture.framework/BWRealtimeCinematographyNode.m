@implementation BWRealtimeCinematographyNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWRealtimeCinematographyNode)initWithObjectMetadataIdentifiers:(id)a3 cachedSimulatedAperture:(float)a4 captureDevice:(id)a5 tuningParameters:(id)a6 videoDepthConfiguration:(id)a7 smartStyleLearningEnabled:(BOOL)a8 captureInputEnabled:(BOOL)a9
{
  _BOOL4 v10;
  BWRealtimeCinematographyNode *v16;
  BWRealtimeCinematographyNode *v17;
  BWNodeInput *v18;
  BWNodeInputMediaConfiguration *v19;
  BWVideoFormatRequirements *v20;
  BWNodeInputMediaConfiguration *v21;
  BWNodeOutput *v22;
  BWNodeOutput *v23;
  BWNodeOutputMediaConfiguration *v24;
  BWVideoFormatRequirements *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  BWNodeOutputMediaConfiguration *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  PTCinematographyStream *v45;
  float v46;
  float v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  double v52;
  float v53;
  int v54;
  int v55;
  void *v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v10 = a8;
  v72 = *MEMORY[0x1E0C80C00];
  v69.receiver = self;
  v69.super_class = (Class)BWRealtimeCinematographyNode;
  v16 = -[BWNode init](&v69, sel_init);
  v17 = v16;
  if (!v16)
    return v17;
  v58 = a3;
  v59 = a5;
  v60 = a6;
  v16->_captureInputEnabled = a9;
  v18 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v16);
  -[BWNodeInput setFormatRequirements:](v18, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  -[BWNodeInput setPassthroughMode:](v18, "setPassthroughMode:", 1);
  v19 = objc_alloc_init(BWNodeInputMediaConfiguration);
  v20 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", &unk_1E49FFFD8);
  -[BWNodeInputMediaConfiguration setFormatRequirements:](v19, "setFormatRequirements:", v20);
  -[BWNodeInputMediaConfiguration setPassthroughMode:](v19, "setPassthroughMode:", 1);
  -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v19, "setDelayedBufferCount:", objc_msgSend(a7, "concurrencyWidth"));
  -[BWNodeInput setDelayedBufferCount:](v18, "setDelayedBufferCount:", objc_msgSend(a7, "concurrencyWidth"));
  -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v18, "setMediaConfiguration:forAttachedMediaKey:", v19, CFSTR("Depth"));
  -[BWNode addInput:](v17, "addInput:", v18);
  if (v17->_captureInputEnabled)
  {
    v17->_captureInput = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v17, 1);
    -[BWNodeInput setFormatRequirements:](v17->_captureInput, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v17->_captureInput, "setPassthroughMode:", 1);
    v21 = -[BWNodeInput primaryMediaConfiguration](v17->_captureInput, "primaryMediaConfiguration");
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v21, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v21, "setPassthroughMode:", 1);
    -[BWNodeInput setDelayedBufferCount:](v17->_captureInput, "setDelayedBufferCount:", objc_msgSend(a7, "concurrencyWidth"));
    -[BWNode addInput:](v17, "addInput:", v17->_captureInput);
    v17->_videoCaptureSampleBufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17->_previewSampleBufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17->_bufferServicingLock._os_unfair_lock_opaque = 0;
  }
  v22 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v17);
  v17->_previewOutput = v22;
  -[BWNodeOutput setPassthroughMode:](v22, "setPassthroughMode:", 1);
  -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v17->_previewOutput, "setIndexOfInputWhichDrivesThisOutput:", 0);
  -[BWNode addOutput:](v17, "addOutput:", v17->_previewOutput);

  v23 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v17);
  v17->_movieFileOutput = v23;
  -[BWNodeOutput setPassthroughMode:](v23, "setPassthroughMode:", 1);
  if (v17->_captureInputEnabled)
  {
    v24 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v25 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", &unk_1E49FFFF0);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v24, "setFormatRequirements:", v25);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v24, "setPassthroughMode:", 1);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v17->_movieFileOutput, "setMediaConfiguration:forAttachedMediaKey:", v24, CFSTR("Depth"));
    -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v17->_movieFileOutput, "setIndexOfInputWhichDrivesThisOutput:", 1);
    v17->_smartStyleLearningEnabled = v10;
    if (v10)
    {
      v26 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 0);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v66 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
            v32 = objc_alloc_init(BWNodeOutputMediaConfiguration);
            -[BWNodeOutputMediaConfiguration setFormatRequirements:](v32, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
            -[BWNodeOutputMediaConfiguration setPassthroughMode:](v32, "setPassthroughMode:", 1);
            -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](v32, "setIndexOfInputWhichDrivesThisOutput:", 0);
            -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v32, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", v31);
            -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v17->_movieFileOutput, "setMediaConfiguration:forAttachedMediaKey:", v32, v31);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
        }
        while (v28);
      }
    }
  }
  -[BWNode addOutput:](v17, "addOutput:", v17->_movieFileOutput, a7);
  if (v58)
  {
    v17->_detectedObjectsOutput = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v17);
    -[BWNodeOutput setFormat:](v17->_detectedObjectsOutput, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", v58));
    -[BWNode addOutput:](v17, "addOutput:", v17->_detectedObjectsOutput);
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v33 = (void *)objc_msgSend(v59, "activePortTypes");
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v62;
    v37 = *MEMORY[0x1E0D05A30];
    v38 = *MEMORY[0x1E0D05A28];
    v39 = *MEMORY[0x1E0D05A40];
    while (2)
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v62 != v36)
          objc_enumerationMutation(v33);
        v41 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        if ((objc_msgSend(v41, "isEqual:", v37) & 1) != 0)
        {
          v42 = v37;
          goto LABEL_30;
        }
        if (objc_msgSend(v41, "isEqual:", v38))
        {
          v42 = *MEMORY[0x1E0D05A18];
          goto LABEL_30;
        }
        if ((objc_msgSend(v41, "isEqual:", v39) & 1) != 0)
        {
          v42 = v39;
          goto LABEL_30;
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      v42 = 0;
      if (v35)
        continue;
      break;
    }
  }
  else
  {
    v42 = 0;
  }
LABEL_30:
  v43 = (void *)objc_msgSend((id)objc_msgSend(v59, "sensorIDDictionaryByPortType"), "objectForKeyedSubscript:", v42);
  v44 = (id)objc_msgSend(objc_alloc((Class)getPTCinematographyStreamOptionsClass()), "init");
  objc_msgSend(v59, "defaultAutoFocusTapWindowSize");
  objc_msgSend(v44, "setFixedFocusNormalizedRectSize:");
  objc_msgSend(v44, "setCinematographyParameters:", objc_msgSend(v43, "valueForKeyPath:", CFSTR("CinematicVideoParameters.CinematographyParameters")));
  v45 = (PTCinematographyStream *)objc_msgSend(objc_alloc((Class)getPTCinematographyStreamClass()), "initWithOptions:", v44);
  v17->_cinematographyStream = v45;
  -[PTCinematographyStream setDelegate:](v45, "setDelegate:", v17);
  v17->_hasAutoFocus = objc_msgSend((id)objc_msgSend(v59, "captureStream"), "hasFocus");
  v17->_captureDevice = (BWFigVideoCaptureDevice *)v59;
  objc_msgSend((id)objc_msgSend(v43, "valueForKeyPath:", CFSTR("CinematicVideoParameters.simulatedVideoAperture")), "floatValue");
  v47 = v46;
  v48 = (void *)objc_msgSend(v43, "valueForKeyPath:", CFSTR("CinematicVideoParameters.RenderVersion"));
  if (!v48)
  {
    v17->_globalRenderingMetadataVersion = 2;
LABEL_36:
    v51 = (void *)objc_msgSend(objc_alloc((Class)getPTGlobalRenderingMetadataVersion2Class()), "initWithMinorVersion:", 1);
    goto LABEL_37;
  }
  v49 = objc_msgSend(v48, "intValue");
  v50 = 1;
  if (v49 != 2)
    v50 = 2;
  v17->_globalRenderingMetadataVersion = v50;
  if (v49 != 2)
    goto LABEL_36;
  v51 = (void *)objc_msgSend(objc_alloc((Class)getPTGlobalRenderingMetadataVersion1Class()), "initWithMinorVersion:", 6);
  objc_msgSend((id)objc_msgSend(v43, "valueForKeyPath:", CFSTR("CinematicVideoParameters.minimumSimulatedVideoAperture")), "floatValue");
  objc_msgSend(v51, "setMinAperture:");
  objc_msgSend((id)objc_msgSend(v43, "valueForKeyPath:", CFSTR("CinematicVideoParameters.maximumSimulatedVideoAperture")), "floatValue");
  objc_msgSend(v51, "setMaxAperture:");
  *(float *)&v52 = v47;
  objc_msgSend(v51, "setDefaultAperture:", v52);
  objc_msgSend(v57, "networkBias");
  objc_msgSend(v51, "setNetworkBias:");
LABEL_37:
  v17->_globalRenderingMetadata = (PTGlobalRenderingMetadata *)v51;
  v17->_globalVideoHeaderMetadata = (PTGlobalVideoHeaderMetadataVersion1 *)objc_msgSend(objc_alloc((Class)getPTGlobalVideoHeaderMetadataVersion1Class()), "initWithMinorVersion:", 1);
  v17->_globalCinematographyMetadata = (PTGlobalCinematographyMetadataVersion1 *)objc_msgSend(objc_alloc((Class)getPTGlobalCinematographyMetadataVersion1Class()), "initWithMinorVersion:", 1);
  if (a4 == 0.0)
    v53 = v47;
  else
    v53 = a4;
  v17->_simulatedAperture = v53;
  -[PTCinematographyStream setUserAperture:](v17->_cinematographyStream, "setUserAperture:");
  v17->_globalStabilizationMetadata = (PTGlobalStabilizationMetadataVersion1 *)objc_msgSend(objc_alloc((Class)getPTGlobalStabilizationMetadataVersion1Class()), "initWithMinorVersion:", 1);
  v17->_globalMetadata = (PTGlobalVideoMetadata *)objc_msgSend(objc_alloc((Class)getPTGlobalVideoMetadataClass()), "init");
  *(_QWORD *)v17->_pastFramesWereBrightEnough = 0x101010101010101;
  *(_QWORD *)&v17->_pastFramesWereBrightEnough[8] = 0x101010101010101;
  *(_QWORD *)&v17->_pastFramesWereBrightEnough[16] = 0x101010101010101;
  *(_QWORD *)&v17->_pastFramesWereBrightEnough[22] = 0x101010101010101;
  v17->_pastFramesWereBrightEnoughPointer = 0;
  v17->_currentStateIsBrightEnough = 1;
  v17->_alphaLowLight = 1.0;
  v54 = objc_msgSend((id)objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("TooDarkLuxLevelRolloffThreshold")), "intValue");
  if (v54)
    v55 = v54;
  else
    v55 = 40;
  v17->_luxLevelThreshold = v55;
  v17->_alphaRampFrameCount = 30;
  v17->_autoFocusUpdateFrameDelay = 3;
  v17->_latestFocusDectionTrackID = 0xFFFFFFFF80000000;
  v17->_focusDetections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17->_focusDetectionsLock._os_unfair_lock_opaque = 0;
  v17->_focusDetectionProviderEnabled = 0;
  return v17;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *previousSampleBuffer;
  opaqueCMFormatDescription *depthFormatDescription;
  objc_super v5;

  previousSampleBuffer = self->_previousSampleBuffer;
  if (previousSampleBuffer)
    CFRelease(previousSampleBuffer);

  depthFormatDescription = self->_depthFormatDescription;
  if (depthFormatDescription)
    CFRelease(depthFormatDescription);

  v5.receiver = self;
  v5.super_class = (Class)BWRealtimeCinematographyNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("CinematographyMetadataProducer");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  BWNodeInput *captureInput;

  captureInput = self->_captureInput;
  if (captureInput == a4 || !self->_captureInputEnabled)
  {
    -[BWNodeOutput setFormat:](self->_movieFileOutput, "setFormat:", a3);
    captureInput = self->_captureInput;
  }
  if (captureInput != a4)
    -[BWNodeOutput setFormat:](self->_previewOutput, "setFormat:", a3);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  BWNodeInput *captureInput;

  captureInput = self->_captureInput;
  if (captureInput == a5 || !self->_captureInputEnabled)
  {
    -[BWNodeOutput makeConfiguredFormatLive](self->_movieFileOutput, "makeConfiguredFormatLive", a3, a4);
    captureInput = self->_captureInput;
  }
  if (captureInput != a5)
  {
    -[BWNodeOutput makeConfiguredFormatLive](self->_previewOutput, "makeConfiguredFormatLive", a3, a4);
    -[BWNodeOutput makeConfiguredFormatLive](self->_detectedObjectsOutput, "makeConfiguredFormatLive");
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  int *p_numEODMessagesReceived;
  unsigned int v5;

  if (self->_captureInputEnabled)
  {
    p_numEODMessagesReceived = &self->_numEODMessagesReceived;
    do
      v5 = __ldxr((unsigned int *)p_numEODMessagesReceived);
    while (__stxr(v5 + 1, (unsigned int *)p_numEODMessagesReceived));
    if (-[NSArray count](-[BWNode inputs](self, "inputs", a3), "count") == v5 + 1)
    {
      os_unfair_lock_lock(&self->_bufferServicingLock);
      -[BWNodeOutput markEndOfLiveOutput](self->_movieFileOutput, "markEndOfLiveOutput");
      -[BWNodeOutput markEndOfLiveOutput](self->_previewOutput, "markEndOfLiveOutput");
      -[BWNodeOutput markEndOfLiveOutput](self->_detectedObjectsOutput, "markEndOfLiveOutput");
      os_unfair_lock_unlock(&self->_bufferServicingLock);
      *p_numEODMessagesReceived = 0;
    }
  }
  else
  {
    -[BWNodeOutput markEndOfLiveOutput](self->_movieFileOutput, "markEndOfLiveOutput", a3);
    -[BWNodeOutput markEndOfLiveOutput](self->_previewOutput, "markEndOfLiveOutput");
    -[BWNodeOutput markEndOfLiveOutput](self->_detectedObjectsOutput, "markEndOfLiveOutput");
  }
}

- (void)setSimulatedAperture:(float)a3
{
  self->_simulatedAperture = a3;
  -[PTCinematographyStream setUserAperture:](self->_cinematographyStream, "setUserAperture:");
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (uint64_t)_dropFrame:(uint64_t)result
{
  uint64_t v3;
  const void *v4;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 120), "emitDroppedSample:", a2);
    if (*(_QWORD *)(v3 + 296))
    {
      -[BWRealtimeCinematographyNode _emitMovieFileDropForPreviousSampleBuffer](v3);
      v4 = *(const void **)(v3 + 296);
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(v3 + 296) = 0;
      }
    }
    return objc_msgSend(*(id *)(v3 + 112), "emitDroppedSample:", a2);
  }
  return result;
}

- (void)_emitMovieFileDropForPreviousSampleBuffer
{
  id v2;
  CMTime v3;
  CMTime v4;

  if (a1)
  {
    memset(&v4, 0, sizeof(v4));
    CMSampleBufferGetPresentationTimeStamp(&v4, *(CMSampleBufferRef *)(a1 + 296));
    v3 = v4;
    v2 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F138, &v3);
    objc_msgSend(*(id *)(a1 + 112), "emitDroppedSample:", v2);

  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (!self->_captureInputEnabled)
    -[BWRealtimeCinematographyNode _dropFrame:]((uint64_t)self, (uint64_t)a3);
}

- (uint64_t)_updateAlphaLowLightWithMetadata:(const void *)a3 imageSampleBuffer:
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  float v9;
  char v10;
  float v11;
  float v12;
  float v13;
  _BOOL4 v14;
  float v15;
  _BOOL4 v16;

  if (!result)
    return result;
  v4 = result;
  v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), "intValue");
  v6 = 0;
  v7 = 0;
  *(_BYTE *)(v4 + 144 + *(int *)(v4 + 176)) = v5 >= *(_DWORD *)(v4 + 188);
  *(_DWORD *)(v4 + 176) = (*(_DWORD *)(v4 + 176) + 1) % 30;
  do
    v7 += *(unsigned __int8 *)(v4 + 144 + v6++);
  while (v6 != 30);
  if (*(_BYTE *)(v4 + 180))
    v8 = 0;
  else
    v8 = 10;
  v9 = (float)(v7 + 10 * *(unsigned __int8 *)(v4 + 180)) / (float)(v8 + 10 * *(unsigned __int8 *)(v4 + 180) + 30);
  if (!*(_BYTE *)(v4 + 180) || (v10 = 0, v9 >= 0.5))
  {
    if (*(_BYTE *)(v4 + 180) || v9 < 0.5)
      goto LABEL_13;
    v10 = 1;
  }
  *(_BYTE *)(v4 + 180) = v10;
LABEL_13:
  v11 = 1.0 / (double)*(int *)(v4 + 192);
  result = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D086E8], 0), "BOOLValue");
  if ((_DWORD)result)
  {
    *(float *)(v4 + 184) = *(float *)(v4 + 184) - v11;
  }
  else
  {
    v12 = -v11;
    if (*(_BYTE *)(v4 + 180))
      v12 = v11;
    *(float *)(v4 + 184) = *(float *)(v4 + 184) + v12;
  }
  v13 = *(float *)(v4 + 184);
  v14 = v13 <= 0.0;
  v15 = 1.0;
  v16 = v13 < 1.0 || v13 <= 0.0;
  if (v13 >= 1.0)
    v14 = 1;
  if (v16)
    v15 = 0.0;
  if (v14)
    v13 = v15;
  *(float *)(v4 + 184) = v13;
  return result;
}

- (uint64_t)_updateFromQueue:(_QWORD *)a3 sampleBufferOut:(_DWORD *)a4 captureID:
{
  const void *v7;

  if (result)
  {
    result = objc_msgSend(a2, "count");
    if (result)
    {
      v7 = (const void *)objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
      *a3 = v7;
      *a4 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v7, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), "intValue");
      return 1;
    }
  }
  return result;
}

- (uint64_t)_sendDropAndRemoveSampleBuffer:(uint64_t)result fromQueue:(CMSampleBufferRef)sbuf withCaptureID:(void *)a3
{
  uint64_t v5;
  id v6;
  CMTime v7;
  CMTime v8;

  if (result)
  {
    v5 = result;
    memset(&v8, 0, sizeof(v8));
    CMSampleBufferGetPresentationTimeStamp(&v8, sbuf);
    v7 = v8;
    v6 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F138, &v7);
    -[BWRealtimeCinematographyNode _dropFrame:](v5, (uint64_t)v6);

    return objc_msgSend(a3, "removeObject:", sbuf);
  }
  return result;
}

- (uint64_t)_findCaptureSampleBuffer:(CMSampleBufferRef *)a3 matchingPreviewSampleBuffer:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  CMSampleBufferRef v20;
  CMSampleBufferRef sbuf;
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v20 = 0;
    sbuf = 0;
    v19 = 0;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = *(_QWORD *)(result + 328);
    v22[0] = *(_QWORD *)(result + 320);
    v22[1] = v6;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2, 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v12, "count") >= 5)
          {
            do
              objc_msgSend(v12, "removeObjectAtIndex:", 0);
            while ((unint64_t)objc_msgSend(v12, "count") > 4);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v9);
    }
    result = -[BWRealtimeCinematographyNode _updateFromQueue:sampleBufferOut:captureID:](v5, *(void **)(v5 + 320), &sbuf, (_DWORD *)&v19 + 1);
    if ((_DWORD)result)
    {
      result = -[BWRealtimeCinematographyNode _updateFromQueue:sampleBufferOut:captureID:](v5, *(void **)(v5 + 328), &v20, &v19);
      if ((_DWORD)result)
      {
        v13 = v19;
        while (1)
        {
          v14 = HIDWORD(v19);
          if (SHIDWORD(v19) >= v13)
            break;
          -[BWRealtimeCinematographyNode _sendDropAndRemoveSampleBuffer:fromQueue:withCaptureID:](v5, sbuf, *(void **)(v5 + 320));
          if ((-[BWRealtimeCinematographyNode _updateFromQueue:sampleBufferOut:captureID:](v5, *(void **)(v5 + 320), &sbuf, (_DWORD *)&v19 + 1) & 1) == 0)return 0;
        }
        while (v14 > (int)v19)
        {
          -[BWRealtimeCinematographyNode _sendDropAndRemoveSampleBuffer:fromQueue:withCaptureID:](v5, v20, *(void **)(v5 + 328));
          if ((-[BWRealtimeCinematographyNode _updateFromQueue:sampleBufferOut:captureID:](v5, *(void **)(v5 + 328), &v20, &v19) & 1) == 0)return 0;
        }
        if (v14 == (_DWORD)v19)
        {
          *a2 = sbuf;
          *a3 = v20;
          return 1;
        }
        return 0;
      }
    }
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_bufferServicingLock;
  int *v9;
  opaqueCMSampleBuffer *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v21;
  uint64_t v22;
  __CVBuffer *ImageBuffer;
  uint64_t v24;
  void *v25;
  CFTypeRef v26;
  CFTypeRef v27;
  CFTypeRef v28;
  opaqueCMSampleBuffer *AttachedMedia;
  __CVBuffer *v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  CFStringRef key;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  _BYTE v49[32];
  CFTypeRef cf;
  CMAttachmentBearerRef v51;
  CMAttachmentBearerRef target;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (self->_captureInputEnabled)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    if (self->_captureInput == a4)
      v9 = &OBJC_IVAR___BWRealtimeCinematographyNode__videoCaptureSampleBufferQueue;
    else
      v9 = &OBJC_IVAR___BWRealtimeCinematographyNode__previewSampleBufferQueue;
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v9), "addObject:", a3);
    v51 = 0;
    target = 0;
    cf = 0;
    if (-[BWRealtimeCinematographyNode _findCaptureSampleBuffer:matchingPreviewSampleBuffer:]((uint64_t)self, (CMSampleBufferRef *)&target, (CMSampleBufferRef *)&v51))
    {
      v10 = (opaqueCMSampleBuffer *)target;
      v11 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v12 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v13 = (void *)v51;
      v14 = (void *)CMGetAttachment(v51, v11, 0);
      if (-[BWFigVideoCaptureDevice depthType](self->_captureDevice, "depthType") == 3)
      {
        if (self->_captureInputEnabled
          && -[BWFigVideoCaptureStream videoCaptureDimensions](-[BWFigVideoCaptureDevice masterCaptureStream](self->_captureDevice, "masterCaptureStream"), "videoCaptureDimensions") == 3840)
        {
          v15 = (void *)CMGetAttachment(v13, CFSTR("TotalZoomFactor"), 0);
          *(_OWORD *)v49 = 0uLL;
          __asm { FMOV            V0.2D, #1.0 }
          *(_OWORD *)&v49[16] = _Q0;
          FigCFDictionaryGetCGRectIfPresent();
          objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
          v21 = -[BWFigVideoCaptureDevice baseZoomFactorsByPortType](self->_captureDevice, "baseZoomFactorsByPortType");
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "floatValue");
          objc_msgSend(v15, "floatValue");
          v22 = *MEMORY[0x1E0D06F58];
          objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F58]), "floatValue");
          objc_msgSend(v15, "floatValue");
          FigCFDictionarySetCGRect();
          ImageBuffer = CMSampleBufferGetImageBuffer(v10);
          CVPixelBufferGetWidth(ImageBuffer);
          CVPixelBufferGetHeight(ImageBuffer);
          FigCFDictionarySetCGRect();
          CMSetAttachment(v10, CFSTR("TotalZoomFactor"), v15, 1u);
          v24 = objc_msgSend(v14, "objectForKeyedSubscript:", v22);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D088A8]);
        }
      }
      else
      {
        v25 = (void *)objc_msgSend(v14, "mutableCopy");
        objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]), *MEMORY[0x1E0D05E68]);
        CMSetAttachment(v13, v11, v25, 1u);

      }
      v26 = CMGetAttachment(v13, CFSTR("FTCinematicTrackingResult"), 0);
      v27 = CMGetAttachment(v13, CFSTR("FusionTrackerInput"), 0);
      key = (CFStringRef)CMGetAttachment(v13, CFSTR("Inferences"), 0);
      v28 = CMGetAttachment(v13, CFSTR("CinematicVideoFocusRequest"), 0);
      CMSetAttachment(v10, CFSTR("FTCinematicTrackingResult"), v26, 1u);
      CMSetAttachment(v10, CFSTR("FusionTrackerInput"), v27, 1u);
      CMSetAttachment(v10, CFSTR("CinematicVideoFocusRequest"), v28, 1u);
      CMSetAttachment(v10, CFSTR("Inferences"), key, 1u);
      memset(v49, 0, 24);
      CMSampleBufferGetPresentationTimeStamp((CMTime *)v49, v10);
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v13, (uint64_t)CFSTR("Depth"));
      if (AttachedMedia)
      {
        v30 = CMSampleBufferGetImageBuffer(AttachedMedia);
        v47 = *(_OWORD *)v49;
        v48 = *(_QWORD *)&v49[16];
        v31 = BWSampleBufferCreateFromPixelBuffer(v30, (uint64_t)&v47, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&cf);
        p_bufferServicingLock = &self->_bufferServicingLock;
        if (v31)
        {
          v39 = v31;
          fig_log_get_emitter();
          v41 = v4;
          LODWORD(v40) = v39;
          FigDebugAssert3();
        }
        else
        {
          BWSampleBufferSetAttachedMedia(v10, (uint64_t)CFSTR("Depth"), (uint64_t)cf);
          if (self->_smartStyleLearningEnabled)
          {
            v32 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 0);
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v44;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v44 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
                  v38 = BWSampleBufferGetAttachedMedia(v13, v37);
                  BWSampleBufferSetAttachedMedia(v10, v37, v38);
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
              }
              while (v34);
            }
          }
        }
      }
      else
      {
        fig_log_get_emitter();
        v41 = v4;
        LODWORD(v40) = 0;
        FigDebugAssert3();
        p_bufferServicingLock = &self->_bufferServicingLock;
      }
      -[BWRealtimeCinematographyNode _tryToEmit:captureBuffer:]((uint64_t)self, v13, v10);
      if (cf)
        CFRelease(cf);
      -[NSMutableArray removeObject:](self->_videoCaptureSampleBufferQueue, "removeObject:", v10, v40, v41);
      -[NSMutableArray removeObject:](self->_previewSampleBufferQueue, "removeObject:", v13);
    }
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
  else
  {
    -[BWRealtimeCinematographyNode _tryToEmit:captureBuffer:]((uint64_t)self, a3, a3);
  }
}

- (void)_tryToEmit:(void *)a3 captureBuffer:
{
  uint64_t v3;
  _DWORD *v7;
  unint64_t v8;
  const void *v9;
  const __CFString *v10;
  CFTypeRef v11;
  void *v12;
  void *v18;
  double v19;
  __int128 v20;
  uint64_t AttachedMedia;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  CFTypeRef v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double width;
  double height;
  double v62;
  id v63;
  void *v64;
  void *AttachedInferenceResult;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  CVImageBufferRef ImageBuffer;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t k;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  double v90;
  void *v91;
  uint64_t v92;
  const void *v93;
  CGSize v94;
  void *v95;
  uint64_t v96;
  void *v97;
  int v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t m;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  uint64_t v115;
  BWDockKitFocusDetection *v116;
  uint64_t v117;
  void *v118;
  unint64_t v119;
  uint64_t v120;
  _BOOL4 v121;
  _BOOL8 v122;
  _BOOL4 v123;
  _BOOL8 v124;
  _BOOL8 v125;
  _BOOL8 v126;
  int v127;
  int v128;
  opaqueCMSampleBuffer *v129;
  const void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  opaqueCMSampleBuffer *sbuf;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  id value;
  float64x2_t v141;
  id v142;
  __int128 v143;
  uint64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  CGRect v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  CMTime v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[32];
  double v168;
  double v169;
  float64x2_t v170;
  uint64_t v171;
  uint64_t v172;
  float64x2_t v173;
  CMSampleBufferRef sampleBufferOut;
  _QWORD v175[4];
  _QWORD v176[4];
  _BYTE v177[128];
  _QWORD v178[4];
  _QWORD v179[4];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  uint64_t v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;

  v184 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  sampleBufferOut = 0;
  -[BWRealtimeCinematographyNode _updateGlobalMetadata:](a1, a3);
  v8 = 0x1EE6B0000uLL;
  v9 = *(const void **)(a1 + 296);
  if (v9
    && (v10 = (const __CFString *)*MEMORY[0x1E0D05CB0],
        (v11 = CMGetAttachment(v9, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0))
  {
    v12 = (void *)v11;
    v172 = 0;
    v171 = 0;
    __asm { FMOV            V0.2D, #1.0 }
    v141 = _Q0;
    v173 = _Q0;
    FigCFDictionaryGetCGRectIfPresent();
    CMGetAttachment(a2, v10, 0);
    v169 = 0.0;
    v168 = 0.0;
    v170 = v141;
    FigCFDictionaryGetCGRectIfPresent();
    -[BWRealtimeCinematographyNode _updateAlphaLowLightWithMetadata:imageSampleBuffer:](a1, v12, a3);
    if (*(_QWORD *)(a1 + 400) == 1)
    {
      v18 = (void *)objc_msgSend(objc_alloc((Class)getPTTimedRenderingMetadataVersion1Class()), "initWithMinorVersion:", 6);
      objc_msgSend(v18, "setAgc:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D067E0]), "intValue"));
    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc((Class)getPTTimedRenderingMetadataVersion2Class()), "initWithMinorVersion:", 1);
      objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A70]), "floatValue");
      objc_msgSend(v18, "setFocalLenIn35mmFilm:");
      objc_msgSend(v18, "setConversionGain:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06960]), "intValue"));
      objc_msgSend(v18, "setReadNoise_1x:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D48]), "intValue"));
      objc_msgSend(v18, "setReadNoise_8x:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D50]), "intValue"));
      objc_msgSend(v18, "setAGC:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D067E0]), "intValue"));
      objc_msgSend(v18, "setVisCropFactor:", COERCE_DOUBLE(vcvt_f32_f64(vdivq_f64(v141, v173))));
      v20 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *(_OWORD *)v167 = *MEMORY[0x1E0C9D648];
      *(_OWORD *)&v167[16] = v20;
      FigCFDictionaryGetCGRectIfPresent();
      objc_msgSend(v18, "setTotalSensorCropRectSize:", *(_OWORD *)&v167[16]);
    }
    LODWORD(v19) = *(_DWORD *)(a1 + 184);
    value = v18;
    objc_msgSend(v18, "setAlphaLowLight:", v19);
    AttachedMedia = BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 296), (uint64_t)CFSTR("Depth"));
    if (AttachedMedia)
    {
      sbuf = (opaqueCMSampleBuffer *)AttachedMedia;
      v137 = a2;
      *(_BYTE *)(a1 + 284) = 1;
      v139 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v22 = *MEMORY[0x1E0D069A0];
      v23 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
      v24 = *MEMORY[0x1E0D06998];
      v25 = objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
      v142 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v26 = *(id *)(a1 + 104);
      if (v23)
      {

        v26 = v23;
        *(_QWORD *)(a1 + 104) = v26;
      }
      if (v26)
        objc_msgSend(v142, "setObject:forKeyedSubscript:", v26, v22);
      if (v25)
        objc_msgSend(v142, "setObject:forKeyedSubscript:", v25, v24);
      v27 = CMGetAttachment(a3, CFSTR("FTCinematicTrackingResult"), 0);
      v138 = a3;
      if (v27)
      {
        v28 = (void *)v27;
        v29 = (void *)CMGetAttachment(a3, CFSTR("CinematicVideoFocusRequest"), 0);
        if (v29)
        {
          v30 = v29;
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BWIsFocusRequestForHardFocus(v29)), 0x1E4959F38);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BWIsFocusRequestForHardFocus(v30) ^ 1), 0x1E4959F58);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BWIsFocusRequestForFixedPlaneFocus(v30)), 0x1E4959F18);
          if (BWIsFocusRequestForFixedPlaneFocus(v30))
          {
            v31 = (void *)objc_msgSend(objc_alloc((Class)getFTCinematicTapResponseClass()), "init");
            v32 = BWCreateFTCinematicTapRequestFromFocusRequest(v30);
            objc_msgSend(v31, "setRequest:", v32);
            objc_msgSend(v31, "setWasSuccessful:", 1);
            objc_msgSend(v28, "setTapResponse:", v31);

          }
        }
        v33 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 296), CFSTR("FTCinematicTrackingResult"), 0);
        if (v33)
        {
          v34 = v33;
          objc_msgSend(v33, "setDetectorDidRun:", objc_msgSend(v28, "detectorDidRun"));
          v35 = (void *)objc_msgSend((id)objc_msgSend(v28, "tracks"), "mutableCopy");
          v134 = v34;
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "tapResponse"), "tappedTrack"), "isTapSpawned"))
          {
            v36 = objc_msgSend(v35, "indexOfObjectPassingTest:", &__block_literal_global);
            v37 = v34;
            v38 = v36;
            v39 = v37;
            v40 = objc_msgSend((id)objc_msgSend(v37, "tapResponse"), "tappedTrack");
            if (v38 == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v35, "addObject:", v40);
            else
              objc_msgSend(v35, "replaceObjectAtIndex:withObject:", v38, v40);
            v34 = v39;
          }
          else if (objc_msgSend((id)objc_msgSend(v34, "tapResponse"), "tappedTrack"))
          {
            v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "tapResponse"), "tappedTrack"), "identifier");
            v163 = 0u;
            v164 = 0u;
            v165 = 0u;
            v166 = 0u;
            v42 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v163, v183, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v164;
LABEL_27:
              v45 = 0;
              while (1)
              {
                if (*(_QWORD *)v164 != v44)
                  objc_enumerationMutation(v35);
                v46 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * v45);
                if (objc_msgSend(v46, "identifier") == v41)
                  break;
                if (v43 == ++v45)
                {
                  v43 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v163, v183, 16);
                  if (v43)
                    goto LABEL_27;
                  goto LABEL_38;
                }
              }
              if (!v46)
                goto LABEL_38;
              v34 = v134;
              objc_msgSend((id)objc_msgSend(v134, "tapResponse"), "setTappedTrack:", v46);
            }
            else
            {
LABEL_38:
              v34 = v134;
              objc_msgSend((id)objc_msgSend(v134, "tapResponse"), "setTappedTrack:", 0);
              objc_msgSend((id)objc_msgSend(v134, "tapResponse"), "setWasSuccessful:", 0);
            }
            a3 = v138;
          }
          else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "tapResponse"), "tappedTrack"), "isTapSpawned"))
          {
            objc_msgSend(v35, "removeObject:", objc_msgSend((id)objc_msgSend(v28, "tapResponse"), "tappedTrack"));
            v47 = objc_msgSend((id)objc_msgSend(v34, "tracks"), "indexOfObjectPassingTest:", &__block_literal_global_64);
            if (v47 != 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v35, "addObject:", objc_msgSend((id)objc_msgSend(v34, "tracks"), "objectAtIndexedSubscript:", v47));
          }
          if (objc_msgSend(v34, "tapResponse"))
            v48 = objc_msgSend((id)objc_msgSend(v34, "tapResponse"), "wasSuccessful") ^ 1;
          else
            v48 = 0;
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v48), 0x1E4959F78);
          objc_msgSend(v34, "setTracks:", v35);

          v161 = 0u;
          v162 = 0u;
          v159 = 0u;
          v160 = 0u;
          v49 = (void *)objc_msgSend(v34, "tracks");
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v159, v182, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v160;
            v53 = MEMORY[0x1E0C9AAB0];
            do
            {
              for (i = 0; i != v51; ++i)
              {
                if (*(_QWORD *)v160 != v52)
                  objc_enumerationMutation(v49);
                v55 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
                objc_msgSend(v55, "box");
                v185.origin.x = FigCaptureTransformRectToCoordinateSpaceOfRect(v56, v57, v58, v59, v168, v169, v170.f64[0]);
                width = v185.size.width;
                height = v185.size.height;
                v187.origin.x = 0.0;
                v187.origin.y = 0.0;
                v187.size.width = 1.0;
                v187.size.height = 1.0;
                v186 = CGRectIntersection(v185, v187);
                v62 = v186.size.width * v186.size.height;
                if (v186.size.width * v186.size.height <= width * height * 0.5)
                {
                  if (objc_msgSend(v55, "metadata", v62))
                    v63 = (id)objc_msgSend((id)objc_msgSend(v55, "metadata"), "mutableCopy");
                  else
                    v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v64 = v63;
                  objc_msgSend(v63, "setObject:forKeyedSubscript:", v53, getPTCinematographyExcludeAsCinematicChoice());
                  objc_msgSend(v55, "setMetadata:", v64);

                }
              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v159, v182, 16, v62);
            }
            while (v51);
            v28 = v134;
            a3 = v138;
            v8 = 0x1EE6B0000;
          }
          else
          {
            v28 = v34;
          }
        }
        objc_msgSend(v142, "setObject:forKeyedSubscript:", v28, 0x1E4959C58);
      }
      AttachedInferenceResult = (void *)BWInferenceGetAttachedInferenceResult(*(const void **)(a1 + *(int *)(v8 + 1488)), 151);
      v66 = (void *)objc_msgSend((id)CMGetAttachment(a3, CFSTR("FusionTrackerInput"), 0), "input");
      v67 = 0;
      v136 = v12;
      if (objc_msgSend(AttachedInferenceResult, "inferences") && v66)
      {
        v68 = objc_msgSend((id)objc_msgSend(AttachedInferenceResult, "inferences"), "objectForKeyedSubscript:", 0x1E4951578);
        v69 = (void *)(*(uint64_t (**)(uint64_t, void *))(v68 + 16))(v68, v66);
        if (objc_msgSend(v69, "count"))
        {
          v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v69, "count"));
          v155 = 0u;
          v156 = 0u;
          v157 = 0u;
          v158 = 0u;
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v155, v181, 16);
          if (v70)
          {
            v71 = v70;
            v72 = *(_QWORD *)v156;
            do
            {
              for (j = 0; j != v71; ++j)
              {
                if (*(_QWORD *)v156 != v72)
                  objc_enumerationMutation(v69);
                v74 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * j);
                if (!objc_msgSend(v67, "objectForKeyedSubscript:", v74))
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1), v74);
                objc_msgSend((id)objc_msgSend(v67, "objectForKeyedSubscript:", v74), "addEntriesFromDictionary:", objc_msgSend(v69, "objectForKeyedSubscript:", v74));
              }
              v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v155, v181, 16);
            }
            while (v71);
            v12 = v136;
          }
        }
        else
        {
          v67 = 0;
        }
        objc_msgSend(v66, "detectorDidRun");

      }
      if (objc_msgSend(v67, "count"))
        objc_msgSend(v142, "setObject:forKeyedSubscript:", v67, CFSTR("MLSignals"));

      v75 = *MEMORY[0x1E0D06AA0];
      v76 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AA0]);
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v76, "lastObject"), v75);
      objc_msgSend(v142, "setObject:forKeyedSubscript:", v76, CFSTR("FocusRegionArray"));
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 280)), CFSTR("FocusMode"));
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A80]), *MEMORY[0x1E0D06A80]);
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06DF0]), *MEMORY[0x1E0D06DF0]);
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40]), *MEMORY[0x1E0D06D40]);
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]), *MEMORY[0x1E0D06D38]);
      ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
      v78 = *(void **)(a1 + 96);
      CMSampleBufferGetPresentationTimeStamp(&v154, sbuf);
      v79 = (void *)objc_msgSend(v78, "processColorBuffer:disparityBuffer:metadataDictionary:presentationTime:", 0, ImageBuffer, v142, &v154);

      v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v150 = 0u;
      v151 = 0u;
      v152 = 0u;
      v153 = 0u;
      v81 = (void *)objc_msgSend(v79, "allDetections");
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v150, v180, 16);
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v151;
        do
        {
          for (k = 0; k != v83; ++k)
          {
            if (*(_QWORD *)v151 != v84)
              objc_enumerationMutation(v81);
            v86 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * k);
            if (objc_msgSend(v86, "detectionType") == 102)
            {
              v87 = objc_msgSend(v86, "trackIdentifier");
              if (v87 != objc_msgSend((id)objc_msgSend(v79, "focusDetection"), "trackIdentifier"))
                continue;
            }
            objc_msgSend(v80, "addObject:", v86);
          }
          v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v150, v180, 16);
        }
        while (v83);
      }
      v88 = (void *)objc_msgSend(v80, "copy");
      objc_msgSend(v79, "setAllDetections:", v88);

      objc_setAssociatedObject(v79, CFSTR("CinematicVideoTimedRenderingMetadata"), value, (void *)1);
      v178[0] = 0x1E4959DB8;
      v89 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v79, "aperture");
      v179[0] = objc_msgSend(v89, "numberWithFloat:");
      v178[1] = 0x1E4959DD8;
      LODWORD(v90) = *(_DWORD *)(a1 + 184);
      v179[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v90);
      v178[2] = 0x1E4959DF8;
      v91 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v79, "focusDistance");
      v92 = objc_msgSend(v91, "numberWithFloat:");
      v178[3] = 0x1E4959E18;
      v179[2] = v92;
      v179[3] = v79;
      v93 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v179, v178, 4);
      CMSetAttachment(a2, CFSTR("CinematicVideoCinematographyMetadata"), v93, 1u);
      v94 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v149.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v149.size = v94;
      FigCFDictionaryGetCGRectIfPresent();
      if (CGRectIsNull(v149))
        goto LABEL_99;
      a3 = v138;
      if (!v79)
        goto LABEL_100;
      v95 = (void *)objc_msgSend(v79, "copy");
      v96 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", objc_msgSend(v95, "allDetections"), 1);
      if (v96)
      {
        v97 = (void *)v96;
        objc_msgSend(v95, "setAllDetections:", v96);
        objc_setAssociatedObject(v95, CFSTR("CinematicVideoTimedRenderingMetadata"), value, (void *)1);
        v98 = BWPixelBufferDimensionsFromSampleBuffer(*(opaqueCMSampleBuffer **)(a1 + 296));
        v149.origin.x = FigCaptureMetadataUtilitiesRectNormalizedToRect(v149.origin.x, v149.origin.y, v149.size.width, v149.size.height, 0.0, 0.0, (double)v98);
        v149.origin.y = v99;
        v149.size.width = v100;
        v149.size.height = v101;
        v145 = 0u;
        v146 = 0u;
        v147 = 0u;
        v148 = 0u;
        v102 = (void *)objc_msgSend(v95, "allDetections");
        v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v145, v177, 16);
        if (v103)
        {
          v104 = v103;
          v105 = *(_QWORD *)v146;
          do
          {
            for (m = 0; m != v104; ++m)
            {
              if (*(_QWORD *)v146 != v105)
                objc_enumerationMutation(v102);
              v107 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * m);
              objc_msgSend(v107, "rect");
              objc_msgSend(v107, "setRect:", FigCaptureTransformNormalizedRectFromCoordinateSpaceOfNormalizedRect(v108, v109, v110, v111, v149.origin.x, v149.origin.y, v149.size.width));
            }
            v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v145, v177, 16);
          }
          while (v104);
        }
        v175[0] = 0x1E4959DB8;
        v112 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v79, "aperture");
        v176[0] = objc_msgSend(v112, "numberWithFloat:");
        v175[1] = 0x1E4959DD8;
        LODWORD(v113) = *(_DWORD *)(a1 + 184);
        v176[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v113);
        v175[2] = 0x1E4959DF8;
        v114 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v79, "focusDistance");
        v115 = objc_msgSend(v114, "numberWithFloat:");
        v175[3] = 0x1E4959E18;
        v176[2] = v115;
        v176[3] = v95;
        v93 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v176, v175, 4);

        a2 = v137;
LABEL_99:
        a3 = v138;
LABEL_100:
        CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 296), CFSTR("CinematicVideoCinematographyMetadata"), v93, 1u);
        if (*(_BYTE *)(a1 + 436) && objc_msgSend(v79, "focusDetection"))
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 432));
          objc_msgSend(*(id *)(a1 + 424), "removeAllObjects");
          v116 = [BWDockKitFocusDetection alloc];
          v117 = objc_msgSend((id)objc_msgSend(v79, "focusDetection"), "trackIdentifier");
          objc_msgSend((id)objc_msgSend(v79, "focusDetection"), "rect");
          objc_msgSend(*(id *)(a1 + 424), "addObject:", -[BWDockKitFocusDetection initWithIdentifier:rect:](v116, "initWithIdentifier:rect:", v117));
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 432));
        }
        -[BWRealtimeCinematographyNode _updateAutoFocus:finalCropRect:](a1, v79, v168, v169, v170.f64[0], v170.f64[1]);
        if (objc_msgSend(v79, "focusDetection"))
        {
          v118 = (void *)objc_msgSend(v79, "focusDetection");
          v119 = objc_msgSend(v118, "detectionType");
          v120 = objc_msgSend(v118, "trackIdentifier");
          v121 = v119 && v120 != *(_QWORD *)(a1 + 408);
          v122 = v119 < 0xD && (unint64_t)v121;
          v123 = v119 > 0x63 && v120 != *(_QWORD *)(a1 + 408);
          v124 = v119 < 0x67 && (unint64_t)v123;
          v125 = v119 == 102 && (unint64_t)(v120 != *(_QWORD *)(a1 + 408));
          v126 = v119 == 100 && (unint64_t)(v120 != *(_QWORD *)(a1 + 408));
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v122), 0x1E4959F98);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v124), 0x1E4959FB8);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v125), 0x1E4959FD8);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v126), 0x1E4959FF8);
          if (v120 != *(_QWORD *)(a1 + 408))
            *(_QWORD *)(a1 + 408) = v120;
        }
        if (objc_msgSend(v139, "count"))
          CMSetAttachment(a3, CFSTR("CinematicVideoMovieFileRecordingStats"), v139, 1u);

        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a3, &sampleBufferOut);
        v127 = objc_msgSend(*(id *)(a1 + 136), "depthType");
        v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        if (v127 != 3
          || (v128 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 136), "masterCaptureStream"), "videoCaptureDimensions"),
              v129 = (opaqueCMSampleBuffer *)a2,
              v128 != 3840))
        {
          v129 = (opaqueCMSampleBuffer *)a3;
        }
        -[BWRealtimeCinematographyNode _emitSampleBufferOnMetadataOutput:cinematographyFrame:](a1, v129, v79);
        objc_msgSend(*(id *)(a1 + 112), "emitSampleBuffer:", *(_QWORD *)(a1 + 296));
        goto LABEL_130;
      }
      fig_log_get_emitter();
      v133 = v3;
      LODWORD(v132) = 0;
      FigDebugAssert3();
      v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
    else
    {
      fig_log_get_emitter();
      v133 = v3;
      LODWORD(v132) = 0;
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    v133 = v3;
    LODWORD(v132) = 0;
    FigDebugAssert3();
    value = 0;
  }
  BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a3, &sampleBufferOut);
  if (*(_QWORD *)(a1 + 296))
    -[BWRealtimeCinematographyNode _emitMovieFileDropForPreviousSampleBuffer](a1);
  if (*(_BYTE *)(a1 + 284))
  {
    memset(v167, 0, 24);
    CMSampleBufferGetPresentationTimeStamp((CMTime *)v167, (CMSampleBufferRef)a2);
    v143 = *(_OWORD *)v167;
    v144 = *(_QWORD *)&v167[16];
    v131 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F138, &v143, v132, v133);
    objc_msgSend(*(id *)(a1 + 120), "emitDroppedSample:", v131);

    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(*(id *)(a1 + 120), "emitSampleBuffer:", a2, v132, v133);
LABEL_131:
  v130 = *(const void **)(a1 + 296);
  if (v130)
    CFRelease(v130);
  *(_QWORD *)(a1 + 296) = sampleBufferOut;

  if (*v7 == 1)
    kdebug_trace();
}

- (uint64_t)_updateGlobalMetadata:(uint64_t)result
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  __CVBuffer *ImageBuffer;
  OSType PixelFormatType;
  int IsTenBit;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *PTTuningParametersClass;
  uint64_t v29;
  __CVBuffer *v30;
  __CVBuffer *v31;
  unsigned int Width;
  float64x2_t v33;
  float64x2_t v34;
  __int128 v35;
  __int128 v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (!*(_BYTE *)(result + 392))
    {
      if ((objc_msgSend(*(id *)(result + 96), "getGlobalMetadata:", *(_QWORD *)(result + 352)) & 1) != 0)
      {
        v4 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 136), "cameraInfoByPortType"), "objectForKeyedSubscript:", objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
        v6 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06DE8]);
        ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
        PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
        IsTenBit = FigCapturePixelFormatIsTenBit(PixelFormatType);
        v10 = *(void **)(v2 + 360);
        if (*(_QWORD *)(v2 + 400) != 1)
        {
          PTTuningParametersClass = (void *)getPTTuningParametersClass();
          objc_msgSend(v10, "setHwModelID:", objc_msgSend(PTTuningParametersClass, "hwModelIDFromFigModelSpecificName:", FigCaptureGetModelSpecificName()));
          objc_msgSend(v10, "setSensorID:", objc_msgSend(v6, "intValue"));
          goto LABEL_16;
        }
        objc_msgSend(v10, "setSensorID:", objc_msgSend(v6, "intValue"));
        v11 = (void *)getPTTuningParametersClass();
        objc_msgSend(v10, "setHwModelID:", objc_msgSend(v11, "hwModelIDFromFigModelSpecificName:", FigCaptureGetModelSpecificName()));
        objc_msgSend((id)getPTTuningParametersClass(), "noiseScaleFactorForHwModelID:sensorID:", objc_msgSend(v10, "hwModelID"), objc_msgSend(v10, "sensorID"));
        objc_msgSend(v10, "setNoiseScaleFactor:");
        v12 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D058E0]);
        if (v12)
        {
          v13 = v12;
          if (objc_msgSend(v12, "length") == 48)
          {
            objc_msgSend(v13, "getBytes:length:", &v37, 48);
            v14 = vzip1q_s32(v37, v39);
            v15 = vzip2q_s32(v37, v39);
            v16 = vzip2q_s32(v38, (int32x4_t)0);
            objc_msgSend(v10, "setExtrinsicsMatrix:", *(double *)vzip1q_s32(v14, v38).i64, *(double *)vzip2q_s32(v14, vdupq_lane_s32(*(int32x2_t *)v38.i8, 1)).i64, *(double *)vzip1q_s32(v15, v16).i64, *(double *)vzip2q_s32(v15, v16).i64);
            v35 = *MEMORY[0x1E0C9D648];
            v36 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
            if (!FigCFDictionaryGetCGRectIfPresent())
              goto LABEL_25;
            objc_msgSend(v10, "setSensorCropRect:", v35, v36);
            v17 = *MEMORY[0x1E0D06A70];
            if (!objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A70]))
              goto LABEL_25;
            objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v17), "floatValue");
            objc_msgSend(v10, "setFocalLength35mm:");
            v18 = *MEMORY[0x1E0D06D40];
            if (!objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40])
              || (v19 = *MEMORY[0x1E0D06D38], !objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]))
              || (objc_msgSend(v10, "setRawSensorSize:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v18), "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v19), "intValue") << 32)), v20 = *MEMORY[0x1E0D06960], !objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06960]))|| (objc_msgSend(v10, "setConversionGain:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v20), "intValue")), v21 = *MEMORY[0x1E0D06D48], !objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D48]))|| (objc_msgSend(v10, "setReadNoise1x:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v21), "intValue")), v22 = *MEMORY[0x1E0D06D50], !objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D50])))
            {
LABEL_25:
              fig_log_get_emitter();
              return FigDebugAssert3();
            }
            objc_msgSend(v10, "setReadNoise8x:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v22), "intValue"));
            __asm { FMOV            V0.2D, #1.0 }
            v33 = _Q0;
            v34 = _Q0;
            FigCFDictionaryGetCGRectIfPresent();
            objc_msgSend(v10, "setVisCropFactor:", COERCE_DOUBLE(vcvt_f32_f64(vdivq_f64(v33, v34))));
LABEL_16:
            if (IsTenBit)
              v29 = 10;
            else
              v29 = 8;
            objc_msgSend(v10, "setSourceColorBitDepth:", v29);
            v30 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
            if (v30)
            {
              v31 = v30;
              Width = CVPixelBufferGetWidth(v30);
              result = objc_msgSend(*(id *)(v2 + 368), "setOriginalVideoDimensions:", Width | ((unint64_t)CVPixelBufferGetHeight(v31) << 32));
              *(_BYTE *)(v2 + 392) = 1;
              return result;
            }
            goto LABEL_25;
          }
        }
      }
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
  }
  return result;
}

uint64_t __57__BWRealtimeCinematographyNode__tryToEmit_captureBuffer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isTapSpawned");
}

uint64_t __57__BWRealtimeCinematographyNode__tryToEmit_captureBuffer___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isTapSpawned");
}

- (uint64_t)_updateAutoFocus:(double)a3 finalCropRect:(double)a4
{
  uint64_t v6;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  CGRect v36;

  if (result)
  {
    v6 = result;
    if (*(_BYTE *)(result + 200))
    {
      *(_DWORD *)(result + 204) = (*(_DWORD *)(result + 204) + 1) % *(_DWORD *)(result + 208);
      if (!*(_DWORD *)(result + 204))
      {
        objc_msgSend((id)objc_msgSend(a2, "focusDetection"), "rect");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        result = objc_msgSend((id)objc_msgSend(a2, "focusDetection"), "detectionType");
        v22 = *(_DWORD *)(v6 + 280);
        if (v22 != 1 && result == 100)
        {
          objc_msgSend(*(id *)(v6 + 136), "defaultContinuousAutoFocusWindowSize");
          v24 = 0.5 - v23 * 0.5;
          objc_msgSend(*(id *)(v6 + 136), "defaultContinuousAutoFocusWindowSize");
          v26 = 0.5 - v25 * 0.5;
          objc_msgSend(*(id *)(v6 + 136), "defaultContinuousAutoFocusWindowSize");
          v28 = v27;
          objc_msgSend(*(id *)(v6 + 136), "defaultContinuousAutoFocusWindowSize");
          v29 = 1;
          LODWORD(v30) = 1.0;
          LODWORD(v31) = 0;
          result = objc_msgSend(*(id *)(v6 + 136), "setFocusModeAutoWithRect:restrictToRect:continuous:smooth:rangeRestrictionNear:rangeRestrictionFar:isFocusRectInOverscanSpace:", 0, 1, 0, 0, v24, v26, v28, v32, v30, v31);
LABEL_7:
          *(_DWORD *)(v6 + 280) = v29;
          return result;
        }
        if (result == 101)
        {
          v36.origin.x = v13;
          v36.origin.y = v15;
          v36.size.width = v17;
          v36.size.height = v19;
          result = CGRectEqualToRect(v36, *(CGRect *)(v6 + 216));
          if ((result & 1) == 0)
          {
            *(double *)(v6 + 216) = v13;
            *(double *)(v6 + 224) = v15;
            *(double *)(v6 + 232) = v17;
            *(double *)(v6 + 240) = v19;
            *(double *)(v6 + 248) = a3;
            *(double *)(v6 + 256) = a4;
            *(double *)(v6 + 264) = a5;
            *(double *)(v6 + 272) = a6;
            LODWORD(v33) = 1.0;
            LODWORD(v34) = 0;
            result = objc_msgSend(*(id *)(v6 + 136), "setFocusModeAutoWithRect:restrictToRect:continuous:smooth:rangeRestrictionNear:rangeRestrictionFar:isFocusRectInOverscanSpace:", 0, 0, 0, 1, v13, v15, v17, v19, v33, v34);
            v29 = 2;
            goto LABEL_7;
          }
        }
        else if ((unint64_t)(result - 102) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v35 = *(void **)(v6 + 136);
          if (v22 == 3)
          {
            result = objc_msgSend(v35, "setContinuousAutoFocusRect:isFocusRectInOverscanSpace:", 1, v13, v15, v17, v19);
          }
          else
          {
            LODWORD(v20) = 1.0;
            LODWORD(v21) = 0;
            result = objc_msgSend(v35, "setFocusModeAutoWithRect:restrictToRect:continuous:smooth:rangeRestrictionNear:rangeRestrictionFar:isFocusRectInOverscanSpace:", 1, 1, 0, 1, v13, v15, v17, v19, v20, v21);
          }
          v29 = 3;
          goto LABEL_7;
        }
      }
    }
  }
  return result;
}

- (void)_emitSampleBufferOnMetadataOutput:(void *)a3 cinematographyFrame:
{
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  CFDictionaryRef DictionaryRepresentation;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _BOOL8 v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  double v84;
  CMSampleTimingInfo sampleTimingArray;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[2];
  _QWORD v105[2];
  _BYTE v106[128];
  _BYTE v107[128];
  _QWORD v108[3];
  _QWORD v109[3];
  CMAttachmentBearerRef target[18];
  CGRect v111;
  CGRect v112;

  target[16] = *(CMAttachmentBearerRef *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a1;
    memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E18];
    sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, sbuf);
    sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
    v6 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v7 = (void *)objc_msgSend((id)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
    v8 = v7;
    if (a3)
    {
      v68 = *MEMORY[0x1E0D069A0];
      v9 = objc_msgSend(v7, "objectForKeyedSubscript:");
      if (v9)
      {
        v10 = (void *)v9;
        v82 = a3;
        v65 = v6;
        v66 = v8;
        __asm { FMOV            V0.2D, #1.0 }
        v84 = *(double *)&_Q0;
        FigCFDictionaryGetCGRectIfPresent();
        v67 = v5;
        v16 = *(double *)(v5 + 248);
        v17 = *(double *)(v5 + 256);
        v18 = *(double *)(v5 + 264);
        v80 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        obj = v10;
        v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v98, target, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v99;
          v22 = *MEMORY[0x1E0D06F20];
          v23 = *MEMORY[0x1E0D064D8];
          v24 = *MEMORY[0x1E0D064D0];
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v99 != v21)
                objc_enumerationMutation(obj);
              v26 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i);
              v108[0] = v22;
              v27 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(a3, "time");
              v109[0] = objc_msgSend(v27, "numberWithLongLong:", v97);
              v108[1] = v23;
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(a3, "time");
              v109[1] = objc_msgSend(v28, "numberWithLongLong:", v96);
              v108[2] = v24;
              v109[2] = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              objc_msgSend(v80, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 3), v26);
            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, target, 16);
          }
          while (v20);
        }
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v29 = a3;
        v75 = (id)objc_msgSend(a3, "allDetections");
        v30 = obj;
        v79 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
        if (v79)
        {
          v78 = *(_QWORD *)v93;
          v76 = *MEMORY[0x1E0D064D0];
          v31 = *MEMORY[0x1E0D06460];
          v83 = *MEMORY[0x1E0D06A48];
          v74 = *MEMORY[0x1E0D064C0];
          v73 = *MEMORY[0x1E0D06D58];
          v70 = *MEMORY[0x1E0D05988];
          v69 = *MEMORY[0x1E0D05980];
          v72 = *MEMORY[0x1E0D06F20];
          v71 = *MEMORY[0x1E0D064D8];
          do
          {
            for (j = 0; j != v79; ++j)
            {
              if (*(_QWORD *)v93 != v78)
                objc_enumerationMutation(v75);
              v33 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
              v34 = objc_msgSend(v33, "detectionType");
              v35 = (uint64_t *)MEMORY[0x1E0D064A0];
              switch(v34)
              {
                case 1:
                  goto LABEL_25;
                case 2:
                  v35 = (uint64_t *)MEMORY[0x1E0D064B8];
                  goto LABEL_25;
                case 3:
                  v35 = (uint64_t *)MEMORY[0x1E0D06498];
                  goto LABEL_25;
                case 4:
                  v35 = (uint64_t *)MEMORY[0x1E0D06478];
                  goto LABEL_25;
                case 5:
                  v35 = (uint64_t *)MEMORY[0x1E0D06488];
                  goto LABEL_25;
                case 6:
                case 7:
                case 8:
                  continue;
                case 9:
                  v35 = (uint64_t *)MEMORY[0x1E0D06480];
                  goto LABEL_25;
                case 10:
                  v35 = (uint64_t *)MEMORY[0x1E0D06490];
                  goto LABEL_25;
                case 11:
                  goto LABEL_19;
                default:
                  if ((unint64_t)(v34 - 101) >= 2)
                    continue;
LABEL_19:
                  v35 = (uint64_t *)MEMORY[0x1E0D064C0];
LABEL_25:
                  v36 = *v35;
                  if (!*v35)
                    continue;
                  v81 = *v35;
                  if (!objc_msgSend(v30, "objectForKeyedSubscript:", *v35))
                    goto LABEL_39;
                  v90 = 0u;
                  v91 = 0u;
                  v88 = 0u;
                  v89 = 0u;
                  v37 = (void *)objc_msgSend((id)objc_msgSend(v30, "objectForKeyedSubscript:", v36), "objectForKeyedSubscript:", v76);
                  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
                  if (!v38)
                    goto LABEL_39;
                  v39 = v38;
                  v40 = *(_QWORD *)v89;
                  break;
              }
LABEL_29:
              v41 = 0;
              while (1)
              {
                if (*(_QWORD *)v89 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v41);
                v43 = (void *)objc_msgSend(v42, "objectForKeyedSubscript:", v31);
                if (v43 || (v43 = (void *)objc_msgSend(v42, "objectForKeyedSubscript:", v83)) != 0)
                {
                  v44 = objc_msgSend(v33, "trackIdentifier");
                  if (v44 == objc_msgSend(v43, "unsignedIntegerValue"))
                    break;
                }
                if (v39 == ++v41)
                {
                  v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
                  v36 = v81;
                  v29 = v82;
                  v30 = obj;
                  if (v39)
                    goto LABEL_29;
                  goto LABEL_39;
                }
              }
              v45 = (void *)objc_msgSend(v42, "mutableCopy");
              v36 = v81;
              v29 = v82;
              v30 = obj;
              if (v45)
                goto LABEL_43;
LABEL_39:
              if (v36 != v74)
                continue;
              objc_msgSend(v33, "rect");
              DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v111);
              v47 = objc_alloc(MEMORY[0x1E0C99E08]);
              v104[0] = v31;
              v48 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v33, "trackIdentifier"));
              v104[1] = v73;
              v105[0] = v48;
              v105[1] = DictionaryRepresentation;
              v45 = (void *)objc_msgSend(v47, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 2));
              if (DictionaryRepresentation)
                CFRelease(DictionaryRepresentation);
              v36 = v81;
LABEL_43:
              if (objc_msgSend(v29, "focusDetection"))
              {
                v49 = objc_msgSend(v33, "trackIdentifier");
                _ZF = v49 == objc_msgSend((id)objc_msgSend(v29, "focusDetection"), "trackIdentifier");
                v36 = v81;
                if (_ZF)
                {
                  objc_msgSend(v45, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v29, "isFocusStrong")), v70);
                  v50 = (void *)MEMORY[0x1E0CB37E8];
                  v51 = objc_msgSend((id)objc_msgSend(v29, "focusDetection"), "detectionType") == 101;
                  v52 = v50;
                  v36 = v81;
                  objc_msgSend(v45, "setObject:forKeyedSubscript:", objc_msgSend(v52, "numberWithInt:", v51), v69);
                  if (objc_msgSend((id)objc_msgSend(v29, "focusDetection"), "detectionType") == 101)
                  {
                    objc_msgSend(v33, "rect");
                    v57 = FigCaptureTransformRectToCoordinateSpaceOfRect(v53, v54, v55, v56, v16, v17, v18);
                    v112.origin.x = FigCaptureTransformNormalizedRectFromCoordinateSpaceOfNormalizedRect(v57, v58, v59, v60, 0.0, 0.0, v84);
                    objc_msgSend(v45, "setObject:forKeyedSubscript:", CGRectCreateDictionaryRepresentation(v112), v73);
                  }
                }
              }
              v61 = v80;
              if (!objc_msgSend(v80, "objectForKeyedSubscript:", v36))
              {
                v102[0] = v72;
                v62 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v29, "time");
                v103[0] = objc_msgSend(v62, "numberWithLongLong:", v87);
                v102[1] = v71;
                v63 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v29, "time");
                v64 = v63;
                v61 = v80;
                v103[1] = objc_msgSend(v64, "numberWithLongLong:", v86);
                v102[2] = v76;
                v103[2] = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                objc_msgSend(v80, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 3), v36);
              }
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v61, "objectForKeyedSubscript:", v36), "objectForKeyedSubscript:", v76), "addObject:", v45);

            }
            v79 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
          }
          while (v79);
        }
        v8 = v66;
        objc_msgSend(v66, "setObject:forKeyedSubscript:", v80, v68);

        v5 = v67;
        v6 = v65;
      }
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D06998]);
    }
    target[0] = 0;
    if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)target)&& target[0])
    {
      CMSetAttachment(target[0], v6, v8, 1u);
      objc_msgSend(*(id *)(v5 + 128), "emitSampleBuffer:", target[0]);
    }

    if (target[0])
      CFRelease(target[0]);
  }
}

- (NSData)globalMetadata
{
  unsigned int v3;
  NSData *v4;

  -[PTGlobalVideoMetadata setMetadata:ofType:](self->_globalMetadata, "setMetadata:ofType:", self->_globalCinematographyMetadata, 4);
  -[PTGlobalVideoMetadata setMetadata:ofType:](self->_globalMetadata, "setMetadata:ofType:", self->_globalRenderingMetadata, 2);
  -[PTGlobalVideoMetadata setMetadata:ofType:](self->_globalMetadata, "setMetadata:ofType:", self->_globalStabilizationMetadata, 3);
  -[PTGlobalVideoMetadata setMetadata:ofType:](self->_globalMetadata, "setMetadata:ofType:", self->_globalVideoHeaderMetadata, 1);
  v3 = -[PTGlobalVideoMetadata sizeOfSerializedObjectWithOptions:](self->_globalMetadata, "sizeOfSerializedObjectWithOptions:", 0);
  v4 = (NSData *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v3);
  -[PTGlobalVideoMetadata writeToData:withOptions:](self->_globalMetadata, "writeToData:withOptions:", v4, 0);
  return v4;
}

- (BWNodeOutput)detectedObjectsOutput
{
  return self->_detectedObjectsOutput;
}

- (NSString)cinematographyModelVersionString
{
  return (NSString *)-[PTCinematographyStream modelVersionString](self->_cinematographyStream, "modelVersionString");
}

- (id)copyCinematicVideoFocusDetections
{
  os_unfair_lock_s *p_focusDetectionsLock;
  void *v4;

  p_focusDetectionsLock = &self->_focusDetectionsLock;
  os_unfair_lock_lock(&self->_focusDetectionsLock);
  v4 = (void *)-[NSMutableArray copy](self->_focusDetections, "copy");
  os_unfair_lock_unlock(p_focusDetectionsLock);
  return v4;
}

- (void)setFocusDetectionProviderEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_focusDetectionsLock;

  p_focusDetectionsLock = &self->_focusDetectionsLock;
  os_unfair_lock_lock(&self->_focusDetectionsLock);
  self->_focusDetectionProviderEnabled = a3;
  os_unfair_lock_unlock(p_focusDetectionsLock);
}

- (BOOL)focusDetectionProviderEnabled
{
  return self->_focusDetectionProviderEnabled;
}

- (BWNodeOutput)previewOutput
{
  return self->_previewOutput;
}

- (BWNodeOutput)movieFileOutput
{
  return self->_movieFileOutput;
}

@end
