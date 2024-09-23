@implementation ETDataTensor

- (ETDataTensor)initWithData:(void *)a3 type:(unint64_t)a4 shape:(id)a5 strides:(id)a6
{
  id v11;
  id v12;
  ETDataTensor *v13;
  ETDataTensor *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  ETDataTensor *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ETDataTensor;
  v13 = -[ETDataTensor init](&v26, sel_init);
  v14 = v13;
  if (!v13)
  {
LABEL_14:
    v20 = v14;
    goto LABEL_15;
  }
  v13->_type = a4;
  objc_storeStrong((id *)&v13->_shape, a5);
  objc_storeStrong((id *)&v14->_strides, a6);
  if (a4 == 2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v23;
      v18 = 1;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v15);
          v18 *= objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v22);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 1;
    }

    v14->_float_buffer.ptr = (float *)a3;
    v14->_float_buffer.size = v18;
    v14->_float_buffer.free_when_done = 0;
    goto LABEL_14;
  }
  v20 = 0;
LABEL_15:

  return v20;
}

- (ETDataTensor)initWithCVPixelBuffer:(__CVBuffer *)a3 imageParameters:(id)a4 error:(id *)a5
{
  id v8;
  ETDataTensor *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  OSType PixelFormatType;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  ETDataTensor *v39;
  int v40;
  int v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  uint64_t v45;
  void (***v46)(uint64_t *__return_ptr, _QWORD);
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSArray *v62;
  uint64_t v63;
  uint64_t v64;
  NSArray *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  void *v69;
  NSArray *shape;
  NSArray *v71;
  NSArray *strides;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  void *v85;
  void *v86;
  uint64_t v87;
  _OWORD v88[2];
  _QWORD v89[3];
  _QWORD v90[4];
  uint64_t v91;
  std::__shared_weak_count *v92;
  vImage_Buffer v93;
  int v94;
  uint64_t v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  uint64_t v107;
  std::__shared_weak_count *v108;
  uint8_t permuteMap[4];
  int height;
  int v111;
  uint64_t v112;
  int v113;
  __int128 v114;
  __int128 __p;
  uint64_t v116;
  uint64_t v117;
  std::__shared_weak_count *v118;
  void (***v119)(uint64_t *__return_ptr, _QWORD);
  std::__shared_weak_count *v120;
  __int128 v121;
  vImage_Buffer dest;
  objc_super v123;
  _QWORD v124[5];
  uint64_t v125;
  const __CFString *v126;
  uint64_t v127;
  const __CFString *v128;
  uint64_t v129;
  const __CFString *v130;
  uint64_t v131;
  const __CFString *v132;
  uint64_t v133;
  _QWORD v134[4];

  v134[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v123.receiver = self;
  v123.super_class = (Class)ETDataTensor;
  v9 = -[ETDataTensor init](&v123, sel_init);
  if (!v9)
  {
LABEL_68:
    v39 = v9;
    goto LABEL_69;
  }
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v133 = *MEMORY[0x1E0CB2D50];
      v134[0] = CFSTR("Failed to lock pixel buffer");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, &v133, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_24;
  }
  dest.width = CVPixelBufferGetWidth(a3);
  dest.height = CVPixelBufferGetHeight(a3);
  dest.rowBytes = CVPixelBufferGetBytesPerRow(a3);
  dest.data = CVPixelBufferGetBaseAddress(a3);
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_20;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bias_r"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bias_g"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bias_b"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("is_network_bgr"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (!v17)
          {
            v121 = 0uLL;
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scale"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "floatValue");
            v20 = v19;

            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bias_r"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "floatValue");
            v23 = v22;

            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bias_g"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "floatValue");
            v26 = v25;

            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bias_b"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "floatValue");
            v29 = v28;

            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("is_network_bgr"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "BOOLValue");

            PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
            if (CVPixelBufferIsPlanar(a3))
            {
              if (a5)
              {
                v33 = (void *)MEMORY[0x1E0CB35C8];
                v127 = *MEMORY[0x1E0CB2D50];
                v128 = CFSTR("CVPixelBuffer provided must be of an interleaved pixel format (must not be planar)");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v34);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_23;
            }
            switch(PixelFormatType)
            {
              case 0x20u:
                *(_DWORD *)permuteMap = 66051;
                vImagePermuteChannels_ARGB8888(&dest, &dest, permuteMap, 0);
                break;
              case 0x42475241u:
                break;
              case 0x4C303038u:
                v31 = 0;
                v40 = 1;
                v41 = 1;
                goto LABEL_31;
              default:
                if (a5)
                {
                  v85 = (void *)MEMORY[0x1E0CB35C8];
                  v125 = *MEMORY[0x1E0CB2D50];
                  v126 = CFSTR("CVPixelBuffer must be one of: kCVPixelFormatType_OneComponent8, kCVPixelFormatType_32ARGB, kCVPixelFormatType_32BGRA");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v86);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                }
                goto LABEL_23;
            }
            v41 = 4;
            v40 = 3;
LABEL_31:
            *(_DWORD *)permuteMap = 0;
            Espresso::create_context((int *)permuteMap, &v119);
            std::allocate_shared[abi:ne180100]<Espresso::blob_cpu,std::allocator<Espresso::blob_cpu>,std::shared_ptr<Espresso::abstract_context> &,Espresso::compute_path,void>(&v117, &v119, 0);
            v116 = 0;
            v114 = 0u;
            __p = 0u;
            *(_DWORD *)permuteMap = dest.width;
            height = dest.height;
            v112 = 0x100000001;
            v111 = v40;
            v113 = -1;
            v107 = 0;
            v108 = 0;
            (*(void (**)(uint64_t, uint8_t *, uint64_t *))(*(_QWORD *)v117 + 16))(v117, permuteMap, &v107);
            v42 = v108;
            if (v108)
            {
              p_shared_owners = (unint64_t *)&v108->__shared_owners_;
              do
                v44 = __ldaxr(p_shared_owners);
              while (__stlxr(v44 - 1, p_shared_owners));
              if (!v44)
              {
                ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
                std::__shared_weak_count::__release_weak(v42);
              }
            }
            v90[0] = MEMORY[0x1E0C809B0];
            v90[1] = 3321888768;
            v90[2] = __60__ETDataTensor_initWithCVPixelBuffer_imageParameters_error___block_invoke;
            v90[3] = &__block_descriptor_164_ea8_32c46_ZTSNSt3__110shared_ptrIN8Espresso8blob_cpuEEE_e10_v16__0r_v8l;
            v45 = v117;
            v46 = v119;
            v91 = v117;
            v92 = v118;
            if (v118)
            {
              v47 = (unint64_t *)&v118->__shared_owners_;
              do
                v48 = __ldxr(v47);
              while (__stxr(v48 + 1, v47));
            }
            v93 = dest;
            v94 = v20;
            v95 = 0x100000000;
            v96 = v31;
            v97 = v23;
            v98 = v26;
            v99 = v29;
            v100 = 0;
            v101 = v121;
            __asm { FMOV            V0.2S, #1.0 }
            v102 = _D0;
            v103 = 0;
            v104 = 0;
            v106 = v41;
            v105 = 0;
            Espresso::abstract_context::compute_batch_sync(v46, v90);
            v54 = *(std::__shared_weak_count **)(v45 + 168);
            v87 = *(_QWORD *)(v45 + 160);
            v89[1] = v87;
            v89[2] = v54;
            if (v54)
            {
              v55 = (unint64_t *)&v54->__shared_owners_;
              do
                v56 = __ldxr(v55);
              while (__stxr(v56 + 1, v55));
            }
            CVPixelBufferUnlockBaseAddress(a3, 1uLL);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v45 + 24), &v91);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v124[0] = v57;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v45 + 20));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v124[1] = v58;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v45 + 16));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v124[2] = v59;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v45 + 12));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v124[3] = v60;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v45 + 8));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v124[4] = v61;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 5);
            v62 = (NSArray *)objc_claimAutoreleasedReturnValue();

            v63 = 0;
            memset(v88, 0, sizeof(v88));
            v64 = 1;
            do
            {
              *((_QWORD *)v88 + v63) = (int)v64;
              v64 *= *(int *)(v87 + 8 + 4 * v63++);
            }
            while (v63 != 4);
            v89[0] = v64;
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
            v65 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v66 = 0;
            v67 = v89;
            do
            {
              v68 = *v67--;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray setObject:atIndexedSubscript:](v65, "setObject:atIndexedSubscript:", v69, v66);

              ++v66;
            }
            while (v66 != 5);
            shape = v9->_shape;
            v9->_shape = v62;
            v71 = v62;

            strides = v9->_strides;
            v9->_strides = v65;

            v9->_type = 2;
            std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v9->_blob.__ptr_, v87, (uint64_t)v54);
            if (v54)
            {
              v73 = (unint64_t *)&v54->__shared_owners_;
              do
                v74 = __ldaxr(v73);
              while (__stlxr(v74 - 1, v73));
              if (!v74)
              {
                ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
                std::__shared_weak_count::__release_weak(v54);
              }
            }
            v75 = v92;
            if (v92)
            {
              v76 = (unint64_t *)&v92->__shared_owners_;
              do
                v77 = __ldaxr(v76);
              while (__stlxr(v77 - 1, v76));
              if (!v77)
              {
                ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
                std::__shared_weak_count::__release_weak(v75);
              }
            }
            if ((_QWORD)__p)
            {
              *((_QWORD *)&__p + 1) = __p;
              operator delete((void *)__p);
            }
            v78 = v118;
            if (v118)
            {
              v79 = (unint64_t *)&v118->__shared_owners_;
              do
                v80 = __ldaxr(v79);
              while (__stlxr(v80 - 1, v79));
              if (!v80)
              {
                ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
                std::__shared_weak_count::__release_weak(v78);
              }
            }
            v81 = v120;
            if (v120)
            {
              v82 = (unint64_t *)&v120->__shared_owners_;
              do
                v83 = __ldaxr(v82);
              while (__stlxr(v83 - 1, v82));
              if (!v83)
              {
                ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
                std::__shared_weak_count::__release_weak(v81);
              }
            }
            goto LABEL_68;
          }
