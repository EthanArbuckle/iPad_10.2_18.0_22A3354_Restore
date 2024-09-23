@implementation CSUVisualGenerationTextEncoderV1

- (CSUVisualGenerationTextEncoderV1)initWithConfiguration:(id)a3
{
  id v5;
  CSUVisualGenerationTextEncoderV1 *v6;
  CSUVisualGenerationTextEncoderV1 *v7;
  CSUVisualGenerationTextEncoderV1 *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUVisualGenerationTextEncoderV1;
  v6 = -[CSUVisualGenerationTextEncoderV1 init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (vector<unsigned)getTokenIDsOnText:(CSUVisualGenerationTextEncoderV1 *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SentencePieceVocabulary *value;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  size_t v31;
  size_t v32;
  void **p_dst;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _BYTE *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  char *v56;
  int64_t v57;
  char *v58;
  char *v59;
  unint64_t v60;
  uint64_t v61;
  size_t v62;
  unsigned int *v63;
  unsigned int *v64;
  vector<unsigned int, std::allocator<unsigned int>> *result;
  _BOOL4 v66;
  void **__dst;
  size_t v68;
  unint64_t v69;
  void *__p;
  char *v71;

  v8 = a6;
  v9 = a5;
  v12 = a4;
  if ((objc_msgSend_loadResources_(self, v13, (uint64_t)a7, v14, v15) & 1) == 0)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    goto LABEL_34;
  }
  v66 = v8;
  if (objc_msgSend_inputIsLowerCase(self->_configuration, v16, v17, v18, v19))
  {
    objc_msgSend_lowercaseString(v12, v20, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v24;
  }
  value = self->_vocabulary.__ptr_.__value_;
  v12 = objc_retainAutorelease(v12);
  v30 = (const char *)objc_msgSend_UTF8String(v12, v26, v27, v28, v29);
  v31 = strlen(v30);
  if (v31 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v32 = v31;
  if (v31 >= 0x17)
  {
    v34 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v31 | 7) != 0x17)
      v34 = v31 | 7;
    v35 = v34 + 1;
    p_dst = (void **)operator new(v34 + 1);
    v68 = v32;
    v69 = v35 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_12;
  }
  HIBYTE(v69) = v31;
  p_dst = (void **)&__dst;
  if (v31)
LABEL_12:
    memmove(p_dst, v30, v32);
  *((_BYTE *)p_dst + v32) = 0;
  (*(void (**)(void **__return_ptr, SentencePieceVocabulary *, void ***, _QWORD))(*(_QWORD *)value + 16))(&__p, value, &__dst, 0);
  if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
    if (!v9)
      goto LABEL_18;
    goto LABEL_17;
  }
  operator delete(__dst);
  if (v9)
  {
LABEL_17:
    LODWORD(__dst) = 1;
    sub_239FFAF84(&__p, __p, &__dst);
  }
LABEL_18:
  v41 = __p;
  v40 = v71;
  if (objc_msgSend_maximumSequenceLength(self->_configuration, v36, v37, v38, v39) >= (unint64_t)((v40 - v41) >> 2))
  {
    v55 = __p;
    v56 = &v71[4 * v66 - 4];
    v68 = 0;
    v69 = 0;
    __dst = 0;
    v57 = v56 - (_BYTE *)__p;
    if (v56 == __p)
    {
      v59 = 0;
      v58 = 0;
    }
    else
    {
      if (v57 < 0)
        sub_239FEBE68();
      v58 = (char *)operator new(v56 - (_BYTE *)__p);
      v59 = &v58[4 * (v57 >> 2)];
      memmove(v58, v55, v57);
    }
    v60 = objc_msgSend_maximumSequenceLength(self->_configuration, v42, v43, v44, v45);
    if (v60 >= (v59 - v58) >> 2)
      v61 = (v59 - v58) >> 2;
    else
      v61 = v60;
    NSLog(CFSTR("Tokenized query=%@ into %zu tokens."), v12, v61);
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    if (v61)
    {
      if (v61 < 0)
        sub_239FEBE68();
      v62 = 4 * v61;
      v63 = (unsigned int *)operator new(4 * v61);
      retstr->var0 = v63;
      v64 = &v63[v61];
      retstr->var2.var0 = v64;
      memcpy(v63, v58, v62);
      retstr->var1 = v64;
    }
    if (v58)
      operator delete(v58);
  }
  else
  {
    v46 = (void *)MEMORY[0x24BDD17C8];
    v47 = objc_msgSend_maximumSequenceLength(self->_configuration, v42, v43, v44, v45);
    objc_msgSend_stringWithFormat_(v46, v48, (uint64_t)CFSTR("input text exceeded max allowed length %zu"), v49, v50, v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v52, (uint64_t)v51, v53, v54);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  if (__p)
  {
    v71 = (char *)__p;
    operator delete(__p);
  }
LABEL_34:

  return result;
}

- (unordered_map<std::string,)_inputTokenTensorsWithTokenIDs:()std:()std:(std:(ik:(CSUVisualGenerationTextEncoderV1 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(vector<unsigned)int allocator<std:(std::allocator<unsigned int>> *)a4 :pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  _QWORD *v10;
  int32x2_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *var1;
  unsigned int *var0;
  uint64_t v19;
  float32x4_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  float32x4_t *v25;
  uint32x4_t *v26;
  uint64_t v27;
  float32x4_t v28;
  float *v29;
  uint64_t v30;
  unsigned int v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *result;
  std::runtime_error *exception;
  std::runtime_error *v45;
  const char *v46;
  uint64_t (**v47)();
  float32x4_t *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t (**v52)();
  int v53;
  void *v54;
  void *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  __int128 __p;
  _QWORD *v59;
  uint64_t (**v60)();
  void *v61;
  void *v62;
  std::__shared_weak_count *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v9 = objc_msgSend_maximumSequenceLength(self->_configuration, a3, (uint64_t)a4, v4, v5);
  v10 = operator new(0x10uLL);
  *v10 = 1;
  v10[1] = v9;
  *((_QWORD *)&__p + 1) = v10 + 2;
  v59 = v10 + 2;
  *(_QWORD *)&__p = v10;
  v11.i32[0] = 0;
  sub_239FFEAF8((int32x4_t **)&__p, (uint64_t)&v52, v11);
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (v53 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v56 + 24))(v56);
  (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)v56 + 32))(&__p);
  sub_239FFECB4(&v47, v12, (uint64_t)&__p);
  v47 = &off_250B0D558;
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  var0 = a4->var0;
  var1 = a4->var1;
  if (a4->var0 != var1)
  {
    if (v51 != 2)
    {
      v45 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v45, "Invalid number of indices provided.");
      __cxa_throw(v45, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
    v19 = 0;
    v20 = v48;
    v21 = *((_QWORD *)v49 + 1);
    v22 = (char *)var1 - (char *)var0 - 4;
    if (v22 < 0x1C)
      goto LABEL_13;
    if (v21 != 1)
      goto LABEL_13;
    v23 = (v22 >> 2) + 1;
    v19 = v23 & 0x7FFFFFFFFFFFFFF8;
    v24 = &var0[v23 & 0x7FFFFFFFFFFFFFF8];
    v25 = v48 + 1;
    v26 = (uint32x4_t *)(var0 + 4);
    v27 = v23 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v28 = vcvtq_f32_u32(*v26);
      v25[-1] = vcvtq_f32_u32(v26[-1]);
      *v25 = v28;
      v25 += 2;
      v26 += 2;
      v27 -= 8;
    }
    while (v27);
    var0 = v24;
    if (v23 != v19)
    {
LABEL_13:
      v29 = &v20->f32[v19 * v21];
      v30 = 4 * v21;
      do
      {
        v31 = *var0++;
        *v29 = (float)v31;
        v29 = (float *)((char *)v29 + v30);
      }
      while (var0 != var1);
    }
  }
  objc_msgSend_inputTextIDTensorName(self->_configuration, v13, v14, v15, v16);
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v46 = (const char *)objc_msgSend_UTF8String(v32, v33, v34, v35, v36);
  sub_23A044BA4((uint64_t)&__p, &v46, (uint64_t)&v52);
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = 1.0;
  sub_239FF6528((uint64_t)retstr, (uint64_t)&__p, &__p);
  v60 = &off_250B0DCE8;
  v37 = v63;
  if (v63)
  {
    p_shared_owners = (unint64_t *)&v63->__shared_owners_;
    do
      v39 = __ldaxr(p_shared_owners);
    while (__stlxr(v39 - 1, p_shared_owners));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  if (v61)
  {
    v62 = v61;
    operator delete(v61);
  }
  if (SHIBYTE(v59) < 0)
    operator delete((void *)__p);

  v47 = &off_250B0DD08;
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
  v52 = &off_250B0DCE8;
  v40 = v57;
  if (v57)
  {
    v41 = (unint64_t *)&v57->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  result = (unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *)v54;
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  return result;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SentencePieceVocabulary *v11;
  SentencePieceVocabulary *value;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  EspressoNet *v28;
  EspressoNet *v29;
  const char *v30;
  void **v31;
  void *v32;
  void **v33;
  void **v34;
  void *v35;
  void **v36;
  void *v38;
  void **v39;
  uint64_t v40;
  int v41;
  char v42;
  char v43;
  char v44;
  uint64_t v45;
  char v46;
  char v47;
  char v48;
  char v49;
  void *v50[2];
  void *v51[2];
  int v52;
  void *__p;
  char v54;
  const char *v55;
  EspressoNet *v56;

  if (!self->_textEncoderNet.__ptr_.__value_)
  {
    objc_msgSend_vocabularyModelPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v56 = (EspressoNet *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
    sub_23A059490((const char **)&v56, "eos", (uint64_t *)&v38);
    v11 = (SentencePieceVocabulary *)v38;
    v38 = 0;
    value = self->_vocabulary.__ptr_.__value_;
    self->_vocabulary.__ptr_.__value_ = v11;
    if (value)
    {
      (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
      v13 = v38;
      v38 = 0;
      if (v13)
        (*(void (**)(void *))(*(_QWORD *)v13 + 8))(v13);
    }

    v18 = objc_msgSend_espressoExecutionEngine(self->_configuration, v14, v15, v16, v17);
    objc_msgSend_textEncoderNetworkPath(self->_configuration, v19, v20, v21, v22);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v55 = (const char *)objc_msgSend_UTF8String(v23, v24, v25, v26, v27);
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = v18;
    v42 = 1;
    v43 = 0;
    v44 = 0;
    v45 = 0xFFFFFFFFLL;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    *(_OWORD *)v50 = 0u;
    *(_OWORD *)v51 = 0u;
    v52 = 1065353216;
    v54 = 0;
    LOBYTE(__p) = 0;
    sub_239FEE07C(&v55, (uint64_t)&v38, &v56);
    v28 = v56;
    v56 = 0;
    v29 = self->_textEncoderNet.__ptr_.__value_;
    self->_textEncoderNet.__ptr_.__value_ = v28;
    if (v29)
    {
      (*(void (**)(EspressoNet *))(*(_QWORD *)v29 + 8))(v29);
      v30 = (const char *)v56;
      v56 = 0;
      if (v30)
        (*(void (**)(const char *))(*(_QWORD *)v30 + 8))(v30);
    }
    if (v54 < 0)
      operator delete(__p);
    v31 = (void **)v51[0];
    if (v51[0])
    {
      do
      {
        v36 = (void **)*v31;
        if (*((char *)v31 + 39) < 0)
          operator delete(v31[2]);
        operator delete(v31);
        v31 = v36;
      }
      while (v36);
    }
    v32 = v50[0];
    v50[0] = 0;
    if (v32)
      operator delete(v32);
    v33 = (void **)v38;
    if (v38)
    {
      v34 = v39;
      v35 = v38;
      if (v39 != v38)
      {
        do
        {
          if (*((char *)v34 - 1) < 0)
            operator delete(*(v34 - 3));
          v34 -= 3;
        }
        while (v34 != v33);
        v35 = v38;
      }
      v39 = v33;
      operator delete(v35);
    }

  }
  return 1;
}

- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char Resources;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  const char *v35;
  int shouldReturnMask;
  void *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  id v54;
  uint64_t *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const void *v59;
  int64_t v60;
  CSUVisualGenerationTextEncoderV1NetworkOutput *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  size_t v72;
  void *v73;
  void **v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  size_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  const char *v94;
  void *HiddenLayer_PooledCLIPEmbedding_MaskIndices;
  uint64_t v96;
  id v97;
  uint64_t v98;
  id v99;
  void (**v100)(id, _QWORD, id);
  CSUVisualGenerationTextEncoderV1 *v101;
  void *v102[2];
  unint64_t v103;
  void *__dst[2];
  unint64_t v105;
  _QWORD v106[5];
  void *v107;
  void *v108;
  char *v109;
  void *__p;
  char *v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  void *v117;
  uint64_t *v118;
  uint64_t *v119;
  _BYTE *v120;
  _BYTE *v121;
  uint64_t v122;
  id v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v99 = a3;
  v100 = (void (**)(id, _QWORD, id))a4;
  v101 = self;
  v123 = 0;
  Resources = objc_msgSend_loadResources_(self, v6, (uint64_t)&v123, v7, v8);
  v10 = v123;
  if ((Resources & 1) == 0)
  {
    v100[2](v100, 0, v10);
    goto LABEL_42;
  }
  v120 = 0;
  v121 = 0;
  v122 = 0;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v11 = v99;
  v97 = v11;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v113, (uint64_t)v124, 16);
  if (!v13)
  {
    v54 = v10;
    goto LABEL_44;
  }
  v14 = 0;
  v15 = *(_QWORD *)v114;
  v98 = *(_QWORD *)v114;
  while (2)
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v114 != v15)
        objc_enumerationMutation(v11);
      v17 = *(id *)(*((_QWORD *)&v113 + 1) + 8 * v16);
      objc_msgSend_string(v17, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_count(v11, v23, v24, v25, v26);
      v112 = v10;
      objc_msgSend_getTokenIDsOnText_withBOS_withEOS_withError_(v101, v28, (uint64_t)v22, v14 == 0, v14 == v27 - 1, &v112);
      v29 = v112;

      if (v29)
      {
        v100[2](v100, 0, v29);
        v34 = (char *)__p;
        if (!__p)
          goto LABEL_10;
LABEL_9:
        v111 = v34;
        operator delete(v34);
        goto LABEL_10;
      }
      shouldReturnMask = objc_msgSend_shouldReturnMask(v17, v30, v31, v32, v33);
      v37 = v121;
      v38 = (char *)__p;
      v39 = v111;
      if (shouldReturnMask)
      {
        v40 = (v121 - v120) >> 2;
        v41 = v40 + ((v111 - (_BYTE *)__p) >> 2);
        v42 = v118;
        if (v118 < v119)
        {
          *v118 = v40;
          v42[1] = v41;
          v43 = v42 + 2;
          v15 = v98;
LABEL_29:
          v118 = v43;
          v37 = v121;
          v38 = (char *)__p;
          v39 = v111;
          goto LABEL_30;
        }
        v44 = v117;
        v45 = ((char *)v118 - (_BYTE *)v117) >> 4;
        v46 = v45 + 1;
        if ((unint64_t)(v45 + 1) >> 60)
          sub_239FEBE68();
        v47 = (char *)v119 - (_BYTE *)v117;
        if (((char *)v119 - (_BYTE *)v117) >> 3 > v46)
          v46 = v47 >> 3;
        if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
          v48 = 0xFFFFFFFFFFFFFFFLL;
        else
          v48 = v46;
        if (v48)
        {
          v96 = v40 + ((v111 - (_BYTE *)__p) >> 2);
          if (v48 >> 60)
            sub_239FF1A44();
          v49 = v48;
          v50 = (char *)operator new(16 * v48);
          v48 = v49;
          v51 = (uint64_t *)&v50[16 * v45];
          *v51 = v40;
          v51[1] = v96;
          v52 = v51;
          if (v42 != v44)
          {
LABEL_25:
            v11 = v97;
            v15 = v98;
            do
            {
              *((_OWORD *)v52 - 1) = *((_OWORD *)v42 - 1);
              v52 -= 2;
              v42 -= 2;
            }
            while (v42 != v44);
            v42 = v117;
            v43 = v51 + 2;
            v117 = v52;
            v118 = v51 + 2;
            v119 = (uint64_t *)&v50[16 * v48];
            if (!v42)
              goto LABEL_29;
LABEL_28:
            operator delete(v42);
            goto LABEL_29;
          }
        }
        else
        {
          v50 = 0;
          v51 = (uint64_t *)(16 * v45);
          *v51 = v40;
          v51[1] = v41;
          v52 = (uint64_t *)(16 * v45);
          if (v42 != v44)
            goto LABEL_25;
        }
        v11 = v97;
        v15 = v98;
        v43 = v51 + 2;
        v117 = v52;
        v118 = v51 + 2;
        v119 = (uint64_t *)&v50[16 * v48];
        if (!v42)
          goto LABEL_29;
        goto LABEL_28;
      }
LABEL_30:
      sub_239FFEEB0((unint64_t *)&v120, v37, v38, v39, (v39 - v38) >> 2);
      ++v14;
      v34 = (char *)__p;
      if (__p)
        goto LABEL_9;
LABEL_10:

      if (v29)
      {

        v10 = v29;
        v55 = (uint64_t *)v117;
        if (!v117)
          goto LABEL_40;
        goto LABEL_39;
      }
      v10 = 0;
      ++v16;
    }
    while (v16 != v13);
    v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v35, (uint64_t)&v113, (uint64_t)v124, 16);
    v13 = v53;
    v10 = 0;
    v54 = 0;
    if (v53)
      continue;
    break;
  }
