@implementation BWStillImageBravoDisparityNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageBravoDisparityNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 disparityMapWidth:(unint64_t)a5 disparityMapHeight:(unint64_t)a6 outputDisparityBufferCount:(int)a7
{
  BWStillImageBravoDisparityNode *v12;
  BWVideoFormatRequirements *v13;
  BWVideoFormatRequirements *v14;
  BWNodeOutput *v15;
  BWNodeOutputMediaConfiguration *v16;
  BWVideoFormatRequirements *v17;
  BWNodeOutputMediaConfiguration *v18;
  BWVideoFormatRequirements *v19;
  int v20;
  BWNodeInputMediaConfiguration *v21;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)BWStillImageBravoDisparityNode;
  v12 = -[BWNode init](&v23, sel_init);
  if (v12)
  {
    v12->_sensorConfigurationsByPortType = (NSDictionary *)a4;
    v12->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v12->_wideInput = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v12, 0);
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", &unk_1E4A01B08);
    -[BWNodeInput setFormatRequirements:](v12->_wideInput, "setFormatRequirements:", v13);

    -[BWNodeInput setPassthroughMode:](v12->_wideInput, "setPassthroughMode:", 0);
    -[BWNodeInput setRetainedBufferCount:](v12->_wideInput, "setRetainedBufferCount:", 1);
    -[BWNodeInput setName:](v12->_wideInput, "setName:", CFSTR("Wide"));
    -[BWNode addInput:](v12, "addInput:", v12->_wideInput);

    v12->_telephotoInput = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v12, 1);
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", &unk_1E4A01B20);
    -[BWNodeInput setFormatRequirements:](v12->_telephotoInput, "setFormatRequirements:", v14);

    -[BWNodeInput setPassthroughMode:](v12->_telephotoInput, "setPassthroughMode:", 1);
    -[BWNodeInput setRetainedBufferCount:](v12->_telephotoInput, "setRetainedBufferCount:", 1);
    -[BWNodeInput setName:](v12->_telephotoInput, "setName:", CFSTR("Telephoto"));
    -[BWNode addInput:](v12, "addInput:", v12->_telephotoInput);

    v15 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v12);
    v16 = -[BWNodeOutput primaryMediaConfiguration](v15, "primaryMediaConfiguration");
    v17 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v17, "setSupportedPixelFormats:", &unk_1E4A01B38);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", v17);

    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v16, "setProvidesPixelBufferPool:", 0);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 1);
    v24[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BWNodeInput index](v12->_wideInput, "index"));
    v24[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BWNodeInput index](v12->_telephotoInput, "index"));
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](v16, "setIndexesOfInputsWhichDrivesThisOutput:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2));
    v18 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v19, "setSupportedPixelFormats:", &unk_1E4A01B50);
    -[BWVideoFormatRequirements setWidth:](v19, "setWidth:", a5);
    -[BWVideoFormatRequirements setHeight:](v19, "setHeight:", a6);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v18, "setFormatRequirements:", v19);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v18, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v18, "setProvidesPixelBufferPool:", 1);
    if (a7)
      -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v18, "setOwningNodeRetainedBufferCount:", (a7 - 1));
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v15, "setMediaConfiguration:forAttachedMediaKey:", v18, CFSTR("Depth"));
    v20 = -[BWStillImageNodeConfiguration depthDataType](v12->_nodeConfiguration, "depthDataType");
    v12->_disparityInputIsRaw = v20 == 2;
    if (v20 == 2)
    {
      v21 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v21, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v21, "setPassthroughMode:", 0);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v12->super._input, "setMediaConfiguration:forAttachedMediaKey:", v21, 0x1E495AED8);
    }
    -[BWNode addOutput:](v12, "addOutput:", v15);

    v12->_disparityMapWidth = a5;
    v12->_disparityMapHeight = a6;
  }
  return v12;
}

