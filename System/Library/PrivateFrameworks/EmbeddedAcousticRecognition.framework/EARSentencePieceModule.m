@implementation EARSentencePieceModule

- (EARSentencePieceModule)initWithModelPath:(id)a3
{
  id v4;
  EARSentencePieceModule *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  EARLogger *v9;
  NSObject *v10;
  EARSentencePieceModule *v11;
  uint64_t v13;
  __int128 __p;
  uint64_t v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EARSentencePieceModule;
  v5 = -[EARSentencePieceModule init](&v16, sel_init);
  if (!v5)
  {
LABEL_18:
    v11 = v5;
    goto LABEL_19;
  }
  _ZNSt3__115allocate_sharedB8ne180100IN13sentencepiece22SentencePieceProcessorENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&__p);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v5->_processor, &__p);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (!*((_QWORD *)&__p + 1))
    goto LABEL_6;
  v7 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    if (v4)
      goto LABEL_7;
  }
  else
  {
LABEL_6:
    if (v4)
    {
LABEL_7:
      objc_msgSend(v4, "ear_toString");
      goto LABEL_10;
    }
  }
  __p = 0uLL;
  v15 = 0;
LABEL_10:
  v9 = (EARLogger *)(*(_QWORD *(**)(uint64_t *__return_ptr))(*(_QWORD *)v5->_processor.__ptr_ + 16))(&v13);
  if (!v13)
  {
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v13);
    if (SHIBYTE(v15) < 0)
      operator delete((void *)__p);
    goto LABEL_18;
  }
  EARLogger::QuasarOSLogger(v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[EARSentencePieceModule initWithModelPath:].cold.1(v10);

  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v13);
  if (SHIBYTE(v15) < 0)
    operator delete((void *)__p);
  v11 = 0;
LABEL_19:

  return v11;
}

- (void)dealloc
{
  shared_ptr<sentencepiece::SentencePieceProcessor> *p_processor;
  SentencePieceProcessor *ptr;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  objc_super v8;
  __int128 v9;

  ptr = self->_processor.__ptr_;
  p_processor = &self->_processor;
  if (ptr)
  {
    v9 = 0uLL;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)p_processor, &v9);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EARSentencePieceModule;
  -[EARSentencePieceModule dealloc](&v8, sel_dealloc);
}

- (int64_t)setEncodeOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v8;
  void *__p;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p = 0;
    v10 = 0;
    v11 = 0;
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_processor.__ptr_ + 64))(&v8);
  v6 = sentencepiece::util::Status::code((sentencepiece::util::Status *)&v8);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v8);
  if (SHIBYTE(v11) < 0)
    operator delete(__p);

  return v6;
}

- (id)encodeUtterance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int *v7;
  unsigned int *v8;
  void *v9;
  uint64_t v11;
  void *__p;
  unsigned int *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  __p = 0;
  v13 = 0;
  v14 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_processor.__ptr_ + 112))(&v11);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v11);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (unsigned int *)__p;
  v8 = v13;
  if (__p != v13)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      ++v7;
    }
    while (v7 != v8);
  }
  if (__p)
  {
    v13 = (unsigned int *)__p;
    operator delete(__p);
  }
  if (SHIBYTE(v17) < 0)
    operator delete(v15);

  return v6;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_processor);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)initWithModelPath:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AD756000, log, OS_LOG_TYPE_FAULT, "Cannot create SPM model", v1, 2u);
}

@end
