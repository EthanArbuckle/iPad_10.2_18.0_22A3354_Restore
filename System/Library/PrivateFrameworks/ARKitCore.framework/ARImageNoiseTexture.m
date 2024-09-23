@implementation ARImageNoiseTexture

+ (id)sharedInstanceForCameraPosition:(int64_t)a3 longEdgeImageResolution:(unsigned int)a4
{
  uint64_t v4;
  ARImageNoiseTexture *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  if (+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::onceToken != -1)
    dispatch_once(&+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::onceToken, &__block_literal_global_124);
  dispatch_semaphore_wait((dispatch_semaphore_t)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::currentCameraPosition != a3
    || +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::currentLongEdgeImageResolution != (_DWORD)v4)
  {
    v7 = -[ARImageNoiseTexture initWithNoiseModel:]([ARImageNoiseTexture alloc], "initWithNoiseModel:", +[ARNoiseParameters modelIdentifierForDevicePosition:longEdgeImageResolution:](ARNoiseParameters, "modelIdentifierForDevicePosition:longEdgeImageResolution:", a3, v4));
    v8 = (void *)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::sharedInstance;
    +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::sharedInstance = (uint64_t)v7;

    +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::currentCameraPosition = a3;
    +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::currentLongEdgeImageResolution = v4;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::semaphore);
  return (id)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::sharedInstance;
}

void __79__ARImageNoiseTexture_sharedInstanceForCameraPosition_longEdgeImageResolution___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)+[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::semaphore;
  +[ARImageNoiseTexture sharedInstanceForCameraPosition:longEdgeImageResolution:]::semaphore = (uint64_t)v0;

}

- (ARImageNoiseTexture)initWithNoiseModel:(int)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD block[4];
  id v19;
  id v20;
  int v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)ARImageNoiseTexture;
  v4 = -[ARImageNoiseTexture init](&v22, sel_init);
  *((_QWORD *)v4 + 1) = 0x41C80000C1200000;
  *((_DWORD *)v4 + 4) = 1092616192;
  *((_DWORD *)v4 + 8) = 2139095040;
  kdebug_trace();
  v5 = MTLCreateSystemDefaultDevice();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTextureType:", 7);
  objc_msgSend(v6, "setPixelFormat:", 115);
  objc_msgSend(v6, "setWidth:", 256);
  objc_msgSend(v6, "setHeight:", 256);
  objc_msgSend(v6, "setDepth:", (unint64_t)*((float *)v4 + 4));
  objc_msgSend(v6, "setUsage:", 3);
  v7 = objc_msgSend(v5, "newTextureWithDescriptor:", v6);
  v8 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v7;

  objc_msgSend(*((id *)v4 + 5), "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture"));
  if (a3 == 77)
  {
    if (_ARLogGeneral(void)::onceToken != -1)
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_58_2);
    v9 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2048;
      v26 = v4;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No noise model available. Noise texture will be empty.", buf, 0x16u);

    }
  }
  else
  {
    ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.imageNoise");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v12;

    v14 = *((_QWORD *)v4 + 3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__ARImageNoiseTexture_initWithNoiseModel___block_invoke;
    block[3] = &unk_1E6675EE0;
    v19 = v5;
    v15 = v4;
    v20 = v15;
    v21 = a3;
    dispatch_async(v14, block);
    v16 = v20;
    v9 = v15;

  }
  return (ARImageNoiseTexture *)v4;
}

