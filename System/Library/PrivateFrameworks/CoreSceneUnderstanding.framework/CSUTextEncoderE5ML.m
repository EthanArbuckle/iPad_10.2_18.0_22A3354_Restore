@implementation CSUTextEncoderE5ML

- (CSUTextEncoderE5ML)initWithConfiguration:(id)a3
{
  id v5;
  CSUTextEncoderE5ML *v6;
  CSUTextEncoderE5ML *v7;
  CSUCoreMLInference *tokenEmbedder;
  CSUCoreMLInference *textEncoder;
  CSUTextEncoderE5ML *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSUTextEncoderE5ML;
  v6 = -[CSUTextEncoderE5ML init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    tokenEmbedder = v7->_tokenEmbedder;
    v7->_tokenEmbedder = 0;

    textEncoder = v7->_textEncoder;
    v7->_textEncoder = 0;

    v10 = v7;
  }

  return v7;
}

- (vector<unsigned)getTokensOnText:(CSUTextEncoderE5ML *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5
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
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (***v12)();
  char Resources;
  uint64_t (***v14)();
  uint64_t v15;
  uint64_t (**v17)();
  os_signpost_id_t v18;
  uint64_t (***v19)();
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  sub_23A016E78();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  sub_23A016E78();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CSUTextEncoderE5MLLoadResources", ", (uint8_t *)&v17, 2u);
  }

  v17 = &off_250B0BD18;
  v18 = v6;
  v19 = &v17;
  if (self->_textEncoder && self->_tokenEmbedder)
  {
    v12 = &v17;
    Resources = 1;
  }
  else
  {
    Resources = objc_msgSend_reLoadResources_(self, v9, (uint64_t)a3, v10, v11, v17, v18);
    v12 = v19;
    if (!v19)
      sub_239FF19E8();
  }
  ((void (*)(uint64_t (***)()))(*v12)[6])(v12);
  v14 = v19;
  if (v19 == &v17)
  {
    v15 = 4;
    v14 = &v17;
    goto LABEL_12;
  }
  if (v19)
  {
    v15 = 5;
LABEL_12:
    (*v14)[v15]();
  }
  return Resources;
}

