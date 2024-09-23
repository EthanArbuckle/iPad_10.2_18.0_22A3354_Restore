@implementation VNTrackMaskDetector

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->highResMaskPixelBuffer);
  self->highResMaskPixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNTrackMaskDetector;
  -[VNDetector dealloc](&v3, sel_dealloc);
}

- (id)_loadModelFromFileName:(id)a3 inputBlobNames:(id)a4 outputBlobNames:(id)a5 forComputeDevice:(id)a6 configurationOptions:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  id v25;
  id v26;
  id v28;
  id v29;
  id v30;
  unsigned int v31;

  v13 = a3;
  v14 = a4;
  v29 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", v13, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19
    && (objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNDetectorInitOption_MemoryPoolId")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "unsignedLongLongValue"),
        v20,
        v31 = 0,
        +[VNValidationUtilities getEspressoPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getEspressoPriority:forKey:inOptions:withDefaultValue:error:", &v31, CFSTR("VNDetectorOption_EspressoPlanPriority"), v16, 0, a8)))
  {
    v28 = v14;
    v22 = v31;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNEspressoModelFileBasedDetectorOption_NetworkConfiguration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v24 = +[VNEspressoHelpers createSingleNetworkPlanFromModelPath:forComputeDevice:lowPriorityMode:priority:inputBlobNames:outputBlobNames:networkConfiguration:memoryPoolId:espressoResources:error:](VNEspressoHelpers, "createSingleNetworkPlanFromModelPath:forComputeDevice:lowPriorityMode:priority:inputBlobNames:outputBlobNames:networkConfiguration:memoryPoolId:espressoResources:error:", v19, v15, v18, v22, v28, v29, v23, v21, &v30, a8);
    v25 = v30;

    if (v24)
      v26 = v25;
    else
      v26 = 0;
    v14 = v28;

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (__CVBuffer)_upsampleLowResMask:(id *)a3 reference:(__CVBuffer *)a4 error:(id *)a5
{
  __CVBuffer *highResMaskPixelBuffer;
  size_t Width;
  size_t v11;
  size_t Height;
  size_t v13;
  size_t v14;
  void *v15;
  char v16;
  __CVBuffer *v17;
  _QWORD aBlock[7];

  highResMaskPixelBuffer = self->highResMaskPixelBuffer;
  if (highResMaskPixelBuffer)
  {
    Width = CVPixelBufferGetWidth(highResMaskPixelBuffer);
    v11 = CVPixelBufferGetWidth(a4);
    highResMaskPixelBuffer = self->highResMaskPixelBuffer;
    if (Width == v11)
    {
      Height = CVPixelBufferGetHeight(highResMaskPixelBuffer);
      if (Height == CVPixelBufferGetHeight(a4))
        goto LABEL_6;
      highResMaskPixelBuffer = self->highResMaskPixelBuffer;
    }
  }
  CVPixelBufferRelease(highResMaskPixelBuffer);
  v13 = CVPixelBufferGetWidth(a4);
  v14 = CVPixelBufferGetHeight(a4);
  self->highResMaskPixelBuffer = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v13, v14, 1278226534, a5);
LABEL_6:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VNTrackMaskDetector__upsampleLowResMask_reference_error___block_invoke;
  aBlock[3] = &unk_1E45456C8;
  aBlock[5] = a4;
  aBlock[6] = a3;
  aBlock[4] = self;
  v15 = _Block_copy(aBlock);
  v16 = VNExecuteBlock(v15, (uint64_t)a5);
  v17 = self->highResMaskPixelBuffer;
  if ((v16 & 1) == 0)
  {
    CVPixelBufferRelease(self->highResMaskPixelBuffer);
    v17 = 0;
    self->highResMaskPixelBuffer = 0;
  }

  return v17;
}

- (BOOL)_removeBackgroundFromPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 usingMask:(__CVBuffer *)a5 offset:(id *)a6 error:
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  VNMetalContext *v13;
  VNMetalContext *v14;
  void *v15;
  _QWORD v17[4];
  VNMetalContext *v18;
  VNTrackMaskDetector *v19;
  __CVBuffer *v20;
  __CVBuffer *v21;
  __CVBuffer *v22;
  int v23;

  v7 = v6;
  v8 = (int)a6;
  v13 = self->_postProcessingMetalContext;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__VNTrackMaskDetector__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke;
  v17[3] = &unk_1E45456F0;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v18 = v13;
  v19 = self;
  v23 = v8;
  v14 = v13;
  v15 = _Block_copy(v17);
  LOBYTE(v7) = VNExecuteBlock(v15, v7);

  return v7;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  VNEspressoResources *v8;
  VNEspressoResources *initializationModel;
  VNEspressoResources *v10;
  VNEspressoResources *updateModel;
  void *v12;
  void *v13;
  VNMetalContext *v14;
  VNMetalContext *postProcessingMetalContext;
  VNMetalContext *v16;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *applyMaskComputeState;
  BOOL v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VNTrackMaskDetector;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v21, sel_completeInitializationForSession_error_, a3))return 0;
  -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNTrackMaskDetector _loadModelFromFileName:inputBlobNames:outputBlobNames:forComputeDevice:configurationOptions:error:](self, "_loadModelFromFileName:inputBlobNames:outputBlobNames:forComputeDevice:configurationOptions:error:", CFSTR("vmtracker_memory_v1_6.espresso"), &unk_1E459E138, &unk_1E459E150, v6, v7, a4);
    v8 = (VNEspressoResources *)objc_claimAutoreleasedReturnValue();
    initializationModel = self->initializationModel;
    self->initializationModel = v8;

    if (self->initializationModel
      && (-[VNTrackMaskDetector _loadModelFromFileName:inputBlobNames:outputBlobNames:forComputeDevice:configurationOptions:error:](self, "_loadModelFromFileName:inputBlobNames:outputBlobNames:forComputeDevice:configurationOptions:error:", CFSTR("vmtracker_mask_memory_v1_6.espresso"), &unk_1E459E168, &unk_1E459E180, v6, v7, a4), v10 = (VNEspressoResources *)objc_claimAutoreleasedReturnValue(), updateModel = self->updateModel, self->updateModel = v10, updateModel, self->updateModel))
    {
      -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStagePostProcessing"), a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_11;
      +[VNComputeDeviceUtilities metalDeviceForComputeDevice:](VNComputeDeviceUtilities, "metalDeviceForComputeDevice:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNMetalContext metalContextForDevice:error:]((uint64_t)VNMetalContext, v13, a4);
      v14 = (VNMetalContext *)objc_claimAutoreleasedReturnValue();
      postProcessingMetalContext = self->_postProcessingMetalContext;
      self->_postProcessingMetalContext = v14;

      v16 = self->_postProcessingMetalContext;
      if (v16)
      {
        -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v16, CFSTR("removebkgnd_maskimage_withThresholdFilter"), (uint64_t)a4);
        v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        applyMaskComputeState = self->_applyMaskComputeState;
        self->_applyMaskComputeState = v17;

        v19 = self->_applyMaskComputeState != 0;
      }
      else
      {
LABEL_11:
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v13;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  objc_super v23;

  v13 = *(_QWORD *)&a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a4;
  v20 = a6;
  v21 = a9;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
  v23.receiver = self;
  v23.super_class = (Class)VNTrackMaskDetector;
  LOBYTE(a8) = -[VNEspressoModelFileBasedDetector createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:](&v23, sel_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler_, v19, v13, v20, a7, a8, v21, x, y, width, height);

  return (char)a8;
}

- (BOOL)_runInitializerModelWithLockedPixelBuffer:(__CVBuffer *)a3 forState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  size_t Width;
  size_t Height;
  int64x2_t *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  const void *v23;
  _QWORD v24[22];

  v8 = a4;
  if (!objc_msgSend(v8, "inititalMask"))
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Initial mask missing for processing"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  v9 = objc_retainAutorelease(v8);
  if (!-[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", objc_msgSend(v9, "getHiddenMaskBuffer"), CFSTR("hidden"), a5)|| (v10 = objc_retainAutorelease(v9), v11 = *(void **)objc_msgSend(v10, "getHiddenMaskBuffer"), v12 = objc_retainAutorelease(v10), bzero(v11, 4 * *(_QWORD *)(objc_msgSend(v12, "getHiddenMaskBuffer") + 152)), !-[VNEspressoModelFileBasedDetector bindLockedPixelBuffer:toNetworkInputBlobName:forModel:error:](self, "bindLockedPixelBuffer:toNetworkInputBlobName:forModel:error:", a3, CFSTR("input_image"), self->initializationModel, a5)))
  {
LABEL_13:
    v21 = 2;
    goto LABEL_14;
  }
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v12, "inititalMask"), 1uLL);
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v12, "inititalMask"));
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v12, "inititalMask"));
  v15 = (int64x2_t *)operator new(0x20uLL);
  *v15 = vdupq_n_s64(1uLL);
  v15[1].i64[0] = Width;
  v15[1].i64[1] = Height;
  memset(v24, 0, 168);
  v24[0] = CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v12, "inititalMask"));
  espresso_buffer_pack_tensor_shape();
  if (-[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", v24, CFSTR("mask"), self->initializationModel, a5)&& (v16 = objc_retainAutorelease(v12), -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", objc_msgSend(v16, "getHiddenMaskBuffer"), CFSTR("hidden_state"), self->initializationModel, a5))&& (v17 = objc_retainAutorelease(v16), -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", objc_msgSend(v17, "getKeyBuffer"),
          CFSTR("key"),
          self->initializationModel,
          a5))
    && (v18 = objc_retainAutorelease(v17),
        -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", objc_msgSend(v18, "getValueBuffer"), CFSTR("value"), self->initializationModel, a5))&& -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", &v23, CFSTR("hidden"), self->initializationModel, a5)&& -[VNEspressoModelFileBasedDetector executePlanForModel:error:](self, "executePlanForModel:error:", self->initializationModel, a5))
  {
    v19 = objc_retainAutorelease(v18);
    v20 = *(void **)objc_msgSend(v19, "getHiddenMaskBuffer");
    memcpy(v20, v23, 4 * *(_QWORD *)(objc_msgSend(objc_retainAutorelease(v19), "getHiddenMaskBuffer") + 152));
    v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  operator delete(v15);
LABEL_14:
  CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v8, "inititalMask"), 1uLL);

  return v21 == 0;
}

