@implementation CIBilateralSolverGPU

- (void)_setupPipelineCache
{
  __assert_rtn("-[CIBilateralSolverGPU _setupPipelineCache]", "BilateralSolverGPU.m", 118, "[pipelineArray count] == COMPUTE_COUNT");
}

void __43__CIBilateralSolverGPU__setupPipelineCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_setupPipelineCache__pipelineDict;
  _setupPipelineCache__pipelineDict = v0;

}

void __43__CIBilateralSolverGPU__setupPipelineCache__block_invoke_2(uint64_t a1)
{
  uint64_t i;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 9);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 24; i != 96; i += 8)
    objc_msgSend(v5, "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + i));
  v3 = (id)_setupPipelineCache__pipelineDict;
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_setupPipelineCache__pipelineDict, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

  objc_sync_exit(v3);
}

- (CIBilateralSolverGPU)initWithWidth:(int)a3 height:(int)a4 maxVertices:(unint64_t)a5 commandBuffer:(id)a6
{
  id v11;
  CIBilateralSolverGPU *v12;
  CIBilateralSolverGPU *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CIBilateralSolverGPU;
  v12 = -[CIBilateralSolverGPU init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_useTrilinearInterpolation = 1;
    v12->_width = a3;
    v12->_height = a4;
    v12->_maxVertices = a5;
    objc_storeStrong((id *)&v12->_commandBuffer, a6);
    -[CIBilateralSolverGPU _setupMetal](v13, "_setupMetal");
    -[CIBilateralSolverGPU _setupPipelineCache](v13, "_setupPipelineCache");
    -[CIBilateralSolverGPU _setupBuffer](v13, "_setupBuffer");
  }

  return v13;
}

- (int)doSolveWithBilateralGridhash:(id)a3 reference:(id)a4 disparity:(id)a5 confidence:(id)a6 output:(id)a7 lambda:(float)a8 maxIterations:(int)a9 offsets:(id *)a10
{
  uint64_t v10;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  MTLCommandBuffer *v26;
  double v27;
  int v28;

  v10 = *(_QWORD *)&a9;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  self->_params.lambda = a8;
  self->_params.N = objc_msgSend(v17, "countVertices");
  self->_params.dims = objc_msgSend(v17, "countDims");
  self->_params.sigma_s = (float)(int)objc_msgSend(v17, "sigma_s");
  self->_params.sigma_r_luma = (float)(int)objc_msgSend(v17, "sigma_r_luma");
  *(_OWORD *)self->_anon_ac = *(_OWORD *)a10;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  v26 = self->_commandBuffer;
  if ((int)objc_msgSend(v17, "countVertices") < 1)
  {
    v28 = 1;
  }
  else
  {
    -[CIBilateralSolverGPU _prepareResources:](self, "_prepareResources:", v17);
    *(float *)&v27 = a8;
    -[CIBilateralSolverGPU _doBistochastizeWithCommandBuffer:t_tex:c_tex:lambda:nIterations:](self, "_doBistochastizeWithCommandBuffer:t_tex:c_tex:lambda:nIterations:", v26, v23, v24, 10, v27);
    -[CIBilateralSolverGPU _doPCGWithCommandBuffer:nIterations:](self, "_doPCGWithCommandBuffer:nIterations:", v26, v10);
    if (self->_useTrilinearInterpolation)
      -[CIBilateralSolverGPU _doSliceTrilinearWithCommandBuffer:ref_tex:o_tex:](self, "_doSliceTrilinearWithCommandBuffer:ref_tex:o_tex:", v26, v22, v25);
    else
      -[CIBilateralSolverGPU _doSliceWithCommandBuffer:o_tex:](self, "_doSliceWithCommandBuffer:o_tex:", v26, v25);
    v28 = 0;
  }

  return v28;
}

- (void)_setupMetal
{
  MTLDevice *v3;
  MTLDevice *metalDevice;

  -[MTLCommandBuffer device](self->_commandBuffer, "device");
  v3 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
  metalDevice = self->_metalDevice;
  self->_metalDevice = v3;

}

