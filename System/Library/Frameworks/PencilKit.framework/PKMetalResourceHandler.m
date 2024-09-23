@implementation PKMetalResourceHandler

void __69__PKMetalResourceHandler_initWithDevice_generatePipelineDescriptors___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  os_signpost_id_t v50;
  NSObject *v51;
  NSObject *v52;
  os_signpost_id_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  _QWORD v67[4];
  int v68;
  int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  int v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  int v89;
  int v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  int v96;
  int v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  uint8_t buf[8];
  int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  id v110;
  id v111;
  uint8_t v112[16];

  -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PreloadResources", (const char *)&unk_1BE532412, buf, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (!*(_QWORD *)(v5 + 80))
    {
      v6 = objc_msgSend(*(id *)(v5 + 432), "newBufferWithBytes:length:options:", &-[PKMetalResourceHandler _setupCachedQuad]::vertices, 32, 0);
      v7 = *(void **)(v5 + 80);
      *(_QWORD *)(v5 + 80) = v6;

    }
    if (!*(_QWORD *)(v5 + 88))
    {
      v8 = objc_msgSend(*(id *)(v5 + 432), "newBufferWithBytes:length:options:", &-[PKMetalResourceHandler _setupCachedQuad]::texCoords, 32, 0);
      v9 = *(void **)(v5 + 88);
      *(_QWORD *)(v5 + 88) = v8;

    }
    v10 = *(_QWORD *)(a1 + 32);
    if (v10 && !*(_QWORD *)(v10 + 304))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathForResource:ofType:", CFSTR("PencilKit_iOS"), CFSTR("pipelinelib"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 && !*(_BYTE *)(v10 + 424))
      {
        -[PKMetalResourceHandler _signpostLog]((id)v10);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = *(_QWORD *)(v10 + 384);
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          *(_WORD *)v112 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE213000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "LoadPipelineLibrary", (const char *)&unk_1BE532412, v112, 2u);
        }

        v17 = *(void **)(v10 + 432);
        v111 = 0;
        v18 = objc_msgSend(v17, "newPipelineLibraryWithFilePath:error:", v12, &v111);
        v13 = v111;
        v19 = *(void **)(v10 + 416);
        *(_QWORD *)(v10 + 416) = v18;

        -[PKMetalResourceHandler _signpostLog]((id)v10);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = *(_QWORD *)(v10 + 384);
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          *(_WORD *)v112 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE213000, v21, OS_SIGNPOST_INTERVAL_END, v22, "LoadPipelineLibrary", (const char *)&unk_1BE532412, v112, 2u);
        }

      }
      else
      {
        v13 = 0;
      }
      -[PKMetalResourceHandler _signpostLog]((id)v10);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = *(_QWORD *)(v10 + 384);
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)v112 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE213000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PreloadShaders", (const char *)&unk_1BE532412, v112, 2u);
      }

      v26 = *(void **)(v10 + 432);
      v110 = v13;
      v27 = (void *)objc_msgSend(v26, "newDefaultLibraryWithBundle:error:", v11, &v110);
      v28 = v110;

      objc_storeStrong((id *)(v10 + 304), v27);
      if (!*(_QWORD *)(v10 + 24))
      {
        v29 = -[PKMetalResourceHandler newPaintShaderKernelPipelineState](v10);
        v30 = *(void **)(v10 + 24);
        *(_QWORD *)(v10 + 24) = v29;

      }
      if (!*(_QWORD *)(v10 + 64))
      {
        -[PKMetalResourceHandler _paintShaderKernelPipelineStateWithLiveStrokeMode:particles:]((_QWORD *)v10, 1);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(void **)(v10 + 64);
        *(_QWORD *)(v10 + 64) = v31;

      }
      if (!*(_QWORD *)(v10 + 56))
      {
        -[PKMetalResourceHandler _paintShaderKernelPipelineStateWithLiveStrokeMode:particles:]((_QWORD *)v10, 0);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *(void **)(v10 + 56);
        *(_QWORD *)(v10 + 56) = v33;

      }
      v35 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](v10, 0);
      v36 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](v10, 1u);
      v37 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](v10, 0x101u);
      v38 = -[PKMetalResourceHandler _kernelPipelineStateForKey:](v10, 0x100u);
      if (*(_BYTE *)(v10 + 424))
      {
        *(_QWORD *)buf = 3;
        v107 = 0;
        v106 = 0;
        v108 = 0x201010200000000;
        v105 = 1;
        v109 = 0;
        v39 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)buf);
        v98 = 3;
        v101 = 0;
        v100 = 0;
        v99 = 1;
        v102 = 0;
        v103 = 33620226;
        v40 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v98);
        v91 = 4;
        v94 = 0;
        v93 = 0;
        v92 = 1;
        v95 = 0;
        v97 = 0;
        v96 = 33620226;
        v41 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v91);
        v84 = 5;
        v87 = 0;
        v86 = 0;
        v85 = 1;
        v88 = 0;
        v89 = 33620226;
        v90 = 0;
        v42 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v84);
        v77 = 7;
        v80 = 0;
        v79 = 0;
        v78 = 1;
        v81 = 0;
        v82 = 33620226;
        v83 = 0;
        v43 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v77);
        v70 = 11;
        v73 = 0;
        v72 = 0;
        v71 = 1;
        v74 = 0;
        v75 = 33620226;
        v76 = 0;
        v44 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v70);
        v67[0] = 11;
        memset(&v67[1], 0, 24);
        v68 = 33620226;
        v69 = 0;
        v45 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)v67);
        v61 = 2;
        v62 = 1;
        v64 = 0;
        v63 = 0;
        v65 = 0x101010100000000;
        v66 = 0;
        v46 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v61);
        v54 = 11;
        v55 = 1;
        v57 = 0;
        v56 = 0;
        v59 = 16843009;
        v60 = 0;
        v58 = 0;
        v47 = -[PKMetalResourceHandler _namedShaderForKey:](v10, (uint64_t)&v54);
        *(_BYTE *)(v10 + 425) = 0;
        -[PKMetalResourceHandler _preloadUberShaders]((char *)v10);
        *(_BYTE *)(v10 + 425) = 1;
        -[PKMetalResourceHandler _preloadUberShaders]((char *)v10);
      }
      -[PKMetalResourceHandler _signpostLog]((id)v10);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v48;
      v50 = *(_QWORD *)(v10 + 384);
      if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)v112 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE213000, v49, OS_SIGNPOST_INTERVAL_END, v50, "PreloadShaders", (const char *)&unk_1BE532412, v112, 2u);
      }

      v10 = *(_QWORD *)(a1 + 32);
    }
  }
  else
  {
    v10 = 0;
  }
  -[PKMetalResourceHandler _signpostLog]((id)v10);
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = v51;
  v53 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384);
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v52, OS_SIGNPOST_INTERVAL_END, v53, "PreloadResources", (const char *)&unk_1BE532412, buf, 2u);
  }

}

void __38__PKMetalResourceHandler__signpostLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.pencilkit", "metalResourceHandler");
  v1 = (void *)qword_1ECEE6428;
  qword_1ECEE6428 = (uint64_t)v0;

}

- (uint64_t)newPaintShaderKernelPipelineState
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    v3 = -[PKMetalResourceHandler newComputePipelineDescriptor](v1);
    objc_msgSend(v3, "setLabel:", CFSTR("Paint kernel"));
    v4 = (void *)objc_msgSend(*(id *)(v1 + 304), "newFunctionWithName:constantValues:error:", CFSTR("paint_kernel"), v2, 0);
    objc_msgSend(v3, "setComputeFunction:", v4);

    v1 = objc_msgSend(*(id *)(v1 + 432), "newComputePipelineStateWithDescriptor:options:reflection:error:", v3, 0, 0, 0);
  }
  return v1;
}

- (void)newComputePipelineDescriptor
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setPipelineLibrary:", *(_QWORD *)(a1 + 416));
  return v2;
}

- (id)initWithDevice:(char)a3 generatePipelineDescriptors:
{
  id v6;
  char *v7;
  id v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  PKLRUCache *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  id *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD block[4];
  id v30;
  objc_super v31;

  v6 = a2;
  if (!a1)
    goto LABEL_11;
  v31.receiver = a1;
  v31.super_class = (Class)PKMetalResourceHandler;
  v7 = (char *)objc_msgSendSuper2(&v31, sel_init);
  a1 = v7;
  if (!v7)
    goto LABEL_11;
  v8 = +[PKAppBackgroundStateTracker sharedInstance]();
  v7[426] = objc_msgSend(v6, "supportsFamily:", 1001);
  v7[427] = objc_msgSend(v6, "supportsFamily:", 2002);
  v7[428] = +[PKMetalUtility deviceSupportsFramebufferFetch:](PKMetalUtility, "deviceSupportsFramebufferFetch:", v6);
  v7[424] = a3;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("com.apple.PencilKit.MetalResourceHandlerAccessQueue", v9);
  v11 = (void *)*((_QWORD *)v7 + 47);
  *((_QWORD *)v7 + 47) = v10;

  objc_storeStrong((id *)v7 + 54, a2);
  *(int64x2_t *)(v7 + 440) = vdupq_n_s64(0x50uLL);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "_supportsDeepColor");

  if ((_DWORD)v9)
  {
    v13 = PKWideGamutPixelFormatForCurrentDevice();
    *((_QWORD *)v7 + 55) = v13;
    *((_QWORD *)v7 + 56) = v13;
LABEL_7:
    v14 = 1;
    goto LABEL_8;
  }
  if (*((_QWORD *)v7 + 56) != 80)
    goto LABEL_7;
  v14 = *((_QWORD *)v7 + 55) != 80;
LABEL_8:
  v7[429] = v14;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v7 + 12);
  *((_QWORD *)v7 + 12) = v15;

  v17 = objc_alloc_init(PKLRUCache);
  v18 = (void *)*((_QWORD *)v7 + 42);
  *((_QWORD *)v7 + 42) = v17;

  v19 = *((_QWORD *)v7 + 42);
  if (v19)
    *(_QWORD *)(v19 + 64) = 0x8000000;
  v20 = -[PKMetalResourceHandlerBuffer initWithSize:options:device:purgeable:]((id *)[PKMetalResourceHandlerBuffer alloc], (void *)0x200000, 0, v6, 0);
  v21 = (void *)*((_QWORD *)v7 + 50);
  *((_QWORD *)v7 + 50) = v20;

  v22 = -[PKMetalResourceHandlerBuffer initWithSize:options:device:purgeable:]((id *)[PKMetalResourceHandlerBuffer alloc], (void *)0x200000, 0, v6, 1);
  v23 = (void *)*((_QWORD *)v7 + 49);
  *((_QWORD *)v7 + 49) = v22;

  v24 = -[PKMetalResourceHandlerBuffer initWithSize:options:device:purgeable:]((id *)[PKMetalResourceHandlerBuffer alloc], (void *)0x200000, (void *)0x20, v6, 0);
  v25 = (void *)*((_QWORD *)v7 + 51);
  *((_QWORD *)v7 + 51) = v24;

  -[PKMetalResourceHandler _signpostLog](v7);
  v26 = objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v7 + 48) = os_signpost_id_make_with_pointer(v26, v7 + 376);

  v27 = *((_QWORD *)v7 + 47);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKMetalResourceHandler_initWithDevice_generatePipelineDescriptors___block_invoke;
  block[3] = &unk_1E7776F38;
  a1 = a1;
  v30 = a1;
  dispatch_async(v27, block);

LABEL_11:
  return a1;
}

- (id)_signpostLog
{
  if (a1)
  {
    if (qword_1ECEE6430 != -1)
      dispatch_once(&qword_1ECEE6430, &__block_literal_global_116);
    a1 = (id)qword_1ECEE6428;
  }
  return a1;
}

- (_QWORD)_paintShaderKernelPipelineStateWithLiveStrokeMode:(_QWORD *)a1 particles:(int)a2
{
  _QWORD *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  id v13;
  char v14;

  v2 = a1;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    v5 = -[PKMetalResourceHandler newComputePipelineDescriptor]((uint64_t)v2);
    objc_msgSend(v5, "setLabel:", CFSTR("Paint kernel"));
    v14 = 1;
    objc_msgSend(v4, "setConstantValue:type:atIndex:", &v14, 53, 2);
    if (a2)
      objc_msgSend(v4, "setConstantValue:type:atIndex:", &v14, 53, 3);
    v6 = (void *)v2[38];
    v13 = 0;
    v7 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", CFSTR("paint_kernel"), v4, &v13);
    v8 = v13;
    objc_msgSend(v5, "setComputeFunction:", v7);

    v9 = (void *)v2[54];
    v12 = v8;
    v2 = (_QWORD *)objc_msgSend(v9, "newComputePipelineStateWithDescriptor:options:reflection:error:", v5, 0, 0, &v12);
    v10 = v12;

  }
  return v2;
}

- (uint64_t)_kernelPipelineStateForKey:(uint64_t)a1
{
  unint64_t v2;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **i;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint8x8_t v19;
  uint64_t ***v20;
  uint64_t **j;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  id v25;
  float v26;
  float v27;
  _BOOL4 v28;
  unint64_t v29;
  unint64_t v30;
  int8x8_t prime;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint8x8_t v37;
  unint64_t v38;
  uint8x8_t v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  void *v47;
  unsigned __int16 v48;
  _QWORD v49[2];
  char v50;

  v48 = a2;
  if (!a1)
    return (uint64_t *)0;
  v5 = PKHashBytes((uint64_t)&v48, 2);
  v6 = v5;
  v7 = *(int8x8_t *)(a1 + 272);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = v5;
      if (v5 >= *(_QWORD *)&v7)
        v9 = v5 % *(_QWORD *)&v7;
    }
    else
    {
      v9 = (*(_QWORD *)&v7 - 1) & v5;
    }
    v10 = *(uint64_t ****)(*(_QWORD *)(a1 + 264) + 8 * v9);
    if (v10)
    {
      for (i = *v10; i; i = (uint64_t **)*i)
      {
        v12 = (unint64_t)i[1];
        if (v12 == v5)
        {
          if (*((unsigned __int16 *)i + 8) == v48)
            return i[3];
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= *(_QWORD *)&v7)
              v12 %= *(_QWORD *)&v7;
          }
          else
          {
            v12 &= *(_QWORD *)&v7 - 1;
          }
          if (v12 != v9)
            break;
        }
      }
    }
  }
  v13 = -[PKMetalResourceHandler newComputePipelineDescriptor](a1);
  objc_msgSend(v13, "setLabel:", CFSTR("Particle kernel with Variable Particle Spacing"));
  v14 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
  v15 = v14;
  LOBYTE(v49[0]) = 1;
  if ((_BYTE)a2)
    objc_msgSend(v14, "setConstantValue:type:atIndex:", v49, 53, 3);
  if ((a2 & 0xFF00) != 0)
    objc_msgSend(v15, "setConstantValue:type:atIndex:", v49, 53, 4);
  v16 = (void *)objc_msgSend(*(id *)(a1 + 304), "newFunctionWithName:constantValues:error:", CFSTR("particle_kernel"), v15, 0);
  objc_msgSend(v13, "setComputeFunction:", v16);

  v17 = (void *)objc_msgSend(*(id *)(a1 + 432), "newComputePipelineStateWithDescriptor:options:reflection:error:", v13, 0, 0, 0);
  v18 = *(_QWORD *)(a1 + 272);
  if (v18)
  {
    v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      v2 = v6;
      if (v6 >= v18)
        v2 = v6 % v18;
    }
    else
    {
      v2 = (v18 - 1) & v6;
    }
    v20 = *(uint64_t ****)(*(_QWORD *)(a1 + 264) + 8 * v2);
    if (v20)
    {
      for (j = *v20; j; j = (uint64_t **)*j)
      {
        v22 = (unint64_t)j[1];
        if (v22 == v6)
        {
          if (*((unsigned __int16 *)j + 8) == v48)
            return (uint64_t *)v17;
        }
        else
        {
          if (v19.u32[0] > 1uLL)
          {
            if (v22 >= v18)
              v22 %= v18;
          }
          else
          {
            v22 &= v18 - 1;
          }
          if (v22 != v2)
            break;
        }
      }
    }
  }
  v23 = operator new(0x20uLL);
  v24 = (_QWORD *)(a1 + 280);
  v49[0] = v23;
  v49[1] = a1 + 280;
  *v23 = 0;
  v23[1] = v6;
  *((_WORD *)v23 + 8) = a2;
  v25 = v17;
  v23[3] = v25;
  v50 = 1;
  v26 = (float)(unint64_t)(*(_QWORD *)(a1 + 288) + 1);
  v27 = *(float *)(a1 + 296);
  if (!v18 || (float)(v27 * (float)v18) < v26)
  {
    v28 = (v18 & (v18 - 1)) == 0;
    if (v18 < 3)
      v28 = 0;
    v29 = (2 * v18) | !v28;
    v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30)
      prime = (int8x8_t)v30;
    else
      prime = (int8x8_t)v29;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v18 = *(_QWORD *)(a1 + 272);
    if (*(_QWORD *)&prime > v18)
      goto LABEL_51;
    if (*(_QWORD *)&prime < v18)
    {
      v38 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 288) / *(float *)(a1 + 296));
      if (v18 < 3 || (v39 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        v38 = std::__next_prime(v38);
      }
      else
      {
        v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2)
          v38 = v40;
      }
      if (*(_QWORD *)&prime <= v38)
        prime = (int8x8_t)v38;
      if (*(_QWORD *)&prime >= v18)
      {
        v18 = *(_QWORD *)(a1 + 272);
      }
      else
      {
        if (prime)
        {
LABEL_51:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v32 = operator new(8 * *(_QWORD *)&prime);
          v33 = *(void **)(a1 + 264);
          *(_QWORD *)(a1 + 264) = v32;
          if (v33)
            operator delete(v33);
          v34 = 0;
          *(int8x8_t *)(a1 + 272) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * v34++) = 0;
          while (*(_QWORD *)&prime != v34);
          v35 = (_QWORD *)*v24;
          if (*v24)
          {
            v36 = v35[1];
            v37 = (uint8x8_t)vcnt_s8(prime);
            v37.i16[0] = vaddlv_u8(v37);
            if (v37.u32[0] > 1uLL)
            {
              if (v36 >= *(_QWORD *)&prime)
                v36 %= *(_QWORD *)&prime;
            }
            else
            {
              v36 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * v36) = v24;
            v41 = (_QWORD *)*v35;
            if (*v35)
            {
              do
              {
                v42 = v41[1];
                if (v37.u32[0] > 1uLL)
                {
                  if (v42 >= *(_QWORD *)&prime)
                    v42 %= *(_QWORD *)&prime;
                }
                else
                {
                  v42 &= *(_QWORD *)&prime - 1;
                }
                if (v42 != v36)
                {
                  v43 = *(_QWORD *)(a1 + 264);
                  if (!*(_QWORD *)(v43 + 8 * v42))
                  {
                    *(_QWORD *)(v43 + 8 * v42) = v35;
                    goto LABEL_76;
                  }
                  *v35 = *v41;
                  *v41 = **(_QWORD **)(*(_QWORD *)(a1 + 264) + 8 * v42);
                  **(_QWORD **)(*(_QWORD *)(a1 + 264) + 8 * v42) = v41;
                  v41 = v35;
                }
                v42 = v36;
LABEL_76:
                v35 = v41;
                v41 = (_QWORD *)*v41;
                v36 = v42;
              }
              while (v41);
            }
          }
          v18 = (unint64_t)prime;
          goto LABEL_80;
        }
        v47 = *(void **)(a1 + 264);
        *(_QWORD *)(a1 + 264) = 0;
        if (v47)
          operator delete(v47);
        v18 = 0;
        *(_QWORD *)(a1 + 272) = 0;
      }
    }