- (BOOL)_runUpdateModelWithLockedPixelBuffer:(__CVBuffer *)a3 forState:(id)a4 outputQualityEspressoBuffer:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  const void *v21;

  v10 = a4;
  if (-[VNEspressoModelFileBasedDetector bindLockedPixelBuffer:toNetworkInputBlobName:forModel:error:](self, "bindLockedPixelBuffer:toNetworkInputBlobName:forModel:error:", a3, CFSTR("input_image"), self->updateModel, a6)&& (v11 = objc_retainAutorelease(v10), -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", objc_msgSend(v11, "getKeyBuffer"), CFSTR("prev_key"), self->updateModel, a6))&& (v12 = objc_retainAutorelease(v11), -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", objc_msgSend(v12, "getValueBuffer"),
          CFSTR("prev_value"),
          self->updateModel,
          a6))
    && (v13 = objc_retainAutorelease(v12),
        -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", objc_msgSend(v13, "getHiddenMaskBuffer"), CFSTR("hidden_state"), self->updateModel, a6))&& (v14 = objc_retainAutorelease(v13), -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", objc_msgSend(v14, "getOutputMaskBuffer"), CFSTR("output"), self->updateModel, a6))&& -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", a5, CFSTR("quality"),
         self->updateModel,
         a6)
    && (v15 = objc_retainAutorelease(v14),
        -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", objc_msgSend(v15, "getKeyBuffer"), CFSTR("key"), self->updateModel, a6))&& (v16 = objc_retainAutorelease(v15), -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", objc_msgSend(v16, "getValueBuffer"), CFSTR("value"), self->updateModel, a6))&& -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", &v21, CFSTR("hidden"),
         self->updateModel,
         a6)
    && -[VNEspressoModelFileBasedDetector executePlanForModel:error:](self, "executePlanForModel:error:", self->updateModel, a6))
  {
    v17 = objc_retainAutorelease(v16);
    v18 = *(void **)objc_msgSend(v17, "getHiddenMaskBuffer");
    memcpy(v18, v21, 4 * *(_QWORD *)(objc_msgSend(objc_retainAutorelease(v17), "getHiddenMaskBuffer") + 152));
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v21;
  int32_t v22;
  uint64_t v23;
  __CVBuffer *v24;
  float v25;
  size_t Width;
  size_t Height;
  int64x2_t *v28;
  void *BaseAddress;
  id v30;
  __CVBuffer *v31;
  id v32;
  id v33;
  id v34;
  double v35;
  __CVBuffer *v36;
  VNPixelBufferObservation *v37;
  int v38;
  size_t v39;
  size_t v40;
  uint64_t PixelFormatType;
  __CVBuffer *v42;
  const __CFString *v43;
  CFTypeRef v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  size_t v53;
  size_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  __CVBuffer *v60;
  int v61;
  __CVBuffer *texture;
  void *v63;
  id v64;
  id v65;
  CMTime v66;
  CMTimeValue v67;
  CMTimeScale v68;
  CMTimeFlags v69;
  CMTimeEpoch v70;
  CMTimeValue v71;
  CMTimeScale v72;
  CMTimeFlags v73;
  CMTimeEpoch v74;
  CMTime time2;
  CMTime time1;
  CMTime v77;
  CMTime v78;
  CMTime v79;
  CMTime v80;
  CMTime rhs;
  CMTime lhs;
  VNPixelBufferObservation *v83;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v64 = a7;
  v65 = a9;
  objc_msgSend(v14, "valueForKey:", CFSTR("VNTrackMaskDetectorProcessOption_State"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VNTrackMaskDetectorProcessorOption_GenerateCropRect"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v14, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v21 = 0;
LABEL_52:

      goto LABEL_53;
    }
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v14, a8);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v63)
      goto LABEL_18;
    objc_msgSend(v18, "timingInfo");
    value = v67;
    flags = v69;
    timescale = v68;
    v61 = v17;
    if ((v69 & 1) != 0)
    {
      epoch = v70;
    }
    else
    {
      objc_msgSend(v15, "lastProcessedPTS");
      CMTimeMake(&rhs, 1, 30);
      CMTimeAdd(&v66, &lhs, &rhs);
      value = v66.value;
      flags = v66.flags;
      timescale = v66.timescale;
      epoch = v66.epoch;
      v80 = v66;
      objc_msgSend(v15, "setLastProcessedPTS:", &v80);
    }
    memset(&v79, 0, sizeof(v79));
    v78.value = value;
    v78.timescale = timescale;
    v78.flags = flags;
    v78.epoch = epoch;
    objc_msgSend(v15, "lastUpdatePTS");
    CMTimeSubtract(&v79, &v78, &v77);
    objc_msgSend(v15, "frameUpdateSpacing");
    time2 = v79;
    v22 = CMTimeCompare(&time1, &time2);
    if (v22 < 0)
    {
      v71 = value;
      v72 = timescale;
      v73 = flags;
      v74 = epoch;
      objc_msgSend(v15, "setLastUpdatePTS:", &v71);
    }
    v23 = objc_msgSend(v18, "bufferWithWidth:height:format:options:error:", objc_msgSend(v18, "width"), objc_msgSend(v18, "height"), 1111970369, v14, a8);
    if (!v23)
    {
LABEL_18:
      v21 = 0;
LABEL_51:

      goto LABEL_52;
    }
    texture = (__CVBuffer *)v23;
    if (objc_msgSend(v15, "firstFrame"))
    {
      if (!-[VNTrackMaskDetector _runInitializerModelWithLockedPixelBuffer:forState:error:](self, "_runInitializerModelWithLockedPixelBuffer:forState:error:", a4, v15, a8))
      {
        v31 = 0;
        CVPixelBufferRelease(texture);
        v38 = 2;
        texture = 0;
        v36 = 0;
        v37 = 0;
        goto LABEL_47;
      }
      v24 = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v15, "inititalMask"));
      CVPixelBufferLockBaseAddress(v24, 1uLL);
      v25 = 1.0;
      if (v24)
      {
        Width = CVPixelBufferGetWidth(v24);
        Height = CVPixelBufferGetHeight(v24);
        v28 = (int64x2_t *)operator new(0x20uLL);
        *v28 = vdupq_n_s64(1uLL);
        v28[1].i64[0] = Width;
        v28[1].i64[1] = Height;
        BaseAddress = CVPixelBufferGetBaseAddress(v24);
        v30 = objc_retainAutorelease(v15);
        *(_QWORD *)objc_msgSend(v30, "getOutputMaskBuffer") = BaseAddress;
        objc_msgSend(objc_retainAutorelease(v30), "getOutputMaskBuffer");
        espresso_buffer_pack_tensor_shape();
        operator delete(v28);
        v31 = v24;
LABEL_32:
        objc_msgSend(v15, "setFirstFrame:", 0);
        v39 = CVPixelBufferGetWidth(texture);
        v40 = CVPixelBufferGetHeight(texture);
        PixelFormatType = CVPixelBufferGetPixelFormatType(texture);
        v60 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v39, v40, PixelFormatType, a8);
        v42 = -[VNTrackMaskDetector _upsampleLowResMask:reference:error:](self, "_upsampleLowResMask:reference:error:", objc_msgSend(objc_retainAutorelease(v15), "getOutputMaskBuffer"), texture, a8);
        v36 = v60;
        if (!-[VNTrackMaskDetector _removeBackgroundFromPixelBuffer:toPixelBuffer:usingMask:offset:error:](self, "_removeBackgroundFromPixelBuffer:toPixelBuffer:usingMask:offset:error:", texture))
        {
          v37 = 0;
          v38 = 1;
          if (!v31)
            goto LABEL_47;
          goto LABEL_46;
        }
        v43 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
        if (CVBufferHasAttachment(a4, (CFStringRef)*MEMORY[0x1E0CA8CD8]))
        {
          LODWORD(v66.value) = 0;
          v44 = CVBufferCopyAttachment(a4, v43, (CVAttachmentMode *)&v66);
          CVBufferSetAttachment(v60, v43, v44, v66.value);
          CFRelease(v44);
        }
        v37 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:]([VNPixelBufferObservation alloc], "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v63, 0, v60);
        *(float *)&v45 = v25;
        -[VNObservation setConfidence:](v37, "setConfidence:", v45);
        if (v61)
        {
          v46 = calculateCropSizeOfPixelBuffer(v42, 0, 0.1);
          v48 = v47;
          v50 = v49;
          v52 = v51;
          v53 = CVPixelBufferGetWidth(v42);
          v54 = CVPixelBufferGetHeight(v42);
          v55 = 0.0;
          v56 = 0.0;
          v57 = 0.0;
          if (v53)
          {
            v56 = v46 / (double)v53;
            v57 = v50 / (double)v53;
          }
          v58 = 0.0;
          if (v54)
          {
            v55 = v48 / (double)v54;
            v58 = v52 / (double)v54;
          }
          if (v37)
          {
            v38 = 0;
            v37->_croppedBoundingBox.origin.x = v56;
            v37->_croppedBoundingBox.origin.y = v55;
            v37->_croppedBoundingBox.size.width = v57;
            v37->_croppedBoundingBox.size.height = v58;
            if (!v31)
              goto LABEL_47;
            goto LABEL_46;
          }
        }
        v38 = 0;
        if (v31)
LABEL_46:
          CVPixelBufferUnlockBaseAddress(v31, 1uLL);
LABEL_47:
        CVPixelBufferRelease(v31);
        CVPixelBufferRelease(v36);
        CVPixelBufferRelease(texture);
        if (v38)
        {
          v21 = 0;
        }
        else
        {
          v83 = v37;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_51;
      }
LABEL_31:
      v31 = 0;
      goto LABEL_32;
    }
    if (v22 < 0)
    {
      if (!-[VNTrackMaskDetector _runUpdateModelWithLockedPixelBuffer:forState:outputQualityEspressoBuffer:error:](self, "_runUpdateModelWithLockedPixelBuffer:forState:outputQualityEspressoBuffer:error:", a4, v15, &v66, a8))
      {
LABEL_27:
        v31 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 2;
        goto LABEL_47;
      }
    }
    else
    {
      if (!-[VNEspressoModelFileBasedDetector bindLockedPixelBuffer:toNetworkInputBlobName:error:](self, "bindLockedPixelBuffer:toNetworkInputBlobName:error:", a4, CFSTR("input_image"), a8))goto LABEL_27;
      v32 = objc_retainAutorelease(v15);
      if (!-[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:error:](self, "bindClientBuffer:toNetworkInputBlobName:error:", objc_msgSend(v32, "getKeyBuffer"), CFSTR("prev_key"), a8))goto LABEL_27;
      v33 = objc_retainAutorelease(v32);
      if (!-[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:error:](self, "bindClientBuffer:toNetworkInputBlobName:error:", objc_msgSend(v33, "getValueBuffer"), CFSTR("prev_value"), a8))goto LABEL_27;
      v34 = objc_retainAutorelease(v33);
      if (!-[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:error:](self, "bindClientBuffer:toNetworkInputBlobName:error:", objc_msgSend(v34, "getHiddenMaskBuffer"), CFSTR("hidden_state"), a8)|| !-[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", objc_msgSend(objc_retainAutorelease(v34), "getOutputMaskBuffer"), CFSTR("output"), a8)|| !-[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", &v66, CFSTR("quality"), a8)|| !-[VNEspressoModelFileBasedDetector executePlanAndReturnError:](self, "executePlanAndReturnError:", a8))
      {
        goto LABEL_27;
      }
    }
    v25 = *(float *)v66.value;
    LODWORD(v35) = *(_DWORD *)v66.value;
    objc_msgSend(v15, "setConfidence:", v35);
    goto LABEL_31;
  }
  if (a8)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("State missing for processing"));
    v21 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_53:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyMaskComputeState, 0);
  objc_storeStrong((id *)&self->_postProcessingMetalContext, 0);
  objc_storeStrong((id *)&self->_bilinearUpsampler, 0);
  objc_storeStrong((id *)&self->updateModel, 0);
  objc_storeStrong((id *)&self->initializationModel, 0);
}