LABEL_20:
          if (a5)
          {
            v38 = (void *)MEMORY[0x1E0CB35C8];
            v129 = *MEMORY[0x1E0CB2D50];
            v130 = CFSTR("Failed to find one or more of the following pre-processing params by key (each is required): scale, bias_r, bias_g, bias_b, network_wants_bgr.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
          goto LABEL_23;
        }

      }
    }

    goto LABEL_20;
  }
  if (a5)
  {
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v131 = *MEMORY[0x1E0CB2D50];
    v132 = CFSTR("Failed to find preprocessing parameters for image, must specify: scale, R,G,B biases, and whether the network's input is expecting BGR color interleaving.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("EspressoError"), 1, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
    *a5 = v37;

  }
LABEL_23:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
LABEL_24:
  v39 = 0;
LABEL_69:

  return v39;
}

- (ETDataTensor)initWithBlobContainer:(shared_ptr<Espresso:(BOOL)a4 :abstract_blob_container>)a3 directBind:
{
  int cntrl;
  abstract_blob_container *ptr;
  ETDataTensor *v6;
  unsigned int *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;
  NSArray *shape;
  NSArray *v43;
  NSArray *strides;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  _OWORD v49[2];
  uint64_t v50;
  unsigned int *v51;
  std::__shared_weak_count *v52;
  __int128 v53;
  objc_super v54;
  _QWORD v55[6];

  cntrl = (int)a3.__cntrl_;
  ptr = a3.__ptr_;
  v55[5] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)ETDataTensor;
  v6 = -[ETDataTensor init](&v54, sel_init, a3.__ptr_, a3.__cntrl_, a4);
  if (v6)
  {
    v53 = 0uLL;
    v7 = *(unsigned int **)ptr;
    if (!cntrl || !v7)
      goto LABEL_16;
    if (v8)
    {
      v9 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
      }
      v12 = v8[20];
      if (v12)
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v53, v12, v8[21]);
      if (v9)
      {
        v13 = (unint64_t *)&v9->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
    v7 = *(unsigned int **)ptr;
    if (!(_QWORD)v53)
    {
LABEL_16:
      v15 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
      v51 = v7;
      v52 = v15;
      if (v15)
      {
        v16 = (unint64_t *)&v15->__shared_owners_;
        do
          v17 = __ldxr(v16);
        while (__stxr(v17 + 1, v16));
      }
      Espresso::sync_copy_to_host(v49, &v51);
      v18 = v49[0];
      v49[0] = 0uLL;
      v19 = (std::__shared_weak_count *)*((_QWORD *)&v53 + 1);
      v53 = v18;
      if (v19)
      {
        v20 = (unint64_t *)&v19->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
      v22 = (std::__shared_weak_count *)*((_QWORD *)&v49[0] + 1);
      if (*((_QWORD *)&v49[0] + 1))
      {
        v23 = (unint64_t *)(*((_QWORD *)&v49[0] + 1) + 8);
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      v25 = v52;
      if (v52)
      {
        v26 = (unint64_t *)&v52->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      v7 = *(unsigned int **)ptr;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7[6]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v28;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)ptr + 20));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)ptr + 16));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)ptr + 12));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)ptr + 8));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 5);
    v33 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    memset(v49, 0, sizeof(v49));
    v35 = v53 + 8;
    v36 = 1;
    do
    {
      *((_QWORD *)v49 + v34) = (int)v36;
      v36 *= *(int *)(v35 + 4 * v34++);
    }
    while (v34 != 4);
    v50 = v36;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = &v50;
    do
    {
      v40 = *v39--;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray setObject:atIndexedSubscript:](v37, "setObject:atIndexedSubscript:", v41, v38);

      ++v38;
    }
    while (v38 != 5);
    shape = v6->_shape;
    v6->_shape = v33;
    v43 = v33;

    strides = v6->_strides;
    v6->_strides = v37;

    v6->_type = 2;
    std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v6->_blob.__ptr_, v53, *((uint64_t *)&v53 + 1));
    v45 = (std::__shared_weak_count *)*((_QWORD *)&v53 + 1);
    if (*((_QWORD *)&v53 + 1))
    {
      v46 = (unint64_t *)(*((_QWORD *)&v53 + 1) + 8);
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
  }
  return v6;
}