- (void)dealloc
{
  opaqueCMFormatDescription *disparityFormatDescription;
  objc_super v4;

  if (self)
    objc_msgSend((id)-[FigDisparityGenerator metalContext](self->_disparityGenerator, "metalContext"), "waitForIdle");
  -[BWStillImageBravoDisparityNode _clearCaptureRequestState]((uint64_t)self);

  disparityFormatDescription = self->_disparityFormatDescription;
  if (disparityFormatDescription)
    CFRelease(disparityFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWStillImageBravoDisparityNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (void)_clearCaptureRequestState
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  if (a1)
  {

    *(_QWORD *)(a1 + 152) = 0;
    *(_DWORD *)(a1 + 168) = 0;
    *(_DWORD *)(a1 + 160) = 0;
    *(_DWORD *)(a1 + 164) = 0;
    *(_BYTE *)(a1 + 193) = 0;
    v2 = *(const void **)(a1 + 176);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 176) = 0;
    }
    v3 = *(const void **)(a1 + 184);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 184) = 0;
    }
    v4 = *(const void **)(a1 + 200);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 200) = 0;
    }
    v5 = *(const void **)(a1 + 208);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 208) = 0;
    }
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWNodeOutputMediaProperties *v8;

  if (self->_telephotoInput == a4 && (objc_msgSend(a5, "isEqualToString:", 0x1E495AED8) & 1) == 0)
  {
    v8 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a5);
    if (!v8)
    {
      v8 = objc_alloc_init(BWNodeOutputMediaProperties);
      -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](self->super._output, "_setMediaProperties:forAttachedMediaKey:", v8, a5);
    }
    -[BWNodeOutputMediaProperties setResolvedFormat:](v8, "setResolvedFormat:", a3);
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("DisparityGenerator");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BWNodeInput *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)BWStillImageBravoDisparityNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v13, sel_prepareForCurrentConfigurationToBecomeLive);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = -[BWNode inputs](self, "inputs");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(BWNodeInput **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (v8 != self->super._input)
          -[BWFormat isEqual:](-[BWNodeInput format](v8, "format"), "isEqual:", -[BWNodeInput format](self->super._input, "format"));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }
  if (-[BWStillImageBravoDisparityNode _loadAndConfigureDisparityGenerator]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadAndConfigureDisparityGenerator
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  FigCaptureCameraParameters *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  _QWORD v17[5];
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  if (result)
  {
    v1 = result;
    v21 = 0;
    v2 = -[BWStillImageBravoDisparityNode processorOptionsDictionary](result);
    if (!v2)
      goto LABEL_11;
    v3 = v2;
    v4 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
    v5 = -[FigCaptureCameraParameters disparityVersion](v4, "disparityVersion");
    if (!(_DWORD)v5)
    {
      v6 = -[BWStillImageBravoDisparityNode _sensorConfigurationWithPortraitTuningParameters](v1);
      if (!v6)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
      v5 = -[FigCaptureCameraParameters disparityVersionForPortType:sensorIDString:](v4, "disparityVersionForPortType:sensorIDString:", objc_msgSend(v6, "portType"), objc_msgSend(v6, "sensorIDString"));
    }
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors"), CFSTR("Disparity"), v5);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
    if (v8)
    {
      v9 = v8;
      if (!objc_msgSend(v8, "loadAndReturnError:", &v21))
        return 4294954510;
      v10 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "principalClass")), "initWithCommandQueue:", objc_msgSend(*(id *)(v1 + 224), "metalCommandQueue"));
      *(_QWORD *)(v1 + 104) = v10;
      if (v10)
      {
        objc_msgSend(v10, "setOptions:", v3);
        v11 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "width");
        v12 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "height");
        v13 = *(_QWORD *)(v1 + 128);
        v14 = *(_QWORD *)(v1 + 136);
        v15 = *(void **)(v1 + 104);
        v17[0] = v11;
        v17[1] = v12;
        v17[2] = 0;
        v17[3] = v13;
        v17[4] = v14;
        v18 = 1067030938;
        v19 = 0x1800000020;
        v20 = 0;
        objc_msgSend(v15, "setDisparityConfig:", v17);
        v16 = objc_msgSend(*(id *)(v1 + 104), "prepareToProcess:", 0);
        result = 0;
        if (!v16)
          return result;
        return FigSignalErrorAt();
      }
      fig_log_get_emitter();
    }
    else
    {
LABEL_11:
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
    -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;

  if (!a3)
    goto LABEL_17;
  v7 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (!v7)
    goto LABEL_17;
  v8 = v7;
  if (!self->_currentStillImageSettings
    || (v9 = objc_msgSend(v7, "settingsID"),
        v9 != -[BWStillImageSettings settingsID](self->_currentStillImageSettings, "settingsID")))
  {
    -[BWStillImageBravoDisparityNode _configureCurrentCaptureRequestStateWithStillImageSettings:]((uint64_t)self, v8);
  }
  if (!self->_processingMode)
    goto LABEL_14;
  if (self->_disparityInputIsRaw && !BWSampleBufferGetAttachedMedia(a3, 0x1E495AED8))
  {
LABEL_17:
    -[BWStillImageBravoDisparityNode _handleError:duringProcessingOfSampleBuffer:fromInput:](self, 4294954516, a3, (uint64_t)a4);
    goto LABEL_14;
  }
  if (self->_wideInput == a4)
  {
    v10 = (objc_class *)CFRetain(a3);
    v11 = 184;
  }
  else
  {
    if (self->_telephotoInput != a4)
      goto LABEL_14;
    v10 = (objc_class *)CFRetain(a3);
    v11 = 176;
  }
  *(Class *)((char *)&self->super.super.isa + v11) = v10;
LABEL_14:
  if (self->_processingMode)
  {
    -[BWStillImageBravoDisparityNode _processBuffersForDisparityIfNecessary]((uint64_t)self);
  }
  else
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    -[BWStillImageBravoDisparityNode _clearCaptureRequestState]((uint64_t)self);
  }
}

