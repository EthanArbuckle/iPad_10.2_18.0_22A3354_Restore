@implementation FigMetalContext

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 textureSize:(CGSize)a6 plane:(unint64_t)a7
{
  return -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:slice:](self, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:slice:", a3, a4, a5, a7, 0, a6.width, a6.height);
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setAllocator:(id)a3
{
  objc_storeStrong((id *)&self->_allocator, a3);
}

- (id)computePipelineStateFor:(id)a3 constants:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTLLibrary *library;
  MTLPipelineLibrarySPI *pipelineLibrary;
  void *v11;
  id v12;
  void *v13;
  MTLDevice *device;
  id v15;
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setPipelineLibrary:", self->_pipelineLibrary);
  library = self->_library;
  if (!v6)
  {
    v11 = (void *)-[MTLLibrary newFunctionWithName:](library, "newFunctionWithName:", v7);

    if (!v11)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v13 = 0;
      v12 = 0;
      goto LABEL_7;
    }
    v12 = 0;
    goto LABEL_6;
  }
  pipelineLibrary = self->_pipelineLibrary;
  v18 = 0;
  v11 = (void *)-[MTLLibrary newFunctionWithName:constantValues:pipelineLibrary:error:](library, "newFunctionWithName:constantValues:pipelineLibrary:error:", v7, v6, pipelineLibrary, &v18);

  v12 = v18;
  if (v11)
  {
LABEL_6:
    objc_msgSend(v8, "setComputeFunction:", v11);
    device = self->_device;
    v17 = v12;
    v13 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:error:](device, "newComputePipelineStateWithDescriptor:error:", v8, &v17);
    v15 = v17;

    v12 = v15;
    goto LABEL_7;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (FigMetalContext)initWithFigMetalContext:(id)a3 andOptionalCommandQueue:(id)a4
{
  id v6;
  id v7;
  MTLBuffer *v8;
  MTLBuffer *fullRangeVertexBuf;
  MTLVertexDescriptor *v10;
  MTLVertexDescriptor *fullRangeVertexDesc;
  MTLLibrary *v12;
  MTLLibrary *library;
  MTLPipelineLibrarySPI *v14;
  MTLPipelineLibrarySPI *pipelineLibrary;
  FigMetalAllocator *v16;
  FigMetalAllocator *allocator;
  id v18;
  void *v19;
  FigMetalContext *v20;
  FigMetalContext *v21;
  int v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    fig_log_get_emitter();
    goto LABEL_11;
  }
  v24.receiver = self;
  v24.super_class = (Class)FigMetalContext;
  self = -[FigMetalContext init](&v24, sel_init);
  if (!self)
  {
    fig_log_get_emitter();
LABEL_11:
    FigDebugAssert3();
    v23 = FigSignalErrorAt();
    v19 = 0;
    v20 = 0;
    if (v23)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v6, "fullRangeVertexBuf");
  v8 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  fullRangeVertexBuf = self->_fullRangeVertexBuf;
  self->_fullRangeVertexBuf = v8;

  objc_msgSend(v6, "fullRangeVertexDesc");
  v10 = (MTLVertexDescriptor *)objc_claimAutoreleasedReturnValue();
  fullRangeVertexDesc = self->_fullRangeVertexDesc;
  self->_fullRangeVertexDesc = v10;

  objc_msgSend(v6, "library");
  v12 = (MTLLibrary *)objc_claimAutoreleasedReturnValue();
  library = self->_library;
  self->_library = v12;

  objc_msgSend(v6, "pipelineLibrary");
  v14 = (MTLPipelineLibrarySPI *)objc_claimAutoreleasedReturnValue();
  pipelineLibrary = self->_pipelineLibrary;
  self->_pipelineLibrary = v14;

  self->_disableRunTimeCompilation = objc_msgSend(v6, "disableRunTimeCompilation");
  self->_allowCommandBufferCommitsOnlyByForceCommit = objc_msgSend(v6, "allowCommandBufferCommitsOnlyByForceCommit");
  objc_msgSend(v6, "allocator");
  v16 = (FigMetalAllocator *)objc_claimAutoreleasedReturnValue();
  allocator = self->_allocator;
  self->_allocator = v16;

  if (v7)
  {
    v18 = v7;
  }
  else
  {
    objc_msgSend(v6, "commandQueue");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  if (-[FigMetalContext commonInitWithOptionalCommandQueue:](self, "commonInitWithOptionalCommandQueue:", v18))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v20 = 0;
    goto LABEL_8;
  }
LABEL_7:
  v20 = self;
LABEL_8:
  v21 = v20;

  return v21;
}