LABEL_80:
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v6 >= v18)
        v2 = v6 % v18;
      else
        v2 = v6;
    }
    else
    {
      v2 = (v18 - 1) & v6;
    }
  }
  v44 = *(_QWORD **)(*(_QWORD *)(a1 + 264) + 8 * v2);
  if (v44)
  {
    *(_QWORD *)v49[0] = *v44;
    *v44 = v49[0];
  }
  else
  {
    *(_QWORD *)v49[0] = *(_QWORD *)(a1 + 280);
    *(_QWORD *)(a1 + 280) = v49[0];
    *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * v2) = v24;
    if (*(_QWORD *)v49[0])
    {
      v45 = *(_QWORD *)(*(_QWORD *)v49[0] + 8);
      if ((v18 & (v18 - 1)) != 0)
      {
        if (v45 >= v18)
          v45 %= v18;
      }
      else
      {
        v45 &= v18 - 1;
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * v45) = v49[0];
    }
  }
  v49[0] = 0;
  ++*(_QWORD *)(a1 + 288);
  return (uint64_t *)v25;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1065353216;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_DWORD *)self + 64) = 1065353216;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *((_DWORD *)self + 74) = 1065353216;
  return self;
}

+ (id)sharedResourceHandlerWithDevice:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = a2;
  v3 = (id)objc_opt_self();
  objc_sync_enter(v3);
  v4 = (void *)+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler;
  if (!+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler
    || *(id *)(+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler + 432) != v2)
  {
    v5 = -[PKMetalResourceHandler initWithDevice:generatePipelineDescriptors:]([PKMetalResourceHandler alloc], v2, 0);
    v6 = (void *)+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler;
    +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler = (uint64_t)v5;

    v4 = (void *)+[PKMetalResourceHandler sharedResourceHandlerWithDevice:]::sResourceHandler;
  }
  v7 = v4;
  objc_sync_exit(v3);

  return v7;
}

+ (uint64_t)inkBundle
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (PKMetalResourceHandler)init
{
  objc_exception_throw(CFSTR("Not available"));
}

+ (id)generatePipelineDescriptorsForDevice:(id)a3
{
  id v3;
  dispatch_queue_t *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "startCollectingPipelineDescriptors");
  v4 = (dispatch_queue_t *)-[PKMetalResourceHandler initWithDevice:generatePipelineDescriptors:]([PKMetalResourceHandler alloc], v3, 1);
  dispatch_sync(v4[47], &__block_literal_global_71);
  objc_msgSend(v3, "endCollectingPipelineDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initWithDevice:(id)a1
{
  id v3;

  v3 = a2;
  if (a1)
    a1 = -[PKMetalResourceHandler initWithDevice:generatePipelineDescriptors:](a1, v3, 0);

  return a1;
}

- (id)shaderLibrary
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PKMetalResourceHandler_shaderLibrary__block_invoke;
  v4[3] = &unk_1E7777418;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__PKMetalResourceHandler_shaderLibrary__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 304));
}

- (uint64_t)isAppInBackground
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;

  +[PKAppBackgroundStateTracker sharedInstance]();
  v0 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = atomic_load(v0 + 8);
    v2 = v1 & 1;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)strokeRenderCache
{
  if (a1)
    a1 = (id *)a1[42];
  return a1;
}

- (id)_pipelineDescriptorForConfig:(uint64_t)a1
{
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  int8x8_t v6;
  uint8x8_t v7;
  unint64_t v8;
  uint64_t **v9;
  uint64_t *i;
  unint64_t v11;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint8x8_t v18;
  uint64_t **v19;
  uint64_t *v20;
  unint64_t v21;
  _QWORD *v23;
  _QWORD *v24;
  id v25;
  float v26;
  float v27;
  _BOOL4 v28;
  unint64_t v29;
  unint64_t v30;
  int8x8_t prime;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint8x8_t v37;
  unint64_t v38;
  uint8x8_t v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  void *v48;
  int v49;
  unsigned __int16 v50;

  v49 = a2;
  v50 = WORD2(a2);
  v4 = PKHashBytes((uint64_t)&v49, 6);
  v5 = v4;
  v6 = *(int8x8_t *)(a1 + 232);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8(v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = v4;
      if (v4 >= *(_QWORD *)&v6)
        v8 = v4 % *(_QWORD *)&v6;
    }
    else
    {
      v8 = (*(_QWORD *)&v6 - 1) & v4;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)(a1 + 224) + 8 * v8);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t *)*i)
      {
        v11 = i[1];
        if (v11 == v4)
        {
          if (*((_DWORD *)i + 4) == v49 && *((unsigned __int16 *)i + 10) == v50)
            return (id)i[3];
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= *(_QWORD *)&v6)
              v11 %= *(_QWORD *)&v6;
          }
          else
          {
            v11 &= *(_QWORD *)&v6 - 1;
          }
          if (v11 != v8)
            break;
        }
      }
    }
  }
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPipelineLibrary:", *(_QWORD *)(a1 + 416));
  v14 = 0;
  while (2)
  {
    switch(*((_BYTE *)&v49 + v14))
    {
      case 0:
        goto LABEL_29;
      case 1:
        v2 = 10;
        goto LABEL_28;
      case 2:
        v2 = 80;
        goto LABEL_28;
      case 3:
        v2 = PKWideGamutPixelFormatForCurrentDevice();
        goto LABEL_28;
      case 4:
        v2 = 554;
        goto LABEL_28;
      default:
        v2 = 0;
LABEL_28:
        objc_msgSend(v13, "colorAttachments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPixelFormat:", v2);

        if (++v14 != 6)
          continue;
LABEL_29:
        objc_msgSend(v13, "setStencilAttachmentPixelFormat:", 0);
        objc_msgSend(v13, "setPipelineLibrary:", *(_QWORD *)(a1 + 416));
        v17 = *(_QWORD *)(a1 + 232);
        if (!v17)
          goto LABEL_50;
        v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          v2 = v5;
          if (v5 >= v17)
            v2 = v5 % v17;
        }
        else
        {
          v2 = (v17 - 1) & v5;
        }
        v19 = *(uint64_t ***)(*(_QWORD *)(a1 + 224) + 8 * v2);
        if (!v19)
          goto LABEL_50;
        v20 = *v19;
        if (!v20)
          goto LABEL_50;
        break;
    }
    break;
  }
  while (1)
  {
    v21 = v20[1];
    if (v21 != v5)
      break;
    if (*((_DWORD *)v20 + 4) == v49 && *((unsigned __int16 *)v20 + 10) == v50)
      return v13;
LABEL_49:
    v20 = (uint64_t *)*v20;
    if (!v20)
      goto LABEL_50;
  }
  if (v18.u32[0] > 1uLL)
  {
    if (v21 >= v17)
      v21 %= v17;
  }
  else
  {
    v21 &= v17 - 1;
  }
  if (v21 == v2)
    goto LABEL_49;
LABEL_50:
  v23 = operator new(0x20uLL);
  v24 = (_QWORD *)(a1 + 240);
  *v23 = 0;
  v23[1] = v5;
  *((_DWORD *)v23 + 4) = v49;
  *((_WORD *)v23 + 10) = v50;
  v25 = v13;
  v23[3] = v25;
  v26 = (float)(unint64_t)(*(_QWORD *)(a1 + 248) + 1);
  v27 = *(float *)(a1 + 256);
  if (!v17 || (float)(v27 * (float)v17) < v26)
  {
    v28 = (v17 & (v17 - 1)) == 0;
    if (v17 < 3)
      v28 = 0;
    v29 = (2 * v17) | !v28;
    v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30)
      prime = (int8x8_t)v30;
    else
      prime = (int8x8_t)v29;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v17 = *(_QWORD *)(a1 + 232);
    if (*(_QWORD *)&prime <= v17)
    {
      if (*(_QWORD *)&prime < v17)
      {
        v38 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 248) / *(float *)(a1 + 256));
        if (v17 < 3 || (v39 = (uint8x8_t)vcnt_s8((int8x8_t)v17), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
        {
          v38 = std::__next_prime(v38);
        }
        else
        {
          v40 = 1 << -(char)__clz(v38 - 1);
          if (v38 >= 2)
            v38 = v40;
        }
        if (*(_QWORD *)&prime <= v38)
          prime = (int8x8_t)v38;
        if (*(_QWORD *)&prime >= v17)
        {
          v17 = *(_QWORD *)(a1 + 232);
        }
        else
        {
          if (prime)
            goto LABEL_62;
          v48 = *(void **)(a1 + 224);
          *(_QWORD *)(a1 + 224) = 0;
          if (v48)
            operator delete(v48);
          v17 = 0;
          *(_QWORD *)(a1 + 232) = 0;
        }
      }
    }
    else
    {
LABEL_62:
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v32 = operator new(8 * *(_QWORD *)&prime);
      v33 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v32;
      if (v33)
        operator delete(v33);
      v34 = 0;
      *(int8x8_t *)(a1 + 232) = prime;
      do
        *(_QWORD *)(*(_QWORD *)(a1 + 224) + 8 * v34++) = 0;
      while (*(_QWORD *)&prime != v34);
      v35 = (_QWORD *)*v24;
      if (*v24)
      {
        v36 = v35[1];
        v37 = (uint8x8_t)vcnt_s8(prime);
        v37.i16[0] = vaddlv_u8(v37);
        if (v37.u32[0] > 1uLL)
        {
          if (v36 >= *(_QWORD *)&prime)
            v36 %= *(_QWORD *)&prime;
        }
        else
        {
          v36 &= *(_QWORD *)&prime - 1;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 224) + 8 * v36) = v24;
        v41 = (_QWORD *)*v35;
        if (*v35)
        {
          do
          {
            v42 = v41[1];
            if (v37.u32[0] > 1uLL)
            {
              if (v42 >= *(_QWORD *)&prime)
                v42 %= *(_QWORD *)&prime;
            }
            else
            {
              v42 &= *(_QWORD *)&prime - 1;
            }
            if (v42 != v36)
            {
              v43 = *(_QWORD *)(a1 + 224);
              if (!*(_QWORD *)(v43 + 8 * v42))
              {
                *(_QWORD *)(v43 + 8 * v42) = v35;
                goto LABEL_87;
              }
              *v35 = *v41;
              *v41 = **(_QWORD **)(*(_QWORD *)(a1 + 224) + 8 * v42);
              **(_QWORD **)(*(_QWORD *)(a1 + 224) + 8 * v42) = v41;
              v41 = v35;
            }
            v42 = v36;
LABEL_87:
            v35 = v41;
            v41 = (_QWORD *)*v41;
            v36 = v42;
          }
          while (v41);
        }
      }
      v17 = (unint64_t)prime;
    }
    if ((v17 & (v17 - 1)) != 0)
    {
      if (v5 >= v17)
        v2 = v5 % v17;
      else
        v2 = v5;
    }
    else
    {
      v2 = (v17 - 1) & v5;
    }
  }
  v44 = *(_QWORD *)(a1 + 224);
  v45 = *(_QWORD **)(v44 + 8 * v2);
  if (v45)
  {
    *v23 = *v45;
  }
  else
  {
    *v23 = *v24;
    *v24 = v23;
    *(_QWORD *)(v44 + 8 * v2) = v24;
    if (!*v23)
      goto LABEL_105;
    v46 = *(_QWORD *)(*v23 + 8);
    if ((v17 & (v17 - 1)) != 0)
    {
      if (v46 >= v17)
        v46 %= v17;
    }
    else
    {
      v46 &= v17 - 1;
    }
    v45 = (_QWORD *)(*(_QWORD *)(a1 + 224) + 8 * v46);
  }
  *v45 = v23;
LABEL_105:
  ++*(_QWORD *)(a1 + 248);
  v13 = v25;
  return v13;
}

- (id)sixChannelShaderWithMode:(char)a3 clipping:(char)a4 erase:(char)a5 bitmapEraserMask:(char)a6 snapshotImage:(char)a7 renderMask:(char)a8 secondaryPaintEnabled:(uint64_t)a9 colorAttachmentIndex:(int)a10 pipelineConfig:(__int16)a11
{
  NSObject *v11;
  id v12;
  _QWORD v14[8];
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  if (!a1)
    return 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__25;
  v27 = __Block_byref_object_dispose__25;
  v28 = 0;
  v11 = *(NSObject **)(a1 + 376);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __166__PKMetalResourceHandler_sixChannelShaderWithMode_clipping_erase_bitmapEraserMask_snapshotImage_renderMask_secondaryPaintEnabled_colorAttachmentIndex_pipelineConfig___block_invoke;
  v14[3] = &unk_1E777C5E0;
  v15 = a3;
  v16 = a7;
  v14[6] = a9;
  v14[7] = a2;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a10;
  v22 = a11;
  v14[4] = a1;
  v14[5] = &v23;
  dispatch_sync(v11, v14);
  v12 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v12;
}

