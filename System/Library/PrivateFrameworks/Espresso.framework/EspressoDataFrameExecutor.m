@implementation EspressoDataFrameExecutor

- (BOOL)useCVPixelBuffersForOutputs:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::onceToken != -1)
    dispatch_once(&-[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::onceToken, &__block_literal_global_342);
  if ((-[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS_set & 1) != 0
    || v3)
  {
    return -[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS;
  }
  else
  {
    return -[EspressoDataFrameExecutor use_cvpixelbuffer](self, "use_cvpixelbuffer") != 0;
  }
}

- (BOOL)useCVPixelBuffers
{
  return -[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:](self, "useCVPixelBuffersForOutputs:", 0);
}

- (int)bindInput:(id)a3 fromImageAttachment:(id)a4 toNetwork:(id)a5
{
  uint64_t v5;
  void *var0;
  id v9;
  id v10;
  void *v11;
  void *v12;
  Espresso *v13;
  const char *v14;
  __CVBuffer *v15;
  const char *v16;
  uint64_t v17;
  __CVBuffer **v18;
  __CVBuffer **v19;
  __CVBuffer **v20;
  void **value;
  void **end;
  void **v23;
  void **begin;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  Espresso *v32;
  const char *v33;
  char v34;
  int v35;
  __CVBuffer **v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void **v42;
  void **v43;
  void **v44;
  void **v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  __CVBuffer **v50;
  __CVBuffer **v51;
  __CVBuffer **v52;
  __CVBuffer **v53;
  __CVBuffer *v54;
  _BOOL4 v55;
  std::__shared_weak_count *v56;
  unint64_t *p_shared_owners;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  id v62;
  uint64_t v63;
  _OWORD v64[2];
  uint64_t v65;
  std::__shared_weak_count *v66;
  _OWORD v67[2];
  __int128 v68;
  __int128 v69;
  __int128 buf;
  uint64_t v71;

  v5 = *(_QWORD *)&a5.var1;
  var0 = a5.var0;
  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v68 = 0u;
  v69 = 0u;
  if (v10)
    objc_msgSend(v10, "copyAsImageGrayscaleOrBGRA");
  if (!-[EspressoDataFrameExecutor useCVPixelBuffers](self, "useCVPixelBuffers"))
  {
    end = self->pointers_to_free.__end_;
    value = self->pointers_to_free.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->pointers_to_free.__begin_;
      v25 = end - begin;
      if ((unint64_t)(v25 + 1) >> 61)
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      v26 = (char *)value - (char *)begin;
      v27 = v26 >> 2;
      if (v26 >> 2 <= (unint64_t)(v25 + 1))
        v27 = v25 + 1;
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
        v28 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v28 = v27;
      if (v28)
        v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v28);
      else
        v29 = 0;
      v42 = (void **)(v28 + 8 * v25);
      v43 = (void **)(v28 + 8 * v29);
      *v42 = (void *)v68;
      v23 = v42 + 1;
      v45 = self->pointers_to_free.__begin_;
      v44 = self->pointers_to_free.__end_;
      if (v44 != v45)
      {
        do
        {
          v46 = *--v44;
          *--v42 = v46;
        }
        while (v44 != v45);
        v44 = self->pointers_to_free.__begin_;
      }
      self->pointers_to_free.__begin_ = v42;
      self->pointers_to_free.__end_ = v23;
      self->pointers_to_free.__end_cap_.__value_ = v43;
      if (v44)
        operator delete(v44);
    }
    else
    {
      *end = (void *)v68;
      v23 = end + 1;
    }
    self->pointers_to_free.__end_ = v23;
    v47 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v64[0] = v68;
    v64[1] = v69;
    v32 = (Espresso *)espresso_network_bind_input_vimagebuffer_bgra8(var0, v5, v47, 0, (uint64_t)v64, 0);
    v35 = (int)v32;
    goto LABEL_41;
  }
  v12 = (void *)v68;
  if (objc_msgSend(v11, "nChannels") != 3)
  {
    v13 = (Espresso *)objc_msgSend(v11, "nChannels");
    if ((_DWORD)v13 != 4)
    {
      Espresso::espresso_os_log_subsystem(v13, v14);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      LOWORD(buf) = 0;
      v31 = "Wrong number of channels in vImage";
LABEL_70:
      _os_log_error_impl(&dword_190DAF000, v30, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&buf, 2u);
LABEL_22:

      v34 = 0;
      v35 = 0;
      if (!v12)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  v67[0] = v68;
  v67[1] = v69;
  v15 = +[EspressoDataFrameImageAttachment createCVPixelBufferFromvImage:withPixelFormat:](EspressoDataFrameImageAttachment, "createCVPixelBufferFromvImage:withPixelFormat:", v67, 1111970369);
  v17 = (uint64_t)v15;
  if (!v15)
  {
    Espresso::espresso_os_log_subsystem(0, v16);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    LOWORD(buf) = 0;
    v31 = "Could not create pixelbuffer";
    goto LABEL_70;
  }
  v19 = self->pixelbuffers_to_release.__end_;
  v18 = self->pixelbuffers_to_release.__end_cap_.__value_;
  if (v19 >= v18)
  {
    v36 = self->pixelbuffers_to_release.__begin_;
    v37 = v19 - v36;
    if ((unint64_t)(v37 + 1) >> 61)
      std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
    v38 = (char *)v18 - (char *)v36;
    v39 = v38 >> 2;
    if (v38 >> 2 <= (unint64_t)(v37 + 1))
      v39 = v37 + 1;
    if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
      v40 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v40 = v39;
    if (v40)
      v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v40);
    else
      v41 = 0;
    v50 = (__CVBuffer **)(v40 + 8 * v37);
    v51 = (__CVBuffer **)(v40 + 8 * v41);
    *v50 = (__CVBuffer *)v17;
    v20 = v50 + 1;
    v53 = self->pixelbuffers_to_release.__begin_;
    v52 = self->pixelbuffers_to_release.__end_;
    if (v52 != v53)
    {
      do
      {
        v54 = *--v52;
        *--v50 = v54;
      }
      while (v52 != v53);
      v52 = self->pixelbuffers_to_release.__begin_;
    }
    self->pixelbuffers_to_release.__begin_ = v50;
    self->pixelbuffers_to_release.__end_ = v20;
    self->pixelbuffers_to_release.__end_cap_.__value_ = v51;
    if (v52)
      operator delete(v52);
  }
  else
  {
    *v19 = v15;
    v20 = v19 + 1;
  }
  self->pixelbuffers_to_release.__end_ = v20;
  Espresso::get_internal_network((uint64_t)var0, v5, (uint64_t)&buf);
  if ((_QWORD)buf)
  {
    Espresso::get_internal_network((uint64_t)var0, v5, (uint64_t)&v65);
    v55 = (***(uint64_t (****)(_QWORD))(*(_QWORD *)(v65 + 16) + 8))(*(_QWORD *)(*(_QWORD *)(v65 + 16) + 8)) == 10006;
    v56 = v66;
    if (v66)
    {
      p_shared_owners = (unint64_t *)&v66->__shared_owners_;
      do
        v58 = __ldaxr(p_shared_owners);
      while (__stlxr(v58 - 1, p_shared_owners));
      if (!v58)
      {
        ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
        std::__shared_weak_count::__release_weak(v56);
      }
    }
  }
  else
  {
    v55 = 0;
  }
  v59 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v60 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v61 = __ldaxr(v60);
    while (__stlxr(v61 - 1, v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
  v62 = objc_retainAutorelease(v9);
  if (v55)
    v32 = (Espresso *)espresso_network_bind_direct_cvpixelbuffer(var0, v5, objc_msgSend(v62, "UTF8String"), v17);
  else
    v32 = (Espresso *)espresso_network_bind_cvpixelbuffer(var0, v5, objc_msgSend(v62, "UTF8String"), 0, v17);
  v35 = (int)v32;
  v34 = 1;
  if (v12)
LABEL_23:
    free(v12);
LABEL_24:
  if ((v34 & 1) == 0)
  {
    v35 = -1;
    goto LABEL_45;
  }
LABEL_41:
  if (v35)
  {
    Espresso::espresso_os_log_subsystem(v32, v33);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v63 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v63;
      _os_log_error_impl(&dword_190DAF000, v48, OS_LOG_TYPE_ERROR, "Cannot bind input image: %s", (uint8_t *)&buf, 0xCu);
    }

  }
LABEL_45:

  return v35;
}

- (int)bindInput:(id)a3 fromTensorAttachment:(id)a4 toNetwork:(id)a5
{
  uint64_t v5;
  void *var0;
  id v9;
  id v10;
  void *v11;
  void **value;
  void **end;
  void **v14;
  void **begin;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void **v21;
  void **v22;
  void **v23;
  void **v24;
  void *v25;
  id v26;
  Espresso *v27;
  const char *v28;
  int v29;
  Espresso *size;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v36;
  uint8_t v37[16];
  uint8_t buf[16];
  void *__dst[2];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[48];
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  void *__src[2];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v53[3];
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _BYTE v57[24];
  uint64_t v58;

  v5 = *(_QWORD *)&a5.var1;
  var0 = a5.var0;
  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v56 = 0;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  memset(v53, 0, sizeof(v53));
  v50 = 0u;
  v51 = 0u;
  *(_OWORD *)__src = 0u;
  v49 = 0u;
  if (v10)
    objc_msgSend(v10, "copyAsEspressoBuffer");
  end = self->pointers_to_free.__end_;
  value = self->pointers_to_free.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->pointers_to_free.__begin_;
    v16 = end - begin;
    if ((unint64_t)(v16 + 1) >> 61)
      std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
    v17 = (char *)value - (char *)begin;
    v18 = v17 >> 2;
    if (v17 >> 2 <= (unint64_t)(v16 + 1))
      v18 = v16 + 1;
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
      v19 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v19 = v18;
    if (v19)
      v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v19);
    else
      v20 = 0;
    v21 = (void **)(v19 + 8 * v16);
    v22 = (void **)(v19 + 8 * v20);
    *v21 = __src[0];
    v14 = v21 + 1;
    v24 = self->pointers_to_free.__begin_;
    v23 = self->pointers_to_free.__end_;
    if (v23 != v24)
    {
      do
      {
        v25 = *--v23;
        *--v21 = v25;
      }
      while (v23 != v24);
      v23 = self->pointers_to_free.__begin_;
    }
    self->pointers_to_free.__begin_ = v21;
    self->pointers_to_free.__end_ = v14;
    self->pointers_to_free.__end_cap_.__value_ = v22;
    if (v23)
      operator delete(v23);
  }
  else
  {
    *end = __src[0];
    v14 = end + 1;
  }
  self->pointers_to_free.__end_ = v14;
  v26 = objc_retainAutorelease(v9);
  if (espresso_network_bind_buffer(var0, v5, objc_msgSend(v26, "UTF8String"), (uint64_t)__dst, 0x10000, 0x10000, 0x10000) == -6)
  {
    v27 = (Espresso *)espresso_network_bind_buffer(var0, v5, objc_msgSend(objc_retainAutorelease(v26), "UTF8String"), (uint64_t)__src, 0x10000, 0x20000, 0x10000);
    v29 = (int)v27;
    v45 = v54;
    v46 = v55;
    v47 = v56;
    v43 = v52;
    *(_OWORD *)v44 = v53[0];
    *(_OWORD *)&v44[16] = v53[1];
    *(_OWORD *)&v44[32] = v53[2];
    *(_OWORD *)__dst = *(_OWORD *)__src;
    v40 = v49;
    v41 = v50;
    v42 = v51;
    goto LABEL_21;
  }
  *(_QWORD *)v57 = 0;
  size = (Espresso *)espresso_buffer_get_size((uint64_t)__src, v57);
  if ((_DWORD)size)
  {
    Espresso::espresso_os_log_subsystem(size, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_190DAF000, v32, OS_LOG_TYPE_ERROR, "Cannot get buffer size", buf, 2u);
    }

LABEL_38:
    v29 = -1;
    goto LABEL_40;
  }
  *(_QWORD *)buf = 0;
  v27 = (Espresso *)espresso_buffer_get_size((uint64_t)__dst, (char *)buf);
  if ((_DWORD)v27)
  {
    Espresso::espresso_os_log_subsystem(v27, v28);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      _os_log_error_impl(&dword_190DAF000, v34, OS_LOG_TYPE_ERROR, "Cannot get copy size", v37, 2u);
    }

    goto LABEL_38;
  }
  if (*(_QWORD *)v57 == *(_QWORD *)buf)
  {
    v27 = (Espresso *)memcpy(__dst[0], __src[0], *(size_t *)v57);
    v29 = 0;
  }
  else
  {
    v29 = -7;
  }
