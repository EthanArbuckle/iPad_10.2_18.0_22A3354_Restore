@implementation ABPK2DDetectionPostprocessGPU

- (ABPK2DDetectionPostprocessGPU)init
{
  return -[ABPK2DDetectionPostprocessGPU initWithNumberOfChannels:](self, "initWithNumberOfChannels:", 19);
}

- (ABPK2DDetectionPostprocessGPU)initWithNumberOfChannels:(unint64_t)a3
{
  ABPK2DDetectionPostprocessGPU *v4;
  MTLDevice *v5;
  MTLDevice *device;
  uint64_t v7;
  MTLCommandQueue *commandQueue;
  void *v9;
  void *v10;
  MTLDevice *v11;
  uint64_t v12;
  id v13;
  MTLLibrary *library;
  void *v15;
  uint64_t v16;
  MTLComputePipelineState *pipelineStateInterpolate;
  void *v18;
  uint64_t v19;
  MTLComputePipelineState *pipelineStateMaxFilter;
  uint64_t v21;
  MTLBuffer *intermediate;
  uint64_t v23;
  MTLBuffer *output;
  id v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)ABPK2DDetectionPostprocessGPU;
  v4 = -[ABPK2DDetectionPostprocessGPU init](&v27, sel_init);
  v4->_nChannels = a3;
  v5 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v4->_device;
  v4->_device = v5;

  v7 = -[MTLDevice newCommandQueue](v4->_device, "newCommandQueue");
  commandQueue = v4->_commandQueue;
  v4->_commandQueue = (MTLCommandQueue *)v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4->_device;
  v26 = 0;
  v12 = -[MTLDevice newLibraryWithURL:error:](v11, "newLibraryWithURL:error:", v10, &v26);
  v13 = v26;
  library = v4->_library;
  v4->_library = (MTLLibrary *)v12;

  v15 = (void *)-[MTLLibrary newFunctionWithName:](v4->_library, "newFunctionWithName:", CFSTR("interpolateBicubic"));
  v16 = -[MTLDevice newComputePipelineStateWithFunction:error:](v4->_device, "newComputePipelineStateWithFunction:error:", v15, 0);
  pipelineStateInterpolate = v4->_pipelineStateInterpolate;
  v4->_pipelineStateInterpolate = (MTLComputePipelineState *)v16;

  v18 = (void *)-[MTLLibrary newFunctionWithName:](v4->_library, "newFunctionWithName:", CFSTR("maxFilter"));
  v19 = -[MTLDevice newComputePipelineStateWithFunction:error:](v4->_device, "newComputePipelineStateWithFunction:error:", v18, 0);
  pipelineStateMaxFilter = v4->_pipelineStateMaxFilter;
  v4->_pipelineStateMaxFilter = (MTLComputePipelineState *)v19;

  v21 = -[MTLDevice newBufferWithLength:options:](v4->_device, "newBufferWithLength:options:", 2 * width * height * scale * scale * v4->_nChannels + 16, 32);
  intermediate = v4->_intermediate;
  v4->_intermediate = (MTLBuffer *)v21;

  v23 = -[MTLDevice newBufferWithLength:options:](v4->_device, "newBufferWithLength:options:", 2 * width * height * scale * scale * v4->_nChannels + 16, 0);
  output = v4->_output;
  v4->_output = (MTLBuffer *)v23;

  return v4;
}

- (void)dealloc
{
  MTLBuffer *input;
  MTLBuffer *intermediate;
  MTLBuffer *output;
  objc_super v6;

  input = self->_input;
  self->_input = 0;

  intermediate = self->_intermediate;
  self->_intermediate = 0;

  output = self->_output;
  self->_output = 0;

  v6.receiver = self;
  v6.super_class = (Class)ABPK2DDetectionPostprocessGPU;
  -[ABPK2DDetectionPostprocessGPU dealloc](&v6, sel_dealloc);
}