void __166__PKMetalResourceHandler_sixChannelShaderWithMode_clipping_erase_bitmapEraserMask_snapshotImage_renderMask_secondaryPaintEnabled_colorAttachmentIndex_pipelineConfig___block_invoke(uint64_t a1)
{
  unsigned int v1;
  int *v2;
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int8x8_t v14;
  uint8x8_t v15;
  unint64_t v16;
  uint64_t ***v17;
  uint64_t **i;
  unint64_t v19;
  id v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  PKMetalShader *v33;
  uint64_t j;
  uint64_t *v35;
  unint64_t v36;
  uint8x8_t v37;
  _QWORD *v38;
  _QWORD *v39;
  unint64_t v40;
  _QWORD *v44;
  _QWORD *v45;
  __int128 v46;
  float v47;
  float v48;
  _BOOL4 v49;
  unint64_t v50;
  unint64_t v51;
  int8x8_t prime;
  void *v53;
  void *v54;
  uint64_t v55;
  _QWORD *v56;
  unint64_t v57;
  uint8x8_t v58;
  unint64_t v59;
  uint8x8_t v60;
  uint64_t v61;
  _QWORD *v62;
  unint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t *v70;
  void *v71;
  int v72;
  id v74;
  __int128 v75;
  __int128 v76;
  unsigned int v77;
  unsigned __int16 v78;
  id v79[2];
  char v80;
  unsigned int v81;
  unsigned __int16 v82;
  id v83;
  unsigned int v84;
  char v85;

  HIWORD(v76) = 0;
  *(_DWORD *)((char *)&v76 + 10) = 0;
  v2 = (int *)(a1 + 70);
  v1 = *(_DWORD *)(a1 + 70);
  v3 = *(unsigned __int8 *)(a1 + 64);
  v4 = *(_DWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 65);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(unsigned __int8 *)(a1 + 66);
  v8 = *(unsigned __int8 *)(a1 + 67);
  v9 = *(unsigned __int8 *)(a1 + 68);
  v10 = *(unsigned __int8 *)(a1 + 69);
  WORD4(v76) = *(_WORD *)(a1 + 74);
  v11 = *(_QWORD *)(a1 + 32);
  LOBYTE(v75) = v3;
  BYTE1(v75) = v5;
  BYTE2(v75) = v9;
  BYTE3(v75) = v7;
  BYTE4(v75) = v8;
  v72 = v10;
  BYTE5(v75) = v10;
  WORD3(v75) = 0;
  *((_QWORD *)&v75 + 1) = v6;
  *(_QWORD *)&v76 = __PAIR64__(v1, v4);
  if (v11)
  {
    v12 = PKHashBytes((uint64_t)&v75, 32);
    v13 = v12;
    v14 = *(int8x8_t *)(v11 + 152);
    if (v14)
    {
      v15 = (uint8x8_t)vcnt_s8(v14);
      v15.i16[0] = vaddlv_u8(v15);
      if (v15.u32[0] > 1uLL)
      {
        v16 = v12;
        if (v12 >= *(_QWORD *)&v14)
          v16 = v12 % *(_QWORD *)&v14;
      }
      else
      {
        v16 = (*(_QWORD *)&v14 - 1) & v12;
      }
      v17 = *(uint64_t ****)(*(_QWORD *)(v11 + 144) + 8 * v16);
      if (v17)
      {
        for (i = *v17; i; i = (uint64_t **)*i)
        {
          v19 = (unint64_t)i[1];
          if (v19 == v12)
          {
            if (i[2] == (uint64_t *)v75
              && i[3] == *((uint64_t **)&v75 + 1)
              && i[4] == (uint64_t *)v76
              && i[5] == *((uint64_t **)&v76 + 1))
            {
              v70 = i[6];
              goto LABEL_136;
            }
          }
          else
          {
            if (v15.u32[0] > 1uLL)
            {
              if (v19 >= *(_QWORD *)&v14)
                v19 %= *(_QWORD *)&v14;
            }
            else
            {
              v19 &= *(_QWORD *)&v14 - 1;
            }
            if (v19 != v16)
              break;
          }
        }
      }
    }
    v77 = *v2;
    v78 = *((_WORD *)v2 + 2);
    v74 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    v23 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    v85 = 1;
    if (v3)
    {
      objc_msgSend(v74, "setConstantValue:type:atIndex:", &v85, 53, 1);
      objc_msgSend(v23, "setConstantValue:type:atIndex:", &v85, 53, 1);
    }
    if (v9)
      objc_msgSend(v23, "setConstantValue:type:atIndex:", &v85, 53, 3);
    if (v5)
      objc_msgSend(v23, "setConstantValue:type:atIndex:", &v85, 53, 2);
    if (*(_BYTE *)(v11 + 428))
      objc_msgSend(v23, "setConstantValue:type:atIndex:", &v85, 53, 7);
    if (v7)
      objc_msgSend(v23, "setConstantValue:type:atIndex:", &v85, 53, 0);
    if (v72)
      objc_msgSend(v23, "setConstantValue:type:atIndex:", &v85, 53, 8);
    if (v8)
      objc_msgSend(v23, "setConstantValue:type:atIndex:", &v85, 53, 9);
    if (v6 == 1)
    {
      v24 = 5;
    }
    else
    {
      if (v6 != 2)
      {
LABEL_47:
        v84 = v4;
        objc_msgSend(v23, "setConstantValue:type:atIndex:", &v84, 33, 6);
        v25 = *(void **)(v11 + 304);
        v79[0] = 0;
        v26 = (unint64_t)v74;
        v27 = (void *)objc_msgSend(v25, "newFunctionWithName:constantValues:error:", CFSTR("sixChannelBlend_vertex"), v74, v79);
        v28 = v79[0];
        v29 = *(void **)(v11 + 304);
        v83 = 0;
        v30 = (void *)objc_msgSend(v29, "newFunctionWithName:constantValues:error:", CFSTR("sixChannelBlend_fragment"), v23, &v83);
        v31 = v83;
        if (!v27 || !v30)
          objc_exception_throw(CFSTR("Failed to compile shader"));
        v82 = v78;
        v81 = v77;
        -[PKMetalResourceHandler _pipelineDescriptorForConfig:](v11, v77 | ((unint64_t)v78 << 32));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = [PKMetalShader alloc];
        for (j = 0; j != 6; ++j)
        {
          if (!*((_BYTE *)&v81 + j))
            break;
        }
        v35 = (uint64_t *)-[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v33, v27, v30, 0, v84, v32, j);

        v36 = *(_QWORD *)(v11 + 152);
        if (v36)
        {
          v37 = (uint8x8_t)vcnt_s8((int8x8_t)v36);
          v37.i16[0] = vaddlv_u8(v37);
          if (v37.u32[0] > 1uLL)
          {
            v26 = v13;
            if (v13 >= v36)
              v26 = v13 % v36;
          }
          else
          {
            v26 = (v36 - 1) & v13;
          }
          v38 = *(_QWORD **)(*(_QWORD *)(v11 + 144) + 8 * v26);
          if (v38)
          {
            v39 = (_QWORD *)*v38;
            if (v39)
            {
              v70 = v35;
              do
              {
                v40 = v39[1];
                if (v40 == v13)
                {
                  if (v39[2] == (_QWORD)v75
                    && v39[3] == *((_QWORD *)&v75 + 1)
                    && v39[4] == (_QWORD)v76
                    && v39[5] == *((_QWORD *)&v76 + 1))
                  {
                    goto LABEL_136;
                  }
                }
                else
                {
                  if (v37.u32[0] > 1uLL)
                  {
                    if (v40 >= v36)
                      v40 %= v36;
                  }
                  else
                  {
                    v40 &= v36 - 1;
                  }
                  if (v40 != v26)
                    break;
                }
                v39 = (_QWORD *)*v39;
              }
              while (v39);
            }
          }
        }
        v44 = operator new(0x38uLL);
        v45 = (_QWORD *)(v11 + 160);
        v79[0] = v44;
        v79[1] = (id)(v11 + 160);
        *v44 = 0;
        v44[1] = v13;
        v46 = v76;
        *((_OWORD *)v44 + 1) = v75;
        *((_OWORD *)v44 + 2) = v46;
        v70 = v35;
        v44[6] = v70;
        v80 = 1;
        v47 = (float)(unint64_t)(*(_QWORD *)(v11 + 168) + 1);
        v48 = *(float *)(v11 + 176);
        if (v36 && (float)(v48 * (float)v36) >= v47)
          goto LABEL_126;
        v49 = (v36 & (v36 - 1)) == 0;
        if (v36 < 3)
          v49 = 0;
        v50 = (2 * v36) | !v49;
        v51 = vcvtps_u32_f32(v47 / v48);
        if (v50 <= v51)
          prime = (int8x8_t)v51;
        else
          prime = (int8x8_t)v50;
        if (*(_QWORD *)&prime == 1)
        {
          prime = (int8x8_t)2;
        }
        else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
        {
          prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        }
        v36 = *(_QWORD *)(v11 + 152);
        if (*(_QWORD *)&prime > v36)
          goto LABEL_92;
        if (*(_QWORD *)&prime < v36)
        {
          v59 = vcvtps_u32_f32((float)*(unint64_t *)(v11 + 168) / *(float *)(v11 + 176));
          if (v36 < 3 || (v60 = (uint8x8_t)vcnt_s8((int8x8_t)v36), v60.i16[0] = vaddlv_u8(v60), v60.u32[0] > 1uLL))
          {
            v59 = std::__next_prime(v59);
          }
          else
          {
            v61 = 1 << -(char)__clz(v59 - 1);
            if (v59 >= 2)
              v59 = v61;
          }
          if (*(_QWORD *)&prime <= v59)
            prime = (int8x8_t)v59;
          if (*(_QWORD *)&prime >= v36)
          {
            v36 = *(_QWORD *)(v11 + 152);
          }
          else
          {
            if (prime)
            {
LABEL_92:
              if (*(_QWORD *)&prime >> 61)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v53 = operator new(8 * *(_QWORD *)&prime);
              v54 = *(void **)(v11 + 144);
              *(_QWORD *)(v11 + 144) = v53;
              if (v54)
                operator delete(v54);
              v55 = 0;
              *(int8x8_t *)(v11 + 152) = prime;
              do
                *(_QWORD *)(*(_QWORD *)(v11 + 144) + 8 * v55++) = 0;
              while (*(_QWORD *)&prime != v55);
              v56 = (_QWORD *)*v45;
              if (*v45)
              {
                v57 = v56[1];
                v58 = (uint8x8_t)vcnt_s8(prime);
                v58.i16[0] = vaddlv_u8(v58);
                if (v58.u32[0] > 1uLL)
                {
                  if (v57 >= *(_QWORD *)&prime)
                    v57 %= *(_QWORD *)&prime;
                }
                else
                {
                  v57 &= *(_QWORD *)&prime - 1;
                }
                *(_QWORD *)(*(_QWORD *)(v11 + 144) + 8 * v57) = v45;
                v62 = (_QWORD *)*v56;
                if (*v56)
                {
                  do
                  {
                    v63 = v62[1];
                    if (v58.u32[0] > 1uLL)
                    {
                      if (v63 >= *(_QWORD *)&prime)
                        v63 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v63 &= *(_QWORD *)&prime - 1;
                    }
                    if (v63 != v57)
                    {
                      v64 = *(_QWORD *)(v11 + 144);
                      if (!*(_QWORD *)(v64 + 8 * v63))
                      {
                        *(_QWORD *)(v64 + 8 * v63) = v56;
                        goto LABEL_117;
                      }
                      *v56 = *v62;
                      *v62 = **(_QWORD **)(*(_QWORD *)(v11 + 144) + 8 * v63);
                      **(_QWORD **)(*(_QWORD *)(v11 + 144) + 8 * v63) = v62;
                      v62 = v56;
                    }
                    v63 = v57;
LABEL_117:
                    v56 = v62;
                    v62 = (_QWORD *)*v62;
                    v57 = v63;
                  }
                  while (v62);
                }
              }
              v36 = (unint64_t)prime;
              goto LABEL_121;
            }
            v71 = *(void **)(v11 + 144);
            *(_QWORD *)(v11 + 144) = 0;
            if (v71)
              operator delete(v71);
            v36 = 0;
            *(_QWORD *)(v11 + 152) = 0;
          }
        }
LABEL_121:
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v13 >= v36)
            v26 = v13 % v36;
          else
            v26 = v13;
        }
        else
        {
          v26 = (v36 - 1) & v13;
        }
LABEL_126:
        v65 = *(_QWORD **)(*(_QWORD *)(v11 + 144) + 8 * v26);
        if (v65)
        {
          *(_QWORD *)v79[0] = *v65;
          *v65 = v79[0];
          v66 = a1;
        }
        else
        {
          *(_QWORD *)v79[0] = *(_QWORD *)(v11 + 160);
          *(id *)(v11 + 160) = v79[0];
          *(_QWORD *)(*(_QWORD *)(v11 + 144) + 8 * v26) = v45;
          v66 = a1;
          if (*(_QWORD *)v79[0])
          {
            v67 = *(_QWORD *)(*(_QWORD *)v79[0] + 8);
            if ((v36 & (v36 - 1)) != 0)
            {
              if (v67 >= v36)
                v67 %= v36;
            }
            else
            {
              v67 &= v36 - 1;
            }
            *(id *)(*(_QWORD *)(v11 + 144) + 8 * v67) = v79[0];
          }
        }
        v79[0] = 0;
        ++*(_QWORD *)(v11 + 168);
        goto LABEL_135;
      }
      v24 = 4;
    }
    objc_msgSend(v23, "setConstantValue:type:atIndex:", &v85, 53, v24);
    goto LABEL_47;
  }
  v70 = 0;
LABEL_136:
  v66 = a1;
LABEL_135:
  v68 = *(_QWORD *)(*(_QWORD *)(v66 + 40) + 8);
  v69 = *(void **)(v68 + 40);
  *(_QWORD *)(v68 + 40) = v70;

}

- (id)sixChannelCopyToCanvasPipelineState
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PKMetalResourceHandler_sixChannelCopyToCanvasPipelineState__block_invoke;
  v4[3] = &unk_1E7777418;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __61__PKMetalResourceHandler_sixChannelCopyToCanvasPipelineState__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
    v21 = 0;
    v4 = (void *)objc_msgSend(v3, "newFunctionWithName:constantValues:error:", CFSTR("sixChannelBlend_vertex"), v2, &v21);
    v5 = v21;
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
    v20 = 0;
    v7 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", CFSTR("sixChannelBlend_copyToCanvas"), v2, &v20);
    v8 = v20;
    if (v4)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      objc_exception_throw(CFSTR("Failed to compile shader"));
    v10 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    objc_msgSend(v10, "setLabel:", CFSTR("Six Channel Copy to Canvas"));
    objc_msgSend(v10, "setVertexFunction:", v4);
    objc_msgSend(v10, "setFragmentFunction:", v7);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440);
    objc_msgSend(v10, "colorAttachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPixelFormat:", v11);

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
    v19 = 0;
    v15 = objc_msgSend(v14, "newRenderPipelineStateWithDescriptor:error:", v10, &v19);
    v16 = v19;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v15;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

void __61__PKMetalResourceHandler__createSDFPenMaxHeightLookupTexture__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double b;
  double d;
  double v8;
  double ty;
  __double2 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  CGAffineTransform v18;

  std::vector<float>::resize(qword_1ECEE6440, 0x200uLL);
  v2 = 0;
  v3 = qword_1ECEE6440[0];
  do
  {
    memset(&v18, 0, sizeof(v18));
    v16 = (double)v2 * 3.14159265 / 511.0;
    CGAffineTransformMakeRotation(&v18, v16);
    v4 = 0;
    v5 = *(float *)(a1 + 32);
    b = v18.b;
    d = v18.d;
    v8 = 0.0;
    ty = v18.ty;
    v17 = 0.0;
    do
    {
      v10 = __sincos_stret((double)v4 * 3.14159265 / 511.0);
      v11 = v10.__sinval * v5;
      v12 = ty + d * (v10.__sinval * v5) + b * v10.__cosval;
      if (v12 >= 0.0)
        v13 = ty + d * v11 + b * v10.__cosval;
      else
        v13 = -v12;
      if (v13 > v8)
      {
        v17 = atan2(v11, v10.__cosval);
        v8 = v13;
      }
      ++v4;
    }
    while (v4 != 512);
    v14 = v16 + v17;
    if (v16 + v17 > 3.14159265)
      v14 = v16 + v17 + -3.14159265;
    v15 = v14;
    *(float *)(v3 + 4 * v2++) = v15;
  }
  while (v2 != 512);
}

