@implementation ARGPUCubemapConverter

- (ARGPUCubemapConverter)init
{
  ARGPUCubemapConverter *v2;
  void *v3;
  uint64_t v4;
  MTLDevice *device;
  uint64_t v6;
  MTLCommandQueue *commandQueue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTLDevice *v12;
  uint64_t v13;
  id v14;
  MTLComputePipelineState *cubemapToLatLongPipelineState;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  MTLDevice *v21;
  uint64_t v22;
  id v23;
  MTLComputePipelineState *latLongToCubemapPipelineState;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  ARGPUCubemapConverter *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)ARGPUCubemapConverter;
  v2 = -[ARGPUCubemapConverter init](&v31, sel_init);
  +[ARSharedGPUDevice sharedInstance](ARSharedGPUDevice, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = objc_claimAutoreleasedReturnValue();
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  v6 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  -[MTLCommandQueue setLabel:](v2->_commandQueue, "setLabel:", CFSTR("com.apple.arkit.cubemapconverter.queue"));
  v2->_gpuFamilyAtleast4 = -[MTLDevice supportsFamily:](v2->_device, "supportsFamily:", 1004);
  ARKitCoreBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)-[MTLDevice newLibraryWithURL:error:](v2->_device, "newLibraryWithURL:error:", v9, 0);
  objc_msgSend(v10, "setLabel:", CFSTR("com.apple.cubemapconverter.library"));
  v11 = (void *)objc_msgSend(v10, "newFunctionWithName:", CFSTR("compute_latlong_from_cubemap"));
  v12 = v2->_device;
  v30 = 0;
  v13 = -[MTLDevice newComputePipelineStateWithFunction:error:](v12, "newComputePipelineStateWithFunction:error:", v11, &v30);
  v14 = v30;
  cubemapToLatLongPipelineState = v2->_cubemapToLatLongPipelineState;
  v2->_cubemapToLatLongPipelineState = (MTLComputePipelineState *)v13;

  if (!v2->_cubemapToLatLongPipelineState)
  {
    _ARLogGeneral_20();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v18;
      v34 = 2048;
      v35 = v2;
      v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map conversion pipeline state, error %@", buf, 0x20u);

    }
  }

  if (v2->_gpuFamilyAtleast4)
    v19 = CFSTR("compute_cubemap_from_latlong");
  else
    v19 = CFSTR("compute_cubemap_from_latlong_views");
  v20 = (void *)objc_msgSend(v10, "newFunctionWithName:", v19);
  v21 = v2->_device;
  v29 = 0;
  v22 = -[MTLDevice newComputePipelineStateWithFunction:error:](v21, "newComputePipelineStateWithFunction:error:", v20, &v29);
  v23 = v29;
  latLongToCubemapPipelineState = v2->_latLongToCubemapPipelineState;
  v2->_latLongToCubemapPipelineState = (MTLComputePipelineState *)v22;

  if (!v2->_latLongToCubemapPipelineState)
  {
    _ARLogGeneral_20();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v27;
      v34 = 2048;
      v35 = v2;
      v36 = 2112;
      v37 = v23;
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map conversion pipeline state, error %@", buf, 0x20u);

    }
  }

  return v2;
}

- (id)equirectangularTextureFromCubemapTexture:(float32x4_t)a3 rotation:(float32x4_t)a4 width:(uint64_t)a5 height:(void *)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int64x2_t v27;
  __int128 v28;
  __int128 v29;
  int64x2_t v30;
  __int128 v31;
  __int128 v32;

  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v11, "pixelFormat"), a7, a8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsage:", 3);
  v13 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:", v12);
  objc_msgSend(v13, "setLabel:", CFSTR("com.apple.arkit.cubemapconverter.latlongtexture"));
  objc_msgSend(*(id *)(a1 + 16), "commandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLabel:", CFSTR("com.apple.arkit.gpucubemapconverter.computelatlong"));
  objc_msgSend(v15, "setComputePipelineState:", *(_QWORD *)(a1 + 24));
  v16 = 0;
  v27 = (int64x2_t)xmmword_1B3BDFDC0;
  v28 = xmmword_1B3BDFDD0;
  v29 = xmmword_1B3BDFDE0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v30 + v16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)((char *)&v27 + v16))), a3, *(float32x2_t *)&v27.i8[v16], 1), a4, *(float32x4_t *)((char *)&v27 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  v17 = 0;
  v27 = v30;
  v28 = v31;
  v29 = v32;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v30 + v17) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, COERCE_FLOAT(*(_OWORD *)((char *)&v27 + v17))), (float32x4_t)xmmword_1B3BDFDD0, *(float32x2_t *)&v27.i8[v17], 1), (float32x4_t)xmmword_1B3BDFDE0, *(float32x4_t *)((char *)&v27 + v17), 2);
    v17 += 16;
  }
  while (v17 != 48);
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  DWORD2(v24) = v30.i32[2];
  DWORD2(v25) = DWORD2(v31);
  *(_QWORD *)&v24 = v30.i64[0];
  *(_QWORD *)&v25 = v31;
  DWORD2(v26) = DWORD2(v32);
  *(_QWORD *)&v26 = v32;
  objc_msgSend(v15, "setBytes:length:atIndex:", &v24, 48, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v13, 1);
  v18 = objc_msgSend(v12, "width");
  v19 = objc_msgSend(v12, "height");
  v30.i64[0] = v18;
  v30.i64[1] = v19;
  *(_QWORD *)&v31 = 1;
  v27 = vdupq_n_s64(1uLL);
  *(_QWORD *)&v28 = 1;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", &v30, &v27);
  objc_msgSend(v15, "endEncoding");
  objc_msgSend(v14, "commit");
  objc_msgSend(v14, "waitUntilCompleted");

  return v13;
}

