@implementation CSUImageCaptioningDecoderE1

- (CSUImageCaptioningDecoderE1)initWithConfiguration:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CSUImageCaptioningDecoderE1 *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  CSUImageCaptioningDecoderE1 *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CSUImageCaptioningDecoderE1;
  v10 = -[CSUImageCaptioningDecoderE1 init](&v31, sel_init);
  if (v10)
  {
    if (objc_msgSend_revision(v5, v6, v7, v8, v9) != 1)
    {
LABEL_17:
      objc_storeStrong((id *)&v10->_configuration, a3);
      v25 = v10;
      goto LABEL_18;
    }
    objc_msgSend_supportedComputeDevices(v5, v11, v12, v13, v14);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, (uint64_t)v32, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20);
          if (v21)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_setComputeDevice_(v5, v17, v21, v22, v23, (_QWORD)v27);

              goto LABEL_17;
            }
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v27, (uint64_t)v32, 16);
      }
      while (v18);
    }

    sub_23A016E78();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_23A09E5D8(v24);

  }
  v25 = 0;
LABEL_18:

  return v25;
}

- (BOOL)loadBridge:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  EspressoNet *v20;
  EspressoNet *value;
  EspressoNet *v22;
  void **v23;
  void *v24;
  void **v25;
  void **v26;
  void *v27;
  void **v28;
  void *v30;
  void **v31;
  uint64_t v32;
  int v33;
  char v34;
  char v35;
  char v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  char v41;
  void *v42[2];
  void *v43[2];
  int v44;
  void *__p;
  char v46;
  const char *v47;
  EspressoNet *v48;

  objc_msgSend_bridgeNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !self->_bridgeNet.__ptr_.__value_)
  {
    objc_msgSend_bridgeNetworkPath(self->_configuration, v7, v8, v9, v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = objc_msgSend_espressoExecutionEngine(self->_configuration, v16, v17, v18, v19);
    v34 = 1;
    v35 = 0;
    v36 = 0;
    v37 = 0xFFFFFFFFLL;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    *(_OWORD *)v42 = 0u;
    *(_OWORD *)v43 = 0u;
    v44 = 1065353216;
    v46 = 0;
    LOBYTE(__p) = 0;
    sub_239FEE07C(&v47, (uint64_t)&v30, &v48);
    v20 = v48;
    v48 = 0;
    value = self->_bridgeNet.__ptr_.__value_;
    self->_bridgeNet.__ptr_.__value_ = v20;
    if (value)
    {
      (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
      v22 = v48;
      v48 = 0;
      if (v22)
        (*(void (**)(EspressoNet *))(*(_QWORD *)v22 + 8))(v22);
    }
    if (v46 < 0)
      operator delete(__p);
    v23 = (void **)v43[0];
    if (v43[0])
    {
      do
      {
        v28 = (void **)*v23;
        if (*((char *)v23 + 39) < 0)
          operator delete(v23[2]);
        operator delete(v23);
        v23 = v28;
      }
      while (v28);
    }
    v24 = v42[0];
    v42[0] = 0;
    if (v24)
      operator delete(v24);
    v25 = (void **)v30;
    if (v30)
    {
      v26 = v31;
      v27 = v30;
      if (v31 != v30)
      {
        do
        {
          if (*((char *)v26 - 1) < 0)
            operator delete(*(v26 - 3));
          v26 -= 3;
        }
        while (v26 != v25);
        v27 = v30;
      }
      v31 = v25;
      operator delete(v27);
    }

  }
  return 1;
}

- (BOOL)loadPostProcUtilsWithBeamWidth:(int)a3 error:(id *)a4
{
  uint64_t v5;
  CSUCaptioningProcUtils *v7;
  const char *v8;
  CSUCaptioningProcUtils *v9;
  CSUCaptioningProcUtils *procUtils;

  v5 = *(_QWORD *)&a3;
  v7 = [CSUCaptioningProcUtils alloc];
  v9 = (CSUCaptioningProcUtils *)objc_msgSend_initWithDecoderConfiguration_beamWidth_beamScorerType_error_(v7, v8, (uint64_t)self->_configuration, v5, 0, a4);
  procUtils = self->_procUtils;
  self->_procUtils = v9;

  return self->_procUtils != 0;
}

- (BOOL)loadDecoder:(id *)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  EspressoNet *v20;
  EspressoNet *value;
  void *v22;
  void **v23;
  void *v24;
  void **v25;
  void **v26;
  void *v27;
  void **v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __shared_weak_count *v38;
  TensorStorage *v39;
  unint64_t *v40;
  unint64_t v41;
  __shared_weak_count *cntrl;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  void *v48[3];
  void *v49;
  void **v50;
  void *v51;
  char *v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  void *v59[2];
  void *v60[2];
  int v61;
  void *__p;
  char v63;
  const char *v64[6];

  v64[5] = *(const char **)MEMORY[0x24BDAC8D0];
  if (!self->_decoderNet.__ptr_.__value_)
  {
    if ((objc_msgSend_loadPostProcUtilsWithBeamWidth_error_(self, a2, 3, (uint64_t)a3, v3) & 1) == 0)
      return 0;
    objc_msgSend_decoderNetworkPath(self->_configuration, v7, v8, v9, v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v64[0] = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
    v49 = 0;
    v50 = 0;
    v51 = 0;
    LODWORD(v52) = objc_msgSend_espressoExecutionEngine(self->_configuration, v16, v17, v18, v19);
    BYTE4(v52) = 1;
    v53 = 0;
    v54 = 0;
    v55 = 0xFFFFFFFFLL;
    LOBYTE(v56) = 0;
    BYTE4(v56) = 0;
    v57 = 0;
    v58 = 0;
    *(_OWORD *)v59 = 0u;
    *(_OWORD *)v60 = 0u;
    v61 = 1065353216;
    v63 = 0;
    LOBYTE(__p) = 0;
    sub_239FEE07C(v64, (uint64_t)&v49, v48);
    v20 = (EspressoNet *)v48[0];
    v48[0] = 0;
    value = self->_decoderNet.__ptr_.__value_;
    self->_decoderNet.__ptr_.__value_ = v20;
    if (value)
    {
      (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
      v22 = v48[0];
      v48[0] = 0;
      if (v22)
        (*(void (**)(void *))(*(_QWORD *)v22 + 8))(v22);
    }
    if (v63 < 0)
      operator delete(__p);
    v23 = (void **)v60[0];
    if (v60[0])
    {
      do
      {
        v28 = (void **)*v23;
        if (*((char *)v23 + 39) < 0)
          operator delete(v23[2]);
        operator delete(v23);
        v23 = v28;
      }
      while (v28);
    }
    v24 = v59[0];
    v59[0] = 0;
    if (v24)
      operator delete(v24);
    v25 = (void **)v49;
    if (v49)
    {
      v26 = v50;
      v27 = v49;
      if (v50 != v49)
      {
        do
        {
          if (*((char *)v26 - 1) < 0)
            operator delete(*(v26 - 3));
          v26 -= 3;
        }
        while (v26 != v25);
        v27 = v49;
      }
      v50 = v25;
      operator delete(v27);
    }

    objc_msgSend_inputWordIdsTensorName(self->_configuration, v29, v30, v31, v32);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_UTF8String(v33, v34, v35, v36, v37);
    espresso_network_query_blob_dimensions();

    sub_23A049408((char **)v48, (uint64_t)v64[4], (uint64_t)v64[3], (uint64_t)v64[2], (uint64_t)v64[1]);
    LODWORD(v64[0]) = 4;
    sub_239FFFC10((uint64_t)&v49, (int *)v64, (uint64_t)v48);
    self->_inputTokens.type_ = (int)v50;
    if (&self->_inputTokens != (EspressoTensor *)&v49)
      sub_239FF49DC(&self->_inputTokens.shape_.sizes_.__begin_, (char *)v51, v52, (v52 - (_BYTE *)v51) >> 3);
    v39 = (TensorStorage *)v55;
    v38 = (__shared_weak_count *)v56;
    if (v56)
    {
      v40 = (unint64_t *)(v56 + 8);
      do
        v41 = __ldxr(v40);
      while (__stxr(v41 + 1, v40));
    }
    cntrl = self->_inputTokens.storage_.__cntrl_;
    self->_inputTokens.storage_.__ptr_ = v39;
    self->_inputTokens.storage_.__cntrl_ = v38;
    if (cntrl)
    {
      v43 = (unint64_t *)((char *)cntrl + 8);
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v49 = &off_250B0DCE8;
    v45 = (std::__shared_weak_count *)v56;
    if (v56)
    {
      v46 = (unint64_t *)(v56 + 8);
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    if (v51)
    {
      v52 = (char *)v51;
      operator delete(v51);
    }
    if (v48[0])
    {
      v48[1] = v48[0];
      operator delete(v48[0]);
    }
  }
  return 1;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  int Decoder;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  EspressoNet *value;
  BOOL result;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  if (!self->_decoderNet.__ptr_.__value_)
  {
    Decoder = objc_msgSend_loadDecoder_(self, a2, (uint64_t)a3, v3, v4);
    objc_msgSend_bridgeNetworkPath(self->_configuration, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_3;
    return Decoder;
  }
  Decoder = 1;
  objc_msgSend_bridgeNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return Decoder;
LABEL_3:
  value = self->_bridgeNet.__ptr_.__value_;
  if (value)
    result = Decoder;
  else
    result = 0;
  if (!value && ((Decoder ^ 1) & 1) == 0)
    return objc_msgSend_loadBridge_(self, v9, (uint64_t)a3, v10, v11);
  return result;
}

- (BOOL)compareTensorShapesForShape1:(const void *)a3 Shape2:(unint64_t)a4[5] rank:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (!a5)
    return 1;
  if (*(_QWORD *)(*(_QWORD *)a3 + 8 * (4 - a5)) != *a4)
    return 0;
  v5 = 0;
  do
  {
    v6 = v5;
    if (a5 - 1 == v5)
      break;
    v7 = *(_QWORD *)(*(_QWORD *)a3 - 8 * a5 + 40 + 8 * v5);
    v8 = a4[++v5];
  }
  while (v7 == v8);
  return v6 + 1 >= a5;
}

- (vector<float,)nextTokensForInputs:(CSUImageCaptioningDecoderE1 *)self AndforMaskPosition:(SEL)a3
{
  unint64_t *end;
  unint64_t *begin;
  unint64_t v10;
  int v11;
  unint64_t *v12;
  uint32x4_t *v13;
  const void *v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  int32x4_t *v18;
  int32x4_t v19;
  uint64_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int8x16_t v26;
  int v27;
  uint64_t v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint32x4_t *v36;
  unint64_t v37;
  float *v38;
  unsigned int *v39;
  uint64_t v40;
  uint64_t v41;
  uint32x4_t *v42;
  float32x4_t *v43;
  uint64_t v44;
  float32x4_t v45;
  unsigned int v46;
  EspressoNet *value;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  size_t v54;
  size_t v55;
  __int128 *p_dst;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  size_t v69;
  size_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *p_shared_owners;
  unint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  size_t v90;
  size_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const void *v101;
  uint64_t v102;
  int64_t v103;
  float *v104;
  float *v105;
  vector<float, std::allocator<float>> *result;
  uint64_t v107;
  std::runtime_error *exception;
  __int128 v110;
  unint64_t v111;
  __int128 __dst;
  unint64_t v113;
  _OWORD v114[2];
  int v115;
  _QWORD v116[5];
  void *v117;
  uint32x4_t *v118;
  uint32x4_t *v119;
  __int128 v120;
  unint64_t v121;
  uint64_t (**v122)();
  void *v123;
  void *v124;
  std::__shared_weak_count *v125;
  void *v126[2];
  char v127;
  uint64_t (**v128)();
  void *__p;
  void *v130;
  std::__shared_weak_count *v131;
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  begin = self->_inputTokens.shape_.sizes_.__begin_;
  end = self->_inputTokens.shape_.sizes_.__end_;
  if (begin == end)
  {
    v13 = 0;
    v117 = 0;
    v118 = 0;
    v119 = 0;
    v14 = *(const void **)a4;
    v15 = *((_QWORD *)a4 + 1);
    v16 = v15 - *(_QWORD *)a4;
    if (v15 == *(_QWORD *)a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  v10 = (char *)end - (char *)begin - 8;
  if (v10 < 0x38)
  {
    v11 = 1;
    v12 = self->_inputTokens.shape_.sizes_.__begin_;
    do
    {
LABEL_9:
      v27 = *(_DWORD *)v12++;
      v11 *= v27;
    }
    while (v12 != end);
    goto LABEL_10;
  }
  v17 = (v10 >> 3) + 1;
  v12 = &begin[v17 & 0x3FFFFFFFFFFFFFF8];
  v18 = (int32x4_t *)(begin + 4);
  v19.i64[0] = 0x100000001;
  v19.i64[1] = 0x100000001;
  v20 = v17 & 0x3FFFFFFFFFFFFFF8;
  v21.i64[0] = 0x100000001;
  v21.i64[1] = 0x100000001;
  do
  {
    v23 = v18[-2];
    v22 = v18[-1];
    v25 = *v18;
    v24 = v18[1];
    v18 += 4;
    v19 = vmulq_s32(v19, vuzp1q_s32(v23, v22));
    v21 = vmulq_s32(v21, vuzp1q_s32(v25, v24));
    v20 -= 8;
  }
  while (v20);
  v26 = (int8x16_t)vmulq_s32(v21, v19);
  *(int32x2_t *)v26.i8 = vmul_s32(*(int32x2_t *)v26.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL));
  v11 = v26.i32[0] * v26.i32[1];
  if (v17 != (v17 & 0x3FFFFFFFFFFFFFF8))
    goto LABEL_9;
LABEL_10:
  v117 = 0;
  v118 = 0;
  v119 = 0;
  if (!v11)
  {
    v13 = 0;
    v14 = *(const void **)a4;
    v107 = *((_QWORD *)a4 + 1);
    v16 = v107 - *(_QWORD *)a4;
    if (v107 == *(_QWORD *)a4)
      goto LABEL_14;
LABEL_13:
    memmove(v13, v14, v16);
    goto LABEL_14;
  }
  v28 = v11;
  if (v11 < 0)
    sub_239FEBE68();
  v29 = 4 * v11;
  v13 = (uint32x4_t *)operator new(v29);
  v117 = v13;
  v119 = (uint32x4_t *)((char *)v13 + 4 * v28);
  bzero(v13, v29);
  v118 = v119;
  v14 = *(const void **)a4;
  v30 = *((_QWORD *)a4 + 1);
  v16 = v30 - *(_QWORD *)a4;
  if (v30 != *(_QWORD *)a4)
    goto LABEL_13;
LABEL_14:
  if (self->_inputTokens.type_ != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v31 = (*(uint64_t (**)(TensorStorage *, const void *, size_t))(*(_QWORD *)self->_inputTokens.storage_.__ptr_
                                                                         + 24))(self->_inputTokens.storage_.__ptr_, v14, v16);
  v36 = v118;
  if (v13 != v118)
  {
    v37 = (char *)v118 - (char *)v13 - 4;
    if (v37 < 0x1C)
    {
      v38 = (float *)v31;
      v39 = (unsigned int *)v13;
      do
      {
LABEL_21:
        v46 = *v39++;
        *v38++ = (float)v46;
      }
      while (v39 != (unsigned int *)v36);
      goto LABEL_22;
    }
    v40 = (v37 >> 2) + 1;
    v41 = v40 & 0x7FFFFFFFFFFFFFF8;
    v38 = (float *)(v31 + v41 * 4);
    v39 = &v13->u32[v41];
    v42 = v13 + 1;
    v43 = (float32x4_t *)(v31 + 16);
    v44 = v40 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v45 = vcvtq_f32_u32(*v42);
      v43[-1] = vcvtq_f32_u32(v42[-1]);
      *v43 = v45;
      v42 += 2;
      v43 += 2;
      v44 -= 8;
    }
    while (v44);
    if (v40 != (v40 & 0x7FFFFFFFFFFFFFF8))
      goto LABEL_21;
  }
LABEL_22:
  value = self->_decoderNet.__ptr_.__value_;
  objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v32, v33, v34, v35);
  v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v53 = (const char *)objc_msgSend_UTF8String(v48, v49, v50, v51, v52);
  v54 = strlen(v53);
  if (v54 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v55 = v54;
  if (v54 >= 0x17)
  {
    v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v54 | 7) != 0x17)
      v57 = v54 | 7;
    v58 = v57 + 1;
    p_dst = (__int128 *)operator new(v57 + 1);
    *((_QWORD *)&__dst + 1) = v55;
    v113 = v58 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_29;
  }
  HIBYTE(v113) = v54;
  p_dst = &__dst;
  if (v54)
LABEL_29:
    memmove(p_dst, v53, v55);
  *((_BYTE *)p_dst + v55) = 0;
  sub_239FFF258((uint64_t)&v120, &__dst, (uint64_t)&self->_encodedFeaturesBuffer);
  objc_msgSend_inputWordIdsTensorName(self->_configuration, v59, v60, v61, v62);
  v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v68 = (const char *)objc_msgSend_UTF8String(v63, v64, v65, v66, v67);
  v69 = strlen(v68);
  if (v69 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v70 = v69;
  if (v69 >= 0x17)
  {
    v72 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v69 | 7) != 0x17)
      v72 = v69 | 7;
    v73 = v72 + 1;
    v71 = operator new(v72 + 1);
    *((_QWORD *)&v110 + 1) = v70;
    v111 = v73 | 0x8000000000000000;
    *(_QWORD *)&v110 = v71;
  }
  else
  {
    HIBYTE(v111) = v69;
    v71 = &v110;
    if (!v69)
      goto LABEL_38;
  }
  memmove(v71, v68, v70);
LABEL_38:
  *((_BYTE *)v71 + v70) = 0;
  sub_239FFF258((uint64_t)v126, &v110, (uint64_t)&self->_inputTokens);
  memset(v114, 0, sizeof(v114));
  v115 = 1065353216;
  sub_239FF6528((uint64_t)v114, (uint64_t)&v120, &v120);
  sub_239FF6528((uint64_t)v114, (uint64_t)v126, (__int128 *)v126);
  sub_239FF1424((uint64_t)value, (uint64_t)v114, (uint64_t)v116);
  sub_239FF5234((uint64_t)v114);
  v128 = &off_250B0DCE8;
  v74 = v131;
  if (v131)
  {
    p_shared_owners = (unint64_t *)&v131->__shared_owners_;
    do
      v76 = __ldaxr(p_shared_owners);
    while (__stlxr(v76 - 1, p_shared_owners));
    if (!v76)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
  if (__p)
  {
    v130 = __p;
    operator delete(__p);
  }
  if (v127 < 0)
    operator delete(v126[0]);
  v122 = &off_250B0DCE8;
  v77 = v125;
  if (v125)
  {
    v78 = (unint64_t *)&v125->__shared_owners_;
    do
      v79 = __ldaxr(v78);
    while (__stlxr(v79 - 1, v78));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }
  if (v123)
  {
    v124 = v123;
    operator delete(v123);
  }
  if (SHIBYTE(v121) < 0)
  {
    operator delete((void *)v120);
    if ((SHIBYTE(v111) & 0x80000000) == 0)
      goto LABEL_56;
  }
  else if ((SHIBYTE(v111) & 0x80000000) == 0)
  {
    goto LABEL_56;
  }
  operator delete((void *)v110);
LABEL_56:

  if (SHIBYTE(v113) < 0)
    operator delete((void *)__dst);

  objc_msgSend_outputWordProbsTensorName(self->_configuration, v80, v81, v82, v83);
  v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v89 = (const char *)objc_msgSend_UTF8String(v84, v85, v86, v87, v88);
  v90 = strlen(v89);
  if (v90 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v91 = v90;
  if (v90 >= 0x17)
  {
    v93 = (v90 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v90 | 7) != 0x17)
      v93 = v90 | 7;
    v94 = v93 + 1;
    v92 = operator new(v93 + 1);
    *((_QWORD *)&v120 + 1) = v91;
    v121 = v94 | 0x8000000000000000;
    *(_QWORD *)&v120 = v92;
    goto LABEL_65;
  }
  HIBYTE(v121) = v90;
  v92 = &v120;
  if (v90)
LABEL_65:
    memmove(v92, v89, v91);
  *((_BYTE *)v92 + v91) = 0;
  v95 = sub_239FF2E64(v116, (uint64_t)&v120);
  if (!v95)
    sub_239FF1D10("unordered_map::at: key not found");
  v96 = v95[10];
  if (SHIBYTE(v121) < 0)
    operator delete((void *)v120);

  v97 = *(_QWORD *)(v96 + 8);
  v98 = *(_QWORD *)(v96 + 88);
  v99 = v98 * a5;
  v100 = v98 * (a5 + 1);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (v100 != v99)
  {
    v101 = (const void *)(v97 + 4 * v99);
    v102 = v97 + 4 * v100;
    v103 = v102 - (_QWORD)v101;
    if (v102 - (_QWORD)v101 < 0)
      sub_239FEBE68();
    v104 = (float *)operator new(v102 - (_QWORD)v101);
    retstr->__begin_ = v104;
    v105 = &v104[v103 >> 2];
    retstr->__end_cap_.__value_ = v105;
    memcpy(v104, v101, v103);
    retstr->__end_ = v105;
  }
  sub_239FF5234((uint64_t)v116);
  result = (vector<float, std::allocator<float>> *)v117;
  if (v117)
  {
    v118 = (uint32x4_t *)v117;
    operator delete(v117);
  }
  return result;
}

- (BOOL)populateInputBufferWithBridgeFeatures:(id)a3 WithError:(id *)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int32x4_t *v12;
  char *v13;
  int64_t v14;
  char *v15;
  int v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  int32x4_t *v20;
  int32x4_t v21;
  uint64_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int8x16_t v28;
  int v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  __shared_weak_count *v46;
  TensorStorage *v47;
  unint64_t *v48;
  unint64_t v49;
  __shared_weak_count *cntrl;
  unint64_t *v51;
  unint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  __shared_weak_count *v67;
  TensorStorage *v68;
  unint64_t *v69;
  unint64_t v70;
  __shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;
  BOOL v83;
  void *v84;
  std::__shared_weak_count *v85;
  unint64_t *v86;
  unint64_t v87;
  std::runtime_error *exception;
  void *__p;
  void *v91;
  _QWORD *v92;
  uint64_t (**v93)();
  int v94;
  void *v95;
  char *v96;
  TensorStorage *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  char *v101;
  uint64_t (**v102)();
  int v103;
  void *v104;
  char *v105;
  TensorStorage *v106;
  uint64_t v107;
  uint64_t v108;
  _BYTE v109[40];
  _QWORD v110[5];

  v110[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = sub_23A046674(v6);
  LOWORD(v93) = 1;
  sub_239FF3910((uint64_t)&v102, v7, &v93);
  v99 = 0;
  v100 = 0;
  v101 = 0;
  v12 = (int32x4_t *)v104;
  v13 = v105;
  v14 = v105 - (_BYTE *)v104;
  if (v105 == v104)
  {
    v18 = 0;
    goto LABEL_11;
  }
  if (v14 < 0)
    sub_239FEBE68();
  v99 = operator new(v105 - (_BYTE *)v104);
  v100 = v99;
  v15 = (char *)v99 + 8 * (v14 >> 3);
  v101 = v15;
  memcpy(v99, v12, v14);
  v100 = v15;
  if ((unint64_t)(v14 - 8) >= 0x38)
  {
    v19 = ((unint64_t)(v14 - 8) >> 3) + 1;
    v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    v20 = v12 + 2;
    v21.i64[0] = 0x100000001;
    v21.i64[1] = 0x100000001;
    v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    v23.i64[0] = 0x100000001;
    v23.i64[1] = 0x100000001;
    do
    {
      v25 = v20[-2];
      v24 = v20[-1];
      v27 = *v20;
      v26 = v20[1];
      v20 += 4;
      v21 = vmulq_s32(v21, vuzp1q_s32(v25, v24));
      v23 = vmulq_s32(v23, vuzp1q_s32(v27, v26));
      v22 -= 8;
    }
    while (v22);
    v28 = (int8x16_t)vmulq_s32(v23, v21);
    *(int32x2_t *)v28.i8 = vmul_s32(*(int32x2_t *)v28.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
    v16 = v28.i32[0] * v28.i32[1];
    if (v19 == (v19 & 0x3FFFFFFFFFFFFFF8))
      goto LABEL_10;
  }
  else
  {
    v16 = 1;
    v17 = (char *)v12;
  }
  do
  {
    v29 = *(_DWORD *)v17;
    v17 += 8;
    v16 *= v29;
  }
  while (v17 != v13);
LABEL_10:
  v18 = v16;
LABEL_11:
  objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v8, v9, v10, v11);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
  espresso_network_query_blob_shape();

  if (!v108)
  {
    v38 = 1;
    goto LABEL_20;
  }
  if (v108 == 1)
  {
    v37 = 0;
    v38 = 1;
LABEL_18:
    v43 = v108 - v37;
    v44 = (uint64_t *)&v109[8 * v37];
    do
    {
      v45 = *v44++;
      v38 *= v45;
      --v43;
    }
    while (v43);
    goto LABEL_20;
  }
  v37 = v108 & 0xFFFFFFFFFFFFFFFELL;
  v39 = v110;
  v40 = 1;
  v41 = v108 & 0xFFFFFFFFFFFFFFFELL;
  v42 = 1;
  do
  {
    v40 *= *(v39 - 1);
    v42 *= *v39;
    v39 += 2;
    v41 -= 2;
  }
  while (v41);
  v38 = v42 * v40;
  if (v108 != v37)
    goto LABEL_18;
LABEL_20:
  if (v18 != v38)
  {
    if (a4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v35, (uint64_t)CFSTR("the bridge features fed to computeDecodedCaptionsForFeatures has %zu elements and the decoder model is expected to have %zu elements for the node corresponding to attention features"), v36, v108, v18, v38);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v54, (uint64_t)v53, v55, v56);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_62;
  }
  if (objc_msgSend_compareTensorShapesForShape1_Shape2_rank_(self, v35, (uint64_t)&v99, (uint64_t)v109, v108))
  {
    self->_encodedFeaturesBuffer.type_ = v103;
    if (&self->_encodedFeaturesBuffer != (EspressoTensor *)&v102)
      sub_239FF49DC(&self->_encodedFeaturesBuffer.shape_.sizes_.__begin_, (char *)v104, v105, (v105 - (_BYTE *)v104) >> 3);
    v47 = v106;
    v46 = (__shared_weak_count *)v107;
    if (v107)
    {
      v48 = (unint64_t *)(v107 + 8);
      do
        v49 = __ldxr(v48);
      while (__stxr(v49 + 1, v48));
    }
    cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
    self->_encodedFeaturesBuffer.storage_.__ptr_ = v47;
    self->_encodedFeaturesBuffer.storage_.__cntrl_ = v46;
    if (cntrl)
    {
      v51 = (unint64_t *)((char *)cntrl + 8);
      do
        v52 = __ldaxr(v51);
      while (__stlxr(v52 - 1, v51));
      if (!v52)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    goto LABEL_57;
  }
  sub_23A04674C((uint64_t)&v102, (uint64_t)&v93);
  espresso_buffer_pack_tensor_shape();
  v58 = *((_QWORD *)v97 + 13);
  v57 = *((_QWORD *)v97 + 14);
  v60 = *((_QWORD *)v97 + 11);
  v59 = *((_QWORD *)v97 + 12);
  v61 = operator new(0x20uLL);
  v91 = v61 + 4;
  v92 = v61 + 4;
  *v61 = v57;
  v61[1] = v58;
  v61[2] = v59;
  v61[3] = v60;
  __p = v61;
  v66 = objc_msgSend_compareTensorShapesForShape1_Shape2_rank_(self, v62, (uint64_t)&__p, (uint64_t)v109, v108);
  if ((v66 & 1) != 0)
  {
    self->_encodedFeaturesBuffer.type_ = v94;
    if (&self->_encodedFeaturesBuffer != (EspressoTensor *)&v93)
      sub_239FF49DC(&self->_encodedFeaturesBuffer.shape_.sizes_.__begin_, (char *)v95, v96, (v96 - (_BYTE *)v95) >> 3);
    v68 = v97;
    v67 = (__shared_weak_count *)v98;
    if (v98)
    {
      v69 = (unint64_t *)(v98 + 8);
      do
        v70 = __ldxr(v69);
      while (__stxr(v70 + 1, v69));
    }
    v71 = self->_encodedFeaturesBuffer.storage_.__cntrl_;
    self->_encodedFeaturesBuffer.storage_.__ptr_ = v68;
    self->_encodedFeaturesBuffer.storage_.__cntrl_ = v67;
    if (v71)
    {
      v72 = (unint64_t *)((char *)v71 + 8);
      do
        v73 = __ldaxr(v72);
      while (__stlxr(v73 - 1, v72));
      if (!v73)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v71 + 16))(v71);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v71);
      }
    }
  }
  else if (a4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v63, (uint64_t)CFSTR("the bridge features fed to computeDecodedCaptionsForFeatures has same number of elements as desired by attention-features-based-input-node for decoder model but even after reshape, their shapes do not match"), v64, v65);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v75, (uint64_t)v74, v76, v77);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (__p)
  {
    v91 = __p;
    operator delete(__p);
  }
  v93 = &off_250B0DCE8;
  v78 = (std::__shared_weak_count *)v98;
  if (v98)
  {
    v79 = (unint64_t *)(v98 + 8);
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  if (v95)
  {
    v96 = (char *)v95;
    operator delete(v95);
  }
  if ((v66 & 1) == 0)
  {
LABEL_62:
    v83 = 0;
    v84 = v99;
    if (!v99)
      goto LABEL_64;
LABEL_63:
    v100 = v84;
    operator delete(v84);
    goto LABEL_64;
  }
LABEL_57:
  if (self->_inputTokens.type_ != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v81 = (void *)(*(uint64_t (**)(TensorStorage *))(*(_QWORD *)self->_inputTokens.storage_.__ptr_ + 24))(self->_inputTokens.storage_.__ptr_);
  if ((uint64_t)(v82 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
    bzero(v81, 4 * (((v82 & 0xFFFFFFFFFFFFFFFCLL) >> 2) - ((v82 & 0xFFFFFFFFFFFFFFFCLL) > 3)) + 4);
  v83 = 1;
  v84 = v99;
  if (v99)
    goto LABEL_63;
LABEL_64:
  v102 = &off_250B0DCE8;
  v85 = (std::__shared_weak_count *)v107;
  if (v107)
  {
    v86 = (unint64_t *)(v107 + 8);
    do
      v87 = __ldaxr(v86);
    while (__stlxr(v87 - 1, v86));
    if (!v87)
    {
      ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
      std::__shared_weak_count::__release_weak(v85);
    }
  }
  if (v104)
  {
    v105 = (char *)v104;
    operator delete(v104);
  }

  return v83;
}

- (BOOL)reshapeEncodedFeaturesBufferForBridgeNet:(id)a3 WithError:(id *)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int32x4_t *v12;
  char *v13;
  int64_t v14;
  char *v15;
  int v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  int32x4_t *v20;
  int32x4_t v21;
  uint64_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int8x16_t v28;
  int v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  __shared_weak_count *v46;
  TensorStorage *v47;
  unint64_t *v48;
  unint64_t v49;
  __shared_weak_count *cntrl;
  unint64_t *v51;
  unint64_t v52;
  char v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  __shared_weak_count *v67;
  TensorStorage *v68;
  unint64_t *v69;
  unint64_t v70;
  __shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  void *__p;
  void *v86;
  _QWORD *v87;
  uint64_t (**v88)();
  int v89;
  void *v90;
  char *v91;
  TensorStorage *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  char *v96;
  uint64_t (**v97)();
  int v98;
  void *v99;
  char *v100;
  TensorStorage *v101;
  uint64_t v102;
  uint64_t v103;
  _BYTE v104[40];
  _QWORD v105[5];

  v105[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = sub_23A046674(v6);
  LOWORD(v88) = 1;
  sub_239FF3910((uint64_t)&v97, v7, &v88);
  v94 = 0;
  v95 = 0;
  v96 = 0;
  v12 = (int32x4_t *)v99;
  v13 = v100;
  v14 = v100 - (_BYTE *)v99;
  if (v100 == v99)
  {
    v18 = 0;
    goto LABEL_11;
  }
  if (v14 < 0)
    sub_239FEBE68();
  v94 = operator new(v100 - (_BYTE *)v99);
  v95 = v94;
  v15 = (char *)v94 + 8 * (v14 >> 3);
  v96 = v15;
  memcpy(v94, v12, v14);
  v95 = v15;
  if ((unint64_t)(v14 - 8) >= 0x38)
  {
    v19 = ((unint64_t)(v14 - 8) >> 3) + 1;
    v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    v20 = v12 + 2;
    v21.i64[0] = 0x100000001;
    v21.i64[1] = 0x100000001;
    v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    v23.i64[0] = 0x100000001;
    v23.i64[1] = 0x100000001;
    do
    {
      v25 = v20[-2];
      v24 = v20[-1];
      v27 = *v20;
      v26 = v20[1];
      v20 += 4;
      v21 = vmulq_s32(v21, vuzp1q_s32(v25, v24));
      v23 = vmulq_s32(v23, vuzp1q_s32(v27, v26));
      v22 -= 8;
    }
    while (v22);
    v28 = (int8x16_t)vmulq_s32(v23, v21);
    *(int32x2_t *)v28.i8 = vmul_s32(*(int32x2_t *)v28.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
    v16 = v28.i32[0] * v28.i32[1];
    if (v19 == (v19 & 0x3FFFFFFFFFFFFFF8))
      goto LABEL_10;
  }
  else
  {
    v16 = 1;
    v17 = (char *)v12;
  }
  do
  {
    v29 = *(_DWORD *)v17;
    v17 += 8;
    v16 *= v29;
  }
  while (v17 != v13);
LABEL_10:
  v18 = v16;
LABEL_11:
  objc_msgSend_inputEncodedFeaturesTensorNameOfBridge(self->_configuration, v8, v9, v10, v11);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
  espresso_network_query_blob_shape();

  if (!v103)
  {
    v38 = 1;
    goto LABEL_20;
  }
  if (v103 == 1)
  {
    v37 = 0;
    v38 = 1;
LABEL_18:
    v43 = v103 - v37;
    v44 = (uint64_t *)&v104[8 * v37];
    do
    {
      v45 = *v44++;
      v38 *= v45;
      --v43;
    }
    while (v43);
    goto LABEL_20;
  }
  v37 = v103 & 0xFFFFFFFFFFFFFFFELL;
  v39 = v105;
  v40 = 1;
  v41 = v103 & 0xFFFFFFFFFFFFFFFELL;
  v42 = 1;
  do
  {
    v40 *= *(v39 - 1);
    v42 *= *v39;
    v39 += 2;
    v41 -= 2;
  }
  while (v41);
  v38 = v42 * v40;
  if (v103 != v37)
    goto LABEL_18;
LABEL_20:
  if (v18 == v38)
  {
    if (objc_msgSend_compareTensorShapesForShape1_Shape2_rank_(self, v35, (uint64_t)&v94, (uint64_t)v104, v103))
    {
      self->_bridgeInputBuffer.type_ = v98;
      if (&self->_bridgeInputBuffer != (EspressoTensor *)&v97)
        sub_239FF49DC(&self->_bridgeInputBuffer.shape_.sizes_.__begin_, (char *)v99, v100, (v100 - (_BYTE *)v99) >> 3);
      v47 = v101;
      v46 = (__shared_weak_count *)v102;
      if (v102)
      {
        v48 = (unint64_t *)(v102 + 8);
        do
          v49 = __ldxr(v48);
        while (__stxr(v49 + 1, v48));
      }
      cntrl = self->_bridgeInputBuffer.storage_.__cntrl_;
      self->_bridgeInputBuffer.storage_.__ptr_ = v47;
      self->_bridgeInputBuffer.storage_.__cntrl_ = v46;
      if (cntrl)
      {
        v51 = (unint64_t *)((char *)cntrl + 8);
        do
          v52 = __ldaxr(v51);
        while (__stlxr(v52 - 1, v51));
        if (!v52)
        {
          (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
        }
      }
      v53 = 1;
    }
    else
    {
      sub_23A04674C((uint64_t)&v97, (uint64_t)&v88);
      espresso_buffer_pack_tensor_shape();
      v59 = *((_QWORD *)v92 + 13);
      v58 = *((_QWORD *)v92 + 14);
      v61 = *((_QWORD *)v92 + 11);
      v60 = *((_QWORD *)v92 + 12);
      v62 = operator new(0x20uLL);
      v86 = v62 + 4;
      v87 = v62 + 4;
      *v62 = v58;
      v62[1] = v59;
      v62[2] = v60;
      v62[3] = v61;
      __p = v62;
      v53 = objc_msgSend_compareTensorShapesForShape1_Shape2_rank_(self, v63, (uint64_t)&__p, (uint64_t)v104, v103);
      if ((v53 & 1) != 0)
      {
        self->_bridgeInputBuffer.type_ = v89;
        if (&self->_bridgeInputBuffer != (EspressoTensor *)&v88)
          sub_239FF49DC(&self->_bridgeInputBuffer.shape_.sizes_.__begin_, (char *)v90, v91, (v91 - (_BYTE *)v90) >> 3);
        v68 = v92;
        v67 = (__shared_weak_count *)v93;
        if (v93)
        {
          v69 = (unint64_t *)(v93 + 8);
          do
            v70 = __ldxr(v69);
          while (__stxr(v70 + 1, v69));
        }
        v71 = self->_bridgeInputBuffer.storage_.__cntrl_;
        self->_bridgeInputBuffer.storage_.__ptr_ = v68;
        self->_bridgeInputBuffer.storage_.__cntrl_ = v67;
        if (v71)
        {
          v72 = (unint64_t *)((char *)v71 + 8);
          do
            v73 = __ldaxr(v72);
          while (__stlxr(v73 - 1, v72));
          if (!v73)
          {
            (*(void (**)(__shared_weak_count *))(*(_QWORD *)v71 + 16))(v71);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v71);
          }
        }
      }
      else if (a4)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v64, (uint64_t)CFSTR("the encoder features fed to computeDecodedCaptionsForFeatures has same number of elements as desired by bridge layer input but even after reshape, their shapes do not match"), v65, v66);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v75, (uint64_t)v74, v76, v77);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (__p)
      {
        v86 = __p;
        operator delete(__p);
      }
      v88 = &off_250B0DCE8;
      v78 = (std::__shared_weak_count *)v93;
      if (v93)
      {
        v79 = (unint64_t *)(v93 + 8);
        do
          v80 = __ldaxr(v79);
        while (__stlxr(v80 - 1, v79));
        if (!v80)
        {
          ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
          std::__shared_weak_count::__release_weak(v78);
        }
      }
      if (v90)
      {
        v91 = (char *)v90;
        operator delete(v90);
      }
    }
  }
  else
  {
    if (a4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v35, (uint64_t)CFSTR("the encoder features fed to computeDecodedCaptionsForFeatures has %zu elements and the bridge model is expected to have %zu elements for the node corresponding to attention features"), v36, v103, v18, v38);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v55, (uint64_t)v54, v56, v57);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v53 = 0;
  }
  if (v94)
  {
    v95 = v94;
    operator delete(v94);
  }
  v97 = &off_250B0DCE8;
  v81 = (std::__shared_weak_count *)v102;
  if (v102)
  {
    v82 = (unint64_t *)(v102 + 8);
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
  }
  if (v99)
  {
    v100 = (char *)v99;
    operator delete(v99);
  }

  return v53;
}

- (id)getBridgeLayerOutput:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  EspressoNet *value;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  size_t v35;
  size_t v36;
  __int128 *p_dst;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const char *v55;
  __int128 __dst;
  __int128 v57;
  int v58;
  _QWORD v59[5];
  void *v60[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend_loadBridge_(self, v7, (uint64_t)a4, v8, v9) & 1) == 0
    || !objc_msgSend_reshapeEncodedFeaturesBufferForBridgeNet_WithError_(self, v10, (uint64_t)v6, (uint64_t)a4, v11))
  {
    v38 = 0;
    goto LABEL_25;
  }
  value = self->_bridgeNet.__ptr_.__value_;
  objc_msgSend_inputEncodedFeaturesTensorNameOfBridge(self->_configuration, v12, v13, v14, v15);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v55 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
  sub_23A044BA4((uint64_t)v60, &v55, (uint64_t)&self->_bridgeInputBuffer);
  __dst = 0u;
  v57 = 0u;
  v58 = 1065353216;
  sub_239FF6528((uint64_t)&__dst, (uint64_t)v60, (__int128 *)v60);
  sub_239FF1424((uint64_t)value, (uint64_t)&__dst, (uint64_t)v59);
  sub_239FF5234((uint64_t)&__dst);
  *((_QWORD *)&v61 + 1) = &off_250B0DCE8;
  v22 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
  if (*((_QWORD *)&v64 + 1))
  {
    v23 = (unint64_t *)(*((_QWORD *)&v64 + 1) + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (*((_QWORD *)&v62 + 1))
  {
    *(_QWORD *)&v63 = *((_QWORD *)&v62 + 1);
    operator delete(*((void **)&v62 + 1));
  }
  if (SBYTE7(v61) < 0)
    operator delete(v60[0]);

  objc_msgSend_outputTensorNameOfBridge(self->_configuration, v25, v26, v27, v28);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v34 = (const char *)objc_msgSend_UTF8String(v29, v30, v31, v32, v33);
  v35 = strlen(v34);
  if (v35 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v36 = v35;
  if (v35 >= 0x17)
  {
    v39 = (v35 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v35 | 7) != 0x17)
      v39 = v35 | 7;
    v40 = v39 + 1;
    p_dst = (__int128 *)operator new(v39 + 1);
    *((_QWORD *)&__dst + 1) = v36;
    *(_QWORD *)&v57 = v40 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    BYTE7(v57) = v35;
    p_dst = &__dst;
    if (!v35)
      goto LABEL_21;
  }
  memmove(p_dst, v34, v36);
LABEL_21:
  *((_BYTE *)p_dst + v36) = 0;
  v41 = sub_239FF2E64(v59, (uint64_t)&__dst);
  if (!v41)
    sub_239FF1D10("unordered_map::at: key not found");
  v45 = v41[10];
  v46 = *(_OWORD *)(v45 + 40);
  v47 = *(_OWORD *)(v45 + 24);
  *(_OWORD *)v60 = *(_OWORD *)(v45 + 8);
  v61 = v47;
  v62 = v46;
  v48 = *(_OWORD *)(v45 + 88);
  v49 = *(_OWORD *)(v45 + 104);
  v50 = *(_OWORD *)(v45 + 72);
  v63 = *(_OWORD *)(v45 + 56);
  v64 = v50;
  v51 = *(_OWORD *)(v45 + 120);
  v52 = *(_OWORD *)(v45 + 136);
  v53 = *(_OWORD *)(v45 + 152);
  v70 = *(_QWORD *)(v45 + 168);
  v68 = v52;
  v69 = v53;
  v66 = v49;
  v67 = v51;
  v65 = v48;
  objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v42, (uint64_t)v60, v43, v44);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBYTE7(v57) < 0)
    operator delete((void *)__dst);

  sub_239FF5234((uint64_t)v59);