- (id)_createSDFPenEllipseLookupTexture
{
  id *v1;
  PKInk *v2;
  void *v3;
  PKInk *v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  unsigned __int8 v9;
  _QWORD v11[3];
  __int128 v12;
  uint64_t v13;
  _QWORD block[4];
  float v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v1 = a1;
  if (a1)
  {
    v2 = [PKInk alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PKInk initWithInkType:color:](v2, "initWithInkType:color:", CFSTR("com.apple.ink.fountainpen"), v3);

    -[PKInk behavior](v4, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "inkTransform");
      v7 = *((double *)&v17 + 1);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v16 = 0u;
      v7 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, 512, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = atomic_load((unsigned __int8 *)&qword_1ECEE6408);
    if ((v9 & 1) == 0 && __cxa_guard_acquire(&qword_1ECEE6408))
    {
      __cxa_atexit((void (*)(void *))std::vector<float>::~vector[abi:ne180100], qword_1ECEE6458, &dword_1BE213000);
      __cxa_guard_release(&qword_1ECEE6408);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PKMetalResourceHandler__createSDFPenEllipseLookupTexture__block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    v15 = v7;
    if (qword_1ECEE6410 != -1)
      dispatch_once(&qword_1ECEE6410, block);
    v1 = (id *)objc_msgSend(v1[54], "newTextureWithDescriptor:", v8);
    memset(v11, 0, sizeof(v11));
    v12 = xmmword_1BE4FE6E0;
    v13 = 1;
    objc_msgSend(v1, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v11, 0, qword_1ECEE6458[0], 2048);

  }
  return v1;
}

void __59__PKMetalResourceHandler__createSDFPenEllipseLookupTexture__block_invoke(uint64_t a1)
{
  uint64_t v2;
  float32x2_t v8;
  float v9;
  uint64_t v10;
  float64x2_t v12;
  __double2 v13;
  float32x2_t v14;
  float v15;
  float v16;
  float v17;
  float32x2_t v18;
  float v19;
  float v20;
  float32x2_t v21;
  float32x2_t v22;

  std::vector<float>::resize(qword_1ECEE6458, 0x200uLL);
  v2 = 0;
  __asm { FMOV            V1.2S, #1.0 }
  _D1.i32[1] = *(_DWORD *)(a1 + 32);
  v22 = _D1;
  v8 = vdiv_f32(0, _D1);
  v9 = vaddv_f32(vmul_f32(v8, v8)) + -1.0;
  v10 = qword_1ECEE6458[0];
  __asm { FMOV            V0.4S, #1.0 }
  do
  {
    v13 = __sincos_stret((double)v2 * 3.14159265 / 511.0);
    v12.f64[0] = v13.__cosval;
    v12.f64[1] = v13.__sinval;
    v14 = vcvt_f32_f64(v12);
    *(float32x2_t *)&v12.f64[0] = vdiv_f32(v14, v22);
    v15 = vaddv_f32(vmul_f32(*(float32x2_t *)&v12.f64[0], *(float32x2_t *)&v12.f64[0]));
    v16 = vaddv_f32(vmul_f32(v8, *(float32x2_t *)&v12.f64[0]));
    v17 = (float)(v16 * v16) - (float)(v15 * v9);
    v18 = 0;
    if (v17 >= 0.0)
    {
      v19 = sqrtf(v17);
      v20 = fmaxf((float)((float)-v16 - v19) / v15, (float)(v19 - v16) / v15);
      if (v20 >= 0.0)
        v18 = vmla_n_f32(0, v14, v20);
    }
    v21 = vsub_f32(v14, v18);
    *(float *)(v10 + 4 * v2++) = 1.0 - sqrtf(vaddv_f32(vmul_f32(v21, v21)));
  }
  while (v2 != 512);
}

- (id)sdfPenMaxHeightLookupTexture
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PKMetalResourceHandler_sdfPenMaxHeightLookupTexture__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __54__PKMetalResourceHandler_sdfPenMaxHeightLookupTexture__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  PKInk *v6;
  void *v7;
  PKInk *v8;
  void *v9;
  void *v10;
  float v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD block[4];
  float v18;
  _OWORD v19[3];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (!v3)
  {
    v4 = -[PKMetalResourceHandler _createSDFPenEllipseLookupTexture]((id *)v2);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = [PKInk alloc];
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKInk initWithInkType:color:](v6, "initWithInkType:color:", CFSTR("com.apple.ink.fountainpen"), v7);

    -[PKInk behavior](v8, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "inkTransform");
      v11 = *((double *)&v19[1] + 1);
    }
    else
    {
      memset(v19, 0, sizeof(v19));
      v11 = 0.0;
    }

    v12 = atomic_load((unsigned __int8 *)&qword_1ECEE63F8);
    if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_1ECEE63F8))
    {
      __cxa_atexit((void (*)(void *))std::vector<float>::~vector[abi:ne180100], qword_1ECEE6440, &dword_1BE213000);
      __cxa_guard_release(&qword_1ECEE63F8);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKMetalResourceHandler__createSDFPenMaxHeightLookupTexture__block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    v18 = v11;
    if (qword_1ECEE6400 != -1)
      dispatch_once(&qword_1ECEE6400, block);
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, 512, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(*(id *)(v5 + 432), "newTextureWithDescriptor:", v13);
    memset(v19, 0, 24);
    *(_OWORD *)((char *)&v19[1] + 8) = xmmword_1BE4FE6E0;
    *((_QWORD *)&v19[2] + 1) = 1;
    objc_msgSend(v14, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v19, 0, qword_1ECEE6440[0], 2048);

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)sdfPenEllipseLookupTexture
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PKMetalResourceHandler_sdfPenEllipseLookupTexture__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __52__PKMetalResourceHandler_sdfPenEllipseLookupTexture__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (!v3)
  {
    -[PKMetalResourceHandler _createSDFPenEllipseLookupTexture]((id *)v2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)kernelPipelineStateForKey:(uint64_t)a1
{
  NSObject *v2;
  id v3;
  _QWORD block[6];
  __int16 v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!a1)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  v12 = 0;
  v2 = *(NSObject **)(a1 + 376);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKMetalResourceHandler_kernelPipelineStateForKey___block_invoke;
  block[3] = &unk_1E777C628;
  block[4] = a1;
  block[5] = &v7;
  v6 = a2;
  dispatch_sync(v2, block);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __52__PKMetalResourceHandler_kernelPipelineStateForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[PKMetalResourceHandler _kernelPipelineStateForKey:](*(_QWORD *)(a1 + 32), *(_WORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)particleShaderKernelPipelineStateWithVariableSpacing:(int)a3 particleMasks:
{
  __int16 v3;

  if (a1)
  {
    v3 = 256;
    if (!a3)
      v3 = 0;
    -[PKMetalResourceHandler kernelPipelineStateForKey:]((uint64_t)a1, v3 | a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)paintShaderKernelPipelineState
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PKMetalResourceHandler_paintShaderKernelPipelineState__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __56__PKMetalResourceHandler_paintShaderKernelPipelineState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    v4 = -[PKMetalResourceHandler newPaintShaderKernelPipelineState](v2);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)sdfPenShaderKernelPipelineState
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PKMetalResourceHandler_sdfPenShaderKernelPipelineState__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __57__PKMetalResourceHandler_sdfPenShaderKernelPipelineState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    v5 = -[PKMetalResourceHandler newComputePipelineDescriptor](v2);
    objc_msgSend(v5, "setLabel:", CFSTR("Fountain Pen kernel"));
    v6 = (void *)objc_msgSend(*(id *)(v2 + 304), "newFunctionWithName:constantValues:error:", CFSTR("sdfPen_kernel"), v4, 0);
    objc_msgSend(v5, "setComputeFunction:", v6);

    v7 = objc_msgSend(*(id *)(v2 + 432), "newComputePipelineStateWithDescriptor:options:reflection:error:", v5, 0, 0, 0);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)paintShaderKernelPipelineStateWithLiveStrokeParticles
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__PKMetalResourceHandler_paintShaderKernelPipelineStateWithLiveStrokeParticles__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __79__PKMetalResourceHandler_paintShaderKernelPipelineStateWithLiveStrokeParticles__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[8];
  if (!v3)
  {
    -[PKMetalResourceHandler _paintShaderKernelPipelineStateWithLiveStrokeMode:particles:](v2, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)paintShaderKernelPipelineStateWithLiveStrokeMode
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__PKMetalResourceHandler_paintShaderKernelPipelineStateWithLiveStrokeMode__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __74__PKMetalResourceHandler_paintShaderKernelPipelineStateWithLiveStrokeMode__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[7];
  if (!v3)
  {
    -[PKMetalResourceHandler _paintShaderKernelPipelineStateWithLiveStrokeMode:particles:](v2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)namedShaderForKey:(uint64_t)a1
{
  NSObject *v2;
  __int128 v3;
  id v4;
  _QWORD block[6];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (!a1)
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__25;
  v14 = __Block_byref_object_dispose__25;
  v15 = 0;
  v2 = *(NSObject **)(a1 + 376);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PKMetalResourceHandler_namedShaderForKey___block_invoke;
  block[3] = &unk_1E777C650;
  block[4] = a1;
  block[5] = &v10;
  v3 = a2[1];
  v7 = *a2;
  v8 = v3;
  v9 = *((_QWORD *)a2 + 4);
  dispatch_sync(v2, block);
  v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v4;
}

void __44__PKMetalResourceHandler_namedShaderForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _OWORD v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v3;
  v8 = *(_QWORD *)(a1 + 80);
  -[PKMetalResourceHandler _namedShaderForKey:](v2, (uint64_t)v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (uint64_t)_namedShaderForKey:(uint64_t)a1
{
  uint64_t v2;
  unint64_t v5;
  int8x8_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t ***v11;
  uint64_t **v12;
  unint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  PKMetalShader *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  PKMetalShader *v42;
  uint64_t ii;
  id v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t jj;
  PKMetalShader *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  PKMetalShader *v63;
  uint64_t m;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t j;
  PKMetalShader *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  PKMetalShader *v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  int v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t kk;
  PKMetalShader *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  PKMetalShader *v106;
  uint64_t i;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  PKMetalShader *v112;
  uint64_t n;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint8x8_t v117;
  unint64_t v118;
  _QWORD *v119;
  _QWORD *v120;
  unint64_t v121;
  _QWORD *v122;
  _QWORD *v123;
  __int128 v124;
  float v125;
  float v126;
  _BOOL4 v127;
  unint64_t v128;
  unint64_t v129;
  int8x8_t prime;
  void *v131;
  void *v132;
  uint64_t v133;
  _QWORD *v134;
  unint64_t v135;
  uint8x8_t v136;
  unint64_t v137;
  uint8x8_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t k;
  PKMetalShader *v145;
  _QWORD *v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  unint64_t v151;
  void *v152;
  id v153;
  id v154;
  char v155;
  unsigned int v156;
  unsigned int v157;
  int v158;
  __int16 v159;

  if (!a1)
    return (uint64_t *)0;
  v5 = PKHashBytes(a2, 40);
  v6 = *(int8x8_t *)(a1 + 192);
  if (v6)
  {
    v7 = v5;
    v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    v9 = v8.u32[0];
    if (v8.u32[0] > 1uLL)
    {
      v10 = v5;
      if (v5 >= *(_QWORD *)&v6)
        v10 = v5 % *(_QWORD *)&v6;
    }
    else
    {
      v10 = (*(_QWORD *)&v6 - 1) & v5;
    }
    v11 = *(uint64_t ****)(*(_QWORD *)(a1 + 184) + 8 * v10);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        v2 = *(_QWORD *)&v6 - 1;
        do
        {
          v13 = (unint64_t)v12[1];
          if (v13 == v7)
          {
            if (PKNamedShaderKey::operator==((uint64_t)(v12 + 2), a2))
              return v12[7];
          }
          else
          {
            if (v9 > 1)
            {
              if (v13 >= *(_QWORD *)&v6)
                v13 %= *(_QWORD *)&v6;
            }
            else
            {
              v13 &= v2;
            }
            if (v13 != v10)
              break;
          }
          v12 = (uint64_t **)*v12;
        }
        while (v12);
      }
    }
  }
  v14 = 0;
  v15 = 1;
  v16 = 1;
  switch(*(_QWORD *)a2)
  {
    case 1:
      LOBYTE(v15) = 0;
      v16 = -1;
      goto LABEL_52;
    case 2:
      v16 = 0;
      LOBYTE(v15) = 1;
      goto LABEL_52;
    case 3:
      v14 = 0;
      v15 = 0;
      goto LABEL_71;
    case 4:
      goto LABEL_71;
    case 5:
      v15 = 0;
      v14 = 1;
LABEL_71:
      v81 = *(_DWORD *)(a2 + 8);
      v82 = *(_QWORD *)(a2 + 24);
      v83 = *(unsigned __int16 *)(a2 + 36);
      v84 = *(unsigned int *)(a2 + 32);
      v159 = *(_WORD *)(a2 + 36);
      v157 = v81;
      v158 = v84;
      v21 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v157, 33, 1);
      LOBYTE(v156) = 1;
      if (v14)
        objc_msgSend(v21, "setConstantValue:type:atIndex:", &v156, 53, 2);
      if (v15)
        objc_msgSend(v21, "setConstantValue:type:atIndex:", &v156, 53, 4);
      v85 = *(void **)(a1 + 304);
      v154 = 0;
      v23 = (void *)objc_msgSend(v85, "newFunctionWithName:constantValues:error:", CFSTR("particle_vertex"), v21, &v154);
      v86 = v154;
      v87 = *(void **)(a1 + 304);
      v153 = v86;
      v26 = (void *)objc_msgSend(v87, "newFunctionWithName:constantValues:error:", CFSTR("particle_fragment"), v21, &v153);
      v27 = v153;

      if (!v23 || !v26)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v84 | (v83 << 32));
      v2 = objc_claimAutoreleasedReturnValue();
      v88 = [PKMetalShader alloc];
      v89 = 0;
      if (v82 == 1)
        v90 = 1;
      else
        v90 = 2;
      do
      {
        if (!*((_BYTE *)&v158 + v89))
          break;
        ++v89;
      }
      while (v89 != 6);
      v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v88, v23, v26, v90, v157, (void *)v2, v89);
      goto LABEL_109;
    case 6:
      v102 = *(unsigned __int16 *)(a2 + 36);
      v103 = *(unsigned int *)(a2 + 32);
      WORD2(v153) = *(_WORD *)(a2 + 36);
      LODWORD(v153) = v103;
      v21 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      LOBYTE(v158) = 1;
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v158, 53, 4);
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v158, 53, 2);
      v104 = *(void **)(a1 + 304);
      v154 = 0;
      v23 = (void *)objc_msgSend(v104, "newFunctionWithName:constantValues:error:", CFSTR("uber_vertex"), v21, &v154);
      v27 = v154;
      v105 = objc_msgSend(*(id *)(a1 + 304), "newFunctionWithName:", CFSTR("paper_fragment"));
      v26 = (void *)v105;
      if (!v23 || !v105)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v103 | (v102 << 32));
      v2 = objc_claimAutoreleasedReturnValue();
      v106 = [PKMetalShader alloc];
      for (i = 0; i != 6; ++i)
      {
        if (!*((_BYTE *)&v153 + i))
          break;
      }
      if (v106)
      {
        v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v106, v23, v26, 0, 0x7FFFFFFFFFFFFFFFLL, (void *)v2, i);
LABEL_109:
        v44 = (id)v31;
      }
      else
      {
        v44 = 0;
      }

LABEL_111:
      if (!v44)
        return (uint64_t *)v44;
