@implementation ARGPUCubemapProjector

+ (id)createCubemap:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 71, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsage:", 5);
  +[ARSharedGPUDevice sharedInstance](ARSharedGPUDevice, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newTextureWithDescriptor:", v3);

  return v6;
}

- (ARGPUCubemapProjector)init
{
  ARGPUCubemapProjector *v2;
  void *v3;
  uint64_t v4;
  MTLDevice *device;
  uint64_t v6;
  MTLCommandQueue *commandQueue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  MTLDevice *v15;
  uint64_t v16;
  id v17;
  MTLRenderPipelineState *cubemapPipelineStateSRGB_BGRA;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  MTLDevice *v24;
  uint64_t v25;
  id v26;
  MTLRenderPipelineState *cubemapPipelineStateSRGB_RGBA;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  MTLDevice *v34;
  uint64_t v35;
  id v36;
  MTLRenderPipelineState *cubemapPipelineStateHDR;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  id v41;
  uint64_t v42;
  MTLDepthStencilState *cubemapDepthState;
  void *v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  ARGPUCubemapProjector *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)ARGPUCubemapProjector;
  v2 = -[ARGPUCubemapProjector init](&v49, sel_init);
  +[ARSharedGPUDevice sharedInstance](ARSharedGPUDevice, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = objc_claimAutoreleasedReturnValue();
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  v6 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  -[MTLCommandQueue setLabel:](v2->_commandQueue, "setLabel:", CFSTR("com.apple.arkit.cubemapprojector.queue"));
  ARKitCoreBundle();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    __assert_rtn("-[ARGPUCubemapProjector init]", "ARGPUCubemapProjector.m", 53, "url != nil");
  v9 = (void *)-[MTLDevice newLibraryWithURL:error:](v2->_device, "newLibraryWithURL:error:", v8, 0);
  objc_msgSend(v9, "setLabel:", CFSTR("com.apple.arkit.cubemapprojector.library"));
  v10 = (void *)objc_msgSend(v9, "newFunctionWithName:", CFSTR("cubemapVertexShader"));
  v11 = (void *)objc_msgSend(v9, "newFunctionWithName:", CFSTR("cubemapFragmentShader"));
  v12 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  objc_msgSend(v12, "setLabel:", CFSTR("com.apple.arkit.cubemapprojector.srgbpipeline"));
  objc_msgSend(v12, "setVertexFunction:", v10);
  objc_msgSend(v12, "setFragmentFunction:", v11);
  objc_msgSend(v12, "colorAttachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPixelFormat:", 81);

  objc_msgSend(v12, "setDepthAttachmentPixelFormat:", 252);
  v15 = v2->_device;
  v48 = 0;
  v16 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](v15, "newRenderPipelineStateWithDescriptor:error:", v12, &v48);
  v17 = v48;
  cubemapPipelineStateSRGB_BGRA = v2->_cubemapPipelineStateSRGB_BGRA;
  v2->_cubemapPipelineStateSRGB_BGRA = (MTLRenderPipelineState *)v16;

  if (!v2->_cubemapPipelineStateSRGB_BGRA)
  {
    _ARLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v21;
      v52 = 2048;
      v53 = v2;
      v54 = 2112;
      v55 = v17;
      _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map srgb pipeline state, error %@", buf, 0x20u);

    }
    if (!v2->_cubemapPipelineStateSRGB_BGRA)
      __assert_rtn("-[ARGPUCubemapProjector init]", "ARGPUCubemapProjector.m", 78, "_cubemapPipelineStateSRGB_BGRA");
  }
  objc_msgSend(v12, "colorAttachments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPixelFormat:", 71);

  v24 = v2->_device;
  v47 = v17;
  v25 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](v24, "newRenderPipelineStateWithDescriptor:error:", v12, &v47);
  v26 = v47;

  cubemapPipelineStateSRGB_RGBA = v2->_cubemapPipelineStateSRGB_RGBA;
  v2->_cubemapPipelineStateSRGB_RGBA = (MTLRenderPipelineState *)v25;

  v28 = v26;
  if (!v2->_cubemapPipelineStateSRGB_RGBA)
  {
    _ARLogGeneral();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v31;
      v52 = 2048;
      v53 = v2;
      v54 = 2112;
      v55 = v28;
      _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map srgb pipeline state, error %@", buf, 0x20u);

    }
  }
  objc_msgSend(v12, "setLabel:", CFSTR("com.apple.arkit.cubemapprojector.hdrpipeline"));
  objc_msgSend(v12, "colorAttachments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPixelFormat:", 115);

  v34 = v2->_device;
  v46 = v28;
  v35 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](v34, "newRenderPipelineStateWithDescriptor:error:", v12, &v46);
  v36 = v46;

  cubemapPipelineStateHDR = v2->_cubemapPipelineStateHDR;
  v2->_cubemapPipelineStateHDR = (MTLRenderPipelineState *)v35;

  if (!v2->_cubemapPipelineStateHDR)
  {
    _ARLogGeneral();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v40;
      v52 = 2048;
      v53 = v2;
      v54 = 2112;
      v55 = v36;
      _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create cube map HDR pipeline state, error %@", buf, 0x20u);

    }
    if (!v2->_cubemapPipelineStateHDR)
      __assert_rtn("-[ARGPUCubemapProjector init]", "ARGPUCubemapProjector.m", 95, "_cubemapPipelineStateHDR");
  }
  v41 = objc_alloc_init(MEMORY[0x1E0CC6A88]);
  objc_msgSend(v41, "setDepthCompareFunction:", 1);
  objc_msgSend(v41, "setDepthWriteEnabled:", 1);
  v42 = -[MTLDevice newDepthStencilStateWithDescriptor:](v2->_device, "newDepthStencilStateWithDescriptor:", v41);
  cubemapDepthState = v2->_cubemapDepthState;
  v2->_cubemapDepthState = (MTLDepthStencilState *)v42;

  return v2;
}