LABEL_25:

  return v38;
}

- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  char v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v10 = a3;
  if ((objc_msgSend_loadResources_(self, v11, (uint64_t)a6, v12, v13) & 1) == 0)
    goto LABEL_6;
  if (!self->_bridgeNet.__ptr_.__value_ || a5)
  {
    if (!objc_msgSend_populateInputBufferWithBridgeFeatures_WithError_(self, v14, (uint64_t)v10, (uint64_t)a6, v15))
    {
LABEL_6:
      v24 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend_getBridgeLayerOutput_error_(self, v14, (uint64_t)v10, (uint64_t)a6, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_6;
    v19 = objc_msgSend_populateInputBufferWithBridgeFeatures_WithError_(self, v16, (uint64_t)v18, (uint64_t)a6, v17);

    if ((v19 & 1) == 0)
      goto LABEL_6;
  }
  if (a4)
    objc_msgSend_getCaptionsAfterBeamSearchDecodingOnEncodedFeatures(self, v20, v21, v22, v23);
  else
    objc_msgSend_getCaptionsAfterGreedyDecodingOnEncodedFeatures(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v24;
}

- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CSUCaptioningProcUtils *procUtils;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  void *v16;
  _DWORD *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  char *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  float v38;
  _BYTE *v39;
  _BYTE *v40;
  int64_t v41;
  std::__shared_weak_count *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  int v50;
  std::__shared_weak_count *v51;
  NSObject *v52;
  unint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  void *v70;
  unint64_t *v71;
  unint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _DWORD **v77;
  _DWORD **v78;
  _DWORD *v79;
  _DWORD *v80;
  uint64_t v81;
  size_t v82;
  unint64_t v83;
  __int128 *v84;
  unint64_t v85;
  size_t v86;
  __int128 *v87;
  uint64_t v88;
  _BYTE *v89;
  unint64_t v90;
  uint64_t v91;
  _BYTE *v92;
  _BYTE *v93;
  int v94;
  __int128 *v95;
  size_t v96;
  unint64_t v97;
  size_t v98;
  unint64_t v99;
  void **v100;
  unint64_t v101;
  size_t v102;
  void **v103;
  size_t v104;
  char *v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  char *v109;
  std::__shared_weak_count *v110;
  unint64_t *v111;
  unint64_t v112;
  void *v113;
  int v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  CSUCaptionResult *v124;
  double v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  id v138;
  char *v139;
  _QWORD *v140;
  void *v141;
  char *v142;
  void *v143;
  void *v144;
  _DWORD *v146;
  _DWORD **v147;
  id v148;
  _DWORD **v149;
  CSUImageCaptioningDecoderE1 *v150;
  void *v151;
  int v152;
  _DWORD *v153;
  uint64_t v154;
  std::__shared_weak_count *v155;
  void *v156;
  char *v157;
  uint8_t v158;
  char v159[15];
  void *v160[2];
  int64_t v161;
  std::__shared_weak_count *v162;
  unsigned __int8 v163;
  uint64_t v164;
  std::__shared_weak_count *v165;
  void *__p;
  std::__shared_weak_count *v167;
  std::__shared_weak_count *v168;
  __int128 v169;
  int64_t v170;
  uint64_t v171;
  std::__shared_weak_count *v172;
  __int128 v173;
  _DWORD *v174;

  v146 = operator new(4uLL);
  *v146 = 0;
  procUtils = self->_procUtils;
  if (procUtils)
  {
    objc_msgSend_beamSearch(procUtils, v3, v4, v5, v6);
    v8 = v154;
    v10 = v154 + 192;
    v9 = *(char **)(v154 + 192);
    if (!v9)
      goto LABEL_18;
LABEL_5:
    v11 = *(char **)(v8 + 200);
    v12 = v9;
    if (v11 == v9)
    {
LABEL_17:
      *(_QWORD *)(v8 + 200) = v9;
      operator delete(v12);
      goto LABEL_18;
    }
    while (1)
    {
      v13 = (std::__shared_weak_count *)*((_QWORD *)v11 - 1);
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
          break;
      }
      v16 = (void *)*((_QWORD *)v11 - 5);
      if (v16)
        goto LABEL_13;
LABEL_7:
      v11 -= 48;
      if (v11 == v9)
      {
        v12 = *(char **)v10;
        goto LABEL_17;
      }
    }
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    v16 = (void *)*((_QWORD *)v11 - 5);
    if (!v16)
      goto LABEL_7;
LABEL_13:
    *((_QWORD *)v11 - 4) = v16;
    operator delete(v16);
    goto LABEL_7;
  }
  v8 = 0;
  v155 = 0;
  v10 = 192;
  v9 = (char *)MEMORY[0xC0];
  if (MEMORY[0xC0])
    goto LABEL_5;
LABEL_18:
  *(_QWORD *)v10 = 0;
  *(_QWORD *)(v10 + 8) = 0;
  *(_QWORD *)(v10 + 16) = 0;
  v17 = operator new(4uLL);
  v172 = 0;
  *(_QWORD *)&v173 = v17;
  *v17 = *v146;
  *((_QWORD *)&v173 + 1) = v17 + 1;
  v174 = v17 + 1;
  v171 = 0;
  sub_23A01C6D0(v10 - 24, &v173, &v171, 0.00000011921);
  v18 = v172;
  if (v172)
  {
    v19 = (unint64_t *)&v172->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if ((_QWORD)v173)
  {
    *((_QWORD *)&v173 + 1) = v173;
    operator delete((void *)v173);
  }
  v21 = *(_DWORD *)v8 - 1;
  if (*(_BYTE *)(v8 + 16) && *(_DWORD *)(v8 + 12) < v21)
    v21 = *(_DWORD *)(v8 + 12);
  sub_23A01C8B8(v10 - 24, (uint64_t *)&v169);
  v150 = self;
  if (v21 >= 1)
  {
    v22 = 0;
    v152 = v21;
    while (1)
    {
      v24 = *(char **)v10;
      if (!*(_QWORD *)v10)
        goto LABEL_47;
      v25 = *(char **)(v8 + 200);
      v26 = *(char **)v10;
      if (v25 != v24)
        break;
LABEL_46:
      *(_QWORD *)(v8 + 200) = v24;
      operator delete(v26);
LABEL_47:
      *(_QWORD *)v10 = 0;
      *(_QWORD *)(v10 + 8) = 0;
      *(_QWORD *)(v10 + 16) = 0;
      v31 = *((_QWORD *)&v169 + 1);
      v32 = v169;
      if ((_QWORD)v169 != *((_QWORD *)&v169 + 1))
      {
        v33 = 0;
        while (*(_BYTE *)(v8 + 8))
        {
          v34 = *(_QWORD *)(v8 + 128);
          if (*(char *)(v34 + 55) < 0)
          {
            v35 = *(_QWORD *)(v34 + 32);
            v36 = *(_QWORD *)(v34 + 40);
          }
          else
          {
            v35 = v34 + 32;
            v36 = *(unsigned __int8 *)(v34 + 55);
          }
          v37 = *(_DWORD *)(*(_QWORD *)(v32 + 16) - 4);
          if (v37 != (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v34 + 32))(v34, v35, v36)
            || *(_QWORD *)(v32 + 16) - *(_QWORD *)(v32 + 8) < 5uLL)
          {
            break;
          }
          v38 = *(float *)v32;
          v167 = 0;
          v168 = 0;
          __p = 0;
          v40 = *(_BYTE **)(v32 + 8);
          v39 = *(_BYTE **)(v32 + 16);
          v41 = v39 - v40;
          if (v39 != v40)
          {
            if (v41 < 0)
              sub_239FEBE68();
            __p = operator new(v39 - v40);
            v167 = (std::__shared_weak_count *)__p;
            v42 = (std::__shared_weak_count *)((char *)__p + 4 * (v41 >> 2));
            v168 = v42;
            memcpy(__p, v40, v41);
            v167 = v42;
            self = v150;
          }
          v43 = *(std::__shared_weak_count **)(v32 + 40);
          v164 = *(_QWORD *)(v32 + 32);
          v165 = v43;
          if (v43)
          {
            v44 = (unint64_t *)&v43->__shared_owners_;
            do
              v45 = __ldxr(v44);
            while (__stxr(v45 + 1, v44));
          }
          sub_23A01C6D0(v10 - 24, &__p, &v164, v38);
          v46 = v165;
          if (v165)
          {
            v47 = (unint64_t *)&v165->__shared_owners_;
            do
              v48 = __ldaxr(v47);
            while (__stlxr(v48 - 1, v47));
            if (!v48)
            {
              ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
              std::__shared_weak_count::__release_weak(v46);
              ++v33;
              v49 = (std::__shared_weak_count *)__p;
              if (!__p)
                goto LABEL_50;
LABEL_68:
              v167 = v49;
              operator delete(v49);
              goto LABEL_50;
            }
          }
          ++v33;
          v49 = (std::__shared_weak_count *)__p;
          if (__p)
            goto LABEL_68;
LABEL_50:
          v32 += 48;
          if (v32 == v31)
            goto LABEL_84;
        }
        sub_23A049708((uint64_t)v160, v8, v32 + 8, self, v22);
        v50 = v163;
        if (v163)
        {
          (***(void (****)(_QWORD, void **))(v8 + 152))(*(_QWORD *)(v8 + 152), v160);
          sub_23A01CF9C(v8, (uint64_t)v160, v32 + 8, *(float *)v32);
          v51 = v162;
          if (!v162)
            goto LABEL_78;
        }
        else
        {
          sub_23A016E78();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            sub_23A09DEE8(&v158, v159, v52);

            v51 = v162;
            if (!v162)
              goto LABEL_78;
          }
          else
          {

            v51 = v162;
            if (!v162)
              goto LABEL_78;
          }
        }
        v53 = (unint64_t *)&v51->__shared_owners_;
        do
          v54 = __ldaxr(v53);
        while (__stlxr(v54 - 1, v53));
        if (!v54)
        {
          ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
          std::__shared_weak_count::__release_weak(v51);
        }
LABEL_78:
        if (v160[0])
        {
          v160[1] = v160[0];
          operator delete(v160[0]);
        }
        if (!v50)
        {
LABEL_84:
          v56 = *(_QWORD *)(v8 + 192);
          v55 = *(_QWORD *)(v8 + 200);
          v21 = v152;
          goto LABEL_86;
        }
        goto LABEL_50;
      }
      v56 = 0;
      v55 = 0;
      v33 = 0;
LABEL_86:
      if (v33 == -1431655765 * ((unint64_t)(v55 - v56) >> 4))
      {
        sub_23A016E78();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          sub_23A09DE78(v22, v63);

        goto LABEL_102;
      }
      sub_23A01C8B8(v10 - 24, (uint64_t *)v160);
      v57 = v169;
      if (!(_QWORD)v169)
        goto LABEL_32;
      v58 = *((_QWORD *)&v169 + 1);
      v23 = (void *)v169;
      if (*((_QWORD *)&v169 + 1) != (_QWORD)v169)
      {
        while (1)
        {
          v59 = *(std::__shared_weak_count **)(v58 - 8);
          if (v59)
          {
            v60 = (unint64_t *)&v59->__shared_owners_;
            do
              v61 = __ldaxr(v60);
            while (__stlxr(v61 - 1, v60));
            if (!v61)
              break;
          }
          v62 = *(void **)(v58 - 40);
          if (v62)
            goto LABEL_96;
LABEL_90:
          v58 -= 48;
          if (v58 == v57)
          {
            v23 = (void *)v169;
            goto LABEL_31;
          }
        }
        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
        std::__shared_weak_count::__release_weak(v59);
        v62 = *(void **)(v58 - 40);
        if (!v62)
          goto LABEL_90;
LABEL_96:
        *(_QWORD *)(v58 - 32) = v62;
        operator delete(v62);
        goto LABEL_90;
      }
LABEL_31:
      *((_QWORD *)&v169 + 1) = v57;
      operator delete(v23);
LABEL_32:
      v169 = *(_OWORD *)v160;
      v170 = v161;
      v22 = (v22 + 1);
      if ((_DWORD)v22 == v21)
        goto LABEL_102;
    }
    while (1)
    {
      v27 = (std::__shared_weak_count *)*((_QWORD *)v25 - 1);
      if (v27)
      {
        v28 = (unint64_t *)&v27->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
          break;
      }
      v30 = (void *)*((_QWORD *)v25 - 5);
      if (v30)
        goto LABEL_42;
LABEL_36:
      v25 -= 48;
      if (v25 == v24)
      {
        v26 = *(char **)v10;
        goto LABEL_46;
      }
    }
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
    v30 = (void *)*((_QWORD *)v25 - 5);
    if (!v30)
      goto LABEL_36;
LABEL_42:
    *((_QWORD *)v25 - 4) = v30;
    operator delete(v30);
    goto LABEL_36;
  }
