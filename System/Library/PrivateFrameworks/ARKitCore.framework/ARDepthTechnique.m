@implementation ARDepthTechnique

- (ARDepthTechnique)init
{
  return -[ARDepthTechnique initWithPrioritization:temporalSmoothing:](self, "initWithPrioritization:temporalSmoothing:", 1, 0);
}

- (ARDepthTechnique)initWithPrioritization:(int64_t)a3 temporalSmoothing:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  ARDepthTechnique *v33;
  uint64_t v34;
  ADJasperColorPipelineParameters *pipelineParameters;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  _BOOL4 computeNormals;
  const __CFString *v41;
  uint64_t v42;
  ADNormalsBuffer *normalsHelperBuffer;
  void *v46;
  objc_super v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  ARDepthTechnique *v51;
  __int16 v52;
  int64_t v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v4 = a4;
  v55[2] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 5)
  {
    _ARLogGeneral_32();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "Unhandled ADDepthPrioritization", buf, 2u);
    }

    v6 = 0.0;
    v7 = 0.0;
  }
  else
  {
    v6 = dbl_1B3C083D0[a3];
    v7 = dbl_1B3C083F8[a3];
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCDC8]), "initWithInputPrioritization:", a3);
  objc_msgSend(v9, "inferenceDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v12;
  objc_msgSend(v10, "jasperInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "depthOutput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v16;
  objc_msgSend(v10, "confidenceOutput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v20 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.appleDepth.temporalSmoothingMethod"));
    _ARLogTechnique_11();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v23;
      v50 = 2048;
      v51 = self;
      v52 = 2048;
      v53 = v20;
      _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Temporal smoothing enabled, using method: %ld", buf, 0x20u);

    }
    v24 = v9;
    if (v20 == 2)
    {
      objc_msgSend(v10, "alphaMapOutput");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v10, "alphaMapOutput");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayByAddingObject:", v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v29 = 1;
        v20 = 2;
        v19 = (void *)v28;
      }
      else
      {
        v29 = 1;
        v20 = 2;
      }
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    v29 = 0;
    v20 = 0;
    v24 = v9;
  }
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.depthtechnique");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "networkURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "absoluteString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47.receiver = self;
  v47.super_class = (Class)ARDepthTechnique;
  v33 = -[ARMLImageProcessingTechnique initWithDispatchQueue:inputTensorNames:outputTensorNames:networkInputScaleBeforeRotation:networkFilePath:](&v47, sel_initWithDispatchQueue_inputTensorNames_outputTensorNames_networkInputScaleBeforeRotation_networkFilePath_, v30, v46, v19, v32, v6, v7);

  if (v33)
  {
    v33->_prioritization = a3;
    v33->_outputSize.width = v6;
    v33->_outputSize.height = v7;
    objc_storeStrong((id *)&v33->_pipeline, v24);
    -[ADJasperColorPipeline pipelineParameters](v33->_pipeline, "pipelineParameters");
    v34 = objc_claimAutoreleasedReturnValue();
    pipelineParameters = v33->_pipelineParameters;
    v33->_pipelineParameters = (ADJasperColorPipelineParameters *)v34;

    objc_storeStrong((id *)&v33->_inferenceDescriptor, v10);
    objc_msgSend(v10, "alphaMapOutput");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v33->_alphamapAvailable = v36 != 0;

    v33->_outputDepthPixelBufferPool = 0;
    v33->_outputConfidencePixelBufferPool = 0;
    v33->_outputConfidenceMapPixelBufferPool = 0;
    v33->_outputAlphaPixelBufferPool = 0;
    v33->_scaledDepthOutputPixelBufferPool = 0;
    v33->_scaledConfidenceOutputPixelBufferPool = 0;
    v33->_scaledConfidenceMapPixelBufferPool = 0;
    v33->_outputTemporalConsistentDepthPixelBufferPool = 0;
    v33->_outputTemporalConsistentConfidencePixelBufferPool = 0;
    v33->_scaledTemporallyConsistentDepthOutputPixelBufferPool = 0;
    v33->_scaledTemporallyConsistentConfidenceOutputPixelBufferPool = 0;
    v33->_previousDepthBuffer = 0;
    v33->_previousConfidenceBuffer = 0;
    v33->_layout = 0;
    v33->_temporalConsistencyMethod = v20;
    if (v29)
      -[ARDepthTechnique _initLKT](v33, "_initLKT");
    v33->_computeNormals = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.appleDepth.computeNormals"), self);
    _ARLogTechnique_11();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      computeNormals = v33->_computeNormals;
      *(_DWORD *)buf = 138543874;
      v49 = v39;
      if (computeNormals)
        v41 = CFSTR("Enabled");
      else
        v41 = CFSTR("Disabled");
      v50 = 2048;
      v51 = v33;
      v52 = 2112;
      v53 = (int64_t)v41;
      _os_log_impl(&dword_1B3A68000, v37, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Compute normals: %@", buf, 0x20u);

    }
    if (v33->_computeNormals)
    {
      v42 = objc_opt_new();
      normalsHelperBuffer = v33->_normalsHelperBuffer;
      v33->_normalsHelperBuffer = (ADNormalsBuffer *)v42;

    }
  }

  return v33;
}

- (void)dealloc
{
  objc_super v3;

  -[ARDepthTechnique setOpticalFlowOutputBuffer:](self, "setOpticalFlowOutputBuffer:", 0);
  CVPixelBufferRelease(self->_previousDepthBuffer);
  CVPixelBufferRelease(self->_previousConfidenceBuffer);
  CVPixelBufferRelease(self->_jasperInputBuffer);
  CVPixelBufferRelease(self->_previousWarpedDepthBuffer);
  CVPixelBufferRelease(self->_previousWarpedConfidenceBuffer);
  CVPixelBufferPoolRelease(self->_outputDepthPixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputConfidencePixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputConfidenceMapPixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputTemporalConsistentDepthPixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputTemporalConsistentConfidencePixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputAlphaPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledDepthOutputPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledConfidenceOutputPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledConfidenceMapPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledTemporallyConsistentDepthOutputPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledTemporallyConsistentConfidenceOutputPixelBufferPool);
  CVPixelBufferPoolRelease(self->_opticalFlowPixelBufferPool);
  CVPixelBufferPoolRelease(self->_normalPixelBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)ARDepthTechnique;
  -[ARMLImageProcessingTechnique dealloc](&v3, sel_dealloc);
}

- (int64_t)depthDataSource
{
  return 2;
}

- (void)_initLKT
{
  ADLKTTexturesDescriptor *v3;
  ADLKTTexturesDescriptor *lktDescriptor;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *lktProcessingQueue;
  NSMutableArray *v7;
  NSMutableArray *features;
  NSMutableArray *v9;
  NSMutableArray *derivatives;
  NSMutableArray *v11;
  NSMutableArray *pyramids;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  int64_t storedFramesCount;
  MTLDevice *v17;
  MTLDevice *device;
  MTLDevice *v19;
  MTLCommandQueue *v20;
  MTLCommandQueue *commandQueue;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  const char *v25;
  objc_class *v26;
  int v27;
  void *v28;
  __int16 v29;
  ARDepthTechnique *v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  self->_currentFrameIndex = 0;
  -[ADJasperColorPipeline LKTTexturesDescriptor](self->_pipeline, "LKTTexturesDescriptor");
  v3 = (ADLKTTexturesDescriptor *)objc_claimAutoreleasedReturnValue();
  lktDescriptor = self->_lktDescriptor;
  self->_lktDescriptor = v3;

  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.depthtechnique.lkt");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  lktProcessingQueue = self->_lktProcessingQueue;
  self->_lktProcessingQueue = v5;

  self->_opticalFlowOutputBufferLock._os_unfair_lock_opaque = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  features = self->_features;
  self->_features = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  derivatives = self->_derivatives;
  self->_derivatives = v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pyramids = self->_pyramids;
  self->_pyramids = v11;

  self->_storedFramesCount = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.appleDepth.temporalFilteringStoredFrames"));
  _ARLogTechnique_11();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    storedFramesCount = self->_storedFramesCount;
    v27 = 138543874;
    v28 = v15;
    v29 = 2048;
    v30 = self;
    v31 = 2048;
    v32 = storedFramesCount;
    _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using %ti stored frames for temporal filtering", (uint8_t *)&v27, 0x20u);

  }
  v17 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v17;

  v19 = self->_device;
  if (v19)
  {
    v20 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v19, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v20;

    if (self->_commandQueue)
    {
      -[ARDepthTechnique _allocateLKTBuffers](self, "_allocateLKTBuffers");
      return;
    }
    _ARLogTechnique_11();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v24;
      v29 = 2048;
      v30 = self;
      v25 = "%{public}@ <%p>: Couldn't create command queue for temporal filtering";
      goto LABEL_10;
    }
  }
  else
  {
    _ARLogTechnique_11();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v24;
      v29 = 2048;
      v30 = self;
      v25 = "%{public}@ <%p>: Couldn't create system default device for temporal filtering";
LABEL_10:
      _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v27, 0x16u);

    }
  }

}

