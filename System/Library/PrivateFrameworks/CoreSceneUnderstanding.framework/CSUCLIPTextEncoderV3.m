@implementation CSUCLIPTextEncoderV3

- (CSUCLIPTextEncoderV3)initWithConfiguration:(id)a3
{
  id v5;
  CSUCLIPTextEncoderV3 *v6;
  CSUCLIPTextEncoderV3 *v7;
  CSUCLIPTextEncoderV3 *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUCLIPTextEncoderV3;
  v6 = -[CSUCLIPTextEncoderV3 init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (unordered_map<std::string,)_inputTokenTensorsWithTextBatch:()std:()std:(std:(ik:(CSUCLIPTextEncoderV3 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  int32x2_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  int32x2_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  SentencePieceVocabulary *value;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  size_t v54;
  const char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  unsigned int *v61;
  int v62;
  SentencePieceVocabulary *v63;
  char *v64;
  uint64_t v65;
  SentencePieceVocabulary *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unsigned int *v78;
  _DWORD *v79;
  uint64_t v80;
  float *v81;
  unsigned int v82;
  unint64_t v83;
  _OWORD *v84;
  uint32x4_t *v85;
  float32x4_t *v86;
  uint64_t v87;
  float32x4_t v88;
  id v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  std::__shared_weak_count *v103;
  unint64_t *p_shared_owners;
  unint64_t v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  std::__shared_weak_count *v109;
  unint64_t *v110;
  unint64_t v111;
  std::__shared_weak_count *v112;
  unint64_t *v113;
  unint64_t v114;
  unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *result;
  std::runtime_error *v116;
  std::runtime_error *exception;
  unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *v118;
  unint64_t v119;
  id v120;
  const char *v121;
  const char *__dst[2];
  unint64_t v123;
  uint64_t (**v124)();
  uint64_t v125;
  void *__p;
  void *v127;
  uint64_t v128;
  uint64_t (**v129)();
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  _QWORD v134[2];
  void *v135;
  void *v136;
  std::__shared_weak_count *v137;
  _QWORD v138[2];
  void *v139;
  void *v140;
  std::__shared_weak_count *v141;
  __int128 v142;
  _QWORD *v143;
  uint64_t (**v144)();
  void *v145;
  void *v146;
  std::__shared_weak_count *v147;
  __int128 v148;
  char v149;
  uint64_t (**v150)();
  void *v151;
  void *v152;
  std::__shared_weak_count *v153;
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v120 = a4;
  if (!self->_vocabulary.__ptr_.__value_)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tokenizer called before initializing vocabulary");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v119 = objc_msgSend_maximumSequenceLength(self->_configuration, v6, v7, v8, v9);
  v14 = objc_msgSend_count(v120, v10, v11, v12, v13);
  v15 = operator new(0x10uLL);
  *v15 = v14;
  v15[1] = v119;
  *((_QWORD *)&v142 + 1) = v15 + 2;
  v143 = v15 + 2;
  *(_QWORD *)&v142 = v15;
  v16.i32[0] = 0;
  sub_239FFEAF8((int32x4_t **)&v142, (uint64_t)v138, v16);
  v118 = retstr;
  if ((_QWORD)v142)
  {
    *((_QWORD *)&v142 + 1) = v142;
    operator delete((void *)v142);
  }
  v21 = objc_msgSend_count(v120, v17, v18, v19, v20);
  *((_QWORD *)&v142 + 1) = 0;
  v22 = operator new(8uLL);
  *v22 = v21;
  *(_QWORD *)&v142 = v22;
  v143 = v22 + 1;
  v23 = operator new(0x10uLL);
  *v23 = v21;
  v23[1] = v119;
  v24 = v23 + 2;
  *(_QWORD *)&v142 = v23;
  *((_QWORD *)&v142 + 1) = v23 + 2;
  v143 = v23 + 2;
  operator delete(v22);
  *((_QWORD *)&v142 + 1) = v24;
  v25.i32[0] = 1.0;
  sub_239FFEAF8((int32x4_t **)&v142, (uint64_t)v134, v25);
  if ((_QWORD)v142)
  {
    *((_QWORD *)&v142 + 1) = v142;
    operator delete((void *)v142);
  }
  sub_23A043518(&v129, (uint64_t)v138);
  sub_23A043518(&v124, (uint64_t)v134);
  v34 = objc_msgSend_count(v120, v26, v27, v28, v29);
  if (v34)
  {
    v35 = 0;
    v36 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v120, v30, v36, v32, v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_inputIsLowerCase(self->_configuration, v38, v39, v40, v41))
      {
        objc_msgSend_lowercaseString(v37, v42, v43, v44, v45);
        v46 = objc_claimAutoreleasedReturnValue();

        v37 = (void *)v46;
      }
      value = self->_vocabulary.__ptr_.__value_;
      v48 = objc_retainAutorelease(v37);
      v53 = (const char *)objc_msgSend_UTF8String(v48, v49, v50, v51, v52);
      v54 = strlen(v53);
      if (v54 >= 0x7FFFFFFFFFFFFFF8)
        sub_239FEBDE0();
      v55 = (const char *)v54;
      if (v54 >= 0x17)
        break;
      HIBYTE(v123) = v54;
      v56 = (char *)__dst;
      if (v54)
        goto LABEL_17;
LABEL_18:
      v55[(_QWORD)v56] = 0;
      (*(void (**)(__int128 *__return_ptr, SentencePieceVocabulary *, const char **, _QWORD))(*(_QWORD *)value + 16))(&v142, value, __dst, 0);
      v59 = v142;
      v143 = 0;
      v142 = 0uLL;
      if (SHIBYTE(v123) < 0)
        operator delete((void *)__dst[0]);
      if (v119 >= (uint64_t)(*((_QWORD *)&v59 + 1) - v59) >> 2)
        v60 = (uint64_t)(*((_QWORD *)&v59 + 1) - v59) >> 2;
      else
        v60 = v119;
      v61 = (unsigned int *)(v59 + 4 * v60);
      v63 = self->_vocabulary.__ptr_.__value_;
      if (*((char *)v63 + 55) < 0)
      {
        v64 = (char *)*((_QWORD *)v63 + 4);
        v65 = *((_QWORD *)v63 + 5);
      }
      else
      {
        v64 = (char *)v63 + 32;
        v65 = *((unsigned __int8 *)v63 + 55);
      }
      v62 = *(v61 - 1);
      if (v62 != (*(unsigned int (**)(SentencePieceVocabulary *, char *, uint64_t))(*(_QWORD *)v63 + 32))(v63, v64, v65))
      {
        v66 = self->_vocabulary.__ptr_.__value_;
        if (*((char *)v66 + 55) < 0)
        {
          v67 = (char *)*((_QWORD *)v66 + 4);
          v68 = *((_QWORD *)v66 + 5);
        }
        else
        {
          v67 = (char *)v66 + 32;
          v68 = *((unsigned __int8 *)v66 + 55);
        }
        *(v61 - 1) = (*(uint64_t (**)(SentencePieceVocabulary *, char *, uint64_t))(*(_QWORD *)v66 + 32))(v66, v67, v68);
      }
      NSLog(CFSTR("Tokenized query=%@ into %zu tokens."), v48, v60);
      if (!v60)
      {
LABEL_39:
        operator delete((void *)v59);
        goto LABEL_40;
      }
      if (v133 != 2)
      {
        v116 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v116, "Invalid number of indices provided.");
        goto LABEL_89;
      }
      v69 = v130;
      v70 = *(_QWORD *)v131;
      v71 = *(_QWORD *)v131 * v36;
      if (v128 != 2)
      {
        *(float *)(v130 + 4 * v71) = (float)*(unsigned int *)v59;
        v116 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v116, "Invalid number of indices provided.");
LABEL_89:
        __cxa_throw(v116, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      v72 = v125;
      v73 = *((_QWORD *)v131 + 1);
      v75 = *(_QWORD *)__p;
      v74 = *((_QWORD *)__p + 1);
      v76 = (v60 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      if (v76 < 0xB)
      {
LABEL_35:
        v77 = 0;
        v78 = (unsigned int *)v59;
LABEL_36:
        v79 = (_DWORD *)(v72 + 4 * (v77 * v74 + v75 * v36));
        v80 = 4 * v74;
        v81 = (float *)(v69 + 4 * (v77 * v73 + v71));
        do
        {
          v82 = *v78++;
          *v81 = (float)v82;
          *v79 = 0;
          v79 = (_DWORD *)((char *)v79 + v80);
          v81 += v73;
        }
        while (v78 != v61);
        goto LABEL_38;
      }
      v77 = 0;
      v78 = (unsigned int *)v59;
      if (v73 != 1 || v74 != 1)
        goto LABEL_36;
      if ((unint64_t)(v125 + v75 * 4 * v36 - (v130 + v70 * 4 * v36)) < 0x20)
        goto LABEL_35;
      v83 = v76 + 1;
      v77 = v83 & 0x7FFFFFFFFFFFFFF8;
      v78 = (unsigned int *)(v59 + 4 * (v83 & 0x7FFFFFFFFFFFFFF8));
      v84 = (_OWORD *)(v125 + v75 * v35 + 16);
      v85 = (uint32x4_t *)(v59 + 16);
      v86 = (float32x4_t *)(v130 + v70 * v35 + 16);
      v87 = v83 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v88 = vcvtq_f32_u32(*v85);
        v86[-1] = vcvtq_f32_u32(v85[-1]);
        *v86 = v88;
        *(v84 - 1) = 0uLL;
        *v84 = 0uLL;
        v84 += 2;
        v85 += 2;
        v86 += 2;
        v87 -= 8;
      }
      while (v87);
      if (v83 != v77)
        goto LABEL_36;
LABEL_38:
      if ((_QWORD)v59)
        goto LABEL_39;
LABEL_40:

      ++v36;
      v35 += 4;
      if (v36 == v34)
        goto LABEL_49;
    }
    v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v54 | 7) != 0x17)
      v57 = v54 | 7;
    v58 = v57 + 1;
    v56 = (char *)operator new(v57 + 1);
    __dst[1] = v55;
    v123 = v58 | 0x8000000000000000;
    __dst[0] = v56;
LABEL_17:
    memmove(v56, v53, (size_t)v55);
    goto LABEL_18;
  }
LABEL_49:
  objc_msgSend_inputTextIDTensorName(self->_configuration, v30, v31, v32, v33);
  v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  __dst[0] = (const char *)objc_msgSend_UTF8String(v89, v90, v91, v92, v93);
  sub_23A044BA4((uint64_t)&v142, __dst, (uint64_t)v138);
  objc_msgSend_inputTextIDMaskTensorName(self->_configuration, v94, v95, v96, v97);
  v98 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v121 = (const char *)objc_msgSend_UTF8String(v98, v99, v100, v101, v102);
  sub_23A044BA4((uint64_t)&v148, &v121, (uint64_t)v134);
  v118->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&v118->__table_.__p1_.__value_.__next_ = 0u;
  v118->__table_.__p3_.__value_ = 1.0;
  sub_239FF6528((uint64_t)v118, (uint64_t)&v142, &v142);
  sub_239FF6528((uint64_t)v118, (uint64_t)&v148, &v148);
  v150 = &off_250B0DCE8;
  v103 = v153;
  if (v153)
  {
    p_shared_owners = (unint64_t *)&v153->__shared_owners_;
    do
      v105 = __ldaxr(p_shared_owners);
    while (__stlxr(v105 - 1, p_shared_owners));
    if (!v105)
    {
      ((void (*)(std::__shared_weak_count *))v103->__on_zero_shared)(v103);
      std::__shared_weak_count::__release_weak(v103);
    }
  }
  if (v151)
  {
    v152 = v151;
    operator delete(v151);
  }
  if (v149 < 0)
    operator delete((void *)v148);
  v144 = &off_250B0DCE8;
  v106 = v147;
  if (v147)
  {
    v107 = (unint64_t *)&v147->__shared_owners_;
    do
      v108 = __ldaxr(v107);
    while (__stlxr(v108 - 1, v107));
    if (!v108)
    {
      ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
      std::__shared_weak_count::__release_weak(v106);
    }
  }
  if (v145)
  {
    v146 = v145;
    operator delete(v145);
  }
  if (SHIBYTE(v143) < 0)
    operator delete((void *)v142);

  v124 = &off_250B0DD08;
  if (__p)
  {
    v127 = __p;
    operator delete(__p);
  }
  v129 = &off_250B0DD08;
  if (v131)
  {
    v132 = v131;
    operator delete(v131);
  }
  v134[0] = &off_250B0DCE8;
  v109 = v137;
  if (v137)
  {
    v110 = (unint64_t *)&v137->__shared_owners_;
    do
      v111 = __ldaxr(v110);
    while (__stlxr(v111 - 1, v110));
    if (!v111)
    {
      ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
      std::__shared_weak_count::__release_weak(v109);
    }
  }
  if (v135)
  {
    v136 = v135;
    operator delete(v135);
  }
  v138[0] = &off_250B0DCE8;
  v112 = v141;
  if (v141)
  {
    v113 = (unint64_t *)&v141->__shared_owners_;
    do
      v114 = __ldaxr(v113);
    while (__stlxr(v114 - 1, v113));
    if (!v114)
    {
      ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
      std::__shared_weak_count::__release_weak(v112);
    }
  }
  if (v139)
  {
    v140 = v139;
    operator delete(v139);
  }

  return result;
}