LABEL_21:
  if (v29 != -7)
  {
    if (v29)
    {
      Espresso::espresso_os_log_subsystem(v27, v28);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
        *(_DWORD *)v57 = 136315138;
        *(_QWORD *)&v57[4] = v36;
        _os_log_error_impl(&dword_190DAF000, v33, OS_LOG_TYPE_ERROR, "Cannot bind input: %s", v57, 0xCu);
      }

    }
    else if (*(_QWORD *)v44 == *(_QWORD *)&v53[0]
           && *(_OWORD *)&v44[8] == *(_OWORD *)((char *)v53 + 8)
           && *(_OWORD *)&v44[24] == *(_OWORD *)((char *)&v53[1] + 8))
    {
      v29 = 0;
    }
    else
    {
      v29 = -7;
    }
  }
LABEL_40:

  return v29;
}

- (int)bindInputsFromFrame:(id)a3 toNetwork:(id)a4
{
  unint64_t v4;
  Espresso *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t isKindOfClass;
  const char *v18;
  Espresso *v19;
  const char *v20;
  NSObject *v21;
  int v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  void **v29;
  char *v30;
  unint64_t v31;
  float v32;
  _BOOL8 v33;
  unint64_t v34;
  unint64_t v35;
  size_t v36;
  _QWORD *v37;
  _QWORD *v38;
  unint64_t v39;
  Espresso *v40;
  const char *v41;
  Espresso *v42;
  const char *v43;
  std::vector<int>::size_type v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  _QWORD *j;
  std::vector<int>::pointer end;
  int *v53;
  std::vector<int>::pointer begin;
  int64_t v55;
  unint64_t v56;
  int64_t v57;
  BOOL v58;
  unint64_t v59;
  uint64_t v60;
  int *v61;
  int v62;
  std::vector<int>::pointer v63;
  int *v64;
  std::vector<int>::pointer v65;
  int64_t v66;
  unint64_t v67;
  int64_t v68;
  unint64_t v69;
  uint64_t v70;
  int *v71;
  int v72;
  std::vector<int>::pointer v73;
  int *v74;
  std::vector<int>::pointer v75;
  int64_t v76;
  unint64_t v77;
  int64_t v78;
  unint64_t v79;
  uint64_t v80;
  int *v81;
  int v82;
  std::vector<int>::pointer v83;
  int *v84;
  std::vector<int>::pointer v85;
  int64_t v86;
  unint64_t v87;
  int64_t v88;
  unint64_t v89;
  uint64_t v90;
  int *v91;
  int v92;
  std::vector<int>::pointer v93;
  int *v94;
  std::vector<int>::pointer v95;
  int64_t v96;
  unint64_t v97;
  int64_t v98;
  unint64_t v99;
  uint64_t v100;
  int *v101;
  int v102;
  std::vector<int>::pointer v103;
  int *v104;
  std::vector<int>::pointer v105;
  int64_t v106;
  unint64_t v107;
  int64_t v108;
  unint64_t v109;
  uint64_t v110;
  int *v111;
  int v112;
  _QWORD *v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  _QWORD *v120;
  char *v121;
  char *v122;
  uint64_t v123;
  void *v124;
  char *v125;
  char *v126;
  void *v127;
  id v128;
  NSObject *v129;
  void *v130;
  NSObject *v132;
  Espresso *v133;
  const char *v134;
  uint64_t *v135;
  NSObject *v136;
  _QWORD *v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  const char *v144;
  char v145;
  int32x4_t v146;
  int32x4_t v147;
  NSObject *obj;
  EspressoDataFrameExecutor *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD *var0;
  Espresso *v154;
  void *v155;
  _QWORD *v156;
  unint64_t v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  void *v162[2];
  __int128 v163;
  float v164;
  std::vector<int> v165;
  std::vector<int> v166;
  std::vector<int> v167;
  std::vector<int> v168;
  std::vector<int> __p;
  std::vector<int> v170;
  uint8_t buf[32];
  __int128 v172;
  __int128 v173;
  __int128 v174;
  int32x4_t v175;
  int32x4_t v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  uint64_t v180;
  _BYTE v181[128];
  uint64_t v182;

  v152 = *(_QWORD *)&a4.var1;
  var0 = a4.var0;
  v182 = *MEMORY[0x1E0C80C00];
  v6 = (Espresso *)a3;
  v154 = v6;
  *(_OWORD *)v162 = 0u;
  v163 = 0u;
  v164 = 1.0;
  v145 = 1;
  v8 = 1;
  v149 = self;
  while (1)
  {
    Espresso::espresso_os_log_subsystem(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 2;
      _os_log_debug_impl(&dword_190DAF000, v9, OS_LOG_TYPE_DEBUG, "bindInputsFromFrame try %zu/%zu\n", buf, 0x16u);
    }

    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    -[Espresso inputAttachmentNames](v154, "inputAttachmentNames");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v158, v181, 16);
    if (!v11)
      goto LABEL_63;
    v151 = *(_QWORD *)v159;
    obj = v10;
    while (2)
    {
      v150 = v11;
      for (i = 0; i != v150; ++i)
      {
        if (*(_QWORD *)v159 != v151)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
        -[Espresso getInputAttachment:](v154, "getInputAttachment:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
          {
            v19 = (Espresso *)-[EspressoDataFrameExecutor useCVPixelBuffers](self, "useCVPixelBuffers");
            if (!(_DWORD)v19)
            {
              v21 = v14;
              v22 = -[EspressoDataFrameExecutor bindInput:fromTensorAttachment:toNetwork:](self, "bindInput:fromTensorAttachment:toNetwork:", v13, v21, var0, v152);
              v16 = v22;
              if (!v22)
              {
LABEL_60:

                goto LABEL_61;
              }
              if (v22 == -7)
              {
                v180 = 0;
                v178 = 0u;
                v179 = 0u;
                v176 = 0u;
                v177 = 0u;
                v174 = 0u;
                v175 = 0u;
                v172 = 0u;
                v173 = 0u;
                memset(buf, 0, sizeof(buf));
                if (v21)
                {
                  -[NSObject copyAsEspressoBuffer](v21, "copyAsEspressoBuffer");
                  v146 = v176;
                  v147 = v175;
                  v23 = v177;
                }
                else
                {
                  v23 = 0;
                  v146 = 0uLL;
                  v147 = 0uLL;
                }
                std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
                v24 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
                v25 = v24;
                v26 = (unint64_t)v162[1];
                if (v162[1])
                {
                  v27 = (uint8x8_t)vcnt_s8((int8x8_t)v162[1]);
                  v27.i16[0] = vaddlv_u8(v27);
                  v28 = v27.u32[0];
                  if (v27.u32[0] > 1uLL)
                  {
                    v4 = v24;
                    if ((void *)v24 >= v162[1])
                      v4 = v24 % (unint64_t)v162[1];
                  }
                  else
                  {
                    v4 = ((unint64_t)v162[1] - 1) & v24;
                  }
                  v29 = (void **)*((_QWORD *)v162[0] + v4);
                  if (v29)
                  {
                    v30 = (char *)*v29;
                    if (*v29)
                    {
                      while (1)
                      {
                        v31 = *((_QWORD *)v30 + 1);
                        if (v31 == v25)
                        {
                          if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v30 + 16, (unsigned __int8 *)&__p))
                          {
                            self = v149;
                            goto LABEL_58;
                          }
                        }
                        else
                        {
                          if (v28 > 1)
                          {
                            if (v31 >= v26)
                              v31 %= v26;
                          }
                          else
                          {
                            v31 &= v26 - 1;
                          }
                          if (v31 != v4)
                          {
LABEL_35:
                            self = v149;
                            break;
                          }
                        }
                        v30 = *(char **)v30;
                        if (!v30)
                          goto LABEL_35;
                      }
                    }
                  }
                }
                v30 = (char *)operator new(0x68uLL);
                v170.__begin_ = (std::vector<int>::pointer)v30;
                v170.__end_ = (std::vector<int>::pointer)&v163;
                *(_QWORD *)v30 = 0;
                *((_QWORD *)v30 + 1) = v25;
                *(std::vector<int> *)(v30 + 16) = __p;
                memset(&__p, 0, sizeof(__p));
                *((_OWORD *)v30 + 4) = 0u;
                *((_OWORD *)v30 + 5) = 0u;
                *((_QWORD *)v30 + 12) = 0;
                *(_OWORD *)(v30 + 40) = xmmword_191A8AA80;
                *((_QWORD *)v30 + 7) = 0xFFFFFFFF00000001;
                LOBYTE(v170.__end_cap_.__value_) = 1;
                v32 = (float)(unint64_t)(*((_QWORD *)&v163 + 1) + 1);
                if (!v26 || (float)(v164 * (float)v26) < v32)
                {
                  v33 = (v26 & (v26 - 1)) != 0;
                  if (v26 < 3)
                    v33 = 1;
                  v34 = v33 | (2 * v26);
                  v35 = vcvtps_u32_f32(v32 / v164);
                  if (v34 <= v35)
                    v36 = v35;
                  else
                    v36 = v34;
                  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__rehash<true>((uint64_t)v162, v36);
                  v26 = (unint64_t)v162[1];
                  if (((unint64_t)v162[1] & ((unint64_t)v162[1] - 1)) != 0)
                  {
                    if ((void *)v25 >= v162[1])
                      v4 = v25 % (unint64_t)v162[1];
                    else
                      v4 = v25;
                  }
                  else
                  {
                    v4 = ((unint64_t)v162[1] - 1) & v25;
                  }
                }
                v37 = v162[0];
                v38 = (_QWORD *)*((_QWORD *)v162[0] + v4);
                if (v38)
                {
                  *(_QWORD *)v30 = *v38;
                }
                else
                {
                  *(_QWORD *)v30 = v163;
                  *(_QWORD *)&v163 = v30;
                  v37[v4] = &v163;
                  if (!*(_QWORD *)v30)
                    goto LABEL_57;
                  v39 = *(_QWORD *)(*(_QWORD *)v30 + 8);
                  if ((v26 & (v26 - 1)) != 0)
                  {
                    if (v39 >= v26)
                      v39 %= v26;
                  }
                  else
                  {
                    v39 &= v26 - 1;
                  }
                  v38 = (char *)v162[0] + 8 * v39;
                }
                *v38 = v30;
LABEL_57:
                v170.__begin_ = 0;
                ++*((_QWORD *)&v163 + 1);
                std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_shape>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_shape>,void *>>>>::reset[abi:ne180100]((uint64_t)&v170);
LABEL_58:
                *(int32x4_t *)(v30 + 40) = vuzp1q_s32(v147, v146);
                *((_DWORD *)v30 + 14) = v23;
                *((_DWORD *)v30 + 15) = -1;
                *((_QWORD *)v30 + 8) = 0;
                *((_QWORD *)v30 + 9) = 0;
                std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v30 + 80, 0, 0, 0);
                if (SHIBYTE(__p.__end_cap_.__value_) < 0)
                  operator delete(__p.__begin_);
                goto LABEL_60;
              }
              v14 = v21;
LABEL_210:

              v15 = v14;
LABEL_211:

              v129 = obj;
              goto LABEL_212;
            }
            Espresso::espresso_os_log_subsystem(v19, v20);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_190DAF000, v21, OS_LOG_TYPE_ERROR, "Direct binding of tensor attachments is not implemented", buf, 2u);
            }
          }
          else
          {
            Espresso::espresso_os_log_subsystem((Espresso *)isKindOfClass, v18);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v127 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v127;
              v128 = v127;
              _os_log_error_impl(&dword_190DAF000, v21, OS_LOG_TYPE_ERROR, "Wrong type of attachment %@", buf, 0xCu);

            }
          }
          v16 = -1;
          goto LABEL_210;
        }
        v15 = v14;
        v16 = -[EspressoDataFrameExecutor bindInput:fromImageAttachment:toNetwork:](self, "bindInput:fromImageAttachment:toNetwork:", v13, v15, var0, v152);

        if (v16)
          goto LABEL_211;
