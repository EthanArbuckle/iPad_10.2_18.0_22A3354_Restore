@implementation CSUSystemSearchTextEncoderV1

- (CSUSystemSearchTextEncoderV1)initWithConfiguration:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CSUSystemSearchTextEncoderV1 *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSUSystemSearchTextEncoderV1;
  v6 = -[CSUSystemSearchTextEncoderV1 init](&v9, sel_init, a3);
  if (v6)
    v7 = (id)objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v3, (uint64_t)CFSTR("CSUSystemSearchTextEncoderV1 is deprecated, please switch over to CSUTextEncoder for text encoding/embedding purposes."), v4, v5);

  return 0;
}

- (vector<unsigned)getTokensOnText:(CSUSystemSearchTextEncoderV1 *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  size_t v30;
  void *v31;
  void **v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  int64_t v37;
  unsigned int *v38;
  unsigned int *v39;
  vector<unsigned int, std::allocator<unsigned int>> *result;
  int v41;
  _BYTE *v42;
  void *v43;
  void *__dst[2];
  unint64_t v45;

  v8 = a6;
  v9 = a5;
  v12 = a4;
  if ((objc_msgSend_loadResources_(self, v13, (uint64_t)a7, v14, v15) & 1) == 0)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend_inputIsLowerCase(self->_configuration, v16, v17, v18, v19))
  {
    objc_msgSend_lowercaseString(v12, v20, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v24;
  }
  v12 = objc_retainAutorelease(v12);
  v29 = (const char *)objc_msgSend_UTF8String(v12, v25, v26, v27, v28);
  v30 = strlen(v29);
  if (v30 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v31 = (void *)v30;
  if (v30 >= 0x17)
  {
    v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v30 | 7) != 0x17)
      v33 = v30 | 7;
    v34 = v33 + 1;
    v32 = (void **)operator new(v33 + 1);
    __dst[1] = v31;
    v45 = v34 | 0x8000000000000000;
    __dst[0] = v32;
  }
  else
  {
    HIBYTE(v45) = v30;
    v32 = __dst;
    if (!v30)
      goto LABEL_13;
  }
  memmove(v32, v29, (size_t)v31);
LABEL_13:
  *((_BYTE *)v31 + (_QWORD)v32) = 0;
  (*(void (**)(_BYTE **__return_ptr, SentencePieceVocabulary *, void **, _QWORD))(*(_QWORD *)self->_vocabulary.__ptr_.__value_
                                                                                           + 16))(&v42, self->_vocabulary.__ptr_.__value_, __dst, 0);
  if (v9)
  {
    v41 = 1;
    sub_239FFAF84((void **)&v42, v42, &v41);
  }
  v35 = v42;
  v36 = (uint64_t)v43 + 4 * v8 - 4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v37 = v36 - (_QWORD)v35;
  if ((void *)v36 != v35)
  {
    if (v37 < 0)
      sub_239FEBE68();
    v38 = (unsigned int *)operator new(v36 - (_QWORD)v35);
    retstr->var0 = v38;
    v39 = &v38[v37 >> 2];
    retstr->var2.var0 = v39;
    memmove(v38, v35, v37);
    retstr->var1 = v39;
  }
  if (v35)
  {
    v43 = v35;
    operator delete(v35);
  }
  if (SHIBYTE(v45) < 0)
    operator delete(__dst[0]);
LABEL_22:

  return result;
}

