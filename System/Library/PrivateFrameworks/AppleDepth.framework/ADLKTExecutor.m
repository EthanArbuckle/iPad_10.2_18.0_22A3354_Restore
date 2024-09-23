@implementation ADLKTExecutor

- (__CVBuffer)createPixelBufferForOpticalFlow
{
  double width;
  double height;
  const __CFAllocator *v4;
  const __CFDictionary *BufferAttributes;
  CVPixelBufferRef pixelBufferOut;

  width = self->_inputSize.width;
  height = self->_inputSize.height;
  pixelBufferOut = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  if (CVPixelBufferCreate(v4, (unint64_t)width, (unint64_t)height, 0x32433068u, BufferAttributes, &pixelBufferOut))
  {
    return 0;
  }
  else
  {
    return pixelBufferOut;
  }
}

- (ADLKTExecutor)initWithSize:(CGSize)a3
{
  double height;
  double width;
  ADLKTExecutor *v5;
  ADLKTExecutor *v6;
  MTLDevice *v7;
  MTLDevice *device;
  uint64_t v9;
  MTLCommandQueue *commandQueue;
  ADLKTOpticalFlow *v11;
  ADLKTOpticalFlow *lkt;
  uint64_t v13;
  NSMutableArray **features;
  NSMutableArray **derivitives;
  NSMutableArray **pyramids;
  char v17;
  char v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  NSMutableArray *v24;
  NSMutableArray *v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSMutableArray *v35;
  void *v36;
  NSMutableArray *v37;
  void *v38;
  NSMutableArray *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSMutableArray *v45;
  void *v46;
  NSMutableArray *v47;
  void *v48;
  NSMutableArray *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  NSMutableArray *v55;
  void *v56;
  NSMutableArray *v57;
  void *v58;
  NSMutableArray *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  NSMutableArray *v65;
  void *v66;
  NSMutableArray *v67;
  void *v68;
  NSMutableArray *v69;
  void *v70;
  objc_super v72;

  height = a3.height;
  width = a3.width;
  v72.receiver = self;
  v72.super_class = (Class)ADLKTExecutor;
  v5 = -[ADLKTExecutor init](&v72, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isFirstTime = 1;
    v5->_currentFrameIndex = 0;
    v5->_inputSize.width = width;
    v5->_inputSize.height = height;
    v7 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v6->_device;
    v6->_device = v7;

    v9 = -[MTLDevice newCommandQueue](v6->_device, "newCommandQueue");
    commandQueue = v6->_commandQueue;
    v6->_commandQueue = (MTLCommandQueue *)v9;

    v11 = -[ADLKTOpticalFlow initWithDevice:inputSize:scales:]([ADLKTOpticalFlow alloc], "initWithDevice:inputSize:scales:", v6->_device, 5, width, height);
    lkt = v6->_lkt;
    v6->_lkt = v11;

    v13 = 0;
    features = v6->_features;
    derivitives = v6->_derivitives;
    pyramids = v6->_pyramids;
    v17 = 1;
    do
    {
      v18 = v17;
      v19 = objc_opt_new();
      v20 = features[v13];
      features[v13] = (NSMutableArray *)v19;

      v21 = objc_opt_new();
      v22 = derivitives[v13];
      derivitives[v13] = (NSMutableArray *)v21;

      v23 = objc_opt_new();
      v24 = pyramids[v13];
      pyramids[v13] = (NSMutableArray *)v23;

      v25 = pyramids[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device, width, height);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v25, "addObject:", v26);

      v27 = features[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, width, height);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v27, "addObject:", v28);

      v29 = derivitives[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, width, height);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v29, "addObject:", v30);

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", width, height);
      v32 = v31;
      v34 = v33;
      v35 = pyramids[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v35, "addObject:", v36);

      v37 = features[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, v32, v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v37, "addObject:", v38);

      v39 = derivitives[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, v32, v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v39, "addObject:", v40);

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v32, v34);
      v42 = v41;
      v44 = v43;
      v45 = pyramids[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v45, "addObject:", v46);

      v47 = features[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, v42, v44);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v47, "addObject:", v48);

      v49 = derivitives[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, v42, v44);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v49, "addObject:", v50);

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v42, v44);
      v52 = v51;
      v54 = v53;
      v55 = pyramids[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v55, "addObject:", v56);

      v57 = features[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, v52, v54);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v57, "addObject:", v58);

      v59 = derivitives[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, v52, v54);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v59, "addObject:", v60);

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v52, v54);
      v62 = v61;
      v64 = v63;
      v65 = pyramids[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v65, "addObject:", v66);

      v67 = features[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, v62, v64);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v67, "addObject:", v68);

      v69 = derivitives[v13];
      +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, v62, v64);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v69, "addObject:", v70);

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v62, v64);
      v17 = 0;
      v13 = 1;
    }
    while ((v18 & 1) != 0);
  }
  return v6;
}