- (void)_setupPipelinesAsync:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_group *v6;
  OS_dispatch_group *computePipelinesGroup;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  MTLDevice *metalDevice;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  int v18;
  _QWORD v19[3];
  int v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](self->_metalDevice, "newDefaultLibraryWithBundle:error:");
  v6 = (OS_dispatch_group *)dispatch_group_create();
  computePipelinesGroup = self->_computePipelinesGroup;
  self->_computePipelinesGroup = v6;

  v8 = 0;
  v9 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  do
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", kKernelNames[v8]);
    v11 = (void *)objc_msgSend(v5, "newFunctionWithName:", v10);

    dispatch_group_enter((dispatch_group_t)self->_computePipelinesGroup);
    metalDevice = self->_metalDevice;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__CIBilateralSolverGPU__setupPipelinesAsync___block_invoke;
    v15[3] = &unk_1E2EC2C00;
    v18 = v8;
    v15[4] = self;
    v17 = v19;
    v13 = v4;
    v16 = v13;
    -[MTLDevice newComputePipelineStateWithFunction:completionHandler:](metalDevice, "newComputePipelineStateWithFunction:completionHandler:", v11, v15);

    ++v8;
    v9 = v11;
  }
  while (v8 != 9);

  _Block_object_dispose(v19, 8);
}

void __45__CIBilateralSolverGPU__setupPipelinesAsync___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  int v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8 * *(int *)(a1 + 56) + 24), a2);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 96));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(_DWORD *)(v4 + 24) + 1;
  *(_DWORD *)(v4 + 24) = v5;
  if (v5 == 9)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_setupBuffer
{
  char v3;
  MTLTexture *v4;
  MTLTexture *gridHashMatrix;
  MTLBuffer *v6;
  MTLBuffer *A_buf;
  MTLBuffer *v8;
  MTLBuffer *b_buf;
  MTLBuffer *v10;
  MTLBuffer *s_buf;
  MTLBuffer *v12;
  MTLBuffer *q_buf;
  uint64_t v14;
  MTLBuffer **Dn_buf;
  MTLBuffer **x_buf;
  MTLBuffer **r_buf;
  MTLBuffer **d_buf;
  char v19;
  uint64_t v20;
  MTLBuffer *v21;
  uint64_t v22;
  MTLBuffer *v23;
  uint64_t v24;
  MTLBuffer *v25;
  uint64_t v26;
  MTLBuffer *v27;
  id v28;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 53, self->_width, self->_height, 0);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  objc_msgSend(v28, "setUsage:", 1);
  v4 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_metalDevice, "newTextureWithDescriptor:", v28);
  gridHashMatrix = self->_gridHashMatrix;
  self->_gridHashMatrix = v4;

  v6 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4 * self->_maxVertices, 0);
  A_buf = self->_A_buf;
  self->_A_buf = v6;

  v8 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4 * self->_maxVertices, 0);
  b_buf = self->_b_buf;
  self->_b_buf = v8;

  v10 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4 * self->_maxVertices, 0);
  s_buf = self->_s_buf;
  self->_s_buf = v10;

  v12 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4 * self->_maxVertices, 0);
  q_buf = self->_q_buf;
  self->_q_buf = v12;

  v14 = 0;
  Dn_buf = self->_Dn_buf;
  x_buf = self->_x_buf;
  r_buf = self->_r_buf;
  d_buf = self->_d_buf;
  do
  {
    v19 = v3;
    v20 = -[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4 * self->_maxVertices, 0);
    v21 = Dn_buf[v14];
    Dn_buf[v14] = (MTLBuffer *)v20;

    v22 = -[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4 * self->_maxVertices, 0);
    v23 = x_buf[v14];
    x_buf[v14] = (MTLBuffer *)v22;

    v24 = -[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4 * self->_maxVertices, 0);
    v25 = r_buf[v14];
    r_buf[v14] = (MTLBuffer *)v24;

    v26 = -[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4 * self->_maxVertices, 0);
    v27 = d_buf[v14];
    d_buf[v14] = (MTLBuffer *)v26;

    v3 = 0;
    v14 = 1;
  }
  while ((v19 & 1) != 0);

}