- (void)projectToCube:(float32x4_t)a3 transformWorldFromCube:(float32x4_t)a4 meshes:(float32x4_t)a5 blend:(uint64_t)a6
{
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int8x16_t v19;
  float32x4_t v20;
  int8x16_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  int8x16_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  simd_float4x4 *v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  unint64_t v58;
  unint64_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  __int128 v82;
  __int128 v84;
  __int128 v86;
  __int128 v88;
  simd_float4x4 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  char v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  simd_float4x4 v99;
  _BYTE v100[128];
  simd_float4x4 v101[6];
  uint64_t v102;
  simd_float4x4 v103;
  simd_float4x4 v104;
  simd_float4x4 v105;
  simd_float4x4 v106;
  simd_float4x4 v107;

  v102 = *MEMORY[0x1E0C80C00];
  v77 = a7;
  v71 = a8;
  v11 = 0;
  v94 = a9;
  v95 = xmmword_1B3BDFF70;
  v96 = xmmword_1B3BDFDD0;
  v97 = xmmword_1B3BE00D0;
  v98 = xmmword_1B3BDFD50;
  do
  {
    v99.columns[v11 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v95 + v11))), a3, *(float32x2_t *)((char *)&v95 + v11), 1), a4, *(float32x4_t *)((char *)&v95 + v11), 2), a5, *(float32x4_t *)((char *)&v95 + v11), 3);
    v11 += 16;
  }
  while (v11 != 64);
  v103 = __invert_f4(v99);
  v12 = 0;
  v101[0] = v103;
  v95 = xmmword_1B3BDFDE0;
  v96 = xmmword_1B3BDFDD0;
  v97 = xmmword_1B3BDFDC0;
  v98 = xmmword_1B3BDFD50;
  do
  {
    v99.columns[v12 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v95 + v12))), a3, *(float32x2_t *)((char *)&v95 + v12), 1), a4, *(float32x4_t *)((char *)&v95 + v12), 2), a5, *(float32x4_t *)((char *)&v95 + v12), 3);
    v12 += 16;
  }
  while (v12 != 64);
  v104 = __invert_f4(v99);
  v13 = 0;
  v101[1] = v104;
  v95 = xmmword_1B3BDFDC0;
  v96 = xmmword_1B3BDFF70;
  v97 = xmmword_1B3BE00E0;
  v98 = xmmword_1B3BDFD50;
  do
  {
    v99.columns[v13 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v95 + v13))), a3, *(float32x2_t *)((char *)&v95 + v13), 1), a4, *(float32x4_t *)((char *)&v95 + v13), 2), a5, *(float32x4_t *)((char *)&v95 + v13), 3);
    v13 += 16;
  }
  while (v13 != 64);
  v105 = __invert_f4(v99);
  v14 = 0;
  v101[2] = v105;
  v95 = xmmword_1B3BDFDC0;
  v96 = xmmword_1B3BDFDE0;
  v97 = xmmword_1B3BDFDD0;
  v98 = xmmword_1B3BDFD50;
  do
  {
    v99.columns[v14 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v95 + v14))), a3, *(float32x2_t *)((char *)&v95 + v14), 1), a4, *(float32x4_t *)((char *)&v95 + v14), 2), a5, *(float32x4_t *)((char *)&v95 + v14), 3);
    v14 += 16;
  }
  while (v14 != 64);
  v106 = __invert_f4(v99);
  v15 = 0;
  v101[3] = v106;
  v95 = xmmword_1B3BDFDC0;
  v96 = xmmword_1B3BDFDD0;
  v97 = xmmword_1B3BDFF70;
  v98 = xmmword_1B3BDFD50;
  do
  {
    v99.columns[v15 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v95 + v15))), a3, *(float32x2_t *)((char *)&v95 + v15), 1), a4, *(float32x4_t *)((char *)&v95 + v15), 2), a5, *(float32x4_t *)((char *)&v95 + v15), 3);
    v15 += 16;
  }
  while (v15 != 64);
  v107 = __invert_f4(v99);
  v16 = 0;
  v101[4] = v107;
  v95 = xmmword_1B3BE00D0;
  v96 = xmmword_1B3BDFDD0;
  v97 = xmmword_1B3BDFDE0;
  v98 = xmmword_1B3BDFD50;
  do
  {
    v99.columns[v16 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v95 + v16))), a3, *(float32x2_t *)((char *)&v95 + v16), 1), a4, *(float32x4_t *)((char *)&v95 + v16), 2), a5, *(float32x4_t *)((char *)&v95 + v16), 3);
    v16 += 16;
  }
  while (v16 != 64);
  v101[5] = __invert_f4(v99);
  v17 = objc_msgSend(v77, "width");
  v72 = objc_msgSend(v77, "pixelFormat");
  objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 252, v17, 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setUsage:", 4);
  v73 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:", v69);
  objc_msgSend(v73, "setLabel:", CFSTR("com.apple.arkit.cubemapprojector.depthtexture"));
  objc_msgSend(*(id *)(a1 + 16), "commandBuffer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setLabel:", CFSTR("com.apple.arkit.cubemapprojector.commandbuffer"));
  v18 = 0;
  v19 = (int8x16_t)a4;
  v20 = (float32x4_t)vextq_s8(v19, v19, 8uLL);
  v21 = (int8x16_t)a5;
  v22 = (float32x4_t)vextq_s8(v21, v21, 0xCuLL);
  v23 = (float32x4_t)vextq_s8(v19, v19, 0xCuLL);
  v24 = (float32x4_t)vextq_s8(v21, v21, 8uLL);
  v25 = (float32x4_t)vextq_s8(v21, v21, 4uLL);
  v26 = (float32x4_t)vextq_s8(v19, v19, 4uLL);
  v27 = (int8x16_t)vmulq_f32(a2, vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)a3, (int8x16_t)a3, 8uLL), vmlaq_f32(vmulq_f32(v22, vnegq_f32(v26)), v25, v23)), vmlaq_f32(vmulq_f32(v24, vnegq_f32(v23)), v22, v20), (float32x4_t)vextq_s8((int8x16_t)a3, (int8x16_t)a3, 4uLL)), vmlaq_f32(vmulq_f32(v25, vnegq_f32(v20)), v24, v26), (float32x4_t)vextq_s8((int8x16_t)a3, (int8x16_t)a3, 0xCuLL)));
  v20.i64[0] = vextq_s8(v27, v27, 8uLL).u64[0];
  if (vaddv_f32(vsub_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v27.i8, *(int32x2_t *)v20.f32), (float32x2_t)vzip2_s32(*(int32x2_t *)v27.i8, *(int32x2_t *)v20.f32))) <= 0.0)v28 = 1;
  else
    v28 = 2;
  v70 = v28;
  do
  {
    v78 = (void *)objc_msgSend(v77, "newTextureViewWithPixelFormat:textureType:levels:slices:", v72, 2, 0, 1, v18, 1);
    v76 = v18;
    v79 = (void *)objc_msgSend(v73, "newTextureViewWithPixelFormat:textureType:levels:slices:", 252, 2, 0, 1, v18, 1);
    objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "colorAttachments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTexture:", v78);

    if (v94)
      v31 = 1;
    else
      v31 = 2;
    objc_msgSend(v80, "colorAttachments");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLoadAction:", v31);

    objc_msgSend(v80, "colorAttachments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setStoreAction:", 1);

    objc_msgSend(v80, "colorAttachments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    objc_msgSend(v80, "depthAttachment");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTexture:", v79);

    objc_msgSend(v80, "depthAttachment");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setLoadAction:", 2);

    objc_msgSend(v80, "depthAttachment");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setStoreAction:", 0);

    objc_msgSend(v74, "renderCommandEncoderWithDescriptor:", v80);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLabel:", CFSTR("com.apple.arkit.cubemapprojector.renderencoder"));
    objc_msgSend(v41, "setCullMode:", v70);
    v42 = objc_msgSend(v77, "pixelFormat");
    v43 = (_QWORD *)(a1 + 24);
    if (v42 != 81)
    {
      v44 = objc_msgSend(v77, "pixelFormat");
      v45 = 40;
      if (v44 == 71)
        v45 = 32;
      v43 = (_QWORD *)(a1 + v45);
    }
    objc_msgSend(v41, "setRenderPipelineState:", *v43);
    objc_msgSend(v41, "setDepthStencilState:", *(_QWORD *)(a1 + 48));
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v46 = v71;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v91;
      v49 = &v101[v76];
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v91 != v48)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v51, "vertexBuffer");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setVertexBuffer:offset:atIndex:", v52, 0, 0);

          objc_msgSend(v51, "uvBuffer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setVertexBuffer:offset:atIndex:", v53, 0, 1);

          memset(&v89, 0, sizeof(v89));
          v86 = (__int128)v49->columns[1];
          v88 = (__int128)v49->columns[0];
          v82 = (__int128)v49->columns[3];
          v84 = (__int128)v49->columns[2];
          objc_msgSend(v51, "transform_world_from_primitive");
          v58 = 0;
          v95 = v88;
          v96 = v86;
          v97 = v84;
          v98 = v82;
          do
          {
            v99.columns[v58 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, COERCE_FLOAT(*(__int128 *)((char *)&v95 + v58))), (float32x4_t)xmmword_1B3BDFDD0, *(float32x2_t *)((char *)&v95 + v58), 1), (float32x4_t)xmmword_1B3C07D70, *(float32x4_t *)((char *)&v95 + v58), 2), (float32x4_t)xmmword_1B3C07D80, *(float32x4_t *)((char *)&v95 + v58), 3);
            v58 += 16;
          }
          while (v58 != 64);
          v59 = 0;
          v60 = (float32x4_t)v99.columns[0];
          v61 = (float32x4_t)v99.columns[1];
          v62 = (float32x4_t)v99.columns[2];
          v63 = (float32x4_t)v99.columns[3];
          v95 = v54;
          v96 = v55;
          v97 = v56;
          v98 = v57;
          do
          {
            v99.columns[v59 / 0x10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, COERCE_FLOAT(*(__int128 *)((char *)&v95 + v59))), v61, *(float32x2_t *)((char *)&v95 + v59), 1), v62, *(float32x4_t *)((char *)&v95 + v59), 2), v63, *(float32x4_t *)((char *)&v95 + v59), 3);
            v59 += 16;
          }
          while (v59 != 64);
          v89 = v99;
          objc_msgSend(v41, "setVertexBytes:length:atIndex:", &v89, 64, 2);
          objc_msgSend(v41, "setFragmentBytes:length:atIndex:", &v94, 1, 0);
          objc_msgSend(v51, "texture");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setFragmentTexture:atIndex:", v64, 0);

          v65 = objc_msgSend(v51, "nIndices");
          objc_msgSend(v51, "indexBuffer");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v65, 1, v66, 0);

        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
      }
      while (v47);
    }

    objc_msgSend(v41, "endEncoding");
    v18 = v76 + 1;
  }
  while (v76 != 5);
  v67 = v74;
  if ((unint64_t)objc_msgSend(v77, "mipmapLevelCount") >= 2)
  {
    objc_msgSend(v74, "blitCommandEncoder");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "generateMipmapsForTexture:", v77);
    objc_msgSend(v68, "endEncoding");

    v67 = v74;
  }
  objc_msgSend(v67, "commit");
  objc_msgSend(v67, "waitUntilCompleted");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubemapDepthState, 0);
  objc_storeStrong((id *)&self->_cubemapPipelineStateHDR, 0);
  objc_storeStrong((id *)&self->_cubemapPipelineStateSRGB_RGBA, 0);
  objc_storeStrong((id *)&self->_cubemapPipelineStateSRGB_BGRA, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
