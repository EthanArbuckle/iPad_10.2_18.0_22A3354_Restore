@implementation _EARNgramLmModel2

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (id)_initWithModel:(shared_ptr<quasar::NgramLmModel2>)a3
{
  uint64_t *ptr;
  _EARNgramLmModel2 *v4;
  _EARNgramLmModel2 *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)_EARNgramLmModel2;
  v4 = -[_EARNgramLmModel2 init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v4->_ngramModel.__ptr_, ptr);
  return v5;
}

- (BOOL)writeToDirectory:(id)a3
{
  id v4;
  void *v5;
  NgramLmModel2 *ptr;
  char v7;
  void *__p[2];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->_ngramModel.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
  }
  v7 = quasar::LmModel2::write((_BYTE *)ptr + 656, (uint64_t)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

  return v7;
}

- (void)setProtectionClass:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NgramLmModel2 *ptr;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((id)*MEMORY[0x1E0CB2AB0] == v4)
  {
    ptr = self->_ngramModel.__ptr_;
    v8 = 1;
LABEL_12:
    *((_DWORD *)ptr + 198) = v8;
    goto LABEL_13;
  }
  if ((id)*MEMORY[0x1E0CB2AB8] == v4)
  {
    ptr = self->_ngramModel.__ptr_;
    v8 = 2;
    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CB2AC0] == v4)
  {
    ptr = self->_ngramModel.__ptr_;
    v8 = 3;
    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CB2AE0] == v4)
  {
    ptr = self->_ngramModel.__ptr_;
    v8 = 4;
    goto LABEL_12;
  }
  EarLmLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1AD756000, v6, OS_LOG_TYPE_DEFAULT, "Unknown protection class: %@", (uint8_t *)&v9, 0xCu);
  }

LABEL_13:
}

- (NSString)arpaFileName
{
  void *v2;
  NgramLmModel2 *ptr;
  void **v4;
  void *v5;
  void *v7[2];
  char v8;
  void *__p[2];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  ptr = self->_ngramModel.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(v7, "");
  quasar::NgramLmModel2::getArpaFileName((uint64_t)ptr, (uint64_t)v7, __p);
  if (v10 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  objc_msgSend(v2, "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 < 0)
    operator delete(__p[0]);
  if (v8 < 0)
    operator delete(v7[0]);
  return (NSString *)v5;
}

- (shared_ptr<quasar::NgramLmModel2>)ngramModel
{
  NgramLmModel2 **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::NgramLmModel2> result;

  cntrl = self->_ngramModel.__cntrl_;
  *v2 = self->_ngramModel.__ptr_;
  v2[1] = (NgramLmModel2 *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (NgramLmModel2 *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_ngramModel);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
