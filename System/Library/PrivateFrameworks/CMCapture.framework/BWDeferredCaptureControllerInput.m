@implementation BWDeferredCaptureControllerInput

- (BWDeferredCaptureControllerInput)initWithSettings:(id)a3 configuration:(id)a4 sourceNodePixelBufferAttributes:(id)a5
{
  uint64_t v9;
  BWDeferredCaptureControllerInput *v10;
  int v11;
  BWDeferredCaptureContainer *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "masterPortType");
  v24.receiver = self;
  v24.super_class = (Class)BWDeferredCaptureControllerInput;
  v10 = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v24, sel_initWithSettings_portType_, a3, v9);
  if (v10)
  {
    v10->_settings = (BWStillImageSettings *)a3;
    v10->_configuration = (BWDeferredCaptureControllerConfiguration *)a4;
    v11 = 1;
    if (objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureType") != 12)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x80) != 0)
        v11 = 1;
      else
        v11 = 2;
    }
    v10->_compressionProfile = v11;
    v23 = 0;
    v12 = -[BWDeferredCaptureContainerManager createCaptureContainerWithApplicationID:captureRequestIdentifier:err:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "createCaptureContainerWithApplicationID:captureRequestIdentifier:err:", objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "applicationID"), objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "captureRequestIdentifier"), &v23);
    v10->_captureContainer = v12;
    if (v12)
    {
      -[BWDeferredCaptureContainerManager addCaptureContainer:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "addCaptureContainer:", v10->_captureContainer);
      -[BWDeferredCaptureContainer commitCaptureSettings:settings:](v10->_captureContainer, "commitCaptureSettings:settings:", objc_msgSend(a3, "captureSettings"), objc_msgSend(a3, "requestedSettings"));
      -[BWDeferredCaptureContainer commitDictionary:tag:](v10->_captureContainer, "commitDictionary:tag:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](v10->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v9), "cameraInfo"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagCameraInfoByPortTypePrefix, v9));
      if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "secondaryPortTypes");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v20 != v16)
                objc_enumerationMutation(v13);
              -[BWDeferredCaptureContainer commitDictionary:tag:](v10->_captureContainer, "commitDictionary:tag:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](v10->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i)), "cameraInfo"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagCameraInfoByPortTypePrefix, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i)));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
          }
          while (v15);
        }
      }
      -[BWDeferredCaptureContainer commitDictionary:tag:](v10->_captureContainer, "commitDictionary:tag:", a5, BWDeferredIntermediateTagSourceNodePixelBufferAttributes);
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredCaptureControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v3, sel_dealloc);
}

- (BWDeferredPipelineParameters)pipelineParameters
{
  return -[BWDeferredContainer pipelineParameters](self->_captureContainer, "pipelineParameters");
}

- (void)addPhotoDescriptor:(id)a3
{
  -[BWDeferredCaptureContainer commitPhotoDescriptor:](self->_captureContainer, "commitPhotoDescriptor:", a3);
  -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedIntermediate:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedIntermediate:", self);
}

- (void)addBuffer:(__CVBuffer *)a3 bufferType:(unint64_t)a4 captureFrameFlags:(unint64_t)a5 metadata:(id)a6 rawThumbnailsBuffer:(__CVBuffer *)a7 rawThumbnailsMetadata:(id)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v24;

  v24 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  if (a6)
  {
    v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (a7)
      goto LABEL_3;
LABEL_6:
    v14 = 0;
    if (a8)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v13 = 0;
  if (!a7)
    goto LABEL_6;
LABEL_3:
  v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  if (!a8)
    goto LABEL_7;
LABEL_4:
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
LABEL_8:
  v16 = -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType");
  if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") & 4) != 0&& objc_msgSend((id)objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1)
  {
    -[BWDeferredPipelineParameters setQuadraProcessingSupportEnabled:](-[BWDeferredCaptureControllerInput pipelineParameters](self, "pipelineParameters"), "setQuadraProcessingSupportEnabled:", 1);
  }
  v17 = -[BWDeferredCaptureContainer commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:](self->_captureContainer, "commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:", a3, v24, a4, a5, self->_compressionProfile, v13, v14, v15, 0, 0, 0, 0, v16);
  if ((_DWORD)v17)
  {
    v21 = v17;
  }
  else if (a6
         && (v18 = -[BWDeferredCaptureContainer commitMetadata:tag:bufferTag:](self->_captureContainer, "commitMetadata:tag:bufferTag:", a6, v13, v24), (_DWORD)v18))
  {
    v21 = v18;
  }
  else if (a7
         && (v19 = -[BWDeferredCaptureContainer commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:portType:](self->_captureContainer, "commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:portType:", a7, v14, 37, 0, self->_compressionProfile, v15, v16), (_DWORD)v19))
  {
    v21 = v19;
  }
  else
  {
    if (!a8
      || (v20 = -[BWDeferredCaptureContainer commitMetadata:tag:bufferTag:](self->_captureContainer, "commitMetadata:tag:bufferTag:", a8, v15, v24), !(_DWORD)v20))
    {
      -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedIntermediate:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedIntermediate:", self);
      return;
    }
    v21 = v20;
  }
  FigDebugAssert3();
  -[BWDeferredCaptureControllerInput encounteredProcessingError:](self, "encounteredProcessingError:", v21);
}