- (BOOL)reLoadResources:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  size_t v19;
  void *v20;
  void **v21;
  uint64_t v22;
  uint64_t v23;
  SentencePieceVocabulary *v24;
  SentencePieceVocabulary *value;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  CSUCoreMLInference *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  CSUCoreMLInference *v36;
  CSUCoreMLInference *tokenEmbedder;
  NSObject *v38;
  NSObject *v39;
  CSUCoreMLInference *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  CSUCoreMLInference **p_textEncoder;
  CSUCoreMLInference *textEncoder;
  BOOL v55;
  uint8_t *v56;
  uint64_t v57;
  SentencePieceVocabulary *v59;
  void *__dst[2];
  unint64_t v61;
  uint8_t buf[8];
  os_signpost_id_t v63;
  uint8_t *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  sub_23A016E78();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  sub_23A016E78();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CSUTextEncoderE5MLReLoadResources", ", buf, 2u);
  }

  *(_QWORD *)buf = &off_250B0BD70;
  v63 = v6;
  v64 = buf;
  objc_msgSend_vocabularyModelPath(self->_configuration, v9, v10, v11, v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16, v17);
  v19 = strlen(v18);
  if (v19 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v20 = (void *)v19;
  if (v19 >= 0x17)
  {
    v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v22 = v19 | 7;
    v23 = v22 + 1;
    v21 = (void **)operator new(v22 + 1);
    __dst[1] = v20;
    v61 = v23 | 0x8000000000000000;
    __dst[0] = v21;
  }
  else
  {
    HIBYTE(v61) = v19;
    v21 = __dst;
    if (!v19)
      goto LABEL_12;
  }
  memmove(v21, v18, (size_t)v20);
LABEL_12:
  *((_BYTE *)v20 + (_QWORD)v21) = 0;
  sub_239FEB54C((uint64_t)__dst, "eos", (uint64_t *)&v59);
  v24 = v59;
  v59 = 0;
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = v24;
  if (value)
  {
    (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
    v26 = (uint64_t)v59;
    v59 = 0;
    if (v26)
      (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
  }
  sub_23A016E78();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    LOWORD(v59) = 0;
    _os_log_impl(&dword_239FE9000, v27, OS_LOG_TYPE_INFO, "Load the token embedding network", (uint8_t *)&v59, 2u);
  }

  sub_23A016E78();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    LOWORD(v59) = 0;
    _os_log_impl(&dword_239FE9000, v28, OS_LOG_TYPE_INFO, "TARGET_OS_IOS || TARGET_OS_VISION", (uint8_t *)&v59, 2u);
  }

  v29 = [CSUCoreMLInference alloc];
  objc_msgSend_tokenEmbeddingNetworkPath(self->_configuration, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (CSUCoreMLInference *)objc_msgSend_initWithCompiledModelFromUri_useComputeUnit_usePrecompiledE5Bundle_error_(v29, v35, (uint64_t)v34, 3, 1, a3);
  tokenEmbedder = self->_tokenEmbedder;
  self->_tokenEmbedder = v36;

  if (self->_tokenEmbedder)
  {
    sub_23A016E78();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      LOWORD(v59) = 0;
      _os_log_impl(&dword_239FE9000, v38, OS_LOG_TYPE_INFO, "Load the text embedding network", (uint8_t *)&v59, 2u);
    }

    sub_23A016E78();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      LOWORD(v59) = 0;
      _os_log_impl(&dword_239FE9000, v39, OS_LOG_TYPE_INFO, "TARGET_OS_IOS || TARGET_OS_VISION", (uint8_t *)&v59, 2u);
    }

    v40 = [CSUCoreMLInference alloc];
    objc_msgSend_textEncoderNetworkPath(self->_configuration, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_e5function(self->_configuration, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_initWithCompiledModelFromUri_useFunction_useComputeUnit_usePrecompiledE5Bundle_error_(v40, v51, (uint64_t)v45, (uint64_t)v50, 3, 1, a3);
    textEncoder = self->_textEncoder;
    p_textEncoder = &self->_textEncoder;
    *p_textEncoder = (CSUCoreMLInference *)v52;

    v55 = *p_textEncoder != 0;
    if (SHIBYTE(v61) < 0)
      goto LABEL_25;
  }
  else
  {
    v55 = 0;
    if (SHIBYTE(v61) < 0)
LABEL_25:
      operator delete(__dst[0]);
  }

  if (!v64)
    sub_239FF19E8();
  (*(void (**)(uint8_t *))(*(_QWORD *)v64 + 48))(v64);
  v56 = v64;
  if (v64 == buf)
  {
    v57 = 4;
    v56 = buf;
    goto LABEL_31;
  }
  if (v64)
  {
    v57 = 5;
LABEL_31:
    (*(void (**)(void))(*(_QWORD *)v56 + 8 * v57))();
  }
  return v55;
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

- (id)getTokenEmbeddingsforChunks:(vector<std:(std:(id *)a4 :allocator<std::vector<unsigned int>>> *)a3 :vector<unsigned)int> error:
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char **var1;
  char **var0;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CSUCoreMLInference *tokenEmbedder;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  unint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  CSUCoreMLInference *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  char v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id *v71;
  void *__p;
  int v73[2];
  uint64_t v74;
  const __CFString *v75;
  void *v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[3];

  v79[2] = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend_contextLength(self->_configuration, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v71 = a4;
  __p = 0;
  *a4 = 0;
  *(_QWORD *)v73 = 0;
  v74 = 0;
  var0 = (char **)a3->var0;
  var1 = (char **)a3->var1;
  if (var0 != var1)
  {
    do
    {
      sub_239FFEEB0((unint64_t *)&__p, *(void **)v73, *var0, var0[1], (var0[1] - *var0) >> 2);
      var0 += 3;
    }
    while (var0 != var1);
    if (v10 < (uint64_t)(*(_QWORD *)v73 - (_QWORD)__p) >> 2)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("Maximum input token sequence length exceeds %zu"), v8, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v14, (uint64_t)v13, v15, v16);
      *v71 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  tokenEmbedder = self->_tokenEmbedder;
  v79[0] = &unk_250B1C780;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v7, v10, v8, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, (uint64_t)v79, 2, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getInputMLMutliArrayFor_WithShape_error_(tokenEmbedder, v22, (uint64_t)CFSTR("text_ids"), (uint64_t)v21, (uint64_t)v71);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v24, 0, v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = &unk_250B1C7B0;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v29, i, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v78[1] = v32;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v33, (uint64_t)v78, 2, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v23, v36, (uint64_t)v28, (uint64_t)v35, v37);

      }
      v38 = *(char **)v73;
      if (__p != *(void **)v73)
      {
        v39 = (char *)__p + 4;
        v40 = 1;
        do
        {
          objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v24, *((unsigned int *)v39 - 1), v25, v26);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v77[0] = &unk_250B1C7B0;
          objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v42, v40 - 1, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v77[1] = v45;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v46, (uint64_t)v77, 2, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v23, v49, (uint64_t)v41, (uint64_t)v48, v50);

          if (v39 == v38)
            break;
          v39 += 4;
        }
        while (v40++ < v10);
      }
    }
    v52 = self->_tokenEmbedder;
    v75 = CFSTR("text_ids");
    v76 = v23;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)&v76, (uint64_t)&v75, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_setInputFeatures_error_(v52, v54, (uint64_t)v53, (uint64_t)v71, v55);

    if ((v56 & 1) != 0)
    {
      if ((objc_msgSend_predict_(self->_tokenEmbedder, v57, (uint64_t)v71, v58, v59) & 1) != 0)
      {
        objc_msgSend_getOutputFor_(self->_tokenEmbedder, v60, (uint64_t)CFSTR("token_embed"), v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      sub_23A016E78();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        sub_23A09DB88(v64, v67, v68);
    }
    else
    {
      sub_23A016E78();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        sub_23A09DBBC(v64, v65, v66);
    }

  }
  v63 = 0;
LABEL_25:

  if (__p)
  {
    *(_QWORD *)v73 = __p;
    operator delete(__p);
  }
  return v63;
}

- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _DWORD *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CSUTextEncoderE5ML *v26;
  const char *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  _DWORD *v78;
  __n128 *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  size_t v103;
  void *v104;
  unint64_t v105;
  _QWORD *v106;
  const void *v107;
  int64_t v108;
  char *v109;
  char *v110;
  char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const void *v117;
  unint64_t v118;
  uint64_t v119;
  size_t v120;
  char *v121;
  char *v122;
  void *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  _QWORD *v130;
  const void *v131;
  int64_t v132;
  char *v133;
  char *v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t *v149;
  unint64_t *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void **v164;
  uint64_t v165;
  unint64_t v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  _DWORD *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t v178;
  unint64_t v179;
  NSObject *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  _QWORD *v185;
  _QWORD *v186;
  uint64_t v187;
  uint64_t v188;
  _QWORD *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  _DWORD *v198;
  uint64_t v199;
  NSArray *tokenSegments;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  id v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  char *v213;
  char *v214;
  void *v215;
  char *v216;
  void *v217;
  void *v218;
  unint64_t v219;
  unint64_t v220;
  NSObject *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  unint64_t *v226;
  id *v227;
  id v228;
  id v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  NSObject *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  NSObject *v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  id v269;
  NSObject *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  id v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  id v305;
  const char *v306;
  id v307;
  double v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  CSUCoreMLInference *textEncoder;
  const char *v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  const char *v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  unint64_t v339;
  CSUTextEncoderE5ML *v340;
  id v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  id v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  CSUCoreMLInference *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  id v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  CSUCoreMLInference *v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  const char *v416;
  id v417;
  void *v418;
  NSObject *v419;
  uint64_t v420;
  uint64_t v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  unint64_t v426;
  unint64_t v427;
  NSObject *v428;
  CSUCoreMLInference *v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  char v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  unint64_t v441;
  unint64_t v442;
  NSObject *v443;
  uint64_t v444;
  id v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  unint64_t i;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  void *v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  void *v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  CSUTextEncoderE5MLNetworkOutput *v475;
  const char *v476;
  uint64_t v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  unint64_t v491;
  unint64_t v492;
  NSObject *v493;
  unint64_t *v494;
  unint64_t *v495;
  void *v496;
  uint64_t v497;
  uint64_t v498;
  void *v499;
  uint64_t v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  char v506;
  void *v507;
  void *v508;
  id v509;
  void *v510;
  id obj;
  id obja;
  uint64_t v513;
  void *v514;
  void (**v515)(id, _QWORD, id);
  __CFString *v516;
  id v517;
  id v518;
  void *v519;
  id v520;
  unint64_t v521;
  uint64_t v522;
  CSUTextEncoderE5ML *v523;
  id v524;
  id v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  id v530;
  id v531;
  _QWORD v532[4];
  id v533;
  uint64_t v534;
  id v535;
  void *v536;
  char *v537;
  void *__p[2];
  char v539;
  id v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  void *v545;
  unint64_t *v546;
  unint64_t v547;
  id v548;
  _BYTE v549[128];
  _QWORD v550[2];
  _QWORD v551[2];
  __int128 v552;
  char *v553;
  _BYTE v554[128];
  __n128 v555[2];
  __int128 buf;
  unint64_t v557;
  uint64_t v558;

  v558 = *MEMORY[0x24BDAC8D0];
  v509 = a3;
  v515 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend_date(MEMORY[0x24BDBCE60], v6, v7, v8, v9);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  v548 = 0;
  LOBYTE(a4) = objc_msgSend_loadResources_(self, v10, (uint64_t)&v548, v11, v12);
  v17 = v548;
  if ((a4 & 1) == 0)
  {
    v515[2](v515, 0, v17);
    goto LABEL_177;
  }
  v517 = v17;
  objc_msgSend_timeIntervalSinceNow(v510, v13, v14, v15, v16);
  v19 = v18;
  sub_23A016E78();
  v20 = objc_claimAutoreleasedReturnValue();
  v523 = self;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v19;
    _os_log_impl(&dword_239FE9000, v20, OS_LOG_TYPE_INFO, "time to load resources = %f", (uint8_t *)&buf, 0xCu);
  }

  buf = 0uLL;
  v557 = 0;
  v545 = 0;
  v546 = 0;
  v547 = 0;
  v21 = operator new(4uLL);
  v555[0].n128_u64[0] = (unint64_t)v21;
  *v21 = 1;
  v555[0].n128_u64[1] = (unint64_t)(v21 + 1);
  v555[1].n128_u64[0] = (unint64_t)(v21 + 1);
  sub_239FFDE38((char **)&buf, 0, v555);
  v26 = self;
  if (v555[0].n128_u64[0])
  {
    v555[0].n128_u64[1] = v555[0].n128_u64[0];
    operator delete((void *)v555[0].n128_u64[0]);
  }
  objc_msgSend_date(MEMORY[0x24BDBCE60], v22, v23, v24, v25);
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  v543 = 0u;
  v544 = 0u;
  v541 = 0u;
  v542 = 0u;
  obj = v509;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v541, (uint64_t)v554, 16);
  if (!v28)
  {
    v506 = 0;
    v29 = 1;
    v30 = v517;
    v516 = &stru_250B0F248;
LABEL_75:
    v521 = v29;

    v518 = v30;
LABEL_76:
    v172 = *((_QWORD *)&buf + 1);
    v173 = operator new(4uLL);
    v555[0].n128_u64[0] = (unint64_t)v173;
    *v173 = 1;
    v555[0].n128_u64[1] = (unint64_t)(v173 + 1);
    v555[1].n128_u64[0] = (unint64_t)(v173 + 1);
    sub_239FFDE38((char **)&buf, v172, v555);
    if (v555[0].n128_u64[0])
    {
      v555[0].n128_u64[1] = v555[0].n128_u64[0];
      operator delete((void *)v555[0].n128_u64[0]);
    }
    objc_msgSend_timeIntervalSinceNow(v507, v174, v175, v176, v177);
    v179 = v178;
    sub_23A016E78();
    v180 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
    {
      v555[0].n128_u32[0] = 134217984;
      *(unint64_t *)((char *)v555[0].n128_u64 + 4) = v179;
      _os_log_impl(&dword_239FE9000, v180, OS_LOG_TYPE_INFO, "time to compute tokens = %f", (uint8_t *)v555, 0xCu);
    }

    v514 = (void *)objc_opt_new();
    v186 = (_QWORD *)*((_QWORD *)&buf + 1);
    v185 = (_QWORD *)buf;
    if ((_QWORD)buf != *((_QWORD *)&buf + 1))
    {
      v187 = 0;
      v188 = 0;
      do
      {
        if (v188 && v188 != -1 - 0x5555555555555555 * ((uint64_t)(*((_QWORD *)&buf + 1) - buf) >> 3))
        {
          v189 = v185 + 1;
          objc_msgSend_valueWithRange_(MEMORY[0x24BDD1968], v181, v187, (uint64_t)(v185[1] - *v185) >> 2, v184);
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v514, v195, (uint64_t)v191, v196, v197);
        }
        else
        {
          v189 = v185 + 1;
          v190 = v185[1] - *v185 == 4 && *(_DWORD *)*v185 == 1;
          objc_msgSend_CSUAssert_log_(CSUError, v181, v190, (uint64_t)CFSTR("BOS or EOS token not present in token IDs"), v184);
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_logInternalError_(CSUError, v192, (uint64_t)v191, v193, v194);
        }

        v198 = (_DWORD *)*v185;
        v185 += 3;
        v187 += (uint64_t)(*v189 - (_QWORD)v198) >> 2;
        ++v188;
      }
      while (v185 != v186);
    }
    v199 = objc_msgSend_copy(v514, v181, v182, v183, v184);
    tokenSegments = v523->_tokenSegments;
    v523->_tokenSegments = (NSArray *)v199;

    objc_msgSend_date(MEMORY[0x24BDBCE60], v201, v202, v203, v204);
    v508 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FFFA3C(&v536, (uint64_t *)&buf);
    v535 = v518;
    objc_msgSend_getTokenEmbeddingsforChunks_error_(v523, v205, (uint64_t)&v536, (uint64_t)&v535, v206);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = v535;

    v213 = (char *)v536;
    if (v536)
    {
      v214 = v537;
      v215 = v536;
      if (v537 != v536)
      {
        v216 = v537;
        do
        {
          v218 = (void *)*((_QWORD *)v216 - 3);
          v216 -= 24;
          v217 = v218;
          if (v218)
          {
            *((_QWORD *)v214 - 2) = v217;
            operator delete(v217);
          }
          v214 = v216;
        }
        while (v216 != v213);
        v215 = v536;
      }
      v537 = v213;
      operator delete(v215);
    }
    if (!v207)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v209, (uint64_t)CFSTR("Could not compute Token Embeddings!"), (uint64_t)v208, v212);
      v518 = (id)objc_claimAutoreleasedReturnValue();

      ((void (*)(void (**)(id, _QWORD, id), _QWORD))v515[2])(v515, 0);
