@implementation ARGPUSphericalBlur

- (ARGPUSphericalBlur)init
{
  ARGPUSphericalBlur *v2;
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
  MTLComputePipelineState *cubemapBlurPipelineState;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ARGPUSphericalBlur *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)ARGPUSphericalBlur;
  v2 = -[ARGPUSphericalBlur init](&v23, sel_init);
  +[ARSharedGPUDevice sharedInstance](ARSharedGPUDevice, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = objc_claimAutoreleasedReturnValue();
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  v6 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  -[MTLCommandQueue setLabel:](v2->_commandQueue, "setLabel:", CFSTR("com.apple.arkit.gpusphericalblur.queue"));
  v2->_gpuFamilyAtleast4 = -[MTLDevice supportsFamily:](v2->_device, "supportsFamily:", 1004);
  ARKitCoreBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)-[MTLDevice newLibraryWithURL:error:](v2->_device, "newLibraryWithURL:error:", v9, 0);
  objc_msgSend(v10, "setLabel:", CFSTR("com.apple.arkit.gpusphericalblur.library"));
  if (v2->_gpuFamilyAtleast4)
    v11 = CFSTR("blur_cubemap");
  else
    v11 = CFSTR("blur_cubemap_views");
  v12 = (void *)objc_msgSend(v10, "newFunctionWithName:", v11);
  v13 = v2->_device;
  v22 = 0;
  v14 = -[MTLDevice newComputePipelineStateWithFunction:error:](v13, "newComputePipelineStateWithFunction:error:", v12, &v22);
  v15 = v22;
  cubemapBlurPipelineState = v2->_cubemapBlurPipelineState;
  v2->_cubemapBlurPipelineState = (MTLComputePipelineState *)v14;

  if (!v2->_cubemapBlurPipelineState)
  {
    if (_ARLogGeneral_onceToken_1 != -1)
      dispatch_once(&_ARLogGeneral_onceToken_1, &__block_literal_global_6);
    v17 = (void *)_ARLogGeneral_logObj_1;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_1, OS_LOG_TYPE_ERROR))
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
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cubemap blur pipeline state, error %@", buf, 0x20u);

    }
  }

  return v2;
}

- (id)blurCubemapTexture:(float32x4_t)a3 roughness:(float32x4_t)a4 rotation:(uint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v31 = a3;
  v32 = a4;
  v30 = a2;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a7;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", objc_msgSend(v9, "pixelFormat"), objc_msgSend(v9, "width"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsage:", 23);
  v12 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:", v11);
  objc_msgSend(v12, "setLabel:", CFSTR("com.apple.arkit.gpusphericalblur.target"));
  objc_msgSend(*(id *)(a1 + 16), "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLabel:", CFSTR("com.apple.arkit.gpusphericalblur.cubemapblur"));
  objc_msgSend(v14, "setComputePipelineState:", *(_QWORD *)(a1 + 24));
  objc_msgSend(v14, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v10, 1);
  v15 = 0;
  v34 = xmmword_1B3BDFDC0;
  v35 = xmmword_1B3BDFDD0;
  v36 = xmmword_1B3BDFDE0;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  do
  {
    *(__int128 *)((char *)&v37 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v30, COERCE_FLOAT(*(__int128 *)((char *)&v34 + v15))), v31, *(float32x2_t *)((char *)&v34 + v15), 1), v32, *(float32x4_t *)((char *)&v34 + v15), 2);
    v15 += 16;
  }
  while (v15 != 48);
  v16 = 0;
  v34 = v37;
  v35 = v38;
  v36 = v39;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  do
  {
    *(__int128 *)((char *)&v37 + v16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, COERCE_FLOAT(*(__int128 *)((char *)&v34 + v16))), (float32x4_t)xmmword_1B3BDFDD0, *(float32x2_t *)((char *)&v34 + v16), 1), (float32x4_t)xmmword_1B3BDFDE0, *(float32x4_t *)((char *)&v34 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  v33[1] = DWORD2(v37);
  v33[3] = DWORD2(v38);
  v33[0] = v37;
  v33[2] = v38;
  v33[5] = DWORD2(v39);
  v33[4] = v39;
  objc_msgSend(v14, "setBytes:length:atIndex:", v33, 48, 0);
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v14, "setTexture:atIndex:", v12, 2);
  }
  else
  {
    v17 = 0;
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    do
    {
      v18 = objc_msgSend(v12, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v9, "pixelFormat", *(_OWORD *)&v30, *(_OWORD *)&v31, *(_OWORD *)&v32), 2, 0, 1, v17, 1);
      v19 = (void *)*((_QWORD *)&v37 + v17);
      *((_QWORD *)&v37 + v17) = v18;

      ++v17;
    }
    while (v17 != 6);
    objc_msgSend(v14, "setTextures:withRange:", &v37, 2, 6);
    for (i = 40; i != -8; i -= 8)

  }
  v21 = objc_msgSend(*(id *)(a1 + 24), "threadExecutionWidth", *(_OWORD *)&v30, *(_OWORD *)&v31, *(_OWORD *)&v32);
  v22 = objc_msgSend(v9, "width");
  if (v21 >= v22)
    v21 = v22;
  v23 = objc_msgSend(*(id *)(a1 + 24), "maxTotalThreadsPerThreadgroup");
  v24 = v21;
  do
  {
    v25 = v24;
    v26 = v24 * v21;
    v24 >>= 1;
  }
  while (v26 > v23);
  v27 = (v21 + objc_msgSend(v9, "width") - 1) / v21;
  v28 = objc_msgSend(v9, "height");
  *(_QWORD *)&v37 = v27;
  *((_QWORD *)&v37 + 1) = (v25 + v28 - 1) / v25;
  *(_QWORD *)&v38 = 6;
  *(_QWORD *)&v34 = v21;
  *((_QWORD *)&v34 + 1) = v25;
  *(_QWORD *)&v35 = 1;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v37, &v34);
  objc_msgSend(v14, "endEncoding");
  objc_msgSend(v13, "commit");
  objc_msgSend(v13, "waitUntilCompleted");

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubemapBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