LABEL_102:
  v64 = v169;
  if (!(_QWORD)v169)
    goto LABEL_116;
  v65 = *((_QWORD *)&v169 + 1);
  v66 = (void *)v169;
  if (*((_QWORD *)&v169 + 1) != (_QWORD)v169)
  {
    while (1)
    {
      v67 = *(std::__shared_weak_count **)(v65 - 8);
      if (v67)
      {
        v68 = (unint64_t *)&v67->__shared_owners_;
        do
          v69 = __ldaxr(v68);
        while (__stlxr(v69 - 1, v68));
        if (!v69)
          break;
      }
      v70 = *(void **)(v65 - 40);
      if (v70)
        goto LABEL_111;
LABEL_105:
      v65 -= 48;
      if (v65 == v64)
      {
        v66 = (void *)v169;
        goto LABEL_115;
      }
    }
    ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
    std::__shared_weak_count::__release_weak(v67);
    v70 = *(void **)(v65 - 40);
    if (!v70)
      goto LABEL_105;
LABEL_111:
    *(_QWORD *)(v65 - 32) = v70;
    operator delete(v70);
    goto LABEL_105;
  }
LABEL_115:
  *((_QWORD *)&v169 + 1) = v64;
  operator delete(v66);
LABEL_116:
  sub_23A01C4B4(v10 - 24, (uint64_t)&v156);
  if (v155)
  {
    v71 = (unint64_t *)&v155->__shared_owners_;
    do
      v72 = __ldaxr(v71);
    while (__stlxr(v72 - 1, v71));
    if (!v72)
    {
      ((void (*)(std::__shared_weak_count *))v155->__on_zero_shared)(v155);
      std::__shared_weak_count::__release_weak(v155);
    }
  }
  v148 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v77 = (_DWORD **)v156;
  v147 = (_DWORD **)v157;
  if (v156 == v157)
    goto LABEL_214;
  while (2)
  {
    HIBYTE(v161) = 0;
    LOBYTE(v160[0]) = 0;
    v78 = v77;
    v79 = *v77;
    v149 = v78;
    v80 = v78[1];
    v153 = v80;
    while (v79 != v80)
    {
      if (!*v79)
        goto LABEL_125;
      objc_msgSend_vocabulary(self->_procUtils, v73, v74, v75, v76);
      (*(void (**)(__int128 *__return_ptr, void *, _QWORD))(*(_QWORD *)__p + 40))(&v169, __p, *v79);
      v81 = HIBYTE(v170);
      if (v170 >= 0)
        v82 = 22;
      else
        v82 = (v170 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (v170 < 0)
        v81 = *((_QWORD *)&v169 + 1);
      if (v82 == v81)
      {
        if (v82 == 0x7FFFFFFFFFFFFFF6)
          sub_239FEBDE0();
        v83 = v82 + 1;
        if (v170 >= 0)
          v84 = &v169;
        else
          v84 = (__int128 *)v169;
        if (v82 >= 0x3FFFFFFFFFFFFFF3)
        {
          v86 = 0x7FFFFFFFFFFFFFF7;
        }
        else
        {
          v85 = 2 * v82;
          if (v83 > 2 * v82)
            v85 = v82 + 1;
          if (v85 >= 0x17)
          {
            v90 = (v85 & 0xFFFFFFFFFFFFFFF8) + 8;
            v91 = v85 | 7;
            if (v91 == 23)
              v91 = v90;
            v86 = v91 + 1;
          }
          else
          {
            v86 = 23;
          }
        }
        v92 = operator new(v86);
        v93 = v92;
        if (v82)
        {
          memmove(v92, v84, v82);
          v93[v82] = 32;
          if (v82 == 22)
            goto LABEL_158;
        }
        else
        {
          *v92 = 32;
        }
        operator delete(v84);
LABEL_158:
        *((_QWORD *)&v169 + 1) = v82 + 1;
        v170 = v86 | 0x8000000000000000;
        *(_QWORD *)&v169 = v93;
        v89 = &v93[v83];
        goto LABEL_159;
      }
      v87 = &v169;
      if (v170 < 0)
        v87 = (__int128 *)v169;
      *((_BYTE *)v87 + v81) = 32;
      v88 = v81 + 1;
      if (SHIBYTE(v170) < 0)
        *((_QWORD *)&v169 + 1) = v88;
      else
        HIBYTE(v170) = v88 & 0x7F;
      v89 = (char *)v87 + v88;
LABEL_159:
      *v89 = 0;
      v174 = (_DWORD *)v170;
      v173 = v169;
      v170 = 0;
      v169 = 0uLL;
      v94 = SHIBYTE(v174);
      v151 = (void *)v173;
      if (SHIBYTE(v174) >= 0)
        v95 = &v173;
      else
        v95 = (__int128 *)v173;
      if (SHIBYTE(v174) >= 0)
        v96 = HIBYTE(v174);
      else
        v96 = *((_QWORD *)&v173 + 1);
      if (v161 >= 0)
        v97 = 22;
      else
        v97 = (v161 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (v161 >= 0)
        v98 = HIBYTE(v161);
      else
        v98 = (size_t)v160[1];
      if (v97 - v98 < v96)
      {
        v99 = v98 + v96;
        if (0x7FFFFFFFFFFFFFF6 - v97 < v98 + v96 - v97)
          sub_239FEBDE0();
        if (v161 >= 0)
          v100 = v160;
        else
          v100 = (void **)v160[0];
        if (v97 >= 0x3FFFFFFFFFFFFFF3)
        {
          v106 = 0x7FFFFFFFFFFFFFF6;
        }
        else
        {
          v101 = 2 * v97;
          if (v99 > 2 * v97)
            v101 = v98 + v96;
          if (v101 < 0x17)
          {
            v102 = 23;
LABEL_192:
            v108 = (char *)operator new(v102);
            v109 = v108;
            if (v98)
              memmove(v108, v100, v98);
            memcpy(&v109[v98], v95, v96);
            if (v97 != 22)
              operator delete(v100);
            v160[1] = (void *)(v98 + v96);
            v161 = v102 | 0x8000000000000000;
            v160[0] = v109;
            v105 = &v109[v99];
            self = v150;
            goto LABEL_197;
          }
          v107 = (v101 & 0xFFFFFFFFFFFFFFF8) + 8;
          v106 = v101 | 7;
          if (v106 == 23)
            v106 = v107;
        }
        v102 = v106 + 1;
        goto LABEL_192;
      }
      if (!v96)
        goto LABEL_198;
      if (v161 >= 0)
        v103 = v160;
      else
        v103 = (void **)v160[0];
      memmove((char *)v103 + v98, v95, v96);
      v104 = v98 + v96;
      if (SHIBYTE(v161) < 0)
        v160[1] = (void *)(v98 + v96);
      else
        HIBYTE(v161) = v104 & 0x7F;
      v105 = (char *)v103 + v104;
LABEL_197:
      *v105 = 0;
LABEL_198:
      if (v94 < 0)
      {
        operator delete(v151);
        if ((SHIBYTE(v170) & 0x80000000) == 0)
        {
LABEL_200:
          v110 = v167;
          if (!v167)
            goto LABEL_125;
          goto LABEL_204;
        }
      }
      else if ((SHIBYTE(v170) & 0x80000000) == 0)
      {
        goto LABEL_200;
      }
      operator delete((void *)v169);
      v110 = v167;
      if (!v167)
        goto LABEL_125;
LABEL_204:
      v111 = (unint64_t *)&v110->__shared_owners_;
      do
        v112 = __ldaxr(v111);
      while (__stlxr(v112 - 1, v111));
      if (!v112)
      {
        ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
        std::__shared_weak_count::__release_weak(v110);
      }
LABEL_125:
      ++v79;
      v80 = v153;
    }
    MEMORY[0x23B83FDBC](&v169);
    LODWORD(v173) = 0x4000;
    std::locale::locale((std::locale *)&v173 + 1, (const std::locale *)&v169);
    sub_23A01F000((unsigned __int8 *)v160, (const std::locale *)&v173);
    std::locale::~locale((std::locale *)&v173 + 1);
    std::locale::~locale((std::locale *)&v169);
    MEMORY[0x23B83FDBC]();
    LODWORD(v173) = 0x4000;
    std::locale::locale((std::locale *)&v173 + 1, (const std::locale *)&v169);
    sub_23A01F1FC((char *)v160, (const std::locale *)&v173);
    std::locale::~locale((std::locale *)&v173 + 1);
    std::locale::~locale((std::locale *)&v169);
    v113 = (void *)MEMORY[0x24BDD17C8];
    v114 = SHIBYTE(v161);
    v115 = v160[0];
    v121 = objc_msgSend_defaultCStringEncoding(MEMORY[0x24BDD17C8], v116, v117, v118, v119);
    if (v114 >= 0)
      objc_msgSend_stringWithCString_encoding_(v113, v120, (uint64_t)v160, v121, v122);
    else
      objc_msgSend_stringWithCString_encoding_(v113, v120, (uint64_t)v115, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = [CSUCaptionResult alloc];
    LODWORD(v125) = *((_DWORD *)v149 + 6);
    v129 = (void *)objc_msgSend_initWithCaption_score_(v124, v126, (uint64_t)v123, v127, v128, v125);
    objc_msgSend_addObject_(v148, v130, (uint64_t)v129, v131, v132);

    if (SHIBYTE(v161) < 0)
      operator delete(v160[0]);
    v77 = v149 + 4;
    if (v149 + 4 != v147)
      continue;
    break;
  }
LABEL_214:
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v73, (uint64_t)v148, v75, v76);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v134, (uint64_t)v133, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  v138 = v137;
  v139 = (char *)v156;
  if (v156)
  {
    v140 = v157;
    v141 = v156;
    if (v157 != v156)
    {
      v142 = v157;
      do
      {
        v144 = (void *)*((_QWORD *)v142 - 4);
        v142 -= 32;
        v143 = v144;
        if (v144)
        {
          *(v140 - 3) = v143;
          operator delete(v143);
        }
        v140 = v142;
      }
      while (v142 != v139);
      v141 = v156;
    }
    v157 = v139;
    operator delete(v141);
  }
  operator delete(v146);
  return v138;
}

- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures
{
  CSUImageCaptioningDecoderE1 *v2;
  unint64_t *end;
  unint64_t *begin;
  unint64_t v5;
  int v6;
  unint64_t *v7;
  uint64_t v8;
  int32x4_t *v9;
  int32x4_t v10;
  uint64_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int8x16_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  __int128 *v25;
  uint64_t value;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  size_t v34;
  __int128 *p_dst;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  size_t v48;
  size_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  std::__shared_weak_count *v57;
  unint64_t *p_shared_owners;
  unint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  size_t v73;
  size_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  size_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  float *v118;
  float *v119;
  float v120;
  uint64_t v121;
  float *v122;
  float *v123;
  float v124;
  float v125;
  uint64_t v126;
  unint64_t v127;
  char *v128;
  uint64_t v129;
  void *v130;
  char *v131;
  int64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char *v137;
  char *v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  char *v144;
  char *v145;
  uint64_t v146;
  __int128 v147;
  int v148;
  int v149;
  char *v150;
  char *v151;
  char *v152;
  int64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  unint64_t v157;
  char *v158;
  char *v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  char *v165;
  char *v166;
  uint64_t v167;
  __int128 v168;
  int v169;
  float32x4_t *v170;
  unint64_t v171;
  double v172;
  float *v173;
  uint64_t v174;
  float32x4_t *v175;
  uint64_t v176;
  float32x4_t v177;
  float64x2_t v178;
  float64x2_t v179;
  float64x2_t v180;
  float64x2_t v181;
  float v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  unsigned int *v188;
  unsigned int *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  std::__shared_weak_count *v195;
  unint64_t *v196;
  unint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  std::__shared_weak_count *v206;
  unint64_t *v207;
  unint64_t v208;
  void *v209;
  CSUCaptionResult *v210;
  double v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  id v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  std::runtime_error *exception;
  __int128 *v233;
  uint64_t v234;
  uint64_t p_inputTokens;
  uint64_t p_encodedFeaturesBuffer;
  id v237;
  unint64_t v238;
  CSUImageCaptioningDecoderE1 *v239;
  void *v240;
  char v241;
  __int128 v242;
  unint64_t v243;
  __int128 __dst;
  unint64_t v245;
  void *v246[2];
  __int128 v247;
  int v248;
  uint64_t v249;
  std::__shared_weak_count *v250;
  void *v251;
  char *v252;
  char *v253;
  void *v254;
  char *v255;
  char *v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  uint64_t v267;
  uint64_t v268;

  v2 = self;
  v268 = *MEMORY[0x24BDAC8D0];
  begin = self->_inputTokens.shape_.sizes_.__begin_;
  end = self->_inputTokens.shape_.sizes_.__end_;
  if (begin != end)
  {
    v5 = (char *)end - (char *)begin - 8;
    if (v5 >= 0x38)
    {
      v8 = (v5 >> 3) + 1;
      v7 = &begin[v8 & 0x3FFFFFFFFFFFFFF8];
      v9 = (int32x4_t *)(begin + 4);
      v10.i64[0] = 0x100000001;
      v10.i64[1] = 0x100000001;
      v11 = v8 & 0x3FFFFFFFFFFFFFF8;
      v12.i64[0] = 0x100000001;
      v12.i64[1] = 0x100000001;
      do
      {
        v14 = v9[-2];
        v13 = v9[-1];
        v16 = *v9;
        v15 = v9[1];
        v9 += 4;
        v10 = vmulq_s32(v10, vuzp1q_s32(v14, v13));
        v12 = vmulq_s32(v12, vuzp1q_s32(v16, v15));
        v11 -= 8;
      }
      while (v11);
      v17 = (int8x16_t)vmulq_s32(v12, v10);
      *(int32x2_t *)v17.i8 = vmul_s32(*(int32x2_t *)v17.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
      v6 = v17.i32[0] * v17.i32[1];
      if (v8 == (v8 & 0x3FFFFFFFFFFFFFF8))
        goto LABEL_9;
    }
    else
    {
      v6 = 1;
      v7 = self->_inputTokens.shape_.sizes_.__begin_;
    }
    do
    {
      v18 = *(_DWORD *)v7++;
      v6 *= v18;
    }
    while (v7 != end);
LABEL_9:
    v238 = v6;
    goto LABEL_10;
  }
  v238 = 0;
LABEL_10:
  if (self->_inputTokens.type_ != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v234 = (*(uint64_t (**)(TensorStorage *, SEL))(*(_QWORD *)self->_inputTokens.storage_.__ptr_ + 24))(self->_inputTokens.storage_.__ptr_, a2);
  v254 = 0;
  v255 = 0;
  v256 = 0;
  v251 = 0;
  v252 = 0;
  v253 = 0;
  v239 = v2;
  if (!v238)
  {
    v151 = 0;
    v23 = 0;
    v170 = (float32x4_t *)v251;
LABEL_139:
    v172 = 0.0;
    goto LABEL_145;
  }
  v23 = 0;
  v24 = 0;
  p_inputTokens = (uint64_t)&v2->_inputTokens;
  p_encodedFeaturesBuffer = (uint64_t)&v2->_encodedFeaturesBuffer;
  v25 = &v262;
  v233 = &v262;
  while (1)
  {
    value = (uint64_t)v2->_decoderNet.__ptr_.__value_;
    objc_msgSend_inputEncodedFeaturesTensorName(v2->_configuration, v19, v20, v21, v22, v233);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30, v31);
    v33 = strlen(v32);
    if (v33 > 0x7FFFFFFFFFFFFFF7)
      sub_239FEBDE0();
    v34 = v33;
    if (v33 >= 0x17)
    {
      v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v33 | 7) != 0x17)
        v36 = v33 | 7;
      v37 = v36 + 1;
      p_dst = (__int128 *)operator new(v36 + 1);
      *((_QWORD *)&__dst + 1) = v34;
      v245 = v37 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
LABEL_20:
      memmove(p_dst, v32, v34);
      goto LABEL_21;
    }
    HIBYTE(v245) = v33;
    p_dst = &__dst;
    if (v33)
      goto LABEL_20;
LABEL_21:
    *((_BYTE *)p_dst + v34) = 0;
    sub_239FFF258((uint64_t)&v257, &__dst, p_encodedFeaturesBuffer);
    objc_msgSend_inputWordIdsTensorName(v239->_configuration, v38, v39, v40, v41);
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = (const char *)objc_msgSend_UTF8String(v42, v43, v44, v45, v46);
    v48 = strlen(v47);
    if (v48 > 0x7FFFFFFFFFFFFFF7)
      sub_239FEBDE0();
    v49 = v48;
    if (v48 >= 0x17)
    {
      v51 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v48 | 7) != 0x17)
        v51 = v48 | 7;
      v52 = v51 + 1;
      v50 = operator new(v51 + 1);
      *((_QWORD *)&v242 + 1) = v49;
      v243 = v52 | 0x8000000000000000;
      *(_QWORD *)&v242 = v50;
    }
    else
    {
      HIBYTE(v243) = v48;
      v50 = &v242;
      if (!v48)
        goto LABEL_29;
    }
    memmove(v50, v47, v49);
