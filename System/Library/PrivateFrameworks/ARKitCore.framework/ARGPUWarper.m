@implementation ARGPUWarper

- (ARGPUWarper)init
{
  ARGPUWarper *v2;
  void *v3;
  uint64_t v4;
  MTLDevice *device;
  uint64_t v6;
  MTLCommandQueue *commandQueue;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  MTLDevice *v34;
  uint64_t v35;
  id v36;
  MTLRenderPipelineState *homographyPipelineState;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v42;
  id v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  ARGPUWarper *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)ARGPUWarper;
  v2 = -[ARGPUWarper init](&v44, sel_init);
  +[ARSharedGPUDevice sharedInstance](ARSharedGPUDevice, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = objc_claimAutoreleasedReturnValue();
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  v6 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  -[MTLCommandQueue setLabel:](v2->_commandQueue, "setLabel:", CFSTR("com.apple.arkit.gpuwarper.queue"));
  ARKitCoreBundle();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    __assert_rtn("-[ARGPUWarper init]", "ARGPUWarper.mm", 47, "url != nil");
  v9 = (void *)-[MTLDevice newLibraryWithURL:error:](v2->_device, "newLibraryWithURL:error:", v8, 0);
  v10 = objc_alloc_init(MEMORY[0x1E0CC6BD8]);
  objc_msgSend(v10, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFormat:", 29);

  objc_msgSend(v10, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOffset:", 0);

  objc_msgSend(v10, "attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBufferIndex:", 1);

  objc_msgSend(v10, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFormat:", 29);

  objc_msgSend(v10, "attributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOffset:", 8);

  objc_msgSend(v10, "attributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBufferIndex:", 1);

  objc_msgSend(v10, "layouts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setStride:", 16);

  objc_msgSend(v10, "layouts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setStepRate:", 1);

  objc_msgSend(v10, "layouts");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setStepFunction:", 1);

  v29 = (void *)objc_msgSend(v9, "newFunctionWithName:", CFSTR("homgraphyVertexShader"));
  v30 = (void *)objc_msgSend(v9, "newFunctionWithName:", CFSTR("homographyFragmentShader"));
  v31 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  objc_msgSend(v31, "setLabel:", CFSTR("com.apple.arkit.homographypipeline"));
  objc_msgSend(v31, "setVertexFunction:", v29);
  objc_msgSend(v31, "setVertexDescriptor:", v10);
  objc_msgSend(v31, "setFragmentFunction:", v30);
  objc_msgSend(v31, "colorAttachments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPixelFormat:", 81);

  v34 = v2->_device;
  v43 = 0;
  v35 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](v34, "newRenderPipelineStateWithDescriptor:error:", v31, &v43);
  v36 = v43;
  homographyPipelineState = v2->_homographyPipelineState;
  v2->_homographyPipelineState = (MTLRenderPipelineState *)v35;

  if (!v2->_homographyPipelineState)
  {
    if (_ARLogGeneral(void)::onceToken != -1)
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_62);
    v38 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v40;
      v47 = 2048;
      v48 = v2;
      v49 = 2112;
      v50 = v36;
      _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create homography pipeline state, error %@", buf, 0x20u);

    }
    if (!v2->_homographyPipelineState)
      __assert_rtn("-[ARGPUWarper init]", "ARGPUWarper.mm", 85, "_homographyPipelineState");
  }

  return v2;
}