- (unordered_map<std::string,)_inputTokenTensorsWithText:()std:()std:(std:(ik:(CSUCLIPTextEncoderV3 *)self :(SEL)a3 Tensor>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *result;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v13[0] = v5;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, (uint64_t)v13, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__inputTokenTensorsWithTextBatch_(self, v9, (uint64_t)v8, v10, v11);

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
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  EspressoNet *v27;
  EspressoNet *v28;
  const char *v29;
  void **v30;
  void *v31;
  void **v32;
  void **v33;
  void *v34;
  void **v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  EspressoNet *v49;
  EspressoNet *v50;
  const char *v51;
  void **v52;
  void *v53;
  void **v54;
  void **v55;
  void *v56;
  void **v57;
  void *v59;
  void **v60;
  uint64_t v61;
  int v62;
  char v63;
  char v64;
  char v65;
  uint64_t v66;
  char v67;
  char v68;
  char v69;
  char v70;
  void *v71[2];
  void *v72[2];
  int v73;
  void *__p;
  char v75;
  const char *v76;
  EspressoNet *v77;

  if (!self->_textEncoderNet.__ptr_.__value_)
  {
    objc_msgSend_vocabularyModelPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v77 = (EspressoNet *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
    sub_23A043ABC((const char **)&v77, "bos:eos", (uint64_t *)&v59);
    v11 = (SentencePieceVocabulary *)v59;
    v59 = 0;
    value = self->_vocabulary.__ptr_.__value_;
    self->_vocabulary.__ptr_.__value_ = v11;
    if (value)
    {
      (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
      v13 = v59;
      v59 = 0;
      if (v13)
        (*(void (**)(void *))(*(_QWORD *)v13 + 8))(v13);
    }

    objc_msgSend_tokenEmbeddingNetworkPath(self->_configuration, v14, v15, v16, v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v76 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = objc_msgSend_espressoExecutionEngine(self->_configuration, v23, v24, v25, v26);
    v63 = 1;
    v64 = 0;
    v65 = 0;
    v66 = 0xFFFFFFFFLL;
    v67 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    *(_OWORD *)v71 = 0u;
    *(_OWORD *)v72 = 0u;
    v73 = 1065353216;
    v75 = 0;
    LOBYTE(__p) = 0;
    sub_239FEE07C(&v76, (uint64_t)&v59, &v77);
    v27 = v77;
    v77 = 0;
    v28 = self->_tokenEmbeddingNet.__ptr_.__value_;
    self->_tokenEmbeddingNet.__ptr_.__value_ = v27;
    if (v28)
    {
      (*(void (**)(EspressoNet *))(*(_QWORD *)v28 + 8))(v28);
      v29 = (const char *)v77;
      v77 = 0;
      if (v29)
        (*(void (**)(const char *))(*(_QWORD *)v29 + 8))(v29);
    }
    if (v75 < 0)
      operator delete(__p);
    v30 = (void **)v72[0];
    if (v72[0])
    {
      do
      {
        v35 = (void **)*v30;
        if (*((char *)v30 + 39) < 0)
          operator delete(v30[2]);
        operator delete(v30);
        v30 = v35;
      }
      while (v35);
    }
    v31 = v71[0];
    v71[0] = 0;
    if (v31)
      operator delete(v31);
    v32 = (void **)v59;
    if (v59)
    {
      v33 = v60;
      v34 = v59;
      if (v60 != v59)
      {
        do
        {
          if (*((char *)v33 - 1) < 0)
            operator delete(*(v33 - 3));
          v33 -= 3;
        }
        while (v33 != v32);
        v34 = v59;
      }
      v60 = v32;
      operator delete(v34);
    }

    objc_msgSend_textEncoderNetworkPath(self->_configuration, v36, v37, v38, v39);
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v76 = (const char *)objc_msgSend_UTF8String(v40, v41, v42, v43, v44);
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = objc_msgSend_espressoExecutionEngine(self->_configuration, v45, v46, v47, v48);
    v63 = 1;
    v64 = 0;
    v65 = 0;
    v66 = 0xFFFFFFFFLL;
    v67 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    *(_OWORD *)v71 = 0u;
    *(_OWORD *)v72 = 0u;
    v73 = 1065353216;
    v75 = 0;
    LOBYTE(__p) = 0;
    sub_239FEE07C(&v76, (uint64_t)&v59, &v77);
    v49 = v77;
    v77 = 0;
    v50 = self->_textEncoderNet.__ptr_.__value_;
    self->_textEncoderNet.__ptr_.__value_ = v49;
    if (v50)
    {
      (*(void (**)(EspressoNet *))(*(_QWORD *)v50 + 8))(v50);
      v51 = (const char *)v77;
      v77 = 0;
      if (v51)
        (*(void (**)(const char *))(*(_QWORD *)v51 + 8))(v51);
    }
    if (v75 < 0)
      operator delete(__p);
    v52 = (void **)v72[0];
    if (v72[0])
    {
      do
      {
        v57 = (void **)*v52;
        if (*((char *)v52 + 39) < 0)
          operator delete(v52[2]);
        operator delete(v52);
        v52 = v57;
      }
      while (v57);
    }
    v53 = v71[0];
    v71[0] = 0;
    if (v53)
      operator delete(v53);
    v54 = (void **)v59;
    if (v59)
    {
      v55 = v60;
      v56 = v59;
      if (v60 != v59)
      {
        do
        {
          if (*((char *)v55 - 1) < 0)
            operator delete(*(v55 - 3));
          v55 -= 3;
        }
        while (v55 != v54);
        v56 = v59;
      }
      v60 = v54;
      operator delete(v56);
    }

  }
  return 1;
}

- (void)_unsafeRunOnInputText:(id)a3 completion:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  size_t v23;
  size_t v24;
  __int128 *p_dst;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  _BYTE *v30;
  _BYTE *v31;
  int64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  size_t v46;
  size_t v47;
  __int128 *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  _BYTE *v53;
  _BYTE *v54;
  int64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  EspressoNet *value;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  size_t v70;
  size_t v71;
  void *p_p;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  size_t v85;
  size_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  CSUCLIPTextEncoderV3NetworkOutput *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  const char *v115;
  void *v116;
  std::__shared_weak_count *v117;
  unint64_t *v118;
  unint64_t v119;
  std::__shared_weak_count *v120;
  unint64_t *v121;
  unint64_t v122;
  id v123;
  void (**v124)(id, _QWORD, id);
  __int128 v125;
  unint64_t v126;
  __int128 __p;
  unint64_t v128;
  _OWORD v129[2];
  int v130;
  _QWORD v131[5];
  uint64_t (**v132)();
  int v133;
  void *v134;
  void *v135;
  char *v136;
  uint64_t v137;
  std::__shared_weak_count *v138;
  uint64_t (**v139)();
  int v140;
  void *v141;
  void *v142;
  char *v143;
  uint64_t v144;
  std::__shared_weak_count *v145;
  _QWORD v146[5];
  _BYTE v147[40];
  id v148;
  __int128 __dst;
  unint64_t v150;
  uint64_t (**v151)();
  void *v152;
  void *v153;
  std::__shared_weak_count *v154;
  __int128 v155;
  char v156;
  uint64_t (**v157)();
  void *v158;
  void *v159;
  std::__shared_weak_count *v160;
  uint64_t v161;

  v161 = *MEMORY[0x24BDAC8D0];
  v123 = a3;
  v124 = (void (**)(id, _QWORD, id))a4;
  v148 = 0;
  LOBYTE(a4) = objc_msgSend_loadResources_(self, v6, (uint64_t)&v148, v7, v8);
  v12 = v148;
  if ((a4 & 1) == 0)
  {
    v124[2](v124, 0, v12);
    goto LABEL_88;
  }
  objc_msgSend__inputTokenTensorsWithText_(self, v9, (uint64_t)v123, v10, v11);
  sub_239FF1424((uint64_t)self->_tokenEmbeddingNet.__ptr_.__value_, (uint64_t)v147, (uint64_t)v146);
  objc_msgSend_outputTokenEmbeddingIDTensorName(self->_configuration, v13, v14, v15, v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
  v23 = strlen(v22);
  if (v23 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v24 = v23;
  if (v23 >= 0x17)
  {
    v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v23 | 7) != 0x17)
      v26 = v23 | 7;
    v27 = v26 + 1;
    p_dst = (__int128 *)operator new(v26 + 1);
    *((_QWORD *)&__dst + 1) = v24;
    v150 = v27 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v150) = v23;
  p_dst = &__dst;
  if (v23)
LABEL_10:
    memmove(p_dst, v22, v24);
  *((_BYTE *)p_dst + v24) = 0;
  v28 = sub_239FF2E64(v146, (uint64_t)&__dst);
  v29 = v28;
  if (!v28)
    sub_239FF1D10("unordered_map::at: key not found");
  v139 = &off_250B0DCE8;
  v140 = *((_DWORD *)v28 + 12);
  v142 = 0;
  v143 = 0;
  v141 = 0;
  v31 = (_BYTE *)v28[7];
  v30 = (_BYTE *)v28[8];
  v32 = v30 - v31;
  if (v30 != v31)
  {
    if (v32 < 0)
      sub_239FEBE68();
    v141 = operator new(v30 - v31);
    v143 = (char *)v141 + 8 * (v32 >> 3);
    memcpy(v141, v31, v32);
    v142 = v143;
  }
  v33 = (std::__shared_weak_count *)v29[11];
  v144 = v29[10];
  v145 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldxr(p_shared_owners);
    while (__stxr(v35 + 1, p_shared_owners));
  }
  v139 = &off_250B0DB88;
  if (SHIBYTE(v150) < 0)
    operator delete((void *)__dst);

  objc_msgSend_outputTokenEmbeddingMaskTensorName(self->_configuration, v36, v37, v38, v39);
  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v45 = (const char *)objc_msgSend_UTF8String(v40, v41, v42, v43, v44);
  v46 = strlen(v45);
  if (v46 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v47 = v46;
  if (v46 >= 0x17)
  {
    v49 = (v46 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v46 | 7) != 0x17)
      v49 = v46 | 7;
    v50 = v49 + 1;
    v48 = (__int128 *)operator new(v49 + 1);
    *((_QWORD *)&__dst + 1) = v47;
    v150 = v50 | 0x8000000000000000;
    *(_QWORD *)&__dst = v48;
    goto LABEL_27;
  }
  HIBYTE(v150) = v46;
  v48 = &__dst;
  if (v46)
LABEL_27:
    memmove(v48, v45, v47);
  *((_BYTE *)v48 + v47) = 0;
  v51 = sub_239FF2E64(v146, (uint64_t)&__dst);
  v52 = v51;
  if (!v51)
    sub_239FF1D10("unordered_map::at: key not found");
  v132 = &off_250B0DCE8;
  v133 = *((_DWORD *)v51 + 12);
  v135 = 0;
  v136 = 0;
  v134 = 0;
  v54 = (_BYTE *)v51[7];
  v53 = (_BYTE *)v51[8];
  v55 = v53 - v54;
  if (v53 != v54)
  {
    if (v55 < 0)
      sub_239FEBE68();
    v134 = operator new(v53 - v54);
    v136 = (char *)v134 + 8 * (v55 >> 3);
    memcpy(v134, v54, v55);
    v135 = v136;
  }
  v56 = (std::__shared_weak_count *)v52[11];
  v137 = v52[10];
  v138 = v56;
  if (v56)
  {
    v57 = (unint64_t *)&v56->__shared_owners_;
    do
      v58 = __ldxr(v57);
    while (__stxr(v58 + 1, v57));
  }
  v132 = &off_250B0DB88;
  if (SHIBYTE(v150) < 0)
    operator delete((void *)__dst);

  value = self->_textEncoderNet.__ptr_.__value_;
  objc_msgSend_inputTokenEmbeddingIDTensorName(self->_configuration, v60, v61, v62, v63);
  v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v69 = (const char *)objc_msgSend_UTF8String(v64, v65, v66, v67, v68);
  v70 = strlen(v69);
  if (v70 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v71 = v70;
  if (v70 >= 0x17)
  {
    v73 = (v70 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v70 | 7) != 0x17)
      v73 = v70 | 7;
    v74 = v73 + 1;
    p_p = operator new(v73 + 1);
    *((_QWORD *)&__p + 1) = v71;
    v128 = v74 | 0x8000000000000000;
    *(_QWORD *)&__p = p_p;
    goto LABEL_44;
  }
  HIBYTE(v128) = v70;
  p_p = &__p;
  if (v70)
LABEL_44:
    memmove(p_p, v69, v71);
  *((_BYTE *)p_p + v71) = 0;
  sub_23A044D00((uint64_t)&__dst, &__p, (uint64_t)&v139);
  objc_msgSend_inputTokenEmbeddingMaskTensorName(self->_configuration, v75, v76, v77, v78);
  v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v84 = (const char *)objc_msgSend_UTF8String(v79, v80, v81, v82, v83);
  v85 = strlen(v84);
  if (v85 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v86 = v85;
  if (v85 >= 0x17)
  {
    v88 = (v85 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v85 | 7) != 0x17)
      v88 = v85 | 7;
    v89 = v88 + 1;
    v87 = operator new(v88 + 1);
    *((_QWORD *)&v125 + 1) = v86;
    v126 = v89 | 0x8000000000000000;
    *(_QWORD *)&v125 = v87;
  }
  else
  {
    HIBYTE(v126) = v85;
    v87 = &v125;
    if (!v85)
      goto LABEL_53;
  }
  memmove(v87, v84, v86);
LABEL_53:
  *((_BYTE *)v87 + v86) = 0;
  sub_23A044D00((uint64_t)&v155, &v125, (uint64_t)&v132);
  memset(v129, 0, sizeof(v129));
  v130 = 1065353216;
  sub_239FF6528((uint64_t)v129, (uint64_t)&__dst, &__dst);
  sub_239FF6528((uint64_t)v129, (uint64_t)&v155, &v155);
  sub_239FF1424((uint64_t)value, (uint64_t)v129, (uint64_t)v131);
  sub_239FF5234((uint64_t)v129);
  v157 = &off_250B0DCE8;
  v90 = v160;
  if (v160)
  {
    v91 = (unint64_t *)&v160->__shared_owners_;
    do
      v92 = __ldaxr(v91);
    while (__stlxr(v92 - 1, v91));
    if (!v92)
    {
      ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
      std::__shared_weak_count::__release_weak(v90);
    }
  }
  if (v158)
  {
    v159 = v158;
    operator delete(v158);
  }
  if (v156 < 0)
    operator delete((void *)v155);
  v151 = &off_250B0DCE8;
  v93 = v154;
  if (v154)
  {
    v94 = (unint64_t *)&v154->__shared_owners_;
    do
      v95 = __ldaxr(v94);
    while (__stlxr(v95 - 1, v94));
    if (!v95)
    {
      ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
      std::__shared_weak_count::__release_weak(v93);
    }
  }
  if (v152)
  {
    v153 = v152;
    operator delete(v152);
  }
  if (SHIBYTE(v150) < 0)
  {
    operator delete((void *)__dst);
    if ((SHIBYTE(v126) & 0x80000000) == 0)
      goto LABEL_71;
LABEL_90:
    operator delete((void *)v125);
    goto LABEL_71;
  }
  if (SHIBYTE(v126) < 0)
    goto LABEL_90;
LABEL_71:

  if (SHIBYTE(v128) < 0)
    operator delete((void *)__p);

  v96 = [CSUCLIPTextEncoderV3NetworkOutput alloc];
  objc_msgSend_outputTokenEmbeddingIDTensorName(self->_configuration, v97, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23A044684(v146, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputTokenEmbeddingMaskTensorName(self->_configuration, v103, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23A044684(v146, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputTextEmbeddingTensorName(self->_configuration, v109, v110, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23A044684(v131, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)objc_msgSend_initWithTokenEmbeddingIDs_tokenEmbeddingMask_clipTextEmbedding_(v96, v115, (uint64_t)v102, (uint64_t)v108, (uint64_t)v114);

  ((void (**)(id, void *, id))v124)[2](v124, v116, v12);
  sub_239FF5234((uint64_t)v131);
  v132 = &off_250B0DCE8;
  v117 = v138;
  if (v138)
  {
    v118 = (unint64_t *)&v138->__shared_owners_;
    do
      v119 = __ldaxr(v118);
    while (__stlxr(v119 - 1, v118));
    if (!v119)
    {
      ((void (*)(std::__shared_weak_count *))v117->__on_zero_shared)(v117);
      std::__shared_weak_count::__release_weak(v117);
    }
  }
  if (v134)
  {
    v135 = v134;
    operator delete(v134);
  }
  v139 = &off_250B0DCE8;
  v120 = v145;
  if (v145)
  {
    v121 = (unint64_t *)&v145->__shared_owners_;
    do
      v122 = __ldaxr(v121);
    while (__stlxr(v122 - 1, v121));
    if (!v122)
    {
      ((void (*)(std::__shared_weak_count *))v120->__on_zero_shared)(v120);
      std::__shared_weak_count::__release_weak(v120);
    }
  }
  if (v141)
  {
    v142 = v141;
    operator delete(v141);
  }
  sub_239FF5234((uint64_t)v146);
  sub_239FF5234((uint64_t)v147);
LABEL_88:

}

- (void)runOnInputText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend__unsafeRunOnInputText_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);

}

- (CSUCLIPTextEncoderV3Configuration)configuration
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