LABEL_163:

      goto LABEL_164;
    }
    objc_msgSend_timeIntervalSinceNow(v508, v209, v210, v211, v212);
    v220 = v219;
    sub_23A016E78();
    v221 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
    {
      v555[0].n128_u32[0] = 134217984;
      *(unint64_t *)((char *)v555[0].n128_u64 + 4) = v220;
      _os_log_impl(&dword_239FE9000, v221, OS_LOG_TYPE_INFO, "time to get token embeddings = %f", (uint8_t *)v555, 0xCu);
    }

    v227 = (id *)v545;
    v226 = v546;
    if (v545 == v546)
    {
      v262 = v208;
    }
    else
    {
      do
      {
        v228 = v227[1];
        v229 = *v227;
        objc_msgSend_strides(v207, v230, v231, v232, v233);
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v234, v235, 1, v236, v237);
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        v243 = objc_msgSend_unsignedLongValue(v238, v239, v240, v241, v242);

        if (v243 != objc_msgSend_tokenEmbeddingLength(v523->_configuration, v244, v245, v246, v247))
        {
          sub_23A016E78();
          v252 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
          {
            v298 = objc_msgSend_tokenEmbeddingLength(v523->_configuration, v253, v254, v255, v256);
            v555[0].n128_u32[0] = 134218240;
            *(unint64_t *)((char *)v555[0].n128_u64 + 4) = v243;
            v555[0].n128_u16[6] = 2048;
            *(unint64_t *)((char *)&v555[0].n128_u64[1] + 6) = v298;
            _os_log_error_impl(&dword_239FE9000, v252, OS_LOG_TYPE_ERROR, "Potential error during custom embedding insertion? stride is %zu, but token embedding length is %zu", (uint8_t *)v555, 0x16u);
          }

        }
        v261 = v243 * (_QWORD)v229;
        if (objc_msgSend_dataType(v207, v248, v249, v250, v251) == 65568)
        {
          v261 *= 4;
          v262 = v208;
        }
        else if (objc_msgSend_dataType(v207, v257, v258, v259, v260) == 65552)
        {
          v261 *= 2;
          v262 = v208;
        }
        else
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v257, (uint64_t)CFSTR("Non FP32 or FP16 datatype encountered!"), 0, v260);
          v262 = (void *)objc_claimAutoreleasedReturnValue();

          sub_23A016E78();
          v263 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v263, OS_LOG_TYPE_ERROR))
            sub_23A09DC24((uint8_t *)&v552, (_BYTE *)&v552 + 1, v263);

          v515[2](v515, 0, v262);
        }
        v264 = objc_msgSend_dataType(v228, v257, v258, v259, v260);
        if (v264 == objc_msgSend_dataType(v207, v265, v266, v267, v268))
        {
          v269 = v228;
        }
        else
        {
          sub_23A016E78();
          v270 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v270, OS_LOG_TYPE_DEBUG))
          {
            v299 = objc_msgSend_dataType(v228, v271, v272, v273, v274);
            v304 = objc_msgSend_dataType(v207, v300, v301, v302, v303);
            v555[0].n128_u32[0] = 134218240;
            *(unint64_t *)((char *)v555[0].n128_u64 + 4) = v299;
            v555[0].n128_u16[6] = 2048;
            *(unint64_t *)((char *)&v555[0].n128_u64[1] + 6) = v304;
            _os_log_debug_impl(&dword_239FE9000, v270, OS_LOG_TYPE_DEBUG, "Casting custom embedding from %ld type to expected token embedding type %ld", (uint8_t *)v555, 0x16u);
          }

          v275 = objc_alloc(MEMORY[0x24BDBFFF0]);
          objc_msgSend_shape(v228, v276, v277, v278, v279);
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          v285 = objc_msgSend_dataType(v207, v281, v282, v283, v284);
          objc_msgSend_strides(v228, v286, v287, v288, v289);
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          v269 = (id)objc_msgSend_initWithShape_dataType_strides_(v275, v291, (uint64_t)v280, v285, (uint64_t)v290);

          objc_msgSend_transferToMultiArray_(v228, v292, (uint64_t)v269, v293, v294);
        }
        v532[0] = MEMORY[0x24BDAC760];
        v532[1] = 3221225472;
        v532[2] = sub_23A0095B0;
        v532[3] = &unk_250B0E2B8;
        v533 = v207;
        v534 = v261;
        objc_msgSend_getBytesWithHandler_(v269, v295, (uint64_t)v532, v296, v297);

        v227 += 2;
        v208 = v262;
      }
      while (v227 != (id *)v226);
    }
    objc_msgSend_date(MEMORY[0x24BDBCE60], v222, v223, v224, v225);
    v504 = (void *)objc_claimAutoreleasedReturnValue();
    v305 = objc_alloc(MEMORY[0x24BDBFFF0]);
    v531 = v262;
    v505 = (void *)objc_msgSend_initWithShape_dataType_error_(v305, v306, (uint64_t)&unk_250B1CC90, 65568, (uint64_t)&v531);
    v307 = v531;

    *(float *)&v308 = (float)v521;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v309, v310, v311, v312, v308);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v505, v314, (uint64_t)v313, (uint64_t)&unk_250B1CCA8, v315);

    textEncoder = v523->_textEncoder;
    v550[0] = CFSTR("indices");
    v550[1] = CFSTR("token_embed");
    v551[0] = v505;
    v551[1] = v207;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v317, (uint64_t)v551, (uint64_t)v550, 2);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    v530 = v307;
    LOBYTE(textEncoder) = objc_msgSend_setInputFeatures_error_(textEncoder, v319, (uint64_t)v318, (uint64_t)&v530, v320);
    v518 = v530;

    if ((textEncoder & 1) == 0)
    {
      sub_23A016E78();
      v419 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v419, OS_LOG_TYPE_ERROR))
        sub_23A09DBF0(v419, v420, v421);

      ((void (*)(void (**)(id, _QWORD, id), _QWORD))v515[2])(v515, 0);
      goto LABEL_162;
    }
    objc_msgSend_date(MEMORY[0x24BDBCE60], v321, v322, v323, v324);
    v503 = (void *)objc_claimAutoreleasedReturnValue();
    v528 = 0u;
    v529 = 0u;
    v526 = 0u;
    v527 = 0u;
    objc_msgSend_layerShapes(v523->_configuration, v325, v326, v327, v328);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v329, v330, v331, v332, v333);
    obja = (id)objc_claimAutoreleasedReturnValue();

    v339 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v334, (uint64_t)&v526, (uint64_t)v549, 16);
    v340 = v523;
    v341 = v518;
    if (v339)
    {
      v522 = *(_QWORD *)v527;
      while (1)
      {
        v519 = v341;
        if (*(_QWORD *)v527 != v522)
          objc_enumerationMutation(obja);
        v342 = **((_QWORD **)&v526 + 1);
        objc_msgSend_layerShapes(v340->_configuration, v335, v336, v337, v338);
        v343 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v343, v344, v342, v345, v346);
        v347 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend_layerWidths(v523->_configuration, v348, v349, v350, v351);
        v352 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v352, v353, v342, v354, v355);
        v356 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_layerHeights(v523->_configuration, v357, v358, v359, v360);
        v361 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v361, v362, v342, v363, v364);
        v365 = (void *)objc_claimAutoreleasedReturnValue();

        v366 = v523->_textEncoder;
        v371 = objc_msgSend_unsignedLongValue(v356, v367, v368, v369, v370);
        v376 = objc_msgSend_unsignedLongValue(v365, v372, v373, v374, v375);
        v525 = v519;
        objc_msgSend_setOutputBufferWithLayerName_withWidth_withHeight_withShape_withPixelFormat_error_(v366, v377, v342, v371, v376, v347, 1278226536, &v525);
        v378 = v525;

        if (v378)
          break;

        if (v339 >= 2)
        {
          v383 = 1;
          while (1)
          {
            if (*(_QWORD *)v527 != v522)
              objc_enumerationMutation(obja);
            v384 = *(_QWORD *)(*((_QWORD *)&v526 + 1) + 8 * v383);
            objc_msgSend_layerShapes(v523->_configuration, v379, v380, v381, v382);
            v385 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v385, v386, v384, v387, v388);
            v347 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend_layerWidths(v523->_configuration, v389, v390, v391, v392);
            v393 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v393, v394, v384, v395, v396);
            v356 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_layerHeights(v523->_configuration, v397, v398, v399, v400);
            v401 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v401, v402, v384, v403, v404);
            v365 = (void *)objc_claimAutoreleasedReturnValue();

            v405 = v523->_textEncoder;
            v410 = objc_msgSend_unsignedLongValue(v356, v406, v407, v408, v409);
            v415 = objc_msgSend_unsignedLongValue(v365, v411, v412, v413, v414);
            v525 = 0;
            objc_msgSend_setOutputBufferWithLayerName_withWidth_withHeight_withShape_withPixelFormat_error_(v405, v416, v384, v410, v415, v347, 1278226536, &v525);
            v417 = v525;
            if (v417)
              break;

            if (v339 == ++v383)
              goto LABEL_134;
          }
          v378 = v417;
          break;
        }
