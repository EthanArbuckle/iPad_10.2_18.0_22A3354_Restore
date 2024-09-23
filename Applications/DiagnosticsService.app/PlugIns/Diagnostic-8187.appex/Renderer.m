@implementation Renderer

- (Renderer)initWithSize:(CGSize)a3
{
  double height;
  double width;
  Renderer *v5;
  MTLDevice *v6;
  MTLDevice *device;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *sem;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)Renderer;
  v5 = -[Renderer init](&v11, "init");
  if (v5)
  {
    v6 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v5->_device;
    v5->_device = v6;

    v5->_size.width = width;
    v5->_size.height = height;
    v8 = dispatch_semaphore_create(3);
    sem = v5->_sem;
    v5->_sem = (OS_dispatch_semaphore *)v8;

    -[Renderer loadMetal](v5, "loadMetal");
    -[Renderer createPipelines](v5, "createPipelines");
    -[Renderer createScene](v5, "createScene");
    -[Renderer createBuffers](v5, "createBuffers");
    -[Renderer createIntersector](v5, "createIntersector");
    -[Renderer changeRenderSize:](v5, "changeRenderSize:", width, height);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MTLBuffer setPurgeableState:](self->_vertexPositionBuffer, "setPurgeableState:", 4);
  -[MTLBuffer setPurgeableState:](self->_vertexNormalBuffer, "setPurgeableState:", 4);
  -[MTLBuffer setPurgeableState:](self->_vertexColorBuffer, "setPurgeableState:", 4);
  -[MTLBuffer setPurgeableState:](self->_rayBuffer, "setPurgeableState:", 4);
  -[MTLBuffer setPurgeableState:](self->_shadowRayBuffer, "setPurgeableState:", 4);
  -[MTLBuffer setPurgeableState:](self->_intersectionBuffer, "setPurgeableState:", 4);
  -[MTLBuffer setPurgeableState:](self->_uniformBuffer, "setPurgeableState:", 4);
  -[MTLBuffer setPurgeableState:](self->_randomBuffer, "setPurgeableState:", 4);
  -[MTLBuffer setPurgeableState:](self->_triangleMaskBuffer, "setPurgeableState:", 4);
  -[MTLTexture setPurgeableState:](self->_renderTarget, "setPurgeableState:", 4);
  -[MTLTexture setPurgeableState:](self->_accumulationTarget, "setPurgeableState:", 4);
  v3.receiver = self;
  v3.super_class = (Class)Renderer;
  -[Renderer dealloc](&v3, "dealloc");
}

- (void)loadMetal
{
  MTLLibrary *v3;
  MTLLibrary *library;
  MTLCommandQueue *v5;
  MTLCommandQueue *queue;

  v3 = (MTLLibrary *)-[MTLDevice newDefaultLibrary](self->_device, "newDefaultLibrary");
  library = self->_library;
  self->_library = v3;

  v5 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
  queue = self->_queue;
  self->_queue = v5;

}