- (uint64_t)_configureCurrentCaptureRequestStateWithStillImageSettings:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    -[BWStillImageBravoDisparityNode _clearCaptureRequestState](result);
    *(_QWORD *)(v3 + 152) = a2;
    *(_BYTE *)(v3 + 192) = 1;
    *(_BYTE *)(v3 + 193) = 0;
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 152), "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 152), "captureSettings", 0), "captureStreamSettings");
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v15;
        v8 = *MEMORY[0x1E0D05A30];
        while (2)
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v15 != v7)
              objc_enumerationMutation(v4);
            if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "portType"), "isEqualToString:", v8) & 1) != 0)
            {
              v10 = 2;
              v11 = 3;
              goto LABEL_13;
            }
            ++v9;
          }
          while (v6 != v9);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v6)
            continue;
          break;
        }
      }
      v10 = 7;
      v11 = 2;
LABEL_13:
      v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 152), "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes");
      *(_BYTE *)(v3 + 192) = objc_msgSend(v12, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11));
      v13 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 152), "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes");
      *(_BYTE *)(v3 + 193) = objc_msgSend(v13, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10));
    }
    return -[BWStillImageBravoDisparityNode _resolveProcessingMode](v3);
  }
  return result;
}

- (_QWORD)_handleError:(CMAttachmentBearerRef)target duringProcessingOfSampleBuffer:(uint64_t)a4 fromInput:
{
  _QWORD *v5;
  int *v6;

  if (result)
  {
    v5 = result;
    result = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, v5, v5[19], CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
    if (v5[14] == a4)
      v6 = &OBJC_IVAR___BWStillImageBravoDisparityNode__errorForWide;
    else
      v6 = &OBJC_IVAR___BWStillImageBravoDisparityNode__errorForTele;
    *(_QWORD *)((char *)v5 + *v6) = result;
  }
  return result;
}