LABEL_61:

      }
      v10 = obj;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v158, v181, 16);
      if (v11)
        continue;
      break;
    }
LABEL_63:

    if (!*((_QWORD *)&v163 + 1))
    {
      v16 = 0;
      goto LABEL_213;
    }
    if ((v145 & 1) == 0)
    {
      Espresso::espresso_os_log_subsystem(v40, v41);
      v132 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190DAF000, v132, OS_LOG_TYPE_ERROR, "Cannot find inputs: ", buf, 2u);
      }

      v135 = (uint64_t *)v163;
      if ((_QWORD)v163)
      {
        v16 = -7;
        do
        {
          Espresso::espresso_os_log_subsystem(v133, v134);
          v136 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            v137 = v135 + 2;
            if (*((char *)v135 + 39) < 0)
              v137 = (_QWORD *)*v137;
            v138 = *((_DWORD *)v135 + 10);
            v139 = *((_DWORD *)v135 + 11);
            v140 = *((_DWORD *)v135 + 12);
            v141 = *((_DWORD *)v135 + 13);
            v142 = *((_DWORD *)v135 + 14);
            v143 = *((_DWORD *)v135 + 15);
            *(_DWORD *)buf = 136316674;
            *(_QWORD *)&buf[4] = v137;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v138;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v139;
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = v140;
            *(_WORD *)&buf[30] = 1024;
            LODWORD(v172) = v141;
            WORD2(v172) = 1024;
            *(_DWORD *)((char *)&v172 + 6) = v142;
            WORD5(v172) = 1024;
            HIDWORD(v172) = v143;
            _os_log_error_impl(&dword_190DAF000, v136, OS_LOG_TYPE_ERROR, "%s (%d, %d, %d, %d, %d)[%d] ", buf, 0x30u);
          }

          v135 = (uint64_t *)*v135;
        }
        while (v135);
      }
      else
      {
        v16 = -7;
      }
      goto LABEL_213;
    }
    v42 = (Espresso *)espresso_plan_build_clean(var0);
    if ((_DWORD)v42)
      break;
    std::unordered_map<std::string,Espresso::layer_shape>::unordered_map((uint64_t)&v155, (uint64_t)v162);
    v4 = v157;
    memset(buf, 0, 24);
    memset(&v170, 0, sizeof(v170));
    memset(&__p, 0, sizeof(__p));
    memset(&v168, 0, sizeof(v168));
    memset(&v167, 0, sizeof(v167));
    memset(&v166, 0, sizeof(v166));
    memset(&v165, 0, sizeof(v165));
    v44 = (int)v157;
    if (v157 << 32)
    {
      if (((v157 << 32) & 0x8000000000000000) != 0)
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((int)v157);
      v48 = *(char **)buf;
      v47 = *(char **)&buf[8];
      v49 = v45;
      if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
      {
        do
        {
          v50 = *((_QWORD *)v47 - 1);
          v47 -= 8;
          *((_QWORD *)v49 - 1) = v50;
          v49 -= 8;
        }
        while (v47 != v48);
        v47 = *(char **)buf;
      }
      *(_QWORD *)buf = v49;
      *(_QWORD *)&buf[8] = v45;
      *(_QWORD *)&buf[16] = &v45[8 * v46];
      if (v47)
        operator delete(v47);
    }
    std::vector<int>::reserve(&v170, v44);
    std::vector<int>::reserve(&__p, v44);
    std::vector<int>::reserve(&v168, v44);
    std::vector<int>::reserve(&v167, v44);
    std::vector<int>::reserve(&v166, v44);
    std::vector<int>::reserve(&v165, v44);
    for (j = v156; j; self = v149)
    {
      end = v170.__end_;
      if (v170.__end_ >= v170.__end_cap_.__value_)
      {
        begin = v170.__begin_;
        v55 = v170.__end_ - v170.__begin_;
        v56 = v55 + 1;
        if ((unint64_t)(v55 + 1) >> 62)
          goto LABEL_241;
        v57 = (char *)v170.__end_cap_.__value_ - (char *)v170.__begin_;
        if (((char *)v170.__end_cap_.__value_ - (char *)v170.__begin_) >> 1 > v56)
          v56 = v57 >> 1;
        v58 = (unint64_t)v57 >= 0x7FFFFFFFFFFFFFFCLL;
        v59 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58)
          v59 = v56;
        if (v59)
        {
          v59 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v59);
          begin = v170.__begin_;
          end = v170.__end_;
        }
        else
        {
          v60 = 0;
        }
        v61 = (int *)(v59 + 4 * v55);
        *v61 = *((_DWORD *)j + 10);
        v53 = v61 + 1;
        while (end != begin)
        {
          v62 = *--end;
          *--v61 = v62;
        }
        v170.__begin_ = v61;
        v170.__end_ = v53;
        v170.__end_cap_.__value_ = (int *)(v59 + 4 * v60);
        if (begin)
          operator delete(begin);
      }
      else
      {
        *v170.__end_ = *((_DWORD *)j + 10);
        v53 = end + 1;
      }
      v170.__end_ = v53;
      v63 = __p.__end_;
      if (__p.__end_ >= __p.__end_cap_.__value_)
      {
        v65 = __p.__begin_;
        v66 = __p.__end_ - __p.__begin_;
        v67 = v66 + 1;
        if ((unint64_t)(v66 + 1) >> 62)
          goto LABEL_241;
        v68 = (char *)__p.__end_cap_.__value_ - (char *)__p.__begin_;
        if (((char *)__p.__end_cap_.__value_ - (char *)__p.__begin_) >> 1 > v67)
          v67 = v68 >> 1;
        v58 = (unint64_t)v68 >= 0x7FFFFFFFFFFFFFFCLL;
        v69 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58)
          v69 = v67;
        if (v69)
        {
          v69 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v69);
          v65 = __p.__begin_;
          v63 = __p.__end_;
        }
        else
        {
          v70 = 0;
        }
        v71 = (int *)(v69 + 4 * v66);
        *v71 = *((_DWORD *)j + 11);
        v64 = v71 + 1;
        while (v63 != v65)
        {
          v72 = *--v63;
          *--v71 = v72;
        }
        __p.__begin_ = v71;
        __p.__end_ = v64;
        __p.__end_cap_.__value_ = (int *)(v69 + 4 * v70);
        if (v65)
          operator delete(v65);
      }
      else
      {
        *__p.__end_ = *((_DWORD *)j + 11);
        v64 = v63 + 1;
      }
      __p.__end_ = v64;
      v73 = v168.__end_;
      if (v168.__end_ >= v168.__end_cap_.__value_)
      {
        v75 = v168.__begin_;
        v76 = v168.__end_ - v168.__begin_;
        v77 = v76 + 1;
        if ((unint64_t)(v76 + 1) >> 62)
          goto LABEL_241;
        v78 = (char *)v168.__end_cap_.__value_ - (char *)v168.__begin_;
        if (((char *)v168.__end_cap_.__value_ - (char *)v168.__begin_) >> 1 > v77)
          v77 = v78 >> 1;
        v58 = (unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL;
        v79 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58)
          v79 = v77;
        if (v79)
        {
          v79 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v79);
          v75 = v168.__begin_;
          v73 = v168.__end_;
        }
        else
        {
          v80 = 0;
        }
        v81 = (int *)(v79 + 4 * v76);
        *v81 = *((_DWORD *)j + 12);
        v74 = v81 + 1;
        while (v73 != v75)
        {
          v82 = *--v73;
          *--v81 = v82;
        }
        v168.__begin_ = v81;
        v168.__end_ = v74;
        v168.__end_cap_.__value_ = (int *)(v79 + 4 * v80);
        if (v75)
          operator delete(v75);
      }
      else
      {
        *v168.__end_ = *((_DWORD *)j + 12);
        v74 = v73 + 1;
      }
      v168.__end_ = v74;
      v83 = v167.__end_;
      if (v167.__end_ >= v167.__end_cap_.__value_)
      {
        v85 = v167.__begin_;
        v86 = v167.__end_ - v167.__begin_;
        v87 = v86 + 1;
        if ((unint64_t)(v86 + 1) >> 62)
          goto LABEL_241;
        v88 = (char *)v167.__end_cap_.__value_ - (char *)v167.__begin_;
        if (((char *)v167.__end_cap_.__value_ - (char *)v167.__begin_) >> 1 > v87)
          v87 = v88 >> 1;
        v58 = (unint64_t)v88 >= 0x7FFFFFFFFFFFFFFCLL;
        v89 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58)
          v89 = v87;
        if (v89)
        {
          v89 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v89);
          v85 = v167.__begin_;
          v83 = v167.__end_;
        }
        else
        {
          v90 = 0;
        }
        v91 = (int *)(v89 + 4 * v86);
        *v91 = *((_DWORD *)j + 13);
        v84 = v91 + 1;
        while (v83 != v85)
        {
          v92 = *--v83;
          *--v91 = v92;
        }
        v167.__begin_ = v91;
        v167.__end_ = v84;
        v167.__end_cap_.__value_ = (int *)(v89 + 4 * v90);
        if (v85)
          operator delete(v85);
      }
      else
      {
        *v167.__end_ = *((_DWORD *)j + 13);
        v84 = v83 + 1;
      }
      v167.__end_ = v84;
      v93 = v166.__end_;
      if (v166.__end_ >= v166.__end_cap_.__value_)
      {
        v95 = v166.__begin_;
        v96 = v166.__end_ - v166.__begin_;
        v97 = v96 + 1;
        if ((unint64_t)(v96 + 1) >> 62)
          goto LABEL_241;
        v98 = (char *)v166.__end_cap_.__value_ - (char *)v166.__begin_;
        if (((char *)v166.__end_cap_.__value_ - (char *)v166.__begin_) >> 1 > v97)
          v97 = v98 >> 1;
        v58 = (unint64_t)v98 >= 0x7FFFFFFFFFFFFFFCLL;
        v99 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58)
          v99 = v97;
        if (v99)
        {
          v99 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v99);
          v95 = v166.__begin_;
          v93 = v166.__end_;
        }
        else
        {
          v100 = 0;
        }
        v101 = (int *)(v99 + 4 * v96);
        *v101 = *((_DWORD *)j + 14);
        v94 = v101 + 1;
        while (v93 != v95)
        {
          v102 = *--v93;
          *--v101 = v102;
        }
        v166.__begin_ = v101;
        v166.__end_ = v94;
        v166.__end_cap_.__value_ = (int *)(v99 + 4 * v100);
        if (v95)
          operator delete(v95);
      }
      else
      {
        *v166.__end_ = *((_DWORD *)j + 14);
        v94 = v93 + 1;
      }
      v166.__end_ = v94;
      v103 = v165.__end_;
      if (v165.__end_ >= v165.__end_cap_.__value_)
      {
        v105 = v165.__begin_;
        v106 = v165.__end_ - v165.__begin_;
        v107 = v106 + 1;
        if ((unint64_t)(v106 + 1) >> 62)
LABEL_241:
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        v108 = (char *)v165.__end_cap_.__value_ - (char *)v165.__begin_;
        if (((char *)v165.__end_cap_.__value_ - (char *)v165.__begin_) >> 1 > v107)
          v107 = v108 >> 1;
        v58 = (unint64_t)v108 >= 0x7FFFFFFFFFFFFFFCLL;
        v109 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58)
          v109 = v107;
        if (v109)
        {
          v109 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v109);
          v105 = v165.__begin_;
          v103 = v165.__end_;
        }
        else
        {
          v110 = 0;
        }
        v111 = (int *)(v109 + 4 * v106);
        *v111 = *((_DWORD *)j + 15);
        v104 = v111 + 1;
        while (v103 != v105)
        {
          v112 = *--v103;
          *--v111 = v112;
        }
        v165.__begin_ = v111;
        v165.__end_ = v104;
        v165.__end_cap_.__value_ = (int *)(v109 + 4 * v110);
        if (v105)
          operator delete(v105);
      }
      else
      {
        *v165.__end_ = *((_DWORD *)j + 15);
        v104 = v103 + 1;
      }
      v113 = j + 2;
      v165.__end_ = v104;
      if (*((char *)j + 39) < 0)
        v113 = (_QWORD *)*v113;
      v114 = *(_QWORD *)&buf[8];
      if (*(_QWORD *)&buf[8] >= *(_QWORD *)&buf[16])
      {
        v116 = (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3;
        if ((unint64_t)(v116 + 1) >> 61)
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        v117 = (uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 2;
        if (v117 <= v116 + 1)
          v117 = v116 + 1;
        if (*(_QWORD *)&buf[16] - *(_QWORD *)buf >= 0x7FFFFFFFFFFFFFF8uLL)
          v118 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v118 = v117;
        if (v118)
          v118 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v118);
        else
          v119 = 0;
        v120 = (_QWORD *)(v118 + 8 * v116);
        *v120 = v113;
        v115 = v120 + 1;
        v122 = *(char **)buf;
        v121 = *(char **)&buf[8];
        if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
        {
          do
          {
            v123 = *((_QWORD *)v121 - 1);
            v121 -= 8;
            *--v120 = v123;
          }
          while (v121 != v122);
          v121 = *(char **)buf;
        }
        *(_QWORD *)buf = v120;
        *(_QWORD *)&buf[8] = v115;
        *(_QWORD *)&buf[16] = v118 + 8 * v119;
        if (v121)
          operator delete(v121);
      }
      else
      {
        **(_QWORD **)&buf[8] = v113;
        v115 = (_QWORD *)(v114 + 8);
      }
      *(_QWORD *)&buf[8] = v115;
      j = (_QWORD *)*j;
    }
    espresso_network_change_input_blob_shapes_seq_rank(var0, v152, v4, *(uint64_t *)buf, (uint64_t)v170.__begin_, (uint64_t)__p.__begin_, (uint64_t)v168.__begin_, (uint64_t)v167.__begin_, (uint64_t)v166.__begin_, (uint64_t)v165.__begin_);
    if (v165.__begin_)
    {
      v165.__end_ = v165.__begin_;
      operator delete(v165.__begin_);
    }
    if (v166.__begin_)
    {
      v166.__end_ = v166.__begin_;
      operator delete(v166.__begin_);
    }
    if (v167.__begin_)
    {
      v167.__end_ = v167.__begin_;
      operator delete(v167.__begin_);
    }
    if (v168.__begin_)
    {
      v168.__end_ = v168.__begin_;
      operator delete(v168.__begin_);
    }
    if (__p.__begin_)
    {
      __p.__end_ = __p.__begin_;
      operator delete(__p.__begin_);
    }
    if (v170.__begin_)
    {
      v170.__end_ = v170.__begin_;
      operator delete(v170.__begin_);
    }
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
    std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node(v156);
    v124 = v155;
    v155 = 0;
    if (v124)
      operator delete(v124);
    v6 = (Espresso *)espresso_plan_build(var0);
    if ((_DWORD)v6)
    {
      Espresso::espresso_os_log_subsystem(v6, v7);
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v144 = "Input reshape plan build failed";
LABEL_234:
        _os_log_error_impl(&dword_190DAF000, v129, OS_LOG_TYPE_ERROR, v144, buf, 2u);
      }
      goto LABEL_231;
    }
    v145 = 0;
    v8 = 2;
    if (*((_QWORD *)&v163 + 1))
    {
      std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((_QWORD *)v163);
      *(_QWORD *)&v163 = 0;
      v125 = (char *)v162[1];
      if (v162[1])
      {
        v126 = 0;
        do
          *((_QWORD *)v162[0] + (_QWORD)v126++) = 0;
        while (v125 != v126);
      }
      v145 = 0;
      *((_QWORD *)&v163 + 1) = 0;
      v8 = 2;
    }
  }
  Espresso::espresso_os_log_subsystem(v42, v43);
  v129 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v144 = "Input reshape plan clean failed";
    goto LABEL_234;
  }
