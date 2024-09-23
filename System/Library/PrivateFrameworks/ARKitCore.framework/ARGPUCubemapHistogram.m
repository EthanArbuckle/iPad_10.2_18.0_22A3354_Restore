@implementation ARGPUCubemapHistogram

- (ARGPUCubemapHistogram)init
{
  ARGPUCubemapHistogram *v2;
  void *v3;
  uint64_t v4;
  MTLDevice *device;
  uint64_t v6;
  MTLCommandQueue *commandQueue;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  MTLDevice *v13;
  uint64_t v14;
  id v15;
  MTLComputePipelineState *cubemapHistogramPipelineState;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ARGPUCubemapHistogram *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)ARGPUCubemapHistogram;
  v2 = -[ARGPUCubemapHistogram init](&v23, sel_init);
  +[ARSharedGPUDevice sharedInstance](ARSharedGPUDevice, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = objc_claimAutoreleasedReturnValue();
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  v6 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  -[MTLCommandQueue setLabel:](v2->_commandQueue, "setLabel:", CFSTR("com.apple.arkit.cubemaphistogram.queue"));
  v2->_gpuFamilyAtleast4 = -[MTLDevice supportsFamily:](v2->_device, "supportsFamily:", 1004);
  ARKitCoreBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)-[MTLDevice newLibraryWithURL:error:](v2->_device, "newLibraryWithURL:error:", v9, 0);
  objc_msgSend(v10, "setLabel:", CFSTR("com.apple.arkit.cubemaphistogram.library"));
  if (v2->_gpuFamilyAtleast4)
    v11 = CFSTR("cubemap_color_histogram_lab");
  else
    v11 = CFSTR("cubemap_color_histogram_lab_views");
  v12 = (void *)objc_msgSend(v10, "newFunctionWithName:", v11);
  v13 = v2->_device;
  v22 = 0;
  v14 = -[MTLDevice newComputePipelineStateWithFunction:error:](v13, "newComputePipelineStateWithFunction:error:", v12, &v22);
  v15 = v22;
  cubemapHistogramPipelineState = v2->_cubemapHistogramPipelineState;
  v2->_cubemapHistogramPipelineState = (MTLComputePipelineState *)v14;

  if (!v2->_cubemapHistogramPipelineState)
  {
    if (_ARLogGeneral_onceToken_23 != -1)
      dispatch_once(&_ARLogGeneral_onceToken_23, &__block_literal_global_57);
    v17 = (void *)_ARLogGeneral_logObj_23;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_23, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v20;
      v26 = 2048;
      v27 = v2;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map histogram pipeline state, error %@", buf, 0x20u);

    }
  }

  return v2;
}