LABEL_29:
    *((_BYTE *)v50 + v49) = 0;
    sub_239FFF258((uint64_t)v25, &v242, p_inputTokens);
    *(_OWORD *)v246 = 0u;
    v247 = 0u;
    v248 = 1065353216;
    sub_239FF6528((uint64_t)v246, (uint64_t)&v257, &v257);
    v2 = v239;
    sub_239FF6528((uint64_t)v246, (uint64_t)v25, v25);
    sub_239FF1424(value, (uint64_t)v246, (uint64_t)&v249);
    sub_239FF5234((uint64_t)v246);
    *((_QWORD *)&v263 + 1) = &off_250B0DCE8;
    v53 = (std::__shared_weak_count *)*((_QWORD *)&v266 + 1);
    if (!*((_QWORD *)&v266 + 1))
      goto LABEL_33;
    v54 = (unint64_t *)(*((_QWORD *)&v266 + 1) + 8);
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (v55)
    {
LABEL_33:
      v56 = (void *)*((_QWORD *)&v264 + 1);
      if (!*((_QWORD *)&v264 + 1))
        goto LABEL_35;
LABEL_34:
      *(_QWORD *)&v265 = v56;
      operator delete(v56);
      goto LABEL_35;
    }
    ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
    std::__shared_weak_count::__release_weak(v53);
    v56 = (void *)*((_QWORD *)&v264 + 1);
    if (*((_QWORD *)&v264 + 1))
      goto LABEL_34;
