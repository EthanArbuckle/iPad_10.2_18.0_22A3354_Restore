@implementation BWStillImageSampleBufferSinkNode

- (void)setStillImageCapturePipeliningMode:(int)a3
{
  self->_stillImageCapturePipeliningMode = a3;
}

- (void)setSampleBufferAvailableHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3
{
  self->_focusPixelBlurScoreEnabled = a3;
}

- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3
{
  self->_deferredPhotoProcessorEnabled = a3;
}

- (void)setClientIsCameraOrDerivative:(BOOL)a3
{
  self->_clientIsCameraOrDerivative = a3;
}

- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3
{
  self->_captureTimePhotosCurationSupported = a3;
}

- (void)setAnalyticsConfiguration:(id)a3
{
  self->_analyticsConfiguration = (BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)a3;
}

- (void)setPropagatedAttachedMediaKeys:(id)a3
{
  NSArray *propagatedAttachedMediaKeys;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  BWNodeInputMediaConfiguration *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray isEqualToArray:](self->_propagatedAttachedMediaKeys, "isEqualToArray:"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    propagatedAttachedMediaKeys = self->_propagatedAttachedMediaKeys;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](propagatedAttachedMediaKeys, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(propagatedAttachedMediaKeys);
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super.super._input, "setMediaConfiguration:forAttachedMediaKey:", 0, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](propagatedAttachedMediaKeys, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v10 = (NSArray *)objc_msgSend(a3, "copy");
    self->_propagatedAttachedMediaKeys = v10;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
          v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 1);
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super.super._input, "setMediaConfiguration:forAttachedMediaKey:", v16, v15);
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }
  }
}

- (BWStillImageSampleBufferSinkNode)initWithSinkID:(id)a3
{
  return -[BWStillImageSampleBufferSinkNode initWithInputMediaType:sinkID:](self, "initWithInputMediaType:sinkID:", 1986618469, a3);
}

- (BWStillImageSampleBufferSinkNode)initWithInputMediaType:(unsigned int)a3 sinkID:(id)a4
{
  uint64_t v4;
  BWStillImageSampleBufferSinkNode *v5;
  BWNodeInput *v6;
  BWVideoFormatRequirements *v7;
  objc_super v9;

  v4 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)BWStillImageSampleBufferSinkNode;
  v5 = -[BWSinkNode initWithSinkID:](&v9, sel_initWithSinkID_, a4);
  if (v5)
  {
    v6 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", v4, v5);
    if ((_DWORD)v4 == 1986618469)
    {
      v7 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setMemoryPoolUseAllowed:](v7, "setMemoryPoolUseAllowed:", 0);
      -[BWNodeInput setFormatRequirements:](v6, "setFormatRequirements:", v7);

    }
    -[BWNode addInput:](v5, "addInput:", v6);

  }
  return v5;
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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageSampleBufferSinkNode;
  -[BWSinkNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("SampleBuffer");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  BWStillImageFocusPixelBlurScoreResult *v7;
  void *v8;
  __int16 v9;
  void (**sampleBufferAvailableHandler)(id, opaqueCMSampleBuffer *, _QWORD, uint64_t);
  BOOL v11;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  BWNodeSanitizeMetadataIfNecessary(a3);
  -[BWStillImageSampleBufferSinkNode _attachPrivateClientMetadataToSampleBuffer:](self, a3);
  if (self->_focusPixelBlurScoreEnabled)
  {
    v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v7 = BWFocusPixelBlurScoreForMetadata(v6);
    CMSetAttachment(a3, CFSTR("FocusPixelBlurScoreResult"), v7, 1u);
  }
  v8 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  v9 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
  if ((v9 & 0x1000) != 0
    && (objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureFlags") & 4) != 0
    && self->_stillImageCapturePipeliningMode != 2)
  {
    -[BWDeferredCaptureContainerManager containerWaitForFlush:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "containerWaitForFlush:", objc_msgSend((id)objc_msgSend(v8, "requestedSettings"), "captureRequestIdentifier"));
  }
  sampleBufferAvailableHandler = (void (**)(id, opaqueCMSampleBuffer *, _QWORD, uint64_t))self->_sampleBufferAvailableHandler;
  if (sampleBufferAvailableHandler)
    sampleBufferAvailableHandler[2](sampleBufferAvailableHandler, a3, 0, objc_msgSend(v8, "requestedSettings"));
  v11 = -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration isTimeLapse](self->_analyticsConfiguration, "isTimeLapse");
  if ((v9 & 0x2000) == 0 && !v11)
    -[BWStillImageSampleBufferSinkNode _reportAggdDataWithRequestedStillImageSettings:resolvedStillImageCaptureSettings:sbuf:]((uint64_t)self, (void *)objc_msgSend(v8, "requestedSettings"), (void *)objc_msgSend(v8, "captureSettings"), a3);
  -[BWStillImageSampleBufferSinkNode _reportCoreAnalyticsForSampleBuffer:stillImageSettings:]((uint64_t)self, a3, v8);
}

- (void)_attachPrivateClientMetadataToSampleBuffer:(_BYTE *)a1
{
  CFTypeRef v3;
  CFTypeRef v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CFDictionaryRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  CMAttachmentBearerRef target;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  CMTime time;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  _QWORD v47[4];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a1 && a1[181])
  {
    v30 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    target = a2;
    v3 = CMGetAttachment(a2, CFSTR("Inferences"), 0);
    v4 = (CFTypeRef)MEMORY[0x1E0C9AA70];
    if (v3)
      v4 = v3;
    v33 = (void *)v4;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v34 = objc_msgSend(&unk_1E4A010A0, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v43;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(&unk_1E4A010A0);
          v35 = v6;
          v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v6);
          v8 = (void *)objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", v7), "inferences");
          if (v8)
          {
            v9 = v8;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v39;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v39 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                  v15 = objc_msgSend(v9, "objectForKeyedSubscript:", v14);
                  v37 = 0;
                  v16 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v37);
                  if (v16)
                    v17 = v37 == 0;
                  else
                    v17 = 0;
                  if (v17)
                  {
                    v18 = v16;
                    if (objc_msgSend(v7, "intValue") == 801)
                      v14 = (void *)objc_msgSend(v14, "stringByAppendingString:", CFSTR("-Landmarks"));
                    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v14);
                  }
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
              }
              while (v11);
            }
          }
          v6 = v35 + 1;
        }
        while (v35 + 1 != v34);
        v34 = objc_msgSend(&unk_1E4A010A0, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      }
      while (v34);
    }
    v19 = (void *)CMGetAttachment(target, CFSTR("BWStillImageCaptureSettings"), 0);
    v20 = (void *)objc_msgSend(v19, "metadata");
    if ((int)objc_msgSend(v20, "smartCamVersion") >= 1
      && objc_msgSend((id)objc_msgSend(v20, "smartCamInferences"), "count"))
    {
      if (v20)
        objc_msgSend(v20, "smartCamTimestamp");
      else
        memset(&time, 0, sizeof(time));
      v21 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
      v46[0] = *MEMORY[0x1E0D05A90];
      v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v20, "smartCamVersion"));
      v23 = *MEMORY[0x1E0D05A88];
      v47[0] = v22;
      v47[1] = v21;
      v24 = *MEMORY[0x1E0D05A78];
      v46[1] = v23;
      v46[2] = v24;
      v47[2] = objc_msgSend((id)objc_msgSend(v19, "metadata"), "smartCamInferences");
      v46[3] = *MEMORY[0x1E0D05A80];
      v47[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "isPreviewSmartCamInferences"));
      v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D05A70]);

    }
    if (objc_msgSend(v5, "count"))
      v26 = v5;
    else
      v26 = 0;
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D05A68]);
    if (a1[182])
    {
      v27 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
      if (v27)
      {
        v28 = -[BWStillImageSampleBufferSinkNode _newFilteredDetectedObjectsInfoFromDetectedObjectsInfo:](a1, v27);
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D05A60]);

      }
    }
    if (objc_msgSend(v30, "count"))
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05A58], v30, 1u);
  }
}