- (ADLKTExecutor)initWithDescriptor:(id)a3 forLayout:(unint64_t)a4
{
  ADLKTExecutor *v6;
  ADLKTExecutor *v7;
  CGFloat v8;
  CGFloat v9;
  MTLDevice *v10;
  MTLDevice *device;
  uint64_t v12;
  MTLCommandQueue *commandQueue;
  ADLKTOpticalFlow *v14;
  MTLDevice *v15;
  double width;
  double height;
  uint64_t v18;
  ADLKTOpticalFlow *lkt;
  uint64_t v20;
  char v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  NSMutableArray *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSMutableArray *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  NSMutableArray *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  NSMutableArray *v51;
  double v52;
  double v53;
  void *v54;
  ADLKTExecutor *v55;
  char v57;
  id v58;
  NSMutableArray **derivitives;
  NSMutableArray **features;
  NSMutableArray **pyramids;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _OWORD v74[2];
  uint64_t v75;
  objc_super v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v58 = a3;
  kdebug_trace();
  v76.receiver = self;
  v76.super_class = (Class)ADLKTExecutor;
  v6 = -[ADLKTExecutor init](&v76, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_30;
  v6->_isFirstTime = 1;
  v6->_currentFrameIndex = 0;
  objc_msgSend(v58, "inputSizeForLayout:", a4);
  v7->_inputSize.width = v8;
  v7->_inputSize.height = v9;
  v10 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v7->_device;
  v7->_device = v10;

  v12 = -[MTLDevice newCommandQueue](v7->_device, "newCommandQueue");
  commandQueue = v7->_commandQueue;
  v7->_commandQueue = (MTLCommandQueue *)v12;

  v14 = [ADLKTOpticalFlow alloc];
  v15 = v7->_device;
  width = v7->_inputSize.width;
  height = v7->_inputSize.height;
  if (v58)
  {
    objc_msgSend(v58, "opticalFlowConfig");
    if (v14)
    {
LABEL_4:
      v18 = -[ADLKTOpticalFlow initWithDevice:inputSize:config:](v14, "initWithDevice:inputSize:config:", v15, v74, width, height);
      goto LABEL_7;
    }
  }
  else
  {
    v75 = 0;
    memset(v74, 0, sizeof(v74));
    if (v14)
      goto LABEL_4;
  }

  v18 = 0;
LABEL_7:
  lkt = v7->_lkt;
  v7->_lkt = (ADLKTOpticalFlow *)v18;

  v20 = 0;
  derivitives = v7->_derivitives;
  features = v7->_features;
  pyramids = v7->_pyramids;
  v21 = 1;
  do
  {
    v57 = v21;
    v22 = objc_opt_new();
    v23 = features[v20];
    features[v20] = (NSMutableArray *)v22;

    v24 = objc_opt_new();
    v25 = derivitives[v20];
    derivitives[v20] = (NSMutableArray *)v24;

    v26 = objc_opt_new();
    v27 = pyramids[v20];
    pyramids[v20] = (NSMutableArray *)v26;

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v58, "pyramidsDescriptors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v71 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          v33 = pyramids[v20];
          objc_msgSend(v32, "sizeForLayout:", a4);
          +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", objc_msgSend(v32, "pixelFormat"), v7->_device, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v33, "addObject:", v36);

        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      }
      while (v29);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v58, "featuresDescriptors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v67 != v39)
            objc_enumerationMutation(v37);
          v41 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          v42 = features[v20];
          objc_msgSend(v41, "sizeForLayout:", a4);
          +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", objc_msgSend(v41, "pixelFormat"), v7->_device, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v42, "addObject:", v45);

        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      }
      while (v38);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v58, "derivitivesDescriptors");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v63;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v63 != v48)
            objc_enumerationMutation(v46);
          v50 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
          v51 = derivitives[v20];
          objc_msgSend(v50, "sizeForLayout:", a4);
          +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", objc_msgSend(v50, "pixelFormat"), v7->_device, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v51, "addObject:", v54);

        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
      }
      while (v47);
    }

    v21 = 0;
    v20 = 1;
  }
  while ((v57 & 1) != 0);