LABEL_35:
    if (SBYTE7(v263) < 0)
    {
      operator delete((void *)v262);
      *((_QWORD *)&v258 + 1) = &off_250B0DCE8;
      v57 = (std::__shared_weak_count *)*((_QWORD *)&v261 + 1);
      if (!*((_QWORD *)&v261 + 1))
        goto LABEL_42;
    }
    else
    {
      *((_QWORD *)&v258 + 1) = &off_250B0DCE8;
      v57 = (std::__shared_weak_count *)*((_QWORD *)&v261 + 1);
      if (!*((_QWORD *)&v261 + 1))
        goto LABEL_42;
    }
    p_shared_owners = (unint64_t *)&v57->__shared_owners_;
    do
      v59 = __ldaxr(p_shared_owners);
    while (__stlxr(v59 - 1, p_shared_owners));
    if (v59)
    {
LABEL_42:
      v60 = (void *)*((_QWORD *)&v259 + 1);
      if (!*((_QWORD *)&v259 + 1))
        goto LABEL_44;
LABEL_43:
      *(_QWORD *)&v260 = v60;
      operator delete(v60);
      goto LABEL_44;
    }
    ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
    std::__shared_weak_count::__release_weak(v57);
    v60 = (void *)*((_QWORD *)&v259 + 1);
    if (*((_QWORD *)&v259 + 1))
      goto LABEL_43;