- (BOOL)loadResources:(id *)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  size_t v19;
  size_t v20;
  __int128 *p_dst;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SentencePieceVocabulary *v28;
  SentencePieceVocabulary *value;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  EspressoNet *v47;
  void **v48;
  void *v49;
  void **v50;
  void **v51;
  void *v52;
  void **v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  _QWORD *v66;
  EspressoNet *v67;
  void **v68;
  void *v69;
  void **v70;
  void **v71;
  void *v72;
  void **v73;
  _QWORD *v74;
  uint64_t v75;
  void *v77;
  void **v78;
  uint64_t v79;
  int v80;
  char v81;
  char v82;
  char v83;
  uint64_t v84;
  char v85;
  char v86;
  char v87;
  char v88;
  void *v89[2];
  void *v90[2];
  int v91;
  void *__p;
  char v93;
  __int128 __dst;
  unint64_t v95;
  _QWORD v96[3];
  _QWORD *v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  sub_23A016E78();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  sub_23A016E78();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v77) = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CSUTextEncoderEspressoV1LoadResources", ", (uint8_t *)&v77, 2u);
  }

  v96[0] = &off_250B0BDC8;
  v96[1] = v5;
  v12 = v96;
  v97 = v96;
  if (!self->_textEncoderNet.__ptr_.__value_)
  {
    objc_msgSend_vocabularyModelPath(self->_configuration, v8, v9, v10, v11);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16, v17);
    v19 = strlen(v18);
    if (v19 >= 0x7FFFFFFFFFFFFFF8)
      sub_239FEBDE0();
    v20 = v19;
    if (v19 >= 0x17)
    {
      v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v19 | 7) != 0x17)
        v22 = v19 | 7;
      v23 = v22 + 1;
      p_dst = (__int128 *)operator new(v22 + 1);
      *((_QWORD *)&__dst + 1) = v20;
      v95 = v23 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v95) = v19;
      p_dst = &__dst;
      if (!v19)
      {
LABEL_13:
        *((_BYTE *)p_dst + v20) = 0;

        sub_239FEB54C((uint64_t)&__dst, "eos", (uint64_t *)&v77);
        v28 = (SentencePieceVocabulary *)v77;
        v77 = 0;
        value = self->_vocabulary.__ptr_.__value_;
        self->_vocabulary.__ptr_.__value_ = v28;
        if (value)
        {
          (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
          v30 = v77;
          v77 = 0;
          if (v30)
            (*(void (**)(void *))(*(_QWORD *)v30 + 8))(v30);
        }
        objc_msgSend_tokenEmbeddingNetworkPath(self->_configuration, v24, v25, v26, v27, v77);
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v36 = (char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35);
        sub_239FFEAC4((void **)&__dst, v36);

        v77 = 0;
        v78 = 0;
        v79 = 0;
        v80 = objc_msgSend_espressoExecutionEngine(self->_configuration, v37, v38, v39, v40);
        v81 = 1;
        v82 = 0;
        v83 = 0;
        v84 = 0xFFFFFFFFLL;
        v85 = 0;
        v86 = 0;
        v87 = 0;
        v88 = 0;
        *(_OWORD *)v89 = 0u;
        *(_OWORD *)v90 = 0u;
        v91 = 1065353216;
        v93 = 0;
        LOBYTE(__p) = 0;
        v41 = operator new();
        *(_QWORD *)v41 = &off_250B0DB68;
        v42 = operator new(0x128uLL);
        v42[1] = 0;
        v42[2] = 0;
        *v42 = &off_250B0DDF0;
        *(_QWORD *)(v41 + 8) = sub_239FF6D14((uint64_t)(v42 + 3), &__dst, (uint64_t)&v77);
        *(_QWORD *)(v41 + 16) = v42;
        v47 = self->_tokenEmbeddingNet.__ptr_.__value_;
        self->_tokenEmbeddingNet.__ptr_.__value_ = (EspressoNet *)v41;
        if (v47)
          (*(void (**)(EspressoNet *))(*(_QWORD *)v47 + 8))(v47);
        if (v93 < 0)
          operator delete(__p);
        v48 = (void **)v90[0];
        if (v90[0])
        {
          do
          {
            v53 = (void **)*v48;
            if (*((char *)v48 + 39) < 0)
              operator delete(v48[2]);
            operator delete(v48);
            v48 = v53;
          }
          while (v53);
        }
        v49 = v89[0];
        v89[0] = 0;
        if (v49)
          operator delete(v49);
        v50 = (void **)v77;
        if (v77)
        {
          v51 = v78;
          v52 = v77;
          if (v78 != v77)
          {
            do
            {
              if (*((char *)v51 - 1) < 0)
                operator delete(*(v51 - 3));
              v51 -= 3;
            }
            while (v51 != v50);
            v52 = v77;
          }
          v78 = v50;
          operator delete(v52);
        }
        objc_msgSend_textEncoderNetworkPath(self->_configuration, v43, v44, v45, v46);
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v59 = (char *)objc_msgSend_UTF8String(v54, v55, v56, v57, v58);
        sub_239FFEAC4((void **)&__dst, v59);

        v64 = objc_msgSend_espressoExecutionEngine(self->_configuration, v60, v61, v62, v63);
        v77 = 0;
        v78 = 0;
        v79 = 0;
        v80 = v64;
        v81 = 1;
        v82 = 0;
        v83 = 0;
        v84 = 0xFFFFFFFFLL;
        v85 = 0;
        v86 = 0;
        v87 = 0;
        v88 = 0;
        *(_OWORD *)v89 = 0u;
        *(_OWORD *)v90 = 0u;
        v91 = 1065353216;
        v93 = 0;
        LOBYTE(__p) = 0;
        v65 = operator new();
        *(_QWORD *)v65 = &off_250B0DB68;
        v66 = operator new(0x128uLL);
        v66[2] = 0;
        *v66 = &off_250B0DDF0;
        v66[1] = 0;
        *(_QWORD *)(v65 + 8) = sub_239FF6D14((uint64_t)(v66 + 3), &__dst, (uint64_t)&v77);
        *(_QWORD *)(v65 + 16) = v66;
        v67 = self->_textEncoderNet.__ptr_.__value_;
        self->_textEncoderNet.__ptr_.__value_ = (EspressoNet *)v65;
        if (v67)
          (*(void (**)(EspressoNet *))(*(_QWORD *)v67 + 8))(v67);
        if (v93 < 0)
          operator delete(__p);
        v68 = (void **)v90[0];
        if (v90[0])
        {
          do
          {
            v73 = (void **)*v68;
            if (*((char *)v68 + 39) < 0)
              operator delete(v68[2]);
            operator delete(v68);
            v68 = v73;
          }
          while (v73);
        }
        v69 = v89[0];
        v89[0] = 0;
        if (v69)
          operator delete(v69);
        v70 = (void **)v77;
        if (v77)
        {
          v71 = v78;
          v72 = v77;
          if (v78 != v77)
          {
            do
            {
              if (*((char *)v71 - 1) < 0)
                operator delete(*(v71 - 3));
              v71 -= 3;
            }
            while (v71 != v70);
            v72 = v77;
          }
          v78 = v70;
          operator delete(v72);
        }
        if (SHIBYTE(v95) < 0)
          operator delete((void *)__dst);
        v12 = v97;
        if (!v97)
          sub_239FF19E8();
        goto LABEL_55;
      }
    }
    memmove(p_dst, v18, v20);
    goto LABEL_13;
  }
LABEL_55:
  (*(void (**)(_QWORD *))(*v12 + 48))(v12);
  v74 = v97;
  if (v97 == v96)
  {
    v75 = 4;
    v74 = v96;
    goto LABEL_59;
  }
  if (v97)
  {
    v75 = 5;
LABEL_59:
    (*(void (**)(void))(*v74 + 8 * v75))();
  }
  return 1;
}

- (BOOL)checkIfEmbeddingInDstBufferIsContiguous:(const void *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  int64_t v7;
  char *v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  BOOL v18;
  void *__p[6];

  memset(&__p[3], 0, 24);
  v6 = (_BYTE *)*((_QWORD *)a3 + 2);
  v5 = (_BYTE *)*((_QWORD *)a3 + 3);
  v7 = v5 - v6;
  if (v5 == v6)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    if (v7 < 0)
      sub_239FEBE68();
    v8 = (char *)operator new(v5 - v6);
    v9 = &v8[8 * (v7 >> 3)];
    memcpy(v8, v6, v7);
  }
  (*(void (**)(void **__return_ptr))(**((_QWORD **)a3 + 5) + 32))(__p);
  if (v9 == v8)
  {
LABEL_11:
    v17 = 0;
    v18 = 0;
    v16 = __p[0];
    if (!__p[0])
      goto LABEL_13;
  }
  else
  {
    v14 = 0;
    while (1)
    {
      v15 = *(_QWORD *)&v8[8 * v14];
      if (v15 == objc_msgSend_tokenEmbeddingLength(self->_configuration, v10, v11, v12, v13))
      {
        v16 = __p[0];
        if (*((_QWORD *)__p[0] + v14) == 4)
          break;
      }
      if (++v14 >= (unint64_t)((v9 - v8) >> 3))
        goto LABEL_11;
    }
    v17 = 1;
  }
  __p[1] = v16;
  operator delete(v16);
  v18 = v17;
LABEL_13:
  if (v8)
    operator delete(v8);
  return v18;
}