- (ETDataTensor)initWithBlobContainer:(shared_ptr<Espresso::abstract_blob_container>)a3
{
  abstract_blob_container *ptr;
  ETDataTensor *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  ETDataTensor *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v14;
  std::__shared_weak_count *v15;

  ptr = a3.__ptr_;
  v5 = [ETDataTensor alloc];
  v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v14 = *(_QWORD *)ptr;
  v15 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[ETDataTensor initWithBlobContainer:directBind:](v5, "initWithBlobContainer:directBind:", &v14, 0);
  v10 = v15;
  if (v15)
  {
    v11 = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return v9;
}

- (void)setMaxNumberOfElements:(id)a3
{
  self->_float_buffer.size = objc_msgSend(a3, "unsignedIntegerValue");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t size;
  uint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[ETDataTensor dataArray](self, "dataArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), &stru_1E2DD80E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n    "), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ETDataTensor float_buffer](self, "float_buffer");
  if (v16)
  {
    size = self->_float_buffer.size;
  }
  else
  {
    -[ETDataTensor blob](self, "blob");
    if (v17)
    {
      p_shared_owners = &v17->__shared_owners_;
      do
        v9 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v9 - 1, (unint64_t *)p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    size = 1;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = -[ETDataTensor dataPointer](self, "dataPointer");
  -[ETDataTensor shape](self, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETDataTensor strides](self, "strides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Tensor w/ data pointer: %p: data: %@. \nShape: %@, Strides: %@,Contiguous Size: %lu"), v11, v6, v12, v13, size);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)dataPointer
{
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;

  -[ETDataTensor float_buffer](self, "float_buffer");
  if (v7)
    return self->_float_buffer.ptr;
  -[ETDataTensor blob](self, "blob");
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return 0;
}

- (NSArray)dataArray
{
  void *v3;
  double v4;
  unint64_t v5;
  void *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  -[ETDataTensor float_buffer](self, "float_buffer");
  if (v10)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_float_buffer.size);
    if (self->_float_buffer.size)
    {
      v5 = 0;
      do
      {
        *(float *)&v4 = self->_float_buffer.ptr[v5];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:atIndexedSubscript:", v6, v5);

        ++v5;
      }
      while (self->_float_buffer.size > v5);
    }
  }
  else
  {
    -[ETDataTensor blob](self, "blob");
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)())v11->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setDataPointer:(void *)a3
{
  self->_dataPointer = a3;
}