- (void)_allocateLKTBuffers
{
  id v3;
  MTLDevice *device;
  double v5;
  double v6;
  double v7;
  double v8;
  ADLKTTexturesDescriptor *lktDescriptor;
  uint64_t v10;
  ADLKTOpticalFlow *v11;
  ADLKTOpticalFlow *lkt;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  NSObject *v44;
  objc_class *v45;
  void *v46;
  __int128 v47;
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
  __int128 v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  ARDepthTechnique *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_features, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_derivatives, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pyramids, "removeAllObjects");
  CVPixelBufferRelease(self->_previousDepthBuffer);
  self->_previousDepthBuffer = 0;
  v3 = objc_alloc(MEMORY[0x1E0CFCDD8]);
  device = self->_device;
  -[ADLKTTexturesDescriptor inputSizeForLayout:](self->_lktDescriptor, "inputSizeForLayout:", self->_layout);
  v6 = v5;
  v8 = v7;
  lktDescriptor = self->_lktDescriptor;
  if (lktDescriptor)
  {
    -[ADLKTTexturesDescriptor opticalFlowConfig](lktDescriptor, "opticalFlowConfig");
    v10 = v59;
  }
  else
  {
    v10 = 0;
    v61 = 0;
    v59 = 0u;
    v60 = 0u;
  }
  v11 = (ADLKTOpticalFlow *)objc_msgSend(v3, "initWithDevice:inputSize:scales:", device, v10, v6, v8);
  lkt = self->_lkt;
  self->_lkt = v11;

  if (self->_lkt)
  {
    if (self->_storedFramesCount >= 1)
    {
      v13 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_features, "setObject:atIndexedSubscript:", v14, v13);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_derivatives, "setObject:atIndexedSubscript:", v15, v13);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_pyramids, "setObject:atIndexedSubscript:", v16, v13);

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        -[ADLKTTexturesDescriptor pyramidsDescriptors](self->_lktDescriptor, "pyramidsDescriptors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v56 != v19)
                objc_enumerationMutation(v17);
              v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
              -[NSMutableArray objectAtIndexedSubscript:](self->_pyramids, "objectAtIndexedSubscript:", v13);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "sizeForLayout:", self->_layout);
              textureForSizeWithPixelFormatAndMetalDevice(objc_msgSend(v21, "pixelFormat"), self->_device, v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v25);

            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v18);
        }

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        -[ADLKTTexturesDescriptor featuresDescriptors](self->_lktDescriptor, "featuresDescriptors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v52 != v28)
                objc_enumerationMutation(v26);
              v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              -[NSMutableArray objectAtIndexedSubscript:](self->_features, "objectAtIndexedSubscript:", v13);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "sizeForLayout:", self->_layout);
              textureForSizeWithPixelFormatAndMetalDevice(objc_msgSend(v30, "pixelFormat"), self->_device, v32, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObject:", v34);

            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          }
          while (v27);
        }

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        -[ADLKTTexturesDescriptor derivitivesDescriptors](self->_lktDescriptor, "derivitivesDescriptors");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v48;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v48 != v37)
                objc_enumerationMutation(v35);
              v39 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
              -[NSMutableArray objectAtIndexedSubscript:](self->_derivatives, "objectAtIndexedSubscript:", v13);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "sizeForLayout:", self->_layout);
              textureForSizeWithPixelFormatAndMetalDevice(objc_msgSend(v39, "pixelFormat"), self->_device, v41, v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v43);

            }
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
          }
          while (v36);
        }

        ++v13;
      }
      while (v13 < self->_storedFramesCount);
    }
  }
  else
  {
    _ARLogTechnique_11();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v46;
      v67 = 2048;
      v68 = self;
      _os_log_impl(&dword_1B3A68000, v44, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't create DFLKTOpticalFlow for temporal filtering", buf, 0x16u);

    }
  }
}

