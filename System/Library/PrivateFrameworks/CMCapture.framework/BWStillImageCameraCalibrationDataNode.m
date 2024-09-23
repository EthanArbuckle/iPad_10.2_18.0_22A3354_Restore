@implementation BWStillImageCameraCalibrationDataNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageCameraCalibrationDataNode)initWithSensorConfigurationsByPortType:(id)a3
{
  BWStillImageCameraCalibrationDataNode *v4;
  BWNodeInput *v5;
  BWNodeOutput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWStillImageCameraCalibrationDataNode;
  v4 = -[BWNode init](&v8, sel_init);
  if (v4)
  {
    v4->_sensorConfigurationsByPortType = (NSDictionary *)a3;
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[BWNodeInput setRetainedBufferCount:](v5, "setRetainedBufferCount:", objc_msgSend(a3, "count") - 1);
    -[BWNode addInput:](v4, "addInput:", v5);

    v6 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeOutput setFormatRequirements:](v6, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v6, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v4, "addOutput:", v6);

    v4->_inputSbufsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self)
    objc_msgSend((id)-[FigCalibration metalContext](self->_calibrationProcessor, "metalContext"), "waitForIdle");

  -[BWStillImageCameraCalibrationDataNode _clearCaptureRequestState]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCameraCalibrationDataNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (uint64_t)_clearCaptureRequestState
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;

    *(_QWORD *)(v1 + 128) = 0;
    *(_QWORD *)(v1 + 120) = 0;
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = (void *)objc_msgSend(*(id *)(v1 + 144), "allValues", 0);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(v1 + 16), "emitSampleBuffer:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }
    result = objc_msgSend(*(id *)(v1 + 144), "removeAllObjects");
    *(_DWORD *)(v1 + 136) = 0;
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCameraCalibrationDataNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (-[BWStillImageCameraCalibrationDataNode _loadAndConfigureCalibrationBundle]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadAndConfigureCalibrationBundle
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  _QWORD v12[2];
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  if (result)
  {
    v1 = result;
    v16 = 0;
    v2 = -[BWStillImageCameraCalibrationDataNode processorOptions](result);
    if (v2
      && (v3 = v2,
          v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors"), CFSTR("Calibration"), 1), (v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v4)) != 0))
    {
      v6 = v5;
      if (!objc_msgSend(v5, "loadAndReturnError:", &v16))
        return 4294954510;
      v7 = objc_alloc_init((Class)objc_msgSend(v6, "principalClass"));
      *(_QWORD *)(v1 + 152) = v7;
      if (v7)
      {
        objc_msgSend(v7, "setOptions:", v3);
        v8 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "width");
        v9 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "videoFormat"), "height");
        v10 = *(void **)(v1 + 152);
        v12[0] = v8;
        v12[1] = v9;
        v13 = 1067030938;
        v14 = 0x1800000020;
        v15 = 0;
        objc_msgSend(v10, "setCalibrationConfig:", v12);
        v11 = objc_msgSend(*(id *)(v1 + 152), "prepareToProcess:", 0);
        result = 0;
        if (!v11)
          return result;
        return FigSignalErrorAt();
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("CameraCalibrationData");
}

- (void)setPropagatesDetectedObjects:(BOOL)a3
{
  self->_propagatesDetectedObjects = a3;
}

- (BOOL)propagatesDetectedObjects
{
  return self->_propagatesDetectedObjects;
}

- (void)setBaseZoomFactorsByPortType:(id)a3
{

  self->_baseZoomFactorsByPortType = (NSDictionary *)a3;
}

- (id)baseZoomFactorsByPortType
{
  return self->_baseZoomFactorsByPortType;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CFTypeRef v9;
  void *v10;
  BWStillImageCaptureSettings *captureSettings;
  uint64_t v12;
  int processingMode;
  _QWORD *v14;
  opaqueCMSampleBuffer *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_25;
  v6 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (!v6)
    goto LABEL_25;
  v7 = v6;
  v8 = (void *)CMGetAttachment(a3, CFSTR("StillImageSettings"), 0);
  if (!v8)
    goto LABEL_25;
  if (!objc_msgSend(v8, "cameraCalibrationDataDeliveryEnabled"))
    goto LABEL_25;
  v9 = CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
  if (!v9)
    goto LABEL_25;
  v10 = (void *)v9;
  captureSettings = self->_captureSettings;
  if (!captureSettings
    || (v12 = -[BWStillImageCaptureSettings settingsID](captureSettings, "settingsID"),
        v12 != objc_msgSend(v10, "settingsID")))
  {
    -[BWStillImageCameraCalibrationDataNode _clearCaptureRequestState]((uint64_t)self);
    self->_captureSettings = (BWStillImageCaptureSettings *)v10;
    -[BWStillImageCameraCalibrationDataNode _resolveProcessingMode]((uint64_t)self);
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_inputSbufsByPortType, "objectForKeyedSubscript:", v7))
    goto LABEL_25;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inputSbufsByPortType, "setObject:forKeyedSubscript:", a3, v7);
  if (-[BWStillImageCameraCalibrationDataNode _receivedExpectedInputsForCaptureRequest]((uint64_t)self))
  {
    processingMode = self->_processingMode;
    v14 = (_QWORD *)MEMORY[0x1E0D05A18];
    if ((processingMode | 2) == 3)
    {
      v15 = (opaqueCMSampleBuffer *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputSbufsByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]);
      -[BWStillImageCameraCalibrationDataNode _computeCameraCalibrationDataBetweenReferenceSampleBuffer:auxiliarySampleBuffer:]((uint64_t)self, v15, (opaqueCMSampleBuffer *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputSbufsByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]));
      processingMode = self->_processingMode;
    }
    if ((processingMode & 0xFFFFFFFE) == 2)
      -[BWStillImageCameraCalibrationDataNode _computeCameraCalibrationDataBetweenReferenceSampleBuffer:auxiliarySampleBuffer:]((uint64_t)self, (opaqueCMSampleBuffer *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputSbufsByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]), (opaqueCMSampleBuffer *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inputSbufsByPortType, "objectForKeyedSubscript:", *v14));
    if (self->_propagatesDetectedObjects)
      -[BWStillImageCameraCalibrationDataNode _propagateDetectedObjects]((uint64_t)self);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = (void *)-[NSMutableDictionary allValues](self->_inputSbufsByPortType, "allValues", 0);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }
    -[NSMutableDictionary removeAllObjects](self->_inputSbufsByPortType, "removeAllObjects");