- (uint64_t)_reportAggdDataWithRequestedStillImageSettings:(void *)a3 resolvedStillImageCaptureSettings:(opaqueCMSampleBuffer *)target sbuf:
{
  uint64_t v7;
  void *v8;
  BWAggdDataReporter *v9;
  char v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  BWAggdDataReporter *v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  CMTime lhs;
  CMTime rhs;
  CMTime v43;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a3
      && target
      && (v7 = result,
          v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0),
          objc_msgSend(v8, "count")))
    {
      v9 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
      CMSampleBufferGetPresentationTimeStamp(&v43, target);
      value = v43.value;
      flags = v43.flags;
      timescale = v43.timescale;
      epoch = v43.epoch;
      v10 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
      v11 = (void *)CMGetAttachment(target, CFSTR("TotalZoomFactor"), 0);
      if (v11)
      {
        objc_msgSend(v11, "floatValue");
        v13 = v12;
      }
      else
      {
        v13 = 1.0;
      }
      if (*(_BYTE *)(v7 + 181))
        v38 = objc_msgSend(*(id *)(v7 + 200), "isPhotoFormat") ^ 1;
      else
        v38 = 0;
      v37 = v9;
      v14 = v8;
      if (objc_msgSend(a3, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A38]))
        v15 = 1;
      else
        v15 = objc_msgSend(a3, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A50]) != 0;
      v16 = objc_msgSend(a3, "captureType");
      v17 = *MEMORY[0x1E0D05A30];
      v18 = objc_msgSend(a3, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A30]);
      if (v18
        && (v19 = (void *)v18,
            (unint64_t)objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "count") >= 2))
      {
        v40 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A18]), "captureType");
        v39 = objc_msgSend(v19, "captureType");
      }
      else
      {
        v39 = 0;
        v40 = v16;
      }
      v20 = objc_msgSend(a3, "captureFlags");
      if ((v20 & 0x400) != 0)
      {
        v21 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A18]), "captureType");
        v22 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettingsForPortType:", v17), "captureType");
      }
      else
      {
        v21 = 0;
        v22 = 0;
      }
      result = -[BWAggdDataReporter reportStereoFusionProcessingTypeForCaptureType:isStereoFusionCapture:wideSubCaptureType:teleSubCaptureType:isOriginalImage:](v37, "reportStereoFusionProcessingTypeForCaptureType:isStereoFusionCapture:wideSubCaptureType:teleSubCaptureType:isOriginalImage:", v16, (v20 >> 10) & 1, v21, v22, v10 & 1);
      if ((v10 & 9) == 0)
      {
        v23 = v38;
        if (objc_msgSend(a2, "stillImageUserInitiatedRequestTime") && (flags & 1) != 0)
        {
          memset(&v43, 0, sizeof(v43));
          if (a2)
            objc_msgSend(a2, "stillImageUserInitiatedRequestPTS");
          else
            memset(&rhs, 0, sizeof(rhs));
          lhs.value = value;
          lhs.timescale = timescale;
          lhs.flags = flags;
          lhs.epoch = epoch;
          CMTimeSubtract(&v43, &lhs, &rhs);
          if ((v43.flags & 0x1D) == 1)
          {
            v24 = objc_msgSend(a3, "captureFlags");
            v25 = objc_msgSend(a3, "sceneFlags");
            lhs = v43;
            LOBYTE(v34) = v15;
            -[BWAggdDataReporter reportShutterLag:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:](v37, "reportShutterLag:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", &lhs, v40, v39, v24, v25, v38, v34);
          }
          else if (a2)
          {
            objc_msgSend(a2, "stillImageUserInitiatedRequestPTS");
          }
        }
        v26 = (void *)objc_msgSend((id)objc_msgSend(a3, "frameStatisticsByPortType"), "objectForKeyedSubscript:", objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
        if (v26)
        {
          v27 = objc_msgSend(v26, "luxLevel");
          v28 = objc_msgSend(a3, "captureFlags");
          v29 = objc_msgSend(a3, "sceneFlags");
          LOBYTE(v34) = v15;
          v30 = v28;
          v23 = v38;
          -[BWAggdDataReporter reportLuxLevel:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:](v37, "reportLuxLevel:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", v27, v40, v39, v30, v29, v38, v34);
        }
        if (v13 != 0.0)
        {
          v31 = objc_msgSend(a3, "captureFlags");
          v32 = objc_msgSend(a3, "sceneFlags");
          *(float *)&v33 = v13;
          -[BWAggdDataReporter reportZoomFactor:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:](v37, "reportZoomFactor:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", v40, v39, v31, v32, v23, v15, v33);
        }
        if (*(_BYTE *)(v7 + 181))
        {
          if ((v23 & 1) == 0)
            -[BWAggdDataReporter reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera:](v37, "reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera:", v15);
        }
        else
        {
          -[BWAggdDataReporter reportNonCameraAppCaptureWithPrimaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:](v37, "reportNonCameraAppCaptureWithPrimaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", v40, v39, objc_msgSend(a3, "captureFlags"), objc_msgSend(a3, "sceneFlags"), v23, v15);
        }
        if (*(_BYTE *)(v7 + 181)
          && (objc_msgSend(*(id *)(v7 + 200), "isTimeLapse") & 1) == 0
          && (objc_msgSend(a2, "burstQualityCaptureEnabled") & 1) == 0)
        {
          +[BWAutoFocusPositionSensorMonitor logStillImageAPSStatistics:](BWAutoFocusPositionSensorMonitor, "logStillImageAPSStatistics:", v14);
        }
        if ((objc_msgSend(*(id *)(v7 + 200), "isTimeLapse") & 1) == 0
          && (objc_msgSend(a2, "burstQualityCaptureEnabled") & 1) == 0)
        {
          -[BWAggdDataReporter reportFaceCount:frontCamera:](v37, "reportFaceCount:frontCamera:", objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]), "count"), v15);
        }
        result = objc_msgSend(*(id *)(v7 + 200), "isTimeLapse");
        if ((result & 1) == 0)
        {
          result = objc_msgSend(a2, "burstQualityCaptureEnabled");
          if ((result & 1) == 0)
          {
            result = objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E08]);
            if (result)
              return -[BWAggdDataReporter reportSensorTemperature:frontCamera:](v37, "reportSensorTemperature:frontCamera:", objc_msgSend((id)result, "intValue"), v15);
          }
        }
      }
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (void)_reportCoreAnalyticsForSampleBuffer:(void *)a3 stillImageSettings:
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  BWStillImageErrorAnalyticsPayload *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BWStillImageErrorAnalyticsPayload *v16;
  uint64_t v17;
  BWAutoFocusROIAnalyticsPayload *v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1
    && a2
    && a3
    && (objc_msgSend(*(id *)(a1 + 200), "isTimeLapse") & 1) == 0
    && (!objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "constantColorEnabled")
     || BWSampleBufferGetAttachedMedia(a2, 0x1E495B438)))
  {
    v6 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "settingsID");
    if (v6 != *(_QWORD *)(a1 + 224))
    {
      v7 = v6;
      v8 = objc_msgSend((id)CMGetAttachment(a2, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
      if ((v8 & 1) == 0)
      {
        v9 = v8;
        v19 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v10 = -[BWStillImageSampleBufferSinkNode _coreAnalyticsPayloadWithSampleBuffer:error:stillImageSettings:metadata:isForConstantColorCapture:]((BWStillImageErrorAnalyticsPayload *)a1, a2, 0, a3, v19, 0);
        v21 = -[BWStillImageAnalyticsPayloadCommon timeSinceLastCaptureInSession](v10, "timeSinceLastCaptureInSession");
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = (void *)objc_msgSend((id)CMGetAttachment(a2, CFSTR("PhotoManifest"), 0), "photoDescriptors");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
LABEL_11:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "processingFlags", v19) & 0x40) != 0)
              break;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
              if (v13)
                goto LABEL_11;
              goto LABEL_20;
            }
          }
          if ((v9 & 0x40) != 0)
            goto LABEL_20;

          *(_QWORD *)(a1 + 232) = v10;
        }
        else
        {
LABEL_20:
          -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance", v19), "sendEvent:", v10);

          *(_QWORD *)(a1 + 232) = 0;
          *(_QWORD *)(a1 + 224) = v7;
          -[BWStillImageSampleBufferSinkNode _updateMemoryAnalyticsForStillImageWithSampleBuffer:stillImageSettings:timeSinceLastCaptureInSession:]((void *)a1, a2, a3, v21);
          if (!*(_BYTE *)(a1 + 180))
          {
            v16 = -[BWStillImageSampleBufferSinkNode _coreAnalyticsPayloadWithSampleBuffer:error:stillImageSettings:metadata:isForConstantColorCapture:]((BWStillImageErrorAnalyticsPayload *)a1, a2, 0, a3, v20, 1);
            if (v16)
              -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v16);
            if (*(_BYTE *)(a1 + 181))
            {
              v18 = -[BWStillImageSampleBufferSinkNode _autoFocusROIAnalyticsPayloadWithSampleBuffer:error:stillImageSettings:metadata:](a1, (uint64_t)a2, v17, a3, v20);
              if (v18)
                -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v18);
            }
          }
          FigCaptureLogCameraStillImageCapturePowerEvent(objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "masterPortType"), objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "outputWidth"), objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "outputHeight"), objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "deliverDeferredPhotoProxyImage"));
        }
      }
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  void *v6;
  void (**sampleBufferAvailableHandler)(id, _QWORD, uint64_t, void *);
  BWStillImageAnalyticsPayloadCommon *cachedAnalyticsPayloadForPortraitFailures;

  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings");
  sampleBufferAvailableHandler = (void (**)(id, _QWORD, uint64_t, void *))self->_sampleBufferAvailableHandler;
  if (sampleBufferAvailableHandler)
    sampleBufferAvailableHandler[2](sampleBufferAvailableHandler, 0, objc_msgSend(a3, "errorCode"), v6);
  cachedAnalyticsPayloadForPortraitFailures = self->_cachedAnalyticsPayloadForPortraitFailures;
  if (cachedAnalyticsPayloadForPortraitFailures)
  {
    -[BWStillImageSampleBufferSinkNode _sendCoreAnalyticsPayloadAndResetReportingStateWithPayload:settingsID:processingFlags:]((uint64_t)self, (uint64_t)cachedAnalyticsPayloadForPortraitFailures, objc_msgSend(v6, "settingsID"));
    self->_lastReportedSettingsID = 0;
  }
  -[BWStillImageSampleBufferSinkNode _reportCoreAnalyticsForNodeError:]((uint64_t)self, a3);
}