- (BOOL)checkIfEmbeddingInSrcBufferIsContiguous:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t i;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  objc_msgSend_strides(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shape(v4, v10, v11, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    if (i >= objc_msgSend_count(v18, v14, v15, v16, v17))
    {
      v34 = 0;
      goto LABEL_7;
    }
    objc_msgSend_objectAtIndex_(v18, v20, i, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_unsignedLongValue(v23, v24, v25, v26, v27);
    v33 = objc_msgSend_tokenEmbeddingLength(self->_configuration, v29, v30, v31, v32);

    if (v28 == v33)
      break;
  }
  objc_msgSend_objectAtIndex_(v9, v14, i, v16, v17);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_unsignedLongValue(v35, v36, v37, v38, v39) == 1;

LABEL_7:
  return v34;
}

- (EspressoTensor)getTokenEmbeddingsforChunks:(SEL)a3 error:(vector<std:(std:(id *)a5 :allocator<std::vector<unsigned int>>> *)a4 :vector<unsigned)int>
{
  uint64_t v5;
  unint64_t v10;
  _QWORD *v11;
  int32x2_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char **var1;
  char **var0;
  char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  float *v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int *v28;
  EspressoNet *value;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  size_t v37;
  size_t v38;
  __int128 *p_dst;
  uint64_t v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  size_t v55;
  size_t v56;
  __int128 *v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 *v60;
  int v61;
  _BYTE *v62;
  _BYTE *v63;
  int64_t v64;
  unint64_t *v65;
  unint64_t *v66;
  __shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  EspressoTensor *result;
  std::runtime_error *exception;
  __int128 __dst;
  unint64_t v76;
  _OWORD v77[2];
  int v78;
  _BYTE v79[40];
  void *__p;
  int v81[2];
  uint64_t v82;
  _QWORD v83[2];
  void *v84;
  void *v85;
  uint64_t v86;
  _QWORD v87[2];
  void *v88;
  void *v89;
  std::__shared_weak_count *v90;
  __int128 v91;
  unint64_t v92;
  uint64_t (**v93)();
  void *v94;
  void *v95;
  std::__shared_weak_count *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend_maximumSequenceLength(self->_configuration, a3, (uint64_t)a4, (uint64_t)a5, v5);
  v11 = operator new(0x10uLL);
  *v11 = 1;
  v11[1] = v10;
  *((_QWORD *)&v91 + 1) = v11 + 2;
  v92 = (unint64_t)(v11 + 2);
  *(_QWORD *)&v91 = v11;
  v12.i32[0] = 0;
  sub_239FFEAF8((int32x4_t **)&v91, (uint64_t)v87, v12);
  if ((_QWORD)v91)
  {
    *((_QWORD *)&v91 + 1) = v91;
    operator delete((void *)v91);
  }
  sub_239FFC338(v83, (uint64_t)v87);
  __p = 0;
  *(_QWORD *)v81 = 0;
  v82 = 0;
  var0 = (char **)a4->var0;
  var1 = (char **)a4->var1;
  if (var0 == var1)
  {
    v19 = 0;
  }
  else
  {
    do
    {
      sub_239FFEEB0((unint64_t *)&__p, *(void **)v81, *var0, var0[1], (var0[1] - *var0) >> 2);
      var0 += 3;
    }
    while (var0 != var1);
    v19 = (char *)__p;
    if (v10 < (uint64_t)(*(_QWORD *)v81 - (_QWORD)__p) >> 2)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("Maximum input token sequence length exceeds %zu"), v15, v16, v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v21, (uint64_t)v20, v22, v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v19 = (char *)__p;
      v24 = *(unsigned int **)v81;
      if (__p == *(void **)v81)
        goto LABEL_15;
      goto LABEL_10;
    }
  }
  v24 = *(unsigned int **)v81;
  if (v19 == *(char **)v81)
    goto LABEL_15;
LABEL_10:
  if (v86 != 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid number of indices provided.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v25 = (float *)v83[1];
  v26 = 4 * *((_QWORD *)v84 + 1);
  v27 = v10 - 1;
  v28 = (unsigned int *)(v19 + 4);
  do
  {
    *v25 = (float)*(v28 - 1);
    if (!v27)
      break;
    v25 = (float *)((char *)v25 + v26);
    --v27;
  }
  while (v28++ != v24);
LABEL_15:
  value = self->_tokenEmbeddingNet.__ptr_.__value_;
  objc_msgSend_inputTextIDTensorName(self->_configuration, v13, v14, v15, v16);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35);
  v37 = strlen(v36);
  if (v37 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v38 = v37;
  if (v37 >= 0x17)
  {
    v40 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v37 | 7) != 0x17)
      v40 = v37 | 7;
    v41 = v40 + 1;
    p_dst = (__int128 *)operator new(v40 + 1);
    *((_QWORD *)&__dst + 1) = v38;
    v76 = v41 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v76) = v37;
    p_dst = &__dst;
    if (!v37)
      goto LABEL_23;
  }
  memmove(p_dst, v36, v38);
LABEL_23:
  *((_BYTE *)p_dst + v38) = 0;
  sub_239FFF258((uint64_t)&v91, &__dst, (uint64_t)v87);
  memset(v77, 0, sizeof(v77));
  v78 = 1065353216;
  sub_239FF6528((uint64_t)v77, (uint64_t)&v91, &v91);
  sub_239FF1424((uint64_t)value, (uint64_t)v77, (uint64_t)v79);
  sub_239FF5234((uint64_t)v77);
  v93 = &off_250B0DCE8;
  v42 = v96;
  if (v96)
  {
    p_shared_owners = (unint64_t *)&v96->__shared_owners_;
    do
      v44 = __ldaxr(p_shared_owners);
    while (__stlxr(v44 - 1, p_shared_owners));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  if (v94)
  {
    v95 = v94;
    operator delete(v94);
  }
  if (SHIBYTE(v92) < 0)
  {
    operator delete((void *)v91);
    if ((SHIBYTE(v76) & 0x80000000) == 0)
      goto LABEL_32;
  }
  else if ((SHIBYTE(v76) & 0x80000000) == 0)
  {
    goto LABEL_32;
  }
  operator delete((void *)__dst);
LABEL_32:

  objc_msgSend_outputTokenEmbeddingIDTensorName(self->_configuration, v45, v46, v47, v48);
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v54 = (const char *)objc_msgSend_UTF8String(v49, v50, v51, v52, v53);
  v55 = strlen(v54);
  if (v55 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v56 = v55;
  if (v55 >= 0x17)
  {
    v58 = (v55 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v55 | 7) != 0x17)
      v58 = v55 | 7;
    v59 = v58 + 1;
    v57 = (__int128 *)operator new(v58 + 1);
    *((_QWORD *)&v91 + 1) = v56;
    v92 = v59 | 0x8000000000000000;
    *(_QWORD *)&v91 = v57;
    goto LABEL_39;
  }
  HIBYTE(v92) = v55;
  v57 = &v91;
  if (v55)
LABEL_39:
    memmove(v57, v54, v56);
  *((_BYTE *)v57 + v56) = 0;
  *(_QWORD *)&v77[0] = &v91;
  v60 = sub_23A0001E0((uint64_t)v79, (uint64_t)&v91, (uint64_t)&unk_23A0A31B0, (__int128 **)v77);
  retstr->_vptr$Tensor = (void **)&off_250B0DCE8;
  v61 = *((_DWORD *)v60 + 12);
  retstr->shape_.sizes_.__begin_ = 0;
  retstr->type_ = v61;
  retstr->shape_.sizes_.__end_ = 0;
  retstr->shape_.sizes_.__end_cap_.__value_ = 0;
  v63 = (_BYTE *)*((_QWORD *)v60 + 7);
  v62 = (_BYTE *)*((_QWORD *)v60 + 8);
  v64 = v62 - v63;
  if (v62 != v63)
  {
    if (v64 < 0)
      sub_239FEBE68();
    v65 = (unint64_t *)operator new(v62 - v63);
    retstr->shape_.sizes_.__begin_ = v65;
    v66 = &v65[v64 >> 3];
    retstr->shape_.sizes_.__end_cap_.__value_ = v66;
    memcpy(v65, v63, v64);
    retstr->shape_.sizes_.__end_ = v66;
  }
  retstr->storage_.__ptr_ = (TensorStorage *)*((_QWORD *)v60 + 10);
  v67 = (__shared_weak_count *)*((_QWORD *)v60 + 11);
  retstr->storage_.__cntrl_ = v67;
  if (v67)
  {
    v68 = (unint64_t *)((char *)v67 + 8);
    do
      v69 = __ldxr(v68);
    while (__stxr(v69 + 1, v68));
  }
  retstr->_vptr$Tensor = (void **)&off_250B0DB88;
  if (SHIBYTE(v92) < 0)
    operator delete((void *)v91);

  sub_239FF5234((uint64_t)v79);
  if (__p)
  {
    *(_QWORD *)v81 = __p;
    operator delete(__p);
  }
  v83[0] = &off_250B0DD08;
  if (v84)
  {
    v85 = v84;
    operator delete(v84);
  }
  v87[0] = &off_250B0DCE8;
  v70 = v90;
  if (v90)
  {
    v71 = (unint64_t *)&v90->__shared_owners_;
    do
      v72 = __ldaxr(v71);
    while (__stlxr(v72 - 1, v71));
    if (!v72)
    {
      ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
      std::__shared_weak_count::__release_weak(v70);
    }
  }
  result = (EspressoTensor *)v88;
  if (v88)
  {
    v89 = v88;
    operator delete(v88);
  }
  return result;
}

- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _DWORD *v10;
  const char *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const void *v40;
  unint64_t v41;
  int64_t v42;
  size_t v43;
  char *v44;
  char *v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  char *v53;
  void *v54;
  int64_t v55;
  char *v56;
  char *v57;
  char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  _DWORD *v74;
  char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  const void *v106;
  int64_t v107;
  char *v108;
  char *v109;
  char *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void **v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _DWORD *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  _QWORD *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  _DWORD *v165;
  uint64_t v166;
  NSArray *tokenSegments;
  const char *v168;
  uint64_t v169;
  char *v170;
  char *v171;
  void *v172;
  char *v173;
  void *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  id *v182;
  int *v183;
  id v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  id v193;
  void *v194;
  int64_t v195;
  char *v196;
  unint64_t *p_shared_owners;
  unint64_t v198;
  std::__shared_weak_count *v199;
  unint64_t *v200;
  unint64_t v201;
  void *v202;
  uint64_t v203;
  _QWORD *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t value;
  id v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  size_t v216;
  size_t v217;
  __int128 *p_dst;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  id v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  size_t v231;
  size_t v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  std::__shared_weak_count *v236;
  unint64_t *v237;
  unint64_t v238;
  std::__shared_weak_count *v239;
  unint64_t *v240;
  unint64_t v241;
  id v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  unint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  id v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  size_t v262;
  void *v263;
  void *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  CSUSystemSearchTextEncoderV1NetworkOutput *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  id v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  size_t v285;
  void *v286;
  void *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  std::__shared_weak_count *v308;
  unint64_t *v309;
  unint64_t v310;
  void *v311;
  std::__shared_weak_count *v312;
  unint64_t *v313;
  unint64_t v314;
  char *v315;
  char *v316;
  void *v317;
  char *v318;
  char *v319;
  void *v320;
  char *v321;
  void *v322;
  void *v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  std::runtime_error *v329;
  std::runtime_error *exception;
  void *v331;
  char v332;
  id v333;
  id obj;
  void (**v335)(id, _QWORD, id);
  uint64_t v336;
  id v337;
  uint64_t v338;
  void *v339;
  CSUSystemSearchTextEncoderV1 *v340;
  unint64_t v341;
  __CFString *v342;
  __CFString *v343;
  __CFString *v344;
  __int128 v345;
  unint64_t v346;
  __int128 __dst;
  unint64_t v348;
  _OWORD v349[2];
  int v350;
  void *v351[5];
  void *v352[2];
  void *v353;
  void *v354;
  uint64_t v355;
  std::__shared_weak_count *v356;
  _QWORD v357[4];
  uint64_t (**v358)();
  int v359;
  void *v360;
  void *v361;
  char *v362;
  uint64_t v363;
  std::__shared_weak_count *v364;
  uint64_t v365;
  uint64_t (**v366)();
  void *v367;
  void *v368;
  uint64_t v369;
  id v370;
  void *v371;
  char *v372;
  void *v373;
  char *v374;
  void *v375;
  _BYTE *v376;
  uint64_t v377;
  std::__shared_weak_count *v378;
  id v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  void *v384;
  char *v385;
  unint64_t v386;
  void *v387;
  char *v388;
  unint64_t v389;
  id v390;
  void *__p[2];
  unint64_t v392;
  uint64_t (**v393)();
  void *v394;
  void *v395;
  std::__shared_weak_count *v396;
  void *v397[2];
  char v398;
  uint64_t (**v399)();
  void *v400;
  void *v401;
  std::__shared_weak_count *v402;
  _BYTE v403[128];
  uint64_t v404;

  v404 = *MEMORY[0x24BDAC8D0];
  v333 = a3;
  v335 = (void (**)(id, _QWORD, id))a4;
  v390 = 0;
  v340 = self;
  LOBYTE(a4) = objc_msgSend_loadResources_(self, v6, (uint64_t)&v390, v7, v8);
  v9 = v390;
  if ((a4 & 1) == 0)
  {
    v335[2](v335, 0, v9);
    goto LABEL_213;
  }
  v388 = 0;
  v387 = 0;
  v389 = 0;
  v385 = 0;
  v384 = 0;
  v386 = 0;
  v10 = operator new(4uLL);
  __p[0] = v10;
  *v10 = 1;
  v392 = (unint64_t)(v10 + 1);
  __p[1] = v10 + 1;
  sub_239FFDE38((char **)&v387, 0, (__n128 *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v380 = 0u;
  v381 = 0u;
  v382 = 0u;
  v383 = 0u;
  obj = v333;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v380, (uint64_t)v403, 16);
  if (!v12)
  {
    v332 = 0;
    v13 = &stru_250B0F248;
    v341 = 1;
    goto LABEL_74;
  }
  v332 = 0;
  v13 = &stru_250B0F248;
  v341 = 1;
  v338 = *(_QWORD *)v381;
  do
  {
    v336 = v12;
    v14 = 0;
    v15 = v9;
    do
    {
      v342 = (__CFString *)v13;
      if (*(_QWORD *)v381 != v338)
        objc_enumerationMutation(obj);
      v16 = *(id *)(*((_QWORD *)&v380 + 1) + 8 * v14);
      if (v341 >= objc_msgSend_maximumSequenceLength(v340->_configuration, v17, v18, v19, v20) - 1)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v21, (uint64_t)CFSTR("Input length longer than maximum allowed sequence length - truncated input"), v22, v23);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logInternalError_(CSUError, v143, (uint64_t)v63, v144, v145);
LABEL_72:

        v332 = 1;
        v9 = v15;
LABEL_73:

        v13 = v342;
        goto LABEL_74;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v16;
        objc_msgSend_string(v24, v25, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v379 = v15;
        objc_msgSend_getTokensOnText_withBOS_withEOS_withError_(v340, v30, (uint64_t)v29, 0, 0, &v379);
        v9 = v379;

        if (v9)
          v335[2](v335, 0, v9);
        v35 = objc_msgSend_maximumSequenceLength(v340->_configuration, v31, v32, v33, v34);
        v40 = __p[0];
        v41 = ((char *)__p[1] - (char *)__p[0]) >> 2;
        v374 = 0;
        v375 = 0;
        if (v35 + ~v341 >= v41)
          v42 = ((char *)__p[1] - (char *)__p[0]) >> 2;
        else
          v42 = v35 + ~v341;
        v373 = 0;
        if (v42)
        {
          if (v42 < 0)
            sub_239FEBE68();
          v43 = 4 * v42;
          v44 = (char *)operator new(4 * v42);
          v373 = v44;
          v374 = v44;
          v45 = &v44[4 * v42];
          v375 = v45;
          memmove(v44, v40, v43);
          v374 = v45;
          if (v41 == (v45 - v44) >> 2)
          {
LABEL_19:
            v46 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_string(v24, v36, v37, v38, v39);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v46, v48, (uint64_t)CFSTR("%@<text_input>%@"), v49, v50, v342, v47);
            v51 = objc_claimAutoreleasedReturnValue();

            v52 = (__CFString *)v51;
            v53 = v388;
            if ((unint64_t)v388 < v389)
              goto LABEL_20;
LABEL_45:
            v58 = sub_239FFF5CC((char **)&v387, (uint64_t)&v373);
            goto LABEL_46;
          }
        }
        else if (!v41)
        {
          goto LABEL_19;
        }
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v36, (uint64_t)CFSTR("Input length longer than maximum allowed sequence length - truncated input"), v38, v39);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logInternalError_(CSUError, v112, (uint64_t)v111, v113, v114);

        v115 = (char *)v373;
        if (v373 == v374)
        {
          v122 = 0;
          v332 = 1;
          v52 = v342;
          if (v373)
            goto LABEL_47;
        }
        else
        {
          v116 = (void *)MEMORY[0x24BDD17C8];
          (*(void (**)(void **__return_ptr, SentencePieceVocabulary *, void **))(*(_QWORD *)v340->_vocabulary.__ptr_.__value_
                                                                                          + 24))(v352, v340->_vocabulary.__ptr_.__value_, &v373);
          v120 = v352;
          if (SHIBYTE(v353) < 0)
            v120 = (void **)v352[0];
          objc_msgSend_stringWithFormat_(v116, v117, (uint64_t)CFSTR("%@<text_input>%s"), v118, v119, v342, v120);
          v121 = objc_claimAutoreleasedReturnValue();

          if (SHIBYTE(v353) < 0)
            operator delete(v352[0]);
          v332 = 1;
          v52 = (__CFString *)v121;
          v53 = v388;
          if ((unint64_t)v388 >= v389)
            goto LABEL_45;
LABEL_20:
          *(_QWORD *)v53 = 0;
          *((_QWORD *)v53 + 1) = 0;
          *((_QWORD *)v53 + 2) = 0;
          v54 = v373;
          v55 = v374 - (_BYTE *)v373;
          if (v374 != v373)
          {
            v343 = v52;
            if (v55 < 0)
              sub_239FEBE68();
            v56 = (char *)operator new(v374 - (_BYTE *)v373);
            *(_QWORD *)v53 = v56;
            *((_QWORD *)v53 + 1) = v56;
            v57 = &v56[4 * (v55 >> 2)];
            *((_QWORD *)v53 + 2) = v57;
            memcpy(v56, v54, v55);
            *((_QWORD *)v53 + 1) = v57;
            v52 = v343;
          }
          v58 = v53 + 24;
LABEL_46:
          v388 = v58;
          v341 += (uint64_t)(*((_QWORD *)v58 - 2) - *((_QWORD *)v58 - 3)) >> 2;
          v122 = 1;
          v115 = (char *)v373;
          if (v373)
          {
LABEL_47:
            v374 = v115;
            operator delete(v115);
          }
        }
        v342 = v52;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        if ((v122 & 1) == 0)
          goto LABEL_73;
        goto LABEL_63;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v63 = v16;
        objc_msgSend_tokenID(v63, v64, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend_unsignedIntValue(v68, v69, v70, v71, v72);
        __p[1] = 0;
        __p[0] = 0;
        v392 = 0;
        v74 = operator new(4uLL);
        __p[0] = v74;
        *v74 = v73;
        v392 = (unint64_t)(v74 + 1);
        __p[1] = v74 + 1;
        v75 = v388;
        if ((unint64_t)v388 >= v389)
        {
          v388 = sub_239FFF7D8((char **)&v387, (uint64_t)__p);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          *(_QWORD *)v388 = 0;
          *((_QWORD *)v75 + 1) = 0;
          *((_QWORD *)v75 + 2) = 0;
          *(_OWORD *)v75 = *(_OWORD *)__p;
          *((_QWORD *)v75 + 2) = v392;
          __p[1] = 0;
          __p[0] = 0;
          v392 = 0;
          v388 = v75 + 24;
        }

        v124 = *((_QWORD *)v388 - 3);
        v123 = *((_QWORD *)v388 - 2);
        v125 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_tokenID(v63, v126, v127, v128, v129);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v125, v131, (uint64_t)CFSTR("%@<token_id_input>%@"), v132, v133, v342, v130);
        v134 = objc_claimAutoreleasedReturnValue();

        v341 += (v123 - v124) >> 2;
      }
      else
      {
        objc_msgSend_embedding(v16, v59, v60, v61, v62);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_dataType(v63, v76, v77, v78, v79) != 65568)
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v80, (uint64_t)CFSTR("Input custom embedding should of type FP32"), v82, v83);
          v84 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v84;
          v335[2](v335, 0, (id)v84);
        }
        objc_msgSend_shape(v63, v80, v81, v82, v83);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndex_(v85, v86, 0, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend_unsignedLongValue(v89, v90, v91, v92, v93);

        if (v94 + v341 > objc_msgSend_maximumSequenceLength(v340->_configuration, v95, v96, v97, v98) - 1)
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v99, (uint64_t)CFSTR("Input length longer than maximum allowed sequence length - truncated input"), v101, v102);
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_logInternalError_(CSUError, v326, (uint64_t)v325, v327, v328);

          goto LABEL_72;
        }
        __p[1] = 0;
        __p[0] = 0;
        v392 = 0;
        if (v94)
        {
          if (v94 >> 62)
            sub_239FEBE68();
          v103 = (char *)operator new(4 * v94);
          v104 = &v103[4 * v94];
          __p[0] = v103;
          v392 = (unint64_t)v104;
          bzero(v103, 4 * v94);
          __p[1] = v104;
        }
        v105 = v388;
        if ((unint64_t)v388 >= v389)
        {
          v110 = sub_239FFF5CC((char **)&v387, (uint64_t)__p);
        }
        else
        {
          *(_QWORD *)v388 = 0;
          *((_QWORD *)v105 + 1) = 0;
          *((_QWORD *)v105 + 2) = 0;
          v106 = __p[0];
          v107 = (char *)__p[1] - (char *)__p[0];
          if (__p[1] != __p[0])
          {
            if (v107 < 0)
              sub_239FEBE68();
            v108 = (char *)operator new((char *)__p[1] - (char *)__p[0]);
            *(_QWORD *)v105 = v108;
            *((_QWORD *)v105 + 1) = v108;
            v109 = &v108[4 * (v107 >> 2)];
            *((_QWORD *)v105 + 2) = v109;
            memcpy(v108, v106, v107);
            *((_QWORD *)v105 + 1) = v109;
          }
          v110 = v105 + 24;
        }
        v388 = v110;
        objc_msgSend_embedding(v16, v99, v100, v101, v102);
        v135 = (char *)objc_claimAutoreleasedReturnValue();
        v373 = (void *)v341;
        v374 = v135;
        v136 = v385;
        if ((unint64_t)v385 >= v386)
        {
          v138 = sub_239FFF930(&v384, &v373);
        }
        else
        {
          *(_DWORD *)v385 = v341;
          v137 = v374;
          v374 = 0;
          *((_QWORD *)v136 + 1) = v137;
          v138 = v136 + 16;
        }
        v385 = v138;

        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v139, (uint64_t)CFSTR("%@<custom_embedding_input>"), v140, v141, v342);
        v134 = objc_claimAutoreleasedReturnValue();

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v341 += v94;
      }
      v342 = (__CFString *)v134;

      v9 = v15;