LABEL_44:

  v108 = 0;
  v109 = 0;
  v107 = 0;
  v59 = v120;
  v60 = v121 - v120;
  if (v121 != v120)
  {
    if (v60 < 0)
      sub_239FEBE68();
    v107 = operator new(v121 - v120);
    v109 = (char *)v107 + 4 * (v60 >> 2);
    memcpy(v107, v59, v60);
    v108 = v109;
  }
  objc_msgSend__inputTokenTensorsWithTokenIDs_(v101, v56, (uint64_t)&v107, v57, v58, v96);
  if (v107)
  {
    v108 = v107;
    operator delete(v107);
  }
  sub_239FF1424((uint64_t)v101->_textEncoderNet.__ptr_.__value_, (uint64_t)&__p, (uint64_t)v106);
  v61 = [CSUVisualGenerationTextEncoderV1NetworkOutput alloc];
  objc_msgSend_outputLastHiddenState(v101->_configuration, v62, v63, v64, v65);
  v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v71 = (const char *)objc_msgSend_UTF8String(v66, v67, v68, v69, v70);
  v72 = strlen(v71);
  if (v72 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v73 = (void *)v72;
  if (v72 >= 0x17)
  {
    v75 = (v72 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v72 | 7) != 0x17)
      v75 = v72 | 7;
    v76 = v75 + 1;
    v74 = (void **)operator new(v75 + 1);
    __dst[1] = v73;
    v105 = v76 | 0x8000000000000000;
    __dst[0] = v74;
    goto LABEL_56;
  }
  HIBYTE(v105) = v72;
  v74 = __dst;
  if (v72)