- (void)_processBuffersForDisparityIfNecessary
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v9;
  char v10;
  const void *v11;
  const void *v12;
  id v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  if (!a1)
    return;
  if (*(_DWORD *)(a1 + 168))
  {
    if (*(_QWORD *)(a1 + 104))
    {
      v3 = *(void **)(a1 + 208);
      if (!v3)
      {
        v6 = 0;
        goto LABEL_11;
      }
      if (!*(_QWORD *)(a1 + 184))
      {
        v4 = *(void **)(a1 + 200);
        v5 = v3;
        goto LABEL_8;
      }
      v18 = v3;
    }
    else
    {
      v18 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, a1, *(_QWORD *)(a1 + 152), 0);
    }
    v6 = v18;
LABEL_50:
    objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", v6);
    v10 = 0;
    LODWORD(v11) = 1;
LABEL_27:
    if (*(_BYTE *)(a1 + 193))
    {
      v12 = *(const void **)(a1 + 184);
      if (v12)
      {
        BWSampleBufferRemoveAttachedMedia(v12, 0x1E495AED8);
        objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", *(_QWORD *)(a1 + 184));
      }
      else
      {
        v13 = *(id *)(a1 + 200);
        if (!v13)
          v13 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, a1, *(_QWORD *)(a1 + 152), 0);
        objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", v13, v19, v20);

      }
    }
    goto LABEL_34;
  }
  v4 = *(void **)(a1 + 208);
  v5 = v4;
LABEL_8:
  v6 = v5;
  if (v4)
    goto LABEL_50;
LABEL_11:
  v7 = *(_DWORD *)(a1 + 168);
  if ((v7 - 2) >= 2 && v7 != 1 && v7 != 4)
  {
    v10 = 0;
    LODWORD(v11) = 0;
    goto LABEL_34;
  }
  v11 = *(const void **)(a1 + 176);
  if (v11)
  {
    v9 = *(void **)(a1 + 184);
    if (v9)
    {
      -[BWStillImageBravoDisparityNode _computeDisparityForTeleBuffer:wideBuffer:attachToOutputBuffer:](a1, *(const void **)(a1 + 176), v9, *(void **)(a1 + 176));
      v10 = 1;
LABEL_22:
      if (*(_BYTE *)(a1 + 192))
      {
        if (!*(_QWORD *)(a1 + 176))
        {
          fig_log_get_emitter();
          v20 = v1;
          LODWORD(v19) = 0;
          FigDebugAssert3();
        }
        BWSampleBufferRemoveAttachedMedia(v11, 0x1E495AED8);
        objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v11);
      }
      LODWORD(v11) = 0;
      goto LABEL_27;
    }
    v10 = 0;
    if (*(_QWORD *)(a1 + 200))
      goto LABEL_22;
    LODWORD(v11) = 0;
  }
  else
  {
    v10 = 0;
  }
LABEL_34:
  if ((v10 & 1) != 0 || (_DWORD)v11)
  {
    v14 = *(const void **)(a1 + 176);
    if (v14)
    {
      CFRelease(v14);
      *(_QWORD *)(a1 + 176) = 0;
    }
    v15 = *(const void **)(a1 + 184);
    if (v15)
    {
      CFRelease(v15);
      *(_QWORD *)(a1 + 184) = 0;
    }
    v16 = *(const void **)(a1 + 208);
    if (v16)
    {
      CFRelease(v16);
      *(_QWORD *)(a1 + 208) = 0;
    }
    v17 = *(const void **)(a1 + 200);
    if (v17)
    {
      CFRelease(v17);
      *(_QWORD *)(a1 + 200) = 0;
    }

    ++*(_DWORD *)(a1 + 164);
  }
  if (*(_DWORD *)(a1 + 160) == *(_DWORD *)(a1 + 164))
    -[BWStillImageBravoDisparityNode _clearCaptureRequestState](a1);
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  uint64_t v7;

  if (!self->_currentStillImageSettings
    || (v7 = objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "settingsID"),
        v7 != -[BWStillImageSettings settingsID](self->_currentStillImageSettings, "settingsID")))
  {
    -[BWStillImageBravoDisparityNode _configureCurrentCaptureRequestStateWithStillImageSettings:]((uint64_t)self, (void *)objc_msgSend(a3, "stillImageSettings"));
  }
  if (self->_currentStillImageSettings)
  {
    if (self->_wideInput == a4)
      self->_errorForWide = (BWNodeError *)a3;
    if (self->_telephotoInput == a4)
    {

      self->_errorForTele = (BWNodeError *)a3;
    }
    -[BWStillImageBravoDisparityNode _processBuffersForDisparityIfNecessary]((uint64_t)self);
  }
  else
  {
    -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
  }
}