LABEL_44:
    if (SBYTE7(v258) < 0)
    {
      operator delete((void *)v257);
      if ((SHIBYTE(v243) & 0x80000000) == 0)
        goto LABEL_46;
    }
    else if ((SHIBYTE(v243) & 0x80000000) == 0)
    {
      goto LABEL_46;
    }
    operator delete((void *)v242);
LABEL_46:

    if (SHIBYTE(v245) < 0)
      operator delete((void *)__dst);

    objc_msgSend_outputWordProbsTensorName(v239->_configuration, v61, v62, v63, v64);
    v65 = (id)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (!v65)
    {
LABEL_70:
      v89 = 0;
      goto LABEL_78;
    }
    v67 = objc_retainAutorelease(v65);
    v72 = (const char *)objc_msgSend_UTF8String(v67, v68, v69, v70, v71);
    v73 = strlen(v72);
    if (v73 > 0x7FFFFFFFFFFFFFF7)
      sub_239FEBDE0();
    v74 = v73;
    if (v73 >= 0x17)
    {
      v76 = (v73 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v73 | 7) != 0x17)
        v76 = v73 | 7;
      v77 = v76 + 1;
      v75 = operator new(v76 + 1);
      *((_QWORD *)&v257 + 1) = v74;
      *(_QWORD *)&v258 = v77 | 0x8000000000000000;
      *(_QWORD *)&v257 = v75;