LABEL_63:

      ++v14;
      v15 = v9;
      v13 = v342;
    }
    while (v336 != v14);
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v142, (uint64_t)&v380, (uint64_t)v403, 16);
  }
  while (v12);
LABEL_74:
  v331 = v9;
  v344 = (__CFString *)v13;

  v146 = (uint64_t)v388;
  v147 = operator new(4uLL);
  __p[0] = v147;
  *v147 = 1;
  v392 = (unint64_t)(v147 + 1);
  __p[1] = v147 + 1;
  sub_239FFDE38((char **)&v387, v146, (__n128 *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v339 = (void *)objc_opt_new();
  v152 = (char *)v387;
  v153 = v388;
  if (v387 != v388)
  {
    v154 = 0;
    v155 = 0;
    do
    {
      if (v155 && v155 != 0xAAAAAAAAAAAAAAABLL * ((v388 - (_BYTE *)v387) >> 3) - 1)
      {
        v156 = v152 + 8;
        objc_msgSend_valueWithRange_(MEMORY[0x24BDD1968], v148, v154, (uint64_t)(*((_QWORD *)v152 + 1) - *(_QWORD *)v152) >> 2, v151);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v339, v162, (uint64_t)v158, v163, v164);
      }
      else
      {
        v156 = v152 + 8;
        v157 = *((_QWORD *)v152 + 1) - *(_QWORD *)v152 == 4 && **(_DWORD **)v152 == 1;
        objc_msgSend_CSUAssert_log_(CSUError, v148, v157, (uint64_t)CFSTR("BOS or EOS token not present in token IDs"), v151);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logInternalError_(CSUError, v159, (uint64_t)v158, v160, v161);
      }

      v165 = *(_DWORD **)v152;
      v152 += 24;
      v154 += (uint64_t)(*v156 - (_QWORD)v165) >> 2;
      ++v155;
    }
    while (v152 != v153);
  }
  v166 = objc_msgSend_copy(v339, v148, v149, v150, v151);
  tokenSegments = v340->_tokenSegments;
  v340->_tokenSegments = (NSArray *)v166;

  sub_239FFFA3C(&v371, (uint64_t *)&v387);
  v370 = v331;
  objc_msgSend_getTokenEmbeddingsforChunks_error_(v340, v168, (uint64_t)&v371, (uint64_t)&v370, v169);
  v337 = v370;

  v170 = (char *)v371;
  if (v371)
  {
    v171 = v372;
    v172 = v371;
    if (v372 != v371)
    {
      v173 = v372;
      do
      {
        v175 = (void *)*((_QWORD *)v173 - 3);
        v173 -= 24;
        v174 = v175;
        if (v175)
        {
          *((_QWORD *)v171 - 2) = v174;
          operator delete(v174);
        }
        v171 = v173;
      }
      while (v173 != v170);
      v172 = v371;
    }
    v372 = v170;
    operator delete(v172);
  }
  if ((_DWORD)v374 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v377 + 24))(v377);
  if (v337)
    ((void (*)(void (**)(id, _QWORD, id), _QWORD))v335[2])(v335, 0);
  sub_239FFC338(&v366, (uint64_t)&v373);
  if ((objc_msgSend_checkIfEmbeddingInDstBufferIsContiguous_(v340, v176, (uint64_t)&v373, v177, v178) & 1) == 0)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v179, (uint64_t)CFSTR("Destination buffer is not contiguous per embedding!"), v180, v181);
    v203 = objc_claimAutoreleasedReturnValue();

    v337 = (id)v203;
    v335[2](v335, 0, (id)v203);
    goto LABEL_190;
  }
  v182 = (id *)v384;
  v183 = (int *)v385;
  if (v384 != v385)
  {
    while (1)
    {
      v184 = v182[1];
      if ((objc_msgSend_checkIfEmbeddingInSrcBufferIsContiguous_(v340, v185, (uint64_t)v184, v186, v187) & 1) == 0)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v188, (uint64_t)CFSTR("Source buffer is not contiguous per embedding!"), v189, v190);
        v324 = objc_claimAutoreleasedReturnValue();

        v335[2](v335, 0, (id)v324);
        v337 = (id)v324;
        v366 = &off_250B0DD08;
        v311 = v367;
        if (v367)
          goto LABEL_191;
        goto LABEL_192;
      }
      if (v369 != 3)
      {
        v329 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v329, "Invalid number of indices provided.");
        __cxa_throw(v329, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      v191 = *(int *)v182;
      v192 = *((_QWORD *)v367 + 1);
      v193 = v182[1];
      v357[0] = MEMORY[0x24BDAC760];
      v357[1] = 3321888768;
      v357[2] = sub_239FFE1B8;
      v357[3] = &unk_250B0D8F0;
      v358 = &off_250B0DCE8;
      v359 = (int)v374;
      v361 = 0;
      v362 = 0;
      v360 = 0;
      v194 = v375;
      v195 = v376 - (_BYTE *)v375;
      if (v376 != v375)
      {
        if (v195 < 0)
          sub_239FEBE68();
        v360 = operator new(v376 - (_BYTE *)v375);
        v361 = v360;
        v196 = (char *)v360 + 8 * (v195 >> 3);
        v362 = v196;
        memcpy(v360, v194, v195);
        v361 = v196;
      }
      v363 = v377;
      v364 = v378;
      if (v378)
      {
        p_shared_owners = (unint64_t *)&v378->__shared_owners_;
        do
          v198 = __ldxr(p_shared_owners);
        while (__stxr(v198 + 1, p_shared_owners));
      }
      v358 = &off_250B0DB88;
      v365 = v192 * v191;
      objc_msgSend_getBytesWithHandler_(v193, v188, (uint64_t)v357, v189, v190);
      v358 = &off_250B0DCE8;
      v199 = v364;
      if (v364)
      {
        v200 = (unint64_t *)&v364->__shared_owners_;
        do
          v201 = __ldaxr(v200);
        while (__stlxr(v201 - 1, v200));
        if (!v201)
          break;
      }
      v202 = v360;
      if (v360)
        goto LABEL_112;
LABEL_113:

      v182 += 2;
      if (v182 == (id *)v183)
        goto LABEL_118;
    }
    ((void (*)(std::__shared_weak_count *))v199->__on_zero_shared)(v199);
    std::__shared_weak_count::__release_weak(v199);
    v202 = v360;
    if (!v360)
      goto LABEL_113;