- (void)warpCameraImage:(simd_float3)a3 withExposureOffset:(simd_float3)a4 withCameraIntrinsics:(simd_float3)a5 withCameraTransform:(simd_float4)a6 toPlane:(simd_float4)a7 withLoadAction:(simd_float4)a8 synchronous:(simd_float4)a9
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  size_t Width;
  void *v31;
  void *v32;
  void *v33;
  CVBufferRef v34;
  void *v35;
  size_t v36;
  size_t Height;
  uint64_t v38;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t i;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  __int32 v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  float32_t v60;
  simd_float4x4 v61;
  float32x4_t v62;
  __int128 v63;
  __int128 v64;
  _OWORD v65[2];
  int v66;
  uint64_t v67;
  int v68;
  _OWORD v69[2];
  __int128 v70;
  _BYTE v71[36];
  _DWORD v72[4];
  _DWORD v73[4];
  _DWORD v74[4];
  _DWORD v75[4];
  _OWORD v76[3];
  simd_float4x4 v77;
  _BYTE v78[64];
  _QWORD v79[5];
  simd_float3x3 v80;
  _BYTE *v81;
  simd_float4x4 *v82;
  _QWORD v83[10];

  v61.columns[2] = a8;
  v61.columns[3] = a9;
  v61.columns[0] = a6;
  v61.columns[1] = a7;
  v83[8] = *MEMORY[0x1E0C80C00];
  v80.columns[0] = a3;
  v80.columns[1] = a4;
  v80.columns[2] = a5;
  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "colorAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTexture:", *(_QWORD *)(a12 + 216));

  objc_msgSend(v20, "colorAttachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLoadAction:", a13);

  objc_msgSend(v20, "colorAttachments");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v20, "colorAttachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setStoreAction:", 1);

  v29 = (void *)MEMORY[0x1E0CC6BB0];
  Width = CVPixelBufferGetWidth(a11);
  objc_msgSend(v29, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 520, Width, CVPixelBufferGetHeight(a11), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:iosurface:plane:", v31, CVPixelBufferGetIOSurface(a11), 0);
  objc_msgSend(*(id *)(a1 + 16), "commandBuffer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLabel:", CFSTR("com.apple.arkit.gpuwarper.cameratoplanecommandbuffer"));
  v34 = CVBufferRetain(a11);
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __126__ARGPUWarper_warpCameraImage_withExposureOffset_withCameraIntrinsics_withCameraTransform_toPlane_withLoadAction_synchronous___block_invoke;
  v79[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
  v79[4] = v34;
  objc_msgSend(v33, "addCompletedHandler:", v79);
  objc_msgSend(v33, "renderCommandEncoderWithDescriptor:", v20);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLabel:", CFSTR("com.apple.arkit.gpuwarper.cameratoplanerenderencoder"));
  objc_msgSend(v35, "setCullMode:", 0);
  objc_msgSend(v35, "setRenderPipelineState:", *(_QWORD *)(a1 + 24));
  v36 = CVPixelBufferGetWidth(a11);
  Height = CVPixelBufferGetHeight(a11);
  *(float *)&v38 = (float)v36;
  v83[0] = 0;
  v83[1] = 0x3F80000000000000;
  v83[2] = COERCE_UNSIGNED_INT((float)v36);
  __asm { FMOV            V2.2S, #1.0 }
  LODWORD(v44) = 0;
  *((float *)&v44 + 1) = (float)Height;
  v83[3] = _D2;
  v83[4] = v44;
  v83[5] = 0;
  *((float *)&v38 + 1) = (float)Height;
  v83[6] = v38;
  v83[7] = 1065353216;
  objc_msgSend(v35, "setVertexBytes:length:atIndex:", v83, 64, 1);
  v77 = __invert_f4(v61);
  convert(&v77, (uint64_t)v78);
  convert((const simd_float4x4 *)(a12 + 32), (uint64_t)&v77);
  v76[0] = xmmword_1B3C07E80;
  v76[1] = xmmword_1B3C07E90;
  v76[2] = xmmword_1B3C07EA0;
  v46 = *(_OWORD *)(a12 + 96);
  v45 = *(_OWORD *)(a12 + 112);
  v72[0] = v45;
  v72[2] = DWORD2(v46);
  v72[1] = 0;
  v72[3] = 1065353216;
  v73[0] = v46;
  v73[2] = DWORD2(v46);
  v73[1] = 0;
  v73[3] = 1065353216;
  v74[0] = v46;
  v74[2] = DWORD2(v45);
  v74[1] = 0;
  v74[3] = 1065353216;
  v75[0] = v45;
  v75[2] = DWORD2(v45);
  v75[1] = 0;
  v75[3] = 1065353216;
  convert(&v80, (uint64_t)v71);
  for (i = 24; i != 36; i += 4)
    *(float *)&v71[i] = -*(float *)&v71[i];
  v70 = 0u;
  memset(v69, 0, sizeof(v69));
  v81 = v78;
  v82 = &v77;
  *(_QWORD *)&v65[0] = &v81;
  *((_QWORD *)&v65[0] + 1) = v72;
  v62 = 0uLL;
  v48 = cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>(&v62, (uint64_t)v65);
  dehomogenize((float32x2_t *)&v62, (float32x2_t *)&v81, v48);
  *(_QWORD *)&v65[0] = v71;
  *((_QWORD *)&v65[0] + 1) = &v81;
  v67 = 0;
  v68 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::Matrix<float,3u,3u,false>,cva::Matrix<float,3u,1u,false>>((uint64_t)&v67, (uint64_t *)v65);
  *(_QWORD *)&v69[0] = v67;
  DWORD2(v69[0]) = v68;
  v81 = v78;
  v82 = &v77;
  *(_QWORD *)&v65[0] = &v81;
  *((_QWORD *)&v65[0] + 1) = v73;
  v62 = 0uLL;
  v49 = cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>(&v62, (uint64_t)v65);
  dehomogenize((float32x2_t *)&v62, (float32x2_t *)&v81, v49);
  *(_QWORD *)&v65[0] = v71;
  *((_QWORD *)&v65[0] + 1) = &v81;
  v67 = 0;
  v68 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::Matrix<float,3u,3u,false>,cva::Matrix<float,3u,1u,false>>((uint64_t)&v67, (uint64_t *)v65);
  *(_QWORD *)((char *)v69 + 12) = v67;
  DWORD1(v69[1]) = v68;
  v81 = v78;
  v82 = &v77;
  *(_QWORD *)&v65[0] = &v81;
  *((_QWORD *)&v65[0] + 1) = v74;
  v62 = 0uLL;
  v50 = cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>(&v62, (uint64_t)v65);
  dehomogenize((float32x2_t *)&v62, (float32x2_t *)&v81, v50);
  *(_QWORD *)&v65[0] = v71;
  *((_QWORD *)&v65[0] + 1) = &v81;
  v67 = 0;
  v68 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::Matrix<float,3u,3u,false>,cva::Matrix<float,3u,1u,false>>((uint64_t)&v67, (uint64_t *)v65);
  *((_QWORD *)&v69[1] + 1) = v67;
  LODWORD(v70) = v68;
  v81 = v78;
  v82 = &v77;
  *(_QWORD *)&v65[0] = &v81;
  *((_QWORD *)&v65[0] + 1) = v75;
  v62 = 0uLL;
  v51 = cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>(&v62, (uint64_t)v65);
  dehomogenize((float32x2_t *)&v62, (float32x2_t *)&v81, v51);
  *(_QWORD *)&v65[0] = v71;
  *((_QWORD *)&v65[0] + 1) = &v81;
  v67 = 0;
  v68 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::Matrix<float,3u,3u,false>,cva::Matrix<float,3u,1u,false>>((uint64_t)&v67, (uint64_t *)v65);
  *(_QWORD *)((char *)&v70 + 4) = v67;
  HIDWORD(v70) = v68;
  v66 = 0;
  memset(v65, 0, sizeof(v65));
  computeHomography((float *)v69, (float *)v76, (uint64_t)v65, 0.0, v52, v53);
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  v54 = convert((uint64_t)v65);
  v62.i32[2] = v55;
  DWORD2(v63) = v56;
  *(double *)v62.i64 = v54;
  *(_QWORD *)&v63 = v57;
  DWORD2(v64) = v58;
  *(_QWORD *)&v64 = v59;
  objc_msgSend(v35, "setVertexBytes:length:atIndex:", &v62, 48, 0);
  LOBYTE(v67) = 1;
  objc_msgSend(v35, "setFragmentBytes:length:atIndex:", &v67, 1, 0);
  v60 = 1.0 / exp2(a2);
  *(float32_t *)&v81 = v60;
  objc_msgSend(v35, "setFragmentBytes:length:atIndex:", &v81, 4, 2);
  objc_msgSend(v35, "setFragmentTexture:atIndex:", v32, 0);
  objc_msgSend(v35, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v35, "endEncoding");
  objc_msgSend(v33, "commit");
  if (a14)
    objc_msgSend(v33, "waitUntilCompleted");
  kdebug_trace();

}

void __126__ARGPUWarper_warpCameraImage_withExposureOffset_withCameraIntrinsics_withCameraTransform_toPlane_withLoadAction_synchronous___block_invoke(uint64_t a1)
{
  CVBufferRelease(*(CVBufferRef *)(a1 + 32));
}

- (void)warpPlane:(ARTexturedPlane *)a3 toPlane:(ARTexturedPlane *)a4 withLoadAction:(unint64_t)a5 synchronous:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  float32x4_t v23;
  array<unsigned char, 16UL> var0;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  unint64_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  float32x4_t v52;
  double v54;
  double v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  array<unsigned char, 16UL> v61;
  float32x4_t v62;
  simd_float4 v63;
  simd_float4 v64;
  simd_float4 v65;
  simd_float4 v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _OWORD v71[2];
  int v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  _QWORD v77[4];
  int v78;
  simd_float4x4 v79;
  float v80[2];
  float v81;
  int v82;
  float v83[2];
  float v84;
  int v85;
  float v86[4];
  float v87[4];
  simd_float4x4 v88;
  float32x4_t v89;
  __int128 v90;
  __int128 v91;
  float32x4_t v92;
  simd_float4x4 v93;
  uint64_t v94;
  simd_float4x4 v95;

  v6 = a6;
  v94 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorAttachments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTexture:", a4[3].var5);

  objc_msgSend(v11, "colorAttachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLoadAction:", a5);

  objc_msgSend(v11, "colorAttachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v11, "colorAttachments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStoreAction:", 1);

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLabel:", CFSTR("com.apple.arkit.gpuwarper.planetoplanecommandbuffer"));
  objc_msgSend(v20, "renderCommandEncoderWithDescriptor:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLabel:", CFSTR("com.apple.arkit.gpuwarper.planetoplanerenderencoder"));
  objc_msgSend(v21, "setCullMode:", 0);
  objc_msgSend(v21, "setRenderPipelineState:", self->_homographyPipelineState);
  v22 = 0;
  v23 = *(float32x4_t *)&a3[1].var4.__tree_.__pair3_.__value_;
  var0 = a3[2].var0;
  v25.i64[0] = 0x3F0000003F000000;
  v25.i64[1] = 0x3F0000003F000000;
  v26 = vmulq_f32(vaddq_f32(v23, (float32x4_t)var0), v25);
  v27 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
  v28 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  v29 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  v30 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  v26.i32[3] = HIDWORD(v30);
  v31 = *(float32x4_t *)&a3->var4.__tree_.__pair1_.__value_.__left_;
  v32 = *(float32x4_t *)&a3->var5;
  v33 = *(float32x4_t *)((char *)&a3[1].var0 + 8);
  v34 = *(float32x4_t *)&a3[1].var4.__tree_.__begin_node_;
  v89 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
  v90 = v28;
  v91 = v29;
  v92 = v26;
  do
  {
    v93.columns[v22 / 4] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(_OWORD *)((char *)&v89 + v22 * 4))), v32, *(float32x2_t *)&v89.f32[v22], 1), v33, *(float32x4_t *)((char *)&v89 + v22 * 4), 2), v34, *(float32x4_t *)((char *)&v89 + v22 * 4), 3);
    v22 += 4;
  }
  while (v22 != 16);
  v35 = 0;
  v65 = v93.columns[1];
  v66 = v93.columns[0];
  v63 = v93.columns[3];
  v64 = v93.columns[2];
  v61 = a4[2].var0;
  v62 = *(float32x4_t *)&a4[1].var4.__tree_.__pair3_.__value_;
  v36.i64[0] = 0x3F0000003F000000;
  v36.i64[1] = 0x3F0000003F000000;
  v37 = vmulq_f32(vaddq_f32(v62, (float32x4_t)v61), v36);
  v37.i32[3] = HIDWORD(v30);
  v38 = *(float32x4_t *)&a4->var4.__tree_.__pair1_.__value_.__left_;
  v39 = *(float32x4_t *)&a4->var5;
  v40 = *(float32x4_t *)((char *)&a4[1].var0 + 8);
  v41 = *(float32x4_t *)&a4[1].var4.__tree_.__begin_node_;
  v89 = v27;
  v90 = v28;
  v91 = v29;
  v92 = v37;
  do
  {
    v93.columns[v35 / 4] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v38, COERCE_FLOAT(*(_OWORD *)((char *)&v89 + v35 * 4))), v39, *(float32x2_t *)&v89.f32[v35], 1), v40, *(float32x4_t *)((char *)&v89 + v35 * 4), 2), v41, *(float32x4_t *)((char *)&v89 + v35 * 4), 3);
    v35 += 4;
  }
  while (v35 != 16);
  v88 = v93;
  v42 = vsubq_f32(v23, (float32x4_t)var0);
  *(float *)&v43 = -0.5 * v42.f32[0];
  *(float *)&v44 = -0.5 * v42.f32[0];
  HIDWORD(v44) = vmuls_lane_f32(-0.5, v42, 2);
  v93.columns[0].i64[0] = v44;
  v93.columns[0].i64[1] = 0x3F80000000000000;
  *(float *)&v45 = 0.5 * v42.f32[0];
  *(float *)&v46 = 0.5 * v42.f32[0];
  HIDWORD(v46) = HIDWORD(v44);
  __asm { FMOV            V1.2S, #1.0 }
  v93.columns[1].i64[0] = v46;
  v93.columns[1].i64[1] = _D1;
  HIDWORD(v43) = vmuls_lane_f32(0.5, v42, 2);
  v93.columns[2] = (simd_float4)v43;
  HIDWORD(v45) = HIDWORD(v43);
  v93.columns[3].i64[0] = v45;
  v93.columns[3].i64[1] = 1065353216;
  objc_msgSend(v21, "setVertexBytes:length:atIndex:", &v93, 64, 1);
  v95.columns[1] = v65;
  v95.columns[0] = v66;
  v95.columns[3] = v63;
  v95.columns[2] = v64;
  v79 = __invert_f4(v95);
  convert(&v79, (uint64_t)v80);
  convert(&v88, (uint64_t)&v75);
  *(_QWORD *)&v68 = v80;
  *((_QWORD *)&v68 + 1) = &v75;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>(&v89, (float32x4_t **)&v68);
  v52 = vsubq_f32(v62, (float32x4_t)v61);
  v80[0] = -0.5 * v52.f32[0];
  v80[1] = 0.0;
  v81 = vmuls_lane_f32(0.5, v52, 2);
  v82 = 1065353216;
  v83[0] = -0.5 * v52.f32[0];
  v83[1] = 0.0;
  v84 = vmuls_lane_f32(-0.5, v52, 2);
  v85 = 1065353216;
  v86[0] = 0.5 * v52.f32[0];
  v86[1] = 0.0;
  v86[2] = v84;
  v86[3] = 1.0;
  v87[0] = 0.5 * v52.f32[0];
  v87[1] = 0.0;
  v87[2] = v81;
  v87[3] = 1.0;
  v78 = 0;
  memset(v77, 0, sizeof(v77));
  MakeMatrix3x4f(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, (float *)&v79, 0.0, 0.0, 0.0, 1.0);
  *(_QWORD *)&v71[0] = &v79;
  *((_QWORD *)&v71[0] + 1) = &v89;
  *(_QWORD *)&v68 = v71;
  *((_QWORD *)&v68 + 1) = v80;
  v73 = 0;
  v74 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,3u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>((uint64_t)&v73, (uint64_t)&v68);
  v75 = v73;
  v76 = v74;
  MakeMatrix3x4f(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, (float *)&v79, 0.0, 0.0, 0.0, 1.0);
  *(_QWORD *)&v71[0] = &v79;
  *((_QWORD *)&v71[0] + 1) = &v89;
  *(_QWORD *)&v68 = v71;
  *((_QWORD *)&v68 + 1) = v83;
  v73 = 0;
  v74 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,3u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>((uint64_t)&v73, (uint64_t)&v68);
  v77[0] = v73;
  LODWORD(v77[1]) = v74;
  MakeMatrix3x4f(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, (float *)&v79, 0.0, 0.0, 0.0, 1.0);
  *(_QWORD *)&v71[0] = &v79;
  *((_QWORD *)&v71[0] + 1) = &v89;
  *(_QWORD *)&v68 = v71;
  *((_QWORD *)&v68 + 1) = v86;
  v73 = 0;
  v74 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,3u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>((uint64_t)&v73, (uint64_t)&v68);
  *(_QWORD *)((char *)&v77[1] + 4) = v73;
  HIDWORD(v77[2]) = v74;
  MakeMatrix3x4f(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, (float *)&v79, 0.0, 0.0, 0.0, 1.0);
  *(_QWORD *)&v71[0] = &v79;
  *((_QWORD *)&v71[0] + 1) = &v89;
  *(_QWORD *)&v68 = v71;
  *((_QWORD *)&v68 + 1) = v87;
  v73 = 0;
  v74 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,3u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>((uint64_t)&v73, (uint64_t)&v68);
  v77[3] = v73;
  v78 = v74;
  __asm { FMOV            V1.4S, #1.0 }
  v79.columns[0] = (simd_float4)xmmword_1B3C07EB0;
  v79.columns[1] = _Q1;
  v79.columns[2] = (simd_float4)xmmword_1B3C07EC0;
  v72 = 0;
  memset(v71, 0, sizeof(v71));
  computeHomography((float *)&v75, (float *)&v79, (uint64_t)v71, 0.0, *(double *)_Q1.i64, v54);
  v69 = 0u;
  v70 = 0u;
  v68 = 0u;
  v55 = convert((uint64_t)v71);
  DWORD2(v68) = v56;
  DWORD2(v69) = v57;
  *(double *)&v68 = v55;
  *(_QWORD *)&v69 = v58;
  DWORD2(v70) = v59;
  *(_QWORD *)&v70 = v60;
  objc_msgSend(v21, "setVertexBytes:length:atIndex:", &v68, 48, 0);
  v67 = 0;
  objc_msgSend(v21, "setFragmentBytes:length:atIndex:", &v67, 1, 0);
  LODWORD(v73) = 1065353216;
  objc_msgSend(v21, "setFragmentBytes:length:atIndex:", &v73, 4, 2);
  objc_msgSend(v21, "setFragmentTexture:atIndex:", a3[3].var5, 0);
  objc_msgSend(v21, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v21, "endEncoding");
  objc_msgSend(v20, "commit");
  if (v6)
    objc_msgSend(v20, "waitUntilCompleted");

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "status");
  if (v8 > 5)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E6674690[v8];
  objc_msgSend(v6, "appendFormat:", CFSTR("CommandBuffer Status: %@"), v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homographyPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