LABEL_112:
      v114 = PKHashBytes(a2, 40);
      v115 = v114;
      v116 = *(_QWORD *)(a1 + 192);
      if (!v116)
        goto LABEL_129;
      v117 = (uint8x8_t)vcnt_s8((int8x8_t)v116);
      v117.i16[0] = vaddlv_u8(v117);
      v118 = v117.u32[0];
      if (v117.u32[0] > 1uLL)
      {
        v2 = v114;
        if (v114 >= v116)
          v2 = v114 % v116;
      }
      else
      {
        v2 = (v116 - 1) & v114;
      }
      v119 = *(_QWORD **)(*(_QWORD *)(a1 + 184) + 8 * v2);
      if (!v119)
        goto LABEL_129;
      v120 = (_QWORD *)*v119;
      if (!*v119)
        goto LABEL_129;
      break;
    case 7:
      v71 = *(_DWORD *)(a2 + 8);
      v72 = *(unsigned __int16 *)(a2 + 36);
      v73 = *(unsigned int *)(a2 + 32);
      v74 = *(unsigned __int8 *)(a2 + 17);
      v75 = *(unsigned __int8 *)(a2 + 18);
      v159 = *(_WORD *)(a2 + 36);
      v157 = v71;
      v158 = v73;
      v48 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v48, "setConstantValue:type:atIndex:", &v157, 33, 1);
      v49 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      LOBYTE(v156) = 1;
      objc_msgSend(v49, "setConstantValue:type:atIndex:", &v156, 53, 4);
      if (v74)
        objc_msgSend(v48, "setConstantValue:type:atIndex:", &v156, 53, 2);
      if (v75)
        objc_msgSend(v48, "setConstantValue:type:atIndex:", &v156, 53, 3);
      v76 = *(void **)(a1 + 304);
      v154 = 0;
      v51 = (void *)objc_msgSend(v76, "newFunctionWithName:constantValues:error:", CFSTR("uber_vertex"), v49, &v154);
      v77 = v154;
      v78 = *(void **)(a1 + 304);
      v153 = v77;
      v2 = objc_msgSend(v78, "newFunctionWithName:constantValues:error:", CFSTR("blit_fragment"), v48, &v153);
      v54 = v153;

      if (!v51 || !v2)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v73 | (v72 << 32));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j != 6; ++j)
      {
        if (!*((_BYTE *)&v158 + j))
          break;
      }
      v80 = [PKMetalShader alloc];
      v58 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v80, v51, (void *)v2, 0, v157, v55, j);
      goto LABEL_93;
    case 8:
      v140 = *(unsigned __int16 *)(a2 + 36);
      v141 = *(unsigned int *)(a2 + 32);
      WORD2(v154) = *(_WORD *)(a2 + 36);
      LODWORD(v154) = v141;
      v21 = (id)objc_msgSend(*(id *)(a1 + 304), "newFunctionWithName:", CFSTR("lines_vertex"));
      v142 = objc_msgSend(*(id *)(a1 + 304), "newFunctionWithName:", CFSTR("lines_fragment"));
      v35 = (id)v142;
      if (!v21 || !v142)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v141 | (v140 << 32));
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 0; k != 6; ++k)
      {
        if (!*((_BYTE *)&v154 + k))
          break;
      }
      v145 = [PKMetalShader alloc];
      if (v145)
        v44 = (id)-[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v145, v21, v35, 0, 0x7FFFFFFFFFFFFFFFLL, v143, k);
      else
        v44 = 0;

      goto LABEL_163;
    case 9:
      v59 = *(unsigned __int16 *)(a2 + 36);
      v60 = *(unsigned int *)(a2 + 32);
      WORD2(v153) = *(_WORD *)(a2 + 36);
      LODWORD(v153) = v60;
      v21 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      LOBYTE(v158) = 1;
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v158, 53, 4);
      v61 = *(void **)(a1 + 304);
      v154 = 0;
      v23 = (void *)objc_msgSend(v61, "newFunctionWithName:constantValues:error:", CFSTR("uber_vertex"), v21, &v154);
      v27 = v154;
      v62 = objc_msgSend(*(id *)(a1 + 304), "newFunctionWithName:", CFSTR("paint_circle_fragment"));
      v26 = (void *)v62;
      if (!v23 || !v62)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v60 | (v59 << 32));
      v2 = objc_claimAutoreleasedReturnValue();
      v63 = [PKMetalShader alloc];
      for (m = 0; m != 6; ++m)
      {
        if (!*((_BYTE *)&v153 + m))
          break;
      }
      v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v63, v23, v26, 2, 3, (void *)v2, m);
      goto LABEL_109;
    case 0xALL:
      v108 = *(unsigned __int16 *)(a2 + 36);
      v109 = *(unsigned int *)(a2 + 32);
      WORD2(v153) = *(_WORD *)(a2 + 36);
      LODWORD(v153) = v109;
      v21 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      LOBYTE(v158) = 1;
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v158, 53, 4);
      v110 = *(void **)(a1 + 304);
      v154 = 0;
      v23 = (void *)objc_msgSend(v110, "newFunctionWithName:constantValues:error:", CFSTR("paint_vertex"), v21, &v154);
      v27 = v154;
      v111 = objc_msgSend(*(id *)(a1 + 304), "newFunctionWithName:", CFSTR("fill_white"));
      v26 = (void *)v111;
      if (!v23 || !v111)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v109 | (v108 << 32));
      v2 = objc_claimAutoreleasedReturnValue();
      v112 = [PKMetalShader alloc];
      for (n = 0; n != 6; ++n)
      {
        if (!*((_BYTE *)&v153 + n))
          break;
      }
      v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v112, v23, v26, 5, 0, (void *)v2, n);
      goto LABEL_109;
    case 0xBLL:
      v32 = *(_DWORD *)(a2 + 8);
      v33 = *(unsigned __int16 *)(a2 + 36);
      v34 = *(unsigned int *)(a2 + 32);
      v159 = *(_WORD *)(a2 + 36);
      v157 = v32;
      v158 = v34;
      v21 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      v35 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v35, "setConstantValue:type:atIndex:", &v157, 33, 1);
      LOBYTE(v156) = 1;
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v156, 53, 4);
      v36 = *(void **)(a1 + 304);
      v154 = 0;
      v37 = (void *)objc_msgSend(v36, "newFunctionWithName:constantValues:error:", CFSTR("uber_vertex"), v21, &v154);
      v38 = v154;
      v39 = *(void **)(a1 + 304);
      v153 = v38;
      v2 = objc_msgSend(v39, "newFunctionWithName:constantValues:error:", CFSTR("erase_fragment"), v35, &v153);
      v40 = v153;

      if (!v37 || !v2)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v34 | (v33 << 32));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = [PKMetalShader alloc];
      for (ii = 0; ii != 6; ++ii)
      {
        if (!*((_BYTE *)&v158 + ii))
          break;
      }
      if (v42)
        v44 = (id)-[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v42, v37, (void *)v2, 0, 0x7FFFFFFFFFFFFFFFLL, v41, ii);
      else
        v44 = 0;

LABEL_163:
      goto LABEL_111;
    case 0xCLL:
      v45 = *(_DWORD *)(a2 + 8);
      v46 = *(unsigned __int16 *)(a2 + 36);
      v47 = *(unsigned int *)(a2 + 32);
      v159 = *(_WORD *)(a2 + 36);
      v157 = v45;
      v158 = v47;
      LOBYTE(v156) = 1;
      v48 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v48, "setConstantValue:type:atIndex:", &v156, 53, 4);
      objc_msgSend(v48, "setConstantValue:type:atIndex:", &v156, 53, 2);
      v49 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v49, "setConstantValue:type:atIndex:", &v157, 33, 1);
      v50 = *(void **)(a1 + 304);
      v154 = 0;
      v51 = (void *)objc_msgSend(v50, "newFunctionWithName:constantValues:error:", CFSTR("uber_vertex"), v48, &v154);
      v52 = v154;
      v53 = *(void **)(a1 + 304);
      v153 = v52;
      v2 = objc_msgSend(v53, "newFunctionWithName:constantValues:error:", CFSTR("fill_color"), v49, &v153);
      v54 = v153;

      if (!v51 || !v2)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v47 | (v46 << 32));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      for (jj = 0; jj != 6; ++jj)
      {
        if (!*((_BYTE *)&v158 + jj))
          break;
      }
      v57 = [PKMetalShader alloc];
      if (v57)
      {
        v58 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v57, v51, (void *)v2, 0, 0x7FFFFFFFFFFFFFFFLL, v55, jj);
LABEL_93:
        v44 = (id)v58;
      }
      else
      {
        v44 = 0;
      }

      if (!v44)
        return (uint64_t *)v44;
      goto LABEL_112;
    case 0xDLL:
      v92 = *(_DWORD *)(a2 + 8);
      v91 = *(_DWORD *)(a2 + 12);
      v93 = *(unsigned __int16 *)(a2 + 36);
      v94 = *(unsigned int *)(a2 + 32);
      v95 = *(unsigned __int8 *)(a2 + 17);
      v96 = *(unsigned __int8 *)(a2 + 18);
      v159 = *(_WORD *)(a2 + 36);
      v157 = v91;
      v158 = v94;
      v156 = v92;
      v48 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v48, "setConstantValue:type:atIndex:", &v157, 33, 1);
      objc_msgSend(v48, "setConstantValue:type:atIndex:", &v156, 33, 2);
      v49 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      v155 = 1;
      objc_msgSend(v49, "setConstantValue:type:atIndex:", &v155, 53, 4);
      if (v95)
        objc_msgSend(v48, "setConstantValue:type:atIndex:", &v155, 53, 3);
      if (v96)
        objc_msgSend(v48, "setConstantValue:type:atIndex:", &v155, 53, 4);
      v97 = *(void **)(a1 + 304);
      v154 = 0;
      v51 = (void *)objc_msgSend(v97, "newFunctionWithName:constantValues:error:", CFSTR("uber_vertex"), v49, &v154);
      v98 = v154;
      v99 = *(void **)(a1 + 304);
      v153 = v98;
      v2 = objc_msgSend(v99, "newFunctionWithName:constantValues:error:", CFSTR("copy_framebuffer_fragment"), v48, &v153);
      v54 = v153;

      if (!v51 || !v2)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v94 | (v93 << 32));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      for (kk = 0; kk != 6; ++kk)
      {
        if (!*((_BYTE *)&v158 + kk))
          break;
      }
      v101 = [PKMetalShader alloc];
      v58 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v101, v51, (void *)v2, 0, v156, v55, kk);
      goto LABEL_93;
    case 0xELL:
      v18 = *(_DWORD *)(a2 + 8);
      v19 = *(unsigned __int16 *)(a2 + 36);
      v20 = *(unsigned int *)(a2 + 32);
      v159 = *(_WORD *)(a2 + 36);
      v157 = v18;
      v158 = v20;
      v21 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v157, 33, 1);
      v22 = *(void **)(a1 + 304);
      v154 = 0;
      v23 = (void *)objc_msgSend(v22, "newFunctionWithName:constantValues:error:", CFSTR("sdfPen_vertex"), v21, &v154);
      v24 = v154;
      v25 = *(void **)(a1 + 304);
      v153 = v24;
      v26 = (void *)objc_msgSend(v25, "newFunctionWithName:constantValues:error:", CFSTR("sdfPen_fragment"), v21, &v153);
      v27 = v153;

      if (!v23 || !v26)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v20 | (v19 << 32));
      v2 = objc_claimAutoreleasedReturnValue();
      v28 = [PKMetalShader alloc];
      v29 = 0;
      v30 = v157;
      do
      {
        if (!*((_BYTE *)&v158 + v29))
          break;
        ++v29;
      }
      while (v29 != 6);
      goto LABEL_27;
    case 0xFLL:
      goto LABEL_52;
    case 0x10:
      LOBYTE(v15) = 1;
      v16 = 2;
LABEL_52:
      v65 = *(_DWORD *)(a2 + 8);
      v66 = *(unsigned __int16 *)(a2 + 36);
      v67 = *(unsigned int *)(a2 + 32);
      v159 = *(_WORD *)(a2 + 36);
      v157 = v65;
      v158 = v67;
      v21 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v157, 33, 1);
      LOBYTE(v156) = 1;
      if ((v15 & 1) != 0)
        objc_msgSend(v21, "setConstantValue:type:atIndex:", &v156, 53, qword_1BE4FE698[v16]);
      v68 = *(void **)(a1 + 304);
      v154 = 0;
      v23 = (void *)objc_msgSend(v68, "newFunctionWithName:constantValues:error:", CFSTR("paint_vertex"), v21, &v154);
      v69 = v154;
      v70 = *(void **)(a1 + 304);
      v153 = v69;
      v26 = (void *)objc_msgSend(v70, "newFunctionWithName:constantValues:error:", CFSTR("paint_fragment"), v21, &v153);
      v27 = v153;

      if (!v23 || !v26)
        objc_exception_throw(CFSTR("Failed to compile shader"));
      -[PKMetalResourceHandler _pipelineDescriptorForConfig:](a1, v67 | (v66 << 32));
      v2 = objc_claimAutoreleasedReturnValue();
      v28 = [PKMetalShader alloc];
      v29 = 0;
      v30 = v157;
      do
      {
        if (!*((_BYTE *)&v158 + v29))
          break;
        ++v29;
      }
      while (v29 != 6);
LABEL_27:
      v31 = -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v28, v23, v26, 1, v30, (void *)v2, v29);
      goto LABEL_109;
    default:
      return (uint64_t *)0;
  }
  do
  {
    v121 = v120[1];
    if (v121 == v115)
    {
      if (PKNamedShaderKey::operator==((uint64_t)(v120 + 2), a2))
        return (uint64_t *)v44;
      goto LABEL_128;
    }
    if (v118 > 1)
    {
      if (v121 >= v116)
        v121 %= v116;
    }
    else
    {
      v121 &= v116 - 1;
    }
    if (v121 != v2)
      break;
LABEL_128:
    v120 = (_QWORD *)*v120;
  }
  while (v120);
LABEL_129:
  v122 = operator new(0x40uLL);
  v123 = (_QWORD *)(a1 + 200);
  *v122 = 0;
  v122[1] = v115;
  v124 = *(_OWORD *)(a2 + 16);
  *((_OWORD *)v122 + 1) = *(_OWORD *)a2;
  *((_OWORD *)v122 + 2) = v124;
  v122[6] = *(_QWORD *)(a2 + 32);
  v44 = v44;
  v122[7] = v44;
  v125 = (float)(unint64_t)(*(_QWORD *)(a1 + 208) + 1);
  v126 = *(float *)(a1 + 216);
  if (!v116 || (float)(v126 * (float)v116) < v125)
  {
    v127 = (v116 & (v116 - 1)) == 0;
    if (v116 < 3)
      v127 = 0;
    v128 = (2 * v116) | !v127;
    v129 = vcvtps_u32_f32(v125 / v126);
    if (v128 <= v129)
      prime = (int8x8_t)v129;
    else
      prime = (int8x8_t)v128;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v116 = *(_QWORD *)(a1 + 192);
    if (*(_QWORD *)&prime <= v116)
    {
      if (*(_QWORD *)&prime < v116)
      {
        v137 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 208) / *(float *)(a1 + 216));
        if (v116 < 3 || (v138 = (uint8x8_t)vcnt_s8((int8x8_t)v116), v138.i16[0] = vaddlv_u8(v138), v138.u32[0] > 1uLL))
        {
          v137 = std::__next_prime(v137);
        }
        else
        {
          v139 = 1 << -(char)__clz(v137 - 1);
          if (v137 >= 2)
            v137 = v139;
        }
        if (*(_QWORD *)&prime <= v137)
          prime = (int8x8_t)v137;
        if (*(_QWORD *)&prime >= v116)
        {
          v116 = *(_QWORD *)(a1 + 192);
        }
        else
        {
          if (prime)
            goto LABEL_141;
          v152 = *(void **)(a1 + 184);
          *(_QWORD *)(a1 + 184) = 0;
          if (v152)
            operator delete(v152);
          v116 = 0;
          *(_QWORD *)(a1 + 192) = 0;
        }
      }
    }
    else
    {
LABEL_141:
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v131 = operator new(8 * *(_QWORD *)&prime);
      v132 = *(void **)(a1 + 184);
      *(_QWORD *)(a1 + 184) = v131;
      if (v132)
        operator delete(v132);
      v133 = 0;
      *(int8x8_t *)(a1 + 192) = prime;
      do
        *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8 * v133++) = 0;
      while (*(_QWORD *)&prime != v133);
      v134 = (_QWORD *)*v123;
      if (*v123)
      {
        v135 = v134[1];
        v136 = (uint8x8_t)vcnt_s8(prime);
        v136.i16[0] = vaddlv_u8(v136);
        if (v136.u32[0] > 1uLL)
        {
          if (v135 >= *(_QWORD *)&prime)
            v135 %= *(_QWORD *)&prime;
        }
        else
        {
          v135 &= *(_QWORD *)&prime - 1;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8 * v135) = v123;
        v146 = (_QWORD *)*v134;
        if (*v134)
        {
          do
          {
            v147 = v146[1];
            if (v136.u32[0] > 1uLL)
            {
              if (v147 >= *(_QWORD *)&prime)
                v147 %= *(_QWORD *)&prime;
            }
            else
            {
              v147 &= *(_QWORD *)&prime - 1;
            }
            if (v147 != v135)
            {
              v148 = *(_QWORD *)(a1 + 184);
              if (!*(_QWORD *)(v148 + 8 * v147))
              {
                *(_QWORD *)(v148 + 8 * v147) = v134;
                goto LABEL_175;
              }
              *v134 = *v146;
              *v146 = **(_QWORD **)(*(_QWORD *)(a1 + 184) + 8 * v147);
              **(_QWORD **)(*(_QWORD *)(a1 + 184) + 8 * v147) = v146;
              v146 = v134;
            }
            v147 = v135;
LABEL_175:
            v134 = v146;
            v146 = (_QWORD *)*v146;
            v135 = v147;
          }
          while (v146);
        }
      }
      v116 = (unint64_t)prime;
    }
    if ((v116 & (v116 - 1)) != 0)
    {
      if (v115 >= v116)
        v2 = v115 % v116;
      else
        v2 = v115;
    }
    else
    {
      v2 = (v116 - 1) & v115;
    }
  }
  v149 = *(_QWORD *)(a1 + 184);
  v150 = *(_QWORD **)(v149 + 8 * v2);
  if (v150)
  {
    *v122 = *v150;
  }
  else
  {
    *v122 = *v123;
    *v123 = v122;
    *(_QWORD *)(v149 + 8 * v2) = v123;
    if (!*v122)
      goto LABEL_193;
    v151 = *(_QWORD *)(*v122 + 8);
    if ((v116 & (v116 - 1)) != 0)
    {
      if (v151 >= v116)
        v151 %= v116;
    }
    else
    {
      v151 &= v116 - 1;
    }
    v150 = (_QWORD *)(*(_QWORD *)(a1 + 184) + 8 * v151);
  }
  *v150 = v122;
LABEL_193:
  ++*(_QWORD *)(a1 + 208);
  return (uint64_t *)v44;
}