- (void)addSensorRawSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t *v4;
  __CVBuffer *ImageBuffer;
  OSType PixelFormatType;
  const __CFString *v8;
  char v9;
  __CVBuffer *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  const void *v20;
  uint64_t v21;
  CVPixelBufferRef pixelBuffer;
  __CVBuffer *v23;
  __CVBuffer *buffer;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v32;
  BWDeferredCaptureControllerInput *v33;
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v4 = &v36;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  if (!a3)
    goto LABEL_36;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  pixelBuffer = ImageBuffer;
  if (!ImageBuffer)
    goto LABEL_35;
  PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  if (!FigCapturePixelFormatIsVersatileRaw(PixelFormatType))
  {
    v27 = 0;
    v26 = 0;

    goto LABEL_30;
  }
  v8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v29 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v29
    || (v20 = BWStillImageCaptureFrameFlagsForSampleBuffer(a3),
        v25 = (void *)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]),
        v9 = objc_msgSend(v25, "isEqualToString:", -[BWStillImageProcessorControllerInput portType](self, "portType")),
        !(v9 & 1 | (-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") >> 38) & 1)))
  {
LABEL_35:
    v4 = v37;
LABEL_36:
    v27 = 0;
    v26 = 0;
    *((_DWORD *)v4 + 6) = -12780;

    goto LABEL_30;
  }
  buffer = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D30], 0);
  v28 = (void *)CVBufferCopyAttachment(buffer, v8, 0);
  v23 = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CA8], 0);
  v27 = (void *)CVBufferCopyAttachment(v23, v8, 0);
  v10 = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D48], 0);
  v26 = (void *)CVBufferCopyAttachment(v10, v8, 0);
  v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  if (buffer)
    v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  else
    v12 = 0;
  if (v28)
    v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  else
    v13 = 0;
  if (v23)
    v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  else
    v14 = 0;
  if (!v27)
  {
    v15 = 0;
    if (v10)
      goto LABEL_17;
LABEL_19:
    v16 = 0;
    goto LABEL_20;
  }
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  if (!v10)
    goto LABEL_19;
LABEL_17:
  v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
LABEL_20:
  if (v26)
    v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  else
    v17 = 0;
  if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "captureFlags") & 4) != 0&& objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1)
  {
    -[BWDeferredPipelineParameters setQuadraProcessingSupportEnabled:](-[BWDeferredCaptureControllerInput pipelineParameters](self, "pipelineParameters"), "setQuadraProcessingSupportEnabled:", 1);
  }
  v18 = -[BWDeferredCaptureContainer commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:](self->_captureContainer, "commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:", pixelBuffer, v21, 1, v20, self->_compressionProfile, v11, v12, v13, v14, v15, v16, v17, v25);
  *((_DWORD *)v37 + 6) = v18;
  if (v18
    || (v19 = -[BWDeferredCaptureContainer commitMetadata:tag:bufferTag:](self->_captureContainer, "commitMetadata:tag:bufferTag:", v29, v11, v21), (*((_DWORD *)v37 + 6) = v19) != 0))
  {
    FigDebugAssert3();
  }
  else
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v31 = __61__BWDeferredCaptureControllerInput_addSensorRawSampleBuffer___block_invoke;
    v32 = &unk_1E4927D60;
    v35 = &v36;
    v33 = self;
    v34 = v25;
    __61__BWDeferredCaptureControllerInput_addSensorRawSampleBuffer___block_invoke((uint64_t)v30, 37, (uint64_t)buffer, v12, (uint64_t)v28, v13);
    __61__BWDeferredCaptureControllerInput_addSensorRawSampleBuffer___block_invoke((uint64_t)v30, 37, (uint64_t)v23, v14, (uint64_t)v27, v15);
    v31((uint64_t)v30, 37, (uint64_t)v10, v16, (uint64_t)v26, v17);
  }