- (MTLPipelineLibrarySPI)pipelineLibrary
{
  return self->_pipelineLibrary;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (MTLVertexDescriptor)fullRangeVertexDesc
{
  return self->_fullRangeVertexDesc;
}

- (MTLBuffer)fullRangeVertexBuf
{
  return self->_fullRangeVertexBuf;
}

- (BOOL)disableRunTimeCompilation
{
  return self->_disableRunTimeCompilation;
}

- (BOOL)allowCommandBufferCommitsOnlyByForceCommit
{
  return self->_allowCommandBufferCommitsOnlyByForceCommit;
}

- (FigMetalContext)initWithbundle:(id)a3 andOptionalCommandQueue:(id)a4
{
  id v6;
  id v7;
  FigMetalContext *v8;
  MTLDevice *device;
  MTLLibrary *v10;
  id v11;
  MTLLibrary *library;
  void *v13;
  void *v14;
  MTLDevice *v15;
  MTLPipelineLibrarySPI *v16;
  id v17;
  MTLPipelineLibrarySPI *pipelineLibrary;
  FigMetalContext *v19;
  FigMetalContext *v20;
  int v22;
  id v23;
  id v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    fig_log_get_emitter();
LABEL_10:
    FigDebugAssert3();
    v22 = FigSignalErrorAt();
    v11 = 0;
    goto LABEL_12;
  }
  v25.receiver = self;
  v25.super_class = (Class)FigMetalContext;
  v8 = -[FigMetalContext init](&v25, sel_init);
  self = v8;
  if (!v8 || -[FigMetalContext commonInitWithOptionalCommandQueue:](v8, "commonInitWithOptionalCommandQueue:", v7))
  {
    fig_log_get_emitter();
    goto LABEL_10;
  }
  device = self->_device;
  v24 = 0;
  v10 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v6, &v24);
  v11 = v24;
  library = self->_library;
  self->_library = v10;

  if (self->_library)
  {
    objc_msgSend(v6, "resourcePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v13, self->_gpuName);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_device;
    v23 = v11;
    v16 = (MTLPipelineLibrarySPI *)-[MTLDevice newPipelineLibraryWithFilePath:error:](v15, "newPipelineLibraryWithFilePath:error:", v14, &v23);
    v17 = v23;

    pipelineLibrary = self->_pipelineLibrary;
    self->_pipelineLibrary = v16;

    v11 = v17;
    goto LABEL_6;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v22 = FigSignalErrorAt();
LABEL_12:
  if (v22)
  {
    v19 = 0;
    goto LABEL_7;
  }
LABEL_6:
  v19 = self;
LABEL_7:
  v20 = v19;

  return v20;
}

- (int)commonInitWithOptionalCommandQueue:(id)a3
{
  id v5;
  MTLDevice *v6;
  MTLDevice *device;
  MTLDevice *v8;
  MTLDevice *v9;
  MTLDevice *v10;
  MTLCommandQueue *v11;
  MTLCommandQueue *commandQueue;
  MTLCommandQueue *v13;
  int v14;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_commandQueue, a3);
    -[MTLCommandQueue device](self->_commandQueue, "device");
    v6 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
    device = self->_device;
    self->_device = v6;

    if (!self->_device)
    {
LABEL_11:
      fig_log_get_emitter();
      FigDebugAssert3();
      v14 = FigSignalErrorAt();
      goto LABEL_10;
    }
  }
  else
  {
    +[FigMetalContext metalDevice](FigMetalContext, "metalDevice");
    v8 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
    v9 = self->_device;
    self->_device = v8;

    v10 = self->_device;
    if (!v10)
      goto LABEL_11;
    v11 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v10, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v11;

    v13 = self->_commandQueue;
    if (!v13)
      goto LABEL_11;
    -[MTLCommandQueue setBackgroundGPUPriority:](v13, "setBackgroundGPUPriority:", 2);
  }
  if (!self->_fullRangeVertexBuf && -[FigMetalContext initRangeVertex](self, "initRangeVertex"))
    goto LABEL_11;
  -[FigMetalContext _identifyGPU](self, "_identifyGPU");
  v14 = 0;
LABEL_10:

  return v14;
}

- (void)_identifyGPU
{
  NSString *gpuName;
  char v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  int v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  id v19;

  gpuName = self->_gpuName;
  self->_gpuName = (NSString *)&stru_1E94ED9E8;

  -[MTLDevice name](self->_device, "name");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "containsString:", CFSTR("Apple")))
  {
LABEL_14:

    return;
  }
  NSSelectorFromString(CFSTR("architecture"));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTLDevice architecture](self->_device, "architecture");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("applegpu_"), &stru_1E94ED9E8);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_gpuName;
    self->_gpuName = v6;

    objc_msgSend(v19, "revision");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsString:", CFSTR("A")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (-[NSString containsString:](self->_gpuName, "containsString:", CFSTR("g16p")))
    {
      objc_msgSend(v19, "revision");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "containsString:", CFSTR("B0"));

    }
    else
    {
      v9 = 0;
    }

    v11 = -[NSString containsString:](self->_gpuName, "containsString:", CFSTR("g11p"));
    v12 = -[NSString containsString:](self->_gpuName, "containsString:", CFSTR("g17p"));
    if (v9 && !v11 && !v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = self->_gpuName;
      objc_msgSend(v19, "revision");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@_%@"), v14, v16);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      v18 = self->_gpuName;
      self->_gpuName = v17;

    }
    goto LABEL_14;
  }
}

