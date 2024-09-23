@implementation BWRedEyeReductionController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWRedEyeReductionController)initWithConfiguration:(id)a3
{
  BWRedEyeReductionController *v4;
  BWRedEyeReductionController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWRedEyeReductionController;
  v4 = -[BWRedEyeReductionController init](&v7, sel_init);
  v5 = v4;
  if (v4
    && -[BWRedEyeReductionController _configureRedEyeReductionSessionWithConfiguration:]((uint64_t)v4, a3))
  {

    return 0;
  }
  return v5;
}

- (uint64_t)_configureRedEyeReductionSessionWithConfiguration:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v2 = a1;
  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a2, "sensorConfigurationsByPortType"), "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (void *)objc_msgSend(a2, "sensorConfigurationsByPortType", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = *MEMORY[0x1E0D05A20];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isEqualToString:", v9) & 1) == 0)
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("RedEyeReductionParameters")), v11);
            if (!objc_msgSend(v4, "objectForKeyedSubscript:", v11))
            {
              v2 = 4294954516;
              goto LABEL_15;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    *(_QWORD *)(v2 + 56) = v4;
    v12 = +[BWRedEyeReductionController _newRedEyeRepairSessionWithMetalCommandQueue:]((uint64_t)BWRedEyeReductionController, objc_msgSend(a2, "metalCommandQueue"));
    *(_QWORD *)(v2 + 64) = v12;
    if (v12
      && objc_msgSend(v12, "prepareRepair")
      && (v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]), (*(_QWORD *)(v2 + 80) = v13) != 0))
    {
      v2 = 0;
    }
    else
    {
      v2 = FigSignalErrorAt();
    }
LABEL_15:

  }
  return v2;
}

+ (id)_newRedEyeRepairSessionWithMetalCommandQueue:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0C9DD90];
  v11[0] = *MEMORY[0x1E0C9DFC8];
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0C9E080]);
  v5 = *MEMORY[0x1E0C9DF58];
  v12[0] = v4;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[1] = v5;
  v11[2] = CFSTR("kCIContextIOSurfaceMemoryPoolID");
  v12[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  v6 = objc_msgSend(v3, "contextWithMTLCommandQueue:options:", a2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
  if (v6)
  {
    v7 = v6;
    v8 = objc_alloc_init(MEMORY[0x1E0C9DDB0]);
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "setContext:", v7);
    else
      FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    return 0;
  }
  return v9;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWRedEyeReductionController;
  -[BWStillImageProcessorController dealloc](&v4, sel_dealloc);
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  BWRedEyeReductionRequest *v7;

  v7 = -[BWRedEyeReductionRequest initWithInput:delegate:]([BWRedEyeReductionRequest alloc], "initWithInput:delegate:", a3, a4);
  -[BWRedEyeReductionRequest setMode:](v7, "setMode:", 0);
  objc_msgSend(a3, "setInputDelegate:", self);
  objc_msgSend(a3, "setProcessorControllerDelegate:", a4);
  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v7);

  -[BWRedEyeReductionController _serviceRequests]((uint64_t)self);
  return 0;
}

- (uint64_t)_serviceRequests
{
  uint64_t v1;
  void *v2;
  BOOL v3;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 80), "firstObject");
    if (result)
    {
      v2 = (void *)result;
      do
      {
        if (!objc_msgSend((id)objc_msgSend(v2, "input"), "primaryImage"))
        {
          result = objc_msgSend((id)objc_msgSend(v2, "input"), "auxImage");
          if (!result)
            break;
        }
        -[BWRedEyeReductionController _processRedEyeReductionWhenNecessaryForRequest:skipProcessing:](v1, v2, 0);
        result = objc_msgSend(*(id *)(v1 + 80), "firstObject");
        v3 = result == (_QWORD)v2;
        v2 = (void *)result;
      }
      while (!v3);
    }
  }
  return result;
}

- (void)cancelProcessing
{
  NSMutableArray *i;

  for (i = self->_requestQueue; -[NSMutableArray count](i, "count"); i = self->_requestQueue)
    -[BWRedEyeReductionController _processRedEyeReductionWhenNecessaryForRequest:skipProcessing:]((uint64_t)self, (void *)-[NSMutableArray firstObject](self->_requestQueue, "firstObject"), 1);
}