- (void)_sendCoreAnalyticsPayloadAndResetReportingStateWithPayload:(uint64_t)a1 settingsID:(uint64_t)a2 processingFlags:(uint64_t)a3
{
  if (a1)
  {
    -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", a2);

    *(_QWORD *)(a1 + 232) = 0;
    *(_QWORD *)(a1 + 224) = a3;
  }
}

- (void)_reportCoreAnalyticsForNodeError:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;

  if (a1 && a2 && (objc_msgSend(*(id *)(a1 + 200), "isTimeLapse") & 1) == 0)
  {
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "stillImageSettings"), "requestedSettings"), "settingsID");
    if (v4 != *(_QWORD *)(a1 + 224))
    {
      v5 = v4;
      -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", -[BWStillImageSampleBufferSinkNode _coreAnalyticsPayloadWithSampleBuffer:error:stillImageSettings:metadata:isForConstantColorCapture:]((BWStillImageErrorAnalyticsPayload *)a1, 0, objc_msgSend(a2, "errorCode"), (void *)objc_msgSend(a2, "stillImageSettings"), (void *)objc_msgSend(a2, "metadata"), 0));

      *(_QWORD *)(a1 + 232) = 0;
      *(_QWORD *)(a1 + 224) = v5;
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  os_log_type_t type;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9890)
  {
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWStillImageSampleBufferSinkNode setSampleBufferAvailableHandler:](self, "setSampleBufferAvailableHandler:", 0, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)BWStillImageSampleBufferSinkNode;
  -[BWSinkNode didReachEndOfDataForInput:](&v8, sel_didReachEndOfDataForInput_, a3);
}

- (int)stillImageCapturePipeliningMode
{
  return self->_stillImageCapturePipeliningMode;
}

- (BOOL)deferredPhotoProcessorEnabled
{
  return self->_deferredPhotoProcessorEnabled;
}

- (BOOL)clientIsCameraOrDerivative
{
  return self->_clientIsCameraOrDerivative;
}

- (BOOL)captureTimePhotosCurationSupported
{
  return self->_captureTimePhotosCurationSupported;
}

- (id)propagatedAttachedMediaKeys
{
  return self->_propagatedAttachedMediaKeys;
}

- (BOOL)focusPixelBlurScoreEnabled
{
  return self->_focusPixelBlurScoreEnabled;
}

- (void)setCameraSupportsFlash:(BOOL)a3
{
  self->_cameraSupportsFlash = a3;
}

- (BOOL)cameraSupportsFlash
{
  return self->_cameraSupportsFlash;
}

- (id)analyticsConfiguration
{
  return self->_analyticsConfiguration;
}

- (id)_newFilteredDetectedObjectsInfoFromDetectedObjectsInfo:(id)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v17)
    {
      v15 = *(_QWORD *)v26;
      v19 = *MEMORY[0x1E0D064D0];
      v3 = *MEMORY[0x1E0D06D58];
      v4 = *MEMORY[0x1E0D06958];
      v16 = a2;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(a2);
          v20 = v5;
          v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v5);
          v6 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:"), "objectForKeyedSubscript:", v19);
          v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v22;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v22 != v10)
                  objc_enumerationMutation(v6);
                v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
                v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                if (objc_msgSend(v12, "objectForKeyedSubscript:", v3))
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", v3), v3);
                if (objc_msgSend(v12, "objectForKeyedSubscript:", v4))
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", v4), v4);
                if (objc_msgSend(v13, "objectForKeyedSubscript:", v3))
                  objc_msgSend(v7, "addObject:", v13);
                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
            }
            while (v9);
          }
          if (objc_msgSend(v7, "count"))
          {
            v29 = v19;
            v30 = v7;
            objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1), v18);
          }
          v5 = v20 + 1;
          a2 = v16;
        }
        while (v20 + 1 != v17);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v17);
    }
    return v14;
  }
  return result;
}