- (void)setShouldComputeDisparityWhenCalibrationFails:(BOOL)a3
{
  self->_shouldComputeDisparityWhenCalibrationFails = a3;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  return self->_shouldComputeDisparityWhenCalibrationFails;
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (uint64_t)processorOptionsDictionary
{
  uint64_t v1;
  NSDictionary *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = -[FigCaptureCameraParameters stereoDisparityParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "stereoDisparityParameters");
    if (v2
      || (v3 = -[BWStillImageBravoDisparityNode _sensorConfigurationWithPortraitTuningParameters](v1)) != 0
      && (v2 = (NSDictionary *)objc_msgSend((id)objc_msgSend(v3, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("DisparityParameters"))) != 0)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = (void *)objc_msgSend(*(id *)(v1 + 96), "allValues");
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "cameraInfo"), objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "portType"));
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
        }
        while (v7);
      }
      if (objc_msgSend(v4, "count"))
      {
        v10 = *MEMORY[0x1E0D06140];
        v15[0] = *MEMORY[0x1E0D06188];
        v15[1] = v10;
        v16[0] = v2;
        v16[1] = v4;
        return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (void)_sensorConfigurationWithPortraitTuningParameters
{
  FigCaptureCameraParameters *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  if (-[FigCaptureCameraParameters stereoDisparityParameters](v2, "stereoDisparityParameters"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 96), "allValues", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_5:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(v3);
    v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if (-[FigCaptureCameraParameters disparityVersionForPortType:sensorIDString:](v2, "disparityVersionForPortType:sensorIDString:", objc_msgSend(v8, "portType"), objc_msgSend(v8, "sensorIDString")))
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_5;
      return 0;
    }
  }
}