- (void)createPipelines
{
  id v3;
  id v4;
  MTLDevice *device;
  MTLComputePipelineState *v6;
  id v7;
  MTLComputePipelineState *rayPipeline;
  id v9;
  MTLDevice *v10;
  MTLComputePipelineState *v11;
  id v12;
  MTLComputePipelineState *shadePipeline;
  id v14;
  MTLDevice *v15;
  MTLComputePipelineState *v16;
  id v17;
  MTLComputePipelineState *shadowPipeline;
  id v19;
  MTLDevice *v20;
  MTLComputePipelineState *v21;
  id v22;
  MTLComputePipelineState *accumulatePipeline;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  MTLDevice *v29;
  MTLRenderPipelineState *v30;
  id v31;
  MTLRenderPipelineState *copyPipeline;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v3 = objc_alloc_init((Class)MTLComputePipelineDescriptor);
  objc_msgSend(v3, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 1);
  v4 = -[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("rayKernel"));
  objc_msgSend(v3, "setComputeFunction:", v4);

  device = self->_device;
  v37 = 0;
  v6 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](device, "newComputePipelineStateWithDescriptor:options:reflection:error:", v3, 0, 0, &v37);
  v7 = v37;
  rayPipeline = self->_rayPipeline;
  self->_rayPipeline = v6;

  v9 = -[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("shadeKernel"));
  objc_msgSend(v3, "setComputeFunction:", v9);

  v10 = self->_device;
  v36 = v7;
  v11 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v10, "newComputePipelineStateWithDescriptor:options:reflection:error:", v3, 0, 0, &v36);
  v12 = v36;

  shadePipeline = self->_shadePipeline;
  self->_shadePipeline = v11;

  v14 = -[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("shadowKernel"));
  objc_msgSend(v3, "setComputeFunction:", v14);

  v15 = self->_device;
  v35 = v12;
  v16 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v15, "newComputePipelineStateWithDescriptor:options:reflection:error:", v3, 0, 0, &v35);
  v17 = v35;

  shadowPipeline = self->_shadowPipeline;
  self->_shadowPipeline = v16;

  v19 = -[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("accumulateKernel"));
  objc_msgSend(v3, "setComputeFunction:", v19);

  v20 = self->_device;
  v34 = v17;
  v21 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v20, "newComputePipelineStateWithDescriptor:options:reflection:error:", v3, 0, 0, &v34);
  v22 = v34;

  accumulatePipeline = self->_accumulatePipeline;
  self->_accumulatePipeline = v21;

  v24 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  objc_msgSend(v24, "setRasterSampleCount:", 1);
  v25 = -[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("copyVertex"));
  objc_msgSend(v24, "setVertexFunction:", v25);

  v26 = -[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("copyFragment"));
  objc_msgSend(v24, "setFragmentFunction:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorAttachments"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v28, "setPixelFormat:", 115);

  v29 = self->_device;
  v33 = v22;
  v30 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v29, "newRenderPipelineStateWithDescriptor:error:", v24, &v33);
  v31 = v33;

  copyPipeline = self->_copyPipeline;
  self->_copyPipeline = v30;

}

- (void)createScene
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;

  *(double *)v2.i64 = matrix4x4_translation(0.0, 1.0, 0.0);
  v75 = v2;
  v79 = v3;
  v61 = v5;
  v68 = v4;
  matrix4x4_scale(0.5, 1.98, 0.5);
  v6 = 0;
  v81 = v7;
  v82 = v8;
  v83 = v9;
  v84 = v10;
  do
  {
    *(float32x4_t *)((char *)&v85 + v6) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v75, COERCE_FLOAT(*(__int128 *)((char *)&v81 + v6))), v79, *(float32x2_t *)((char *)&v81 + v6), 1), v68, *(float32x4_t *)((char *)&v81 + v6), 2), v61, *(float32x4_t *)((char *)&v81 + v6), 3);
    v6 += 16;
  }
  while (v6 != 64);
  __asm { FMOV            V0.4S, #1.0 }
  createCube(8, 1, 2, _Q0, v85, v86, v87, v88);
  *(double *)v16.i64 = matrix4x4_translation(0.0, 1.0, 0.0);
  v76 = v16;
  v80 = v17;
  v62 = v19;
  v69 = v18;
  matrix4x4_scale(2.0, 2.0, 2.0);
  v20 = 0;
  v81 = v21;
  v82 = v22;
  v83 = v23;
  v84 = v24;
  do
  {
    *(float32x4_t *)((char *)&v85 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v76, COERCE_FLOAT(*(__int128 *)((char *)&v81 + v20))), v80, *(float32x2_t *)((char *)&v81 + v20), 1), v69, *(float32x4_t *)((char *)&v81 + v20), 2), v62, *(float32x4_t *)((char *)&v81 + v20), 3);
    v20 += 16;
  }
  while (v20 != 64);
  v70 = v87;
  v77 = v88;
  v56 = v85;
  v63 = v86;
  createCube(28, 1, 1, (__n128)xmmword_10000C040, v85, v86, v87, v88);
  createCube(1, 1, 1, (__n128)xmmword_10000C050, v56, v63, v70, v77);
  createCube(2, 1, 1, (__n128)xmmword_10000C060, v56, v63, v70, v77);
  *(double *)v25.i64 = matrix4x4_translation(0.3275, 0.3, 0.3725);
  v64 = v25;
  v71 = v26;
  v53 = v28;
  v57 = v27;
  *(double *)&v29 = matrix4x4_rotation(-0.3, (float32x4_t)xmmword_10000C070);
  v30 = 0;
  v81 = v29;
  v82 = v31;
  v83 = v32;
  v84 = v33;
  do
  {
    *(float32x4_t *)((char *)&v85 + v30) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(__int128 *)((char *)&v81 + v30))), v71, *(float32x2_t *)((char *)&v81 + v30), 1), v57, *(float32x4_t *)((char *)&v81 + v30), 2), v53, *(float32x4_t *)((char *)&v81 + v30), 3);
    v30 += 16;
  }
  while (v30 != 64);
  v65 = v85;
  v72 = v86;
  v54 = v88;
  v58 = v87;
  matrix4x4_scale(0.6, 0.6, 0.6);
  v34 = 0;
  v81 = v35;
  v82 = v36;
  v83 = v37;
  v84 = v38;
  do
  {
    *(float32x4_t *)((char *)&v85 + v34) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v65, COERCE_FLOAT(*(__int128 *)((char *)&v81 + v34))), v72, *(float32x2_t *)((char *)&v81 + v34), 1), v58, *(float32x4_t *)((char *)&v81 + v34), 2), v54, *(float32x4_t *)((char *)&v81 + v34), 3);
    v34 += 16;
  }
  while (v34 != 64);
  createCube(63, 0, 1, (__n128)xmmword_10000C040, v85, v86, v87, v88);
  *(double *)v39.i64 = matrix4x4_translation(-0.335, 0.6, -0.29);
  v66 = v39;
  v73 = v40;
  v55 = v42;
  v59 = v41;
  *(double *)&v43 = matrix4x4_rotation(0.3, (float32x4_t)xmmword_10000C070);
  v44 = 0;
  v81 = v43;
  v82 = v45;
  v83 = v46;
  v84 = v47;
  do
  {
    *(float32x4_t *)((char *)&v85 + v44) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v66, COERCE_FLOAT(*(__int128 *)((char *)&v81 + v44))), v73, *(float32x2_t *)((char *)&v81 + v44), 1), v59, *(float32x4_t *)((char *)&v81 + v44), 2), v55, *(float32x4_t *)((char *)&v81 + v44), 3);
    v44 += 16;
  }
  while (v44 != 64);
  v74 = v85;
  v78 = v86;
  v60 = v88;
  v67 = v87;
  matrix4x4_scale(0.6, 1.2, 0.6);
  v48 = 0;
  v81 = v49;
  v82 = v50;
  v83 = v51;
  v84 = v52;
  do
  {
    *(float32x4_t *)((char *)&v85 + v48) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v74, COERCE_FLOAT(*(__int128 *)((char *)&v81 + v48))), v78, *(float32x2_t *)((char *)&v81 + v48), 1), v67, *(float32x4_t *)((char *)&v81 + v48), 2), v60, *(float32x4_t *)((char *)&v81 + v48), 3);
    v48 += 16;
  }
  while (v48 != 64);
  createCube(63, 0, 1, (__n128)xmmword_10000C040, v85, v86, v87, v88);
}