- (ARLabHistogram)colorHistogramForCubemap:(SEL)a3
{
  id v6;
  void *v7;
  MTLComputePipelineState *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  int32x2_t v26;
  uint64_t v27;
  float32x4_t v28;
  uint64_t v29;
  uint64_t v30;
  ARLabHistogram *result;
  _QWORD v32[3];
  unsigned int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[1024];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_cubemapHistogramPipelineState;
  objc_msgSend(v7, "computeCommandEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLabel:", CFSTR("com.apple.arkit.gpucubemaphistogram.cubemapcolorhistogram"));
  objc_msgSend(v9, "setComputePipelineState:", v8);
  bzero(v37, 0x400uLL);
  v10 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v37, 1024, 0);
  objc_msgSend(v10, "setLabel:", CFSTR("com.apple.arkit.cubemaphistogram.histogrambuffer"));
  objc_msgSend(v9, "setBuffer:offset:atIndex:", v10, 0, 0);
  v33 = 0;
  v11 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &v33, 4, 0);
  objc_msgSend(v11, "setLabel:", CFSTR("com.apple.arkit.cubemaphistogram.countbuffer"));
  objc_msgSend(v9, "setBuffer:offset:atIndex:", v11, 0, 1);
  if (self->_gpuFamilyAtleast4)
  {
    objc_msgSend(v9, "setTexture:atIndex:", v6, 0);
  }
  else
  {
    v12 = 0;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    do
    {
      v13 = objc_msgSend(v6, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v6, "pixelFormat"), 2, 0, 1, v12, 1);
      v14 = (void *)*((_QWORD *)&v34 + v12);
      *((_QWORD *)&v34 + v12) = v13;

      ++v12;
    }
    while (v12 != 6);
    objc_msgSend(v9, "setTextures:withRange:", &v34, 1, 6);
    for (i = 40; i != -8; i -= 8)

  }
  v16 = -[MTLComputePipelineState threadExecutionWidth](v8, "threadExecutionWidth");
  v17 = objc_msgSend(v6, "width");
  if (v16 >= v17)
    v16 = v17;
  v18 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v8, "maxTotalThreadsPerThreadgroup");
  v19 = v16;
  do
  {
    v20 = v19;
    v21 = v19 * v16;
    v19 >>= 1;
  }
  while (v21 > v18);
  v22 = (v16 + objc_msgSend(v6, "width") - 1) / v16;
  v23 = objc_msgSend(v6, "height");
  *(_QWORD *)&v34 = v22;
  *((_QWORD *)&v34 + 1) = (v20 + v23 - 1) / v20;
  *(_QWORD *)&v35 = 6;
  v32[0] = v16;
  v32[1] = v20;
  v32[2] = 1;
  objc_msgSend(v9, "dispatchThreadgroups:threadsPerThreadgroup:", &v34, v32);
  objc_msgSend(v9, "endEncoding");
  objc_msgSend(v7, "commit");
  objc_msgSend(v7, "waitUntilCompleted");
  v24 = objc_retainAutorelease(v11);
  objc_msgSend(v24, "contents");
  objc_msgSend(v24, "length");
  __memcpy_chk();
  v25 = objc_retainAutorelease(v10);
  objc_msgSend(v25, "contents");
  objc_msgSend(v25, "length");
  __memcpy_chk();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1[0][0][3] = 0u;
  *(_OWORD *)&retstr->var1[0][0][7] = 0u;
  *(_OWORD *)&retstr->var1[0][1][3] = 0u;
  *(_OWORD *)&retstr->var1[0][1][7] = 0u;
  *(_OWORD *)&retstr->var1[0][2][3] = 0u;
  *(_OWORD *)&retstr->var1[0][2][7] = 0u;
  *(_OWORD *)&retstr->var1[0][3][3] = 0u;
  *(_OWORD *)&retstr->var1[0][3][7] = 0u;
  *(_OWORD *)&retstr->var1[0][4][3] = 0u;
  *(_OWORD *)&retstr->var1[0][4][7] = 0u;
  *(_OWORD *)&retstr->var1[0][5][3] = 0u;
  *(_OWORD *)&retstr->var1[0][5][7] = 0u;
  *(_OWORD *)&retstr->var1[0][6][3] = 0u;
  *(_OWORD *)&retstr->var1[0][6][7] = 0u;
  *(_OWORD *)&retstr->var1[0][7][3] = 0u;
  *(_OWORD *)&retstr->var1[0][7][7] = 0u;
  *(_OWORD *)&retstr->var1[1][0][3] = 0u;
  *(_OWORD *)&retstr->var1[1][0][7] = 0u;
  *(_OWORD *)&retstr->var1[1][1][3] = 0u;
  *(_OWORD *)&retstr->var1[1][1][7] = 0u;
  *(_OWORD *)&retstr->var1[1][2][3] = 0u;
  *(_OWORD *)&retstr->var1[1][2][7] = 0u;
  *(_OWORD *)&retstr->var1[1][3][3] = 0u;
  *(_OWORD *)&retstr->var1[1][3][7] = 0u;
  *(_OWORD *)&retstr->var1[1][4][3] = 0u;
  *(_OWORD *)&retstr->var1[1][4][7] = 0u;
  *(_OWORD *)&retstr->var1[1][5][3] = 0u;
  *(_OWORD *)&retstr->var1[1][5][7] = 0u;
  *(_OWORD *)&retstr->var1[1][6][3] = 0u;
  *(_OWORD *)&retstr->var1[1][6][7] = 0u;
  *(_OWORD *)&retstr->var1[1][7][3] = 0u;
  ARLabHistogramCreate(retstr);
  if (v33)
  {
    v27 = 0;
    *(float *)v26.i32 = (float)v33;
    v28 = (float32x4_t)vdupq_lane_s32(v26, 0);
    do
    {
      *(float32x4_t *)&retstr->var1[0][0][v27] = vdivq_f32(vcvtq_f32_u32(*(uint32x4_t *)&v37[v27 * 4]), v28);
      v27 += 4;
    }
    while (v27 != 256);
  }
  v29 = objc_msgSend(v6, "width");
  v30 = objc_msgSend(v6, "height");
  retstr->var0 = (float)v33 / (float)((float)(unint64_t)(v30 * v29) * 6.0);

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubemapHistogramPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
