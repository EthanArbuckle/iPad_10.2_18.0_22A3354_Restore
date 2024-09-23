@implementation CSUSystemSearchTokenizer

+ (id)availableRevisionsForSystemSearchTokenizer
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 5, v4, v5);
  v10 = (void *)objc_msgSend_copy(v2, v6, v7, v8, v9);

  return v10;
}

+ (id)SystemSearchTokenizerForRevision:(int64_t)a3 error:(id *)a4
{
  CSUSystemSearchTokenizer *v6;
  const char *v7;
  uint64_t v8;

  v6 = [CSUSystemSearchTokenizer alloc];
  return (id)objc_msgSend_initWithRevision_error_(v6, v7, a3, (uint64_t)a4, v8);
}

- (CSUSystemSearchTokenizer)initWithRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  void *v19;
  void **v20;
  CSUSystemSearchTokenizer *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SentencePieceVocabulary *v28;
  SentencePieceVocabulary *value;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  SentencePieceVocabulary *v36;
  void *__dst[2];
  unint64_t v38;

  self->_revision = a3;
  *a4 = 0;
  if (a3 != 5)
  {
    if (a3 == 2)
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, a2, (uint64_t)CFSTR("tokenizer revision CSUSystemSearchTextEncoderV1ConfigurationRevision_v2_0_English not supported!"), (uint64_t)a4, v4);
    else
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, a2, (uint64_t)CFSTR("tokenizer revision unknown!"), (uint64_t)a4, v4);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend_TextEncoderE5MLConfigurationForRevision_error_(CSUTextEncoderE5MLConfiguration, a2, 1, (uint64_t)a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vocabularyModelPath(v7, v8, v9, v10, v11);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
  v18 = strlen(v17);
  if (v18 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v19 = (void *)v18;
  if (v18 >= 0x17)
  {
    v22 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17)
      v22 = v18 | 7;
    v23 = v22 + 1;
    v20 = (void **)operator new(v22 + 1);
    __dst[1] = v19;
    v38 = v23 | 0x8000000000000000;
    __dst[0] = v20;
    goto LABEL_13;
  }
  HIBYTE(v38) = v18;
  v20 = __dst;
  if (v18)
LABEL_13:
    memmove(v20, v17, (size_t)v19);
  *((_BYTE *)v19 + (_QWORD)v20) = 0;

  sub_239FEB54C((uint64_t)__dst, "eos", (uint64_t *)&v36);
  v28 = v36;
  v36 = 0;
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = v28;
  if (value)
  {
    (*(void (**)(SentencePieceVocabulary *))(*(_QWORD *)value + 8))(value);
    v30 = (uint64_t)v36;
    v36 = 0;
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 8))(v30);
  }
  self->_toLower = objc_msgSend_inputIsLowerCase(v7, v24, v25, v26, v27, v36);
  self->_maximumSequenceLength = objc_msgSend_maximumSequenceLength(v7, v31, v32, v33, v34);
  if (SHIBYTE(v38) < 0)
    operator delete(__dst[0]);

  v21 = self;
LABEL_20:

  return v21;
}

- (unint64_t)getMaxTokenLength
{
  return self->_maximumSequenceLength;
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

- (int64_t)revision
{
  return self->_revision;
}

- (void).cxx_destruct
{
  SentencePieceVocabulary *value;

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