LABEL_231:
  v16 = -1;
LABEL_212:

LABEL_213:
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((_QWORD *)v163);
  v130 = v162[0];
  v162[0] = 0;
  if (v130)
    operator delete(v130);

  return v16;
}

- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4 referenceNetwork:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t isKindOfClass;
  const char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void **value;
  void **end;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void **v25;
  void **v26;
  void **begin;
  void *v28;
  id v29;
  id v30;
  int v31;
  Espresso *v32;
  const char *v33;
  NSObject *v34;
  void *v36;
  id v37;
  uint64_t v38;
  vector<void *, std::allocator<void *>> *p_pointers_to_free;
  void *v42;
  void *v43;
  id v44;
  _OWORD v45[10];
  uint64_t v46;
  _OWORD v47[10];
  uint64_t v48;
  _OWORD v49[10];
  uint64_t v50;
  _OWORD v51[10];
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[4];
  uint64_t v69;
  uint8_t buf[16];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v42 = (void *)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v44, "outputAttachmentNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v65;
    p_pointers_to_free = &self->pointers_to_free;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v65 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v44, "getOutputAttachment:", v10, p_pointers_to_free);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "disabled") & 1) == 0)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) == 0)
          {
            Espresso::espresso_os_log_subsystem((Espresso *)isKindOfClass, v13);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v36 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v36;
              v37 = v36;
              _os_log_error_impl(&dword_190DAF000, v14, OS_LOG_TYPE_ERROR, "Wrong type of attachment %@", buf, 0xCu);

            }
            v31 = -1;
            goto LABEL_40;
          }
          v14 = objc_opt_new();
          -[NSObject setName:](v14, "setName:", v10);
          objc_msgSend(v44, "getGroundTruthAttachment:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "copyAsEspressoBuffer");
            v51[8] = v61;
            v51[9] = v62;
            v52 = v63;
            v51[4] = v57;
            v51[5] = v58;
            v51[6] = v59;
            v51[7] = v60;
            v51[0] = v53;
            v51[1] = v54;
            v51[2] = v55;
            v51[3] = v56;
            -[NSObject setGroundtruth_buffer:](v14, "setGroundtruth_buffer:", v51);
            if (v14)
            {
              -[NSObject groundtruth_buffer](v14, "groundtruth_buffer");
            }
            else
            {
              v80 = 0;
              v79 = 0u;
              v78 = 0u;
              v77 = 0u;
              v76 = 0u;
              v75 = 0u;
              v74 = 0u;
              v73 = 0u;
              v71 = 0u;
              v72 = 0u;
              *(_OWORD *)buf = 0u;
            }
            end = self->pointers_to_free.__end_;
            value = self->pointers_to_free.__end_cap_.__value_;
            if (end >= value)
            {
              v20 = end - p_pointers_to_free->__begin_;
              if ((unint64_t)(v20 + 1) >> 61)
                std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
              v21 = (char *)value - (char *)p_pointers_to_free->__begin_;
              v22 = v21 >> 2;
              if (v21 >> 2 <= (unint64_t)(v20 + 1))
                v22 = v20 + 1;
              if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8)
                v23 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v23 = v22;
              if (v23)
                v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v23);
              else
                v24 = 0;
              v25 = (void **)(v23 + 8 * v20);
              *v25 = *(void **)buf;
              v19 = v25 + 1;
              begin = self->pointers_to_free.__begin_;
              v26 = self->pointers_to_free.__end_;
              if (v26 != begin)
              {
                do
                {
                  v28 = *--v26;
                  *--v25 = v28;
                }
                while (v26 != begin);
                v26 = p_pointers_to_free->__begin_;
              }
              self->pointers_to_free.__begin_ = v25;
              self->pointers_to_free.__end_ = v19;
              self->pointers_to_free.__end_cap_.__value_ = (void **)(v23 + 8 * v24);
              if (v26)
                operator delete(v26);
            }
            else
            {
              *end = *(void **)buf;
              v19 = end + 1;
            }
            self->pointers_to_free.__end_ = v19;
          }

          v29 = objc_retainAutorelease(v10);
          espresso_network_bind_buffer(a4.var0, *(uint64_t *)&a4.var1, objc_msgSend(v29, "UTF8String"), (uint64_t)buf, 0x20000, 0x10000, 0x10000);
          v49[8] = v78;
          v49[9] = v79;
          v50 = v80;
          v49[4] = v74;
          v49[5] = v75;
          v49[6] = v76;
          v49[7] = v77;
          v49[0] = *(_OWORD *)buf;
          v49[1] = v71;
          v49[2] = v72;
          v49[3] = v73;
          -[NSObject setComputed_buffer:](v14, "setComputed_buffer:", v49);
          v30 = objc_retainAutorelease(v29);
          v31 = espresso_network_bind_buffer(a5.var0, *(uint64_t *)&a5.var1, objc_msgSend(v30, "UTF8String"), (uint64_t)v47, 0x20000, 0x10000, 0x10000);
          v45[8] = v47[8];
          v45[9] = v47[9];
          v46 = v48;
          v45[4] = v47[4];
          v45[5] = v47[5];
          v45[6] = v47[6];
          v45[7] = v47[7];
          v45[0] = v47[0];
          v45[1] = v47[1];
          v45[2] = v47[2];
          v45[3] = v47[3];
          -[NSObject setReference_buffer:](v14, "setReference_buffer:", v45);
          v32 = (Espresso *)objc_msgSend(v42, "addObject:", v14);
          if (v31)
          {
            Espresso::espresso_os_log_subsystem(v32, v33);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v38 = objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
              *(_DWORD *)v68 = 136315138;
              v69 = v38;
              _os_log_error_impl(&dword_190DAF000, v34, OS_LOG_TYPE_ERROR, "Cannot bind output: %s", v68, 0xCu);
            }