- (void)setDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_dataArray, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
  objc_storeStrong((id *)&self->_shape, a3);
}

- (NSArray)strides
{
  return self->_strides;
}

- (void)setStrides:(id)a3
{
  objc_storeStrong((id *)&self->_strides, a3);
}

- (NSNumber)maxNumberOfElements
{
  return self->_maxNumberOfElements;
}

- (vImage_Buffer)imageBuffer
{
  vImage_Buffer *result;

  objc_copyStruct(retstr, &self->_imageBuffer, 32, 1, 0);
  return result;
}

- (void)setImageBuffer:(vImage_Buffer *)a3
{
  objc_copyStruct(&self->_imageBuffer, a3, 32, 1, 0);
}

- (vector<std::shared_ptr<unsigned)allocatedImageData
{
  vector<std::shared_ptr<unsigned char>, std::allocator<std::shared_ptr<unsigned char>>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_allocatedImageData, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__7930);
  return result;
}

- (void)setAllocatedImageData:(vector<std:(std::allocator<std::shared_ptr<unsigned char>>> *)a3 :shared_ptr<unsigned)char>
{
  objc_copyCppObjectAtomic(&self->_allocatedImageData, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__7928);
}

- (float_buffer_t)float_buffer
{
  float_buffer_t *result;

  objc_copyStruct(retstr, &self->_float_buffer, 24, 1, 0);
  return result;
}