void __42__ARImageNoiseTexture_initWithNoiseModel___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v11;
  uint64_t i;
  void *v13;
  float *v14;
  float *v15;
  void *v16;
  float *v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float *v22;
  float v23;
  float v24;
  float *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  float *v31;
  float *v32;
  int v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  void *v45;
  __int128 v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  long double v65;
  float v66;
  float v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int64x2_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  _QWORD v94[3];
  int64x2_t v95;
  uint64_t v96;
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  void *v103;
  _BYTE *v104;
  uint64_t v105;
  void *v106;
  _BYTE *v107;
  uint64_t v108;
  void *v109[2];
  uint64_t v110;
  _QWORD v111[3];
  _QWORD v112[3];
  void *v113[3];
  uint64_t v114;
  float v115;
  void *v116[6];
  void *__p;
  float *v118;
  float *v119;
  void *v120;
  float *v121;
  uint64_t v122;
  char v123;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> v124;

  ARKitCoreBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v2 = objc_claimAutoreleasedReturnValue();
  v80 = (void *)v2;
  if (!v2)
    __assert_rtn("-[ARImageNoiseTexture initWithNoiseModel:]_block_invoke", "ARImageNoiseTexture.mm", 113, "url != nil");
  v81 = (void *)objc_msgSend(*(id *)(a1 + 32), "newLibraryWithURL:error:", v2, 0);
  objc_msgSend(v81, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture"));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_msgSend(v81, "newFunctionWithName:", CFSTR("repeat"));
  v86 = (void *)objc_msgSend(v3, "newComputePipelineStateWithFunction:error:", v4, 0);

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(v81, "newFunctionWithName:", CFSTR("noise_ycbcr_to_srgb"));
  v79 = v1;
  v85 = (void *)objc_msgSend(v5, "newComputePipelineStateWithFunction:error:", v6, 0);

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 125, 256, 256, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setUsage:", 3);
  v88 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v83);
  objc_msgSend(v83, "setWidth:", 320);
  objc_msgSend(v83, "setHeight:", 320);
  objc_msgSend(v83, "setPixelFormat:", 25);
  v92 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v83);
  v89 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v83);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v83);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v83);
  objc_msgSend(v83, "setPixelFormat:", 115);
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v83);
  objc_msgSend(v83, "setWidth:", 256);
  objc_msgSend(v83, "setHeight:", 256);
  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v83);
  objc_msgSend(v88, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.noiseYCbCr"));
  objc_msgSend(v92, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.paddedNoiseY"));
  objc_msgSend(v89, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.paddedNoiseCb"));
  objc_msgSend(v7, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.paddedNoiseCr"));
  objc_msgSend(v8, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.paddedBlurBuffer"));
  objc_msgSend(v9, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.paddedNoiseTile"));
  objc_msgSend(v10, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.noiseTile"));
  v90 = v10;
  v91 = v9;
  v82 = v8;
  v87 = v7;

  v11 = 5489;
  v124.__x_[0] = 5489;
  for (i = 1; i != 624; ++i)
  {
    v11 = i + 1812433253 * (v11 ^ (v11 >> 30));
    v124.__x_[i] = v11;
  }
  v124.__i_ = 0;
  v122 = 0x3F80000000000000;
  v123 = 0;
  v13 = v92;
  std::vector<float>::vector(&v120, 0x40000uLL);
  v14 = (float *)v120;
  v15 = v121;
  while (v14 != v15)
    *v14++ = std::normal_distribution<float>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v122, &v124, (float *)&v122);
  v78 = (void *)objc_msgSend(*(id *)(a1 + 32), "newCommandQueue");
  objc_msgSend(v78, "setLabel:", CFSTR("com.apple.arkit.imageNoiseTexture.queue"));
  objc_msgSend(v78, "commandBuffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.queue"));
  v17 = *(float **)(a1 + 40);
  *(float *)&v19 = v17[2];
  *(float *)&v18 = v17[3];
  *(float *)&v20 = v17[4];
  v119 = 0;
  v118 = 0;
  __p = 0;
  v21 = v17[3];
  if (v21 >= v17[2])
  {
    v22 = 0;
    v23 = *(float *)&v18 - *(float *)&v19;
    LODWORD(v19) = -1.0;
    *(float *)&v20 = *(float *)&v20 + -1.0;
    v24 = v23 / *(float *)&v20;
    do
    {
      if (v22 >= v119)
      {
        v25 = (float *)__p;
        v26 = ((char *)v22 - (_BYTE *)__p) >> 2;
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 62)
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        v28 = (char *)v119 - (_BYTE *)__p;
        if (((char *)v119 - (_BYTE *)__p) >> 1 > v27)
          v27 = v28 >> 1;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
          v29 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v119, v29);
          v22 = v118;
          v25 = (float *)__p;
        }
        else
        {
          v30 = 0;
        }
        v31 = (float *)&v30[4 * v26];
        *v31 = v21;
        v32 = v31 + 1;
        while (v22 != v25)
        {
          v33 = *((_DWORD *)v22-- - 1);
          *((_DWORD *)v31-- - 1) = v33;
        }
        __p = v31;
        v118 = v32;
        v119 = (float *)&v30[4 * v29];
        if (v25)
          operator delete(v25);
        v22 = v32;
      }
      else
      {
        *v22++ = v21;
      }
      v118 = v22;
      v21 = v21 - v24;
      LODWORD(v18) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    while (v21 >= *(float *)&v18);
    if (v22 != __p)
    {
      v34 = 0;
      v84 = vdupq_n_s64(0x100uLL);
      do
      {
        v35 = (void *)objc_msgSend(v88, "width");
        v36 = (void *)objc_msgSend(v88, "height");
        memset(v116, 0, 24);
        v116[3] = v35;
        v116[4] = v36;
        v116[5] = (void *)1;
        objc_msgSend(v88, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v116, 0, v120, 16 * objc_msgSend(v88, "width"));
        arkit::gaussianMixtureKernels(*(_DWORD *)(a1 + 48), (arkit *)0x29, (uint64_t)v113, *((float *)__p + v34));
        objc_msgSend(v16, "computeCommandEncoder");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setLabel:", CFSTR("com.apple.arkit.imagenoisetexture.repeatpipeline"));
        v38 = objc_msgSend(v86, "threadExecutionWidth");
        v39 = objc_msgSend(v86, "maxTotalThreadsPerThreadgroup");
        v40 = objc_msgSend(v13, "width");
        v41 = objc_msgSend(v13, "height");
        objc_msgSend(v37, "setComputePipelineState:", v86);
        objc_msgSend(v37, "setTexture:atIndex:", v88, 0);
        objc_msgSend(v37, "setTexture:atIndex:", v13, 1);
        objc_msgSend(v37, "setTexture:atIndex:", v89, 2);
        objc_msgSend(v37, "setTexture:atIndex:", v87, 3);
        v106 = 0;
        LODWORD(v35) = objc_msgSend(v13, "width");
        v42 = objc_msgSend(v88, "width");
        v43 = objc_msgSend(v92, "height");
        v44 = objc_msgSend(v88, "height");
        LODWORD(v45) = ((_DWORD)v35 - v42) >> 1;
        HIDWORD(v45) = (v43 - v44) >> 1;
        v106 = v45;
        objc_msgSend(v37, "setBytes:length:atIndex:", &v106, 8, 0);
        LODWORD(v109[1]) = 0;
        v109[0] = 0;
        *(float32x2_t *)&v46 = vsqrt_f32(*(float32x2_t *)v113[0]);
        DWORD2(v46) = sqrtf(*((float *)v113[0] + 2));
        *(_OWORD *)v109 = v46;
        objc_msgSend(v37, "setBytes:length:atIndex:", v109, 16, 1);
        v47 = v39 / v38 - 1;
        v112[0] = (v47 + v40) / (v39 / v38);
        v112[1] = (v47 + v41) / (v39 / v38);
        v112[2] = 1;
        v111[0] = v39 / v38;
        v111[1] = v39 / v38;
        v111[2] = 1;
        objc_msgSend(v37, "dispatchThreadgroups:threadsPerThreadgroup:", v112, v111);
        objc_msgSend(v37, "endEncoding");
        v109[1] = 0;
        v110 = 0;
        v109[0] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v109, *(const void **)v114, *(_QWORD *)(v114 + 8), (uint64_t)(*(_QWORD *)(v114 + 8) - *(_QWORD *)v114) >> 2);
        v107 = 0;
        v108 = 0;
        v106 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v106, *(const void **)(v114 + 24), *(_QWORD *)(v114 + 32), (uint64_t)(*(_QWORD *)(v114 + 32) - *(_QWORD *)(v114 + 24)) >> 2);
        v104 = 0;
        v105 = 0;
        v103 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v103, *(const void **)(v114 + 48), *(_QWORD *)(v114 + 56), (uint64_t)(*(_QWORD *)(v114 + 56) - *(_QWORD *)(v114 + 48)) >> 2);
        v48 = objc_alloc(MEMORY[0x1E0CC6E28]);
        v49 = (void *)objc_msgSend(v48, "initWithDevice:kernelWidth:kernelHeight:weights:", *(_QWORD *)(a1 + 32), ((char *)v109[1] - (char *)v109[0]) >> 2, 1);
        v50 = objc_alloc(MEMORY[0x1E0CC6E28]);
        v51 = (void *)objc_msgSend(v50, "initWithDevice:kernelWidth:kernelHeight:weights:", *(_QWORD *)(a1 + 32), 1, ((char *)v109[1] - (char *)v109[0]) >> 2);
        v52 = objc_alloc(MEMORY[0x1E0CC6E28]);
        v53 = (void *)objc_msgSend(v52, "initWithDevice:kernelWidth:kernelHeight:weights:", *(_QWORD *)(a1 + 32), (v107 - (_BYTE *)v106) >> 2, 1);
        v54 = objc_alloc(MEMORY[0x1E0CC6E28]);
        v55 = (void *)objc_msgSend(v54, "initWithDevice:kernelWidth:kernelHeight:weights:", *(_QWORD *)(a1 + 32), 1, (v107 - (_BYTE *)v106) >> 2);
        v56 = objc_alloc(MEMORY[0x1E0CC6E28]);
        v57 = (void *)objc_msgSend(v56, "initWithDevice:kernelWidth:kernelHeight:weights:", *(_QWORD *)(a1 + 32), (v104 - (_BYTE *)v103) >> 2, 1);
        v58 = objc_alloc(MEMORY[0x1E0CC6E28]);
        v59 = (void *)objc_msgSend(v58, "initWithDevice:kernelWidth:kernelHeight:weights:", *(_QWORD *)(a1 + 32), 1, (v104 - (_BYTE *)v103) >> 2);
        objc_msgSend(v49, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v16, v92, v82);
        objc_msgSend(v51, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v16, v82, v92);
        objc_msgSend(v53, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v16, v89, v82);
        objc_msgSend(v55, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v16, v82, v89);
        objc_msgSend(v57, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v16, v87, v82);
        objc_msgSend(v59, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v16, v82, v87);

        if (v103)
        {
          v104 = v103;
          operator delete(v103);
        }
        v13 = v92;
        if (v106)
        {
          v107 = v106;
          operator delete(v106);
        }
        if (v109[0])
        {
          v109[1] = v109[0];
          operator delete(v109[0]);
        }
        objc_msgSend(v16, "computeCommandEncoder");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v85, "threadExecutionWidth");
        v62 = objc_msgSend(v85, "maxTotalThreadsPerThreadgroup");
        v63 = objc_msgSend(v91, "width");
        v64 = objc_msgSend(v91, "height");
        objc_msgSend(v60, "setComputePipelineState:", v85);
        objc_msgSend(v60, "setTexture:atIndex:", v92, 0);
        objc_msgSend(v60, "setTexture:atIndex:", v89, 1);
        objc_msgSend(v60, "setTexture:atIndex:", v87, 2);
        objc_msgSend(v60, "setTexture:atIndex:", v91, 3);
        v65 = powf(fmaxf(v115, 0.35), 2.2);
        v66 = pow(v65, -0.545454545) * 0.454545438;
        v67 = 0.23564758 / v65 / v66;
        *(float *)v109 = v67;
        objc_msgSend(v60, "setBytes:length:atIndex:", v109, 4, 0);
        v68 = v62 / v61 - 1;
        v102[0] = (v68 + v63) / (v62 / v61);
        v102[1] = (v68 + v64) / (v62 / v61);
        v102[2] = 1;
        v101[0] = v62 / v61;
        v101[1] = v62 / v61;
        v101[2] = 1;
        objc_msgSend(v60, "dispatchThreadgroups:threadsPerThreadgroup:", v102, v101);
        objc_msgSend(v60, "endEncoding");

        objc_msgSend(v16, "blitCommandEncoder");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v91, "width");
        v71 = objc_msgSend(v90, "width");
        v72 = objc_msgSend(v91, "height");
        v73 = objc_msgSend(v90, "height");
        v100[0] = (unint64_t)(v70 - v71) >> 1;
        v100[1] = (unint64_t)(v72 - v73) >> 1;
        v100[2] = 0;
        v74 = objc_msgSend(v90, "width");
        v75 = objc_msgSend(v90, "height");
        v99[0] = v74;
        v99[1] = v75;
        v99[2] = 1;
        memset(v98, 0, sizeof(v98));
        objc_msgSend(v69, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v91, 0, 0, v100, v99, v90, 0, 0, v98);
        objc_msgSend(v69, "endEncoding");

        objc_msgSend(v16, "blitCommandEncoder");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        memset(v97, 0, sizeof(v97));
        v95 = v84;
        v96 = 1;
        v77 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
        v94[0] = 0;
        v94[1] = 0;
        v94[2] = v34;
        objc_msgSend(v76, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v90, 0, 0, v97, &v95, v77, 0, 0, v94);
        objc_msgSend(v76, "endEncoding");

        v109[0] = &v114;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)v109);
        if (v113[0])
        {
          v113[1] = v113[0];
          operator delete(v113[0]);
        }
        ++v34;
      }
      while (v34 < ((char *)v118 - (_BYTE *)__p) >> 2);
    }
  }
  objc_msgSend(v16, "addCompletedHandler:", &__block_literal_global_37_0, v18, v20, v19);
  objc_msgSend(v16, "commit");
  if (__p)
  {
    v118 = (float *)__p;
    operator delete(__p);
  }

  if (v120)
  {
    v121 = (float *)v120;
    operator delete(v120);
  }

}

uint64_t __42__ARImageNoiseTexture_initWithNoiseModel___block_invoke_2()
{
  return kdebug_trace();
}

- (float)snrToNoiseIntensity:(float)lastSNR
{
  if (lastSNR == INFINITY)
    lastSNR = self->_lastSNR;
  self->_lastSNR = lastSNR;
  return (float)(self->_maxSNR - fmaxf(fminf(lastSNR, self->_maxSNR), self->_minSNR))
       / (float)(self->_maxSNR - self->_minSNR);
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
