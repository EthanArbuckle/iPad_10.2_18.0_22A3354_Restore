@implementation SNProcessingContext

- (shared_ptr<SoundAnalysis::ProcessingContext>)processingContext
{
  ProcessingContext **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<SoundAnalysis::ProcessingContext> result;

  cntrl = self->_processingContext.__cntrl_;
  *v2 = self->_processingContext.__ptr_;
  v2[1] = (ProcessingContext *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ProcessingContext *)self;
  return result;
}

- (SNProcessingContext)initWithGraph:(id)a3 sharedProcessingGraph:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  SNProcessingContext *v10;
  uint64_t v11;
  ProcessingContext *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  __n128 (*v29)(__n128 *, __n128 *);
  uint64_t (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SNProcessingContext;
  v10 = -[SNProcessingContext init](&v34, sel_init);
  if (v10)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x4012000000;
    v29 = sub_1D44DA86C;
    v30 = sub_1D44DA87C;
    v32 = 0;
    v33 = 0;
    v31 = &unk_1D45DB8F5;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1D44DA884;
    v22[3] = &unk_1E97C42D0;
    v25 = &v26;
    v23 = v8;
    v24 = v9;
    if (sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v22, (uint64_t)a5))
    {
      v12 = (ProcessingContext *)v27[6];
      v11 = v27[7];
      if (v11)
      {
        v13 = (unint64_t *)(v11 + 8);
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }
      cntrl = (std::__shared_weak_count *)v10->_processingContext.__cntrl_;
      v10->_processingContext.__ptr_ = v12;
      v10->_processingContext.__cntrl_ = (__shared_weak_count *)v11;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
    }
    else
    {

      v10 = 0;
    }

    _Block_object_dispose(&v26, 8);
    v18 = v33;
    if (v33)
    {
      v19 = (unint64_t *)&v33->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  sub_1D44DAAE4((uint64_t)&self->_processingContext);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