- (id)_preloadUberShaders
{
  int v2;
  int v3;
  id v4;
  char v5;
  int v6;
  id v7;
  char v8;
  id v9;
  id result;
  char v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  __int128 v21;
  uint64_t v22;
  int v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  char v30;
  char v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  uint64_t v49;
  char v50;
  __int16 v51;
  int v52;
  char v53;
  uint64_t v54;
  int v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  __int128 v60;
  uint64_t v61;
  int v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;

  v2 = a1[425];
  v39 = 3;
  v40 = 0;
  if (v2)
    v3 = 16843009;
  else
    v3 = 33620226;
  v41 = 0;
  v42 = v2;
  v44 = 0;
  v43 = 0;
  v46 = 0;
  v45 = v3;
  v47 = 0;
  v48 = 0;
  v4 = -[PKMetalResourceHandler _uberShaderForKey:](a1, &v39);
  v5 = a1[425];
  if (v5)
    v6 = 16843009;
  else
    v6 = 33620226;
  v28 = 3;
  v29 = 0;
  v30 = 1;
  v31 = v5;
  v32 = 0;
  v33 = 1;
  v36 = 0;
  v34 = 0;
  v35 = v6;
  v37 = 0;
  v38 = 0;
  v7 = -[PKMetalResourceHandler _uberShaderForKey:](a1, &v28);
  v8 = a1[425];
  if (v8)
  {
    v21 = xmmword_1BE4FE6F0;
    v22 = 4;
    v25 = 0;
    v23 = 3;
    v24 = 16843009;
    v26 = 0;
    v27 = 0;
    v9 = -[PKMetalResourceHandler _uberShaderForKey:](a1, (uint64_t *)&v21);
    v66 = 0;
    v65 = 0;
    v60 = xmmword_1BE4FE700;
    v61 = 0;
    v64 = 0;
    v62 = 3;
    v63 = 16843009;
    return -[PKMetalResourceHandler _uberShaderForKey:](a1, (uint64_t *)&v60);
  }
  else
  {
    v11 = 1;
    do
    {
      v12 = 0;
      v20 = v11;
      v13 = v8 & 1;
      v14 = 1;
      do
      {
        v15 = 0;
        v16 = v14;
        v17 = *((_QWORD *)&xmmword_1BE4FE6F0 + v12);
        do
        {
          v18 = qword_1BE4FE640[v15];
          *(_QWORD *)&v60 = v17;
          BYTE8(v60) = v13;
          *(_DWORD *)((char *)&v60 + 9) = 0;
          HIDWORD(v60) = 0;
          v61 = v18;
          v64 = 0;
          v62 = 3;
          v63 = 33620226;
          v65 = 0;
          v66 = 0;
          v19 = -[PKMetalResourceHandler _uberShaderForKey:](a1, (uint64_t *)&v60);
          ++v15;
        }
        while (v15 != 3);
        v49 = v17;
        v50 = v13;
        v51 = 256;
        v52 = 0;
        v53 = 0;
        v54 = 1;
        v57 = 0;
        v55 = 3;
        v56 = 33620226;
        v58 = 0;
        v59 = 0;
        result = -[PKMetalResourceHandler _uberShaderForKey:](a1, &v49);
        v14 = 0;
        v12 = 1;
      }
      while ((v16 & 1) != 0);
      v11 = 0;
      v8 = 1;
    }
    while ((v20 & 1) != 0);
  }
  return result;
}

- (id)_inkTextureNamed:(uint64_t)a3 image:
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  id v38;
  id v40;
  id v41;
  id v42;
  _BYTE buf[24];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  int v50;
  _QWORD v51[3];
  _QWORD v52[3];
  uint8_t v53[4];
  id v54;
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
  {
    v5 = 0;
    goto LABEL_40;
  }
  objc_msgSend(*(id *)(a1 + 96), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PKMetalResourceHandler _signpostLog]((id)a1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 384);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LoadInkTexture", (const char *)&unk_1BE532412, buf, 2u);
    }

    v9 = v4;
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("_texture"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v9;

    v40 = v10;
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v40, v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (void *)objc_msgSend(v12, "CGImage");
    if (v5)
    {
      v13 = *MEMORY[0x1E0CC6C10];
      v55[0] = *MEMORY[0x1E0CC6C18];
      v55[1] = v13;
      *(_QWORD *)buf = &unk_1E77EBDC0;
      *(_QWORD *)&buf[8] = &unk_1E77EBDD8;
      v55[2] = *MEMORY[0x1E0CC6C08];
      *(_QWORD *)&buf[16] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v55, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", *(_QWORD *)(a1 + 432));
      v42 = 0;
      v5 = (void *)objc_msgSend(v15, "newTextureWithCGImage:options:error:", v5, v14, &v42);
      v16 = v42;
      if (v16)
      {
        v17 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v53 = 138412290;
          v54 = v40;
          _os_log_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEFAULT, "Error loading texture: %@", v53, 0xCu);
        }

      }
    }

    if (v5)
      goto LABEL_29;
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CC6C10];
    v51[0] = *MEMORY[0x1E0CC6C18];
    v51[1] = v19;
    v52[0] = &unk_1E77EBDC0;
    v52[1] = &unk_1E77EBDD8;
    v51[2] = *MEMORY[0x1E0CC6C08];
    v52[2] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", *(_QWORD *)(a1 + 432));
    v41 = 0;
    v5 = (void *)objc_msgSend(v21, "newTextureWithName:scaleFactor:bundle:options:error:", v40, v18, v20, &v41, 1.0);
    v22 = v41;
    if (v22 || !objc_msgSend(v5, "width"))
    {
      if (!a3)
        goto LABEL_16;
    }
    else
    {
      v25 = objc_msgSend(v5, "height");
      if (!a3 || v25)
      {
LABEL_17:
        if (objc_msgSend(v5, "width", v38))
        {
          v22 = 0;
          if (objc_msgSend(v5, "height"))
          {
LABEL_28:

LABEL_29:
            v27 = -[PKMetalResourceHandler isAppInBackground]();
            v28 = os_log_create("com.apple.pencilkit", ");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_msgSend(v5, "width");
              v30 = objc_msgSend(v5, "height");
              v31 = objc_msgSend(v5, "depth");
              v32 = objc_msgSend(v5, "pixelFormat");
              *(_DWORD *)buf = 138413570;
              *(_QWORD *)&buf[4] = v40;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v29;
              *(_WORD *)&buf[22] = 2048;
              v44 = v30;
              v45 = 2048;
              v46 = v31;
              v47 = 2048;
              v48 = v32;
              v49 = 1024;
              v50 = v27;
              _os_log_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEFAULT, "Loaded ink texture: %@, size: %lu, %lu, %lu, pixelFormat: %lu, inBackground: %d", buf, 0x3Au);
            }

            if ((v27 & 1) != 0)
            {
              v33 = os_log_create("com.apple.pencilkit", ");
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1BE213000, v33, OS_LOG_TYPE_ERROR, "App was in the background when loading a texture.", buf, 2u);
              }

            }
            else
            {
              objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", v5, v38);
            }
            -[PKMetalResourceHandler _signpostLog]((id)a1);
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = v34;
            v36 = *(_QWORD *)(a1 + 384);
            if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BE213000, v35, OS_SIGNPOST_INTERVAL_END, v36, "LoadInkTexture", (const char *)&unk_1BE532412, buf, 2u);
            }

            goto LABEL_40;
          }
        }
        else
        {
          v22 = 0;
        }
LABEL_25:
        v26 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v22;
          _os_log_fault_impl(&dword_1BE213000, v26, OS_LOG_TYPE_FAULT, "Failed to load texture: %@, error: %@", buf, 0x16u);
        }

        goto LABEL_28;
      }
    }
    v23 = objc_msgSend(v21, "newTextureWithCGImage:options:error:", v38);
    v24 = v22;

    v22 = v24;
    v5 = (void *)v23;
LABEL_16:
    if (v22)
      goto LABEL_25;
    goto LABEL_17;
  }
LABEL_40:

  return v5;
}

- (id)compositePaperShaderWithMode:(int)a3 colorAttachmentIndex:(char)a4 secondaryPaintEnabled:(uint64_t)a5 pipelineConfig:
{
  __int128 v6;
  uint64_t v7;
  int v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;

  if (a1)
  {
    HIBYTE(v6) = 0;
    *(_WORD *)((char *)&v6 + 13) = 0;
    v11 = 0;
    v12 = 0;
    *(_QWORD *)&v6 = a2;
    DWORD2(v6) = 0;
    BYTE12(v6) = a4;
    v7 = 4;
    v8 = a3;
    v9 = a5;
    v10 = WORD2(a5);
    -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v6);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)uberShaderForKey:(uint64_t)a1
{
  NSObject *v2;
  __int128 v3;
  id v4;
  _QWORD block[6];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (!a1)
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__25;
  v14 = __Block_byref_object_dispose__25;
  v15 = 0;
  v2 = *(NSObject **)(a1 + 376);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKMetalResourceHandler_uberShaderForKey___block_invoke;
  block[3] = &unk_1E777C650;
  block[4] = a1;
  block[5] = &v10;
  v3 = a2[1];
  v7 = *a2;
  v8 = v3;
  v9 = *((_QWORD *)a2 + 4);
  dispatch_sync(v2, block);
  v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v4;
}

- (id)compositeOverShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(unsigned __int8)a5 renderMask:(char)a6 edgeMask:(char)a7 secondaryPaintEnabled:(uint64_t)a8 pipelineConfig:
{
  __int128 v9;
  uint64_t v10;
  int v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;

  if (a1)
  {
    HIBYTE(v9) = 0;
    *(_WORD *)((char *)&v9 + 13) = 0;
    v14 = 0;
    v15 = 0;
    *(_QWORD *)&v9 = a2;
    BYTE8(v9) = a3;
    *(_WORD *)((char *)&v9 + 9) = a5;
    BYTE11(v9) = a6;
    BYTE12(v9) = a7;
    v10 = 0;
    v11 = a4;
    v12 = a8;
    v13 = WORD2(a8);
    -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v9);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)compositeMultiplyShaderWithMode:(char)a3 clipping:(char)a4 targetMultiple:(int)a5 colorAttachmentIndex:(char)a6 renderMask:(char)a7 edgeMask:(char)a8 secondaryPaintEnabled:(int)a9 pipelineConfig:(__int16)a10
{
  __int128 v11;
  uint64_t v12;
  int v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;

  if (a1)
  {
    HIBYTE(v11) = 0;
    *(_WORD *)((char *)&v11 + 13) = 0;
    v16 = 0;
    v17 = 0;
    *(_QWORD *)&v11 = a2;
    BYTE8(v11) = a3;
    BYTE9(v11) = a6;
    BYTE10(v11) = a4;
    BYTE11(v11) = a7;
    BYTE12(v11) = a8;
    v12 = 1;
    v13 = a5;
    v14 = a9;
    v15 = a10;
    -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v11);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)compositeSoftWhiteShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(unsigned __int8)a5 renderMask:(char)a6 edgeMask:(char)a7 secondaryPaintEnabled:(uint64_t)a8 pipelineConfig:
{
  __int128 v9;
  uint64_t v10;
  int v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;

  if (a1)
  {
    HIBYTE(v9) = 0;
    *(_WORD *)((char *)&v9 + 13) = 0;
    v14 = 0;
    v15 = 0;
    *(_QWORD *)&v9 = a2;
    BYTE8(v9) = a3;
    *(_WORD *)((char *)&v9 + 9) = a5;
    BYTE11(v9) = a6;
    BYTE12(v9) = a7;
    v10 = 3;
    v11 = a4;
    v12 = a8;
    v13 = WORD2(a8);
    -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v9);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)compositeEraseShaderWithMode:(char)a3 clipping:(int)a4 colorAttachmentIndex:(char)a5 secondaryPaintEnabled:(uint64_t)a6 pipelineConfig:
{
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;

  if (a1)
  {
    HIBYTE(v7) = 0;
    *(_WORD *)((char *)&v7 + 13) = 0;
    v12 = 0;
    v13 = 0;
    *(_QWORD *)&v7 = a2;
    BYTE8(v7) = a3;
    *(_WORD *)((char *)&v7 + 9) = 0;
    BYTE11(v7) = 0;
    BYTE12(v7) = a5;
    v8 = 2;
    v9 = a4;
    v10 = a6;
    v11 = WORD2(a6);
    -[PKMetalResourceHandler uberShaderForKey:]((uint64_t)a1, &v7);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (char)_uberShaderForKey:(char *)a1
{
  char *v2;
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t **v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  PKMetalShader *v32;
  uint64_t i;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint8x8_t v37;
  unint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  __int128 v44;
  float v45;
  float v46;
  _BOOL4 v47;
  unint64_t v48;
  unint64_t v49;
  int8x8_t prime;
  void *v51;
  void *v52;
  uint64_t v53;
  _QWORD *v54;
  unint64_t v55;
  uint8x8_t v56;
  unint64_t v57;
  uint8x8_t v58;
  uint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  NSObject *v65;
  NSObject *v66;
  os_signpost_id_t v67;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  char v76;
  uint8_t buf[8];
  char *v78;
  char v79;
  char v80;

  v2 = a1;
  if (a1)
  {
    v4 = PKHashBytes((uint64_t)a2, 40);
    v5 = *(int8x8_t *)(v2 + 112);
    if (v5)
    {
      v6 = v4;
      v7 = (uint8x8_t)vcnt_s8(v5);
      v7.i16[0] = vaddlv_u8(v7);
      v8 = v7.u32[0];
      if (v7.u32[0] > 1uLL)
      {
        v9 = v4;
        if (v4 >= *(_QWORD *)&v5)
          v9 = v4 % *(_QWORD *)&v5;
      }
      else
      {
        v9 = (*(_QWORD *)&v5 - 1) & v4;
      }
      v10 = *(uint64_t ***)(*((_QWORD *)v2 + 13) + 8 * v9);
      if (v10)
      {
        v11 = (uint64_t **)*v10;
        if (*v10)
        {
          do
          {
            v12 = (unint64_t)v11[1];
            if (v12 == v6)
            {
              if (!memcmp(v11 + 2, a2, 0x28uLL))
                return (char *)v11[7];
            }
            else
            {
              if (v8 > 1)
              {
                if (v12 >= *(_QWORD *)&v5)
                  v12 %= *(_QWORD *)&v5;
              }
              else
              {
                v12 &= *(_QWORD *)&v5 - 1;
              }
              if (v12 != v9)
                break;
            }
            v11 = (uint64_t **)*v11;
          }
          while (v11);
        }
      }
    }
    -[PKMetalResourceHandler _signpostLog](v2);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *((_QWORD *)v2 + 48);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CompileShader", (const char *)&unk_1BE532412, buf, 2u);
    }

    v76 = 1;
    v16 = *a2;
    v17 = *((unsigned __int8 *)a2 + 8);
    v18 = *((unsigned __int8 *)a2 + 9);
    v19 = *((unsigned __int8 *)a2 + 11);
    *(_DWORD *)buf = *((_DWORD *)a2 + 6);
    v20 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    v21 = v20;
    v80 = 1;
    if (v16 == 1)
    {
      v22 = 5;
    }
    else
    {
      if (v16)
        goto LABEL_26;
      v22 = 1;
    }
    objc_msgSend(v20, "setConstantValue:type:atIndex:", &v80, 53, v22);
LABEL_26:
    if (v17)
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v80, 53, 3);
    if (v18)
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v80, 53, 14);
    if (v19)
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v80, 53, 15);
    objc_msgSend(v21, "setConstantValue:type:atIndex:", buf, 33, 13);
    if (v2[428])
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v80, 53, 7);
    objc_msgSend(v21, "setConstantValue:type:atIndex:", &v76, 53, 4);
    if (*((_BYTE *)a2 + 10))
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v76, 53, 6);
    if (*((_BYTE *)a2 + 12))
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v76, 53, 17);
    v23 = a2[2];
    if (v23 <= 4)
      objc_msgSend(v21, "setConstantValue:type:atIndex:", &v76, 53, qword_1BE4FE6B0[v23]);
    v24 = (void *)*((_QWORD *)v2 + 38);
    v75 = 0;
    v25 = (void *)objc_msgSend(v24, "newFunctionWithName:constantValues:error:", CFSTR("uber_vertex"), v21, &v75);
    v26 = v75;
    v27 = (void *)*((_QWORD *)v2 + 38);
    v74 = 0;
    v72 = v25;
    v28 = (void *)objc_msgSend(v27, "newFunctionWithName:constantValues:error:", CFSTR("uber_fragment"), v21, &v74);
    v71 = v74;
    if (!v25 || !v28)
      objc_exception_throw(CFSTR("Failed to compile shader"));
    v29 = *a2 == 2;
    if (*a2 == 2)
      v30 = 3;
    else
      v30 = 0;
    -[PKMetalResourceHandler _pipelineDescriptorForConfig:]((uint64_t)v2, *((unsigned int *)a2 + 7) | ((unint64_t)*((unsigned __int16 *)a2 + 16) << 32));
    v31 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)v31;
    v32 = [PKMetalShader alloc];
    for (i = 0; i != 6; ++i)
    {
      if (!*((_BYTE *)a2 + i + 28))
        break;
    }
    v73 = (void *)-[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v32, v25, v28, 2 * v29, v30, (void *)v31, i);
    v34 = PKHashBytes((uint64_t)a2, 40);
    v35 = v34;
    v36 = *((_QWORD *)v2 + 14);
    if (v36)
    {
      v37 = (uint8x8_t)vcnt_s8((int8x8_t)v36);
      v37.i16[0] = vaddlv_u8(v37);
      v38 = v37.u32[0];
      if (v37.u32[0] > 1uLL)
      {
        v31 = v34;
        if (v34 >= v36)
          v31 = v34 % v36;
      }
      else
      {
        v31 = (v36 - 1) & v34;
      }
      v39 = *(_QWORD **)(*((_QWORD *)v2 + 13) + 8 * v31);
      if (v39)
      {
        v40 = (_QWORD *)*v39;
        if (*v39)
        {
          do
          {
            v41 = v40[1];
            if (v41 == v35)
            {
              if (!memcmp(v40 + 2, a2, 0x28uLL))
                goto LABEL_120;
            }
            else
            {
              if (v38 > 1)
              {
                if (v41 >= v36)
                  v41 %= v36;
              }
              else
              {
                v41 &= v36 - 1;
              }
              if (v41 != v31)
                break;
            }
            v40 = (_QWORD *)*v40;
          }
          while (v40);
        }
      }
    }
    v42 = operator new(0x40uLL);
    v43 = v2 + 120;
    *(_QWORD *)buf = v42;
    v78 = v2 + 120;
    *v42 = 0;
    v42[1] = v35;
    v44 = *((_OWORD *)a2 + 1);
    *((_OWORD *)v42 + 1) = *(_OWORD *)a2;
    *((_OWORD *)v42 + 2) = v44;
    v42[6] = a2[4];
    v42[7] = v73;
    v79 = 1;
    v45 = (float)(unint64_t)(*((_QWORD *)v2 + 16) + 1);
    v46 = *((float *)v2 + 34);
    if (v36 && (float)(v46 * (float)v36) >= v45)
      goto LABEL_111;
    v47 = (v36 & (v36 - 1)) == 0;
    if (v36 < 3)
      v47 = 0;
    v48 = (2 * v36) | !v47;
    v49 = vcvtps_u32_f32(v45 / v46);
    if (v48 <= v49)
      prime = (int8x8_t)v49;
    else
      prime = (int8x8_t)v48;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v36 = *((_QWORD *)v2 + 14);
    if (*(_QWORD *)&prime > v36)
      goto LABEL_77;
    if (*(_QWORD *)&prime < v36)
    {
      v57 = vcvtps_u32_f32((float)*((unint64_t *)v2 + 16) / *((float *)v2 + 34));
      if (v36 < 3 || (v58 = (uint8x8_t)vcnt_s8((int8x8_t)v36), v58.i16[0] = vaddlv_u8(v58), v58.u32[0] > 1uLL))
      {
        v57 = std::__next_prime(v57);
      }
      else
      {
        v59 = 1 << -(char)__clz(v57 - 1);
        if (v57 >= 2)
          v57 = v59;
      }
      if (*(_QWORD *)&prime <= v57)
        prime = (int8x8_t)v57;
      if (*(_QWORD *)&prime >= v36)
      {
        v36 = *((_QWORD *)v2 + 14);
      }
      else
      {
        if (prime)
        {
LABEL_77:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v51 = operator new(8 * *(_QWORD *)&prime);
          v52 = (void *)*((_QWORD *)v2 + 13);
          *((_QWORD *)v2 + 13) = v51;
          if (v52)
            operator delete(v52);
          v53 = 0;
          *((int8x8_t *)v2 + 14) = prime;
          do
            *(_QWORD *)(*((_QWORD *)v2 + 13) + 8 * v53++) = 0;
          while (*(_QWORD *)&prime != v53);
          v54 = (_QWORD *)*v43;
          if (*v43)
          {
            v55 = v54[1];
            v56 = (uint8x8_t)vcnt_s8(prime);
            v56.i16[0] = vaddlv_u8(v56);
            if (v56.u32[0] > 1uLL)
            {
              if (v55 >= *(_QWORD *)&prime)
                v55 %= *(_QWORD *)&prime;
            }
            else
            {
              v55 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*((_QWORD *)v2 + 13) + 8 * v55) = v43;
            v60 = (_QWORD *)*v54;
            if (*v54)
            {
              do
              {
                v61 = v60[1];
                if (v56.u32[0] > 1uLL)
                {
                  if (v61 >= *(_QWORD *)&prime)
                    v61 %= *(_QWORD *)&prime;
                }
                else
                {
                  v61 &= *(_QWORD *)&prime - 1;
                }
                if (v61 != v55)
                {
                  v62 = *((_QWORD *)v2 + 13);
                  if (!*(_QWORD *)(v62 + 8 * v61))
                  {
                    *(_QWORD *)(v62 + 8 * v61) = v54;
                    goto LABEL_102;
                  }
                  *v54 = *v60;
                  *v60 = **(_QWORD **)(*((_QWORD *)v2 + 13) + 8 * v61);
                  **(_QWORD **)(*((_QWORD *)v2 + 13) + 8 * v61) = v60;
                  v60 = v54;
                }
                v61 = v55;
LABEL_102:
                v54 = v60;
                v60 = (_QWORD *)*v60;
                v55 = v61;
              }
              while (v60);
            }
          }
          v36 = (unint64_t)prime;
          goto LABEL_106;
        }
        v69 = (void *)*((_QWORD *)v2 + 13);
        *((_QWORD *)v2 + 13) = 0;
        if (v69)
          operator delete(v69);
        v36 = 0;
        *((_QWORD *)v2 + 14) = 0;
      }
    }