BOOL __93__VNTrackMaskDetector__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  int v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 48), 80, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 56), 80, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 64), 55, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[VNMetalContext commandQueueReturnError:](*(os_unfair_lock_s **)(a1 + 32), a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = v7 != 0;
        if (v7)
        {
          objc_msgSend(v7, "commandBuffer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(*(_QWORD *)(a1 + 40) + 128);
          v16 = *(_QWORD *)(a1 + 32);
          v11 = objc_msgSend(v6, "width");
          v12 = objc_msgSend(v6, "height");
          v19[0] = v6;
          v19[1] = v4;
          v19[2] = v5;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __93__VNTrackMaskDetector__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_2;
          v17[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
          v18 = *(_DWORD *)(a1 + 72);
          -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v16, v10, v15, v11, v12, v13, v17);

          objc_msgSend(v10, "commit");
          objc_msgSend(v10, "waitUntilCompleted");

        }
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __93__VNTrackMaskDetector__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBytes:length:atIndex:", a1 + 32, 4, 0);
}

uint64_t __59__VNTrackMaskDetector__upsampleLowResMask_reference_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  VNBGRBilinearUpsampler *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  id v13;
  void *v14;
  __int128 v15;
  uint64_t v16;

  v15 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(v4 + 104);
  v5 = *(void **)(v4 + 112);
  if (v5)
    goto LABEL_5;
  v6 = [VNBGRBilinearUpsampler alloc];
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 120);
  if (v7)
    v7 = (_QWORD *)v7[1];
  v8 = v7;
  v9 = -[VNBGRBilinearUpsampler initWithMetalDevice:](v6, "initWithMetalDevice:", v8);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 112);
  *(_QWORD *)(v10 + 112) = v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (v5)
  {
LABEL_5:
    if ((objc_msgSend(v5, "handlePostProcessingRequest:", &v15) & 1) != 0)
      return 1;
    if (a2)
    {
      +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", CFSTR("image upsampling failed"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a2 = v13;
      return result;
    }
  }
  else if (a2)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create upsampler for %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
    +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", v14);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allNeuralEngineComputeDevices](VNComputeDeviceUtilities, "allNeuralEngineComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("VNComputeStagePostProcessing");
  v9[0] = v4;
  +[VNComputeDeviceUtilities allGPUComputeDevices](VNComputeDeviceUtilities, "allGPUComputeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("VNComputeStageMain");
  v4[1] = CFSTR("VNComputeStagePostProcessing");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VNTrackMaskDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("vmtracker_mask_v1_6.espresso");
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return CFSTR("input_image");
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

void __60__VNTrackMaskDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNTrackMaskDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

@end