LABEL_134:
        v339 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v379, (uint64_t)&v526, (uint64_t)v549, 16);
        v341 = 0;
        v418 = 0;
        v340 = v523;
        if (!v339)
          goto LABEL_144;
      }
      v518 = v378;
      v515[2](v515, 0, v378);
    }
    else
    {
      v418 = v518;
LABEL_144:

      objc_msgSend_timeIntervalSinceNow(v503, v422, v423, v424, v425);
      v427 = v426;
      sub_23A016E78();
      v428 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v428, OS_LOG_TYPE_INFO))
      {
        v555[0].n128_u32[0] = 134217984;
        *(unint64_t *)((char *)v555[0].n128_u64 + 4) = v427;
        _os_log_impl(&dword_239FE9000, v428, OS_LOG_TYPE_INFO, "time to get output buffers = %f", (uint8_t *)v555, 0xCu);
      }

      v429 = v523->_textEncoder;
      v524 = v418;
      v433 = objc_msgSend_predict_(v429, v430, (uint64_t)&v524, v431, v432);
      v520 = v524;

      if ((v433 & 1) == 0)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v434, (uint64_t)CFSTR("Prediction failed with the text Encoder"), (uint64_t)v520, v436);
        v474 = objc_claimAutoreleasedReturnValue();

        v515[2](v515, 0, (id)v474);
        v518 = (id)v474;