- (void)setFloat_buffer:(float_buffer_t *)a3
{
  objc_copyStruct(&self->_float_buffer, a3, 24, 1, 0);
}

- (shared_ptr<Espresso::blob<float,)blob
{
  void *v2;
  void *v3;
  __shared_weak_count *v4;
  shared_ptr<Espresso::blob<float, 4>> result;

  objc_copyCppObjectAtomic(v2, &self->_blob, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__38);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setBlob:()shared_ptr<Espresso:(4>>)a3 :blob<float
{
  objc_copyCppObjectAtomic(&self->_blob, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__39);
}

- (void).cxx_destruct
{
  vector<std::shared_ptr<unsigned char>, std::allocator<std::shared_ptr<unsigned char>>> *p_allocatedImageData;

  p_allocatedImageData = &self->_allocatedImageData;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_allocatedImageData);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_blob);
  objc_storeStrong((id *)&self->_maxNumberOfElements, 0);
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_dataArray, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

void __60__ETDataTensor_initWithCVPixelBuffer_imageParameters_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int *v4;
  _OWORD *v5;
  __int128 v6;
  uint64_t v7;
  void *__p;
  void *v9;
  _OWORD *v10;

  v4 = *(int **)(a1 + 32);
  v5 = operator new(0x20uLL);
  v9 = v5 + 2;
  v10 = v5 + 2;
  v6 = *(_OWORD *)(a1 + 64);
  *v5 = *(_OWORD *)(a1 + 48);
  v5[1] = v6;
  __p = v5;
  Espresso::fill_blob_with_images_batch_safe_v2(a2, v4, (const char ***)&__p, *(unsigned int *)(a1 + 160), v7, (__int128 *)(a1 + 80));
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
}

@end
