@implementation _EARLmEvaluator

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARLmEvaluator)initWithConfiguration:(id)a3 root:(id)a4 recognizerConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EARLmEvaluator *v11;
  void *v12;
  char v13;
  NSObject *v14;
  _EARLmEvaluator *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p;
  char v21;
  void *v22;
  char v23;
  __int128 v24;
  objc_super v25;
  __int128 buf;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_EARLmEvaluator;
  v11 = -[_EARLmEvaluator init](&v25, sel_init);
  if (!v11)
  {
LABEL_25:
    v15 = v11;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v8);

  if ((v13 & 1) != 0)
  {
    if (v8)
    {
      objc_msgSend(v8, "ear_toString");
      if (v9)
        goto LABEL_5;
    }
    else
    {
      buf = 0uLL;
      v27 = 0;
      if (v9)
      {
LABEL_5:
        objc_msgSend(v9, "ear_toString");
        if (v10)
        {
LABEL_6:
          objc_msgSend(v10, "ear_toString");
          goto LABEL_13;
        }
LABEL_12:
        __p = 0;
        v21 = 0;
LABEL_13:
        std::allocate_shared[abi:ne180100]<quasar::LmEvaluator,std::allocator<quasar::LmEvaluator>,std::string,std::string,std::string,void>(&v24);
        std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v11->_evaluator, &v24);
        v16 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
        if (*((_QWORD *)&v24 + 1))
        {
          v17 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
          do
            v18 = __ldaxr(v17);
          while (__stlxr(v18 - 1, v17));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
          }
        }
        if (v21 < 0)
          operator delete(__p);
        if (v23 < 0)
          operator delete(v22);
        if (SHIBYTE(v27) < 0)
          operator delete((void *)buf);
        v11->_roundingEnabled = 1;
        goto LABEL_25;
      }
    }
    v22 = 0;
    v23 = 0;
    if (v10)
      goto LABEL_6;
    goto LABEL_12;
  }
  EarLmLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1AD756000, v14, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
  }

  v15 = 0;
LABEL_26:

  return v15;
}

- (_EARLmEvaluator)initWithConfiguration:(id)a3 recognizerConfiguration:(id)a4
{
  return -[_EARLmEvaluator initWithConfiguration:root:recognizerConfiguration:](self, "initWithConfiguration:root:recognizerConfiguration:", a3, &stru_1E5D49530, a4);
}

- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 result:(id *)a5
{
  int v6;

  v6 = 0;
  return -[_EARLmEvaluator runEvaluationWithData:handle:result:bestWeight:](self, "runEvaluationWithData:handle:result:bestWeight:", a3, a4, a5, &v6);
}

- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 result:(id *)a5 bestWeight:(float *)a6
{
  id v10;
  id v11;
  double v12;
  LmEvaluator *ptr;
  char v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  _BYTE v25[72];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (a5)
    *a5 = 0;
  v12 = quasar::PTree::PTree((quasar::PTree *)v25);
  if (v11)
  {
    objc_msgSend(v11, "handle", v12);
  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  ptr = self->_evaluator.__ptr_;
  objc_msgSend(v10, "data");
  v14 = quasar::LmEvaluator::runEvaluation((uint64_t)ptr, v21, &v23, (quasar *)v25, a6, self->_roundingEnabled, 0);
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)())v22->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v22);
      if (!a5)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  if (a5)
  {
LABEL_11:
    EARHelpers::dictFromPTree((EARHelpers *)v25, (const quasar::PTree *)1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v17 = v24;
  if (v24)
  {
    v18 = (unint64_t *)&v24->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  quasar::PTree::~PTree((quasar::PTree *)v25);

  return v14;
}

- (BOOL)runEvaluationWithData:(id)a3 handle:(id)a4 shouldStop:(id)a5 result:(id *)a6 bestWeight:(float *)a7
{
  return -[_EARLmEvaluator runEvaluationWithData:handle:result:bestWeight:](self, "runEvaluationWithData:handle:result:bestWeight:", a3, a4, a6, a7);
}

- (BOOL)roundingEnabled
{
  return self->_roundingEnabled;
}

- (void)setRoundingEnabled:(BOOL)a3
{
  self->_roundingEnabled = a3;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_evaluator);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