LABEL_161:

LABEL_162:
        goto LABEL_163;
      }
      objc_msgSend_getOutputFor_(v523->_textEncoder, v434, (uint64_t)CFSTR("text_embed"), v435, v436);
      obja = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceNow(v504, v437, v438, v439, v440);
      v442 = v441;
      sub_23A016E78();
      v443 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v443, OS_LOG_TYPE_INFO))
      {
        v555[0].n128_u32[0] = 134217984;
        *(unint64_t *)((char *)v555[0].n128_u64 + 4) = v442;
        _os_log_impl(&dword_239FE9000, v443, OS_LOG_TYPE_INFO, "time to run full text n/w = %f", (uint8_t *)v555, 0xCu);
      }

      v347 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v444 = (uint64_t)v516;
      v445 = v520;
      objc_msgSend_additionalLayerNames(v523->_configuration, v446, v447, v448, v449);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; ; ++i)
      {
        v518 = v445;
        if (i >= objc_msgSend_count(v356, v450, v451, v452, v453))
          break;
        objc_msgSend_objectAtIndexedSubscript_(v356, v455, i, v456, v457);
        v458 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_getOutputFor_(v523->_textEncoder, v459, (uint64_t)v458, v460, v461);
        v465 = (void *)objc_claimAutoreleasedReturnValue();
        if (v465)
        {
          objc_msgSend_setObject_forKey_(v347, v462, (uint64_t)v465, (uint64_t)v458, v464);
        }
        else
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v462, (uint64_t)CFSTR("Output for %@ is nil"), v463, v464, v458);
          v466 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v467, (uint64_t)v466, 0, v468);
          v469 = objc_claimAutoreleasedReturnValue();

          v518 = (id)v469;
        }

        v444 = (uint64_t)v516;
        v445 = v518;
      }
      v475 = [CSUTextEncoderE5MLNetworkOutput alloc];
      v365 = (void *)objc_msgSend_initWithTextEmbedding_tokenSegments_(v475, v476, (uint64_t)obja, (uint64_t)v523->_tokenSegments, v477);
      objc_msgSend_setAdditionalLayers_(v365, v478, (uint64_t)v347, v479, v480);
      objc_msgSend_setProcessedInput_(v365, v481, v444, v482, v483);
      objc_msgSend_setTruncatedInput_(v365, v484, v506 & 1, v485, v486);
      objc_msgSend_timeIntervalSinceNow(v510, v487, v488, v489, v490);
      v492 = v491;
      sub_23A016E78();
      v493 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v493, OS_LOG_TYPE_INFO))
      {
        v555[0].n128_u32[0] = 134217984;
        *(unint64_t *)((char *)v555[0].n128_u64 + 4) = v492;
        _os_log_impl(&dword_239FE9000, v493, OS_LOG_TYPE_INFO, "time to run text encoding = %f", (uint8_t *)v555, 0xCu);
      }

      ((void (**)(id, void *, id))v515)[2](v515, v365, v445);
    }

    goto LABEL_161;
  }
  v506 = 0;
  v516 = &stru_250B0F248;
  v29 = 1;
  v513 = *(_QWORD *)v542;
  v30 = v517;
LABEL_8:
  v31 = 0;
  while (1)
  {
    if (*(_QWORD *)v542 != v513)
      objc_enumerationMutation(obj);
    v32 = *(id *)(*((_QWORD *)&v541 + 1) + 8 * v31);
    v521 = v29;
    if (v29 >= objc_msgSend_maximumSequenceLength(v26->_configuration, v33, v34, v35, v36) - 1)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v37, (uint64_t)CFSTR("Input length longer than maximum allowed sequence length - truncated input"), v38, v39);
      v67 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logInternalError_(CSUError, v169, (uint64_t)v67, v170, v171);
