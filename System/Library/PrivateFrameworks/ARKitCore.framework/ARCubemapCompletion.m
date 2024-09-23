@implementation ARCubemapCompletion

+ (id)sharedInstance
{
  if (+[ARCubemapCompletion sharedInstance]::onceToken != -1)
    dispatch_once(&+[ARCubemapCompletion sharedInstance]::onceToken, &__block_literal_global_89);
  return (id)+[ARCubemapCompletion sharedInstance]::sharedInstance;
}

void __37__ARCubemapCompletion_sharedInstance__block_invoke()
{
  ARCubemapCompletion *v0;
  void *v1;

  v0 = objc_alloc_init(ARCubemapCompletion);
  v1 = (void *)+[ARCubemapCompletion sharedInstance]::sharedInstance;
  +[ARCubemapCompletion sharedInstance]::sharedInstance = (uint64_t)v0;

}

- (ARCubemapCompletion)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  objc_class *v13;
  id v14;
  objc_class *v15;
  void *v16;
  uint64_t context;
  uint64_t *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  int32x4_t v39;
  objc_class *v40;
  void *v41;
  ARCubemapCompletion *v42;
  int v43;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  int32x4_t v48;
  vImagePixelCount v49;
  vImagePixelCount v50;
  size_t v51;
  unint64_t *v52;
  uint64_t i;
  char v54;
  char v55;
  unint64_t v56;
  _BYTE *v57;
  _BYTE *v58;
  unint64_t v59;
  _BYTE *v60;
  unint64_t v61;
  unint64_t v62;
  size_t v63;
  char *v64;
  char *v65;
  _BYTE *v66;
  _BYTE *v67;
  char v68;
  unint64_t *v69;
  int j;
  char v71;
  char v72;
  unint64_t v73;
  _BYTE *v74;
  _BYTE *v75;
  unint64_t v76;
  _BYTE *v77;
  unint64_t v78;
  unint64_t v79;
  size_t v80;
  char *v81;
  char *v82;
  _BYTE *v83;
  _BYTE *v84;
  char v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  objc_class *v89;
  void *v90;
  char *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  NSObject *v100;
  objc_class *v101;
  void *v102;
  void *v103;
  objc_class *v104;
  void *v105;
  char *v106;
  void *v107;
  id v108;
  void *v109;
  __CFString *v110;
  id v111;
  id v112;
  id v113;
  objc_super v114;
  uint8_t v115[4];
  void *v116;
  __int16 v117;
  char *v118;
  __int16 v119;
  id v120;
  _BYTE buf[22];
  __int16 v122;
  void *v123;
  __int16 v124;
  __CFString *v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v114.receiver = self;
  v114.super_class = (Class)ARCubemapCompletion;
  v2 = -[ARCubemapCompletion init](&v114, sel_init);
  if (!v2)
    goto LABEL_37;
  kdebug_trace();
  v3 = objc_opt_new();
  v4 = (void *)*((_QWORD *)v2 + 15);
  *((_QWORD *)v2 + 15) = v3;

  v5 = objc_opt_new();
  v6 = (void *)*((_QWORD *)v2 + 16);
  *((_QWORD *)v2 + 16) = v5;

  v7 = MTLCreateSystemDefaultDevice();
  v8 = (void *)*((_QWORD *)v2 + 25);
  *((_QWORD *)v2 + 25) = v7;

  v2[224] = objc_msgSend(*((id *)v2 + 25), "supportsFamily:", 1004) ^ 1;
  objc_msgSend(v2, "generateSeamSmoothingTexture");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v2 + 17);
  *((_QWORD *)v2 + 17) = v9;

  ARKitCoreBundle();
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2[224])
    v11 = CFSTR("gan_model_pre_A11");
  else
    v11 = CFSTR("gan_model");
  v110 = v11;
  _ARLogTechnique();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v2;
    v122 = 2112;
    v123 = v16;
    v124 = 2112;
    v125 = v110;
    _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@  model choice : %@", buf, 0x2Au);

  }
  objc_msgSend(v109, "pathForResource:ofType:", v110, CFSTR("mlmodelc"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
  v108 = (id)objc_claimAutoreleasedReturnValue();
  context = espresso_create_context();
  *((_QWORD *)v2 + 1) = context;
  v18 = (uint64_t *)(v2 + 8);
  if (context)
  {
    _ARLogTechnique();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using ANE for Completion", buf, 0x16u);

    }
  }
  else
  {
    v22 = espresso_create_context();
    *v18 = v22;
    if (!v22)
    {
      _ARLogGeneral();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v2;
        _os_log_impl(&dword_1B3A68000, v45, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Espresso context creation failed.", buf, 0x16u);

      }
      v42 = 0;
      goto LABEL_35;
    }
    _ARLogTechnique();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using GPU for Completion", buf, 0x16u);

    }
  }

  if (espresso_context_set_low_precision_accumulation())
  {
    _ARLogTechnique();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Unable to set Espresso low precision accumulation.", buf, 0x16u);

    }
  }
  if (v2[224])
  {
    *((_QWORD *)v2 + 2) = espresso_create_plan();
    _ARLogTechnique();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Completion model espresso plan at low priority.", buf, 0x16u);

    }
  }
  else
  {
    *((_QWORD *)v2 + 2) = espresso_create_plan();
    _ARLogTechnique();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Completion model espresso plan at default priority.", buf, 0x16u);

    }
  }

  if (!*((_QWORD *)v2 + 2))
  {
    _ARLogGeneral();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_1B3A68000, v36, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Espresso plan creation failed.", buf, 0x16u);

    }
    espresso_context_destroy();
    goto LABEL_34;
  }
  objc_msgSend(objc_retainAutorelease(v108), "UTF8String");
  if (espresso_plan_add_network())
  {
    _ARLogGeneral();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_1B3A68000, v33, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Adding plan to Espresso network failed.", buf, 0x16u);

    }