- (int)initRangeVertex
{
  MTLBuffer *v3;
  MTLBuffer *fullRangeVertexBuf;
  MTLVertexDescriptor *v5;
  MTLVertexDescriptor *fullRangeVertexDesc;
  MTLVertexDescriptor *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19[0] = xmmword_1D3305488;
  v19[1] = unk_1D3305498;
  v3 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v19, 32, 0);
  fullRangeVertexBuf = self->_fullRangeVertexBuf;
  self->_fullRangeVertexBuf = v3;

  if (self->_fullRangeVertexBuf
    && (v5 = (MTLVertexDescriptor *)objc_alloc_init(MEMORY[0x1E0CC6BD8]),
        fullRangeVertexDesc = self->_fullRangeVertexDesc,
        self->_fullRangeVertexDesc = v5,
        fullRangeVertexDesc,
        (v7 = self->_fullRangeVertexDesc) != 0))
  {
    -[MTLVertexDescriptor attributes](v7, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFormat:", 29);

    -[MTLVertexDescriptor attributes](self->_fullRangeVertexDesc, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBufferIndex:", 0);

    -[MTLVertexDescriptor attributes](self->_fullRangeVertexDesc, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOffset:", 0);

    -[MTLVertexDescriptor layouts](self->_fullRangeVertexDesc, "layouts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStride:", 8);

    -[MTLVertexDescriptor layouts](self->_fullRangeVertexDesc, "layouts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStepFunction:", 1);

    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (FigMetalAllocator)allocator
{
  return self->_allocator;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 textureSize:(CGSize)a6 plane:(unint64_t)a7 slice:(unint64_t)a8
{
  double height;
  double width;
  __IOSurface *IOSurface;
  __IOSurface *v16;
  size_t ElementWidth;
  size_t ElementHeight;
  size_t v19;
  size_t HeightOfPlane;
  void *v21;

  height = a6.height;
  width = a6.width;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface
    || (v16 = IOSurface, a7) && IOSurfaceGetPlaneCount(IOSurface) <= a7
    || a8 && IOSurfaceGetSliceCount() <= a8
    || (ElementWidth = IOSurfaceGetElementWidth(v16),
        ElementHeight = IOSurfaceGetElementHeight(v16),
        v19 = IOSurfaceGetWidthOfPlane(v16, a7) / ElementWidth,
        HeightOfPlane = IOSurfaceGetHeightOfPlane(v16, a7),
        width > (double)v19)
    || height > (double)(HeightOfPlane / ElementHeight)
    || (-[FigMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:slice:](self, "bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:slice:", v16, a4, a5, (unint64_t)width, (unint64_t)height, a7, a8), (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v21 = 0;
  }
  return v21;
}

- (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 plane:(unint64_t)a8 slice:(unint64_t)a9
{
  void *v16;
  void *v17;
  _DWORD *v18;
  MTLDevice *device;
  uint64_t v20;
  void *v21;

  if (!a3 || a9 && IOSurfaceGetSliceCount() <= a9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, a6, a7, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    goto LABEL_19;
  objc_msgSend(v16, "setUsage:", a5);
  if ((a5 & 2) != 0
    && (IOSurfaceGetCompressionTypeOfPlane() == 3
     || IOSurfaceGetCompressionTypeOfPlane() == 4))
  {
    objc_msgSend(v17, "setUsage:", objc_msgSend(v17, "usage") | 0x4000);
  }
  v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    IOSurfaceGetID(a3);
    kdebug_trace();
  }
  device = self->_device;
  v20 = a9
      ? -[MTLDevice newTextureWithDescriptor:iosurface:plane:slice:](device, "newTextureWithDescriptor:iosurface:plane:slice:", v17, a3, a8, a9): -[MTLDevice newTextureWithDescriptor:iosurface:plane:](device, "newTextureWithDescriptor:iosurface:plane:", v17, a3, a8);
  v21 = (void *)v20;
  if (*v18 == 1)
  {
    IOSurfaceGetID(a3);
    kdebug_trace();
  }
  if (!v21)
  {
LABEL_19:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_21:
    FigSignalErrorAt();
    v21 = 0;
  }

  return v21;
}

- (void)prewarmInternalMetalShadersForFormatsList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id obj;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "setSize:", 32),
        (v34 = (void *)-[MTLDevice newHeapWithDescriptor:](self->_device, "newHeapWithDescriptor:", v6)) != 0))
  {
    -[FigMetalContext commandBuffer](self, "commandBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLabel:", CFSTR("prewarmInternal"));
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v4;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v27)
    {
      v26 = v4;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v29 = v7;
      v30 = *(_QWORD *)v40;
      do
      {
        v11 = 0;
        v12 = v9;
        v13 = v10;
        do
        {
          v32 = v13;
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(obj);
          v31 = v11;
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
          v9 = (void *)objc_opt_new();

          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v33 = v14;
          v15 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v15)
          {
            v16 = v15;
            v17 = 0;
            v18 = *(_QWORD *)v36;
            while (2)
            {
              v19 = 0;
              v20 = v8;
              do
              {
                if (*(_QWORD *)v36 != v18)
                  objc_enumerationMutation(v33);
                objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v19), "intValue"), 1, 1, 0);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setUsage:", 7);
                objc_msgSend(v21, "setResourceOptions:", objc_msgSend(v6, "resourceOptions"));
                v8 = (void *)objc_msgSend(v34, "newTextureWithDescriptor:", v21);

                if (!v8)
                {
                  fig_log_get_emitter();
                  FigDebugAssert3();
                  FigSignalErrorAt();

                  v4 = v26;
                  v25 = v29;
                  v10 = v32;
                  goto LABEL_22;
                }
                objc_msgSend(v8, "makeAliasable");
                objc_msgSend(v9, "colorAttachments");
                v22 = v6;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectAtIndexedSubscript:", (v17 + v19));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setTexture:", v8);

                v6 = v22;
                ++v19;
                v20 = v8;
              }
              while (v16 != v19);
              v16 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              v17 += v19;
              if (v16)
                continue;
              break;
            }
          }

          v7 = v29;
          objc_msgSend(v29, "renderCommandEncoderWithDescriptor:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "endEncoding");
          v11 = v31 + 1;
          v12 = v9;
          v13 = v10;
        }
        while (v31 + 1 != v27);
        v4 = v26;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v27);
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }

    v25 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v25 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