LABEL_74:

      v506 = 1;
      v29 = v521;
      goto LABEL_75;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = v32;
        objc_msgSend_tokenID(v67, v68, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend_unsignedIntValue(v72, v73, v74, v75, v76);
        memset(v555, 0, 24);
        v78 = operator new(4uLL);
        v555[0].n128_u64[0] = (unint64_t)v78;
        *v78 = v77;
        v555[0].n128_u64[1] = (unint64_t)(v78 + 1);
        v555[1].n128_u64[0] = (unint64_t)(v78 + 1);
        v79 = (__n128 *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1) >= v557)
        {
          *((_QWORD *)&buf + 1) = sub_239FFF7D8((char **)&buf, (uint64_t)v555);
          if (v555[0].n128_u64[0])
          {
            v555[0].n128_u64[1] = v555[0].n128_u64[0];
            operator delete((void *)v555[0].n128_u64[0]);
          }
        }
        else
        {
          **((_QWORD **)&buf + 1) = 0;
          v79->n128_u64[1] = 0;
          v79[1].n128_u64[0] = 0;
          *v79 = v555[0];
          v79[1].n128_u64[0] = v555[1].n128_u64[0];
          memset(v555, 0, 24);
          *((_QWORD *)&buf + 1) = (char *)v79 + 24;
        }

        v137 = *(_QWORD *)(*((_QWORD *)&buf + 1) - 24);
        v136 = *(_QWORD *)(*((_QWORD *)&buf + 1) - 16);
        v138 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_tokenID(v67, v139, v140, v141, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v138, v144, (uint64_t)CFSTR("%@<token_id_input>%@"), v145, v146, v516, v143);
        v147 = objc_claimAutoreleasedReturnValue();

        v521 += (v136 - v137) >> 2;
        v516 = (__CFString *)v147;
      }
      else
      {
        objc_msgSend_embedding(v32, v63, v64, v65, v66);
        v67 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shape(v67, v80, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndex_(v84, v85, 0, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend_unsignedLongValue(v88, v89, v90, v91, v92);

        v102 = v93 + v521;
        if (v93 + v521 > objc_msgSend_maximumSequenceLength(v523->_configuration, v94, v95, v96, v97) - 1)
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v98, (uint64_t)CFSTR("Input length longer than maximum allowed sequence length - truncated input"), v100, v101);
          v470 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_logInternalError_(CSUError, v471, (uint64_t)v470, v472, v473);

          goto LABEL_74;
        }
        memset(v555, 0, 24);
        if (v93)
        {
          if (v93 >> 62)
            sub_239FEBE68();
          v103 = 4 * v93;
          v104 = operator new(4 * v93);
          v105 = (unint64_t)v104 + 4 * v93;
          v555[0].n128_u64[0] = (unint64_t)v104;
          v555[1].n128_u64[0] = v105;
          bzero(v104, v103);
          v555[0].n128_u64[1] = v105;
        }
        v106 = (_QWORD *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1) >= v557)
        {
          v111 = sub_239FFF5CC((char **)&buf, (uint64_t)v555);
        }
        else
        {
          **((_QWORD **)&buf + 1) = 0;
          v106[1] = 0;
          v106[2] = 0;
          v107 = (const void *)v555[0].n128_u64[0];
          v108 = v555[0].n128_u64[1] - v555[0].n128_u64[0];
          if (v555[0].n128_u64[1] != v555[0].n128_u64[0])
          {
            if (v108 < 0)
              sub_239FEBE68();
            v109 = (char *)operator new(v555[0].n128_u64[1] - v555[0].n128_u64[0]);
            *v106 = v109;
            v106[1] = v109;
            v110 = &v109[4 * (v108 >> 2)];
            v106[2] = v110;
            memcpy(v109, v107, v108);
            v106[1] = v110;
          }
          v111 = (char *)(v106 + 3);
        }
        *((_QWORD *)&buf + 1) = v111;
        objc_msgSend_embedding(v32, v98, v99, v100, v101);
        v148 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v552 = v521;
        *((_QWORD *)&v552 + 1) = v148;
        v149 = v546;
        if ((unint64_t)v546 >= v547)
        {
          v150 = sub_23A009B40(&v545, (uint64_t *)&v552);
        }
        else
        {
          *v546 = v521;
          *((_QWORD *)&v552 + 1) = 0;
          v150 = v149 + 2;
          v149[1] = v148;
        }
        v546 = v150;

        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v151, (uint64_t)CFSTR("%@<custom_embedding_input>"), v152, v153, v516);
        v154 = objc_claimAutoreleasedReturnValue();

        if (v555[0].n128_u64[0])
        {
          v555[0].n128_u64[1] = v555[0].n128_u64[0];
          operator delete((void *)v555[0].n128_u64[0]);
        }
        v521 = v102;
        v516 = (__CFString *)v154;
      }

      goto LABEL_65;
    }
    v40 = v32;
    objc_msgSend_date(MEMORY[0x24BDBCE60], v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(v40, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v540 = v30;
    objc_msgSend_getTokensOnText_withBOS_withEOS_withError_(v26, v51, (uint64_t)v50, 0, 0, &v540);
    v518 = v540;

    objc_msgSend_timeIntervalSinceNow(v45, v52, v53, v54, v55);
    v57 = v56;
    sub_23A016E78();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      LODWORD(v552) = 134217984;
      *(_QWORD *)((char *)&v552 + 4) = v57;
      _os_log_impl(&dword_239FE9000, v58, OS_LOG_TYPE_INFO, "time for getTokensOnText = %f", (uint8_t *)&v552, 0xCu);
    }

    if (v518)
    {
      ((void (*)(void (**)(id, _QWORD, id), _QWORD))v515[2])(v515, 0);
      v62 = 1;
      goto LABEL_61;
    }
    v112 = objc_msgSend_maximumSequenceLength(v523->_configuration, v59, 0, v60, v61);
    v117 = (const void *)v555[0].n128_u64[0];
    v118 = (uint64_t)(v555[0].n128_u64[1] - v555[0].n128_u64[0]) >> 2;
    v553 = 0;
    v119 = v112 + ~v521 >= v118 ? (uint64_t)(v555[0].n128_u64[1] - v555[0].n128_u64[0]) >> 2 : v112 + ~v521;
    v552 = 0uLL;
    if (v119)
    {
      if (v119 < 0)
        sub_239FEBE68();
      v120 = 4 * v119;
      v121 = (char *)operator new(4 * v119);
      *(_QWORD *)&v552 = v121;
      *((_QWORD *)&v552 + 1) = v121;
      v122 = &v121[4 * v119];
      v553 = v122;
      memmove(v121, v117, v120);
      *((_QWORD *)&v552 + 1) = v122;
      if (v118 == (v122 - v121) >> 2)
      {
LABEL_35:
        v123 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_string(v40, v113, v114, v115, v116);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v123, v125, (uint64_t)CFSTR("%@<text_input>%@"), v126, v127, v516, v124);
        v128 = objc_claimAutoreleasedReturnValue();

        v516 = (__CFString *)v128;
        v129 = v521;
        v130 = (_QWORD *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1) < v557)
        {
LABEL_36:
          *v130 = 0;
          v130[1] = 0;
          v130[2] = 0;
          v131 = (const void *)v552;
          v132 = *((_QWORD *)&v552 + 1) - v552;
          if (*((_QWORD *)&v552 + 1) != (_QWORD)v552)
          {
            if (v132 < 0)
              sub_239FEBE68();
            v133 = (char *)operator new(*((_QWORD *)&v552 + 1) - v552);
            *v130 = v133;
            v130[1] = v133;
            v134 = &v133[4 * (v132 >> 2)];
            v130[2] = v134;
            memcpy(v133, v131, v132);
            v130[1] = v134;
            v129 = v521;
          }
          v135 = (char *)(v130 + 3);
LABEL_59:
          v62 = 0;
          *((_QWORD *)&buf + 1) = v135;
          v166 = v129 + ((uint64_t)(*((_QWORD *)v135 - 2) - *((_QWORD *)v135 - 3)) >> 2);
          v159 = (void *)v552;
          v521 = v166;
          if (!(_QWORD)v552)
            goto LABEL_61;
LABEL_60:
          *((_QWORD *)&v552 + 1) = v159;
          operator delete(v159);
          goto LABEL_61;
        }
LABEL_58:
        v135 = sub_239FFF5CC((char **)&buf, (uint64_t)&v552);
        goto LABEL_59;
      }
    }
    else if (!v118)
    {
      goto LABEL_35;
    }
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v113, (uint64_t)CFSTR("Input length longer than maximum allowed sequence length - truncated input"), v115, v116);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logInternalError_(CSUError, v156, (uint64_t)v155, v157, v158);

    v159 = (void *)v552;
    if ((_QWORD)v552 != *((_QWORD *)&v552 + 1))
    {
      v160 = (void *)MEMORY[0x24BDD17C8];
      (*(void (**)(void **__return_ptr, SentencePieceVocabulary *, __int128 *))(*(_QWORD *)v523->_vocabulary.__ptr_.__value_
                                                                                         + 24))(__p, v523->_vocabulary.__ptr_.__value_, &v552);
      v164 = __p;
      if (v539 < 0)
        v164 = (void **)__p[0];
      objc_msgSend_stringWithFormat_(v160, v161, (uint64_t)CFSTR("%@<text_input>%s"), v162, v163, v516, v164);
      v165 = objc_claimAutoreleasedReturnValue();

      if (v539 < 0)
        operator delete(__p[0]);
      v506 = 1;
      v516 = (__CFString *)v165;
      v129 = v521;
      v130 = (_QWORD *)*((_QWORD *)&buf + 1);
      if (*((_QWORD *)&buf + 1) < v557)
        goto LABEL_36;
      goto LABEL_58;
    }
    v62 = 2;
    v506 = 1;
    if ((_QWORD)v552)
      goto LABEL_60;