LABEL_25:
    v21 = 1;
    goto LABEL_27;
  }
  v21 = 0;
LABEL_27:
  if (self->_processingMode)
  {
    if (!v21)
      return;
  }
  else
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, a4);
    if (!v21)
      return;
  }
  -[BWStillImageCameraCalibrationDataNode _clearCaptureRequestState]((uint64_t)self);
}

- (uint64_t)_resolveProcessingMode
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = (void *)objc_msgSend(*(id *)(v1 + 128), "captureStreamSettings", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "portType"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }
    *(_QWORD *)(v1 + 120) = v2;
    v8 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0D05A28]);
    v9 = *MEMORY[0x1E0D05A18];
    if (v8)
      v10 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0D05A18]);
    else
      v10 = 0;
    result = objc_msgSend(v2, "containsObject:", v9);
    if ((_DWORD)result)
    {
      result = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0D05A30]);
      if ((result & v10) != 0)
        v11 = 3;
      else
        v11 = 1;
      if ((_DWORD)result)
        v12 = 2;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
      v11 = 1;
    }
    if (!v10)
      v11 = v12;
    *(_DWORD *)(v1 + 136) = v11;
  }
  return result;
}

- (uint64_t)_receivedExpectedInputsForCaptureRequest
{
  if (result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(*(id *)(result + 144), "allKeys")), "isEqualToSet:", *(_QWORD *)(result + 120));
  return result;
}