LABEL_40:
            goto LABEL_41;
          }

        }
        v6 = v43;
      }
      v7 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[EspressoDataFrameExecutor setOutputMatchingBuffers:](self, "setOutputMatchingBuffers:", v42);
  v31 = 0;
LABEL_41:

  return v31;
}

- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4
{
  return -[EspressoDataFrameExecutor bindOutputsFromFrame:toNetwork:executionStatus:](self, "bindOutputsFromFrame:toNetwork:executionStatus:", a3, a4.var0, *(_QWORD *)&a4.var1, 0);
}

- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4 executionStatus:(int)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int is_dynamic;
  int v13;
  uint64_t isKindOfClass;
  const char *v15;
  void *v16;
  void **value;
  void **end;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void **v25;
  void **v26;
  void **begin;
  void *v28;
  void *v29;
  void *v30;
  void **v31;
  void **v32;
  void **v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void **v39;
  void **v40;
  void **v41;
  void *v42;
  id v43;
  Espresso *blob_dimensions;
  const char *v45;
  __CVBuffer **v46;
  __CVBuffer **v47;
  __CVBuffer **v48;
  __CVBuffer **v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  __CVBuffer **v55;
  __CVBuffer **v56;
  __CVBuffer **v57;
  __CVBuffer *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  Espresso *v62;
  const char *v63;
  Espresso *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  const char *v73;
  void *v75;
  id v76;
  uint64_t v77;
  const __CFAllocator *allocator;
  uint64_t v79;
  vector<void *, std::allocator<void *>> *p_pointers_to_free;
  id obj;
  uint64_t v83;
  uint64_t v84;
  id v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _OWORD v92[10];
  uint64_t v93;
  uint8_t v94[16];
  CVPixelBufferRef pixelBufferOut[2];
  _OWORD v96[10];
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  _OWORD v109[10];
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  uint64_t v127;
  uint64_t v128;
  uint8_t buf[16];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v87 = v6;
  v7 = (void *)objc_opt_new();
  v125 = 0u;
  v124 = 0u;
  v123 = 0u;
  v122 = 0u;
  objc_msgSend(v6, "outputAttachmentNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v140, 16);
  if (v8)
  {
    v84 = *(_QWORD *)v123;
    p_pointers_to_free = &self->pointers_to_free;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v79 = *MEMORY[0x1E0CA8FF0];
LABEL_3:
    v83 = v8;
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v123 != v84)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v9);
      objc_msgSend(v6, "getOutputAttachment:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "disabled") & 1) != 0)
        goto LABEL_86;
      if (a5)
      {
        *(_DWORD *)buf = 0;
        is_dynamic = espresso_blob_is_dynamic((uint64_t)a4.var0, a4.var1, (char *)objc_msgSend(objc_retainAutorelease(v10), "cStringUsingEncoding:", 1), buf);
        if (is_dynamic)
        {
          NSLog(CFSTR("Unable to perform dynamic/static check, bind as static blob in default"));
        }
        else
        {
          if (a5 == 2 && *(_DWORD *)buf)
          {
            v13 = 0x40000;
            goto LABEL_12;
          }
          if (a5 != 1 || *(_DWORD *)buf)
            goto LABEL_86;
        }
      }
      else
      {
        is_dynamic = 0;
      }
      v13 = 0x10000;
LABEL_12:
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        Espresso::espresso_os_log_subsystem((Espresso *)isKindOfClass, v15);
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v75 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v75;
          v76 = v75;
          _os_log_error_impl(&dword_190DAF000, v70, OS_LOG_TYPE_ERROR, "Wrong type of attachment %@", buf, 0xCu);

        }
        if (!is_dynamic)
          is_dynamic = -1;
        goto LABEL_112;
      }
      v86 = v11;
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setName:", v10);
      if (v86)
      {
        objc_msgSend(v86, "copyAsEspressoBuffer");
      }
      else
      {
        v121 = 0;
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
      }
      v109[8] = v119;
      v109[9] = v120;
      v110 = v121;
      v109[4] = v115;
      v109[5] = v116;
      v109[6] = v117;
      v109[7] = v118;
      v109[0] = v111;
      v109[1] = v112;
      v109[2] = v113;
      v109[3] = v114;
      objc_msgSend(v16, "setReference_buffer:", v109);
      if (v16)
      {
        objc_msgSend(v16, "reference_buffer");
      }
      else
      {
        v139 = 0;
        v138 = 0u;
        v137 = 0u;
        v136 = 0u;
        v135 = 0u;
        v134 = 0u;
        v133 = 0u;
        v132 = 0u;
        v131 = 0u;
        v130 = 0u;
        *(_OWORD *)buf = 0u;
      }
      end = self->pointers_to_free.__end_;
      value = self->pointers_to_free.__end_cap_.__value_;
      if (end >= value)
      {
        v20 = end - p_pointers_to_free->__begin_;
        if ((unint64_t)(v20 + 1) >> 61)
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        v21 = (char *)value - (char *)p_pointers_to_free->__begin_;
        v22 = v21 >> 2;
        if (v21 >> 2 <= (unint64_t)(v20 + 1))
          v22 = v20 + 1;
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8)
          v23 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v23 = v22;
        if (v23)
          v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v23);
        else
          v24 = 0;
        v25 = (void **)(v23 + 8 * v20);
        *v25 = *(void **)buf;
        v19 = v25 + 1;
        begin = self->pointers_to_free.__begin_;
        v26 = self->pointers_to_free.__end_;
        if (v26 != begin)
        {
          do
          {
            v28 = *--v26;
            *--v25 = v28;
          }
          while (v26 != begin);
          v26 = p_pointers_to_free->__begin_;
        }
        self->pointers_to_free.__begin_ = v25;
        self->pointers_to_free.__end_ = v19;
        self->pointers_to_free.__end_cap_.__value_ = (void **)(v23 + 8 * v24);
        if (v26)
          operator delete(v26);
      }
      else
      {
        *end = *(void **)buf;
        v19 = end + 1;
      }
      self->pointers_to_free.__end_ = v19;
      objc_msgSend(v87, "getGroundTruthAttachment:", v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "copyAsEspressoBuffer");
        v96[8] = v106;
        v96[9] = v107;
        v97 = v108;
        v96[4] = v102;
        v96[5] = v103;
        v96[6] = v104;
        v96[7] = v105;
        v96[0] = v98;
        v96[1] = v99;
        v96[2] = v100;
        v96[3] = v101;
        objc_msgSend(v16, "setGroundtruth_buffer:", v96);
        if (v16)
        {
          objc_msgSend(v16, "groundtruth_buffer");
        }
        else
        {
          v139 = 0;
          v138 = 0u;
          v137 = 0u;
          v136 = 0u;
          v135 = 0u;
          v134 = 0u;
          v133 = 0u;
          v132 = 0u;
          v131 = 0u;
          v130 = 0u;
          *(_OWORD *)buf = 0u;
        }
        v32 = self->pointers_to_free.__end_;
        v31 = self->pointers_to_free.__end_cap_.__value_;
        if (v32 >= v31)
        {
          v34 = v32 - p_pointers_to_free->__begin_;
          if ((unint64_t)(v34 + 1) >> 61)
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          v35 = (char *)v31 - (char *)p_pointers_to_free->__begin_;
          v36 = v35 >> 2;
          if (v35 >> 2 <= (unint64_t)(v34 + 1))
            v36 = v34 + 1;
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
            v37 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v37 = v36;
          if (v37)
            v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v37);
          else
            v38 = 0;
          v39 = (void **)(v37 + 8 * v34);
          *v39 = *(void **)buf;
          v33 = v39 + 1;
          v41 = self->pointers_to_free.__begin_;
          v40 = self->pointers_to_free.__end_;
          if (v40 != v41)
          {
            do
            {
              v42 = *--v40;
              *--v39 = v42;
            }
            while (v40 != v41);
            v40 = p_pointers_to_free->__begin_;
          }
          self->pointers_to_free.__begin_ = v39;
          self->pointers_to_free.__end_ = v33;
          self->pointers_to_free.__end_cap_.__value_ = (void **)(v37 + 8 * v38);
          if (v40)
            operator delete(v40);
        }
        else
        {
          *v32 = *(void **)buf;
          v33 = v32 + 1;
        }
        self->pointers_to_free.__end_ = v33;
      }

      if (-[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:](self, "useCVPixelBuffersForOutputs:", 1))
      {
        v43 = objc_retainAutorelease(v10);
        blob_dimensions = (Espresso *)espresso_network_query_blob_dimensions(a4.var0, *(uint64_t *)&a4.var1, objc_msgSend(v43, "UTF8String"), (uint64_t)buf);
        if ((_DWORD)blob_dimensions)
        {
          Espresso::espresso_os_log_subsystem(blob_dimensions, v45);
          v72 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            goto LABEL_109;
          LOWORD(pixelBufferOut[0]) = 0;
          v73 = "Could not get blob dimensions";
          goto LABEL_115;
        }
        if (v130 != __PAIR128__(1, 1))
        {
          Espresso::espresso_os_log_subsystem(blob_dimensions, v45);
          v72 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            goto LABEL_109;
          LOWORD(pixelBufferOut[0]) = 0;
          v73 = "Depth and Batch number must be 1";
LABEL_115:
          _os_log_error_impl(&dword_190DAF000, v72, OS_LOG_TYPE_ERROR, v73, (uint8_t *)pixelBufferOut, 2u);
          goto LABEL_109;
        }
        pixelBufferOut[0] = 0;
        v127 = v79;
        v128 = MEMORY[0x1E0C9AA70];
        CVPixelBufferCreate(allocator, *(size_t *)buf, *(size_t *)&buf[8], 0x4C303068u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1), pixelBufferOut);
        v47 = self->pixelbuffers_to_release.__end_;
        v46 = self->pixelbuffers_to_release.__end_cap_.__value_;
        if (v47 >= v46)
        {
          v49 = self->pixelbuffers_to_release.__begin_;
          v50 = v47 - v49;
          if ((unint64_t)(v50 + 1) >> 61)
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          v51 = (char *)v46 - (char *)v49;
          v52 = v51 >> 2;
          if (v51 >> 2 <= (unint64_t)(v50 + 1))
            v52 = v50 + 1;
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8)
            v53 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v53 = v52;
          if (v53)
            v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v53);
          else
            v54 = 0;
          v55 = (__CVBuffer **)(v53 + 8 * v50);
          *v55 = pixelBufferOut[0];
          v48 = v55 + 1;
          v57 = self->pixelbuffers_to_release.__begin_;
          v56 = self->pixelbuffers_to_release.__end_;
          if (v56 != v57)
          {
            do
            {
              v58 = *--v56;
              *--v55 = v58;
            }
            while (v56 != v57);
            v56 = self->pixelbuffers_to_release.__begin_;
          }
          self->pixelbuffers_to_release.__begin_ = v55;
          self->pixelbuffers_to_release.__end_ = v48;
          self->pixelbuffers_to_release.__end_cap_.__value_ = (__CVBuffer **)(v53 + 8 * v54);
          if (v56)
            operator delete(v56);
        }
        else
        {
          *v47 = pixelBufferOut[0];
          v48 = v47 + 1;
        }
        self->pixelbuffers_to_release.__end_ = v48;
        v59 = objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
        v60 = espresso_network_bind_direct_cvpixelbuffer(a4.var0, *(uint64_t *)&a4.var1, v59, (uint64_t)pixelBufferOut[0]);
        v61 = v60;
        NSLog(CFSTR("ret: %d"), v60);
        if (v61)
        {
          Espresso::espresso_os_log_subsystem(v62, v63);
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v94 = 0;
            _os_log_error_impl(&dword_190DAF000, v72, OS_LOG_TYPE_ERROR, "Bind direct cvpixelbuffer failed", v94, 2u);
          }