LABEL_112:
    v361 = v202;
    operator delete(v202);
    goto LABEL_113;
  }
LABEL_118:
  LODWORD(v351[0]) = 4;
  v204 = operator new(8uLL);
  *v204 = 1;
  v392 = (unint64_t)(v204 + 1);
  __p[0] = v204;
  __p[1] = v204 + 1;
  sub_239FFFC10((uint64_t)v352, (int *)v351, (uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  **(float **)(v355 + 8) = (float)v341;
  value = (uint64_t)v340->_textEncoderNet.__ptr_.__value_;
  objc_msgSend_inputTokenEmbeddingIDTensorName(v340->_configuration, v205, v206, v207, v208);
  v210 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v215 = (const char *)objc_msgSend_UTF8String(v210, v211, v212, v213, v214);
  v216 = strlen(v215);
  if (v216 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v217 = v216;
  if (v216 >= 0x17)
  {
    v219 = (v216 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v216 | 7) != 0x17)
      v219 = v216 | 7;
    v220 = v219 + 1;
    p_dst = (__int128 *)operator new(v219 + 1);
    *((_QWORD *)&__dst + 1) = v217;
    v348 = v220 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_127;
  }
  HIBYTE(v348) = v216;
  p_dst = &__dst;
  if (v216)
LABEL_127:
    memmove(p_dst, v215, v217);
  *((_BYTE *)p_dst + v217) = 0;
  sub_239FFF258((uint64_t)__p, &__dst, (uint64_t)&v373);
  objc_msgSend_inputTokenEmbeddingMaskTensorName(v340->_configuration, v221, v222, v223, v224);
  v225 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v230 = (const char *)objc_msgSend_UTF8String(v225, v226, v227, v228, v229);
  v231 = strlen(v230);
  if (v231 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v232 = v231;
  if (v231 >= 0x17)
  {
    v234 = (v231 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v231 | 7) != 0x17)
      v234 = v231 | 7;
    v235 = v234 + 1;
    v233 = operator new(v234 + 1);
    *((_QWORD *)&v345 + 1) = v232;
    v346 = v235 | 0x8000000000000000;
    *(_QWORD *)&v345 = v233;
  }
  else
  {
    HIBYTE(v346) = v231;
    v233 = &v345;
    if (!v231)
      goto LABEL_136;
  }
  memmove(v233, v230, v232);
LABEL_136:
  *((_BYTE *)v233 + v232) = 0;
  sub_239FFF258((uint64_t)v397, &v345, (uint64_t)v352);
  memset(v349, 0, sizeof(v349));
  v350 = 1065353216;
  sub_239FF6528((uint64_t)v349, (uint64_t)__p, (__int128 *)__p);
  sub_239FF6528((uint64_t)v349, (uint64_t)v397, (__int128 *)v397);
  sub_239FF1424(value, (uint64_t)v349, (uint64_t)v351);
  sub_239FF5234((uint64_t)v349);
  v399 = &off_250B0DCE8;
  v236 = v402;
  if (v402)
  {
    v237 = (unint64_t *)&v402->__shared_owners_;
    do
      v238 = __ldaxr(v237);
    while (__stlxr(v238 - 1, v237));
    if (!v238)
    {
      ((void (*)(std::__shared_weak_count *))v236->__on_zero_shared)(v236);
      std::__shared_weak_count::__release_weak(v236);
    }
  }
  if (v400)
  {
    v401 = v400;
    operator delete(v400);
  }
  if (v398 < 0)
    operator delete(v397[0]);
  v393 = &off_250B0DCE8;
  v239 = v396;
  if (v396)
  {
    v240 = (unint64_t *)&v396->__shared_owners_;
    do
      v241 = __ldaxr(v240);
    while (__stlxr(v241 - 1, v240));
    if (!v241)
    {
      ((void (*)(std::__shared_weak_count *))v239->__on_zero_shared)(v239);
      std::__shared_weak_count::__release_weak(v239);
    }
  }
  if (v394)
  {
    v395 = v394;
    operator delete(v394);
  }
  if (SHIBYTE(v392) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v346) < 0)
    operator delete((void *)v345);

  if (SHIBYTE(v348) < 0)
    operator delete((void *)__dst);

  v242 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_additionalLayerNames(v340->_configuration, v243, v244, v245, v246);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v252 = 0;
  while (2)
  {
    if (v252 < objc_msgSend_count(v251, v247, v248, v249, v250))
    {
      objc_msgSend_objectAtIndexedSubscript_(v251, v253, v252, v254, v255);
      v256 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v261 = (const char *)objc_msgSend_UTF8String(v256, v257, v258, v259, v260);
      v262 = strlen(v261);
      if (v262 > 0x7FFFFFFFFFFFFFF7)
        sub_239FEBDE0();
      v263 = (void *)v262;
      if (v262 >= 0x17)
      {
        v265 = (v262 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v262 | 7) != 0x17)
          v265 = v262 | 7;
        v266 = v265 + 1;
        v264 = operator new(v265 + 1);
        v392 = v266 | 0x8000000000000000;
        __p[0] = v264;
        __p[1] = v263;
      }
      else
      {
        HIBYTE(v392) = v262;
        v264 = __p;
        if (!v262)
          goto LABEL_168;
      }
      memmove(v264, v261, (size_t)v263);
LABEL_168:
      *((_BYTE *)v263 + (_QWORD)v264) = 0;
      v267 = sub_239FF34DC(v351, (uint64_t)__p);
      if (!v267)
        sub_239FF1D10("unordered_map::at: key not found");
      objc_msgSend_castToFP16WithDeepCopyFromTensor_(CSUMLMultiArrayUtilities, v268, (uint64_t)(v267 + 5), v269, v270);
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v242, v272, (uint64_t)v271, (uint64_t)v256, v273);

      if (SHIBYTE(v392) < 0)
        operator delete(__p[0]);

      ++v252;
      continue;
    }
    break;
  }
  v274 = [CSUSystemSearchTextEncoderV1NetworkOutput alloc];
  objc_msgSend_outputTextEmbeddingTensorName(v340->_configuration, v275, v276, v277, v278);
  v279 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v284 = (const char *)objc_msgSend_UTF8String(v279, v280, v281, v282, v283);
  v285 = strlen(v284);
  if (v285 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v286 = (void *)v285;
  if (v285 >= 0x17)
  {
    v288 = (v285 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v285 | 7) != 0x17)
      v288 = v285 | 7;
    v289 = v288 + 1;
    v287 = operator new(v288 + 1);
    v392 = v289 | 0x8000000000000000;
    __p[0] = v287;
    __p[1] = v286;
    goto LABEL_179;
  }
  HIBYTE(v392) = v285;
  v287 = __p;
  if (v285)