LABEL_30:
  if (*((_DWORD *)v37 + 6))
  {
    -[BWDeferredCaptureControllerInput encounteredProcessingError:](self, "encounteredProcessingError:");
  }
  else if (self)
  {
    -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedIntermediate:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedIntermediate:", self);
  }
  _Block_object_dispose(&v36, 8);
}

uint64_t __61__BWDeferredCaptureControllerInput_addSensorRawSampleBuffer___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;

  v9 = result;
  if (!a3)
  {
    if (!a5)
      return result;
    goto LABEL_6;
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 56), "commitBuffer:tag:bufferType:captureFrameFlags:compressionProfile:metadataTag:portType:", a3, a4, a2, 0, *(unsigned int *)(*(_QWORD *)(result + 32) + 64), a6, *(_QWORD *)(result + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 48) + 8) + 24) = result;
  if (a5 && !*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 48) + 8) + 24))
  {
LABEL_6:
    result = objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 56), "commitMetadata:tag:bufferTag:", a5, a6, a4);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 48) + 8) + 24) = result;
  }
  return result;
}

- (void)addDictionary:(id)a3 tag:(id)a4
{
  -[BWDeferredCaptureControllerInput _addDictionary:tag:](self, "_addDictionary:tag:", a3, a4);
  if (self)
    -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedIntermediate:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedIntermediate:", self);
}

- (void)_addInferenceBuffer:(__CVBuffer *)a3 metadata:(id)a4 inferenceAttachedMediaKey:(id)a5 portType:(id)a6
{
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (a4)
      v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    else
      v12 = 0;
    -[BWDeferredCaptureContainer commitInferenceBuffer:tag:metadataTag:inferenceAttachedMediaKey:compressionProfile:portType:](self->_captureContainer, "commitInferenceBuffer:tag:metadataTag:inferenceAttachedMediaKey:compressionProfile:portType:", a3, v11, v12, a5, self->_compressionProfile, a6);
    if (a4)
    {
      if (-[BWDeferredCaptureContainer commitMetadata:tag:bufferTag:](self->_captureContainer, "commitMetadata:tag:bufferTag:", a4, v12, v11))
      {
        FigDebugAssert3();
      }
    }
  }
}

- (void)_addInference:(id)a3 inferenceAttachmentKey:(id)a4 portType:(id)a5
{
  if (a3)
    -[BWDeferredCaptureContainer commitInference:tag:inferenceAttachmentKey:portType:](self->_captureContainer, "commitInference:tag:inferenceAttachmentKey:portType:", a3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), a4, a5);
}

- (void)_addDictionary:(id)a3 tag:(id)a4
{
  if (a3)
  {
    if (!-[BWDeferredContainer hasTag:](self->_captureContainer, "hasTag:", a4))
      -[BWDeferredCaptureContainer commitDictionary:tag:](self->_captureContainer, "commitDictionary:tag:", a3, a4);
  }
}

- (void)_showDeferredCaptureTapToRadarPromptIfNecessaryForProcessingError:(uint64_t)a1
{
  const __CFString *v4;
  const __CFString *v5;
  CFPropertyListRef v6;
  const void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (a1 && FigCaptureOSVariantHasInternalUI())
  {
    v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v6 = (id)CFPreferencesCopyValue(CFSTR("LastShownDeferredCaptureFailedTTRPromptDate"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v7 = (const void *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "isDate:inSameDayAsDate:", v6, v7))
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ssZ"));
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "captureSettings"), "settingsID");
      v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "requestedSettings"), "captureRequestIdentifier");
      v12 = objc_msgSend(v9, "stringWithFormat:", CFSTR("Deferred capture for captureID: %lld and captureRequestIdentifier: %@ failed with error: %d at %@"), v10, v11, a2, objc_msgSend(v8, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")));

      FigCapturePromptOpenTapToRadar((uint64_t)CFSTR("Photo capture for a deferred asset hit a problem, and a lower-quality final proxy photo has been delivered to your library. File a radar with a sysdiagnose?"), (uint64_t)CFSTR("Deferred photo failed at capture time"), v12, 1, 2, 6, 0.0);
      CFPreferencesSetValue(CFSTR("LastShownDeferredCaptureFailedTTRPromptDate"), v7, CFSTR("com.apple.cameracapture.volatile"), v4, v5);
    }
  }
}