- (void)_prepareResources:(id)a3
{
  id v4;
  int v5;
  uint64_t width;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MTLBuffer *v13;
  MTLBuffer *gridHashBuffer;
  MTLBuffer *v15;
  MTLBuffer *gridBlurBuffer;
  MTLBuffer *v17;
  MTLBuffer *gridCoordIndicesBuffer;
  MTLBuffer *v19;
  MTLBuffer *gridCoordTableBuffer;
  MTLTexture *gridHashMatrix;
  MTLBuffer *v22;
  MTLBuffer *gridInterpIndicesBuffer;
  MTLBuffer *v24;
  MTLBuffer *gridInterpTableBuffer;
  MTLBuffer *v26;
  MTLBuffer *gridInterpPadBuffer;
  NSObject *computePipelinesGroup;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t height;
  uint64_t v33;
  _QWORD v34[6];

  v4 = a3;
  v5 = objc_msgSend(v4, "countVertices");
  width = self->_width;
  height = self->_height;
  self->_threadGroupInfo.dispatchThreadgroups.width = (unint64_t)(v5 + 127) >> 7;
  *(int64x2_t *)&self->_threadGroupInfo.dispatchThreadgroups.height = vdupq_n_s64(1uLL);
  *(_OWORD *)&self->_threadGroupInfo.threadsPerThreadgroup.width = xmmword_19248E100;
  self->_threadGroupInfo.threadsPerThreadgroup.depth = 1;
  v7 = objc_msgSend(v4, "hash_table");
  v8 = *(unsigned int *)(v7 + 24 * v5 - 4);
  v9 = objc_msgSend(v4, "blur_table");
  v10 = objc_msgSend(v4, "coord_indices");
  v29 = objc_msgSend(v4, "coord_table");
  v30 = objc_msgSend(v4, "hash_matrix");
  v11 = objc_msgSend(v4, "interp_indices");
  v31 = objc_msgSend(v4, "interp_table");
  v33 = objc_msgSend(v4, "interp_pad");

  v12 = *(unsigned int *)(v11 + 4 * v5);
  v13 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_metalDevice, "newBufferWithBytes:length:options:", v7, 24 * v5, 0);
  gridHashBuffer = self->_gridHashBuffer;
  self->_gridHashBuffer = v13;

  v15 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_metalDevice, "newBufferWithBytes:length:options:", v9, 4 * v8, 0);
  gridBlurBuffer = self->_gridBlurBuffer;
  self->_gridBlurBuffer = v15;

  v17 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_metalDevice, "newBufferWithBytes:length:options:", v10, 4 * (v5 + 1), 0);
  gridCoordIndicesBuffer = self->_gridCoordIndicesBuffer;
  self->_gridCoordIndicesBuffer = v17;

  v19 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_metalDevice, "newBufferWithBytes:length:options:", v29, 4 * (int)height * (int)width, 0);
  gridCoordTableBuffer = self->_gridCoordTableBuffer;
  self->_gridCoordTableBuffer = v19;

  memset(v34, 0, 24);
  gridHashMatrix = self->_gridHashMatrix;
  v34[3] = width;
  v34[4] = height;
  v34[5] = 1;
  -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](gridHashMatrix, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v34, 0, v30, 4 * width);
  v22 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_metalDevice, "newBufferWithBytes:length:options:", v11, 4 * (v5 + 1), 0);
  gridInterpIndicesBuffer = self->_gridInterpIndicesBuffer;
  self->_gridInterpIndicesBuffer = v22;

  v24 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_metalDevice, "newBufferWithBytes:length:options:", v31, 4 * v12, 0);
  gridInterpTableBuffer = self->_gridInterpTableBuffer;
  self->_gridInterpTableBuffer = v24;

  v26 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_metalDevice, "newBufferWithBytes:length:options:", v33, v12, 0);
  gridInterpPadBuffer = self->_gridInterpPadBuffer;
  self->_gridInterpPadBuffer = v26;

  computePipelinesGroup = self->_computePipelinesGroup;
  if (computePipelinesGroup)
    dispatch_group_wait(computePipelinesGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (int)_doBistochastizeWithCommandBuffer:(id)a3 t_tex:(id)a4 c_tex:(id)a5 lambda:(float)a6 nIterations:(int)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  MTLBuffer **Dn_buf;
  $F658BB969C613715367DCC6514698F9C *p_threadGroupInfo;
  $E8CF8C4D35898297CF58D66FCEA3D064 *p_threadsPerThreadgroup;
  int v18;
  void *v19;
  void *v20;
  $E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup;
  __int128 v23;
  unint64_t depth;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  *(_QWORD *)&self->_idxDnBufIn = 0;
  objc_msgSend(v11, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setComputePipelineState:", self->_computePipelines[0]);
  objc_msgSend(v14, "setBuffer:offset:atIndex:", self->_gridHashBuffer, 0, 0);
  objc_msgSend(v14, "setBuffer:offset:atIndex:", self->_gridBlurBuffer, 0, 1);
  Dn_buf = self->_Dn_buf;
  objc_msgSend(v14, "setBuffer:offset:atIndex:", self->_Dn_buf[self->_idxDnBufIn], 0, 2);
  objc_msgSend(v14, "setBytes:length:atIndex:", &self->_params, 20, 3);
  p_threadGroupInfo = &self->_threadGroupInfo;
  p_threadsPerThreadgroup = &self->_threadGroupInfo.threadsPerThreadgroup;
  v23 = *(_OWORD *)&self->_threadGroupInfo.dispatchThreadgroups.width;
  depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  threadsPerThreadgroup = self->_threadGroupInfo.threadsPerThreadgroup;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v23, &threadsPerThreadgroup);
  objc_msgSend(v14, "endEncoding");

  if (a7 >= 2)
  {
    v18 = a7 - 1;
    do
    {
      objc_msgSend(v11, "computeCommandEncoder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setComputePipelineState:", self->_computePipelines[1]);
      objc_msgSend(v19, "setBuffer:offset:atIndex:", self->_gridHashBuffer, 0, 0);
      objc_msgSend(v19, "setBuffer:offset:atIndex:", self->_gridBlurBuffer, 0, 1);
      objc_msgSend(v19, "setBuffer:offset:atIndex:", Dn_buf[self->_idxDnBufIn], 0, 2);
      objc_msgSend(v19, "setBuffer:offset:atIndex:", Dn_buf[self->_idxDnBufIn ^ 1], 0, 3);
      objc_msgSend(v19, "setBytes:length:atIndex:", &self->_params, 20, 4);
      v23 = *(_OWORD *)&p_threadGroupInfo->dispatchThreadgroups.width;
      depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.width = *(_OWORD *)&p_threadsPerThreadgroup->width;
      threadsPerThreadgroup.depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", &v23, &threadsPerThreadgroup);
      objc_msgSend(v19, "endEncoding");
      self->_idxDnBufIn ^= 1u;

      --v18;
    }
    while (v18);
  }
  objc_msgSend(v11, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setComputePipelineState:", self->_computePipelines[2]);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", self->_gridHashBuffer, 0, 0);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", self->_gridBlurBuffer, 0, 1);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", self->_gridCoordIndicesBuffer, 0, 2);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", self->_gridCoordTableBuffer, 0, 3);
  objc_msgSend(v20, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v20, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", Dn_buf[self->_idxDnBufIn], 0, 4);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", self->_A_buf, 0, 5);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", self->_b_buf, 0, 6);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", self->_x_buf[self->_idxSwapBufIn], 0, 7);
  objc_msgSend(v20, "setBytes:length:atIndex:", &self->_params, 20, 8);
  objc_msgSend(v20, "setBytes:length:atIndex:", self->_anon_ac, 16, 9);
  v23 = *(_OWORD *)&p_threadGroupInfo->dispatchThreadgroups.width;
  depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  *(_OWORD *)&threadsPerThreadgroup.width = *(_OWORD *)&p_threadsPerThreadgroup->width;
  threadsPerThreadgroup.depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
  objc_msgSend(v20, "dispatchThreadgroups:threadsPerThreadgroup:", &v23, &threadsPerThreadgroup);
  objc_msgSend(v20, "endEncoding");

  return 0;
}

