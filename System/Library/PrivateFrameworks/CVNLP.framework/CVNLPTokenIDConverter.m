@implementation CVNLPTokenIDConverter

- (CVNLPTokenIDConverter)initWithResource:(id)a3 andTokenType:(int)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CVNLPTokenIDConverter *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  std::string::size_type size;
  std::string *p_p;
  uint64_t v20;
  __shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v25;
  uint64_t v26;
  AbstractVocabulary *ptr;
  int v28;
  char *v29;
  uint64_t v30;
  AbstractVocabulary *v31;
  char *v32;
  uint64_t v33;
  AbstractVocabulary *v34;
  char *v35;
  uint64_t v36;
  CVNLPTokenIDConverter *v37;
  void *v39;
  std::string v40;
  void *v41;
  std::string v42;
  objc_super v43;
  std::string __p;
  uint64_t v45[4];

  v45[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CVNLPTokenIDConverter;
  v10 = -[CVNLPTokenIDConverter init](&v43, sel_init);
  if (!v10)
    goto LABEL_37;
  objc_msgSend_path(v6, v7, v8, v9);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
  memset(&v42, 0, sizeof(v42));
  v16 = v15 - 1;
  while (*++v16)
    ;
  sub_1B02ECD44(&v42, v15, v16);
  v41 = &unk_1E60CCF80;

  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    sub_1B02EB0A8(&__p, v42.__r_.__value_.__l.__data_, v42.__r_.__value_.__l.__size_);
  else
    __p = v42;
  memset(&v40, 0, sizeof(v40));
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  sub_1B02ECD44(&v40, (char *)p_p, (char *)p_p + size);
  v39 = &unk_1E60CCEF8;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v39 = &unk_1E60CCF80;
  sub_1B037A070((uint64_t)&v39, a4, v45);
  v20 = v45[0];
  if (v45[0])
  {
    v21 = (__shared_weak_count *)operator new();
    v22 = v45[0];
    *(_QWORD *)v21 = &unk_1E60CAAA0;
    *((_QWORD *)v21 + 1) = 0;
    *((_QWORD *)v21 + 2) = 0;
    *((_QWORD *)v21 + 3) = v22;
    v45[0] = 0;
    cntrl = (std::__shared_weak_count *)v10->_vocabTokenizer.__cntrl_;
    v10->_vocabTokenizer.__ptr_ = (AbstractVocabulary *)v20;
    v10->_vocabTokenizer.__cntrl_ = v21;
    if (!cntrl)
      goto LABEL_22;
  }
  else
  {
    v45[0] = 0;
    cntrl = (std::__shared_weak_count *)v10->_vocabTokenizer.__cntrl_;
    v10->_vocabTokenizer.__ptr_ = 0;
    v10->_vocabTokenizer.__cntrl_ = 0;
    if (!cntrl)
      goto LABEL_22;
  }
  p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
  do
    v25 = __ldaxr(p_shared_owners);
  while (__stlxr(v25 - 1, p_shared_owners));
  if (!v25)
  {
    ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
    std::__shared_weak_count::__release_weak(cntrl);
  }
LABEL_22:
  v26 = v45[0];
  v45[0] = 0;
  if (v26)
    (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v40.__r_.__value_.__l.__data_);
    ptr = v10->_vocabTokenizer.__ptr_;
    v28 = *((char *)ptr + 31);
    if ((v28 & 0x80000000) == 0)
      goto LABEL_26;
LABEL_28:
    v29 = (char *)*((_QWORD *)ptr + 1);
    v30 = *((_QWORD *)ptr + 2);
    goto LABEL_29;
  }
  ptr = v10->_vocabTokenizer.__ptr_;
  v28 = *((char *)ptr + 31);
  if (v28 < 0)
    goto LABEL_28;
LABEL_26:
  v29 = (char *)ptr + 8;
  v30 = v28;