LABEL_109:

          if (!is_dynamic)
            is_dynamic = -1;
LABEL_111:

          v11 = v86;
LABEL_112:

          goto LABEL_113;
        }
        objc_msgSend(v16, "setComputed_pb:", pixelBufferOut[0]);
      }
      else
      {
        is_dynamic = espresso_network_bind_buffer(a4.var0, *(uint64_t *)&a4.var1, objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (uint64_t)buf, 0x20000, v13, 0x10000);
        v92[8] = v137;
        v92[9] = v138;
        v93 = v139;
        v92[4] = v133;
        v92[5] = v134;
        v92[6] = v135;
        v92[7] = v136;
        v92[0] = *(_OWORD *)buf;
        v92[1] = v130;
        v92[2] = v131;
        v92[3] = v132;
        objc_msgSend(v16, "setComputed_buffer:", v92);
      }
      v64 = (Espresso *)objc_msgSend(v7, "addObject:", v16);
      if (is_dynamic)
      {
        Espresso::espresso_os_log_subsystem(v64, v65);
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v77 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v77;
          _os_log_error_impl(&dword_190DAF000, v71, OS_LOG_TYPE_ERROR, "Cannot bind output: %s", buf, 0xCu);
        }

        goto LABEL_111;
      }

LABEL_86:
      ++v9;
      v6 = v87;
      if (v9 == v83)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v140, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[EspressoDataFrameExecutor outputMatchingBuffers](self, "outputMatchingBuffers");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v88, v126, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v89 != v68)
          objc_enumerationMutation(v66);
        objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i));
      }
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v88, v126, 16);
    }
    while (v67);
  }

  -[EspressoDataFrameExecutor setOutputMatchingBuffers:](self, "setOutputMatchingBuffers:", v7);
  is_dynamic = 0;