- (void)encounteredProcessingError:(int)a3
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = *(_QWORD *)&a3;
  -[BWDeferredCaptureControllerInput _showDeferredCaptureTapToRadarPromptIfNecessaryForProcessingError:]((uint64_t)self, *(uint64_t *)&a3);
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  -[BWDeferredCaptureContainerManager abortContainer:error:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "abortContainer:error:", -[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageSettings requestedSettings](self->_settings, "requestedSettings"), "captureRequestIdentifier"), v3);
  -[BWStillImageProcessorControllerInputUpdatesDelegate input:encounteredProcessingError:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "input:encounteredProcessingError:", self, v3);
}

- (void)proxyReadyWithFPNREnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  _QWORD v14[21];

  v3 = a3;
  v14[20] = *MEMORY[0x1E0C80C00];
  self->_proxyBufferReady = 1;
  if (!-[BWDeferredContainer hasTag:](self->_captureContainer, "hasTag:", BWDeferredIntermediateTagModuleCalibrationByPortType))
  {
    v5 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", -[BWStillImageProcessorControllerInput portType](self, "portType")), "moduleCalibration");
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend((id)objc_msgSend(v7, "blacklevelShadingCorrectionThumbnails"), "setEncodingOptions:", 1);
      if (v3)
      {
        if (objc_msgSend((id)objc_msgSend(v6, "shadingFPNCorrectionImage"), "pixelBufferFileSystemLocation")
          && objc_msgSend((id)objc_msgSend(v6, "shadingFPNCorrectionImage"), "metadataFileSystemLocation"))
        {
          objc_msgSend((id)objc_msgSend(v7, "shadingFPNCorrectionImage"), "setEncodingOptions:", 4);
        }
        else
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        objc_msgSend(v7, "setShadingFPNCorrectionImage:", 0);
      }
      v13 = -[BWStillImageProcessorControllerInput portType](self, "portType", v11, v12);
      v14[0] = v7;
      v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      -[BWDeferredCaptureContainer commitDictionary:tag:](self->_captureContainer, "commitDictionary:tag:", v10, BWDeferredIntermediateTagModuleCalibrationByPortType);

    }
    else if (v3)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedIntermediate:](-[BWStillImageProcessorControllerInput delegate](self, "delegate", v11, v12), "inputReceivedIntermediate:", self);
}

- (void)depthDataGenerationFailed
{
  self->_depthDataGenerationFailed = 1;
  -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedIntermediate:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedIntermediate:", self);
}

- (void)canProcessEnhancedResolution:(BOOL)a3 skipInferences:(BOOL)a4
{
  _BOOL8 v5;

  v5 = a3;
  -[BWDeferredPipelineParameters setCanProcessEnhancedResolution:](-[BWDeferredCaptureControllerInput pipelineParameters](self, "pipelineParameters"), "setCanProcessEnhancedResolution:", a3);
  self->_skipInferences = a4;
  self->_canProcessEnhancedResolution = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedIntermediate:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedIntermediate:", self);
}