LABEL_22:

}

- (MTLCommandBuffer)commandBuffer
{
  MTLCommandBuffer *commandBuffer;
  MTLCommandBuffer *v4;
  MTLCommandBuffer *v5;

  commandBuffer = self->_commandBuffer;
  if (!commandBuffer)
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v4 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_commandBuffer;
    self->_commandBuffer = v4;

    commandBuffer = self->_commandBuffer;
  }
  return commandBuffer;
}

- (int)setQueuePriority:(int)a3
{
  MTLCommandQueue *commandQueue;
  uint64_t v4;

  switch(a3)
  {
    case 2:
      commandQueue = self->_commandQueue;
      v4 = 4;
      goto LABEL_7;
    case 1:
      commandQueue = self->_commandQueue;
      v4 = 1;
      goto LABEL_7;
    case 0:
      commandQueue = self->_commandQueue;
      v4 = 2;
LABEL_7:
      -[MTLCommandQueue setGPUPriority:](commandQueue, "setGPUPriority:", v4);
      return 0;
  }
  return FigSignalErrorAt();
}

- (void)waitForSchedule
{
  id v3;
  _DWORD *v4;
  MTLCommandBuffer *commandBuffer;

  v3 = -[FigMetalContext commandBuffer](self, "commandBuffer");
  -[MTLCommandBuffer setLabel:](self->_commandBuffer, "setLabel:", CFSTR("waitForSchedule"));
  -[MTLCommandBuffer commit](self->_commandBuffer, "commit");
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  -[MTLCommandBuffer waitUntilScheduled](self->_commandBuffer, "waitUntilScheduled");
  if (*v4 == 1)
    kdebug_trace();
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;

}

- (void)setAllowCommandBufferCommitsOnlyByForceCommit:(BOOL)a3
{
  self->_allowCommandBufferCommitsOnlyByForceCommit = a3;
}

+ (id)metalDevice
{
  if (metalDevice_onceToken != -1)
    dispatch_once(&metalDevice_onceToken, &__block_literal_global_1);
  return (id)metalDevice_device;
}

void __30__FigMetalContext_metalDevice__block_invoke()
{
  CMMTLDevice *v0;
  void *v1;

  v0 = -[CMMTLDevice initWithLevel:]([CMMTLDevice alloc], "initWithLevel:", 1);
  v1 = (void *)metalDevice_device;
  metalDevice_device = (uint64_t)v0;

}