- (int)_doPCGWithCommandBuffer:(id)a3 nIterations:(int)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MTLBuffer **d_buf;
  $F658BB969C613715367DCC6514698F9C *v11;
  $E8CF8C4D35898297CF58D66FCEA3D064 *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  $E8CF8C4D35898297CF58D66FCEA3D064 *p_threadsPerThreadgroup;
  $F658BB969C613715367DCC6514698F9C *p_threadGroupInfo;
  MTLBuffer **r_buf;
  MTLBuffer **x_buf;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  $E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup;
  __int128 v28;
  unint64_t depth;

  v6 = a3;
  v7 = (void *)-[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4, 0);
  v23 = (void *)-[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4, 0);
  v8 = -[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 1, 0);
  objc_msgSend(v6, "computeCommandEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setComputePipelineState:", self->_computePipelines[3]);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_gridHashBuffer, 0, 0);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_gridBlurBuffer, 0, 1);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_Dn_buf[self->_idxDnBufIn], 0, 2);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_A_buf, 0, 3);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_b_buf, 0, 4);
  x_buf = self->_x_buf;
  objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_x_buf[self->_idxSwapBufIn], 0, 5);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_r_buf[self->_idxSwapBufIn], 0, 6);
  d_buf = self->_d_buf;
  objc_msgSend(v9, "setBuffer:offset:atIndex:", self->_d_buf[self->_idxSwapBufIn], 0, 7);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", v7, 0, 8);
  objc_msgSend(v9, "setBuffer:offset:atIndex:", v8, 0, 9);
  objc_msgSend(v9, "setBytes:length:atIndex:", &self->_params, 20, 10);
  v28 = *(_OWORD *)&self->_threadGroupInfo.dispatchThreadgroups.width;
  depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  threadsPerThreadgroup = self->_threadGroupInfo.threadsPerThreadgroup;
  objc_msgSend(v9, "dispatchThreadgroups:threadsPerThreadgroup:", &v28, &threadsPerThreadgroup);
  objc_msgSend(v9, "endEncoding");

  v22 = (void *)v8;
  if (a4 < 1)
  {
    v15 = v7;
  }
  else
  {
    p_threadsPerThreadgroup = &self->_threadGroupInfo.threadsPerThreadgroup;
    p_threadGroupInfo = &self->_threadGroupInfo;
    r_buf = self->_r_buf;
    v26 = v6;
    v11 = &self->_threadGroupInfo;
    v12 = &self->_threadGroupInfo.threadsPerThreadgroup;
    do
    {
      v25 = a4;
      v24 = -[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4, 0, p_threadsPerThreadgroup, p_threadGroupInfo);
      objc_msgSend(v6, "computeCommandEncoder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setComputePipelineState:", self->_computePipelines[4]);
      objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_gridHashBuffer, 0, 0);
      objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_gridBlurBuffer, 0, 1);
      objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_Dn_buf[self->_idxDnBufIn], 0, 2);
      objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_A_buf, 0, 3);
      objc_msgSend(v13, "setBuffer:offset:atIndex:", d_buf[self->_idxSwapBufIn], 0, 4);
      objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_q_buf, 0, 5);
      objc_msgSend(v13, "setBuffer:offset:atIndex:", v23, 0, 6);
      objc_msgSend(v13, "setBuffer:offset:atIndex:", v22, 0, 7);
      objc_msgSend(v13, "setBytes:length:atIndex:", &self->_params, 20, 8);
      v28 = *(_OWORD *)&v11->dispatchThreadgroups.width;
      depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.width = *(_OWORD *)&v12->width;
      threadsPerThreadgroup.depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", &v28, &threadsPerThreadgroup);
      objc_msgSend(v13, "endEncoding");

      objc_msgSend(v26, "computeCommandEncoder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setComputePipelineState:", self->_computePipelines[5]);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", self->_A_buf, 0, 0);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", x_buf[self->_idxSwapBufIn], 0, 1);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", r_buf[self->_idxSwapBufIn], 0, 2);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", d_buf[self->_idxSwapBufIn], 0, 3);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", self->_q_buf, 0, 4);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", x_buf[self->_idxSwapBufIn ^ 1], 0, 5);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", r_buf[self->_idxSwapBufIn ^ 1], 0, 6);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", self->_s_buf, 0, 7);
      v15 = (void *)v24;
      objc_msgSend(v14, "setBuffer:offset:atIndex:", v24, 0, 8);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", v7, 0, 9);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", v23, 0, 10);
      objc_msgSend(v14, "setBuffer:offset:atIndex:", v22, 0, 11);
      objc_msgSend(v14, "setBytes:length:atIndex:", &self->_params, 20, 12);
      v28 = *(_OWORD *)&v11->dispatchThreadgroups.width;
      depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.width = *(_OWORD *)&v12->width;
      threadsPerThreadgroup.depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v28, &threadsPerThreadgroup);
      objc_msgSend(v14, "endEncoding");

      objc_msgSend(v26, "computeCommandEncoder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setComputePipelineState:", self->_computePipelines[6]);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", self->_s_buf, 0, 0);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", d_buf[self->_idxSwapBufIn], 0, 1);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", d_buf[self->_idxSwapBufIn ^ 1], 0, 2);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", v7, 0, 3);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", v24, 0, 4);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", v22, 0, 5);
      objc_msgSend(v16, "setBytes:length:atIndex:", &self->_params, 20, 6);
      v28 = *(_OWORD *)&v11->dispatchThreadgroups.width;
      depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.width = *(_OWORD *)&v12->width;
      threadsPerThreadgroup.depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", &v28, &threadsPerThreadgroup);
      objc_msgSend(v16, "endEncoding");

      v6 = v26;
      self->_idxSwapBufIn ^= 1u;
      v7 = (void *)v24;
      --a4;
    }
    while (v25 != 1);
  }

  return 0;
}