- (void)createBuffers
{
  MTLBuffer *v3;
  MTLBuffer *uniformBuffer;
  MTLBuffer *v5;
  MTLBuffer *randomBuffer;
  MTLBuffer *v7;
  MTLBuffer *vertexPositionBuffer;
  MTLBuffer *v9;
  MTLBuffer *vertexColorBuffer;
  MTLBuffer *v11;
  MTLBuffer *vertexNormalBuffer;
  MTLBuffer *v13;
  MTLBuffer *triangleMaskBuffer;
  id v15;
  id v16;
  id v17;
  id v18;

  v3 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 768, 0);
  uniformBuffer = self->_uniformBuffer;
  self->_uniformBuffer = v3;

  v5 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 6144, 0);
  randomBuffer = self->_randomBuffer;
  self->_randomBuffer = v5;

  v7 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", qword_100016748 - vertices, 0);
  vertexPositionBuffer = self->_vertexPositionBuffer;
  self->_vertexPositionBuffer = v7;

  v9 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", qword_100016778 - colors, 0);
  vertexColorBuffer = self->_vertexColorBuffer;
  self->_vertexColorBuffer = v9;

  v11 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", qword_100016760 - normals, 0);
  vertexNormalBuffer = self->_vertexNormalBuffer;
  self->_vertexNormalBuffer = v11;

  v13 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", qword_100016790 - masks, 0);
  triangleMaskBuffer = self->_triangleMaskBuffer;
  self->_triangleMaskBuffer = v13;

  v15 = -[MTLBuffer contents](self->_vertexPositionBuffer, "contents");
  memcpy(v15, (const void *)vertices, (size_t)-[MTLBuffer length](self->_vertexPositionBuffer, "length"));
  v16 = -[MTLBuffer contents](self->_vertexColorBuffer, "contents");
  memcpy(v16, (const void *)colors, (size_t)-[MTLBuffer length](self->_vertexColorBuffer, "length"));
  v17 = -[MTLBuffer contents](self->_vertexNormalBuffer, "contents");
  memcpy(v17, (const void *)normals, (size_t)-[MTLBuffer length](self->_vertexNormalBuffer, "length"));
  v18 = -[MTLBuffer contents](self->_triangleMaskBuffer, "contents");
  memcpy(v18, (const void *)masks, (size_t)-[MTLBuffer length](self->_triangleMaskBuffer, "length"));
}