- (FigMetalContext)init
{
  FigMetalContext *v2;
  FigMetalContext *v3;
  uint64_t v4;
  MTLLibrary *library;
  FigMetalContext *v6;
  FigMetalContext *v7;
  int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FigMetalContext;
  v2 = -[FigMetalContext init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowCommandBufferCommitsOnlyByForceCommit = 0;
    if (!-[FigMetalContext commonInitWithOptionalCommandQueue:](v2, "commonInitWithOptionalCommandQueue:", 0))
    {
      v4 = -[MTLDevice newDefaultLibrary](v3->_device, "newDefaultLibrary");
      library = v3->_library;
      v3->_library = (MTLLibrary *)v4;

      if (v3->_library)
        goto LABEL_4;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v9 = FigSignalErrorAt();
  v6 = 0;
  if (!v9)
LABEL_4:
    v6 = v3;
  v7 = v6;

  return v7;
}

- (FigMetalContext)initWithLibraryData:(char *)a3 ofSize:(unint64_t)a4 andOptionalCommandQueue:(id)a5
{
  id v8;
  FigMetalContext *v9;
  NSObject *v10;
  dispatch_data_t v11;
  MTLDevice *device;
  MTLLibrary *v13;
  id v14;
  MTLLibrary *library;
  int v16;
  FigMetalContext *v17;
  FigMetalContext *v18;
  id v20;
  objc_super v21;

  v8 = a5;
  if (!a3)
  {
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    v16 = FigSignalErrorAt();
    v14 = 0;
    goto LABEL_8;
  }
  v21.receiver = self;
  v21.super_class = (Class)FigMetalContext;
  v9 = -[FigMetalContext init](&v21, sel_init);
  self = v9;
  if (!v9 || -[FigMetalContext commonInitWithOptionalCommandQueue:](v9, "commonInitWithOptionalCommandQueue:", v8))
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  dispatch_get_global_queue(17, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_data_create(a3, a4, v10, &__block_literal_global_45);
  device = self->_device;
  v20 = 0;
  v13 = (MTLLibrary *)-[MTLDevice newLibraryWithData:error:](device, "newLibraryWithData:error:", v11, &v20);
  v14 = v20;
  library = self->_library;
  self->_library = v13;

  if (self->_library)
    v16 = 0;
  else
    v16 = -12786;

LABEL_8:
  if (v16)
    v17 = 0;
  else
    v17 = self;
  v18 = v17;

  return v18;
}

- (FigMetalContext)initWithoutLibraryUsingOptionalCommandQueue:(id)a3
{
  id v4;
  FigMetalContext *v5;
  FigMetalContext *v6;
  FigMetalContext *v7;
  FigMetalContext *v8;
  int v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FigMetalContext;
  v5 = -[FigMetalContext init](&v11, sel_init);
  v6 = v5;
  if (v5 && !-[FigMetalContext commonInitWithOptionalCommandQueue:](v5, "commonInitWithOptionalCommandQueue:", v4)
    || (fig_log_get_emitter(), FigDebugAssert3(), v10 = FigSignalErrorAt(), v7 = 0, !v10))
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (FigMetalExecutionStatus)executionStatus
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MTLDevice executionStatus](self->_device, "executionStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FigMetalExecutionStatus *)v3;
}

- (void)setExecutionStatus:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MTLDevice setExecutionStatus:](self->_device, "setExecutionStatus:", v4);

}

- (void)commit
{
  if (!self->_allowCommandBufferCommitsOnlyByForceCommit)
    -[FigMetalContext forceCommit](self, "forceCommit");
}

- (void)forceCommit
{
  MTLCommandBuffer *commandBuffer;
  MTLCommandBuffer *v4;

  commandBuffer = self->_commandBuffer;
  if (commandBuffer)
  {
    -[MTLCommandBuffer commit](commandBuffer, "commit");
    v4 = self->_commandBuffer;
    self->_commandBuffer = 0;

  }
}

- (void)commitAndWait
{
  _DWORD *v3;
  MTLCommandBuffer *commandBuffer;

  -[MTLCommandBuffer commit](self->_commandBuffer, "commit");
  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  -[MTLCommandBuffer waitUntilCompleted](self->_commandBuffer, "waitUntilCompleted");
  if (*v3 == 1)
    kdebug_trace();
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;

}

- (void)waitForIdle
{
  id v3;

  v3 = -[FigMetalContext commandBuffer](self, "commandBuffer");
  -[MTLCommandBuffer setLabel:](self->_commandBuffer, "setLabel:", CFSTR("waitForIdle"));
  -[FigMetalContext commitAndWait](self, "commitAndWait");
}

- (void)insertDebugCaptureBoundary
{
  -[MTLCommandQueue insertDebugCaptureBoundary](self->_commandQueue, "insertDebugCaptureBoundary");
}

- (BOOL)WriteMetalTextureToFile:(const char *)a3 texture:(id)a4
{
  return -[FigMetalContext WriteMetalTextureToFile:texture:mipmapLevel:](self, "WriteMetalTextureToFile:texture:mipmapLevel:", a3, a4, 0);
}

- (BOOL)WriteMetalTextureToFile:(const char *)a3 texture:(id)a4 mipmapLevel:(int)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  FILE *v13;
  FILE *v14;
  BOOL v15;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v7 = a4;
  v8 = v7;
  if (!a3 || !v7 || a5 < 0 || (int)objc_msgSend(v7, "mipmapLevelCount") <= a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
    goto LABEL_8;
  }
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  objc_msgSend(v8, "pixelFormat");
  MTLPixelFormatGetInfoForDevice();
  v9 = a5;
  v10 = (unint64_t)objc_msgSend(v8, "width") >> a5;
  v11 = (unint64_t)objc_msgSend(v8, "height") >> a5;
  v12 = malloc_type_malloc(0, 0x3C575FF0uLL);
  memset(v17, 0, 24);
  v17[3] = v10;
  v17[4] = v11;
  v17[5] = 1;
  objc_msgSend(v8, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v12, 0, v17, v9);
  v13 = fopen(a3, "wb");
  if (!v13)
  {
LABEL_8:
    free(v12);
    v15 = 0;
    goto LABEL_9;
  }
  v14 = v13;
  v15 = fwrite(v12, 0, v11 * v10, v13) == v11 * v10;
  free(v12);
  fclose(v14);
LABEL_9:

  return v15;
}

- (BOOL)ReadMetalTextureFromFile:(const char *)a3 texture:(id)a4
{
  return -[FigMetalContext ReadMetalTextureFromFile:texture:mipmapLevel:](self, "ReadMetalTextureFromFile:texture:mipmapLevel:", a3, a4, 0);
}

- (BOOL)ReadMetalTextureFromFile:(const char *)a3 texture:(id)a4 mipmapLevel:(int)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  FILE *v12;
  FILE *v13;
  size_t v14;
  BOOL v15;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v7 = a4;
  v8 = v7;
  if (!a3 || !v7 || a5 < 0 || (int)objc_msgSend(v7, "mipmapLevelCount") <= a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v11 = 0;
    goto LABEL_10;
  }
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  objc_msgSend(v8, "pixelFormat");
  MTLPixelFormatGetInfoForDevice();
  v9 = (unint64_t)objc_msgSend(v8, "width") >> a5;
  v10 = (unint64_t)objc_msgSend(v8, "height") >> a5;
  v11 = malloc_type_malloc(0, 0xE29B02B3uLL);
  v12 = fopen(a3, "rb");
  if (!v12)
  {
LABEL_10:
    free(v11);
    v15 = 0;
    goto LABEL_11;
  }
  v13 = v12;
  v14 = fread(v11, 0, v10 * v9, v12);
  v15 = v14 == v10 * v9;
  if (v14 == v10 * v9)
  {
    memset(v17, 0, 24);
    v17[3] = v9;
    v17[4] = v10;
    v17[5] = 1;
    objc_msgSend(v8, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v17, a5, v11, 0);
  }
  free(v11);
  fclose(v13);
