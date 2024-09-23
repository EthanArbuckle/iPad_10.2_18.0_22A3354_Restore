@implementation AR2DSkeletonDetectionPostProcessGPU

- (AR2DSkeletonDetectionPostProcessGPU)init
{
  AR2DSkeletonDetectionPostProcessGPU *v2;
  MTLDevice *v3;
  MTLDevice *device;
  uint64_t v5;
  MTLCommandQueue *commandQueue;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MTLComputePipelineState *pipelineStateInterpolate;
  void *v14;
  uint64_t v15;
  MTLComputePipelineState *pipelineStateMaxFilter;
  uint64_t v17;
  MTLBuffer *intermediate;
  uint64_t v19;
  MTLBuffer *output;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AR2DSkeletonDetectionPostProcessGPU;
  v2 = -[AR2DSkeletonDetectionPostProcessGPU init](&v22, sel_init);
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v2->_device;
  v2->_device = v3;

  v5 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v5;

  ARKitCoreBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    -[AR2DSkeletonDetectionPostProcessGPU init].cold.1();
  v9 = (void *)v8;
  v10 = (void *)-[MTLDevice newLibraryWithURL:error:](v2->_device, "newLibraryWithURL:error:", v8, 0);
  v11 = (void *)objc_msgSend(v10, "newFunctionWithName:", CFSTR("interpolateBicubic"));
  v12 = -[MTLDevice newComputePipelineStateWithFunction:error:](v2->_device, "newComputePipelineStateWithFunction:error:", v11, 0);
  pipelineStateInterpolate = v2->_pipelineStateInterpolate;
  v2->_pipelineStateInterpolate = (MTLComputePipelineState *)v12;

  v14 = (void *)objc_msgSend(v10, "newFunctionWithName:", CFSTR("maxFilter"));
  v15 = -[MTLDevice newComputePipelineStateWithFunction:error:](v2->_device, "newComputePipelineStateWithFunction:error:", v14, 0);
  pipelineStateMaxFilter = v2->_pipelineStateMaxFilter;
  v2->_pipelineStateMaxFilter = (MTLComputePipelineState *)v15;

  v17 = -[MTLDevice newBufferWithLength:options:](v2->_device, "newBufferWithLength:options:", 2 * width * height * scale * scale * nChannels + 16, 32);
  intermediate = v2->_intermediate;
  v2->_intermediate = (MTLBuffer *)v17;

  v19 = -[MTLDevice newBufferWithLength:options:](v2->_device, "newBufferWithLength:options:", 2 * width * height * scale * scale * nChannels + 16, 0);
  output = v2->_output;
  v2->_output = (MTLBuffer *)v19;

  return v2;
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
  v6.super_class = (Class)AR2DSkeletonDetectionPostProcessGPU;
  -[AR2DSkeletonDetectionPostProcessGPU dealloc](&v6, sel_dealloc);
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
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD v33[4];

  v11 = objc_msgSend(*(id *)(a1 + 8), "newBufferWithIOSurface:");
  v12 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v11;

  bzero((void *)objc_msgSend(*(id *)(a1 + 56), "contents"), objc_msgSend(*(id *)(a1 + 56), "length"));
  objc_msgSend(*(id *)(a1 + 16), "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (unint64_t)(a2 * 0.125);
  v15 = (unint64_t)(a3 * 0.125);
  v33[0] = (a3 * 0.125);
  v33[1] = a3;
  v33[2] = IOSurfaceGetBytesPerRow(a5) >> 1;
  v33[3] = a2;
  objc_msgSend(v13, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setComputePipelineState:", *(_QWORD *)(a1 + 24));
  objc_msgSend(v16, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(v16, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 48), 0, 1);
  objc_msgSend(v16, "setBytes:length:atIndex:", &precomputedInterpolateBicubic, 96, 2);
  objc_msgSend(v16, "setBytes:length:atIndex:", v33, 16, 3);
  v17 = objc_msgSend(*(id *)(a1 + 24), "threadExecutionWidth");
  v18 = objc_msgSend(*(id *)(a1 + 24), "maxTotalThreadsPerThreadgroup");
  v30 = scale * v14;
  v31 = scale * v15;
  v32 = nChannels;
  v27 = v17;
  v28 = v18 / v17;
  v29 = 1;
  objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", &v30, &v27);
  objc_msgSend(v16, "endEncoding");

  objc_msgSend(v13, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setComputePipelineState:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v19, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 48), 0, 0);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 56), 0, 1);
  v20 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithBytes:length:options:", a6, 4, 0);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v20, 0, 2);
  v21 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithBytes:length:options:", v33, 16, 0);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v21, 0, 3);
  v22 = objc_msgSend(*(id *)(a1 + 32), "threadExecutionWidth");
  v23 = objc_msgSend(*(id *)(a1 + 32), "maxTotalThreadsPerThreadgroup");
  v30 = scale * v14;
  v31 = scale * v15;
  v32 = nChannels;
  v27 = v22;
  v28 = v23 / v22;
  v29 = 1;
  objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", &v30, &v27);
  objc_msgSend(v19, "endEncoding");
  objc_msgSend(v13, "commit");
  objc_msgSend(v13, "waitUntilCompleted");
  v24 = objc_retainAutorelease(v20);
  memcpy(a6, (const void *)objc_msgSend(v24, "contents"), objc_msgSend(v24, "length"));
  v25 = objc_msgSend(*(id *)(a1 + 56), "contents");

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_intermediate, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_pipelineStateMaxFilter, 0);
  objc_storeStrong((id *)&self->_pipelineStateInterpolate, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)init
{
  __assert_rtn("-[AR2DSkeletonDetectionPostProcessGPU init]", "AR2DSkeletonDetectionPostProcessGPU.m", 50, "url != nil");
}

@end