LABEL_29:
  v10->_bosTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(_QWORD *)ptr + 40))(ptr, v29, v30);
  v31 = v10->_vocabTokenizer.__ptr_;
  if (*((char *)v31 + 55) < 0)
  {
    v32 = (char *)*((_QWORD *)v31 + 4);
    v33 = *((_QWORD *)v31 + 5);
  }
  else
  {
    v32 = (char *)v31 + 32;
    v33 = *((unsigned __int8 *)v31 + 55);
  }
  v10->_eosTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(_QWORD *)v31 + 40))(v31, v32, v33);
  v34 = v10->_vocabTokenizer.__ptr_;
  if (*((char *)v34 + 79) < 0)
  {
    v35 = (char *)*((_QWORD *)v34 + 7);
    v36 = *((_QWORD *)v34 + 8);
  }
  else
  {
    v35 = (char *)v34 + 56;
    v36 = *((unsigned __int8 *)v34 + 79);
  }
  v10->_unkTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(_QWORD *)v34 + 40))(v34, v35, v36);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
LABEL_37:
  v37 = v10;

  return v37;
}

- (CVNLPTokenIDConverter)initWithLanguageModel:(void *)a3
{
  CVNLPTokenIDConverter *v4;
  CVNLPTokenIDConverter *v5;
  AbstractVocabulary *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;
  std::__shared_weak_count *cntrl;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  AbstractVocabulary *ptr;
  int v17;
  char *v18;
  uint64_t v19;
  AbstractVocabulary *v20;
  char *v21;
  uint64_t v22;
  AbstractVocabulary *v23;
  char *v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CVNLPTokenIDConverter;
  v4 = -[CVNLPTokenIDConverter init](&v27, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v6 = (AbstractVocabulary *)*((_QWORD *)a3 + 15);
  v7 = (std::__shared_weak_count *)*((_QWORD *)a3 + 16);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  cntrl = (std::__shared_weak_count *)v4->_vocabTokenizer.__cntrl_;
  v4->_vocabTokenizer.__ptr_ = v6;
  v4->_vocabTokenizer.__cntrl_ = (__shared_weak_count *)v7;
  if (cntrl)
  {
    v12 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  if (v7)
  {
    v14 = (unint64_t *)&v7->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      ptr = v5->_vocabTokenizer.__ptr_;
      v17 = *((char *)ptr + 31);
      if ((v17 & 0x80000000) == 0)
        goto LABEL_16;
LABEL_18:
      v18 = (char *)*((_QWORD *)ptr + 1);
      v19 = *((_QWORD *)ptr + 2);
      goto LABEL_19;
    }
  }
  ptr = v5->_vocabTokenizer.__ptr_;
  v17 = *((char *)ptr + 31);
  if (v17 < 0)
    goto LABEL_18;
LABEL_16:
  v18 = (char *)ptr + 8;
  v19 = v17;
LABEL_19:
  v5->_bosTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(_QWORD *)ptr + 40))(ptr, v18, v19);
  v20 = v5->_vocabTokenizer.__ptr_;
  if (*((char *)v20 + 55) < 0)
  {
    v21 = (char *)*((_QWORD *)v20 + 4);
    v22 = *((_QWORD *)v20 + 5);
  }
  else
  {
    v21 = (char *)v20 + 32;
    v22 = *((unsigned __int8 *)v20 + 55);
  }
  v5->_eosTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(_QWORD *)v20 + 40))(v20, v21, v22);
  v23 = v5->_vocabTokenizer.__ptr_;
  if (*((char *)v23 + 79) < 0)
  {
    v24 = (char *)*((_QWORD *)v23 + 7);
    v25 = *((_QWORD *)v23 + 8);
  }
  else
  {
    v24 = (char *)v23 + 56;
    v25 = *((unsigned __int8 *)v23 + 79);
  }
  v5->_unkTokenID = (*(uint64_t (**)(AbstractVocabulary *, char *, uint64_t))(*(_QWORD *)v23 + 40))(v23, v24, v25);
  return v5;
}

- (void)enumerateTokenIDsForText:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  AbstractVocabulary *ptr;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  size_t v14;
  unsigned int *v15;
  unint64_t v16;
  char v17;
  void *__p;
  unsigned int *v19;

  v6 = a3;
  v7 = a4;
  ptr = self->_vocabTokenizer.__ptr_;
  if (ptr)
  {
    v9 = objc_retainAutorelease(v6);
    v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
    v14 = strlen(v13);
    (*(void (**)(void **__return_ptr, AbstractVocabulary *, const char *, size_t, _QWORD))(*(_QWORD *)ptr + 24))(&__p, ptr, v13, v14, 0);
    v17 = 0;
    v15 = v19;
    if (v19 != __p)
    {
      v16 = 0;
      v15 = (unsigned int *)__p;
      do
      {
        (*((void (**)(id, uint64_t, _QWORD, _QWORD, char *))v7 + 2))(v7, 0x7FFFFFFFFFFFFFFFLL, 0, v15[v16], &v17);
        v15 = (unsigned int *)__p;
        if (v17)
          break;
        ++v16;
      }
      while (v16 < ((char *)v19 - (_BYTE *)__p) >> 2);
    }
    if (v15)
    {
      v19 = v15;
      operator delete(v15);
    }
  }

}