- (int)_doSliceWithCommandBuffer:(id)a3 o_tex:(id)a4
{
  int width;
  int height;
  MTLComputePipelineState *v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];

  width = self->_width;
  height = self->_height;
  v8 = self->_computePipelines[7];
  v9 = a4;
  v10 = a3;
  LODWORD(v8) = -[MTLComputePipelineState threadExecutionWidth](v8, "threadExecutionWidth");
  v11 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[7], "maxTotalThreadsPerThreadgroup")/ (int)v8;
  objc_msgSend(v10, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setComputePipelineState:", self->_computePipelines[7]);
  objc_msgSend(v12, "setTexture:atIndex:", self->_gridHashMatrix, 0);
  objc_msgSend(v12, "setBuffer:offset:atIndex:", self->_x_buf[self->_idxSwapBufIn], 0, 0);
  objc_msgSend(v12, "setTexture:atIndex:", v9, 1);

  v15[0] = (width + (int)v8 - 1) / (int)v8;
  v15[1] = (height + v11 - 1) / v11;
  v15[2] = 1;
  v14[0] = (int)v8;
  v14[1] = v11;
  v14[2] = 1;
  objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", v15, v14);
  objc_msgSend(v12, "endEncoding");

  return 0;
}

- (int)_doSliceTrilinearWithCommandBuffer:(id)a3 ref_tex:(id)a4 o_tex:(id)a5
{
  int width;
  int height;
  int v10;
  int v11;
  MTLComputePipelineState *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[3];

  width = self->_width;
  height = self->_height;
  if (width >= 0)
    v10 = self->_width;
  else
    v10 = width + 1;
  if (height >= 0)
    v11 = self->_height;
  else
    v11 = height + 1;
  v12 = self->_computePipelines[8];
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[MTLComputePipelineState threadExecutionWidth](v12, "threadExecutionWidth");
  LODWORD(v12) = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[8], "maxTotalThreadsPerThreadgroup")/ v16;
  objc_msgSend(v15, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setComputePipelineState:", self->_computePipelines[8]);
  objc_msgSend(v17, "setTexture:atIndex:", self->_gridHashMatrix, 0);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_gridInterpIndicesBuffer, 0, 0);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_gridInterpTableBuffer, 0, 1);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_gridInterpPadBuffer, 0, 2);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", self->_x_buf[self->_idxSwapBufIn], 0, 3);
  objc_msgSend(v17, "setTexture:atIndex:", v14, 1);

  objc_msgSend(v17, "setTexture:atIndex:", v13, 2);
  objc_msgSend(v17, "setBytes:length:atIndex:", &self->_params, 20, 4);
  objc_msgSend(v17, "setBytes:length:atIndex:", self->_anon_ac, 16, 5);
  v20[0] = (v16 + (v10 >> 1) - 1) / v16;
  v20[1] = ((int)v12 + (v11 >> 1) - 1) / (int)v12;
  v20[2] = 1;
  v19[0] = v16;
  v19[1] = (int)v12;
  v19[2] = 1;
  objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v20, v19);
  objc_msgSend(v17, "endEncoding");

  return 0;
}