- (BWStillImageErrorAnalyticsPayload)_coreAnalyticsPayloadWithSampleBuffer:(int)a3 error:(void *)a4 stillImageSettings:(void *)a5 metadata:(int)a6 isForConstantColorCapture:
{
  id *p_isa;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __objc2_class *v18;
  BWStillImageErrorAnalyticsPayload *v19;
  BWStillImageErrorAnalyticsPayload *v20;
  BWStillImageErrorAnalyticsPayload *v21;
  void *v22;
  double v23;
  void *AttachedInference;
  unint64_t v25;
  int v26;
  float v27;
  float v28;
  void *v34;
  float v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  float v44;
  uint64_t j;
  void *v46;
  float height;
  double v48;
  _BOOL4 v49;
  double v50;
  _BOOL4 v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  double v63;
  float v64;
  void *v65;
  opaqueCMSampleBuffer *AttachedMedia;
  __CVBuffer *ImageBuffer;
  __int128 v68;
  double v69;
  double v71;
  _UNKNOWN **v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  void *v89;
  void *v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  float v97;
  double v98;
  void *v99;
  float v100;
  float v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  float v107;
  double v108;
  void *v109;
  float v110;
  double v111;
  void *v112;
  float v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  unsigned int v134;
  int v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  void *v152;
  int v153;
  int v154;
  float v155;
  void *v156;
  void *v157;
  BWStillImageErrorAnalyticsPayload *v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  int v163;
  id *v164;
  void *v165;
  BWStillImageErrorAnalyticsPayload *v166;
  id obj;
  CGSize v168;
  uint64_t v169;
  CGPoint v170;
  void *v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  CGRect lhs;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _BYTE v181[32];
  CMTime rhs;
  CMTime v183;
  _BYTE v184[128];
  _BYTE v185[128];
  uint64_t v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;

  v186 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    p_isa = (id *)&result->super.super.isa;
    v12 = objc_msgSend(a4, "captureSettings");
    if (v12
      && (v13 = (void *)v12, (v14 = objc_msgSend(a4, "requestedSettings")) != 0)
      && ((v15 = (void *)v14, a2) || a3))
    {
      v16 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
      v17 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D064A0]);
      obj = (id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D064D0]);
      if (!obj)
        obj = (id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
      v163 = a3;
      if (a2)
      {
        if (a6)
          v18 = BWStillImageCaptureConstantColorAnalyticsPayload;
        else
          v18 = BWStillImageCaptureAnalyticsPayload;
        v20 = (BWStillImageErrorAnalyticsPayload *)objc_alloc_init(v18);
        v19 = 0;
      }
      else
      {
        v19 = objc_alloc_init(BWStillImageErrorAnalyticsPayload);
        v20 = 0;
      }
      if (v20)
        v21 = v20;
      else
        v21 = v19;
      if (!v21)
      {
LABEL_255:
        FigDebugAssert3();
        return v21;
      }
      v162 = a6;
      -[BWStillImageAnalyticsPayloadCommon setDeferred:](v21, "setDeferred:", *((unsigned __int8 *)p_isa + 180));
      v165 = a5;
      v166 = v21;
      if (!a2)
      {
LABEL_93:
        if (!v163)
          goto LABEL_100;
        if (v19)
        {
          -[BWStillImageErrorAnalyticsPayload setError:](v19, "setError:");
          v68 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
          *(_OWORD *)v181 = *MEMORY[0x1E0C9D628];
          *(_OWORD *)&v181[16] = v68;
          if (FigCFDictionaryGetCGRectIfPresent())
          {
            v69 = *(double *)&v181[24];
            if (*(double *)&v181[24] == 0.0)
            {
LABEL_100:
              v72 = &off_1E4914000;
              if (a5)
              {
                v73 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
                -[BWStillImageAnalyticsPayloadCommon setPortType:](v21, "setPortType:", v73);
                if (v73)
                {
                  v159 = v15;
                  v161 = v13;
                  v164 = p_isa;
                  v157 = (void *)objc_msgSend((id)objc_msgSend(v13, "frameStatisticsByPortType"), "objectForKeyedSubscript:", v73);
                  -[BWStillImageAnalyticsPayloadCommon setLuxLevel:](v21, "setLuxLevel:", objc_msgSend(v157, "luxLevel"));
                  v74 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v75 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v76 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v77 = a5;
                  v169 = *MEMORY[0x1E0D06A88];
                  v171 = v74;
                  objc_msgSend(v74, "setObject:forKeyedSubscript:", objc_msgSend(a5, "objectForKeyedSubscript:"), v73);
                  v78 = *MEMORY[0x1E0D06D08];
                  v79 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D08]);
                  v80 = v75;
                  objc_msgSend(v75, "setObject:forKeyedSubscript:", v79, v73);
                  v81 = *MEMORY[0x1E0D06BF8];
                  v82 = v76;
                  objc_msgSend(v76, "setObject:forKeyedSubscript:", objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x1E0D06BF8]), v73);
                  v83 = (void *)objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x1E0D06ED8]);
                  v172 = 0u;
                  v173 = 0u;
                  v174 = 0u;
                  v175 = 0u;
                  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v172, v184, 16);
                  if (v84)
                  {
                    v85 = v84;
                    v86 = *(_QWORD *)v173;
                    do
                    {
                      for (i = 0; i != v85; ++i)
                      {
                        if (*(_QWORD *)v173 != v86)
                          objc_enumerationMutation(v83);
                        v88 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * i);
                        v89 = (void *)objc_msgSend(v83, "objectForKeyedSubscript:", v88);
                        objc_msgSend(v171, "setObject:forKeyedSubscript:", objc_msgSend(v89, "objectForKeyedSubscript:", v169), v88);
                        objc_msgSend(v80, "setObject:forKeyedSubscript:", objc_msgSend(v89, "objectForKeyedSubscript:", v78), v88);
                        objc_msgSend(v82, "setObject:forKeyedSubscript:", objc_msgSend(v89, "objectForKeyedSubscript:", v81), v88);
                      }
                      v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v172, v184, 16);
                    }
                    while (v85);
                  }
                  v21 = v166;
                  -[BWStillImageAnalyticsPayloadCommon setApsSubjectDistance:](v166, "setApsSubjectDistance:", v171);
                  -[BWStillImageAnalyticsPayloadCommon setPracticalFocalLength:](v166, "setPracticalFocalLength:", v80);
                  -[BWStillImageAnalyticsPayloadCommon setFocusingMethod:](v166, "setFocusingMethod:", v82);
                  -[BWStillImageAnalyticsPayloadCommon setAwbStable:](v166, "setAwbStable:", objc_msgSend(v157, "awbStable"));
                  p_isa = v164;
                  a5 = v165;
                  v15 = v159;
                  v13 = v161;
                  v72 = &off_1E4914000;
                }
                v90 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06970]);
                if (v90)
                {
                  *(float *)&v91 = (float)((float)(int)objc_msgSend(v90, "intValue") / -255.0) + 1.0;
                  -[BWStillImageAnalyticsPayloadCommon setLensPosition:](v21, "setLensPosition:", v91);
                }
                v92 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E08]);
                if (v92)
                  -[BWStillImageAnalyticsPayloadCommon setSensorTemperature:](v21, "setSensorTemperature:", objc_msgSend(v92, "intValue"));
                v93 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C10]);
                if (v93)
                {
                  objc_msgSend(v93, "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setLensTemperature:](v21, "setLensTemperature:");
                }
                v94 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]);
                v95 = v94;
                if (v94)
                {
                  objc_msgSend(v94, "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setExposureDuration:](v21, "setExposureDuration:");
                }
                *(_DWORD *)v181 = 0;
                v96 = FigCaptureComputeImageGainFromMetadata();
                if (v95 && !v96)
                {
                  objc_msgSend(v95, "floatValue");
                  *(float *)&v98 = v97 * *(float *)v181;
                  -[BWStillImageAnalyticsPayloadCommon setEffectiveIntegrationTime:](v21, "setEffectiveIntegrationTime:", v98);
                }
                v99 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B48]);
                if (v99)
                {
                  objc_msgSend(v99, "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setIso:](v21, "setIso:");
                }
                objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CD0]), "floatValue");
                if (v100 != 0.0)
                  -[BWStillImageAnalyticsPayloadCommon setNormalizedSNR:](v21, "setNormalizedSNR:");
                objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D98]), "floatValue");
                if (v101 != 0.0)
                  -[BWStillImageAnalyticsPayloadCommon setSNR:](v21, "setSNR:");
                v102 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B0]);
                if (v102)
                {
                  v103 = v102;
                  objc_msgSend((id)objc_msgSend(v102, "objectForKeyedSubscript:", *MEMORY[0x1E0D06500]), "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setAccelStandardDeviation:](v21, "setAccelStandardDeviation:");
                  objc_msgSend((id)objc_msgSend(v103, "objectForKeyedSubscript:", *MEMORY[0x1E0D06508]), "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setGyroStandardDeviation:](v21, "setGyroStandardDeviation:");
                }
                v104 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E48]);
                if (v104)
                {
                  v105 = v104;
                  v106 = (void *)objc_msgSend(v104, "objectForKeyedSubscript:", *MEMORY[0x1E0D079A8]);
                  if (v106)
                  {
                    objc_msgSend(v106, "floatValue");
                    *(float *)&v108 = v107 * 0.0039062;
                    -[BWStillImageAnalyticsPayloadCommon setMaxSphereTrackingError:](v21, "setMaxSphereTrackingError:", v108);
                  }
                  v109 = (void *)objc_msgSend(v105, "objectForKeyedSubscript:", *MEMORY[0x1E0D079E8]);
                  if (v109)
                  {
                    objc_msgSend(v109, "floatValue");
                    *(float *)&v111 = v110 * 0.0039062;
                    -[BWStillImageAnalyticsPayloadCommon setStdSphereTrackingError:](v21, "setStdSphereTrackingError:", v111);
                  }
                  v112 = (void *)objc_msgSend(v105, "objectForKeyedSubscript:", *MEMORY[0x1E0D079C0]);
                  if (v112)
                  {
                    objc_msgSend(v112, "floatValue");
                    *(float *)&v114 = v113 * 0.0039062;
                    -[BWStillImageAnalyticsPayloadCommon setMinDistanceFromSphereEndStop:](v21, "setMinDistanceFromSphereEndStop:", v114);
                  }
                  v115 = (void *)objc_msgSend(v105, "objectForKeyedSubscript:", *MEMORY[0x1E0D079E0]);
                  if (v115)
                  {
                    objc_msgSend(v115, "floatValue");
                    -[BWStillImageAnalyticsPayloadCommon setSpherePowerConsumption:](v21, "setSpherePowerConsumption:");
                  }
                }
                v116 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D068A0]);
                if (v116)
                {
                  v117 = v116;
                  v118 = (void *)objc_msgSend(v116, "objectForKeyedSubscript:", *MEMORY[0x1E0D06270]);
                  if (v118)
                  {
                    objc_msgSend(v118, "floatValue");
                    -[BWStillImageAnalyticsPayloadCommon setMaxAFTrackingError:](v21, "setMaxAFTrackingError:");
                  }
                  v119 = (void *)objc_msgSend(v117, "objectForKeyedSubscript:", *MEMORY[0x1E0D062A8]);
                  if (v119)
                  {
                    objc_msgSend(v119, "floatValue");
                    -[BWStillImageAnalyticsPayloadCommon setStdAFTrackingError:](v21, "setStdAFTrackingError:");
                  }
                  v120 = (void *)objc_msgSend(v117, "objectForKeyedSubscript:", *MEMORY[0x1E0D06290]);
                  if (v120)
                  {
                    objc_msgSend(v120, "floatValue");
                    -[BWStillImageAnalyticsPayloadCommon setAfPowerConsumption:](v21, "setAfPowerConsumption:");
                  }
                }
                v121 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D8]);
                if (v121)
                {
                  v122 = (void *)objc_msgSend(v121, "objectForKeyedSubscript:", *MEMORY[0x1E0D06210]);
                  if (v122)
                    -[BWStillImageAnalyticsPayloadCommon setDepthAFStatus:](v21, "setDepthAFStatus:", objc_msgSend(v122, "intValue"));
                }
                v123 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06940]);
                if (v123)
                  -[BWStillImageAnalyticsPayloadCommon setCameraPosture:](v21, "setCameraPosture:", objc_msgSend(v123, "intValue"));
                v124 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
                if (v124)
                  -[BWStillImageAnalyticsPayloadCommon setImageExifOrientation:](v21, "setImageExifOrientation:", objc_msgSend(v124, "intValue"));
                v125 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E58]);
                if (v125)
                  -[BWStillImageAnalyticsPayloadCommon setSphereMode:](v21, "setSphereMode:", v125);
                v126 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D068B0]);
                if (v126)
                  -[BWStillImageAnalyticsPayloadCommon setApsMode:](v21, "setApsMode:", objc_msgSend(v126, "intValue"));
                v127 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A58]);
                if (v127)
                {
                  objc_msgSend(v127, "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setFlashBrightnessRatio:](v21, "setFlashBrightnessRatio:");
                }
                v128 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06060]);
                if (v128)
                  -[BWStillImageAnalyticsPayloadCommon setStfStillSupported:](v21, "setStfStillSupported:", objc_msgSend(v128, "BOOLValue"));
                v129 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06050]);
                if (v129)
                  -[BWStillImageAnalyticsPayloadCommon setStfStillApplied:](v21, "setStfStillApplied:", objc_msgSend(v129, "BOOLValue"));
                v130 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06058]);
                if (v130)
                  -[BWStillImageAnalyticsPayloadCommon setStfStillCorrectionStrength:](v21, "setStfStillCorrectionStrength:", objc_msgSend(v130, "intValue"));
                v131 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06048]);
                if (v131)
                  -[BWStillImageAnalyticsPayloadCommon setStfStillAnalyticsVersion:](v21, "setStfStillAnalyticsVersion:", objc_msgSend(v131, "unsignedIntValue"));
                v132 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F18]);
                if (v132)
                  -[BWStillImageAnalyticsPayloadCommon setGeometricDistortionCorrectionSource:](v21, "setGeometricDistortionCorrectionSource:", objc_msgSend(v72[311], "geometricDistortionCorrectionSourceToShortString:", objc_msgSend(v132, "intValue")));
                -[BWStillImageAnalyticsPayloadCommon setGeometricDistortionCorrectionEnabled:](v21, "setGeometricDistortionCorrectionEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F10]), "BOOLValue"));
                v133 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F58]);
                if (v133)
                {
                  v134 = objc_msgSend(v133, "unsignedIntValue");
                  v135 = objc_msgSend(v13, "captureType");
                  if (v135 == 11)
                  {
                    -[BWStillImageAnalyticsPayloadCommon setGreenGhostMitigationLowLightExceedsMaxMaskAverage:](v21, "setGreenGhostMitigationLowLightExceedsMaxMaskAverage:", (v134 >> 3) & 1);
                    -[BWStillImageAnalyticsPayloadCommon setGreenGhostMitigationLowLightSkipRepair:](v21, "setGreenGhostMitigationLowLightSkipRepair:", (v134 >> 4) & 1);
                    -[BWStillImageAnalyticsPayloadCommon setGreenGhostMitigationLowLightTripodMode:](v21, "setGreenGhostMitigationLowLightTripodMode:", (v134 >> 5) & 1);
                    v136 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F50]);
                    if (v136)
                    {
                      objc_msgSend(v136, "floatValue");
                      -[BWStillImageAnalyticsPayloadCommon setGreenGhostMitigationLowLightMaskAverage:](v21, "setGreenGhostMitigationLowLightMaskAverage:");
                    }
                  }
                  else if (v135 == 10)
                  {
                    -[BWStillImageAnalyticsPayloadCommon setGreenGhostMitigationBrightLightIsBrightScene:](v21, "setGreenGhostMitigationBrightLightIsBrightScene:", (v134 >> 3) & 1);
                    -[BWStillImageAnalyticsPayloadCommon setGreenGhostMitigationBrightLightROIIsComputed:](v21, "setGreenGhostMitigationBrightLightROIIsComputed:", (v134 >> 4) & 1);
                  }
                }
                -[BWStillImageAnalyticsPayloadCommon setTimeOfFlightAssistedAutoFocusEstimatorData:](v21, "setTimeOfFlightAssistedAutoFocusEstimatorData:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F10]));
                -[BWStillImageAnalyticsPayloadCommon setLeaderFollowerAutoFocusData:](v21, "setLeaderFollowerAutoFocusData:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C00]));
                -[BWStillImageAnalyticsPayloadCommon setTimeOfFlightFlickerDetectionData:](v21, "setTimeOfFlightFlickerDetectionData:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F18]));
                v137 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06898]);
                if (v137)
                  -[BWStillImageAnalyticsPayloadCommon setAfDriverShortOccurred:](v21, "setAfDriverShortOccurred:", objc_msgSend(v137, "BOOLValue"));
                v138 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06070]);
                if (v138)
                  -[BWStillImageAnalyticsPayloadCommon setSwfrApplied:](v21, "setSwfrApplied:", objc_msgSend(v138, "BOOLValue"));
                v139 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06090]);
                if (v139)
                  -[BWStillImageAnalyticsPayloadCommon setSwfrForegroundCorrectionStrength:](v21, "setSwfrForegroundCorrectionStrength:", objc_msgSend(v139, "intValue"));
                v140 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06080]);
                if (v140)
                  -[BWStillImageAnalyticsPayloadCommon setSwfrBackgroundCorrectionStrength:](v21, "setSwfrBackgroundCorrectionStrength:", objc_msgSend(v140, "intValue"));
                v141 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06088]);
                if (v141)
                {
                  objc_msgSend(v141, "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setSwfrForegroundCorrectionDirection:](v21, "setSwfrForegroundCorrectionDirection:");
                }
                v142 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06078]);
                if (v142)
                {
                  objc_msgSend(v142, "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setSwfrBackgroundCorrectionDirection:](v21, "setSwfrBackgroundCorrectionDirection:");
                }
                v143 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06068]);
                if (v143)
                  -[BWStillImageAnalyticsPayloadCommon setSwfrAnalyticsVersion:](v21, "setSwfrAnalyticsVersion:", objc_msgSend(v143, "intValue"));
                v144 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06030]);
                if (v144)
                  -[BWStillImageAnalyticsPayloadCommon setRedEyeReductionStatus:](v21, "setRedEyeReductionStatus:", objc_msgSend(v144, "intValue"));
                if (v162)
                {
                  v145 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E20]);
                  if (v145)
                    -[BWStillImageErrorAnalyticsPayload setConstantColorApplied:](v21, "setConstantColorApplied:", objc_msgSend(v145, "BOOLValue"));
                  v146 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E28]);
                  if (v146)
                  {
                    objc_msgSend(v146, "floatValue");
                    -[BWStillImageErrorAnalyticsPayload setConstantColorCenterWeightedMeanConfidenceLevel:](v21, "setConstantColorCenterWeightedMeanConfidenceLevel:");
                  }
                  v147 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E18]);
                  if (v147)
                    -[BWStillImageErrorAnalyticsPayload setConstantColorAnalyticsVersion:](v21, "setConstantColorAnalyticsVersion:", objc_msgSend(v147, "intValue"));
                  v148 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E40]);
                  if (v148)
                  {
                    objc_msgSend(v148, "floatValue");
                    -[BWStillImageErrorAnalyticsPayload setConstantColorStrobeWhitePointRGain:](v21, "setConstantColorStrobeWhitePointRGain:");
                  }
                  v149 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E38]);
                  if (v149)
                  {
                    objc_msgSend(v149, "floatValue");
                    -[BWStillImageErrorAnalyticsPayload setConstantColorStrobeWhitePointGGain:](v21, "setConstantColorStrobeWhitePointGGain:");
                  }
                  v150 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E30]);
                  if (v150)
                  {
                    objc_msgSend(v150, "floatValue");
                    -[BWStillImageErrorAnalyticsPayload setConstantColorStrobeWhitePointBGain:](v21, "setConstantColorStrobeWhitePointBGain:");
                  }
                }
              }
              -[BWStillImageAnalyticsPayloadCommon setCaptureType:](v21, "setCaptureType:", objc_msgSend(v13, "captureType"));
              -[BWStillImageAnalyticsPayloadCommon setCaptureFlags:](v21, "setCaptureFlags:", objc_msgSend(v13, "captureFlags"));
              -[BWStillImageAnalyticsPayloadCommon setSceneFlags:](v21, "setSceneFlags:", objc_msgSend(v13, "sceneFlags"));
              objc_msgSend(v15, "stillImageCaptureStartTime");
              mach_absolute_time();
              -[BWStillImageAnalyticsPayloadCommon setProcessingDuration:](v21, "setProcessingDuration:", ((int)FigHostTimeToNanoseconds() / 1000 / 1000));
              -[BWStillImageAnalyticsPayloadCommon setStreamingTime:](v21, "setStreamingTime:", objc_msgSend((id)objc_msgSend(v13, "metadata"), "streamingTime"));
              if (objc_msgSend(v13, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A38]))
              {
                -[BWStillImageAnalyticsPayloadCommon setActiveDeviceMask:](v21, "setActiveDeviceMask:", -[BWStillImageAnalyticsPayloadCommon activeDeviceMask](v21, "activeDeviceMask") | 1);
                -[BWStillImageAnalyticsPayloadCommon setDevicePosition:](v21, "setDevicePosition:", 2);
              }
              if (objc_msgSend(v13, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A50]))
              {
                -[BWStillImageAnalyticsPayloadCommon setActiveDeviceMask:](v21, "setActiveDeviceMask:", -[BWStillImageAnalyticsPayloadCommon activeDeviceMask](v21, "activeDeviceMask") | 0x40);
                -[BWStillImageAnalyticsPayloadCommon setDevicePosition:](v21, "setDevicePosition:", 2);
              }
              if (objc_msgSend(v13, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A40]))
              {
                -[BWStillImageAnalyticsPayloadCommon setActiveDeviceMask:](v21, "setActiveDeviceMask:", -[BWStillImageAnalyticsPayloadCommon activeDeviceMask](v21, "activeDeviceMask") | 2);
                -[BWStillImageAnalyticsPayloadCommon setDevicePosition:](v21, "setDevicePosition:", 2);
              }
              if (objc_msgSend(v13, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A30]))
              {
                -[BWStillImageAnalyticsPayloadCommon setActiveDeviceMask:](v21, "setActiveDeviceMask:", -[BWStillImageAnalyticsPayloadCommon activeDeviceMask](v21, "activeDeviceMask") | 8);
                -[BWStillImageAnalyticsPayloadCommon setDevicePosition:](v21, "setDevicePosition:", 1);
              }
              if (objc_msgSend(v13, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A18]))
              {
                -[BWStillImageAnalyticsPayloadCommon setActiveDeviceMask:](v21, "setActiveDeviceMask:", -[BWStillImageAnalyticsPayloadCommon activeDeviceMask](v21, "activeDeviceMask") | 4);
                -[BWStillImageAnalyticsPayloadCommon setDevicePosition:](v21, "setDevicePosition:", 1);
              }
              if (objc_msgSend(v13, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A28]))
              {
                -[BWStillImageAnalyticsPayloadCommon setActiveDeviceMask:](v21, "setActiveDeviceMask:", -[BWStillImageAnalyticsPayloadCommon activeDeviceMask](v21, "activeDeviceMask") | 0x10);
                -[BWStillImageAnalyticsPayloadCommon setDevicePosition:](v21, "setDevicePosition:", 1);
              }
              if (objc_msgSend((id)objc_msgSend(v15, "bravoConstituentImageDeliveryDeviceTypes"), "count"))
                -[BWStillImageAnalyticsPayloadCommon setConstituentImageDeliveryDeviceTypes:](v21, "setConstituentImageDeliveryDeviceTypes:", BWStringFromFigCaptureSourceDeviceTypes((void *)objc_msgSend(v15, "bravoConstituentImageDeliveryDeviceTypes")));
              -[BWStillImageAnalyticsPayloadCommon setAlsLuxLevel:](v21, "setAlsLuxLevel:", objc_msgSend((id)objc_msgSend(v13, "metadata"), "alsLuxLevel"));
              objc_msgSend((id)objc_msgSend(v13, "metadata"), "alsRearLuxLevel");
              -[BWStillImageAnalyticsPayloadCommon setAlsRearLuxLevel:](v21, "setAlsRearLuxLevel:");
              -[BWStillImageAnalyticsPayloadCommon setClientApplicationID:](v21, "setClientApplicationID:", objc_msgSend(v13, "applicationID"));
              -[BWStillImageAnalyticsPayloadCommon setTimeLapse:](v21, "setTimeLapse:", objc_msgSend(p_isa[25], "isTimeLapse"));
              -[BWStillImageAnalyticsPayloadCommon setBurst:](v21, "setBurst:", objc_msgSend(v15, "burstQualityCaptureEnabled"));
              -[BWStillImageAnalyticsPayloadCommon setDepthEnabled:](v21, "setDepthEnabled:", objc_msgSend(v15, "depthDataDeliveryEnabled"));
              -[BWStillImageAnalyticsPayloadCommon setNumberOfFaces:](v21, "setNumberOfFaces:", objc_msgSend(obj, "count"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "movieMode") == 1)
                -[BWStillImageAnalyticsPayloadCommon setLivePhotoEnabled:](v21, "setLivePhotoEnabled:", 1);
              if (*((_BYTE *)p_isa + 181))
                v151 = objc_msgSend(p_isa[25], "isPhotoFormat") ^ 1;
              else
                v151 = 0;
              if ((objc_msgSend(p_isa[25], "isTimeLapse") & 1) == 0
                && ((objc_msgSend(v15, "burstQualityCaptureEnabled") | v151) & 1) == 0)
              {
                if (p_isa[27])
                {
                  objc_msgSend(v15, "stillImageRequestTime");
                  -[BWStillImageAnalyticsPayloadCommon setTimeSinceLastCaptureInSession:](v21, "setTimeSinceLastCaptureInSession:", FigHostTimeToNanoseconds() / 0xF4240uLL);
                }
                p_isa[27] = (id)objc_msgSend(v15, "stillImageRequestTime");
              }
              -[BWStillImageAnalyticsPayloadCommon setSemanticStyleRenderingSupported:](v21, "setSemanticStyleRenderingSupported:", objc_msgSend(p_isa[25], "isSemanticStyleRenderingSupported"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "semanticStyle"))
              {
                v152 = (void *)objc_msgSend(v15, "semanticStyle");
                -[BWStillImageAnalyticsPayloadCommon setSemanticSceneType:](v21, "setSemanticSceneType:", objc_msgSend((id)objc_msgSend(v13, "metadata"), "semanticStyleSceneType"));
                objc_msgSend(v152, "toneBias");
                -[BWStillImageAnalyticsPayloadCommon setSemanticStyleToneBias:](v21, "setSemanticStyleToneBias:");
                objc_msgSend(v152, "warmthBias");
                -[BWStillImageAnalyticsPayloadCommon setSemanticStyleWarmthBias:](v21, "setSemanticStyleWarmthBias:");
              }
              -[BWStillImageAnalyticsPayloadCommon setSmartStyleRenderingSupported:](v21, "setSmartStyleRenderingSupported:", objc_msgSend(p_isa[25], "isSmartStyleRenderingSupported"));
              if (objc_msgSend(v15, "smartStyle"))
              {
                -[BWStillImageAnalyticsPayloadCommon setSmartStyleCastType:](v21, "setSmartStyleCastType:", objc_msgSend(MEMORY[0x1E0D08AD0], "makerNoteTagForSmartStyleCastType:smartStyleVersion:", objc_msgSend((id)objc_msgSend(v15, "smartStyle"), "cast"), 1));
                objc_msgSend((id)objc_msgSend(v15, "smartStyle"), "toneBias");
                -[BWStillImageAnalyticsPayloadCommon setSmartStyleToneBias:](v21, "setSmartStyleToneBias:");
                objc_msgSend((id)objc_msgSend(v15, "smartStyle"), "colorBias");
                -[BWStillImageAnalyticsPayloadCommon setSmartStyleColorBias:](v21, "setSmartStyleColorBias:");
                objc_msgSend((id)objc_msgSend(v15, "smartStyle"), "intensity");
                -[BWStillImageAnalyticsPayloadCommon setSmartStyleIntensity:](v21, "setSmartStyleIntensity:");
              }
              if (FigCapturePixelFormatIsDemosaicedRaw(objc_msgSend(v15, "rawOutputFormat")))
              {
                v153 = 4;
              }
              else
              {
                if (!FigCapturePixelFormatIsBayerRaw(objc_msgSend(v15, "rawOutputFormat")))
                  goto LABEL_238;
                v153 = 8;
              }
              -[BWStillImageAnalyticsPayloadCommon setOutputFileType:](v21, "setOutputFileType:", -[BWStillImageAnalyticsPayloadCommon outputFileType](v21, "outputFileType") | v153);