LABEL_11:

  return v15;
}

- (id)CreateMetalTextureFromFile:(const char *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7
{
  off_t st_size;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  FILE *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  stat v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  MTLPixelFormatGetInfoForDevice();
  memset(&v24, 0, sizeof(v24));
  if (!stat(a3, &v24))
  {
    st_size = v24.st_size;
    if (!a6 || !a7)
    {
      v14 = v24.st_size / 0uLL;
      v15 = (unint64_t)sqrtf((float)(v24.st_size / 0uLL) * 1.3333);
      v16 = v15 / 0xA + 1;
      v17 = v15;
      while (v14 % v15)
      {
        if (!(v14 % v17))
        {
          LODWORD(v15) = v17;
          break;
        }
        --v17;
        ++v15;
        if (!--v16)
          return 0;
      }
      if (!(_DWORD)v15)
        return 0;
      a6 = (int)v15;
      a7 = v14 / (int)v15;
    }
    if (!v24.st_size)
    {
      v18 = malloc_type_malloc(0, 0xA59FA3F6uLL);
      v19 = fopen(a3, "rb");
      fread(v18, st_size, 1uLL, v19);
      fclose(v19);
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, a6, a7, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUsage:", a5);
      v21 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v20);
      memset(v23, 0, 24);
      v23[3] = a6;
      v23[4] = a7;
      v23[5] = 1;
      objc_msgSend(v21, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v23, 0, v18, 0);
      free(v18);

      return v21;
    }
  }
  return 0;
}