- (uint64_t)_processRedEyeReductionWhenNecessaryForRequest:(int)a3 skipProcessing:
{
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CVImageBufferRef ImageBuffer;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t ModelSpecificName;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  CVImageBufferRef v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v6 = (void *)objc_msgSend(a2, "input");
    v7 = (void *)objc_msgSend(v6, "primaryImage");
    v8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v9 = (void *)CMGetAttachment(v7, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v10 = objc_msgSend(v6, "auxImage");
    if ((a3 & 1) == 0)
    {
      v11 = (void *)v10;
      if (v7 && !objc_msgSend(a2, "mode"))
      {
        v39 = v8;
        ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v7);
        v13 = objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
        if (!v13
          || (v14 = v13, (v15 = objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50])) == 0)
          || (v37 = v15,
              v38 = ImageBuffer,
              (v36 = objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CD0])) == 0)
          || (v16 = objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "sceneFlags"),
              (ModelSpecificName = FigCaptureGetModelSpecificName()) == 0))
        {
          v27 = FigSignalErrorAt();
          v28 = 1;
          v8 = v39;
          goto LABEL_27;
        }
        v18 = ModelSpecificName;
        v40 = v11;
        v41 = v9;
        v19 = objc_msgSend(*(id *)(v5 + 56), "objectForKeyedSubscript:", v14);
        v35 = a3;
        if (v19)
        {
          v42 = v14;
          v43[0] = v19;
          v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
        }
        else
        {
          v20 = 0;
        }
        v21 = objc_msgSend(v6, "faceObservations");
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v16 >> 5) & 1);
        if (objc_msgSend(*(id *)(v5 + 64), "setPrimary:observations:metadata:", v38, v21, objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x1E0C9DD58], v37, *MEMORY[0x1E0C9DD38], v14, *MEMORY[0x1E0C9DD48], v36, *MEMORY[0x1E0C9DD40], v18, *MEMORY[0x1E0C9DD30], v20, *MEMORY[0x1E0C9DD50],
                               0)))
          v24 = 2;
        else
          v24 = 1;
        objc_msgSend(a2, "setMode:", v24);
        v8 = v39;
        v11 = v40;
        a3 = v35;
        v9 = v41;
        if (dword_1EE6BE7B8)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v11 = v40;
          v9 = v41;
        }
      }
      if (-[BWRedEyeReductionController _receivedRequiredFramesForRequest:](v5, a2))
      {
        v26 = objc_msgSend(a2, "mode");
        if (v26 == 1)
        {
          if (objc_msgSend(v6, "requiresSensorInterfaceRawPropagation"))
            -[BWRedEyeReductionController _propagateSensorInterfaceRawFromAuxImage:toPrimaryImage:](v5, v11, v7);
        }
        else if (v26 == 2)
        {
          if (objc_msgSend(v6, "requiresSensorInterfaceRawPropagation"))
            -[BWRedEyeReductionController _propagateSensorInterfaceRawFromAuxImage:toPrimaryImage:](v5, v11, v7);
          if ((objc_msgSend(*(id *)(v5 + 64), "repairPrimaryWithSecondary:", CMSampleBufferGetImageBuffer((CMSampleBufferRef)v11)) & 1) != 0)
          {
            v27 = 0;
            v28 = 3;
          }
          else
          {
            v27 = FigSignalErrorAt();
            v28 = 2;
          }
LABEL_27:
          if (!-[BWRedEyeReductionController _receivedRequiredFramesForRequest:](v5, a2) && !v27 && !a3)
          {
            result = objc_msgSend(a2, "mode");
            if ((_DWORD)result == 2)
              return objc_msgSend((id)objc_msgSend(a2, "delegate"), "processorController:willProcessRedEyeReductionForProcessorInput:", v5, v6);
            return result;
          }
          if (v27)
          {
            if (!v7)
              goto LABEL_38;
          }
          else if (!v7 || (a3 & 1) == 0)
          {
LABEL_38:
            if (((v7 == 0) & a3) != 0)
              v29 = 4294954516;
            else
              v29 = v27;
            v30 = 17;
            goto LABEL_42;
          }
          v29 = 0;
          v30 = 18;
LABEL_42:
          v31 = (void *)objc_msgSend(v9, "mutableCopy", v33, v34);
          v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D06030]);
          CMSetAttachment(v7, v8, v31, 1u);

          objc_msgSend((id)objc_msgSend(a2, "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v5, v7, v30, v6, v29);
          return -[BWRedEyeReductionController _clearRequest:](v5, a2);
        }
      }
    }
    v27 = 0;
    v28 = 1;
    goto LABEL_27;
  }
  return result;
}