LABEL_238:
              if (objc_msgSend(v15, "outputFileType") == 1785096550)
              {
                v154 = 2;
              }
              else if (objc_msgSend(v15, "outputFileType") == 1751476579
                     || objc_msgSend(v15, "outputFileType") == 1751476582)
              {
                v154 = 1;
              }
              else
              {
                if (objc_msgSend(v15, "outputFileType") != 1953064550)
                  goto LABEL_244;
                v154 = 16;
              }
              -[BWStillImageAnalyticsPayloadCommon setOutputFileType:](v21, "setOutputFileType:", -[BWStillImageAnalyticsPayloadCommon outputFileType](v21, "outputFileType") | v154);
LABEL_244:
              -[BWStillImageAnalyticsPayloadCommon setFormatDimensionWidth:](v21, "setFormatDimensionWidth:", objc_msgSend(p_isa[25], "formatDimensionWidth"));
              -[BWStillImageAnalyticsPayloadCommon setFormatDimensionHeight:](v21, "setFormatDimensionHeight:", objc_msgSend(p_isa[25], "formatDimensionHeight"));
              -[BWStillImageAnalyticsPayloadCommon setDeliveredDimensionWidth:](v21, "setDeliveredDimensionWidth:", objc_msgSend(v15, "outputWidth"));
              -[BWStillImageAnalyticsPayloadCommon setDeliveredDimensionHeight:](v21, "setDeliveredDimensionHeight:", objc_msgSend(v15, "outputHeight"));
              objc_msgSend(p_isa[25], "formatMaxFrameRate");
              -[BWStillImageAnalyticsPayloadCommon setFormatMaxFrameRate:](v21, "setFormatMaxFrameRate:", (int)v155);
              -[BWStillImageAnalyticsPayloadCommon setQualityPrioritization:](v21, "setQualityPrioritization:", objc_msgSend(v15, "qualityPrioritization"));
              -[BWStillImageAnalyticsPayloadCommon setClientRequestedQualityPrioritization:](v21, "setClientRequestedQualityPrioritization:", objc_msgSend(v15, "clientQualityPrioritization"));
              -[BWStillImageAnalyticsPayloadCommon setHighQualityPhotoWithVideoFormatSupported:](v21, "setHighQualityPhotoWithVideoFormatSupported:", objc_msgSend(p_isa[25], "isHighQualityPhotoWithVideoFormatSupported"));
              -[BWStillImageAnalyticsPayloadCommon setPhotoFormat:](v21, "setPhotoFormat:", objc_msgSend(p_isa[25], "isPhotoFormat"));
              -[BWStillImageAnalyticsPayloadCommon setPixelFormat:](v21, "setPixelFormat:", objc_msgSend(p_isa[25], "pixelFormat"));
              -[BWStillImageAnalyticsPayloadCommon setBinned:](v21, "setBinned:", objc_msgSend(p_isa[25], "binned"));
              -[BWStillImageAnalyticsPayloadCommon setDepthDataDeliveryEnabled:](v21, "setDepthDataDeliveryEnabled:", objc_msgSend(v15, "depthDataDeliveryEnabled"));
              v156 = (void *)objc_msgSend((id)objc_msgSend(v13, "metadata"), "shallowDepthOfFieldEffectSceneStatus");
              -[BWStillImageAnalyticsPayloadCommon setPortraitRequested:](v21, "setPortraitRequested:", v156 != 0);
              if (v156)
                -[BWStillImageAnalyticsPayloadCommon setPortraitEffectStatus:](v21, "setPortraitEffectStatus:", objc_msgSend(v72[311], "shallowDepthOfFieldEffectStatusToString:", objc_msgSend(v156, "intValue")));
              -[BWStillImageAnalyticsPayloadCommon setFastCapturePrioritizationEnabled:](v21, "setFastCapturePrioritizationEnabled:", objc_msgSend(p_isa[25], "fastCapturePrioritizationEnabled"));
              -[BWStillImageAnalyticsPayloadCommon setResolutionFlavor:](v21, "setResolutionFlavor:", FigCaptureSourceFormatHighResolutionFlavorToShortString(objc_msgSend(v15, "resolutionFlavor")));
              return v21;
            }
          }
          else
          {
            *(_OWORD *)v181 = 0uLL;
            __asm { FMOV            V0.2D, #1.0 }
            *(_OWORD *)&v181[16] = _Q0;
            v69 = 1.0;
          }
          v71 = 1.0 / v69;
          *(float *)&v71 = v71;
          -[BWStillImageErrorAnalyticsPayload setDigitalZoomRatioFromSource:](v19, "setDigitalZoomRatioFromSource:", v71);
          goto LABEL_100;
        }
        goto LABEL_255;
      }
      if (v20)
      {
        if (objc_msgSend(a5, "count"))
        {
          -[BWStillImageErrorAnalyticsPayload setProcessingFlags:](v20, "setProcessingFlags:", objc_msgSend((id)CMGetAttachment(a2, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue"));
          v22 = (void *)CMGetAttachment(a2, CFSTR("TotalZoomFactor"), 0);
          if (v22)
            objc_msgSend(v22, "floatValue");
          else
            LODWORD(v23) = 1.0;
          -[BWStillImageErrorAnalyticsPayload setZoom:](v20, "setZoom:", v23);
          -[BWStillImageErrorAnalyticsPayload setDeviceType:](v20, "setDeviceType:", objc_msgSend((id)CMGetAttachment(a2, CFSTR("CaptureDeviceType"), 0), "intValue"));
          objc_msgSend((id)CMGetAttachment(a2, CFSTR("UIZoomFactor"), 0), "floatValue");
          -[BWStillImageErrorAnalyticsPayload setUiZoom:](v20, "setUiZoom:");
          memset(&v183, 0, sizeof(v183));
          CMSampleBufferGetPresentationTimeStamp(&v183, (CMSampleBufferRef)a2);
          if (objc_msgSend(v15, "stillImageUserInitiatedRequestTime"))
          {
            if ((v183.flags & 1) != 0)
            {
              memset(v181, 0, 24);
              objc_msgSend(v15, "stillImageUserInitiatedRequestPTS");
              lhs.origin = *(CGPoint *)&v183.value;
              *(_QWORD *)&lhs.size.width = v183.epoch;
              CMTimeSubtract((CMTime *)v181, (CMTime *)&lhs, &rhs);
              if ((v181[12] & 0x1D) == 1)
              {
                lhs.origin = *(CGPoint *)v181;
                lhs.size.width = *(CGFloat *)&v181[16];
                -[BWStillImageErrorAnalyticsPayload setShutterLag:](v20, "setShutterLag:", (int)(CMTimeGetSeconds((CMTime *)&lhs) * 1000.0));
              }
            }
          }
          AttachedInference = (void *)BWInferenceGetAttachedInference(a2, 802, (uint64_t)CFSTR("VisionFaceDetectionObservations"));
          if (AttachedInference)
            -[BWStillImageErrorAnalyticsPayload setNumberOfFacesWithVisionFaceDetection:](v20, "setNumberOfFacesWithVisionFaceDetection:", objc_msgSend(AttachedInference, "count"));
          v158 = v19;
          if (objc_msgSend(obj, "count"))
          {
            v25 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
            if ((int)v25 <= SHIDWORD(v25))
              v26 = HIDWORD(v25);
            else
              v26 = v25;
            v27 = (float)SHIDWORD(v25);
            v28 = (float)v26;
            *(_OWORD *)v181 = 0uLL;
            __asm { FMOV            V0.2D, #1.0 }
            *(_OWORD *)&v181[16] = _Q0;
            if ((objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05E78], 0), "BOOLValue") & 1) == 0)
              FigCFDictionaryGetCGRectIfPresent();
            v160 = v13;
            v34 = v15;
            v179 = 0u;
            v180 = 0u;
            v177 = 0u;
            v178 = 0u;
            v35 = v27 / v28;
            v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v185, 16);
            if (v36)
            {
              v38 = v36;
              v39 = 0;
              v40 = 0;
              v41 = *(_QWORD *)v178;
              v168 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
              v170 = (CGPoint)*MEMORY[0x1E0C9D648];
              v42 = *MEMORY[0x1E0D06D58];
              v43 = 0.0;
              v44 = 1.0;
              do
              {
                for (j = 0; j != v38; ++j)
                {
                  if (*(_QWORD *)v178 != v41)
                    objc_enumerationMutation(obj);
                  v46 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * j);
                  lhs.origin = v170;
                  lhs.size = v168;
                  if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v46, "objectForKeyedSubscript:", v42), &lhs))
                  {
                    v187.origin.x = FigCaptureTransformRectToCoordinateSpaceOfRect(lhs.origin.x, lhs.origin.y, lhs.size.width, lhs.size.height, *(double *)v181, *(double *)&v181[8], *(double *)&v181[16]);
                    v189.origin.x = 0.0;
                    v189.origin.y = 0.0;
                    v189.size.width = 1.0;
                    v189.size.height = 1.0;
                    v188 = CGRectIntersection(v187, v189);
                    height = v188.size.height;
                    v48 = v188.origin.x + v188.size.width;
                    v49 = v188.origin.x > 0.849999994;
                    if (v48 < 0.150000006)
                      v49 = 1;
                    v50 = v188.origin.y + v188.size.height;
                    if (v50 < 0.150000006)
                      v49 = 1;
                    if (v188.origin.y > 0.849999994)
                      v49 = 1;
                    v51 = v188.origin.x > 0.150000006;
                    if (v48 >= 0.849999994)
                      v51 = 0;
                    if (v188.origin.y <= 0.150000006)
                      v51 = 0;
                    if (v50 >= 0.849999994)
                      v51 = 0;
                    v40 = v40 + (v49 || !v49 && !v51);
                    v39 = v39 + (v51 || !v49 && !v51);
                    if (v43 <= height)
                      v43 = height;
                    if (v44 >= height)
                      v44 = height;
                  }
                }
                v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v185, 16);
              }
              while (v38);
            }
            else
            {
              v39 = 0;
              v40 = 0;
              v43 = 0.0;
              v44 = 1.0;
            }
            *(float *)&v37 = v35 * v43;
            -[BWStillImageErrorAnalyticsPayload setLargestFaceHeight:](v20, "setLargestFaceHeight:", v37);
            *(float *)&v52 = v35 * v44;
            -[BWStillImageErrorAnalyticsPayload setSmallestFaceHeight:](v20, "setSmallestFaceHeight:", v52);
            -[BWStillImageErrorAnalyticsPayload setNumberOfFacesAtEdge:](v20, "setNumberOfFacesAtEdge:", v40);
            -[BWStillImageErrorAnalyticsPayload setNumberOfFacesAtCenter:](v20, "setNumberOfFacesAtCenter:", v39);
            v15 = v34;
            v13 = v160;
            a5 = v165;
            v21 = v166;
          }
          -[BWStillImageErrorAnalyticsPayload setOisRecenteringLoggingData:](v20, "setOisRecenteringLoggingData:", CMGetAttachment(a2, CFSTR("OisRecenteringLoggingData"), 0));
          v53 = (void *)CMGetAttachment(a2, CFSTR("IntelligentDistortionCorrectionStatusCode"), 0);
          if (v53)
            -[BWStillImageErrorAnalyticsPayload setIntelligentDistortionCorrectionStatusCode:](v20, "setIntelligentDistortionCorrectionStatusCode:", objc_msgSend(v53, "intValue"));
          v54 = (void *)CMGetAttachment(a2, CFSTR("IntelligentDistortionCorrectionGainMapProcessingStatusCode"), 0);
          if (v54)
            -[BWStillImageErrorAnalyticsPayload setIntelligentDistortionCorrectionGainMapProcessingStatusCode:](v20, "setIntelligentDistortionCorrectionGainMapProcessingStatusCode:", objc_msgSend(v54, "intValue"));
          v55 = (void *)CMGetAttachment(a2, CFSTR("IntelligentDistortionCorrectionCorrectionType"), 0);
          if (v55)
            -[BWStillImageErrorAnalyticsPayload setIntelligentDistortionCorrectionCorrectionType:](v20, "setIntelligentDistortionCorrectionCorrectionType:", objc_msgSend(v55, "intValue"));
          v56 = (void *)CMGetAttachment(a2, CFSTR("ISPMotionHighPassFilterConvergenceFlags"), 0);
          if (v56)
            -[BWStillImageErrorAnalyticsPayload setIspMotionHighPassFilterConvergenceFlags:](v20, "setIspMotionHighPassFilterConvergenceFlags:", objc_msgSend(v56, "intValue"));
          if (FigCapturePixelFormatIsDemosaicedRaw(objc_msgSend(v15, "rawOutputFormat")))
          {
            v57 = (void *)CMGetAttachment(a2, CFSTR("RawImageAssetSizes"), 0);
            v58 = (void *)objc_msgSend(v57, "objectForKeyedSubscript:", 0x1E495AC98);
            v59 = (void *)objc_msgSend(v57, "objectForKeyedSubscript:", 0x1E495ACB8);
            v60 = (void *)objc_msgSend(v57, "objectForKeyedSubscript:", 0x1E495ACD8);
            v61 = (void *)CMGetAttachment(a2, CFSTR("RawImageBitDepth"), 0);
            v62 = objc_msgSend(v15, "rawOutputFileCodec");
            objc_msgSend(v15, "rawOutputFileCodecQuality");
            v64 = *(float *)&v63;
            if (v58)
              -[BWStillImageErrorAnalyticsPayload setDngFileSize:](v20, "setDngFileSize:", objc_msgSend(v58, "unsignedIntValue"));
            if (v59)
              -[BWStillImageErrorAnalyticsPayload setThumbnailImageSize:](v20, "setThumbnailImageSize:", objc_msgSend(v59, "unsignedIntValue"));
            if (v60)
              -[BWStillImageErrorAnalyticsPayload setAuxiliaryImagesSize:](v20, "setAuxiliaryImagesSize:", objc_msgSend(v60, "unsignedIntValue"));
            v21 = v166;
            if (v61)
              -[BWStillImageErrorAnalyticsPayload setBitDepth:](v20, "setBitDepth:", objc_msgSend(v61, "unsignedIntValue"));
            a5 = v165;
            if ((_DWORD)v62)
              -[BWStillImageErrorAnalyticsPayload setDngCodecType:](v20, "setDngCodecType:", v62);
            if (v64 != 0.0)
            {
              *(float *)&v63 = v64;
              -[BWStillImageErrorAnalyticsPayload setDngCodecQuality:](v20, "setDngCodecQuality:", v63);
            }
          }
          if (objc_msgSend(v15, "outputFileType") == 1785096550
            || objc_msgSend(v15, "outputFileType") == 1751476579
            || objc_msgSend(v15, "outputFileType") == 1751476582)
          {
            v65 = (void *)CMGetAttachment(a2, CFSTR("EncodedImageSurfaceSize"), 0);
            if (v65)
              -[BWStillImageErrorAnalyticsPayload setPhotoFileSize:](v20, "setPhotoFileSize:", objc_msgSend(v65, "unsignedIntValue"));
          }
          if (objc_msgSend(v15, "depthDataDeliveryEnabled"))
          {
            AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, (uint64_t)CFSTR("Depth"));
            if (AttachedMedia)
            {
              ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
              -[BWStillImageErrorAnalyticsPayload setDepthFormatDimensionWidth:](v20, "setDepthFormatDimensionWidth:", CVPixelBufferGetWidth(ImageBuffer));
              -[BWStillImageErrorAnalyticsPayload setDepthFormatDimensionHeight:](v20, "setDepthFormatDimensionHeight:", CVPixelBufferGetHeight(ImageBuffer));
              -[BWStillImageErrorAnalyticsPayload setDepthPixelFormat:](v20, "setDepthPixelFormat:", CVPixelBufferGetPixelFormatType(ImageBuffer));
              -[BWStillImageErrorAnalyticsPayload setDepthDataFiltered:](v20, "setDepthDataFiltered:", objc_msgSend(v15, "depthDataFiltered"));
            }
          }
          -[BWStillImageErrorAnalyticsPayload setFocusPixelBlurScoreResult:](v20, "setFocusPixelBlurScoreResult:", CMGetAttachment(a2, CFSTR("FocusPixelBlurScoreResult"), 0));
          -[BWStillImageErrorAnalyticsPayload setFusionMode:](v20, "setFusionMode:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05EF0]), "intValue"));
          v19 = v158;
          goto LABEL_93;
        }
        FigDebugAssert3();
        v21 = v20;
      }
      else
      {
        FigDebugAssert3();
        v21 = v19;
      }
    }
    else
    {
      FigDebugAssert3();
      v21 = 0;
    }
    return v21;
  }
  return result;
}