LABEL_113:

  return is_dynamic;
}

- (void)freeTemporaryResources
{
  void *v3;
  void **begin;
  void **end;
  void *v6;
  __CVBuffer **v7;
  __CVBuffer **v8;
  __CVBuffer *v9;

  v3 = (void *)MEMORY[0x19401D4A4](self, a2);
  -[EspressoDataFrameExecutor setOutputMatchingBuffers:](self, "setOutputMatchingBuffers:", 0);
  objc_autoreleasePoolPop(v3);
  begin = self->pointers_to_free.__begin_;
  end = self->pointers_to_free.__end_;
  if (begin != end)
  {
    do
    {
      v6 = *begin++;
      free(v6);
    }
    while (begin != end);
    begin = self->pointers_to_free.__begin_;
  }
  self->pointers_to_free.__end_ = begin;
  v7 = self->pixelbuffers_to_release.__begin_;
  v8 = self->pixelbuffers_to_release.__end_;
  if (v7 != v8)
  {
    do
    {
      v9 = *v7++;
      CVPixelBufferRelease(v9);
    }
    while (v7 != v8);
    v7 = self->pixelbuffers_to_release.__begin_;
  }
  self->pixelbuffers_to_release.__end_ = v7;
}

- (void)dealloc
{
  objc_super v3;

  -[EspressoDataFrameExecutor freeTemporaryResources](self, "freeTemporaryResources");
  v3.receiver = self;
  v3.super_class = (Class)EspressoDataFrameExecutor;
  -[EspressoDataFrameExecutor dealloc](&v3, sel_dealloc);
}

- (NSArray)outputMatchingBuffers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOutputMatchingBuffers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int)use_cvpixelbuffer
{
  return self->_use_cvpixelbuffer;
}

- (void)setUse_cvpixelbuffer:(int)a3
{
  self->_use_cvpixelbuffer = a3;
}

- (void).cxx_destruct
{
  __CVBuffer **begin;
  void **v4;

  objc_storeStrong((id *)&self->_outputMatchingBuffers, 0);
  begin = self->pixelbuffers_to_release.__begin_;
  if (begin)
  {
    self->pixelbuffers_to_release.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->pointers_to_free.__begin_;
  if (v4)
  {
    self->pointers_to_free.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

char *__57__EspressoDataFrameExecutor_useCVPixelBuffersForOutputs___block_invoke()
{
  char *result;

  result = getenv("ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS");
  if (result)
  {
    -[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS = 1;
    -[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS_set = 1;
  }
  return result;
}

@end