- (void)setOpticalFlowOutputBuffer:(__CVBuffer *)a3
{
  __CVBuffer *opticalFlowOutputBuffer;

  opticalFlowOutputBuffer = self->_opticalFlowOutputBuffer;
  if (opticalFlowOutputBuffer != a3)
  {
    CVPixelBufferRelease(opticalFlowOutputBuffer);
    self->_opticalFlowOutputBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (__CVBuffer)_executeLKTWithFrame:(__CVBuffer *)a3
{
  int64_t currentFrameIndex;
  int64_t storedFramesCount;
  uint64_t v7;
  void *v8;
  ADLKTOpticalFlow *lkt;
  void *v10;
  void *v11;
  void *v12;
  ADLKTOpticalFlow *v13;
  void *v14;
  double Width;
  double Height;
  __CVBuffer *v17;
  __CVBuffer *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v27;
  ADLKTOpticalFlow *v28;
  void *v29;
  void *v30;

  currentFrameIndex = self->_currentFrameIndex;
  storedFramesCount = currentFrameIndex;
  if (!currentFrameIndex)
    storedFramesCount = self->_storedFramesCount;
  v27 = storedFramesCount;
  bindPixelBufferToMTL2DTextureWithMetalDevice(a3, self->_device);
  v7 = objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  lkt = self->_lkt;
  -[NSMutableArray objectAtIndexedSubscript:](self->_pyramids, "objectAtIndexedSubscript:", currentFrameIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_features, "objectAtIndexedSubscript:", currentFrameIndex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_derivatives, "objectAtIndexedSubscript:", currentFrameIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = lkt;
  v14 = (void *)v7;
  -[ADLKTOpticalFlow encodePyramidFeaturesToCommandBuffer:colorTexture:outPyramidsArray:outFeaturesArray:outDerivitiveArray:](v13, "encodePyramidFeaturesToCommandBuffer:colorTexture:outPyramidsArray:outFeaturesArray:outDerivitiveArray:", v8, v7, v10, v11, v12);

  objc_msgSend(v8, "commit");
  if (!self->_previousDepthBuffer)
  {
    v17 = 0;
LABEL_10:
    objc_msgSend(v8, "waitUntilCompleted");
    self->_currentFrameIndex = (currentFrameIndex + 1) % self->_storedFramesCount;
    goto LABEL_11;
  }
  if (a3)
  {
    Width = (double)CVPixelBufferGetWidth(a3);
    Height = (double)CVPixelBufferGetHeight(a3);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v18 = ARCreateCVPixelBufferFromPool(&self->_opticalFlowPixelBufferPool, 843264104, self, CFSTR("Optical Flow"), Width, Height);
  v17 = v18;
  if (v18)
  {
    v19 = v27 - 1;
    bindPixelBufferToMTL2DTextureWithMetalDevice(v18, self->_device);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = self->_lkt;
    -[NSMutableArray objectAtIndexedSubscript:](self->_features, "objectAtIndexedSubscript:", currentFrameIndex);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_derivatives, "objectAtIndexedSubscript:", currentFrameIndex);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_features, "objectAtIndexedSubscript:", v19);
    v30 = (void *)v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_derivatives, "objectAtIndexedSubscript:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_pyramids, "objectAtIndexedSubscript:", currentFrameIndex);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADLKTOpticalFlow encodeOpticalFlowSolverToCommandBuffer:currentFeaturesArray:currentDerivitiveArray:previousFeaturesArray:previousDerivitiveArray:currentPyramidsArray:outShiftMap:](v28, "encodeOpticalFlowSolverToCommandBuffer:currentFeaturesArray:currentDerivitiveArray:previousFeaturesArray:previousDerivitiveArray:currentPyramidsArray:outShiftMap:", v20, v21, v22, v23, v24, v25, v29);

    v14 = v30;
    objc_msgSend(v20, "commit");

    v8 = v20;
    goto LABEL_10;
  }
LABEL_11:

  return v17;
}

- (double)requiredTimeInterval
{
  return dbl_1B3C083C0[self->_prioritization == 3];
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (int)prepareBindInputBuffer:(unint64_t)a3 withName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  OSType v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  size_t v24;
  size_t v25;
  void *v26;
  const __CFAllocator *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  ARDepthTechnique *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[ADEspressoJasperColorInferenceDescriptor colorInput](self->_inferenceDescriptor, "colorInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_2;
  if (a3 > 1)
  {
    v10 = -1;
    goto LABEL_10;
  }
  -[ARMLImageProcessingTechnique espressoNetwork](self, "espressoNetwork");
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  -[ARMLImageProcessingTechnique espressoInputTensorsData](self, "espressoInputTensorsData");
  v10 = espresso_network_bind_buffer();
  if (v10)
    goto LABEL_10;
  CVPixelBufferRelease(self->_jasperInputBuffer);
  v27 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[ADEspressoJasperColorInferenceDescriptor jasperInput](self->_inferenceDescriptor, "jasperInput");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sizeForLayout:", self->_layout);
  v25 = (unint64_t)v11;
  -[ADEspressoJasperColorInferenceDescriptor jasperInput](self->_inferenceDescriptor, "jasperInput");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageDescriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeForLayout:", self->_layout);
  v24 = (unint64_t)v12;
  -[ADEspressoJasperColorInferenceDescriptor jasperInput](self->_inferenceDescriptor, "jasperInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "pixelFormat");
  v16 = (void *)-[ARMLImageProcessingTechnique espressoInputTensorsData](self, "espressoInputTensorsData")[168 * a3];
  -[ADEspressoJasperColorInferenceDescriptor jasperInput](self->_inferenceDescriptor, "jasperInput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeForLayout:", self->_layout);
  LODWORD(v16) = CVPixelBufferCreateWithBytes(v27, v25, v24, v15, v16, vcvtd_n_u64_f64(v19, 2uLL), 0, 0, 0, &self->_jasperInputBuffer);

  if (!(_DWORD)v16)
  {
LABEL_2:
    v10 = 0;
  }
  else
  {
    _ARLogTechnique_11();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2048;
      v34 = self;
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't allocate pixel buffer for jasper point projection", buf, 0x16u);

    }
    v10 = -4;
  }
LABEL_10:

  return v10;
}

- (void)_updateOpticalFlowOutputBufferInBackgroundFromImageData:(id)a3
{
  NSObject *lktProcessingQueue;
  id v5;
  __CVBuffer *v6;

  lktProcessingQueue = self->_lktProcessingQueue;
  v5 = a3;
  dispatch_assert_queue_V2(lktProcessingQueue);
  os_unfair_lock_lock(&self->_opticalFlowOutputBufferLock);
  objc_msgSend(v5, "timestamp");
  kdebug_trace();
  v6 = -[ARDepthTechnique _executeLKTWithFrame:](self, "_executeLKTWithFrame:", objc_msgSend(v5, "pixelBuffer"));
  -[ARDepthTechnique setOpticalFlowOutputBuffer:](self, "setOpticalFlowOutputBuffer:", v6);
  CVPixelBufferRelease(v6);
  objc_msgSend(v5, "timestamp");

  kdebug_trace();
  os_unfair_lock_unlock(&self->_opticalFlowOutputBufferLock);
}

- (int)bindInputBuffer:(unint64_t)a3 withImage:(id)a4 andOriginalImageData:(id)a5 rotationOfResultTensor:(int64_t)a6
{
  id v10;
  id v11;
  NSObject *lktProcessingQueue;
  int v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  __CVBuffer *v21;
  __CVBuffer *v22;
  double Width;
  double Height;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  objc_super v33;
  _QWORD block[4];
  id v35;
  id v36;
  _BYTE location[12];
  __int16 v38;
  ARDepthTechnique *v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (a3 != 1)
  {
    if (!a3)
    {
      if (self->_temporalConsistencyMethod == 2 && objc_msgSend(v10, "pixelBuffer"))
      {
        objc_initWeak((id *)location, self);
        lktProcessingQueue = self->_lktProcessingQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __90__ARDepthTechnique_bindInputBuffer_withImage_andOriginalImageData_rotationOfResultTensor___block_invoke;
        block[3] = &unk_1E66721B8;
        objc_copyWeak(&v36, (id *)location);
        v35 = v10;
        dispatch_async(lktProcessingQueue, block);

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)location);
      }
      v33.receiver = self;
      v33.super_class = (Class)ARDepthTechnique;
      v13 = -[ARMLImageProcessingTechnique bindInputBuffer:withImage:andOriginalImageData:rotationOfResultTensor:](&v33, sel_bindInputBuffer_withImage_andOriginalImageData_rotationOfResultTensor_, 0, v10, v11, a6);
      goto LABEL_26;
    }
    _ARLogTechnique_11();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v18;
      v38 = 2048;
      v39 = self;
      v40 = 2048;
      v41 = a3;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Index not supported: %lu", location, 0x20u);

    }
LABEL_18:

    v13 = -1;
    goto LABEL_26;
  }
  v14 = -[ARMLImageProcessingTechnique getDeviceOrientationFromImageData:](self, "getDeviceOrientationFromImageData:", v11)- 1;
  if (v14 > 2)
    v15 = 2;
  else
    v15 = qword_1B3C08420[v14];
  objc_msgSend(v11, "originalImage");
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSObject pointCloud](v16, "pointCloud");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "depthPointCloud");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    _ARLogTechnique_11();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v27;
      v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No depth point cloud found", location, 0x16u);

    }
    goto LABEL_18;
  }
  v21 = (__CVBuffer *)-[NSObject pixelBuffer](v16, "pixelBuffer");
  if (v21)
  {
    v22 = v21;
    Width = (double)CVPixelBufferGetWidth(v21);
    Height = (double)CVPixelBufferGetHeight(v22);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(v10, "timestamp");
  kdebug_trace();
  v28 = -[ADJasperColorPipeline projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:](self->_pipeline, "projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:", v20, v15, self->_jasperInputBuffer, 0.0, 0.0, Width, Height);
  objc_msgSend(v10, "timestamp");
  objc_msgSend(v20, "length");
  kdebug_trace();
  if (v28)
  {
    _ARLogTechnique_11();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v31;
      v38 = 2048;
      v39 = self;
      v40 = 2048;
      v41 = -1;
      _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't project jasper points: %ld", location, 0x20u);

    }
    v13 = -1;
  }
  else
  {
    v13 = 0;
  }

LABEL_26:
  return v13;
}

void __90__ARDepthTechnique_bindInputBuffer_withImage_andOriginalImageData_rotationOfResultTensor___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateOpticalFlowOutputBufferInBackgroundFromImageData:", *(_QWORD *)(a1 + 32));

}

- (id)networkModesForOrientation:(int64_t)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  ARDepthTechnique *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 3) > 1)
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
      _ARLogGeneral_32();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543874;
        v10 = v7;
        v11 = 2048;
        v12 = self;
        v13 = 2048;
        v14 = a3;
        _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find a network config for the device orientation %ld", (uint8_t *)&v9, 0x20u);

      }
    }
    else
    {
      self->_layout = 0;
    }
  }
  else
  {
    self->_layout = 1;
  }
  -[ADEspressoJasperColorInferenceDescriptor configurationNameForLayout:](self->_inferenceDescriptor, "configurationNameForLayout:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)networkModeDidChange:(id)a3 toMode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARDepthTechnique;
  -[ARMLImageProcessingTechnique networkModeDidChange:toMode:](&v5, sel_networkModeDidChange_toMode_, a3, a4);
  CVPixelBufferRelease(self->_previousDepthBuffer);
  self->_previousDepthBuffer = 0;
  CVPixelBufferRelease(self->_previousConfidenceBuffer);
  self->_previousConfidenceBuffer = 0;
  if (self->_temporalConsistencyMethod == 2)
    -[ARDepthTechnique _allocateLKTBuffers](self, "_allocateLKTBuffers");
}

- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8
{
  double height;
  double width;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  OSType v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  CVReturn v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  ARMLDepthData *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  OSType v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  CVReturn v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  objc_class *v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  uint64_t v59;
  __CVBuffer *v60;
  void *BaseAddress;
  uint64_t v62;
  NSObject *v63;
  objc_class *v64;
  void *v65;
  CVPixelBufferRef v66;
  uint64_t v67;
  NSObject *v68;
  objc_class *v69;
  void *v70;
  uint64_t *v71;
  objc_class *v72;
  void *v73;
  __CVBuffer *v74;
  simd_float4 v75;
  simd_float4 v76;
  simd_float4 v77;
  simd_float4 v78;
  void *v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  ARDepthTechnique *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  __CVBuffer *previousDepthBuffer;
  int *v98;
  CVPixelBufferPoolRef *p_outputTemporalConsistentDepthPixelBufferPool;
  CVPixelBufferRef v100;
  CVPixelBufferRef v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __CVBuffer *previousWarpedDepthBuffer;
  size_t v106;
  double v107;
  BOOL v108;
  ARDepthTechnique *v109;
  __CVBuffer *v110;
  CVPixelBufferRef v111;
  ARDepthTechnique *v112;
  NSObject *v113;
  objc_class *v114;
  void *v115;
  CVPixelBufferRef v116;
  __CVBuffer *previousWarpedConfidenceBuffer;
  size_t v118;
  double v119;
  __CVBuffer *v120;
  uint64_t v122;
  NSObject *v123;
  objc_class *v124;
  id v125;
  CVPixelBufferRef v126;
  void *v127;
  int64_t v128;
  ARImageRotationTechnique *v129;
  void *v130;
  void *v131;
  ARImageRotationTechnique *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  CVPixelBufferRef v137;
  __CVBuffer *v138;
  __int32 v139;
  NSObject *v140;
  objc_class *v141;
  id v142;
  id v143;
  ARMLDepthData *v144;
  double v145;
  ARMLDepthData *v146;
  ARMLDepthData *v147;
  double v148;
  void *v149;
  __CVBuffer *v150;
  __CVBuffer *v151;
  size_t v152;
  size_t v153;
  double v154;
  double v155;
  CVPixelBufferRef v156;
  double v157;
  uint64_t v158;
  uint64_t v159;
  NSObject *v160;
  objc_class *v161;
  id v162;
  CVPixelBufferRef v163;
  __CVBuffer *v164;
  __CVBuffer *v165;
  __int32 v166;
  NSObject *v167;
  objc_class *v168;
  id v169;
  void *v170;
  void *v171;
  CVPixelBufferRef v173;
  __CVBuffer *v174;
  __CVBuffer *v175;
  __int32 v176;
  NSObject *v177;
  objc_class *v178;
  id v179;
  CVPixelBufferRef v180;
  __CVBuffer *v181;
  __CVBuffer *v182;
  __int32 v183;
  NSObject *v184;
  objc_class *v185;
  id v186;
  CVPixelBufferRef v187;
  __CVBuffer *v188;
  __CVBuffer *v189;
  __int32 v190;
  NSObject *v191;
  objc_class *v192;
  id v193;
  CVPixelBufferRef v194;
  float32x4_t v195;
  float32x4_t v196;
  float32x4_t v197;
  float32x4_t lock;
  simd_float4 v199;
  double v200;
  simd_float4 v201;
  double v202;
  simd_float4 v203;
  double v204;
  const __CFAllocator *allocator;
  simd_float4 allocatora;
  double allocatorb;
  void *v208;
  void *v209;
  float32x4_t v210;
  void *v211;
  void *v212;
  float32x4_t v213;
  __CVPixelBufferPool **p_outputDepthPixelBufferPool;
  float32x4_t v215;
  unint64_t var5;
  unint64_t var4;
  uint64_t v218;
  float32x4_t v219;
  double v220;
  void *v222;
  id v223;
  id v224;
  ARDepthTechnique *v225;
  _QWORD v226[2];
  void (*v227)(uint64_t);
  void *v228;
  CVPixelBufferRef v229;
  _QWORD v230[2];
  void (*v231)(uint64_t);
  void *v232;
  __CVBuffer *v233;
  _QWORD v234[2];
  void (*v235)(uint64_t);
  void *v236;
  __CVBuffer *v237;
  _QWORD v238[2];
  void (*v239)(uint64_t);
  void *v240;
  __CVBuffer *v241;
  _QWORD v242[2];
  void (*v243)(uint64_t);
  void *v244;
  __CVBuffer *v245;
  _QWORD v246[2];
  void (*v247)(uint64_t);
  void *v248;
  CVPixelBufferRef v249;
  _QWORD v250[2];
  void (*v251)(uint64_t);
  void *v252;
  simd_float4x4 *p_buf;
  _QWORD v254[2];
  void (*v255)(uint64_t);
  void *v256;
  uint64_t *v257;
  uint64_t *v258;
  uint64_t v259;
  uint64_t *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t *v264;
  uint64_t v265;
  uint64_t v266;
  _QWORD v267[2];
  void (*v268)(uint64_t);
  void *v269;
  CVPixelBufferRef v270;
  _QWORD v271[2];
  void (*v272)(uint64_t);
  void *v273;
  CVPixelBufferRef v274;
  CVPixelBufferRef v275;
  CVPixelBufferRef v276;
  _QWORD v277[2];
  void (*v278)(uint64_t);
  void *v279;
  uint64_t *v280;
  uint64_t v281;
  uint64_t *v282;
  uint64_t v283;
  CVPixelBufferRef v284;
  _QWORD v285[2];
  void (*v286)(uint64_t);
  void *v287;
  uint64_t *v288;
  uint64_t v289;
  uint64_t *v290;
  uint64_t v291;
  CVPixelBufferRef v292;
  _QWORD v293[2];
  void (*v294)(uint64_t);
  void *v295;
  uint64_t *v296;
  uint64_t v297;
  uint64_t *v298;
  uint64_t v299;
  CVPixelBufferRef v300;
  simd_float4x4 v301;
  simd_float4x4 buf;
  uint64_t v303;
  simd_float4x4 v304;
  simd_float4x4 v305;
  simd_float4x4 v306;

  height = a8.height;
  width = a8.width;
  v303 = *MEMORY[0x1E0C80C00];
  v223 = a5;
  v224 = a6;
  var5 = a3->var5;
  var4 = a3->var4;
  v13 = (double)var4;
  v14 = (double)var5;
  v297 = 0;
  v298 = &v297;
  v299 = 0x2020000000;
  v300 = 0;
  p_outputDepthPixelBufferPool = &self->_outputDepthPixelBufferPool;
  v225 = self;
  v300 = ARCreateCVPixelBufferFromPool(&self->_outputDepthPixelBufferPool, 1717855600, self, CFSTR("Depth Output"), (double)var4, (double)var5);
  if (v298[3])
  {
    v293[0] = MEMORY[0x1E0C809B0];
    v293[1] = 3221225472;
    v294 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke;
    v295 = &unk_1E6672490;
    v296 = &v297;
    v289 = 0;
    v290 = &v289;
    v291 = 0x2020000000;
    v292 = 0;
    v292 = ARCreateCVPixelBufferFromPool(&self->_outputConfidencePixelBufferPool, 1717855600, self, CFSTR("Confidence Ouput"), v13, v14);
    if (!v290[3])
    {
      v32 = 0;
LABEL_145:
      _Block_object_dispose(&v289, 8);
      v294((uint64_t)v293);
      goto LABEL_146;
    }
    v285[0] = MEMORY[0x1E0C809B0];
    v285[1] = 3221225472;
    v286 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_2;
    v287 = &unk_1E6672490;
    v288 = &v289;
    v281 = 0;
    v282 = &v281;
    v283 = 0x2020000000;
    v284 = 0;
    v284 = ARCreateCVPixelBufferFromPool(&self->_outputConfidenceMapPixelBufferPool, 1278226488, self, CFSTR("Confidence Map Ouput"), v13, v14);
    if (!v282[3])
    {
      v32 = 0;
LABEL_144:
      _Block_object_dispose(&v281, 8);
      v286((uint64_t)v285);
      goto LABEL_145;
    }
    v277[0] = MEMORY[0x1E0C809B0];
    v277[1] = 3221225472;
    v278 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_3;
    v279 = &unk_1E6672490;
    v280 = &v281;
    v276 = 0;
    v275 = 0;
    -[ADEspressoJasperColorInferenceDescriptor depthOutput](self->_inferenceDescriptor, "depthOutput");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "imageDescriptor");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "sizeForLayout:", self->_layout);
    v16 = v15;
    -[ADEspressoJasperColorInferenceDescriptor depthOutput](self->_inferenceDescriptor, "depthOutput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeForLayout:", self->_layout);
    v20 = v19;
    -[ADEspressoJasperColorInferenceDescriptor depthOutput](self->_inferenceDescriptor, "depthOutput");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "pixelFormat");
    v24 = *(void **)-[ARMLImageProcessingTechnique espressoOutputTensorsData](self, "espressoOutputTensorsData");
    -[ADEspressoJasperColorInferenceDescriptor depthOutput](v225->_inferenceDescriptor, "depthOutput");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageDescriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sizeForLayout:", v225->_layout);
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v28 = CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)v16, (unint64_t)v20, v23, v24, vcvtd_n_u64_f64(v27, 2uLL), 0, 0, 0, &v276);

    if (v28)
    {
      _ARLogTechnique_11();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        buf.columns[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v31;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
        _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't allocate pixel buffer for raw depth output", (uint8_t *)&buf, 0x16u);

      }
      v32 = 0;
      goto LABEL_143;
    }
    v271[0] = MEMORY[0x1E0C809B0];
    v271[1] = 3221225472;
    v272 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_27;
    v273 = &__block_descriptor_40_e5_v8__0l;
    v274 = v276;
    -[ADEspressoJasperColorInferenceDescriptor confidenceOutput](v225->_inferenceDescriptor, "confidenceOutput");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "imageDescriptor");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "sizeForLayout:", v225->_layout);
    v34 = v33;
    -[ADEspressoJasperColorInferenceDescriptor confidenceOutput](v225->_inferenceDescriptor, "confidenceOutput");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "imageDescriptor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sizeForLayout:", v225->_layout);
    v38 = v37;
    -[ADEspressoJasperColorInferenceDescriptor confidenceOutput](v225->_inferenceDescriptor, "confidenceOutput");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "imageDescriptor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "pixelFormat");
    v42 = (void *)-[ARMLImageProcessingTechnique espressoOutputTensorsData](v225, "espressoOutputTensorsData")[168];
    -[ADEspressoJasperColorInferenceDescriptor confidenceOutput](v225->_inferenceDescriptor, "confidenceOutput");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "imageDescriptor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sizeForLayout:", v225->_layout);
    v46 = CVPixelBufferCreateWithBytes(allocator, (unint64_t)v34, (unint64_t)v38, v41, v42, vcvtd_n_u64_f64(v45, 2uLL), 0, 0, 0, &v275);

    if (v46)
    {
      _ARLogTechnique_11();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        buf.columns[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v49;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
        _os_log_impl(&dword_1B3A68000, v47, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't allocate pixel buffer for raw confidence output", (uint8_t *)&buf, 0x16u);

      }
      v32 = 0;
      goto LABEL_142;
    }
    v267[0] = MEMORY[0x1E0C809B0];
    v267[1] = 3221225472;
    v268 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_28;
    v269 = &__block_descriptor_40_e5_v8__0l;
    v270 = v275;
    objc_msgSend(v224, "timestamp");
    v50 = (uint64_t)v225;
    kdebug_trace();
    v51 = -[ADJasperColorPipeline postProcessWithDepth:confidence:depthOutput:confidenceOutput:](v225->_pipeline, "postProcessWithDepth:confidence:depthOutput:confidenceOutput:", v276, v275, v298[3], v290[3]);
    objc_msgSend(v224, "timestamp");
    kdebug_trace();
    if (v51)
    {
      _ARLogTechnique_11();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        buf.columns[0].i32[0] = 138543874;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v54;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
        buf.columns[1].i16[3] = 2048;
        buf.columns[1].i64[1] = v51;
        _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to post process AppleDepth pipeline output: %li", (uint8_t *)&buf, 0x20u);

      }
      v50 = (uint64_t)v225;
    }
    v55 = objc_msgSend(*(id *)(v50 + 344), "postProcessConfidence:confidenceOutput:confidenceUnits:", v275, v282[3], 1);
    if (v55)
    {
      _ARLogTechnique_11();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        buf.columns[0].i32[0] = 138543874;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v58;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = v50;
        buf.columns[1].i16[3] = 2048;
        buf.columns[1].i64[1] = v55;
        _os_log_impl(&dword_1B3A68000, v56, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to post process AppleDepth confidence map output: %li", (uint8_t *)&buf, 0x20u);

      }
      v32 = 0;
LABEL_141:
      v268((uint64_t)v267);
LABEL_142:
      v272((uint64_t)v271);
LABEL_143:
      v278((uint64_t)v277);
      goto LABEL_144;
    }
    v263 = 0;
    v264 = &v263;
    v265 = 0x2020000000;
    v266 = 0;
    v259 = 0;
    v260 = &v259;
    v261 = 0x2020000000;
    v262 = 0;
    v254[0] = MEMORY[0x1E0C809B0];
    v254[1] = 3221225472;
    v255 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_29;
    v256 = &unk_1E6674FD8;
    v257 = &v263;
    v258 = &v259;
    v59 = *(_QWORD *)(v50 + 720);
    if (*(_QWORD *)(v50 + 360) && v59 == 2)
    {
      buf.columns[0].i64[0] = 0;
      buf.columns[0].i64[1] = (uint64_t)&buf;
      buf.columns[1] = (simd_float4)0x2020000000uLL;
      v250[0] = MEMORY[0x1E0C809B0];
      v250[1] = 3221225472;
      v251 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_2_30;
      v252 = &unk_1E6672490;
      p_buf = &buf;
      if (*(_BYTE *)(v50 + 376))
      {
        v60 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 432), 1717855600, (void *)v50, CFSTR("Alpha Ouput"), v13, v14);
        *(_QWORD *)(buf.columns[0].i64[1] + 24) = v60;
        if (v60)
        {
          CVPixelBufferLockBaseAddress(v60, 0);
          BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(buf.columns[0].i64[1] + 24));
          memcpy(BaseAddress, *(const void **)(objc_msgSend((id)v50, "espressoOutputTensorsData") + 336), vcvtd_n_u64_f64(v13 * v14, 2uLL));
          CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(buf.columns[0].i64[1] + 24), 0);
        }
        else
        {
          _ARLogTechnique_11();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = (objc_class *)objc_opt_class();
            NSStringFromClass(v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v301.columns[0].i32[0] = 138543618;
            *(uint64_t *)((char *)v301.columns[0].i64 + 4) = (uint64_t)v65;
            v301.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&v301.columns[0].i64[1] + 6) = (uint64_t)v225;
            _os_log_impl(&dword_1B3A68000, v63, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create alpha buffer for generating optical flow result pixelbuffer", (uint8_t *)&v301, 0x16u);

          }
          v50 = (uint64_t)v225;
        }
      }
      if (*(_QWORD *)(v50 + 504))
      {
        v66 = ARCreateCVPixelBufferFromPool(p_outputDepthPixelBufferPool, 1717855600, (void *)v50, CFSTR("temporally smoothed depth buffer"), v13, v14);
        v264[3] = (uint64_t)v66;
        if (!v66)
        {
          _ARLogTechnique_11();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v72 = (objc_class *)objc_opt_class();
            NSStringFromClass(v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v301.columns[0].i32[0] = 138543618;
            *(uint64_t *)((char *)v301.columns[0].i64 + 4) = (uint64_t)v73;
            v301.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&v301.columns[0].i64[1] + 6) = v50;
            _os_log_impl(&dword_1B3A68000, v68, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create pixel buffer for generating optical flow result pixelbuffer", (uint8_t *)&v301, 0x16u);

          }
          goto LABEL_43;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v50 + 640));
        objc_msgSend(v224, "timestamp");
        kdebug_trace();
        v67 = objc_msgSend(*(id *)(v50 + 344), "warpAndFuseWithCurrDepth:prevDepth:opticalFlow:alphaMap:depthOutput:", v298[3], *(_QWORD *)(v50 + 504), *(_QWORD *)(v50 + 744), *(_QWORD *)(buf.columns[0].i64[1] + 24), v264[3]);
        objc_msgSend(v224, "timestamp");
        kdebug_trace();
        objc_msgSend((id)v50, "setOpticalFlowOutputBuffer:", 0);
        os_unfair_lock_unlock((os_unfair_lock_t)(v50 + 640));
        if (v67)
        {
          _ARLogTechnique_11();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v69 = (objc_class *)objc_opt_class();
            NSStringFromClass(v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v301.columns[0].i32[0] = 138543874;
            *(uint64_t *)((char *)v301.columns[0].i64 + 4) = (uint64_t)v70;
            v301.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&v301.columns[0].i64[1] + 6) = v50;
            v301.columns[1].i16[3] = 2048;
            v301.columns[1].i64[1] = v67;
            _os_log_impl(&dword_1B3A68000, v68, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to warp and fuse AppleDepth pipeline output: %li", (uint8_t *)&v301, 0x20u);

          }
LABEL_43:

          v50 = (uint64_t)v225;
LABEL_46:
          v251((uint64_t)v250);
          _Block_object_dispose(&buf, 8);
          goto LABEL_94;
        }
        CVPixelBufferRelease(*(CVPixelBufferRef *)(v50 + 504));
        v71 = v264;
      }
      else
      {
        v71 = v298;
      }
      v74 = (__CVBuffer *)v71[3];
      *(_QWORD *)(v50 + 504) = v74;
      CVPixelBufferRetain(v74);
      goto LABEL_46;
    }
    if (v59 != 1)
    {
      if ((_DWORD)var4 == (int)width && (_DWORD)var5 == (int)height)
        goto LABEL_96;
LABEL_94:
      v137 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 440), 1717855600, (void *)v50, CFSTR("Scaled Depth Ouput"), width, height);
      v138 = v137;
      if (!v137)
        goto LABEL_130;
      v246[0] = MEMORY[0x1E0C809B0];
      v246[1] = 3221225472;
      v247 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_44;
      v248 = &__block_descriptor_40_e5_v8__0l;
      v249 = v137;
      objc_msgSend(v224, "timestamp");
      kdebug_trace();
      v139 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v298[3], v138, 4uLL);
      objc_msgSend(v224, "timestamp");
      kdebug_trace();
      if (v139)
      {
        _ARLogTechnique_11();
        v140 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
        {
          v141 = (objc_class *)objc_opt_class();
          NSStringFromClass(v141);
          v142 = (id)objc_claimAutoreleasedReturnValue();
          buf.columns[0].i32[0] = 138543874;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v142;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
          buf.columns[1].i16[3] = 1024;
          buf.columns[1].i32[2] = v139;
          _os_log_impl(&dword_1B3A68000, v140, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer: %i", (uint8_t *)&buf, 0x1Cu);

        }
        v50 = (uint64_t)v225;
      }
      else
      {
        CVPixelBufferRelease((CVPixelBufferRef)v298[3]);
        v163 = CVPixelBufferRetain(v138);
        v298[3] = (uint64_t)v163;
      }
      v247((uint64_t)v246);
      if (v139)
        goto LABEL_130;
      if (v264[3])
      {
        v164 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 464), 1717855600, (void *)v50, CFSTR("Scaled Temporally Consistent Depth Ouput"), width, height);
        v165 = v164;
        if (!v164)
          goto LABEL_130;
        v242[0] = MEMORY[0x1E0C809B0];
        v242[1] = 3221225472;
        v243 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_47;
        v244 = &__block_descriptor_40_e5_v8__0l;
        v245 = v164;
        v166 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v264[3], v164, 4uLL);
        if (v166)
        {
          _ARLogTechnique_11();
          v167 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
          {
            v168 = (objc_class *)objc_opt_class();
            NSStringFromClass(v168);
            v169 = (id)objc_claimAutoreleasedReturnValue();
            buf.columns[0].i32[0] = 138543874;
            *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v169;
            buf.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
            buf.columns[1].i16[3] = 1024;
            buf.columns[1].i32[2] = v166;
            _os_log_impl(&dword_1B3A68000, v167, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample temporally consistent depth buffer: %i", (uint8_t *)&buf, 0x1Cu);

          }
          v50 = (uint64_t)v225;
        }
        else
        {
          CVPixelBufferRelease((CVPixelBufferRef)v264[3]);
          v173 = CVPixelBufferRetain(v165);
          v264[3] = (uint64_t)v173;
        }
        v243((uint64_t)v242);
        if (v166)
          goto LABEL_130;
      }
      v174 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 448), 1717855600, (void *)v50, CFSTR("Scaled Depth Confidence Ouput"), width, height);
      v175 = v174;
      if (!v174)
        goto LABEL_130;
      v238[0] = MEMORY[0x1E0C809B0];
      v238[1] = 3221225472;
      v239 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_50;
      v240 = &__block_descriptor_40_e5_v8__0l;
      v241 = v174;
      v176 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v290[3], v174, 4uLL);
      if (v176)
      {
        _ARLogTechnique_11();
        v177 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
        {
          v178 = (objc_class *)objc_opt_class();
          NSStringFromClass(v178);
          v179 = (id)objc_claimAutoreleasedReturnValue();
          buf.columns[0].i32[0] = 138543874;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v179;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
          buf.columns[1].i16[3] = 1024;
          buf.columns[1].i32[2] = v176;
          _os_log_impl(&dword_1B3A68000, v177, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer: %i", (uint8_t *)&buf, 0x1Cu);

        }
        v50 = (uint64_t)v225;
      }
      else
      {
        CVPixelBufferRelease((CVPixelBufferRef)v290[3]);
        v180 = CVPixelBufferRetain(v175);
        v290[3] = (uint64_t)v180;
      }
      v239((uint64_t)v238);
      if (v176)
        goto LABEL_130;
      if (v260[3])
      {
        v181 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 464), 1717855600, (void *)v50, CFSTR("Scaled Temporally Consistent Depth Confidence Ouput"), width, height);
        v182 = v181;
        if (!v181)
          goto LABEL_130;
        v234[0] = MEMORY[0x1E0C809B0];
        v234[1] = 3221225472;
        v235 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_53;
        v236 = &__block_descriptor_40_e5_v8__0l;
        v237 = v181;
        v183 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v260[3], v181, 4uLL);
        if (v183)
        {
          _ARLogTechnique_11();
          v184 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
          {
            v185 = (objc_class *)objc_opt_class();
            NSStringFromClass(v185);
            v186 = (id)objc_claimAutoreleasedReturnValue();
            buf.columns[0].i32[0] = 138543874;
            *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v186;
            buf.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
            buf.columns[1].i16[3] = 1024;
            buf.columns[1].i32[2] = v183;
            _os_log_impl(&dword_1B3A68000, v184, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample temporally consistent confidence buffer: %i", (uint8_t *)&buf, 0x1Cu);

          }
        }
        else
        {
          CVPixelBufferRelease((CVPixelBufferRef)v260[3]);
          v187 = CVPixelBufferRetain(v182);
          v260[3] = (uint64_t)v187;
        }
        v235((uint64_t)v234);
        v50 = (uint64_t)v225;
        if (v183)
          goto LABEL_130;
      }
      v188 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 456), 1278226488, (void *)v50, CFSTR("Scaled Depth Confidence Map Ouput"), width, height);
      v189 = v188;
      if (!v188)
        goto LABEL_130;
      v230[0] = MEMORY[0x1E0C809B0];
      v230[1] = 3221225472;
      v231 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_56;
      v232 = &__block_descriptor_40_e5_v8__0l;
      v233 = v188;
      v190 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v282[3], v188, 1uLL);
      if (v190)
      {
        _ARLogTechnique_11();
        v191 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
        {
          v192 = (objc_class *)objc_opt_class();
          NSStringFromClass(v192);
          v193 = (id)objc_claimAutoreleasedReturnValue();
          buf.columns[0].i32[0] = 138543874;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v193;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
          buf.columns[1].i16[3] = 1024;
          buf.columns[1].i32[2] = v190;
          _os_log_impl(&dword_1B3A68000, v191, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample confidence buffer: %i", (uint8_t *)&buf, 0x1Cu);

        }
      }
      else
      {
        CVPixelBufferRelease((CVPixelBufferRef)v282[3]);
        v194 = CVPixelBufferRetain(v189);
        v282[3] = (uint64_t)v194;
      }
      v231((uint64_t)v230);
      v50 = (uint64_t)v225;
      if (v190)
      {
LABEL_130:
        v32 = 0;
      }
      else
      {
LABEL_96:
        v127 = *(void **)(v50 + 616);
        v128 = a7;
        if (!v127 || objc_msgSend(v127, "rotationAngle") != a7 || objc_msgSend(*(id *)(v50 + 616), "mirrorMode"))
        {
          v129 = -[ARImageRotationTechnique initWithRotation:mirror:]([ARImageRotationTechnique alloc], "initWithRotation:mirror:", a7, 0);
          v130 = *(void **)(v50 + 616);
          *(_QWORD *)(v50 + 616) = v129;

          v50 = (uint64_t)v225;
          v128 = a7;
        }
        v131 = *(void **)(v50 + 624);
        if (!v131 || objc_msgSend(v131, "rotationAngle") != v128 || objc_msgSend(*(id *)(v50 + 624), "mirrorMode"))
        {
          v132 = -[ARImageRotationTechnique initWithRotation:mirror:]([ARImageRotationTechnique alloc], "initWithRotation:mirror:", v128, 0);
          v133 = *(void **)(v50 + 624);
          *(_QWORD *)(v50 + 624) = v132;

          v50 = (uint64_t)v225;
        }
        objc_msgSend(v224, "timestamp");
        kdebug_trace();
        objc_msgSend((id)v50, "_rotatedPixelBufferImageData:", v298[3]);
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v50, "_rotatedPixelBufferImageData:", v290[3]);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v50, "_rotatedPixelBufferImageData:", v282[3]);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if (v264[3])
        {
          objc_msgSend((id)v50, "_rotatedPixelBufferImageData:");
          v136 = (id)objc_claimAutoreleasedReturnValue();

          v50 = (uint64_t)v225;
        }
        else
        {
          v136 = 0;
        }
        if (v260[3])
        {
          objc_msgSend((id)v50, "_rotatedPixelBufferImageData:");
          v143 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v143 = 0;
        }
        objc_msgSend(v224, "timestamp");
        kdebug_trace();
        if (v136 && v143)
        {
          v144 = [ARMLDepthData alloc];
          objc_msgSend(v224, "timestamp");
          v146 = -[ARMLDepthData initWithTimestamp:depthBuffer:confidenceBuffer:source:](v144, "initWithTimestamp:depthBuffer:confidenceBuffer:source:", objc_msgSend(v136, "pixelBuffer"), objc_msgSend(v143, "pixelBuffer"), 2, v145);
          -[ARMLDepthData setSingleFrameDepthBuffer:](v146, "setSingleFrameDepthBuffer:", objc_msgSend(v222, "pixelBuffer"));
          -[ARMLDepthData setSingleFrameConfidenceBuffer:](v146, "setSingleFrameConfidenceBuffer:", objc_msgSend(v134, "pixelBuffer"));
        }
        else
        {
          v147 = [ARMLDepthData alloc];
          objc_msgSend(v224, "timestamp");
          v146 = -[ARMLDepthData initWithTimestamp:depthBuffer:confidenceBuffer:source:](v147, "initWithTimestamp:depthBuffer:confidenceBuffer:source:", objc_msgSend(v222, "pixelBuffer"), objc_msgSend(v134, "pixelBuffer"), 2, v148);
        }
        -[ARMLDepthData setConfidenceMap:](v146, "setConfidenceMap:", objc_msgSend(v135, "pixelBuffer"));
        objc_msgSend(v224, "originalImage");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARMLDepthData setSourceImageData:](v146, "setSourceImageData:", v149);

        if (v225->_computeNormals)
        {
          v150 = -[ARMLDepthData singleFrameDepthBuffer](v146, "singleFrameDepthBuffer");
          v151 = v150;
          if (v150)
          {
            v152 = CVPixelBufferGetWidth(v150);
            v153 = CVPixelBufferGetHeight(v151);
            v154 = (double)v152;
            v155 = (double)v153;
          }
          else
          {
            v154 = *MEMORY[0x1E0C9D820];
            v155 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          }
          v156 = ARCreateCVPixelBufferFromPool(&v225->_normalPixelBufferPool, 1380410945, v225, CFSTR("Normals Map"), v154, v155);
          v226[0] = MEMORY[0x1E0C809B0];
          v226[1] = 3221225472;
          v227 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_60;
          v228 = &__block_descriptor_40_e5_v8__0l;
          v229 = v156;
          if (v156)
          {
            objc_msgSend(v224, "cameraIntrinsics");
            v218 = v158;
            v220 = v157;
            objc_msgSend(v224, "timestamp");
            kdebug_trace();
            v159 = objc_msgSend(MEMORY[0x1E0CFCE10], "normalsFromDepth:focalLength:principalPoint:normalsOutput:withHelperBuffer:", -[ARMLDepthData depthBuffer](v146, "depthBuffer"), v156, v225->_normalsHelperBuffer, v220, *(float *)&v218, *((float *)&v218 + 1));
            objc_msgSend(v224, "timestamp");
            kdebug_trace();
            if (v159)
            {
              _ARLogTechnique_11();
              v160 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
              {
                v161 = (objc_class *)objc_opt_class();
                NSStringFromClass(v161);
                v162 = (id)objc_claimAutoreleasedReturnValue();
                buf.columns[0].i32[0] = 138543874;
                *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v162;
                buf.columns[0].i16[6] = 2048;
                *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
                buf.columns[1].i16[3] = 2048;
                buf.columns[1].i64[1] = v159;
                _os_log_impl(&dword_1B3A68000, v160, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to generate normal map: %li", (uint8_t *)&buf, 0x20u);

              }
            }
            else
            {
              -[ARMLDepthData setNormalsBuffer:](v146, "setNormalsBuffer:", v156);
            }
          }
          v227((uint64_t)v226);
        }
        -[ARMLDepthData timestamp](v146, "timestamp");
        kdebug_trace();
        -[ARMLDepthData timestamp](v146, "timestamp");
        -[ARMLDepthData sourceImageData](v146, "sourceImageData");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "cameraType");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "isEqualToString:", *MEMORY[0x1E0C89F98]);
        kdebug_trace();

        -[ARMLDepthData timestamp](v146, "timestamp");
        objc_msgSend(v224, "cameraIntrinsics");
        objc_msgSend(v224, "cameraIntrinsics");
        objc_msgSend(v224, "cameraIntrinsics");
        kdebug_trace();
        v32 = v146;

      }
      v255((uint64_t)v254);
      _Block_object_dispose(&v259, 8);
      _Block_object_dispose(&v263, 8);
      goto LABEL_141;
    }
    if (a7 == -90)
    {
      v62 = 3;
    }
    else if (a7 == 180)
    {
      v62 = 2;
    }
    else
    {
      v62 = a7 == 90;
    }
    *(double *)v75.i64 = matrixForImageRotation(v62);
    v203 = v76;
    allocatora = v75;
    v199 = v78;
    v201 = v77;
    v79 = (void *)MEMORY[0x1E0CFCE20];
    objc_msgSend(v224, "visionTransform");
    objc_msgSend(v79, "transformMetersToMillimiters:");
    v219 = v80;
    v213 = v82;
    v215 = v81;
    v210 = v83;
    objc_msgSend(v224, "calibrationData");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      v85 = objc_alloc(MEMORY[0x1E0CFCE00]);
      objc_msgSend(v224, "calibrationData");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "ar_initWithImageData:calibrationData:", v224, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      v88 = (void *)objc_opt_new();
      objc_msgSend(v87, "setDistortionModel:", v88);

      objc_msgSend(v87, "adjustForImageRotation:", v62);
      objc_msgSend(v87, "referenceDimensions");
      v89 = v225;
      v91 = v90;
      objc_msgSend(v87, "referenceDimensions");
      v93 = (double)var5;
      if (v91 * v13 != v92 * v14)
      {
        objc_msgSend(v87, "referenceDimensions");
        v95 = v94;
        objc_msgSend(v87, "referenceDimensions");
        v93 = v95 * v13 / v96;
      }
      objc_msgSend(v87, "scale:", v13, v93);
    }
    else
    {
      v87 = 0;
      v89 = v225;
    }
    previousDepthBuffer = v89->_previousDepthBuffer;
    v98 = &OBJC_IVAR___ARWorldTrackingTechnique__meshChunkIdentifiersCurrentlyBeingProcessed;
    if (!previousDepthBuffer || !v89->_previousConfidenceBuffer)
    {
      CVPixelBufferRelease(previousDepthBuffer);
      v225->_previousDepthBuffer = CVPixelBufferRetain((CVPixelBufferRef)v298[3]);
      CVPixelBufferRelease(v225->_previousConfidenceBuffer);
      v111 = CVPixelBufferRetain((CVPixelBufferRef)v290[3]);
      v112 = v225;
      v225->_previousConfidenceBuffer = v111;
LABEL_93:
      *(float32x4_t *)v112->_anon_220 = v219;
      *(float32x4_t *)&v112->_anon_220[16] = v215;
      *(float32x4_t *)&v112->_anon_220[32] = v213;
      *(float32x4_t *)&v112->_anon_220[48] = v210;
      objc_storeStrong((id *)((char *)&v112->super.super.super.super.isa + v98[729]), v87);

      v50 = (uint64_t)v225;
      goto LABEL_94;
    }
    p_outputTemporalConsistentDepthPixelBufferPool = &v89->_outputTemporalConsistentDepthPixelBufferPool;
    v100 = ARCreateCVPixelBufferFromPool(&v89->_outputTemporalConsistentDepthPixelBufferPool, 1717855600, v89, CFSTR("temporally consistent depth buffer"), v13, v14);
    v264[3] = (uint64_t)v100;
    v101 = ARCreateCVPixelBufferFromPool(&v225->_outputTemporalConsistentConfidencePixelBufferPool, 1717855600, v225, CFSTR("temporally consistent confidence buffer"), v13, v14);
    v260[3] = (uint64_t)v101;
    if (!v264[3] || !v101)
    {
      _ARLogTechnique_11();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        v114 = (objc_class *)objc_opt_class();
        NSStringFromClass(v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        buf.columns[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v115;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
        _os_log_impl(&dword_1B3A68000, v113, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create pixel buffer for generating optical flow result pixelbuffer", (uint8_t *)&buf, 0x16u);

      }
      v112 = v225;
      v98 = &OBJC_IVAR___ARWorldTrackingTechnique__meshChunkIdentifiersCurrentlyBeingProcessed;
      goto LABEL_93;
    }
    os_unfair_lock_lock(&v225->_opticalFlowOutputBufferLock);
    objc_msgSend(v224, "timestamp");
    kdebug_trace();
    v304 = __invert_f4(*(simd_float4x4 *)v225->_anon_220);
    v102 = 0;
    v301 = v304;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v102] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v219, COERCE_FLOAT(*(_OWORD *)&v301.columns[v102])), v215, *(float32x2_t *)v301.columns[v102].f32, 1), v213, (float32x4_t)v301.columns[v102], 2), v210, (float32x4_t)v301.columns[v102], 3);
      ++v102;
    }
    while (v102 != 4);
    v197 = (float32x4_t)buf.columns[1];
    lock = (float32x4_t)buf.columns[0];
    v195 = (float32x4_t)buf.columns[3];
    v196 = (float32x4_t)buf.columns[2];
    v305.columns[1] = v203;
    v305.columns[0] = allocatora;
    v305.columns[3] = v199;
    v305.columns[2] = v201;
    v306 = __invert_f4(v305);
    v103 = 0;
    v301.columns[0] = allocatora;
    v301.columns[1] = v203;
    v301.columns[2] = v201;
    v301.columns[3] = v199;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v103] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(lock, COERCE_FLOAT(*(_OWORD *)&v301.columns[v103])), v197, *(float32x2_t *)v301.columns[v103].f32, 1), v196, (float32x4_t)v301.columns[v103], 2), v195, (float32x4_t)v301.columns[v103], 3);
      ++v103;
    }
    while (v103 != 4);
    v104 = 0;
    v301 = buf;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v104] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v306.columns[0], COERCE_FLOAT(*(_OWORD *)&v301.columns[v104])), (float32x4_t)v306.columns[1], *(float32x2_t *)v301.columns[v104].f32, 1), (float32x4_t)v306.columns[2], (float32x4_t)v301.columns[v104], 2), (float32x4_t)v306.columns[3], (float32x4_t)v301.columns[v104], 3);
      ++v104;
    }
    while (v104 != 4);
    v204 = *(double *)buf.columns[1].i64;
    allocatorb = *(double *)buf.columns[0].i64;
    v200 = *(double *)buf.columns[3].i64;
    v202 = *(double *)buf.columns[2].i64;
    previousWarpedDepthBuffer = v225->_previousWarpedDepthBuffer;
    if (previousWarpedDepthBuffer)
    {
      v106 = CVPixelBufferGetWidth(v225->_previousWarpedDepthBuffer);
      v107 = (double)CVPixelBufferGetHeight(previousWarpedDepthBuffer);
      v108 = v13 == (double)v106 && v14 == v107;
      v109 = v225;
      if (v108)
      {
LABEL_76:
        previousWarpedConfidenceBuffer = v109->_previousWarpedConfidenceBuffer;
        if (previousWarpedConfidenceBuffer)
        {
          v118 = CVPixelBufferGetWidth(v109->_previousWarpedConfidenceBuffer);
          v119 = (double)CVPixelBufferGetHeight(previousWarpedConfidenceBuffer);
          v120 = v225->_previousWarpedConfidenceBuffer;
          if (v13 == (double)v118 && v14 == v119)
            goto LABEL_85;
        }
        else
        {
          v120 = 0;
        }
        CVPixelBufferRelease(v120);
        v120 = ARCreateCVPixelBufferFromPool(&v225->_outputTemporalConsistentConfidencePixelBufferPool, 1717855600, v225, CFSTR("temporally consistent depth buffer"), v13, v14);
        v225->_previousWarpedConfidenceBuffer = v120;
LABEL_85:
        v122 = -[ADJasperColorPipeline warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingPoseDelta:previousCalibration:currentCalibration:](v225->_pipeline, "warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingPoseDelta:previousCalibration:currentCalibration:", v225->_previousDepthBuffer, v225->_previousWarpedDepthBuffer, v225->_previousConfidenceBuffer, v120, 0, 0, allocatorb, v204, v202, v200, v225->_previousCameraCalibration, v87);
        if (!v122)
          v122 = -[ADJasperColorPipeline fuseCurrentDepth:previousDepth:intoOutputDepth:currentConfidence:previousConfidence:intoOutputConfidence:currentNormals:previousNormals:intoOutputNormals:usingAlpha:](v225->_pipeline, "fuseCurrentDepth:previousDepth:intoOutputDepth:currentConfidence:previousConfidence:intoOutputConfidence:currentNormals:previousNormals:intoOutputNormals:usingAlpha:", v298[3], v225->_previousWarpedDepthBuffer, v264[3], v290[3], v225->_previousWarpedConfidenceBuffer, v260[3], 0, 0, 0, 0);
        objc_msgSend(v224, "timestamp");
        kdebug_trace();
        os_unfair_lock_unlock(&v225->_opticalFlowOutputBufferLock);
        if (v122)
        {
          _ARLogTechnique_11();
          v123 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            v124 = (objc_class *)objc_opt_class();
            NSStringFromClass(v124);
            v125 = (id)objc_claimAutoreleasedReturnValue();
            buf.columns[0].i32[0] = 138543874;
            *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v125;
            buf.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
            buf.columns[1].i16[3] = 2048;
            buf.columns[1].i64[1] = v122;
            _os_log_impl(&dword_1B3A68000, v123, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to warp and fuse AppleDepth pipeline output: %li", (uint8_t *)&buf, 0x20u);

          }
          v112 = v225;
        }
        else
        {
          CVPixelBufferRelease(v225->_previousDepthBuffer);
          v225->_previousDepthBuffer = CVPixelBufferRetain((CVPixelBufferRef)v264[3]);
          CVPixelBufferRelease(v225->_previousConfidenceBuffer);
          v126 = CVPixelBufferRetain((CVPixelBufferRef)v260[3]);
          v112 = v225;
          v225->_previousConfidenceBuffer = v126;
        }
        v98 = &OBJC_IVAR___ARWorldTrackingTechnique__meshChunkIdentifiersCurrentlyBeingProcessed;
        goto LABEL_93;
      }
      v110 = v225->_previousWarpedDepthBuffer;
    }
    else
    {
      v110 = 0;
    }
    CVPixelBufferRelease(v110);
    v116 = ARCreateCVPixelBufferFromPool(p_outputTemporalConsistentDepthPixelBufferPool, 1717855600, v225, CFSTR("temporally consistent depth buffer"), v13, v14);
    v109 = v225;
    v225->_previousWarpedDepthBuffer = v116;
    goto LABEL_76;
  }
  v32 = 0;