- (void)_updateMemoryAnalyticsForStillImageWithSampleBuffer:(void *)a3 stillImageSettings:(int)a4 timeSinceLastCaptureInSession:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  int v17;
  char v18;
  void *v19;

  if (!result)
    return result;
  result = (void *)objc_msgSend((id)objc_msgSend(result, "graph"), "memoryAnalyticsPayload");
  if (!result)
    return result;
  v7 = result;
  v8 = (void *)objc_msgSend(a3, "captureSettings");
  v9 = (void *)objc_msgSend(a3, "requestedSettings");
  v10 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v8)
    return (void *)FigDebugAssert3();
  if (!v9)
    return (void *)FigDebugAssert3();
  v11 = v10;
  if (!objc_msgSend(v10, "count"))
    return (void *)FigDebugAssert3();
  v12 = objc_msgSend(v9, "resolutionFlavor");
  v13 = objc_msgSend((id)objc_msgSend(v8, "metadata"), "shallowDepthOfFieldEffectSceneStatus");
  if (!v13
    || (v14 = (void *)v13, objc_msgSend(v7, "setPortraitRequested:", 1),
                           v15 = objc_msgSend(v14, "intValue"),
                           v15 > 0xE)
    || ((1 << v15) & 0x6202) == 0
    || (objc_msgSend(v7, "setPortraitDepthGenerationAttempted:", 1),
        (objc_msgSend((id)CMGetAttachment(a2, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") & 0x40) == 0))
  {
    if ((_DWORD)v12 != 1)
      goto LABEL_17;
LABEL_14:
    if ((objc_msgSend(v8, "captureFlags") & 0x800) != 0
      && (BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(v9, "processedImageFilters")) & 1) == 0)
    {
      objc_msgSend(v7, "setEnhancedResolutionPortraitSuggested:", 1);
    }
    goto LABEL_17;
  }
  objc_msgSend(v7, "setPortraitEffectApplied:", 1);
  if ((_DWORD)v12 == 1)
  {
    objc_msgSend(v7, "setEnhancedResolutionPortraitApplied:", 1);
    goto LABEL_14;
  }
LABEL_17:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = (void *)objc_msgSend(v9, "semanticStyle");
  else
    v16 = 0;
  if ((objc_msgSend(v16, "isIdentity") & 1) == 0)
    objc_msgSend(v7, "setPhotographicStyleUsed:", 1);
  if (BWSampleBufferHasDetectedFaces(a2, 1, 1, 1, 1, 1))
    objc_msgSend(v7, "setFaceDetectedInScene:", 1);
  objc_msgSend(v7, "addCaptureType:", objc_msgSend(v8, "captureType"));
  objc_msgSend(v7, "addDeviceType:", objc_msgSend((id)CMGetAttachment(a2, CFSTR("CaptureDeviceType"), 0), "intValue"));
  objc_msgSend(v7, "addPortType:", objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  if (CMGetAttachment(a2, CFSTR("RawImageSurface"), 0))
  {
    if (CMGetAttachment(a2, CFSTR("EncodedImageSurface"), 0))
      objc_msgSend(v7, "setProRawPlusProcessedPhotoEncoding:", 1);
    else
      objc_msgSend(v7, "setProRaw:", 1);
  }
  v17 = objc_msgSend(v9, "burstQualityCaptureEnabled");
  v18 = v17;
  if (v17)
    objc_msgSend(v7, "setBurst:", 1);
  v19 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F58]);
  if (v19 && (objc_msgSend(v19, "unsignedIntValue") & 2) != 0)
    objc_msgSend(v7, "setGreenGhostMitigation:", 1);
  objc_msgSend(v7, "addHighResolutionFlavor:", v12);
  result = (void *)CMGetAttachment(a2, CFSTR("IntelligentDistortionCorrectionStatusCode"), 0);
  if (result)
    result = (void *)objc_msgSend(v7, "setIntelligentDistortionCorrection:", 1);
  if ((v18 & 1) == 0)
    return (void *)objc_msgSend(v7, "updateButtonMash:", (a4 - 1) < 0x1F3);
  return result;
}

- (BWAutoFocusROIAnalyticsPayload)_autoFocusROIAnalyticsPayloadWithSampleBuffer:(uint64_t)a3 error:(void *)a4 stillImageSettings:(void *)a5 metadata:
{
  uint64_t v6;
  void *v7;
  BWAutoFocusROIAnalyticsPayload *v8;
  uint64_t v9;

  if (!a1)
    return 0;
  if (!a2 || !a5 || (v6 = objc_msgSend(a4, "captureSettings")) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  v7 = (void *)v6;
  v8 = objc_alloc_init(BWAutoFocusROIAnalyticsPayload);
  v9 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  -[BWAutoFocusROIAnalyticsPayload setPortType:](v8, "setPortType:", v9);
  -[BWAutoFocusROIAnalyticsPayload setFocusRegion:](v8, "setFocusRegion:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AA0]), "lastObject"));
  -[BWAutoFocusROIAnalyticsPayload setFocusRegionType:](v8, "setFocusRegionType:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AA8]), "intValue"));
  objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A88]), "floatValue");
  -[BWAutoFocusROIAnalyticsPayload setSubjectDistance:](v8, "setSubjectDistance:");
  -[BWAutoFocusROIAnalyticsPayload setClientApplicationID:](v8, "setClientApplicationID:", objc_msgSend(v7, "applicationID"));
  if (v9)
    -[BWAutoFocusROIAnalyticsPayload setLuxLevel:](v8, "setLuxLevel:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "frameStatisticsByPortType"), "objectForKeyedSubscript:", v9), "luxLevel"));
  return v8;
}

- (id)sampleBufferAvailableHandler
{
  return self->_sampleBufferAvailableHandler;
}

@end