LABEL_106:
    if ((v36 & (v36 - 1)) != 0)
    {
      if (v35 >= v36)
        v31 = v35 % v36;
      else
        v31 = v35;
    }
    else
    {
      v31 = (v36 - 1) & v35;
    }
LABEL_111:
    v63 = *(_QWORD **)(*((_QWORD *)v2 + 13) + 8 * v31);
    if (v63)
    {
      **(_QWORD **)buf = *v63;
      *v63 = *(_QWORD *)buf;
    }
    else
    {
      **(_QWORD **)buf = *((_QWORD *)v2 + 15);
      *((_QWORD *)v2 + 15) = *(_QWORD *)buf;
      *(_QWORD *)(*((_QWORD *)v2 + 13) + 8 * v31) = v43;
      if (**(_QWORD **)buf)
      {
        v64 = *(_QWORD *)(**(_QWORD **)buf + 8);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v64 >= v36)
            v64 %= v36;
        }
        else
        {
          v64 &= v36 - 1;
        }
        *(_QWORD *)(*((_QWORD *)v2 + 13) + 8 * v64) = *(_QWORD *)buf;
      }
    }
    *(_QWORD *)buf = 0;
    ++*((_QWORD *)v2 + 16);
LABEL_120:
    -[PKMetalResourceHandler _signpostLog](v2);
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = v65;
    v67 = *((_QWORD *)v2 + 48);
    if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v66, OS_SIGNPOST_INTERVAL_END, v67, "CompileShader", (const char *)&unk_1BE532412, buf, 2u);
    }

    v2 = v73;
  }
  return v2;
}

void __43__PKMetalResourceHandler_uberShaderForKey___block_invoke(uint64_t a1)
{
  char *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _OWORD v7[2];
  uint64_t v8;

  v2 = *(char **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v3;
  v8 = *(_QWORD *)(a1 + 80);
  -[PKMetalResourceHandler _uberShaderForKey:](v2, (uint64_t *)v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)cachedQuadVertexBuffer
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PKMetalResourceHandler_cachedQuadVertexBuffer__block_invoke;
  v4[3] = &unk_1E7777418;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __48__PKMetalResourceHandler_cachedQuadVertexBuffer__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (id)cachedQuadTexCoordBuffer
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PKMetalResourceHandler_cachedQuadTexCoordBuffer__block_invoke;
  v4[3] = &unk_1E7777418;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__PKMetalResourceHandler_cachedQuadTexCoordBuffer__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)replaceInkTexture:(uint64_t)a3 image:
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v5 = a2;
  if (a1)
  {
    v6 = *(NSObject **)(a1 + 376);
    block[1] = 3221225472;
    block[2] = __50__PKMetalResourceHandler_replaceInkTexture_image___block_invoke;
    block[3] = &unk_1E777C678;
    block[4] = a1;
    v10 = a3;
    v7 = v5;
    block[0] = MEMORY[0x1E0C809B0];
    v9 = v5;
    dispatch_sync(v6, block);

    v5 = v7;
  }

}

void __50__PKMetalResourceHandler_replaceInkTexture_image___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", *(_QWORD *)(a1[4] + 432));
  v3 = *MEMORY[0x1E0CC6C10];
  v15[0] = *MEMORY[0x1E0CC6C18];
  v15[1] = v3;
  v16[0] = &unk_1E77EBDC0;
  v16[1] = &unk_1E77EBDD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[6];
  v10 = 0;
  v6 = (void *)objc_msgSend(v2, "newTextureWithCGImage:options:error:", v5, v4, &v10);
  v7 = v10;
  if (v7)
  {
    v8 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[5];
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Failed to replace with CGImage texture: %@, error: %@", buf, 0x16u);
    }

  }
  if (v6)
    objc_msgSend(*(id *)(a1[4] + 96), "setObject:forKeyedSubscript:", v6, a1[5]);

}

- (id)inkTextureNamed:(uint64_t)a3 image:
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__25;
    v18 = __Block_byref_object_dispose__25;
    v19 = 0;
    v7 = *(NSObject **)(a1 + 376);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__PKMetalResourceHandler_inkTextureNamed_image___block_invoke;
    v10[3] = &unk_1E777C6A0;
    v12 = &v14;
    v10[4] = a1;
    v11 = v5;
    v13 = a3;
    dispatch_sync(v7, v10);
    v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __48__PKMetalResourceHandler_inkTextureNamed_image___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[PKMetalResourceHandler _inkTextureNamed:image:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setupPaperTextureIfNecessary
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  UIImage *v16;
  uint64_t v17;
  os_log_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  id v29;
  id v30;
  uint8_t buf[16];
  CGSize v32;

  if (a1 && !a1[39])
  {
    -[PKMetalResourceHandler _signpostLog](a1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = a1[48];
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SetupPaperTexture", (const char *)&unk_1BE532412, buf, 2u);
    }

    v5 = (void *)MEMORY[0x1E0DC3870];
    v6 = (void *)MEMORY[0x1E0DC3E88];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

    objc_msgSend(v6, "traitCollectionWithDisplayScale:", fmin(v9, 2.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_kitImageNamed:withTrait:", CFSTR("UITexturedPaperTile"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "size");
    a1[40] = v12;
    a1[41] = v13;
    v14 = objc_retainAutorelease(v11);
    if (CGImageGetWidth((CGImageRef)objc_msgSend(v14, "CGImage")))
    {
      v32.width = 128.0;
      v32.height = 128.0;
      UIGraphicsBeginImageContextWithOptions(v32, 0, 1.0);
      objc_msgSend(v14, "drawInRect:", 0.0, 0.0, 128.0, 128.0);
      UIGraphicsGetImageFromCurrentImageContext();
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v15;
      UIGraphicsEndImageContext();
    }
    v16 = (UIImage *)objc_retainAutorelease(v14);
    v17 = -[UIImage CGImage](v16, "CGImage");
    if (v17)
    {
      v18 = (os_log_t)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", a1[54]);
      v30 = 0;
      v19 = -[NSObject newTextureWithCGImage:options:error:](v18, "newTextureWithCGImage:options:error:", v17, 0, &v30);
      v20 = v30;
      v21 = (void *)a1[39];
      a1[39] = v19;

      if (!a1[39])
      {
        UIImagePNGRepresentation(v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v20;
        v23 = -[NSObject newTextureWithData:options:error:](v18, "newTextureWithData:options:error:", v22, 0, &v29);
        v24 = v29;

        v25 = (void *)a1[39];
        a1[39] = v23;

        v20 = v24;
      }

    }
    else
    {
      v18 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Unable to load paper texture", buf, 2u);
      }
    }

    -[PKMetalResourceHandler _signpostLog](a1);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = a1[48];
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v27, OS_SIGNPOST_INTERVAL_END, v28, "SetupPaperTexture", (const char *)&unk_1BE532412, buf, 2u);
    }

  }
}

- (id)paperTexture
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__PKMetalResourceHandler_paperTexture__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __38__PKMetalResourceHandler_paperTexture__block_invoke(uint64_t a1)
{
  -[PKMetalResourceHandler _setupPaperTextureIfNecessary](*(_QWORD **)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

- (double)paperTextureSize
{
  NSObject *v1;
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  __n128 (*v8)(__n128 *, __n128 *);
  uint64_t (*v9)();
  const char *v10;

  if (!a1)
    return 0.0;
  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x4012000000;
  v8 = __Block_byref_object_copy__111;
  v9 = __Block_byref_object_dispose__112;
  v10 = "";
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PKMetalResourceHandler_paperTextureSize__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

__n128 __42__PKMetalResourceHandler_paperTextureSize__block_invoke(uint64_t a1)
{
  __n128 result;

  -[PKMetalResourceHandler _setupPaperTextureIfNecessary](*(_QWORD **)(a1 + 32));
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 320);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = result;
  return result;
}

- (id)randomNumberBuffer
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PKMetalResourceHandler_randomNumberBuffer__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__PKMetalResourceHandler_randomNumberBuffer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 368))
  {
    -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(v2 + 384);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SetupRandomNumberBuffer", (const char *)&unk_1BE532412, buf, 2u);
    }

    v6 = objc_msgSend(*(id *)(v2 + 432), "newBufferWithBytes:length:options:", -[PKMetalResourceHandler randomNumberArray](v2), 0x4000, 0);
    v7 = *(void **)(v2 + 368);
    *(_QWORD *)(v2 + 368) = v6;

    -[PKMetalResourceHandler _signpostLog]((id)v2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *(_QWORD *)(v2 + 384);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SetupRandomNumberBuffer", (const char *)&unk_1BE532412, v11, 2u);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 368));
}

- (id)uint16IndexBuffer
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 376);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PKMetalResourceHandler_uint16IndexBuffer__block_invoke;
  v4[3] = &unk_1E77795A8;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __43__PKMetalResourceHandler_uint16IndexBuffer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  char *v6;
  unint64_t v7;
  char *v8;
  int16x4_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  __int16 v15[8];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 344))
  {
    -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(v2 + 384);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SetupUInt16IndexBuffer", (const char *)&unk_1BE532412, buf, 2u);
    }

    v6 = (char *)operator new(0x30000uLL);
    bzero(v6, 0x30000uLL);
    v7 = -4;
    v8 = v6;
    do
    {
      v7 += 4;
      *(_WORD *)v8 = v7;
      v9 = vuzp1_s16((int16x4_t)vorr_s8((int8x8_t)vdup_n_s32(v7), (int8x8_t)0x200000001), (int16x4_t)0x200000001);
      *(int16x4_t *)(v8 + 2) = vzip1_s16(v9, vrev32_s16(v9));
      *((_WORD *)v8 + 5) = v7 | 3;
      v8 += 12;
    }
    while (v7 < 0xFFFC);
    v10 = objc_msgSend(*(id *)(v2 + 432), "newBufferWithBytes:length:options:", v6, 196608, 0, COERCE_DOUBLE(0x200000001));
    v11 = *(void **)(v2 + 344);
    *(_QWORD *)(v2 + 344) = v10;

    -[PKMetalResourceHandler _signpostLog]((id)v2);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = *(_QWORD *)(v2 + 384);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v15[0] = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v13, OS_SIGNPOST_INTERVAL_END, v14, "SetupUInt16IndexBuffer", (const char *)&unk_1BE532412, (uint8_t *)v15, 2u);
    }

    operator delete(v6);
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 344));
}

- (uint64_t)randomNumberArray
{
  unsigned __int8 v1;
  uint64_t v2;
  int v3;
  _QWORD block[5];

  if (result)
  {
    v1 = atomic_load((unsigned __int8 *)&qword_1ECEE6420);
    if ((v1 & 1) == 0)
    {
      v2 = result;
      v3 = __cxa_guard_acquire(&qword_1ECEE6420);
      result = v2;
      if (v3)
      {
        __cxa_atexit((void (*)(void *))std::vector<float>::~vector[abi:ne180100], qword_1ECEE6470, &dword_1BE213000);
        __cxa_guard_release(&qword_1ECEE6420);
        result = v2;
      }
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PKMetalResourceHandler_randomNumberArray__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = result;
    if (qword_1ECEE6418 != -1)
      dispatch_once(&qword_1ECEE6418, block);
    return qword_1ECEE6470[0];
  }
  return result;
}

void __43__PKMetalResourceHandler_randomNumberArray__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CreateRandomNumberArray", (const char *)&unk_1BE532412, buf, 2u);
  }

  std::vector<float>::resize(qword_1ECEE6470, 0x1000uLL);
  v5 = 0;
  v6 = qword_1ECEE6470[0];
  v7 = 43981;
  do
  {
    v7 = 1664525 * v7 + 1013904223;
    *(float *)(v6 + v5) = (float)vcvtd_n_u64_f64((double)v7 / 4294967300.0, 0x10uLL) * 0.000015259;
    v5 += 4;
  }
  while (v5 != 0x4000);
  -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384);
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CreateRandomNumberArray", (const char *)&unk_1BE532412, v11, 2u);
  }

}