LABEL_146:
  _Block_object_dispose(&v297, 8);

  return v32;
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_3(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_27(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_28(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_29(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_2_30(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_44(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_47(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_50(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_53(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_56(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_60(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (id)_rotatedPixelBufferImageData:(__CVBuffer *)a3
{
  void *v5;
  OSType PixelFormatType;
  int *v7;
  void *v8;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setPixelBuffer:", a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v7 = &OBJC_IVAR___ARDepthTechnique__float32RotationTechnique;
  if (PixelFormatType == 1278226488)
    v7 = &OBJC_IVAR___ARDepthTechnique__oneComponent8RotationTechnique;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v7), "processData:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  int64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARDepthTechnique;
  if (-[ARTechnique isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[ARDepthTechnique prioritization](self, "prioritization");
    v7 = v6 == objc_msgSend(v5, "prioritization") && self->_temporalConsistencyMethod == v5[90];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_startLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_endLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_startMLProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMLProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_captureMLRunNetworkInputImageData:(double)a3 cameraType:(int64_t)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6
{
  kdebug_trace();
}

- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5
{
  kdebug_trace();
}

- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (ADJasperColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (int64_t)prioritization
{
  return self->_prioritization;
}

- (__CVBuffer)opticalFlowOutputBuffer
{
  return self->_opticalFlowOutputBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_normalsHelperBuffer, 0);
  objc_storeStrong((id *)&self->_derivatives, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_pyramids, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_lktProcessingQueue, 0);
  objc_storeStrong((id *)&self->_oneComponent8RotationTechnique, 0);
  objc_storeStrong((id *)&self->_float32RotationTechnique, 0);
  objc_storeStrong((id *)&self->_previousCameraCalibration, 0);
  objc_storeStrong((id *)&self->_lktDescriptor, 0);
  objc_storeStrong((id *)&self->_lkt, 0);
  objc_storeStrong((id *)&self->_inferenceDescriptor, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
