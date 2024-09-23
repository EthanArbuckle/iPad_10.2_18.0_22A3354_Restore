@implementation CSUTokenizer

+ (id)availableRevisionsForTokenizer
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 8, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 7, v7, v8);
  objc_msgSend_addIndex_(v2, v9, 2, v10, v11);
  objc_msgSend_addIndex_(v2, v12, 1, v13, v14);
  objc_msgSend_addIndex_(v2, v15, 2, v16, v17);
  v22 = (void *)objc_msgSend_copy(v2, v18, v19, v20, v21);

  return v22;
}

+ (id)TokenizerForRevision:(int64_t)a3 error:(id *)a4
{
  CSUTokenizer *v6;
  const char *v7;
  uint64_t v8;

  v6 = [CSUTokenizer alloc];
  return (id)objc_msgSend_initWithRevision_error_(v6, v7, a3, (uint64_t)a4, v8);
}

- (CSUTokenizer)initWithRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  CSUTextEncoderConfiguration *v7;
  CSUTextEncoderConfiguration *config;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CSUTextEncoderConfiguration *v13;
  SentencePieceVocabulary *value;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CSUTextEncoderConfiguration *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  size_t v34;
  void **v35;
  CSUTokenizer *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  size_t v52;
  size_t v53;
  void **p_dst;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  SentencePieceVocabulary *v61;
  SentencePieceVocabulary *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  SentencePieceVocabulary *v85;
  SentencePieceVocabulary *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  SentencePieceVocabulary *v102;
  void **__dst;
  size_t v104;
  unint64_t v105;

  objc_msgSend_createForRevision_error_(CSUTextEncoderConfiguration, a2, a3, (uint64_t)a4, v4);
  v7 = (CSUTextEncoderConfiguration *)objc_claimAutoreleasedReturnValue();
  config = self->_config;
  self->_config = v7;

  v13 = self->_config;
  if (!v13)
  {
    v36 = 0;
    goto LABEL_34;
  }
  self->_revision = a3;
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value)
  {
    (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
    v13 = self->_config;
  }
  self->_toLower = 1;
  objc_msgSend_systemSearchTextEncoderConfig(v13, v9, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = self->_config;
  if (!v15)
  {
    objc_msgSend_textEncoderE5MLConfig(v20, v16, v17, v18, v19);
    v36 = (CSUTokenizer *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      goto LABEL_34;
    objc_msgSend_textEncoderE5MLConfig(self->_config, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vocabularyModelPath(v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_retainAutorelease(v46);
    v51 = (const char *)objc_msgSend_UTF8String(v27, v47, v48, v49, v50);
    v52 = strlen(v51);
    if (v52 > 0x7FFFFFFFFFFFFFF7)
      sub_239FEBDE0();
    v53 = v52;
    if (v52 >= 0x17)
    {
      v79 = (v52 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v52 | 7) != 0x17)
        v79 = v52 | 7;
      v80 = v79 + 1;
      p_dst = (void **)operator new(v79 + 1);
      v104 = v53;
      v105 = v80 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      HIBYTE(v105) = v52;
      p_dst = (void **)&__dst;
      if (!v52)
      {
LABEL_27:
        *((_BYTE *)p_dst + v53) = 0;
        sub_239FEB54C((uint64_t)&__dst, "eos", (uint64_t *)&v102);
        v85 = v102;
        v102 = 0;
        v86 = self->_vocabulary.__ptr_.__value_;
        self->_vocabulary.__ptr_.__value_ = v85;
        if (v86)
        {
          (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)v86 + 8))(v86);
          v87 = (uint64_t)v102;
          v102 = 0;
          if (v87)
            (*(void (**)(uint64_t))(*(_QWORD *)v87 + 8))(v87);
        }
        objc_msgSend_textEncoderE5MLConfig(self->_config, v81, v82, v83, v84, v102);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        self->_toLower = objc_msgSend_inputIsLowerCase(v88, v89, v90, v91, v92);

        objc_msgSend_textEncoderE5MLConfig(self->_config, v93, v94, v95, v96);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend_maximumSequenceLength(v73, v97, v98, v99, v100);
        goto LABEL_31;
      }
    }
    memmove(p_dst, v51, v53);
    goto LABEL_27;
  }
  objc_msgSend_systemSearchTextEncoderConfig(v20, v16, v17, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vocabularyModelPath(v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_retainAutorelease(v26);
  v32 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30, v31);
  v33 = strlen(v32);
  if (v33 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v34 = v33;
  if (v33 >= 0x17)
  {
    v55 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v33 | 7) != 0x17)
      v55 = v33 | 7;
    v56 = v55 + 1;
    v35 = (void **)operator new(v55 + 1);
    v104 = v34;
    v105 = v56 | 0x8000000000000000;
    __dst = v35;
    goto LABEL_18;
  }
  HIBYTE(v105) = v33;
  v35 = (void **)&__dst;
  if (v33)
LABEL_18:
    memmove(v35, v32, v34);
  *((_BYTE *)v35 + v34) = 0;
  sub_239FEB54C((uint64_t)&__dst, "eos", (uint64_t *)&v102);
  v61 = v102;
  v102 = 0;
  v62 = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = v61;
  if (v62)
  {
    (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)v62 + 8))(v62);
    v63 = (uint64_t)v102;
    v102 = 0;
    if (v63)
      (*(void (**)(uint64_t))(*(_QWORD *)v63 + 8))(v63);
  }
  objc_msgSend_systemSearchTextEncoderConfig(self->_config, v57, v58, v59, v60, v102);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  self->_toLower = objc_msgSend_inputIsLowerCase(v64, v65, v66, v67, v68);

  objc_msgSend_systemSearchTextEncoderConfig(self->_config, v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend_maximumSequenceLength(v73, v74, v75, v76, v77);
LABEL_31:
  self->_maxTokenLength = v78;

  if (SHIBYTE(v105) < 0)
    operator delete(__dst);

  v36 = self;
LABEL_34:

  return v36;
}