LABEL_61:
    if (v555[0].n128_u64[0])
    {
      v555[0].n128_u64[1] = v555[0].n128_u64[0];
      operator delete((void *)v555[0].n128_u64[0]);
    }

    if (v62)
      break;
    v30 = v518;
LABEL_65:

    ++v31;
    v29 = v521;
    v26 = v523;
    if (v28 == v31)
    {
      v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v167, (uint64_t)&v541, (uint64_t)v554, 16);
      v28 = v168;
      if (!v168)
        goto LABEL_75;
      goto LABEL_8;
    }
  }

  if (v62 == 2)
    goto LABEL_76;
LABEL_164:

  v494 = (unint64_t *)v545;
  v17 = v518;
  if (v545)
  {
    v495 = v546;
    v496 = v545;
    if (v546 != v545)
    {
      do
      {

        v495 -= 2;
      }
      while (v495 != v494);
      v496 = v545;
      v17 = v518;
    }
    v546 = v494;
    operator delete(v496);
  }
  v497 = buf;
  if ((_QWORD)buf)
  {
    v498 = *((_QWORD *)&buf + 1);
    v499 = (void *)buf;
    if (*((_QWORD *)&buf + 1) != (_QWORD)buf)
    {
      v500 = *((_QWORD *)&buf + 1);
      do
      {
        v502 = *(void **)(v500 - 24);
        v500 -= 24;
        v501 = v502;
        if (v502)
        {
          *(_QWORD *)(v498 - 16) = v501;
          operator delete(v501);
        }
        v498 = v500;
      }
      while (v500 != v497);
      v499 = (void *)buf;
    }
    *((_QWORD *)&buf + 1) = v497;
    operator delete(v499);
  }
LABEL_177:

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

- (CSUTextEncoderE5MLConfiguration)configuration
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

  objc_storeStrong((id *)&self->_tokenSegments, 0);
  objc_storeStrong((id *)&self->_additionalLayers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
  objc_storeStrong((id *)&self->_textEncoder, 0);
  objc_storeStrong((id *)&self->_tokenEmbedder, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