LABEL_58:
      memmove(v75, v72, v74);
      goto LABEL_59;
    }
    BYTE7(v258) = v73;
    v75 = &v257;
    if (v73)
      goto LABEL_58;
LABEL_59:
    *((_BYTE *)v75 + v74) = 0;
    v78 = sub_239FF2E64(&v249, (uint64_t)&v257);
    v79 = v78;
    v2 = v239;
    if (SBYTE7(v258) < 0)
    {
      operator delete((void *)v257);
      if (!v79)
        goto LABEL_70;
    }
    else if (!v78)
    {
      goto LABEL_70;
    }
    v80 = objc_retainAutorelease(v67);
    v85 = (const char *)objc_msgSend_UTF8String(v80, v81, v82, v83, v84);
    v86 = strlen(v85);
    if (v86 > 0x7FFFFFFFFFFFFFF7)
      sub_239FEBDE0();
    v87 = (void *)v86;
    if (v86 >= 0x17)
    {
      v90 = (v86 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v86 | 7) != 0x17)
        v90 = v86 | 7;
      v91 = v90 + 1;
      v88 = operator new(v90 + 1);
      v246[1] = v87;
      *(_QWORD *)&v247 = v91 | 0x8000000000000000;
      v246[0] = v88;
    }
    else
    {
      BYTE7(v247) = v86;
      v88 = v246;
      if (!v86)
        goto LABEL_75;
    }
    memmove(v88, v85, (size_t)v87);
LABEL_75:
    *((_BYTE *)v87 + (_QWORD)v88) = 0;
    v92 = sub_239FF2E64(&v249, (uint64_t)v246);
    v2 = v239;
    if (!v92)
      sub_239FF1D10("unordered_map::at: key not found");
    v96 = v92[10];
    v97 = *(_OWORD *)(v96 + 40);
    v98 = *(_OWORD *)(v96 + 24);
    v257 = *(_OWORD *)(v96 + 8);
    v258 = v98;
    v259 = v97;
    v99 = *(_OWORD *)(v96 + 88);
    v100 = *(_OWORD *)(v96 + 104);
    v101 = *(_OWORD *)(v96 + 72);
    v260 = *(_OWORD *)(v96 + 56);
    v261 = v101;
    v102 = *(_OWORD *)(v96 + 120);
    v103 = *(_OWORD *)(v96 + 136);
    v104 = *(_OWORD *)(v96 + 152);
    v267 = *(_QWORD *)(v96 + 168);
    v265 = v103;
    v266 = v104;
    v263 = v100;
    v264 = v102;
    v262 = v99;
    objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v93, (uint64_t)&v257, v94, v95);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (SBYTE7(v247) < 0)
      operator delete(v246[0]);
LABEL_78:

    objc_msgSend_configuration(v2, v105, v106, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend_saveDecoderFeatures(v109, v110, v111, v112, v113);

    v23 = v114 ? v89 : 0;
    v237 = v23;
    v115 = (_QWORD *)sub_23A046674(v89);
    v116 = v115[10];
    v117 = v116 * v24++;
    if (v117 == v116 * v24)
      break;
    v118 = (float *)(*v115 + 4 * v117);
    v119 = v118 + 1;
    if (v118 + 1 == (float *)(*v115 + 4 * v116 * v24))
      break;
    v120 = *v118;
    v121 = 4 * v116 - 4;
    v122 = v118;
    v123 = v118 + 1;
    do
    {
      v124 = *v123++;
      v125 = v124;
      if (v120 < v124)
      {
        v120 = v125;
        v122 = v119;
      }
      v119 = v123;
      v121 -= 4;
    }
    while (v121);
    v126 = (char *)v122 - (char *)v118;
    if (!v126)
      break;
    if (v24 < v238)
      *(float *)(v234 + 4 * v24) = (float)(v126 >> 2);
    v127 = (unint64_t)v126 >> 2;
    v128 = v255;
    if (v255 < v256)
    {
      *(_DWORD *)v255 = v127;
      v129 = (uint64_t)(v128 + 4);
      goto LABEL_112;
    }
    v130 = v89;
    v131 = (char *)v254;
    v132 = v255 - (_BYTE *)v254;
    v133 = (v255 - (_BYTE *)v254) >> 2;
    v134 = v133 + 1;
    if ((unint64_t)(v133 + 1) >> 62)
      sub_239FEBE68();
    v135 = v256 - (_BYTE *)v254;
    if ((v256 - (_BYTE *)v254) >> 1 > v134)
      v134 = v135 >> 1;
    if ((unint64_t)v135 >= 0x7FFFFFFFFFFFFFFCLL)
      v136 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v136 = v134;
    if (v136)
    {
      if (v136 >> 62)
        sub_239FF1A44();
      v137 = (char *)operator new(4 * v136);
      v138 = &v137[4 * v133];
      *(_DWORD *)v138 = v127;
      v129 = (uint64_t)(v138 + 4);
      if (v128 == v131)
      {
LABEL_104:
        v89 = v130;
        v25 = v233;
        goto LABEL_110;
      }
    }
    else
    {
      v137 = 0;
      v138 = (char *)(4 * v133);
      *(_DWORD *)(4 * v133) = v127;
      v129 = 4 * v133 + 4;
      if (v128 == v131)
        goto LABEL_104;
    }
    v139 = v128 - 4 - v131;
    if (v139 < 0x2C)
    {
      v89 = v130;
      v25 = v233;
      do
      {
LABEL_109:
        v148 = *((_DWORD *)v128 - 1);
        v128 -= 4;
        *((_DWORD *)v138 - 1) = v148;
        v138 -= 4;
      }
      while (v128 != v131);
      goto LABEL_110;
    }
    v140 = v128 - &v137[v132];
    v89 = v130;
    v25 = v233;
    if (v140 < 0x20)
      goto LABEL_109;
    v141 = (v139 >> 2) + 1;
    v142 = 4 * (v141 & 0x7FFFFFFFFFFFFFF8);
    v143 = &v128[-v142];
    v138 -= v142;
    v144 = &v137[4 * v133 - 16];
    v145 = v128 - 16;
    v146 = v141 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v147 = *(_OWORD *)v145;
      *((_OWORD *)v144 - 1) = *((_OWORD *)v145 - 1);
      *(_OWORD *)v144 = v147;
      v144 -= 32;
      v145 -= 32;
      v146 -= 8;
    }
    while (v146);
    v128 = v143;
    if (v141 != (v141 & 0x7FFFFFFFFFFFFFF8))
      goto LABEL_109;