- (id)getTokenIDsForText:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  size_t v21;
  void *v22;
  void **v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int *v33;
  unsigned int *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *__p;
  unsigned int *v41;
  void *__dst[2];
  unint64_t v43;

  v4 = a3;
  v9 = v4;
  if (self->_toLower)
  {
    objc_msgSend_lowercaseString(v4, v5, v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v11 = objc_retainAutorelease(v9);
  v16 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
  v20 = v16;
  if (!v16)
  {
    v24 = (id)objc_msgSend_errorForInvalidModelWithLocalizedDescription_(CSUError, v17, (uint64_t)CFSTR("getTokensForText input text is nil! returning nil"), v18, v19);
    v25 = 0;
    goto LABEL_19;
  }
  v21 = strlen(v16);
  if (v21 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v22 = (void *)v21;
  if (v21 >= 0x17)
  {
    v26 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17)
      v26 = v21 | 7;
    v27 = v26 + 1;
    v23 = (void **)operator new(v26 + 1);
    __dst[1] = v22;
    v43 = v27 | 0x8000000000000000;
    __dst[0] = v23;
  }
  else
  {
    HIBYTE(v43) = v21;
    v23 = __dst;
    if (!v21)
      goto LABEL_13;
  }
  memmove(v23, v20, (size_t)v22);
LABEL_13:
  *((_BYTE *)v22 + (_QWORD)v23) = 0;
  (*(void (**)(void **__return_ptr, SentencePieceVocabulary *, void **, _QWORD))(*(_QWORD *)self->_vocabulary.__ptr_.__value_
                                                                                          + 16))(&__p, self->_vocabulary.__ptr_.__value_, __dst, 0);
  v32 = (void *)objc_opt_new();
  v33 = (unsigned int *)__p;
  v34 = v41;
  if (__p != v41)
  {
    do
    {
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v28, *v33, v30, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v32, v36, (uint64_t)v35, v37, v38);

      ++v33;
    }
    while (v33 != v34);
  }
  v25 = (void *)objc_msgSend_copy(v32, v28, v29, v30, v31);

  if (__p)
  {
    v41 = (unsigned int *)__p;
    operator delete(__p);
  }
  if (SHIBYTE(v43) < 0)
    operator delete(__dst[0]);
LABEL_19:

  return v25;
}