- (id)readyForProcessing
{
  id *v1;
  uint64_t v2;
  int v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  id v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  char v36;
  unsigned int v37;
  _BOOL4 v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  id *v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(result, "captureStreamSettings"), "captureFlags");
    v3 = objc_msgSend((id)objc_msgSend(v1, "captureStreamSettings"), "captureType");
    v4 = (void *)objc_msgSend(v1, "captureStreamSettings");
    if (v3 == 12 && (v2 & 4) != 0)
    {
      v5 = objc_msgSend(v4, "expectedEVZeroFrameCount");
      v6 = objc_msgSend((id)objc_msgSend(v1, "captureStreamSettings"), "expectedLongFrameCount");
      v40 = objc_msgSend((id)objc_msgSend(v1, "captureStreamSettings"), "captureFlags");
      if ((v2 & 0x200000000) != 0)
      {
        v27 = v1[9];
        if (v27)
        {
          v42 = 0;
          v5 -= objc_msgSend(v27, "BOOLValue") ^ 1;
        }
        else
        {
          v42 = 1;
        }
      }
      else
      {
        v42 = 0;
      }
      v43 = v5;
      v41 = v6;
      v39 = objc_msgSend((id)objc_msgSend(v1, "captureSettings"), "captureFlags");
      v28 = (objc_msgSend((id)objc_msgSend(v1, "captureSettings"), "captureFlags") & 0x800) == 0
         || *((_BYTE *)v1 + 69) != 0;
      v38 = v28;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v29 = (void *)objc_msgSend(v1[7], "intermediates");
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v30)
      {
        v31 = v30;
        v45 = 0;
        v32 = 0;
        v44 = 0;
        v47 = 0;
        v33 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v57 != v33)
              objc_enumerationMutation(v29);
            v35 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            if (objc_msgSend(v35, "isMemberOfClass:", objc_opt_class()))
            {
              v36 = objc_msgSend(v35, "captureFrameFlags");
              if (objc_msgSend((id)objc_msgSend(v1, "portType"), "isEqualToString:", objc_msgSend(v35, "portType")))
              {
                if ((v36 & 2) != 0)
                {
                  ++v47;
                }
                else if ((v36 & 8) != 0)
                {
                  ++HIDWORD(v45);
                }
                else if ((v36 & 4) != 0)
                {
                  v44 = 1;
                }
                else
                {
                  LODWORD(v45) = (objc_msgSend(v35, "bufferType") == 2001) | v45;
                }
              }
              else if ((v36 & 0x14) != 0)
              {
                ++v32;
              }
            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        }
        while (v31);
      }
      else
      {
        v45 = 0;
        v32 = 0;
        v44 = 0;
        v47 = 0;
      }
      if (v47 == v43)
      {
        if (v32 == ((v40 >> 38) & 1))
          v17 = (v44 | ((v39 & 0x100000) == 0)) & (HIDWORD(v45) == v41) & (v38 | v45);
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v18 = v42;
    }
    else if (objc_msgSend(v4, "captureType") == 12)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", &unk_1E4A01F10);
      v8 = v7;
      if ((v2 & 0x400000) != 0)
        objc_msgSend(v7, "addObject:", &unk_1E49FC150);
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v46 = v1;
      v10 = (void *)objc_msgSend(v1[7], "intermediates");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v53 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            if (objc_msgSend(v15, "isMemberOfClass:", objc_opt_class()))
            {
              v16 = objc_msgSend(v15, "bufferType");
              objc_msgSend(v15, "captureFrameFlags");
              if ((objc_msgSend(v8, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16)) & 1) == 0)objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16));
              objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16));
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v12);
      }
      v17 = objc_msgSend(v8, "isEqualToSet:", v9);
      v18 = 0;
      v1 = v46;
    }
    else if ((v2 & 0x84) == 0x84)
    {
      v19 = objc_msgSend((id)objc_msgSend(v1, "captureStreamSettings"), "expectedEVZeroFrameCount");
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v20 = (void *)objc_msgSend(v1[7], "intermediates");
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v21)
      {
        v22 = v21;
        v23 = 0;
        v24 = *(_QWORD *)v49;
        do
        {
          for (k = 0; k != v22; ++k)
          {
            if (*(_QWORD *)v49 != v24)
              objc_enumerationMutation(v20);
            v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
            if (objc_msgSend(v26, "isMemberOfClass:", objc_opt_class()))
              v23 += (objc_msgSend(v26, "captureFrameFlags") >> 1) & 1;
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        }
        while (v22);
      }
      else
      {
        v23 = 0;
      }
      v18 = 0;
      v17 = v23 == v19;
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
    v37 = v17 & (v18 ^ 1);
    if (*((_BYTE *)v1 + 68))
      return (id *)v37;
    else
      return 0;
  }
  return result;
}

- (BWDeferredCaptureContainer)captureContainer
{
  return self->_captureContainer;
}

- (int)compressionProfile
{
  return self->_compressionProfile;
}

- (BOOL)skipInferences
{
  return self->_skipInferences;
}

@end