- (void)createIntersector
{
  MPSRayIntersector *v3;
  MPSRayIntersector *intersector;
  MPSTriangleAccelerationStructure *v5;
  MPSTriangleAccelerationStructure *accelerationStructure;

  v3 = (MPSRayIntersector *)objc_msgSend(objc_alloc((Class)MPSRayIntersector), "initWithDevice:", self->_device);
  intersector = self->_intersector;
  self->_intersector = v3;

  -[MPSRayIntersector setRayDataType:](self->_intersector, "setRayDataType:", 2);
  -[MPSRayIntersector setRayStride:](self->_intersector, "setRayStride:", 48);
  -[MPSRayIntersector setRayMaskOptions:](self->_intersector, "setRayMaskOptions:", 1);
  v5 = (MPSTriangleAccelerationStructure *)objc_msgSend(objc_alloc((Class)MPSTriangleAccelerationStructure), "initWithDevice:", self->_device);
  accelerationStructure = self->_accelerationStructure;
  self->_accelerationStructure = v5;

  -[MPSTriangleAccelerationStructure setVertexBuffer:](self->_accelerationStructure, "setVertexBuffer:", self->_vertexPositionBuffer);
  -[MPSTriangleAccelerationStructure setMaskBuffer:](self->_accelerationStructure, "setMaskBuffer:", self->_triangleMaskBuffer);
  -[MPSTriangleAccelerationStructure setTriangleCount:](self->_accelerationStructure, "setTriangleCount:", ((qword_100016748 - vertices) >> 4) / 3uLL);
  -[MPSTriangleAccelerationStructure rebuild](self->_accelerationStructure, "rebuild");
}

- (void)changeRenderSize:(CGSize)a3
{
  unint64_t width;
  unint64_t height;
  unint64_t v6;
  MTLBuffer *v7;
  MTLBuffer *rayBuffer;
  MTLBuffer *v9;
  MTLBuffer *shadowRayBuffer;
  MTLBuffer *v11;
  MTLBuffer *intersectionBuffer;
  MTLTexture *v13;
  MTLTexture *renderTarget;
  MTLTexture *v15;
  MTLTexture *accumulationTarget;
  id v17;

  self->_size = a3;
  width = (unint64_t)a3.width;
  height = (unint64_t)a3.height;
  v6 = (unint64_t)a3.width * (unint64_t)a3.height;
  v7 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 48 * v6, 32);
  rayBuffer = self->_rayBuffer;
  self->_rayBuffer = v7;

  v9 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 48 * v6, 32);
  shadowRayBuffer = self->_shadowRayBuffer;
  self->_shadowRayBuffer = v9;

  v11 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 16 * v6, 32);
  intersectionBuffer = self->_intersectionBuffer;
  self->_intersectionBuffer = v11;

  v17 = objc_alloc_init((Class)MTLTextureDescriptor);
  objc_msgSend(v17, "setPixelFormat:", 125);
  objc_msgSend(v17, "setTextureType:", 2);
  objc_msgSend(v17, "setWidth:", width);
  objc_msgSend(v17, "setHeight:", height);
  objc_msgSend(v17, "setStorageMode:", 2);
  objc_msgSend(v17, "setUsage:", 3);
  v13 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v17);
  renderTarget = self->_renderTarget;
  self->_renderTarget = v13;

  v15 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v17);
  accumulationTarget = self->_accumulationTarget;
  self->_accumulationTarget = v15;

  self->_frameIndex = 0;
}