LABEL_33:

    espresso_context_destroy();
    espresso_plan_destroy();
    *v18 = 0;
    *((_QWORD *)v2 + 2) = 0;
LABEL_34:
    v42 = v2;
LABEL_35:
    v43 = 1;
    goto LABEL_36;
  }
  if (espresso_plan_build())
  {
    _ARLogGeneral();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_1B3A68000, v33, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Building Espresso plan failed.", buf, 0x16u);

    }
    goto LABEL_33;
  }
  *(int8x8_t *)v39.i8 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v2[224] == 0), 0x1FuLL)), (int8x8_t)0x3C008081BF800000, (int8x8_t)0x3B80808100000000);
  v48 = vzip1q_s32(v39, v39);
  v48.i32[2] = v39.i32[0];
  *(int32x4_t *)(v2 + 40) = v48;
  v2[56] = 1;
  espresso_network_query_blob_dimensions();
  v50 = *(_QWORD *)buf;
  v49 = *(_QWORD *)&buf[8];
  *((_QWORD *)v2 + 23) = *(_QWORD *)buf;
  *((_QWORD *)v2 + 24) = v49;
  vImageBuffer_Init((vImage_Buffer *)(v2 + 88), v49, v50, 0x20u, 0);
  v51 = 3 * *((_QWORD *)v2 + 23) * *((_QWORD *)v2 + 24);
  v52 = (unint64_t *)(v2 + 64);
  std::vector<unsigned char>::reserve((unint64_t *)v2 + 8, v51);
  if (v51)
  {
    for (i = 0; i != v51; ++i)
    {
      v54 = arc4random_uniform(0xFFu);
      v55 = v54;
      v57 = (_BYTE *)*((_QWORD *)v2 + 9);
      v56 = *((_QWORD *)v2 + 10);
      if ((unint64_t)v57 >= v56)
      {
        v59 = *v52;
        v60 = &v57[-*v52];
        v61 = (unint64_t)(v60 + 1);
        if ((uint64_t)(v60 + 1) < 0)
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        v62 = v56 - v59;
        if (2 * v62 > v61)
          v61 = 2 * v62;
        if (v62 >= 0x3FFFFFFFFFFFFFFFLL)
          v63 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v63 = v61;
        if (v63)
          v64 = (char *)operator new(v63);
        else
          v64 = 0;
        v65 = &v60[(_QWORD)v64];
        v66 = &v60[(_QWORD)v64];
        *v66 = v55;
        v58 = v66 + 1;
        if (v57 != (_BYTE *)v59)
        {
          v67 = &v57[~v59];
          do
          {
            v68 = *--v57;
            (v67--)[(_QWORD)v64] = v68;
          }
          while (v57 != (_BYTE *)v59);
          v57 = (_BYTE *)*v52;
          v65 = v64;
        }
        *((_QWORD *)v2 + 8) = v65;
        *((_QWORD *)v2 + 9) = v58;
        *((_QWORD *)v2 + 10) = &v64[v63];
        if (v57)
          operator delete(v57);
      }
      else
      {
        *v57 = v54;
        v58 = v57 + 1;
      }
      *((_QWORD *)v2 + 9) = v58;
    }
  }
  if (v2[224])
  {
    v69 = (unint64_t *)(v2 + 232);
    std::vector<unsigned char>::reserve((unint64_t *)v2 + 29, 0x100uLL);
    for (j = 0; j != 256; ++j)
    {
      v71 = objc_msgSend(v2, "srgbToLog:", j);
      v72 = v71;
      v74 = (_BYTE *)*((_QWORD *)v2 + 30);
      v73 = *((_QWORD *)v2 + 31);
      if ((unint64_t)v74 >= v73)
      {
        v76 = *v69;
        v77 = &v74[-*v69];
        v78 = (unint64_t)(v77 + 1);
        if ((uint64_t)(v77 + 1) < 0)
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        v79 = v73 - v76;
        if (2 * v79 > v78)
          v78 = 2 * v79;
        if (v79 >= 0x3FFFFFFFFFFFFFFFLL)
          v80 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v80 = v78;
        if (v80)
          v81 = (char *)operator new(v80);
        else
          v81 = 0;
        v82 = &v77[(_QWORD)v81];
        v83 = &v77[(_QWORD)v81];
        *v83 = v72;
        v75 = v83 + 1;
        if (v74 != (_BYTE *)v76)
        {
          v84 = &v74[~v76];
          do
          {
            v85 = *--v74;
            (v84--)[(_QWORD)v81] = v85;
          }
          while (v74 != (_BYTE *)v76);
          v74 = (_BYTE *)*v69;
          v82 = v81;
        }
        *((_QWORD *)v2 + 29) = v82;
        *((_QWORD *)v2 + 30) = v75;
        *((_QWORD *)v2 + 31) = &v81[v80];
        if (v74)
          operator delete(v74);
      }
      else
      {
        *v74 = v71;
        v75 = v74 + 1;
      }
      *((_QWORD *)v2 + 30) = v75;
    }
  }
  *((_DWORD *)v2 + 44) = 1063675494;
  *((_QWORD *)v2 + 19) = 0x3F747AE147AE147BLL;
  v86 = objc_msgSend(*((id *)v2 + 25), "newCommandQueue");
  v87 = (void *)*((_QWORD *)v2 + 26);
  *((_QWORD *)v2 + 26) = v86;

  objc_msgSend(*((id *)v2 + 26), "setLabel:", CFSTR("com.apple.arkit.cubemapcompletion.queue"));
  v2[60] = 1;
  if (espresso_plan_execute_sync())
  {
    _ARLogGeneral();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      v89 = (objc_class *)objc_opt_class();
      NSStringFromClass(v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v115 = 138543618;
      v116 = v90;
      v117 = 2048;
      v118 = v2;
      _os_log_impl(&dword_1B3A68000, v88, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Espresso warm-up failed...", v115, 0x16u);

    }
    espresso_context_destroy();
    espresso_plan_destroy();
    *v18 = 0;
    *((_QWORD *)v2 + 2) = 0;
    v91 = v2;
    v43 = 1;
    goto LABEL_98;
  }
  objc_msgSend(v109, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)*((_QWORD *)v2 + 25);
  v113 = 0;
  v94 = (void *)objc_msgSend(v93, "newLibraryWithURL:error:", v92, &v113);
  v95 = v113;
  objc_msgSend(v94, "setLabel:", CFSTR("com.apple.arkit.cubemapcompletion.library"));
  if (!v94)
  {
    _ARLogGeneral();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      v101 = (objc_class *)objc_opt_class();
      NSStringFromClass(v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v115 = 138543874;
      v116 = v102;
      v117 = 2048;
      v118 = v2;
      v119 = 2112;
      v120 = v95;
      _os_log_impl(&dword_1B3A68000, v100, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create MTLLibrary %@", v115, 0x20u);

    }
    goto LABEL_96;
  }
  v96 = (void *)*((_QWORD *)v2 + 25);
  if (v2[224])
  {
    v97 = (void *)objc_msgSend(v94, "newFunctionWithName:", CFSTR("combine_buffers_to_hdr_pre_A11"));
    v112 = v95;
    v98 = objc_msgSend(v96, "newComputePipelineStateWithFunction:error:", v97, &v112);
    v99 = v112;

  }
  else
  {
    v97 = (void *)objc_msgSend(v94, "newFunctionWithName:", CFSTR("combine_buffers_to_hdr"));
    v111 = v95;
    v98 = objc_msgSend(v96, "newComputePipelineStateWithFunction:error:", v97, &v111);
    v99 = v111;

  }
  v103 = (void *)*((_QWORD *)v2 + 27);
  *((_QWORD *)v2 + 27) = v98;
  v95 = v99;

  if (!*((_QWORD *)v2 + 27))
  {
    _ARLogGeneral();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      v104 = (objc_class *)objc_opt_class();
      NSStringFromClass(v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v115 = 138543874;
      v116 = v105;
      v117 = 2048;
      v118 = v2;
      v119 = 2112;
      v120 = v99;
      _os_log_impl(&dword_1B3A68000, v100, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create combine buffer to hdr pipeline state %@", v115, 0x20u);

    }
LABEL_96:

    v106 = v2;
    v43 = 1;
    goto LABEL_97;
  }
  kdebug_trace();
  v43 = 0;
LABEL_97:

LABEL_98:
  v42 = (ARCubemapCompletion *)v2;
LABEL_36:

  if (!v43)
LABEL_37:
    v42 = v2;

  return v42;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  free(self->_vImageBuffer.data);
  v3.receiver = self;
  v3.super_class = (Class)ARCubemapCompletion;
  -[ARCubemapCompletion dealloc](&v3, sel_dealloc);
}

- (unsigned)srgbToLog:(unsigned __int8)a3
{
  float v3;
  float v4;

  v3 = powf((float)a3 / 255.0, 2.2);
  v4 = (log10((float)(v3 / 0.18) + 1.0e-16) * 224.999985 + 445.0) / 1023.0;
  return (int)(float)(fmaxf(fminf(v4, 1.0), 0.0) * 255.0);
}

- (id)completeCubemap:(simd_float3)a3 cameraExposure:(simd_float3)a4 rotationWorldFromCube:(simd_float3)a5
{
  id v9;
  double v15;
  simd_float3x3 v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  simd_float3x3 v35;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a7;
  objc_msgSend(v9, "width");
  objc_msgSend(v9, "height");
  kdebug_trace();
  if (!*(_BYTE *)(a1 + 60))
  {
    objc_msgSend((id)a1, "grayCubemapOfSize:", objc_msgSend(v9, "width"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)(a1 + 256) = _D0;
  *(_QWORD *)(a1 + 264) = 1065353216;
  v15 = *(double *)(a1 + 152);
  *(_BYTE *)(a1 + 144) = v15 > a2;
  if (v15 <= a2)
  {
    v16.columns[1] = a4;
    v16.columns[2] = a5;
    if (!*(_BYTE *)(a1 + 224))
    {
      v18 = 128;
      goto LABEL_8;
    }
  }
  else
  {
    v16.columns[1] = a4;
    v16.columns[2] = a5;
    if (*(_BYTE *)(a1 + 224))
    {
      *(_DWORD *)(a1 + 268) = *(_DWORD *)(a1 + 192) / 2;
      *(int32x2_t *)(a1 + 256) = vdup_n_s32(0x3F7D70A4u);
      *(_DWORD *)(a1 + 264) = 1066192077;
    }
  }
  v18 = 255;
LABEL_8:
  *(_DWORD *)(a1 + 160) = v18;
  v16.columns[0] = a3;
  v19 = *(void **)(a1 + 120);
  v35 = __invert_f3(v16);
  objc_msgSend(v19, "equirectangularTextureFromCubemapTexture:rotation:width:height:", v9, *(_QWORD *)(a1 + 184), *(_QWORD *)(a1 + 192), *(double *)v35.columns[0].i64, *(double *)v35.columns[1].i64, *(double *)v35.columns[2].i64);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "completeLatLongImage:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 120), "cubemapTextureFromEquirectangularTexture:rotation:size:", v21, objc_msgSend(v9, "height"), *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 128), "blurCubemapTexture:roughness:rotation:", v22, *(_QWORD *)(a1 + 136), *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "width");
    objc_msgSend(v17, "height");
    kdebug_trace();

  }
  else
  {
    _ARLogGeneral();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v25;
      v32 = 2048;
      v33 = a1;
      _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not complete environment texture", buf, 0x16u);

    }
    objc_msgSend((id)a1, "grayCubemapOfSize:", objc_msgSend(v9, "width"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  return v17;
}

- (id)completeLatLongImage:(id)a3
{
  void *v4;
  int v6;
  _OWORD v7[10];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;

  v22 = 0u;
  v23 = 0u;
  -[ARCubemapCompletion toVImageBuffer:](self, "toVImageBuffer:", a3);
  v9 = v22;
  v10 = v23;
  if (espresso_network_bind_input_vimagebuffer_bgra8()
    || espresso_network_bind_buffer()
    || !self->_espresso_plan)
  {
    v4 = 0;
  }
  else
  {
    kdebug_trace();
    v6 = espresso_plan_execute_sync();
    v4 = 0;
    if (!v6)
    {
      kdebug_trace();
      v7[8] = v19;
      v7[9] = v20;
      v8 = v21;
      v7[4] = v15;
      v7[5] = v16;
      v7[6] = v17;
      v7[7] = v18;
      v7[0] = v11;
      v7[1] = v12;
      v7[2] = v13;
      v7[3] = v14;
      -[ARCubemapCompletion toTexture:](self, "toTexture:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (vImage_Buffer)toVImageBuffer:(SEL)a3
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *data;
  size_t rowBytes;
  float v11;
  double v12;
  char *v13;
  size_t v14;
  char *begin;
  uint64_t v16;
  unint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t i;
  float v21;
  int v22;
  float g_avg;
  double v24;
  double v25;
  int bias_mask;
  float r_avg;
  float v28;
  float b_avg;
  float v30;
  __int128 v31;
  vImage_Buffer *result;
  _QWORD v33[6];

  v6 = a4;
  objc_msgSend(v6, "width");
  objc_msgSend(v6, "height");
  kdebug_trace();
  v7 = objc_msgSend(v6, "width");
  v8 = objc_msgSend(v6, "height");
  data = self->_vImageBuffer.data;
  rowBytes = self->_vImageBuffer.rowBytes;
  memset(v33, 0, 24);
  v33[3] = v7;
  v33[4] = v8;
  v33[5] = 1;
  objc_msgSend(v6, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", data, rowBytes, v33, 0);
  v13 = (char *)self->_vImageBuffer.data;
  v14 = self->_vImageBuffer.rowBytes;
  begin = self->_randomNumbers.__begin_;
  *(_QWORD *)&self->_g_avg = 0;
  self->_r_avg = 0.0;
  if (v8)
  {
    v16 = 0;
    v17 = 0;
    v18 = (unsigned __int8 *)(v13 + 1);
    do
    {
      v19 = v18;
      for (i = v7; i; --i)
      {
        LOBYTE(v11) = v19[2];
        v11 = (float)LODWORD(v11);
        LODWORD(v12) = 1132396544;
        v21 = self->_alpha_threshold * 255.0;
        if (v21 < v11)
        {
          LOBYTE(v12) = *(v19 - 1);
          g_avg = self->_g_avg;
          v24 = (double)*(unint64_t *)&v12 / 255.0 + self->_r_avg;
          *(float *)&v24 = v24;
          self->_r_avg = *(float *)&v24;
          LOBYTE(v24) = *v19;
          v25 = (double)*(unint64_t *)&v24 / 255.0 + g_avg;
          *(float *)&v25 = v25;
          self->_g_avg = *(float *)&v25;
          LOBYTE(v25) = v19[1];
          v12 = (double)*(unint64_t *)&v25 / 255.0 + self->_b_avg;
          *(float *)&v12 = v12;
          self->_b_avg = *(float *)&v12;
          ++v17;
          LOBYTE(bias_mask) = self->_use_model_pre_A11;
          if (!(_BYTE)bias_mask)
            goto LABEL_28;
          *(v19 - 1) = self->_srgbToLogLUT_pre_A11.__begin_[*(v19 - 1)];
          *v19 = self->_srgbToLogLUT_pre_A11.__begin_[*v19];
          LOBYTE(v22) = self->_srgbToLogLUT_pre_A11.__begin_[v19[1]];
        }
        else if (self->_use_model_pre_A11)
        {
          LOBYTE(v12) = *begin;
          *(float *)&v12 = (float)LODWORD(v12);
          if (v16 < self->_bias_height_pre_A11)
          {
            *(float *)&v12 = self->_r_bias_pre_A11 * *(float *)&v12;
            if (*(float *)&v12 > 250.0)
              *(float *)&v12 = 250.0;
          }
          *(v19 - 1) = (int)*(float *)&v12;
          LOBYTE(v12) = begin[1];
          *(float *)&v12 = (float)LODWORD(v12);
          if (v16 < self->_bias_height_pre_A11)
          {
            *(float *)&v12 = self->_g_bias_pre_A11 * *(float *)&v12;
            if (*(float *)&v12 > 250.0)
              *(float *)&v12 = 250.0;
          }
          *v19 = (int)*(float *)&v12;
          LOBYTE(v12) = begin[2];
          *(float *)&v12 = (float)LODWORD(v12);
          if (v16 < self->_bias_height_pre_A11)
          {
            *(float *)&v12 = self->_b_bias_pre_A11 * *(float *)&v12;
            if (*(float *)&v12 > 250.0)
              *(float *)&v12 = 250.0;
          }
          begin += 3;
          v22 = (int)*(float *)&v12;
        }
        else
        {
          *(v19 - 1) = *begin;
          *v19 = begin[1];
          LOBYTE(v22) = begin[2];
          begin += 3;
        }
        v19[1] = v22;
        if (self->_use_model_pre_A11 && v16 < self->_bias_height_pre_A11)
        {
          if (v21 >= v11)
          {
            if (self->_outdoorScene)
              LOBYTE(bias_mask) = -16;
            else
              LOBYTE(bias_mask) = -1;
            goto LABEL_28;
          }
LABEL_27:
          LOBYTE(bias_mask) = 0;
          goto LABEL_28;
        }
        if (v21 < v11)
          goto LABEL_27;
        bias_mask = self->_bias_mask;
LABEL_28:
        v19[2] = bias_mask;
        v19 += 4;
      }
      ++v16;
      v18 += v14;
    }
    while (v16 != v8);
    r_avg = self->_r_avg;
    v28 = self->_g_avg;
    b_avg = self->_b_avg;
  }
  else
  {
    v17 = 0;
    b_avg = 0.0;
    v28 = 0.0;
    r_avg = 0.0;
  }
  v30 = (float)v17;
  self->_r_avg = powf(r_avg / (float)v17, 2.2);
  self->_g_avg = powf(v28 / v30, 2.2);
  self->_b_avg = powf(b_avg / v30, 2.2);
  kdebug_trace();
  v31 = *(_OWORD *)&self->_vImageBuffer.width;
  *(_OWORD *)&retstr->data = *(_OWORD *)&self->_vImageBuffer.data;
  *(_OWORD *)&retstr->width = v31;

  return result;
}

- (id)toTexture:(id *)a3
{
  unint64_t var4;
  float *var0;
  unint64_t var11;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  float v11;
  float v12;
  ARCubemapCompletion *v13;
  _BYTE *data;
  float v15;
  float *v16;
  uint64_t v17;
  float v18;
  ARCubemapCompletion *v19;
  float v20;
  float *v21;
  unint64_t v22;
  float v23;
  unint64_t v24;
  float v25;
  float v26;
  float *v27;
  float v28;
  float v29;
  float v30;
  _BOOL4 generateHDROutput;
  int v32;
  $FD4688982923A924290ECB669CAF1EC2 *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  float *v45;
  $FD4688982923A924290ECB669CAF1EC2 *v46;
  size_t rowBytes;
  unint64_t v48;
  unint64_t var5;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[6];
  _QWORD v56[6];
  _QWORD v57[6];
  int v58;
  float v59[3];

  kdebug_trace();
  var4 = a3->var4;
  var0 = (float *)a3->var0;
  var11 = a3->var11;
  v45 = (float *)a3->var0;
  v46 = a3;
  var5 = a3->var5;
  v50 = 4 * a3->var10;
  v8 = 4 * a3->var9;
  v48 = var4;
  if (var5)
  {
    v9 = 0;
    v10 = 0;
    rowBytes = self->_vImageBuffer.rowBytes;
    v11 = 0.0;
    v12 = 0.0;
    v13 = self;
    data = self->_vImageBuffer.data;
    v15 = 0.0;
    do
    {
      v51 = v10;
      if (var4)
      {
        v16 = var0;
        v17 = 3;
        do
        {
          if (!data[v17])
          {
            v18 = *v16;
            if (v13->_use_model_pre_A11)
            {
              v11 = v11 + __exp10((float)((float)(v18 * 1023.0) + -445.0) * 0.00444444456) * 0.180000007;
              v12 = v12 + __exp10((float)((float)(v16[var11] * 1023.0) + -445.0) * 0.00444444456) * 0.180000007;
              v15 = v15 + __exp10((float)((float)(v16[2 * var11] * 1023.0) + -445.0) * 0.00444444456) * 0.180000007;
            }
            else
            {
              v11 = v11 + (float)(__exp10f(v18 + 1.0) + -1.0);
              v12 = v12 + (float)(__exp10f(v16[var11] + 1.0) + -1.0);
              v15 = v15 + (float)(__exp10f(v16[2 * var11] + 1.0) + -1.0);
            }
            ++v9;
          }
          v16 = (float *)((char *)v16 + v8);
          v17 += 4;
          --var4;
        }
        while (var4);
      }
      var4 = v48;
      data += rowBytes;
      v10 = v51 + 1;
      var0 = (float *)((char *)var0 + v50);
    }
    while (v51 + 1 != var5);
  }
  else
  {
    v13 = self;
    v9 = 0;
    v15 = 0.0;
    v12 = 0.0;
    v11 = 0.0;
  }
  v19 = v13;
  v20 = (float)((float)((float)(v13->_g_avg * 0.7152) + (float)(v13->_r_avg * 0.2126)) + (float)(v13->_b_avg * 0.0722))
      / (float)((float)((float)((float)(v12 / (float)v9) * 0.7152) + (float)((float)(v11 / (float)v9) * 0.2126))
              + (float)((float)(v15 / (float)v9) * 0.0722));
  v59[0] = v20;
  v21 = v45;
  if (v13->_outdoorScene && var5)
  {
    v22 = 0;
    v23 = 0.05 / v20;
    do
    {
      if (var4)
      {
        v24 = 0;
        v25 = (double)v22 * 3.14159265 / (double)var5;
        v26 = (float)(v25 + -0.7854) * (float)(v25 + -0.7854);
        v27 = v21;
        do
        {
          v28 = (float)(1.0 - (float)((float)v24 / (float)var4)) * 6.28318531;
          v29 = v26 + (float)((float)(v28 + -1.5708) * (float)(v28 + -1.5708));
          if (v29 < 0.017453)
          {
            v30 = 1.0 - expf((float)(0.017453 - v29) / -0.017453);
            *v27 = (float)((float)(1.0 - v30) * *v27) + (float)(v23 * v30);
            v27[var11] = (float)((float)(1.0 - v30) * v27[var11]) + (float)(v23 * v30);
            v27[2 * var11] = (float)((float)(1.0 - v30) * v27[2 * var11]) + (float)(v23 * v30);
          }
          ++v24;
          v27 = (float *)((char *)v27 + v8);
        }
        while (var4 != v24);
      }
      ++v22;
      v21 = (float *)((char *)v21 + v50);
    }
    while (v22 != var5);
  }
  if (!v19->_generateHDROutput)
  {
    v58 = 1065353216;
    v33 = v46;
    goto LABEL_27;
  }
  +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.environmentTexturing.maxHDR"));
  generateHDROutput = v19->_generateHDROutput;
  v58 = v32;
  v33 = v46;
  if (!generateHDROutput)
  {
LABEL_27:
    v34 = 81;
    goto LABEL_28;
  }
  v34 = 115;
LABEL_28:
  -[MTLCommandQueue commandBuffer](v19->_queue, "commandBuffer", v45);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "computeCommandEncoder");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, v48, var5, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setUsage:", 7);
  v37 = (void *)-[MTLDevice newTextureWithDescriptor:](v19->_device, "newTextureWithDescriptor:", v36);
  v38 = (void *)-[MTLDevice newTextureWithDescriptor:](v19->_device, "newTextureWithDescriptor:", v36);
  v39 = (void *)-[MTLDevice newTextureWithDescriptor:](v19->_device, "newTextureWithDescriptor:", v36);
  objc_msgSend(v37, "setLabel:", CFSTR("com.apple.arkit.cubemapcompletion.rplane"));
  objc_msgSend(v38, "setLabel:", CFSTR("com.apple.arkit.cubemapcompletion.gplane"));
  objc_msgSend(v39, "setLabel:", CFSTR("com.apple.arkit.cubemapcompletion.plane"));
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v34, v48, var5, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "setUsage:", 7);
  v41 = (void *)-[MTLDevice newTextureWithDescriptor:](v19->_device, "newTextureWithDescriptor:", v40);
  objc_msgSend(v41, "setLabel:", CFSTR("com.apple.arkit.cubemapcompletion.dst"));
  memset(v57, 0, 24);
  v57[3] = v48;
  v57[4] = var5;
  v57[5] = 1;
  objc_msgSend(v37, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v57, 0, v33->var0, v33->var3[0]);
  memset(v56, 0, 24);
  v56[3] = v48;
  v56[4] = var5;
  v56[5] = 1;
  objc_msgSend(v38, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v56, 0, (char *)v33->var0 + 4 * v33->var11, v33->var3[0]);
  memset(v55, 0, 24);
  v55[3] = v48;
  v55[4] = var5;
  v55[5] = 1;
  objc_msgSend(v39, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v55, 0, (char *)v33->var0 + 8 * v33->var11, v33->var3[0]);
  objc_msgSend(v35, "setComputePipelineState:", v19->_combineBuffersToHDR);
  objc_msgSend(v35, "setTexture:atIndex:", v37, 0);
  objc_msgSend(v35, "setTexture:atIndex:", v38, 1);
  objc_msgSend(v35, "setTexture:atIndex:", v39, 2);
  objc_msgSend(v35, "setTexture:atIndex:", v41, 3);
  objc_msgSend(v35, "setBytes:length:atIndex:", &v58, 4, 0);
  objc_msgSend(v35, "setBytes:length:atIndex:", v59, 4, 1);
  objc_msgSend(v35, "setBytes:length:atIndex:", v59, 4, 2);
  objc_msgSend(v35, "setBytes:length:atIndex:", v59, 4, 3);
  v42 = -[MTLComputePipelineState threadExecutionWidth](v19->_combineBuffersToHDR, "threadExecutionWidth");
  v43 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v19->_combineBuffersToHDR, "maxTotalThreadsPerThreadgroup");
  v54[0] = (v42 + objc_msgSend(v41, "width") - 1) / v42;
  v54[1] = (v43 / v42 + objc_msgSend(v41, "height") - 1) / (v43 / v42);
  v54[2] = 1;
  v53[0] = v42;
  v53[1] = v43 / v42;
  v53[2] = 1;
  objc_msgSend(v35, "dispatchThreadgroups:threadsPerThreadgroup:", v54, v53);
  objc_msgSend(v35, "endEncoding");
  objc_msgSend(v52, "commit");
  objc_msgSend(v52, "waitUntilCompleted");
  objc_msgSend(v41, "width");
  objc_msgSend(v41, "height");
  kdebug_trace();

  return v41;
}

- (id)grayCubemapOfSize:(unint64_t)a3
{
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v15[6];
  void *__p[3];

  v5 = 4 * a3;
  v6 = 4 * a3 * a3;
  std::vector<unsigned char>::vector(__p, v6);
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = a3;
      v10 = v7;
      do
      {
        *((_BYTE *)__p[0] + v10) = 127;
        *((_BYTE *)__p[0] + v10 + 1) = 127;
        *((_BYTE *)__p[0] + v10 + 2) = 127;
        *((_BYTE *)__p[0] + v10 + 3) = -1;
        v10 += 4;
        --v9;
      }
      while (v9);
      ++v8;
      v7 += v5;
    }
    while (v8 != a3);
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 81, a3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsage:", 5);
  v12 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
  for (i = 0; i != 6; ++i)
  {
    memset(v15, 0, 24);
    v15[3] = (void *)a3;
    v15[4] = (void *)a3;
    v15[5] = (void *)1;
    objc_msgSend(v12, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v15, 0, i, __p[0], v5, v6);
  }

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v12;
}

- (id)generateSeamSmoothingTexture
{
  void *v3;
  void *v4;
  _QWORD v6[3];
  int64x2_t v7;
  uint64_t v8;
  _QWORD v9[3];
  int64x2_t v10;
  uint64_t v11;
  _QWORD v12[3];
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
  _OWORD v24[4];
  _OWORD v25[4];
  _OWORD v26[4];
  _OWORD v27[4];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 10, 8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v3);
  objc_msgSend(v4, "setLabel:", CFSTR("com.apple.arkit.cubemapcompletion.roughnesstexture"));
  v27[0] = xmmword_1B3C0B324;
  v27[1] = unk_1B3C0B334;
  v27[2] = xmmword_1B3C0B344;
  v27[3] = unk_1B3C0B354;
  memset(v21, 0, sizeof(v21));
  v22 = vdupq_n_s64(8uLL);
  v23 = 1;
  objc_msgSend(v4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v21, 0, 0, v27, 8, 64);
  v26[0] = xmmword_1B3C0B364;
  v26[1] = unk_1B3C0B374;
  v26[2] = xmmword_1B3C0B384;
  v26[3] = unk_1B3C0B394;
  memset(v18, 0, sizeof(v18));
  v19 = vdupq_n_s64(8uLL);
  v20 = 1;
  objc_msgSend(v4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v18, 0, 2, v26, 8, 64);
  v25[0] = xmmword_1B3C0B364;
  v25[1] = unk_1B3C0B374;
  v25[2] = xmmword_1B3C0B384;
  v25[3] = unk_1B3C0B394;
  memset(v15, 0, sizeof(v15));
  v16 = vdupq_n_s64(8uLL);
  v17 = 1;
  objc_msgSend(v4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v15, 0, 3, v25, 8, 64);
  memset(v24, 0, sizeof(v24));
  memset(v12, 0, sizeof(v12));
  v13 = vdupq_n_s64(8uLL);
  v14 = 1;
  objc_msgSend(v4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v12, 0, 1, v24, 8, 64);
  memset(v9, 0, sizeof(v9));
  v10 = vdupq_n_s64(8uLL);
  v11 = 1;
  objc_msgSend(v4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v9, 0, 4, v24, 8, 64);
  memset(v6, 0, sizeof(v6));
  v7 = vdupq_n_s64(8uLL);
  v8 = 1;
  objc_msgSend(v4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v6, 0, 5, v24, 8, 64);

  return v4;
}

- (BOOL)generateHDROutput
{
  return self->_generateHDROutput;
}

- (void)setGenerateHDROutput:(BOOL)a3
{
  self->_generateHDROutput = a3;
}

- (void).cxx_destruct
{
  char *begin;
  char *v4;

  begin = self->_srgbToLogLUT_pre_A11.__begin_;
  if (begin)
  {
    self->_srgbToLogLUT_pre_A11.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_combineBuffersToHDR, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_roughness, 0);
  objc_storeStrong((id *)&self->_sphericalBlur, 0);
  objc_storeStrong((id *)&self->_cubemapConverter, 0);
  v4 = self->_randomNumbers.__begin_;
  if (v4)
  {
    self->_randomNumbers.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 29) = 0;
  return self;
}

@end