- (unint64_t)type
{
  return 4;
}

+ (void)prewarm
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
  if (v2 && (v3 = objc_msgSend(v2, "newCommandQueue")) != 0)
  {
    v6 = (id)v3;
    v4 = +[BWRedEyeReductionController _newRedEyeRepairSessionWithMetalCommandQueue:]((uint64_t)BWRedEyeReductionController, v3);
    v5 = v4;
    if (!v4 || (objc_msgSend(v4, "prewarm") & 1) == 0)
      FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    v5 = 0;
    v6 = 0;
  }

}

- (void)didReceiveFrameForInput:(id)a3
{
  void *v4;

  v4 = -[BWRedEyeReductionController _requestForInput:]((uint64_t)self, (uint64_t)a3);
  if (self && v4 && v4 == (void *)-[NSMutableArray firstObject](self->_requestQueue, "firstObject"))
    -[BWRedEyeReductionController _serviceRequests]((uint64_t)self);
}

- (void)_requestForInput:(uint64_t)a1
{
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
  if (!a2)
  {
    FigDebugAssert3();
    return 0;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(void **)(a1 + 80);
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
    if (objc_msgSend(v8, "input") == a2)
      return v8;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_5;
      return 0;
    }
  }
}

- (void)didReceiveAllFramesForInput:(id)a3
{
  void *v5;

  v5 = -[BWRedEyeReductionController _requestForInput:]((uint64_t)self, (uint64_t)a3);
  if (!objc_msgSend(a3, "primaryImage") || !objc_msgSend(a3, "auxImage") && objc_msgSend(v5, "mode") != 1)
    -[BWRedEyeReductionController _processRedEyeReductionWhenNecessaryForRequest:skipProcessing:]((uint64_t)self, v5, 1);
  objc_msgSend((id)objc_msgSend(a3, "processorControllerDelegate"), "processorController:didFinishProcessingInput:err:", self, a3, 0);
}

- (uint64_t)_clearRequest:(uint64_t)result
{
  id *v3;

  if (result)
  {
    v3 = (id *)result;
    result = objc_msgSend(*(id *)(result + 80), "containsObject:", a2);
    if ((_DWORD)result)
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "input"), "stillImageSettings"), "captureSettings"), "captureFlags") & 8) != 0&& objc_msgSend(a2, "mode") == 1)
      {
        objc_msgSend(v3, "didReceiveAllFramesForInput:", objc_msgSend(a2, "input"));
      }
      return objc_msgSend(v3[10], "removeObject:", a2);
    }
  }
  return result;
}

- (BOOL)_receivedRequiredFramesForRequest:(uint64_t)a1
{
  void *v3;
  int v4;
  BOOL v5;

  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(a2, "input");
  v4 = objc_msgSend(a2, "mode");
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      if (!objc_msgSend(v3, "requiresSensorInterfaceRawPropagation"))
        return 1;
    }
    else if (v4)
    {
      return v5;
    }
  }
  return objc_msgSend(v3, "primaryImage") && objc_msgSend(v3, "auxImage") != 0;
}

- (void)_propagateSensorInterfaceRawFromAuxImage:(const void *)a3 toPrimaryImage:
{
  uint64_t AttachedMedia;

  if (a1)
  {
    AttachedMedia = BWSampleBufferGetAttachedMedia(a2, (uint64_t)CFSTR("SensorInterfaceRaw"));
    if (AttachedMedia)
      BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("SensorInterfaceRaw"), AttachedMedia);
  }
}

@end