- (uint64_t)_computeDisparityForTeleBuffer:(void *)a3 wideBuffer:(void *)a4 attachToOutputBuffer:
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  __CVBuffer *v10;
  _BOOL8 v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  CFStringRef *v18;
  id v19;
  BWAggdDataReporter *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  opaqueCMSampleBuffer *target;
  CFTypeRef cf;

  if (result)
  {
    v8 = result;
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "livePixelBufferPool"), "newPixelBuffer");
    if (v9)
    {
      v10 = (__CVBuffer *)v9;
      objc_msgSend(*(id *)(v8 + 104), "setShouldComputeDisparityWhenCalibrationFails:", *(unsigned __int8 *)(v8 + 216));
      v11 = (objc_msgSend((id)objc_msgSend(*(id *)(v8 + 152), "captureSettings"), "captureFlags") & 0x20000) != 0
         && objc_msgSend((id)objc_msgSend(*(id *)(v8 + 152), "captureSettings"), "captureType") == 10;
      objc_msgSend(*(id *)(v8 + 104), "setEqualizeTeleGainToMatchReference:", v11);
      if (*(_BYTE *)(v8 + 217))
      {
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(AttachedMedia, 0x1E495AED8);
        v12 = BWSampleBufferGetAttachedMedia(a3, 0x1E495AED8);
      }
      else
      {
        v12 = (uint64_t)a3;
      }
      objc_msgSend(*(id *)(v8 + 104), "setReferenceSampleBuffer:", AttachedMedia);
      objc_msgSend(*(id *)(v8 + 104), "setAuxiliarySampleBuffer:", v12);
      objc_msgSend(*(id *)(v8 + 104), "setOutputShiftmap:", v10);
      v13 = objc_msgSend(*(id *)(v8 + 104), "process");
      v14 = v13 & 0xFFFFFFFE;
      if (!v13 || v14 == 2 && *(_BYTE *)(v8 + 216))
      {
        target = (opaqueCMSampleBuffer *)a3;
        objc_msgSend((id)objc_msgSend(*(id *)(v8 + 104), "metalContext"), "waitForSchedule");
        v15 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v16 = (void *)objc_msgSend(*(id *)(v8 + 104), "shiftMapMetadata");
        if (v16)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(v8 + 96), "objectForKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), "sensorIDDictionary");
          v17 = sidn_depthMetadataAttachmentDictionaryFromBravoDisparityMetadata(v16, (opaqueCMSampleBuffer *)a4, 1, v14 == 2);
        }
        else
        {
          v17 = 0;
        }
        cf = 0;
        if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)a4, v10, (CFTypeRef *)(v8 + 144), (CMSampleBufferRef *)&cf))
        {
          BWSampleBufferSetAttachedMedia(a4, (uint64_t)CFSTR("Depth"), (uint64_t)cf);
          if (cf)
            CFRelease(cf);
        }
        if (objc_msgSend(*(id *)(v8 + 104), "disparityDiagnosticMetadata"))
          objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v8 + 104), "disparityDiagnosticMetadata"), CFSTR("Disparity"));
        v18 = (CFStringRef *)MEMORY[0x1E0D086F0];
        if (v17)
          CMSetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D086F0], v17, 1u);
        if (*(_BYTE *)(v8 + 193))
        {
          v19 = sidn_depthMetadataAttachmentDictionaryFromBravoDisparityMetadata(v16, target, 0, v14 == 2);
          if (v19)
            CMSetAttachment(target, *v18, v19, 1u);
        }
      }
      v20 = +[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance");
      if (v13 > 3)
        v21 = 4294949886;
      else
        v21 = dword_1A32B1660[v13];
      -[BWAggdDataReporter reportSDOFSampleBufferProcessorProcessingStatus:](v20, "reportSDOFSampleBufferProcessorProcessingStatus:", v21);
      CFRelease(v10);
    }
    else
    {
      fig_log_get_emitter();
      v23 = v4;
      LODWORD(v22) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(*(id *)(v8 + 104), "setShouldComputeDisparityWhenCalibrationFails:", 0, v22, v23);
    objc_msgSend(*(id *)(v8 + 104), "setEqualizeTeleGainToMatchReference:", 0);
    objc_msgSend(*(id *)(v8 + 104), "setReferenceSampleBuffer:", 0);
    objc_msgSend(*(id *)(v8 + 104), "setAuxiliarySampleBuffer:", 0);
    return objc_msgSend(*(id *)(v8 + 104), "setOutputShiftmap:", 0);
  }
  return result;
}

- (uint64_t)_resolveProcessingMode
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    *(_DWORD *)(result + 168) = 0;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 152), "captureSettings"), "captureFlags");
    if ((result & 0x800) != 0)
    {
      *(_DWORD *)(v1 + 168) = 1;
      *(_DWORD *)(v1 + 160) = 1;
      if (!*(_BYTE *)(v1 + 217)
        && (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "captureSettings"), "captureType") == 3
         || (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "captureSettings"), "captureFlags") & 0x100000) != 0))
      {
        *(_DWORD *)(v1 + 168) = 3;
        result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "captureSettings"), "deliverOriginalImage");
        if ((_DWORD)result)
        {
          *(_DWORD *)(v1 + 168) = 2;
          ++*(_DWORD *)(v1 + 160);
        }
      }
      else
      {
        result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "captureSettings"), "captureType");
        if ((_DWORD)result == 7)
        {
          *(_DWORD *)(v1 + 168) = 4;
          result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 152), "requestedSettings"), "bracketImageCount");
          *(_DWORD *)(v1 + 160) = result;
        }
      }
    }
  }
  return result;
}

- (BWNodeInput)wideInput
{
  return self->_wideInput;
}

- (BWNodeInput)telephotoInput
{
  return self->_telephotoInput;
}

@end