- (uint64_t)_computeCameraCalibrationDataBetweenReferenceSampleBuffer:(opaqueCMSampleBuffer *)a3 auxiliarySampleBuffer:
{
  uint64_t v5;
  unsigned int v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (result)
  {
    v5 = result;
    objc_msgSend(*(id *)(result + 152), "setReferenceSampleBuffer:", a2);
    objc_msgSend(*(id *)(v5 + 152), "setAuxiliarySampleBuffer:", a3);
    v6 = objc_msgSend(*(id *)(v5 + 152), "process");
    if (v6 <= 3 && v6 != 1)
    {
      v8 = (void *)objc_msgSend(*(id *)(v5 + 152), "calibrationMetadata");
      if (v8)
      {
        v9 = v8;
        v10 = sicn_cameraCalibrationDataMetadataAttachmentDictionaryFromCalibrationMetadata(v8, a2, 1);
        CMSetAttachment(a2, CFSTR("CameraCalibrationDataMetadata"), v10, 1u);
        v11 = sicn_cameraCalibrationDataMetadataAttachmentDictionaryFromCalibrationMetadata(v9, a3, 0);
        CMSetAttachment(a3, CFSTR("CameraCalibrationDataMetadata"), v11, 1u);
      }
    }
    objc_msgSend(*(id *)(v5 + 152), "setReferenceSampleBuffer:", 0);
    return objc_msgSend(*(id *)(v5 + 152), "setAuxiliarySampleBuffer:", 0);
  }
  return result;
}

- (uint64_t)_propagateDetectedObjects
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  void *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v27 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = (id)objc_msgSend(*(id *)(v1 + 144), "allValues");
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (result)
    {
      v2 = result;
      v3 = 0;
      v24 = 0;
      v4 = *(_QWORD *)v33;
      v5 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v6 = *MEMORY[0x1E0D06D00];
      v7 = *MEMORY[0x1E0D06EB8];
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v33 != v4)
            objc_enumerationMutation(obj);
          v9 = *(const void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
          v10 = objc_msgSend((id)CMGetAttachment(v9, v5, 0), "objectForKeyedSubscript:", v6);
          if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v9, v5, 0), "objectForKeyedSubscript:", v7), "BOOLValue"))
          {
            v3 = (void *)objc_msgSend(*(id *)(v1 + 112), "objectForKeyedSubscript:", v10);
            v24 = v9;
          }
          else
          {
            objc_msgSend(v27, "addObject:", v9);
            objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(v1 + 112), "objectForKeyedSubscript:", v10));
          }
          ++v8;
        }
        while (v2 != v8);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        v2 = result;
      }
      while (result);
      v11 = v24;
      if (v24)
      {
        if (v3)
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          result = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          if (result)
          {
            v12 = result;
            v13 = 0;
            v14 = *(_QWORD *)v29;
            do
            {
              v15 = 0;
              v16 = v13;
              do
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v27);
                v17 = *(const void **)(*((_QWORD *)&v28 + 1) + 8 * v15);
                objc_msgSend(v3, "floatValue", v24);
                v19 = v18;
                objc_msgSend((id)objc_msgSend(v25, "objectAtIndexedSubscript:", v16 + v15), "floatValue");
                if (v19 >= v20)
                {
                  v36[0] = v3;
                  v36[1] = objc_msgSend(v25, "objectAtIndexedSubscript:", v16 + v15);
                  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
                  v22 = v17;
                  v23 = v11;
                }
                else
                {
                  v37[0] = v3;
                  v37[1] = objc_msgSend(v25, "objectAtIndexedSubscript:", v16 + v15);
                  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
                  v22 = v11;
                  v23 = v17;
                }
                BWProcessWiderAndNarrowerFOVBuffersForFacePropagation(v22, v23, v21);
                ++v15;
              }
              while (v12 != v15);
              result = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
              v12 = result;
              v13 = v16 + v15;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWStillImageCameraCalibrationDataNode _clearCaptureRequestState]((uint64_t)self);
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
}

- (uint64_t)processorOptions
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
      || (v3 = -[BWStillImageCameraCalibrationDataNode _sensorConfigurationWithPortraitTuningParameters](v1)) != 0
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

@end