- (unint64_t)getPixelSizeInBytes:(unint64_t)a3
{
  MTLPixelFormatGetInfoForDevice();
  return 0;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 plane:(unint64_t)a6 alignmentFactor:(unint64_t)a7
{
  return -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:widthAlignmentFactor:heightAlignmentFactor:](self, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:widthAlignmentFactor:heightAlignmentFactor:", a3, a4, a5, a6, a7, a7);
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 plane:(unint64_t)a6 slice:(unint64_t)a7 alignmentFactor:(unint64_t)a8
{
  return -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:slice:widthAlignmentFactor:heightAlignmentFactor:](self, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:slice:widthAlignmentFactor:heightAlignmentFactor:", a3, a4, a5, a6, a7, a8);
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 plane:(unint64_t)a6 slice:(unint64_t)a7 widthAlignmentFactor:(unint64_t)a8 heightAlignmentFactor:(unint64_t)a9
{
  void *v16;
  signed int PixelFormatType;
  int v18;
  unint64_t v19;
  IOSurfaceRef IOSurface;
  __IOSurface *v21;
  FigMetalContext *v22;
  size_t ElementWidth;
  size_t ElementHeight;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  size_t BytesPerRowOfPlane;
  void *v29;
  unint64_t v30;
  _DWORD *v31;
  MTLDevice *device;
  uint64_t v33;
  unint64_t v35;
  size_t extraRowsOnBottom;

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setUsage:", a5);
  objc_msgSend(v16, "setPixelFormat:", a4);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType > 796423727)
  {
    if (PixelFormatType <= 1882468911)
    {
      if (PixelFormatType > 1380411456)
      {
        if (PixelFormatType > 1751527983)
        {
          if (PixelFormatType == 1751527984)
            goto LABEL_55;
          v18 = 1815491698;
        }
        else
        {
          if (PixelFormatType == 1380411457)
            goto LABEL_55;
          v18 = 1651926376;
        }
      }
      else if (PixelFormatType > 875704437)
      {
        if (PixelFormatType == 875704438)
          goto LABEL_55;
        v18 = 1278226488;
      }
      else
      {
        if (PixelFormatType == 796423728)
          goto LABEL_55;
        v18 = 875704422;
      }
    }
    else if (PixelFormatType <= 2084070959)
    {
      if (PixelFormatType > 2016686639)
      {
        if (PixelFormatType == 2016686640)
          goto LABEL_55;
        v18 = 2019963440;
      }
      else
      {
        if (PixelFormatType == 1882468912)
          goto LABEL_55;
        v18 = 1885745712;
      }
    }
    else if (PixelFormatType <= 2087216687)
    {
      if (PixelFormatType == 2084070960)
        goto LABEL_55;
      v18 = 2084075056;
    }
    else
    {
      if (PixelFormatType == 2087216688 || PixelFormatType == 2088269360)
        goto LABEL_55;
      v18 = 2088265264;
    }
    goto LABEL_54;
  }
  if (PixelFormatType <= 758670895)
  {
    if (PixelFormatType > 645424687)
    {
      if (PixelFormatType > 706956391)
      {
        if (PixelFormatType != 706956392 && PixelFormatType != 707153000
          || !CVPixelBufferGetIOSurface(a3)
          || a7 && IOSurfaceGetSliceCount() <= a7)
        {
          goto LABEL_78;
        }
        goto LABEL_56;
      }
      if (PixelFormatType == 645424688)
        goto LABEL_55;
      v18 = 645428784;
    }
    else if (PixelFormatType > 642527287)
    {
      if (PixelFormatType == 642527288)
        goto LABEL_55;
      v18 = 644376112;
    }
    else
    {
      if (PixelFormatType == 641230384)
        goto LABEL_55;
      v18 = 641234480;
    }
LABEL_54:
    if (PixelFormatType != v18)
    {
LABEL_78:
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      goto LABEL_67;
    }
    goto LABEL_55;
  }
  if (PixelFormatType <= 762869295)
  {
    if (PixelFormatType > 761816623)
    {
      if (PixelFormatType == 761816624)
        goto LABEL_55;
      v18 = 762865200;
    }
    else
    {
      if (PixelFormatType == 758670896)
        goto LABEL_55;
      v18 = 758674992;
    }
    goto LABEL_54;
  }
  if (PixelFormatType <= 792229423)
  {
    if (PixelFormatType == 762869296)
      goto LABEL_55;
    v18 = 792225328;
    goto LABEL_54;
  }
  if (PixelFormatType != 792229424 && PixelFormatType != 795371056)
  {
    v18 = 796419632;
    goto LABEL_54;
  }
LABEL_55:
  if (a7)
    goto LABEL_78;
LABEL_56:
  v19 = a8;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
    goto LABEL_78;
  v21 = IOSurface;
  if ((a5 & 2) != 0
    && (IOSurfaceGetCompressionTypeOfPlane() == 3
     || IOSurfaceGetCompressionTypeOfPlane() == 4))
  {
    objc_msgSend(v16, "setUsage:", objc_msgSend(v16, "usage") | 0x4000);
  }
  if (CVPixelBufferIsPlanar(a3))
  {
    if (IOSurfaceGetPlaneCount(v21) <= a6)
      goto LABEL_78;
  }
  else if (a6)
  {
    goto LABEL_78;
  }
  v35 = a7;
  v22 = self;
  ElementWidth = IOSurfaceGetElementWidth(v21);
  ElementHeight = IOSurfaceGetElementHeight(v21);
  v25 = IOSurfaceGetWidthOfPlane(v21, a6) / ElementWidth;
  v26 = IOSurfaceGetHeightOfPlane(v21, a6) / ElementHeight;
  objc_msgSend(v16, "setWidth:", (v19 + v25 - 1) & -(uint64_t)v19);
  objc_msgSend(v16, "setHeight:", (a9 + v26 - 1) & -(uint64_t)a9);
  extraRowsOnBottom = 0;
  CVPixelBufferGetExtendedPixels(a3, 0, 0, 0, &extraRowsOnBottom);
  extraRowsOnBottom /= a6 + 1;
  v27 = objc_msgSend(v16, "width");
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, a6);
  v29 = 0;
  if (v27 <= BytesPerRowOfPlane)
  {
    v30 = objc_msgSend(v16, "height");
    if (v30 > extraRowsOnBottom + v26)
    {
LABEL_67:
      v29 = 0;
      goto LABEL_77;
    }
    v31 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      IOSurfaceGetID(v21);
      kdebug_trace();
    }
    device = v22->_device;
    if (v35)
      v33 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:slice:](device, "newTextureWithDescriptor:iosurface:plane:slice:", v16, v21, a6);
    else
      v33 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:](device, "newTextureWithDescriptor:iosurface:plane:", v16, v21, a6);
    v29 = (void *)v33;
    if (*v31 == 1)
    {
      IOSurfaceGetID(v21);
      objc_msgSend(v16, "width");
      objc_msgSend(v16, "height");
      kdebug_trace();
    }
    if (!v29)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }
LABEL_77:

  return v29;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 plane:(unint64_t)a6 widthAlignmentFactor:(unint64_t)a7 heightAlignmentFactor:(unint64_t)a8
{
  return -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:slice:widthAlignmentFactor:heightAlignmentFactor:](self, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:slice:widthAlignmentFactor:heightAlignmentFactor:", a3, a4, a5, a6, 0, a7, a8);
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 plane:(unint64_t)a6 slice:(unint64_t)a7
{
  __IOSurface *IOSurface;
  __IOSurface *v13;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t ElementWidth;
  void *v17;

  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    v13 = IOSurface;
    WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a6);
    HeightOfPlane = IOSurfaceGetHeightOfPlane(v13, a6);
    ElementWidth = IOSurfaceGetElementWidth(v13);
    -[FigMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:slice:](self, "bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:slice:", v13, a4, a5, WidthOfPlane / ElementWidth, HeightOfPlane / IOSurfaceGetElementHeight(v13), a6, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v17 = 0;
  }
  return v17;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 plane:(unint64_t)a6
{
  return -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:slice:](self, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:slice:", a3, a4, a5, a6, 0);
}

- (id)bindPixelBufferToMTLBuffer:(__CVBuffer *)a3
{
  IOSurfaceRef IOSurface;
  void *v5;

  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    v5 = (void *)-[MTLDevice newBufferWithIOSurface:](self->_device, "newBufferWithIOSurface:", IOSurface);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v5 = 0;
  }
  return v5;
}