- (void)_copyToInputAsFloat16:(float *)a3 shape:(CGSize)a4
{
  unint64_t v5;
  _WORD *i;
  int v7;

  v5 = (unint64_t)(a4.height * (a4.width * (double)self->_nChannels * 0.125) * 0.125);
  for (i = (_WORD *)-[MTLBuffer contents](self->_input, "contents"); v5; --v5)
  {
    v7 = *(_DWORD *)a3++;
    _S0 = v7;
    __asm { FCVT            H0, S0 }
    *i++ = _S0;
  }
}

- (uint64_t)process:(double)a3 counter:(uint64_t)a4 shape:(__IOSurface *)a5
{
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _DWORD v35[4];

  v11 = objc_msgSend(*(id *)(a1 + 16), "newBufferWithIOSurface:");
  v12 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v11;

  bzero((void *)objc_msgSend(*(id *)(a1 + 64), "contents"), objc_msgSend(*(id *)(a1 + 64), "length"));
  objc_msgSend(*(id *)(a1 + 24), "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", CFSTR("com.apple.abpk.2ddetectionpostprocessGPU.commandBuffer"));
  v14 = (unint64_t)(a2 * 0.125);
  v15 = (unint64_t)(a3 * 0.125);
  v35[0] = (a3 * 0.125);
  v35[1] = a3;
  v35[2] = IOSurfaceGetBytesPerRow(a5) >> 1;
  v35[3] = a2;
  objc_msgSend(v13, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLabel:", CFSTR("com.apple.abpk.2ddetectionpostprocessGPU.interpolation"));
  objc_msgSend(v16, "setComputePipelineState:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v16, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 48), 0, 0);
  objc_msgSend(v16, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 56), 0, 1);
  objc_msgSend(v16, "setBytes:length:atIndex:", &precomputedInterpolateBicubic, 96, 2);
  objc_msgSend(v16, "setBytes:length:atIndex:", v35, 16, 3);
  v17 = objc_msgSend(*(id *)(a1 + 32), "threadExecutionWidth");
  v18 = objc_msgSend(*(id *)(a1 + 32), "maxTotalThreadsPerThreadgroup");
  v19 = *(_QWORD *)(a1 + 8);
  v32 = scale * v14;
  v33 = scale * v15;
  v34 = v19;
  v29 = v17;
  v30 = v18 / v17;
  v31 = 1;
  objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", &v32, &v29);
  objc_msgSend(v16, "endEncoding");

  objc_msgSend(v13, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLabel:", CFSTR("com.apple.abpk.2ddetectionpostprocessGPU.maxfilter"));
  objc_msgSend(v20, "setComputePipelineState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v20, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 56), 0, 0);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 64), 0, 1);
  v21 = (void *)objc_msgSend(*(id *)(a1 + 16), "newBufferWithBytes:length:options:", a6, 4, 0);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", v21, 0, 2);
  v22 = (void *)objc_msgSend(*(id *)(a1 + 16), "newBufferWithBytes:length:options:", v35, 16, 0);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", v22, 0, 3);
  v23 = objc_msgSend(*(id *)(a1 + 40), "threadExecutionWidth");
  v24 = objc_msgSend(*(id *)(a1 + 40), "maxTotalThreadsPerThreadgroup");
  v25 = *(_QWORD *)(a1 + 8);
  v32 = scale * v14;
  v33 = scale * v15;
  v34 = v25;
  v29 = v23;
  v30 = v24 / v23;
  v31 = 1;
  objc_msgSend(v20, "dispatchThreads:threadsPerThreadgroup:", &v32, &v29);
  objc_msgSend(v20, "endEncoding");
  objc_msgSend(v13, "commit");
  objc_msgSend(v13, "waitUntilCompleted");
  v26 = objc_retainAutorelease(v21);
  memcpy(a6, (const void *)objc_msgSend(v26, "contents"), objc_msgSend(v26, "length"));
  v27 = objc_msgSend(*(id *)(a1 + 64), "contents");

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_intermediate, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_pipelineStateMaxFilter, 0);
  objc_storeStrong((id *)&self->_pipelineStateInterpolate, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