- (id)getTokensForText:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  SentencePieceVocabulary *value;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v37;
  id obj;
  void *__p[2];
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    objc_msgSend_getTokenIDsForText_(self, v4, (uint64_t)v7, v5, v6);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v37;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(obj);
          v13 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
          v14 = objc_alloc(MEMORY[0x24BDD17C8]);
          value = self->_vocabulary.__ptr_.__value_;
          v20 = objc_msgSend_unsignedIntValue(v13, v16, v17, v18, v19);
          (*(void (**)(void **__return_ptr, SentencePieceVocabulary *, uint64_t))(*(_QWORD *)value + 40))(__p, value, v20);
          if (v40 >= 0)
            v24 = objc_msgSend_initWithUTF8String_(v14, v21, (uint64_t)__p, v22, v23);
          else
            v24 = objc_msgSend_initWithUTF8String_(v14, v21, (uint64_t)__p[0], v22, v23);
          v28 = (void *)v24;
          objc_msgSend_addObject_(v8, v25, v24, v26, v27);

          if (v40 < 0)
            operator delete(__p[0]);

        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v10);
    }

    v34 = (void *)objc_msgSend_copy(v8, v30, v31, v32, v33);
  }
  else
  {
    v35 = (id)objc_msgSend_errorForInvalidModelWithLocalizedDescription_(CSUError, v4, (uint64_t)CFSTR("getTokensForText input text is nil! returning nil"), v5, v6);
    v34 = 0;
  }

  return v34;
}

- (id)getTextFromTokenIds:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *__p[2];
  char v36;
  void *v37;
  char *v38;
  char *v39;

  v6 = a3;
  v11 = v6;
  if (!v6)
  {
    if (a4)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v7, (uint64_t)CFSTR("input cannot be nil!"), v9, v10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v32 = 0;
      *a4 = v33;
      goto LABEL_19;
    }
LABEL_18:
    v32 = 0;
    goto LABEL_19;
  }
  v12 = objc_msgSend_count(v6, v7, v8, v9, v10);
  v16 = v12;
  if (!v12)
  {
    if (a4)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v13, (uint64_t)CFSTR("input has no tokens ids!"), v14, v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v37 = 0;
  v38 = 0;
  v39 = 0;
  if (v12 >> 62)
    sub_239FEBE68();
  v17 = 4 * v12;
  v37 = operator new(4 * v12);
  v39 = (char *)v37 + 4 * v16;
  bzero(v37, 4 * v16);
  v21 = 0;
  v38 = (char *)v37 + v17;
  do
  {
    objc_msgSend_objectAtIndex_(v11, v18, v21, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v37 + v21) = objc_msgSend_unsignedIntValue(v22, v23, v24, v25, v26);

    ++v21;
  }
  while (v16 != v21);
  (*(void (**)(void **__return_ptr, SentencePieceVocabulary *, void **))(*(_QWORD *)self->_vocabulary.__ptr_.__value_
                                                                                  + 24))(__p, self->_vocabulary.__ptr_.__value_, &v37);
  v27 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (v36 >= 0)
    v31 = objc_msgSend_initWithUTF8String_(v27, v28, (uint64_t)__p, v29, v30);
  else
    v31 = objc_msgSend_initWithUTF8String_(v27, v28, (uint64_t)__p[0], v29, v30);
  v32 = (void *)v31;
  if (v36 < 0)
    operator delete(__p[0]);
  if (v37)
  {
    v38 = (char *)v37;
    operator delete(v37);
  }
LABEL_19:

  return v32;
}

- (int64_t)revision
{
  return self->_revision;
}

- (unint64_t)maxTokenLength
{
  return self->_maxTokenLength;
}

- (void).cxx_destruct
{
  SentencePieceVocabulary *value;

  objc_storeStrong((id *)&self->_config, 0);
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