LABEL_30:
  v55 = v7;
  kdebug_trace();

  return v55;
}

- (int64_t)executeWithFrame:(__CVBuffer *)a3 createOpticalFlowBuffer:(__CVBuffer *)a4
{
  __CVBuffer *v7;
  int64_t v8;

  v7 = 0;
  *a4 = 0;
  if (!self->_isFirstTime)
  {
    v7 = -[ADLKTExecutor createPixelBufferForOpticalFlow](self, "createPixelBufferForOpticalFlow", a3, 0);
    *a4 = v7;
  }
  v8 = -[ADLKTExecutor executeWithFrame:intoOpticalFlowBuffer:](self, "executeWithFrame:intoOpticalFlowBuffer:", a3, v7);
  if (v8 && !self->_isFirstTime)
    CVPixelBufferRelease(*a4);
  return v8;
}

- (int64_t)executeWithFrame:(__CVBuffer *)a3 intoOpticalFlowBuffer:(__CVBuffer *)a4
{
  void *v7;
  void *v8;
  NSMutableArray **pyramids;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t currentFrameIndex;
  unsigned int v15;

  kdebug_trace();
  +[ADMetalUtils bindPixelBufferToMTL2DTexture:metalDevice:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:metalDevice:", a3, self->_device);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pyramids = self->_pyramids;
  v10 = -[ADLKTOpticalFlow encodePyramidFeaturesToCommandBuffer:colorTexture:outPyramidsArray:outFeaturesArray:outDerivitiveArray:](self->_lkt, "encodePyramidFeaturesToCommandBuffer:colorTexture:outPyramidsArray:outFeaturesArray:outDerivitiveArray:", v8, v7, self->_pyramids[self->_currentFrameIndex], self->_features[self->_currentFrameIndex], self->_derivitives[self->_currentFrameIndex]);
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v8, "commit");
    kdebug_trace();
    if (self->_isFirstTime)
    {
      v11 = 0;
      self->_isFirstTime = 0;
    }
    else
    {
      kdebug_trace();
      +[ADMetalUtils bindPixelBufferToMTL2DTexture:metalDevice:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:metalDevice:", a4, self->_device);
      v12 = objc_claimAutoreleasedReturnValue();
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      currentFrameIndex = self->_currentFrameIndex;
      -[ADLKTOpticalFlow encodeOpticalFlowSolverToCommandBuffer:currentFeaturesArray:currentDerivitiveArray:previousFeaturesArray:previousDerivitiveArray:currentPyramidsArray:outShiftMap:](self->_lkt, "encodeOpticalFlowSolverToCommandBuffer:currentFeaturesArray:currentDerivitiveArray:previousFeaturesArray:previousDerivitiveArray:currentPyramidsArray:outShiftMap:", v13, self->_features[currentFrameIndex], self->_derivitives[currentFrameIndex], self->_features[currentFrameIndex ^ 1], self->_derivitives[currentFrameIndex ^ 1], pyramids[currentFrameIndex], v12);
      objc_msgSend(v13, "commit");
      v11 = (void *)v12;
      v8 = v13;
      kdebug_trace();
    }
    kdebug_trace();
    objc_msgSend(v8, "waitUntilCompleted");
    v15 = 0;
    while (-[NSMutableArray count](*pyramids, "count") > (unint64_t)v15++)
      ;
    self->_currentFrameIndex ^= 1u;
    kdebug_trace();
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivitives[1], 0);
  objc_storeStrong((id *)self->_derivitives, 0);
  objc_storeStrong((id *)&self->_features[1], 0);
  objc_storeStrong((id *)self->_features, 0);
  objc_storeStrong((id *)&self->_pyramids[1], 0);
  objc_storeStrong((id *)self->_pyramids, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_lkt, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