- (void)updateUniforms
{
  char *v3;
  float height;
  unsigned int frameIndex;
  uint64_t v11;
  char *v12;
  int v13;

  self->_uniformBufferOffset = self->_uniformBufferIndex << 8;
  v3 = (char *)-[MTLBuffer contents](self->_uniformBuffer, "contents") + self->_uniformBufferOffset;
  *((_OWORD *)v3 + 1) = xmmword_10000C080;
  *((_OWORD *)v3 + 2) = xmmword_10000C0A0;
  *((_OWORD *)v3 + 3) = xmmword_10000C070;
  *((_OWORD *)v3 + 4) = xmmword_10000C090;
  *((_OWORD *)v3 + 5) = xmmword_10000C0B0;
  *((_OWORD *)v3 + 6) = xmmword_10000C0C0;
  *((_OWORD *)v3 + 7) = xmmword_10000C0D0;
  *((_OWORD *)v3 + 8) = xmmword_10000C0E0;
  __asm { FMOV            V0.4S, #4.0 }
  *((_OWORD *)v3 + 9) = _Q0;
  *(float *)&_Q0 = self->_size.width;
  height = self->_size.height;
  *((float32x4_t *)v3 + 2) = vmulq_n_f32((float32x4_t)xmmword_10000C0A0, (float)(*(float *)&_Q0 / height) * 0.41421);
  *((_OWORD *)v3 + 3) = xmmword_10000C0F0;
  *(int32x2_t *)&_Q0 = vmovn_s64((int64x2_t)vcvtq_u64_f64((float64x2_t)self->_size));
  *(_QWORD *)v3 = _Q0;
  *((_DWORD *)v3 + 2) = (_Q0 + 15) >> 4;
  frameIndex = self->_frameIndex;
  self->_frameIndex = frameIndex + 1;
  *((_DWORD *)v3 + 3) = frameIndex;
  self->_randomBufferOffset = self->_uniformBufferIndex << 11;
  v11 = 0;
  v12 = (char *)-[MTLBuffer contents](self->_randomBuffer, "contents") + self->_randomBufferOffset;
  do
  {
    v13 = rand();
    *(float32x2_t *)&v12[v11] = vmul_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(rand(), v13)), (float32x2_t)0x3000000030000000);
    v11 += 8;
  }
  while (v11 != 2048);
  self->_uniformBufferIndex = (self->_uniformBufferIndex + 1) % 3;
}