- (id)indexBufferForNumVertices:(_QWORD *)a3 outIndexType:
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!a1)
    return 0;
  if (a2 > 0x10000)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__25;
    v12 = __Block_byref_object_dispose__25;
    v13 = 0;
    v5 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PKMetalResourceHandler_indexBufferForNumVertices_outIndexType___block_invoke;
    block[3] = &unk_1E777C6C8;
    block[5] = &v8;
    block[6] = a2;
    block[4] = a1;
    dispatch_sync(v5, block);
    *a3 = 1;
    v6 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    return v6;
  }
  else
  {
    *a3 = 0;
    -[PKMetalResourceHandler uint16IndexBuffer](a1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __65__PKMetalResourceHandler_indexBufferForNumVertices_outIndexType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int32x4_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unsigned int v15;
  char *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  __int16 v23[8];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_28;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(v2 + 360);
  if (*(_QWORD *)(v2 + 352) && v4 >= v3)
    goto LABEL_28;
  if (v4 <= 0x20000)
    v6 = 0x20000;
  else
    v6 = *(_QWORD *)(v2 + 360);
  if (v4 > v3)
    v3 = *(_QWORD *)(v2 + 360);
  if (v3 <= 0x20000)
    v3 = 0x20000;
  v7 = ((v3 - v6 + 0xFFFF) & 0xFFFFFFFFFFFF0000) + v6;
  -[PKMetalResourceHandler _signpostLog](*(id *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(v2 + 384);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SetupUInt32IndexBuffer", (const char *)&unk_1BE532412, buf, 2u);
  }

  v12 = v7 >> 2;
  v13 = 6 * (v7 >> 2);
  if (v13)
  {
    if (v13 >> 62)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v14 = (char *)operator new(24 * v12);
    bzero(v14, 24 * v12);
    if (!v7)
      goto LABEL_23;
    goto LABEL_21;
  }
  v14 = 0;
  if (v7)
  {
LABEL_21:
    v15 = 4;
    v16 = v14;
    do
    {
      *(_DWORD *)v16 = v15 - 4;
      *(int8x8_t *)v11.i8 = vorr_s8((int8x8_t)vdup_n_s32(v15 - 4), (int8x8_t)0x200000001);
      v11 = vzip1q_s32(v11, vrev64q_s32(v11));
      *(int32x4_t *)(v16 + 4) = v11;
      *((_DWORD *)v16 + 5) = v15 - 1;
      v17 = v7 > v15;
      v15 += 4;
      v16 += 24;
    }
    while (v17);
  }
LABEL_23:
  *(_QWORD *)(v2 + 360) = v7;
  v18 = objc_msgSend(*(id *)(v2 + 432), "newBufferWithBytes:length:options:", v14, 24 * v12, 0);
  v19 = *(void **)(v2 + 352);
  *(_QWORD *)(v2 + 352) = v18;

  -[PKMetalResourceHandler _signpostLog]((id)v2);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = *(_QWORD *)(v2 + 384);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v23[0] = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v21, OS_SIGNPOST_INTERVAL_END, v22, "SetupUInt32IndexBuffer", (const char *)&unk_1BE532412, (uint8_t *)v23, 2u);
  }

  if (v14)
    operator delete(v14);
LABEL_28:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 352));
}

- (void)deallocateReusableBuffers
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PKMetalResourceHandler_deallocateReusableBuffers__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

uint64_t __51__PKMetalResourceHandler_deallocateReusableBuffers__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 408);
  if (v1)
    return objc_msgSend(*(id *)(v1 + 56), "removeAllObjects");
  return result;
}

- (void)reloadParticleTexturesIfNecessaryCommandQueue:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  v3 = a2;
  if (a1)
  {
    if (-[PKMetalResourceHandler isAppInBackground]())
    {
      v4 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_INFO, "App was in the background when attempting to reload particle textures.", buf, 2u);
      }

    }
    else
    {
      v5 = *(NSObject **)(a1 + 376);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __72__PKMetalResourceHandler_reloadParticleTexturesIfNecessaryCommandQueue___block_invoke;
      v6[3] = &unk_1E7777440;
      v6[4] = a1;
      v7 = v3;
      dispatch_async(v5, v6);

    }
  }

}

void __72__PKMetalResourceHandler_reloadParticleTexturesIfNecessaryCommandQueue___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int8 *v22;
  uint64_t j;
  unsigned int v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  int v29;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t i;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[3];
  _BYTE v53[128];
  _QWORD v54[3];
  _BYTE v55[128];
  uint8_t buf[24];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v54[0] = CFSTR("com.apple.ink.marker");
  v54[1] = CFSTR("com.apple.ink.pencil");
  v54[2] = CFSTR("com.apple.ink.watercolor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v49 != v31)
          objc_enumerationMutation(obj);
        +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v32, -1.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "behavior");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKInkBehavior particleTextureName](v1);
        v2 = (id)objc_claimAutoreleasedReturnValue();

        if (v2)
          objc_msgSend(v34, "addObject:", v2);
        objc_msgSend(v37, "behavior");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "secondaryParticleDescriptor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "textureName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
          objc_msgSend(v34, "addObject:");
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v38 = v34;
        v5 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v5)
        {
          v39 = *(_QWORD *)v45;
          do
          {
            v40 = v5;
            v6 = 0;
            v7 = v2;
            do
            {
              if (*(_QWORD *)v45 != v39)
                objc_enumerationMutation(v38);
              v2 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * v6);

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", v2);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v8;
              if (v8)
              {
                if (objc_msgSend(v8, "pixelFormat") == 81 || objc_msgSend(v9, "pixelFormat") == 80)
                {
                  v11 = *(_QWORD *)(a1 + 32);
                  v10 = *(void **)(a1 + 40);
                  v12 = v9;
                  v41 = v10;
                  v42 = v12;
                  if (v11)
                  {
                    if (objc_msgSend(v12, "pixelFormat") == 81 || objc_msgSend(v12, "pixelFormat") == 80)
                    {
                      objc_msgSend(v41, "commandBuffer");
                      v13 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v13, "blitCommandEncoder");
                      v14 = (void *)objc_claimAutoreleasedReturnValue();
                      v15 = objc_msgSend(v42, "width");
                      v16 = objc_msgSend(v42, "height");
                      v17 = (void *)objc_msgSend(*(id *)(v11 + 432), "newBufferWithLength:options:", v16 * 4 * v15, 0);
                      memset(buf, 0, sizeof(buf));
                      v52[0] = v15;
                      v52[1] = v16;
                      v52[2] = 1;
                      objc_msgSend(v14, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v42, 0, 0, buf, v52, v17, 0, 4 * v15, v16 * 4 * v15);
                      objc_msgSend(v14, "endEncoding");
                      objc_msgSend(v13, "commit");
                      objc_msgSend(v13, "waitUntilCompleted");
                      v18 = objc_retainAutorelease(v17);
                      v19 = objc_msgSend(v18, "contents");
                      if (!v16)
                        goto LABEL_28;
                      v20 = 0;
                      v21 = 0;
                      do
                      {
                        v22 = (unsigned __int8 *)v19;
                        for (j = v15; j; --j)
                        {
                          v24 = *v22;
                          v22 += 4;
                          v21 += v24;
                        }
                        v19 += 4 * v15;
                        ++v20;
                      }
                      while (v20 != v16);
                      if (v16 * v15)
                        v11 = v21 / (v16 * v15);
                      else
LABEL_28:
                        v11 = 0;

                    }
                    else
                    {
                      v11 = 0;
                    }
                  }

                  v26 = os_log_create("com.apple.pencilkit", ");
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(_QWORD *)&buf[4] = v11;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v2;
                    _os_log_debug_impl(&dword_1BE213000, v26, OS_LOG_TYPE_DEBUG, "Calculated average pixel alpha value: %ld, texture: %@", buf, 0x16u);
                  }

                  if (v11 - 201 <= 0xFFFFFFFFFFFFFF46)
                  {
                    v27 = os_log_create("com.apple.pencilkit", ");
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v2;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v11;
                      _os_log_fault_impl(&dword_1BE213000, v27, OS_LOG_TYPE_FAULT, "Detected a texture that was corrupt: %@, %lu", buf, 0x16u);
                    }

                    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", v2);
                    v28 = -[PKMetalResourceHandler _inkTextureNamed:image:](*(_QWORD *)(a1 + 32), v2, 0);
                  }
                }
                else
                {
                  v25 = os_log_create("com.apple.pencilkit", ");
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    v29 = objc_msgSend(v9, "pixelFormat");
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v2;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v29;
                    _os_log_error_impl(&dword_1BE213000, v25, OS_LOG_TYPE_ERROR, "Unexpected pixel format in particle texture: %@, %d", buf, 0x12u);
                  }

                }
              }

              ++v6;
              v7 = v2;
            }
            while (v6 != v40);
            v5 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v5);
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v33);
  }

}

- (id)newPurgeableBufferWithLength:(uint64_t)a3 bytes:(uint64_t)a4 outOffset:
{
  NSObject *v4;
  id v5;
  _QWORD block[9];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (result)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__25;
    v11 = __Block_byref_object_dispose__25;
    v12 = 0;
    v4 = *((_QWORD *)result + 47);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PKMetalResourceHandler_newPurgeableBufferWithLength_bytes_outOffset___block_invoke;
    block[3] = &unk_1E777C6F0;
    block[4] = result;
    block[5] = &v7;
    block[6] = a2;
    block[7] = a3;
    block[8] = a4;
    dispatch_sync(v4, block);
    v5 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

    return v5;
  }
  return result;
}

void __71__PKMetalResourceHandler_newPurgeableBufferWithLength_bytes_outOffset___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 392);
  if (v2)
    v2 = -[PKMetalResourceHandlerBuffer newBufferWithLength:bytes:outOffset:outReusableMetalBuffer:]((uint64_t)v2, *(_QWORD *)(a1 + 48), *(const void **)(a1 + 56), *(unint64_t **)(a1 + 64), 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)newBufferWithLength:(uint64_t)a3 bytes:(uint64_t)a4 outOffset:
{
  NSObject *v4;
  id v5;
  _QWORD block[9];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (result)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__25;
    v11 = __Block_byref_object_dispose__25;
    v12 = 0;
    v4 = *((_QWORD *)result + 47);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__PKMetalResourceHandler_newBufferWithLength_bytes_outOffset___block_invoke;
    block[3] = &unk_1E777C6F0;
    block[4] = result;
    block[5] = &v7;
    block[6] = a2;
    block[7] = a3;
    block[8] = a4;
    dispatch_sync(v4, block);
    v5 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

    return v5;
  }
  return result;
}

void __62__PKMetalResourceHandler_newBufferWithLength_bytes_outOffset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400);
  if (v2
    && (v3 = -[PKMetalResourceHandlerBuffer newBufferWithLength:bytes:outOffset:outReusableMetalBuffer:](v2, *(_QWORD *)(a1 + 48), *(const void **)(a1 + 56), *(unint64_t **)(a1 + 64), 0)) != 0)
  {
    v5 = v3;
    v4 = (void *)v3[3];
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

}

- (id)newGPUBufferWithLength:(uint64_t)a3 outOffset:(void *)a4 commandBuffer:
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a4;
  v8 = v7;
  if (a1)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__25;
    v21 = __Block_byref_object_dispose__25;
    v22 = 0;
    v9 = *(NSObject **)(a1 + 376);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke;
    block[3] = &unk_1E777C740;
    v14 = &v17;
    v15 = a2;
    block[4] = a1;
    v16 = a3;
    v13 = v7;
    dispatch_sync(v9, block);
    v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  id v13;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(unint64_t **)(a1 + 64);
  v13 = 0;
  v5 = -[PKMetalResourceHandlerBuffer newBufferWithLength:bytes:outOffset:outReusableMetalBuffer:](v2, v3, 0, v4, &v13);
  v6 = v13;
  if (v5)
    v7 = (void *)v5[3];
  else
    v7 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);

  if (v6 && *(_QWORD *)(a1 + 40))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke_2;
    v9[3] = &unk_1E777C718;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    objc_msgSend(v8, "addCompletedHandler:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke_2(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[47];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke_3;
    v5[3] = &unk_1E7777440;
    v5[4] = WeakRetained;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);

  }
}

void __73__PKMetalResourceHandler_newGPUBufferWithLength_outOffset_commandBuffer___block_invoke_3(uint64_t a1)
{
  -[PKMetalResourceHandlerBuffer addReusableBuffer:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 408), *(void **)(a1 + 40));
}

- (void).cxx_destruct
{
  id *next;
  id *v4;
  void **value;
  id *v6;
  id *v7;
  void **v8;
  id *v9;
  id *v10;
  void **v11;
  id *v12;
  id *v13;
  void **v14;
  id *v15;
  id *v16;
  void **v17;

  objc_storeStrong((id *)&self->_sharedPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_gpuResourceBuffer, 0);
  objc_storeStrong((id *)&self->_resourceBuffer, 0);
  objc_storeStrong((id *)&self->_purgeableResourceBuffer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_randomNumberBuffer, 0);
  objc_storeStrong((id *)&self->_uint32IndexBuffer, 0);
  objc_storeStrong((id *)&self->_uint16IndexBuffer, 0);
  objc_storeStrong((id *)&self->_strokeRenderCache, 0);
  objc_storeStrong((id *)&self->_paperTexture, 0);
  objc_storeStrong((id *)&self->_defaultLibrary, 0);
  next = (id *)self->_kernelPipelines.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (id *)*next;

      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_kernelPipelines.__table_.__bucket_list_.__ptr_.__value_;
  self->_kernelPipelines.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  v6 = (id *)self->_pipelineDescriptors.__table_.__p1_.__value_.__next_;
  if (v6)
  {
    do
    {
      v7 = (id *)*v6;

      operator delete(v6);
      v6 = v7;
    }
    while (v7);
  }
  v8 = self->_pipelineDescriptors.__table_.__bucket_list_.__ptr_.__value_;
  self->_pipelineDescriptors.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8)
    operator delete(v8);
  v9 = (id *)self->_namedShaders.__table_.__p1_.__value_.__next_;
  if (v9)
  {
    do
    {
      v10 = (id *)*v9;

      operator delete(v9);
      v9 = v10;
    }
    while (v10);
  }
  v11 = self->_namedShaders.__table_.__bucket_list_.__ptr_.__value_;
  self->_namedShaders.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v11)
    operator delete(v11);
  v12 = (id *)self->_sixChannelShaders.__table_.__p1_.__value_.__next_;
  if (v12)
  {
    do
    {
      v13 = (id *)*v12;

      operator delete(v12);
      v12 = v13;
    }
    while (v13);
  }
  v14 = self->_sixChannelShaders.__table_.__bucket_list_.__ptr_.__value_;
  self->_sixChannelShaders.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v14)
    operator delete(v14);
  v15 = (id *)self->_uberShaders.__table_.__p1_.__value_.__next_;
  if (v15)
  {
    do
    {
      v16 = (id *)*v15;

      operator delete(v15);
      v15 = v16;
    }
    while (v16);
  }
  v17 = self->_uberShaders.__table_.__bucket_list_.__ptr_.__value_;
  self->_uberShaders.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v17)
    operator delete(v17);
  objc_storeStrong((id *)&self->_inkTextures, 0);
  objc_storeStrong((id *)&self->_cachedQuadTexCoordBuffer, 0);
  objc_storeStrong((id *)&self->_cachedQuadVertexBuffer, 0);
  objc_storeStrong((id *)&self->_sixChannelCopyToCanvasPipelineState, 0);
  objc_storeStrong((id *)&self->_paintShaderKernelPipelineStateWithLiveStrokeParticles, 0);
  objc_storeStrong((id *)&self->_paintShaderKernelPipelineStateWithLiveStrokeMode, 0);
  objc_storeStrong((id *)&self->_sdfPenEllipseLookupTexture, 0);
  objc_storeStrong((id *)&self->_sdfPenMaxHeightLookupTexture, 0);
  objc_storeStrong((id *)&self->_sdfPenShaderKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_paintShaderKernelPipelineState, 0);
  objc_storeStrong((id *)&self->_particleShaderKernelPipelineStateWithVariableSpacing, 0);
  objc_storeStrong((id *)&self->_particleShaderKernelPipelineState, 0);
}

@end