LABEL_56:
    memmove(v74, v71, (size_t)v73);
  *((_BYTE *)v73 + (_QWORD)v74) = 0;
  v81 = sub_239FF34DC(v106, (uint64_t)__dst);
  if (!v81)
    sub_239FF1D10("unordered_map::at: key not found");
  objc_msgSend_outputCLIPPooledLayer(v101->_configuration, v77, v78, v79, v80);
  v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v87 = (const char *)objc_msgSend_UTF8String(v82, v83, v84, v85, v86);
  v88 = strlen(v87);
  if (v88 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v89 = (void *)v88;
  if (v88 >= 0x17)
  {
    v91 = (v88 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v88 | 7) != 0x17)
      v91 = v88 | 7;
    v92 = v91 + 1;
    v90 = operator new(v91 + 1);
    v102[1] = v89;
    v103 = v92 | 0x8000000000000000;
    v102[0] = v90;
    goto LABEL_65;
  }
  HIBYTE(v103) = v88;
  v90 = v102;
  if (v88)
LABEL_65:
    memmove(v90, v87, (size_t)v89);
  *((_BYTE *)v89 + (_QWORD)v90) = 0;
  v93 = sub_239FF34DC(v106, (uint64_t)v102);
  if (!v93)
    sub_239FF1D10("unordered_map::at: key not found");
  HiddenLayer_PooledCLIPEmbedding_MaskIndices = (void *)objc_msgSend_initWithLastHiddenLayer_PooledCLIPEmbedding_MaskIndices_(v61, v94, (uint64_t)(v81 + 5), (uint64_t)(v93 + 5), (uint64_t)&v117);
  if (SHIBYTE(v103) < 0)
    operator delete(v102[0]);

  if (SHIBYTE(v105) < 0)
    operator delete(__dst[0]);

  ((void (**)(id, void *, id))v100)[2](v100, HiddenLayer_PooledCLIPEmbedding_MaskIndices, v54);
  sub_239FF5234((uint64_t)v106);
  sub_239FF5234((uint64_t)&__p);
  v10 = v54;
  v55 = (uint64_t *)v117;
  if (v117)
  {
LABEL_39:
    v118 = v55;
    operator delete(v55);
  }
LABEL_40:
  if (v120)
  {
    v121 = v120;
    operator delete(v120);
  }
LABEL_42:

}

- (void)runOnInput:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend__unsafeRunOnInput_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);

}

- (CSUVisualGenerationTextEncoderV1Configuration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  SentencePieceVocabulary *value;
  EspressoNet *v4;
  EspressoNet *v5;

  objc_storeStrong((id *)&self->_configuration, 0);
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
  v4 = self->_textEncoderNet.__ptr_.__value_;
  self->_textEncoderNet.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(EspressoNet *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->_tokenEmbeddingNet.__ptr_.__value_;
  self->_tokenEmbeddingNet.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(EspressoNet *))(*(_QWORD *)v5 + 8))(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