- (void)render
{
  void *v3;
  double width;
  double height;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64x2_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];
  int64x2_t v16;
  uint64_t v17;
  _QWORD v18[3];
  int64x2_t v19;
  uint64_t v20;
  _QWORD v21[3];
  int64x2_t v22;
  uint64_t v23;
  _QWORD v24[3];
  _QWORD v25[6];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sem, 0xFFFFFFFFFFFFFFFFLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandQueue commandBuffer](self->_queue, "commandBuffer"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100008CD0;
  v25[3] = &unk_100010568;
  v25[4] = self;
  objc_msgSend(v3, "addCompletedHandler:", v25);
  -[Renderer updateUniforms](self, "updateUniforms");
  width = self->_size.width;
  height = self->_size.height;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "computeCommandEncoder"));
  objc_msgSend(v6, "setBuffer:offset:atIndex:", self->_uniformBuffer, self->_uniformBufferOffset, 0);
  objc_msgSend(v6, "setBuffer:offset:atIndex:", self->_rayBuffer, 0, 1);
  objc_msgSend(v6, "setBuffer:offset:atIndex:", self->_randomBuffer, self->_randomBufferOffset, 2);
  objc_msgSend(v6, "setTexture:atIndex:", self->_renderTarget, 0);
  objc_msgSend(v6, "setComputePipelineState:", self->_rayPipeline);
  v24[0] = ((unint64_t)width + 7) >> 3;
  v24[1] = ((unint64_t)height + 7) >> 3;
  v24[2] = 1;
  v22 = vdupq_n_s64(8uLL);
  v23 = 1;
  objc_msgSend(v6, "dispatchThreadgroups:threadsPerThreadgroup:", v24, &v22);
  objc_msgSend(v6, "endEncoding");
  v7 = 3;
  v12 = vdupq_n_s64(8uLL);
  v8 = v6;
  do
  {
    -[MPSRayIntersector setIntersectionDataType:](self->_intersector, "setIntersectionDataType:", 2);
    -[MPSRayIntersector encodeIntersectionToCommandBuffer:intersectionType:rayBuffer:rayBufferOffset:intersectionBuffer:intersectionBufferOffset:rayCount:accelerationStructure:](self->_intersector, "encodeIntersectionToCommandBuffer:intersectionType:rayBuffer:rayBufferOffset:intersectionBuffer:intersectionBufferOffset:rayCount:accelerationStructure:", v3, 0, self->_rayBuffer, 0, self->_intersectionBuffer, 0, (unint64_t)height * (unint64_t)width, self->_accelerationStructure);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "computeCommandEncoder"));

    objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_uniformBuffer, self->_uniformBufferOffset, 0);
    objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_rayBuffer, 0, 1);
    objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_shadowRayBuffer, 0, 2);
    objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_intersectionBuffer, 0, 3);
    objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_vertexColorBuffer, 0, 4);
    objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_vertexNormalBuffer, 0, 5);
    objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_randomBuffer, self->_randomBufferOffset, 6);
    objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_triangleMaskBuffer, 0, 7);
    objc_msgSend(v9, "setTexture:atIndex:", self->_renderTarget, 0);
    objc_msgSend(v9, "setComputePipelineState:", self->_shadePipeline);
    v21[0] = ((unint64_t)width + 7) >> 3;
    v21[1] = ((unint64_t)height + 7) >> 3;
    v21[2] = 1;
    v19 = v12;
    v20 = 1;
    objc_msgSend(v9, "dispatchThreadgroups:threadsPerThreadgroup:", v21, &v19);
    objc_msgSend(v9, "endEncoding");
    -[MPSRayIntersector setIntersectionDataType:](self->_intersector, "setIntersectionDataType:", 0);
    -[MPSRayIntersector encodeIntersectionToCommandBuffer:intersectionType:rayBuffer:rayBufferOffset:intersectionBuffer:intersectionBufferOffset:rayCount:accelerationStructure:](self->_intersector, "encodeIntersectionToCommandBuffer:intersectionType:rayBuffer:rayBufferOffset:intersectionBuffer:intersectionBufferOffset:rayCount:accelerationStructure:", v3, 1, self->_shadowRayBuffer, 0, self->_intersectionBuffer, 0, (unint64_t)height * (unint64_t)width, self->_accelerationStructure);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "computeCommandEncoder"));

    objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_uniformBuffer, self->_uniformBufferOffset, 0);
    objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_shadowRayBuffer, 0, 1);
    objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_intersectionBuffer, 0, 2);
    objc_msgSend(v10, "setTexture:atIndex:", self->_renderTarget, 0);
    objc_msgSend(v10, "setComputePipelineState:", self->_shadowPipeline);
    v18[0] = ((unint64_t)width + 7) >> 3;
    v18[1] = ((unint64_t)height + 7) >> 3;
    v18[2] = 1;
    v16 = vdupq_n_s64(8uLL);
    v17 = 1;
    objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
    objc_msgSend(v10, "endEncoding");
    v8 = v10;
    --v7;
  }
  while (v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "computeCommandEncoder"));

  objc_msgSend(v11, "setBuffer:offset:atIndex:", self->_uniformBuffer, self->_uniformBufferOffset, 0);
  objc_msgSend(v11, "setTexture:atIndex:", self->_renderTarget, 0);
  objc_msgSend(v11, "setTexture:atIndex:", self->_accumulationTarget, 1);
  objc_msgSend(v11, "setComputePipelineState:", self->_accumulatePipeline);
  v15[0] = ((unint64_t)width + 7) >> 3;
  v15[1] = ((unint64_t)height + 7) >> 3;
  v15[2] = 1;
  v13 = vdupq_n_s64(8uLL);
  v14 = 1;
  objc_msgSend(v11, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v11, "endEncoding");
  objc_msgSend(v3, "commit");

}

- (BOOL)hasRenderDevice
{
  return self->_device != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_accumulationTarget, 0);
  objc_storeStrong((id *)&self->_renderTarget, 0);
  objc_storeStrong((id *)&self->_copyPipeline, 0);
  objc_storeStrong((id *)&self->_accumulatePipeline, 0);
  objc_storeStrong((id *)&self->_shadowPipeline, 0);
  objc_storeStrong((id *)&self->_shadePipeline, 0);
  objc_storeStrong((id *)&self->_rayPipeline, 0);
  objc_storeStrong((id *)&self->_triangleMaskBuffer, 0);
  objc_storeStrong((id *)&self->_randomBuffer, 0);
  objc_storeStrong((id *)&self->_uniformBuffer, 0);
  objc_storeStrong((id *)&self->_intersectionBuffer, 0);
  objc_storeStrong((id *)&self->_shadowRayBuffer, 0);
  objc_storeStrong((id *)&self->_rayBuffer, 0);
  objc_storeStrong((id *)&self->_vertexColorBuffer, 0);
  objc_storeStrong((id *)&self->_vertexNormalBuffer, 0);
  objc_storeStrong((id *)&self->_vertexPositionBuffer, 0);
  objc_storeStrong((id *)&self->_intersector, 0);
  objc_storeStrong((id *)&self->_accelerationStructure, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