- (id)cubemapTextureFromEquirectangularTexture:(__n128)a3 rotation:(__n128)a4 size:(uint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  float32x4_t v32;
  float32x4_t v34;
  float32x4_t v36;
  _QWORD v37[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = v9;
  if (a7 >= 0x800)
    a7 = 2048;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", objc_msgSend(v9, "pixelFormat", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4), a7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsage:", 23);
  v12 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:", v11);
  objc_msgSend(v12, "setLabel:", CFSTR("com.apple.arkit.cubemapconverter.cubemaptexture"));
  objc_msgSend(*(id *)(a1 + 16), "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v13, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setComputePipelineState:", v14);
  v16 = 0;
  v38 = xmmword_1B3BDFDC0;
  v39 = xmmword_1B3BDFDD0;
  v40 = xmmword_1B3BDFDE0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  do
  {
    *(__int128 *)((char *)&v41 + v16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(*(__int128 *)((char *)&v38 + v16))), v34, *(float32x2_t *)((char *)&v38 + v16), 1), v36, *(float32x4_t *)((char *)&v38 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  v17 = 0;
  v38 = v41;
  v39 = v42;
  v40 = v43;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  do
  {
    *(__int128 *)((char *)&v41 + v17) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, COERCE_FLOAT(*(__int128 *)((char *)&v38 + v17))), (float32x4_t)xmmword_1B3BDFDD0, *(float32x2_t *)((char *)&v38 + v17), 1), (float32x4_t)xmmword_1B3BDFDE0, *(float32x4_t *)((char *)&v38 + v17), 2);
    v17 += 16;
  }
  while (v17 != 48);
  v37[1] = DWORD2(v41);
  v37[3] = DWORD2(v42);
  v37[0] = v41;
  v37[2] = v42;
  v37[5] = DWORD2(v43);
  v37[4] = v43;
  objc_msgSend(v15, "setBytes:length:atIndex:", v37, 48, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v10, 0);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v15, "setTexture:atIndex:", v12, 1);
  }
  else
  {
    v18 = 0;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    do
    {
      v19 = objc_msgSend(v12, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v12, "pixelFormat"), 2, 0, 1, v18, 1);
      v20 = (void *)*((_QWORD *)&v41 + v18);
      *((_QWORD *)&v41 + v18) = v19;

      ++v18;
    }
    while (v18 != 6);
    objc_msgSend(v15, "setTextures:withRange:", &v41, 1, 6);
    for (i = 40; i != -8; i -= 8)

  }
  v22 = objc_msgSend(v14, "threadExecutionWidth");
  v23 = objc_msgSend(v12, "width");
  if (v22 >= v23)
    v22 = v23;
  v24 = objc_msgSend(v14, "maxTotalThreadsPerThreadgroup");
  v25 = v22;
  do
  {
    v26 = v25;
    v27 = v25 * v22;
    v25 >>= 1;
  }
  while (v27 > v24);
  v28 = (v22 + objc_msgSend(v12, "width") - 1) / v22;
  v29 = objc_msgSend(v12, "height");
  *(_QWORD *)&v41 = v28;
  *((_QWORD *)&v41 + 1) = (v26 + v29 - 1) / v26;
  *(_QWORD *)&v42 = 6;
  *(_QWORD *)&v38 = v22;
  *((_QWORD *)&v38 + 1) = v26;
  *(_QWORD *)&v39 = 1;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", &v41, &v38);
  objc_msgSend(v15, "endEncoding");
  objc_msgSend(v13, "commit");
  objc_msgSend(v13, "waitUntilCompleted");

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latLongToCubemapPipelineState, 0);
  objc_storeStrong((id *)&self->_cubemapToLatLongPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