LABEL_179:
    memmove(v287, v284, (size_t)v286);
  *((_BYTE *)v286 + (_QWORD)v287) = 0;
  v290 = sub_239FF34DC(v351, (uint64_t)__p);
  if (!v290)
    sub_239FF1D10("unordered_map::at: key not found");
  v293 = (void *)objc_msgSend_initWithTextEmbedding_tokenSegments_(v274, v291, (uint64_t)(v290 + 5), (uint64_t)v340->_tokenSegments, v292);
  if (SHIBYTE(v392) < 0)
    operator delete(__p[0]);

  v298 = (void *)objc_msgSend_copy(v242, v294, v295, v296, v297);
  objc_msgSend_setAdditionalLayers_(v293, v299, (uint64_t)v298, v300, v301);

  objc_msgSend_setProcessedInput_(v293, v302, (uint64_t)v344, v303, v304);
  objc_msgSend_setTruncatedInput_(v293, v305, v332 & 1, v306, v307);
  ((void (**)(id, void *, id))v335)[2](v335, v293, v337);

  sub_239FF5234((uint64_t)v351);
  v352[0] = &off_250B0DCE8;
  v308 = v356;
  if (v356)
  {
    v309 = (unint64_t *)&v356->__shared_owners_;
    do
      v310 = __ldaxr(v309);
    while (__stlxr(v310 - 1, v309));
    if (!v310)
    {
      ((void (*)(std::__shared_weak_count *))v308->__on_zero_shared)(v308);
      std::__shared_weak_count::__release_weak(v308);
    }
  }
  if (v353)
  {
    v354 = v353;
    operator delete(v353);
  }