LABEL_110:
    v254 = v138;
    v256 = &v137[4 * v136];
    if (v131)
      operator delete(v131);
LABEL_112:
    v255 = (char *)v129;
    v149 = *(_DWORD *)v122;
    v150 = v252;
    if (v252 >= v253)
    {
      v152 = (char *)v251;
      v153 = v252 - (_BYTE *)v251;
      v154 = (v252 - (_BYTE *)v251) >> 2;
      v155 = v154 + 1;
      if ((unint64_t)(v154 + 1) >> 62)
        sub_239FEBE68();
      v156 = v253 - (_BYTE *)v251;
      if ((v253 - (_BYTE *)v251) >> 1 > v155)
        v155 = v156 >> 1;
      if ((unint64_t)v156 >= 0x7FFFFFFFFFFFFFFCLL)
        v157 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v157 = v155;
      if (v157)
      {
        if (v157 >> 62)
          sub_239FF1A44();
        v158 = (char *)operator new(4 * v157);
        v159 = &v158[4 * v154];
        *(_DWORD *)v159 = v149;
        v151 = v159 + 4;
        if (v150 != v152)
        {
LABEL_123:
          v160 = v150 - 4 - v152;
          if (v160 >= 0x2C)
          {
            v161 = v150 - &v158[v153];
            v23 = v237;
            if (v161 >= 0x20)
            {
              v162 = (v160 >> 2) + 1;
              v163 = 4 * (v162 & 0x7FFFFFFFFFFFFFF8);
              v164 = &v150[-v163];
              v159 -= v163;
              v165 = &v158[4 * v154 - 16];
              v166 = v150 - 16;
              v167 = v162 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                v168 = *(_OWORD *)v166;
                *((_OWORD *)v165 - 1) = *((_OWORD *)v166 - 1);
                *(_OWORD *)v165 = v168;
                v165 -= 32;
                v166 -= 32;
                v167 -= 8;
              }
              while (v167);
              v150 = v164;
              if (v162 == (v162 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_132:
                v251 = v159;
                v253 = &v158[4 * v157];
                if (v152)
                  operator delete(v152);
                goto LABEL_134;
              }
            }
          }
          else
          {
            v23 = v237;
          }
          do
          {
            v169 = *((_DWORD *)v150 - 1);
            v150 -= 4;
            *((_DWORD *)v159 - 1) = v169;
            v159 -= 4;
          }
          while (v150 != v152);
          goto LABEL_132;
        }
      }
      else
      {
        v158 = 0;
        v159 = (char *)(4 * v154);
        *(_DWORD *)(4 * v154) = v149;
        v151 = (char *)(4 * v154 + 4);
        if (v150 != v152)
          goto LABEL_123;
      }
      v23 = v237;
      goto LABEL_132;
    }
    *(_DWORD *)v252 = v149;
    v151 = v150 + 4;
    v23 = v237;
LABEL_134:
    v2 = v239;
    v252 = v151;

    sub_239FF5234((uint64_t)&v249);
    if (v24 == v238)
    {
      v170 = (float32x4_t *)v251;
      if (v251 == v151)
        goto LABEL_139;
      goto LABEL_136;
    }
  }

  sub_239FF5234((uint64_t)&v249);
  v170 = (float32x4_t *)v251;
  v151 = v252;
  if (v251 == v252)
    goto LABEL_139;
LABEL_136:
  v171 = v151 - (char *)v170 - 4;
  if (v171 < 0x1C)
  {
    v172 = 0.0;
    v173 = (float *)v170;
    goto LABEL_144;
  }
  v174 = (v171 >> 2) + 1;
  v173 = &v170->f32[v174 & 0x7FFFFFFFFFFFFFF8];
  v175 = v170 + 1;
  v172 = 0.0;
  v176 = v174 & 0x7FFFFFFFFFFFFFF8;
  do
  {
    v177 = v175[-1];
    v178 = vcvt_hight_f64_f32(v177);
    v179 = vcvtq_f64_f32(*(float32x2_t *)v177.f32);
    v180 = vcvt_hight_f64_f32(*v175);
    v181 = vcvtq_f64_f32(*(float32x2_t *)v175->f32);
    v172 = v172
         + v179.f64[0]
         + v179.f64[1]
         + v178.f64[0]
         + v178.f64[1]
         + v181.f64[0]
         + v181.f64[1]
         + v180.f64[0]
         + v180.f64[1];
    v175 += 2;
    v176 -= 8;
  }
  while (v176);
  if (v174 != (v174 & 0x7FFFFFFFFFFFFFF8))
  {
    do
    {
LABEL_144:
      v182 = *v173++;
      v172 = v172 + v182;
    }
    while (v173 != (float *)v151);
  }
LABEL_145:
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v19, v20, v21, v22);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = (unsigned int *)v254;
  v189 = (unsigned int *)v255;
  if (v254 != v255)
  {
    while (2)
    {
      v190 = *v188;
      if (!(_DWORD)v190)
        break;
      objc_msgSend_vocabulary(v2->_procUtils, v183, v184, v185, v186);
      (*(void (**)(void **__return_ptr, _QWORD, uint64_t))(*(_QWORD *)v257 + 40))(&v240, v257, v190);
      if (v241 < 0)
      {
        operator delete(v240);
        v195 = (std::__shared_weak_count *)*((_QWORD *)&v257 + 1);
        if (!*((_QWORD *)&v257 + 1))
          goto LABEL_157;
      }
      else
      {
        v195 = (std::__shared_weak_count *)*((_QWORD *)&v257 + 1);
        if (!*((_QWORD *)&v257 + 1))
          goto LABEL_157;
      }
      v196 = (unint64_t *)&v195->__shared_owners_;
      do
        v197 = __ldaxr(v196);
      while (__stlxr(v197 - 1, v196));
      if (!v197)
      {
        ((void (*)(std::__shared_weak_count *))v195->__on_zero_shared)(v195);
        std::__shared_weak_count::__release_weak(v195);
      }
LABEL_157:
      v198 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_vocabulary(v239->_procUtils, v191, v192, v193, v194);
      (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v249 + 40))(&v257, v249, v190);
      if ((SBYTE7(v258) & 0x80u) == 0)
        objc_msgSend_stringWithUTF8String_(v198, v199, (uint64_t)&v257, v200, v201);
      else
        objc_msgSend_stringWithUTF8String_(v198, v199, v257, v200, v201);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v187, v203, (uint64_t)v202, v204, v205);
      v2 = v239;

      if (SBYTE7(v258) < 0)
      {
        operator delete((void *)v257);
        v206 = v250;
        if (!v250)
          goto LABEL_147;
      }
      else
      {
        v206 = v250;
        if (!v250)
          goto LABEL_147;
      }
      v207 = (unint64_t *)&v206->__shared_owners_;
      do
        v208 = __ldaxr(v207);
      while (__stlxr(v208 - 1, v207));
      if (!v208)
      {
        ((void (*)(std::__shared_weak_count *))v206->__on_zero_shared)(v206);
        std::__shared_weak_count::__release_weak(v206);
      }
LABEL_147:
      if (++v188 == v189)
        break;
      continue;
    }
  }
  objc_msgSend_componentsJoinedByString_(v187, v183, (uint64_t)CFSTR(" "), v185, v186);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = [CSUCaptionResult alloc];
  v211 = v172 / (double)(unint64_t)((v151 - (char *)v170) >> 2);
  *(float *)&v211 = v211;
  v215 = (void *)objc_msgSend_initWithCaption_score_(v210, v212, (uint64_t)v209, v213, v214, v211);
  v216 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_addObject_(v216, v217, (uint64_t)v215, v218, v219);
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v220, (uint64_t)v216, v221, v222);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v224, (uint64_t)v223, v225, v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setDecoderFeaturesCSUBuffer_(v227, v228, (uint64_t)v23, v229, v230);
  if (v251)
    operator delete(v251);
  if (v254)
    operator delete(v254);
  return v227;
}

- (id)postProcessResults:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v6 = a3;
  objc_msgSend_postProcessingHandler(self->_procUtils, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_postProcessingHandler(self->_procUtils, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_genderOptionForBeamSearch(self->_procUtils, v17, v18, v19, v20);
    objc_msgSend_postProcessResults_genderOption_error_(v16, v22, (uint64_t)v6, v21, (uint64_t)a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    return v23;
  }
  else
  {
    sub_23A016E78();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_23A09E524(v24, v25, v26);

    v27 = v6;
    return v27;
  }
}

- (CSUCaptioningProcUtils)procUtils
{
  return self->_procUtils;
}

- (CSUImageCaptioningDecoderConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *begin;
  __shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  __shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  EspressoNet *value;
  EspressoNet *v16;

  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_procUtils, 0);
  self->_encodedFeaturesBuffer._vptr$Tensor = (void **)&off_250B0DCE8;
  cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      begin = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
      if (!begin)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  begin = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_6:
    self->_encodedFeaturesBuffer.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_7:
  self->_bridgeInputBuffer._vptr$Tensor = (void **)&off_250B0DCE8;
  v7 = self->_bridgeInputBuffer.storage_.__cntrl_;
  if (v7)
  {
    v8 = (unint64_t *)((char *)v7 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v7 + 16))(v7);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
      v10 = self->_bridgeInputBuffer.shape_.sizes_.__begin_;
      if (!v10)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  v10 = self->_bridgeInputBuffer.shape_.sizes_.__begin_;
  if (v10)
  {
LABEL_12:
    self->_bridgeInputBuffer.shape_.sizes_.__end_ = v10;
    operator delete(v10);
  }
LABEL_13:
  self->_inputTokens._vptr$Tensor = (void **)&off_250B0DCE8;
  v11 = self->_inputTokens.storage_.__cntrl_;
  if (!v11)
    goto LABEL_17;
  v12 = (unint64_t *)((char *)v11 + 8);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (v13)
  {
LABEL_17:
    v14 = self->_inputTokens.shape_.sizes_.__begin_;
    if (!v14)
      goto LABEL_19;
    goto LABEL_18;
  }
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)v11 + 16))(v11);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11);
  v14 = self->_inputTokens.shape_.sizes_.__begin_;
  if (v14)
  {
LABEL_18:
    self->_inputTokens.shape_.sizes_.__end_ = v14;
    operator delete(v14);
  }
LABEL_19:
  value = self->_bridgeNet.__ptr_.__value_;
  self->_bridgeNet.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
  v16 = self->_decoderNet.__ptr_.__value_;
  self->_decoderNet.__ptr_.__value_ = 0;
  if (v16)
    (*(void (**)(EspressoNet *))(*(_QWORD *)v16 + 8))(v16);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_DWORD *)self + 8) = 4;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 3) = &off_250B0DB88;
  *((_DWORD *)self + 22) = 4;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = &off_250B0DB88;
  *((_DWORD *)self + 36) = 4;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = &off_250B0DB88;
  return self;
}

@end