- (BOOL)useTrilinearInterpolation
{
  return self->_useTrilinearInterpolation;
}

- (void)setUseTrilinearInterpolation:(BOOL)a3
{
  self->_useTrilinearInterpolation = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  MTLBuffer **v4;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;

  v3 = 0;
  v4 = &self->_d_buf[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_r_buf[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_x_buf[j + 1], 0);
  for (k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_Dn_buf[k + 1], 0);
  objc_storeStrong((id *)&self->_q_buf, 0);
  objc_storeStrong((id *)&self->_s_buf, 0);
  objc_storeStrong((id *)&self->_b_buf, 0);
  objc_storeStrong((id *)&self->_A_buf, 0);
  objc_storeStrong((id *)&self->_gridInterpPadBuffer, 0);
  objc_storeStrong((id *)&self->_gridInterpTableBuffer, 0);
  objc_storeStrong((id *)&self->_gridInterpIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_gridHashMatrix, 0);
  objc_storeStrong((id *)&self->_gridCoordTableBuffer, 0);
  objc_storeStrong((id *)&self->_gridCoordIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_gridBlurBuffer, 0);
  objc_storeStrong((id *)&self->_gridHashBuffer, 0);
  objc_storeStrong((id *)&self->_computePipelinesGroup, 0);
  for (m = 88; m != 16; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
}

@end