LABEL_190:
  v366 = &off_250B0DD08;
  v311 = v367;
  if (v367)
  {
LABEL_191:
    v368 = v311;
    operator delete(v311);
  }
LABEL_192:
  v373 = &off_250B0DCE8;
  v312 = v378;
  if (v378)
  {
    v313 = (unint64_t *)&v378->__shared_owners_;
    do
      v314 = __ldaxr(v313);
    while (__stlxr(v314 - 1, v313));
    if (!v314)
    {
      ((void (*)(std::__shared_weak_count *))v312->__on_zero_shared)(v312);
      std::__shared_weak_count::__release_weak(v312);
    }
  }
  if (v375)
  {
    v376 = v375;
    operator delete(v375);
  }

  v315 = (char *)v384;
  if (v384)
  {
    v316 = v385;
    v317 = v384;
    if (v385 != v384)
    {
      do
      {

        v316 -= 16;
      }
      while (v316 != v315);
      v317 = v384;
    }
    v385 = v315;
    operator delete(v317);
  }
  v318 = (char *)v387;
  if (v387)
  {
    v319 = v388;
    v320 = v387;
    if (v388 != v387)
    {
      v321 = v388;
      do
      {
        v323 = (void *)*((_QWORD *)v321 - 3);
        v321 -= 24;
        v322 = v323;
        if (v323)
        {
          *((_QWORD *)v319 - 2) = v322;
          operator delete(v322);
        }
        v319 = v321;
      }
      while (v321 != v318);
      v320 = v387;
    }
    v388 = v318;
    operator delete(v320);
  }
  v9 = v337;
LABEL_213:

}

- (void)_unsafeRunOnInputText:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend_setString_(v8, v9, (uint64_t)v17, v10, v11);
  objc_msgSend_addObject_(v7, v12, (uint64_t)v8, v13, v14);
  objc_msgSend_runOnInput_completion_(self, v15, (uint64_t)v7, (uint64_t)v6, v16);

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

- (CSUSystemSearchTextEncoderV1Configuration)configuration
{
  return self->_configuration;
}

- (NSDictionary)additionalLayers
{
  return self->_additionalLayers;
}

- (void)setAdditionalLayers:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLayers, a3);
}

- (NSArray)tokenSegments
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenSegments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  SentencePieceVocabulary *value;
  EspressoNet *v4;
  EspressoNet *v5;

  objc_storeStrong((id *)&self->_tokenSegments, 0);
  objc_storeStrong((id *)&self->_additionalLayers, 0);
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