- (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 plane:(unint64_t)a8
{
  return -[FigMetalContext bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:slice:](self, "bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:slice:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)rebindTex:(id)a3 format:(unint64_t)a4 usage:(unint64_t)a5 plane:(int)a6 slice:(int)a7 xFactor:(int)a8
{
  id v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __IOSurface *v24;
  _DWORD *v25;
  MTLDevice *device;
  uint64_t v27;
  void *v28;
  id v29;
  int v31;

  v14 = a3;
  v15 = objc_msgSend(v14, "width");
  v16 = objc_msgSend(v14, "pixelFormat");
  if (a8 == 3 && (v16 & 0xFFFFFFFFFFFFFFFELL) == 0x24C)
    v15 = 3 * ((v15 + 2) / 3);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, v15 / a8, objc_msgSend(v14, "height"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    goto LABEL_25;
  objc_msgSend(v17, "setUsage:", a5);
  objc_msgSend(v14, "buffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v23 = objc_msgSend(v14, "iosurface");
    if (v23)
    {
      v24 = (__IOSurface *)v23;
      if (!a7 || IOSurfaceGetSliceCount() > (unint64_t)a7)
      {
        v25 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        if (*MEMORY[0x1E0CA1FC0] == 1)
        {
          IOSurfaceGetID(v24);
          kdebug_trace();
        }
        device = self->_device;
        if (a7)
          v27 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:slice:](device, "newTextureWithDescriptor:iosurface:plane:slice:", v18, v24, a6, a7);
        else
          v27 = -[MTLDevice newTextureWithDescriptor:iosurface:plane:](device, "newTextureWithDescriptor:iosurface:plane:", v18, v24, a6);
        v22 = (void *)v27;
        if (*v25 == 1)
        {
          IOSurfaceGetID(v24);
          objc_msgSend(v18, "width");
          objc_msgSend(v18, "height");
          kdebug_trace();
        }
        if (v22 && objc_msgSend(v22, "iosurfacePlane") == a6)
          goto LABEL_20;
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_26:
        v31 = FigSignalErrorAt();
        v28 = 0;
        if (v31)
          goto LABEL_21;
        goto LABEL_20;
      }
    }
LABEL_25:
    fig_log_get_emitter();
    FigDebugAssert3();
    v22 = 0;
    goto LABEL_26;
  }
  if (a7 | a6)
    goto LABEL_25;
  objc_msgSend(v14, "buffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setResourceOptions:", objc_msgSend(v20, "resourceOptions"));

  objc_msgSend(v14, "buffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", v18, objc_msgSend(v14, "bufferOffset"), objc_msgSend(v14, "bufferBytesPerRow"), objc_msgSend(v18, "height") * objc_msgSend(v14, "bufferBytesPerRow"));

LABEL_20:
  v28 = v22;
LABEL_21:
  v29 = v28;

  return v29;
}

- (id)rebindTex:(id)a3 format:(unint64_t)a4 usage:(unint64_t)a5 plane:(int)a6 xFactor:(int)a7
{
  return -[FigMetalContext rebindTex:format:usage:plane:slice:xFactor:](self, "rebindTex:format:usage:plane:slice:xFactor:", a3, a4, a5, *(_QWORD *)&a6, 0, *(_QWORD *)&a7);
}

- (id)create2DTextureFromBuffer:(id)a3 offset:(unint64_t)a4 width:(int)a5 height:(int)a6 format:(unint64_t)a7 usage:(unint64_t)a8
{
  uint64_t v10;
  uint64_t v11;
  id v14;
  void *v15;

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v14 = a3;
  MTLPixelFormatGetInfoForDevice();
  -[FigMetalContext create2DTextureFromBuffer:offset:stride:width:height:format:usage:](self, "create2DTextureFromBuffer:offset:stride:width:height:format:usage:", v14, a4, 0, v11, v10, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)create2DTextureFromBuffer:(id)a3 offset:(unint64_t)a4 stride:(unint64_t)a5 width:(int)a6 height:(int)a7 format:(unint64_t)a8 usage:(unint64_t)a9
{
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v14 = a3;
  v15 = v14;
  if ((((_DWORD)a5 + 63) & 0xFFFFFFC0) == a5 && a4 + a7 * a5 <= objc_msgSend(v14, "length"))
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setWidth:", a6);
    objc_msgSend(v16, "setHeight:", a7);
    objc_msgSend(v16, "setPixelFormat:", a8);
    objc_msgSend(v16, "setResourceOptions:", objc_msgSend(v15, "resourceOptions"));
    objc_msgSend(v16, "setUsage:", a9);
    v17 = (void *)objc_msgSend(v15, "newTextureWithDescriptor:offset:bytesPerRow:", v16, a4, a5);

  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v17 = 0;
  }

  return v17;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void)setCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_commandQueue, a3);
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (void)setCommandBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_commandBuffer, a3);
}

- (void)setPipelineLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_pipelineLibrary, a3);
}

- (void)setFullRangeVertexBuf:(id)a3
{
  objc_storeStrong((id *)&self->_fullRangeVertexBuf, a3);
}

- (void)setFullRangeVertexDesc:(id)a3
{
  objc_storeStrong((id *)&self->_fullRangeVertexDesc, a3);
}

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  self->_disableRunTimeCompilation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullRangeVertexDesc, 0);
  objc_storeStrong((id *)&self->_fullRangeVertexBuf, 0);
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_gpuName, 0);
}

@end