- (BOOL)enumerateTokensForText:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, id, uint64_t, _BYTE *);
  AbstractVocabulary *ptr;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  size_t v14;
  void **v15;
  void **v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  const UInt8 *v20;
  CFIndex v21;
  __CFString *v22;
  __CFString *v23;
  char **v24;
  char *v25;
  char *v26;
  uint64_t v27;
  BOOL v28;
  void **v29;
  void **v30;
  void *v31;
  BOOL v32;
  std::runtime_error *exception;
  char v35;
  void *__p;
  void **v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, uint64_t, _BYTE *))a4;
  ptr = self->_vocabTokenizer.__ptr_;
  if (!ptr)
  {
    v32 = 0;
    goto LABEL_38;
  }
  v9 = objc_retainAutorelease(v6);
  v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  v14 = strlen(v13);
  (*(void (**)(void **__return_ptr, AbstractVocabulary *, const char *, size_t, _QWORD))(*(_QWORD *)ptr + 16))(&__p, ptr, v13, v14, 0);
  v35 = 0;
  v16 = (void **)__p;
  v15 = v37;
  if (v37 != __p)
  {
    v17 = 0;
    v18 = 0;
    while (1)
    {
      v19 = SHIBYTE(v16[v17 + 2]);
      if (v19 >= 0)
        v20 = (const UInt8 *)&v16[v17];
      else
        v20 = (const UInt8 *)v16[v17];
      if (v19 >= 0)
        v21 = HIBYTE(v16[v17 + 2]);
      else
        v21 = (CFIndex)v16[v17 + 1];
      v22 = (__CFString *)CFStringCreateWithBytes(0, v20, v21, 0x8000100u, 0);
      if (!v22)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      v23 = v22;
      CFRelease(v23);
      v24 = (char **)((char *)__p + v17 * 8);
      if (*((char *)__p + v17 * 8 + 23) < 0)
      {
        v26 = *v24;
        v25 = v24[1];
      }
      else
      {
        v25 = (char *)*((unsigned __int8 *)__p + v17 * 8 + 23);
        v26 = (char *)__p + v17 * 8;
      }
      v27 = (*(uint64_t (**)(AbstractVocabulary *, char *, char *))(*(_QWORD *)self->_vocabTokenizer.__ptr_
                                                                            + 40))(self->_vocabTokenizer.__ptr_, v26, v25);
      v7[2](v7, v23, v27, &v35);
      v28 = v35 == 0;

      if (!v28)
        break;
      ++v18;
      v16 = (void **)__p;
      v15 = v37;
      v17 += 3;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v37 - (_BYTE *)__p) >> 3) <= v18)
      {
        if (__p)
          goto LABEL_19;
        goto LABEL_35;
      }
    }
    v29 = (void **)__p;
    if (!__p)
      goto LABEL_35;
    v30 = v37;
    v31 = __p;
    if (v37 != __p)
    {
      do
      {
        if (*((char *)v30 - 1) < 0)
          operator delete(*(v30 - 3));
        v30 -= 3;
      }
      while (v30 != v29);
      v31 = __p;
    }
    v37 = v29;
    goto LABEL_34;
  }
  v16 = v37;
  if (v37)
  {
LABEL_19:
    if (v15 != v16)
    {
      do
      {
        if (*((char *)v15 - 1) < 0)
          operator delete(*(v15 - 3));
        v15 -= 3;
      }
      while (v15 != v16);
      v15 = (void **)__p;
    }
    v37 = v16;
    v31 = v15;
LABEL_34:
    operator delete(v31);
  }
LABEL_35:
  v32 = 1;
LABEL_38:

  return v32;
}

- (unsigned)bosTokenID
{
  return self->_bosTokenID;
}

- (unsigned)eosTokenID
{
  return self->_eosTokenID;
}

- (unsigned)unkTokenID
{
  return self->_unkTokenID;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_vocabTokenizer.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
