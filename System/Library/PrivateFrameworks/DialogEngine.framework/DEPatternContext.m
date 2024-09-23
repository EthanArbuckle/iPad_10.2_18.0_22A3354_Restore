@implementation DEPatternContext

- (DEPatternContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DEPatternContext;
  return -[DEPatternContext init](&v3, sel_init);
}

- (DEPatternContext)initWithSharedPtr:(void *)a3
{
  DEPatternContext *v4;
  DEPatternContext *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DEPatternContext;
  v4 = -[DEPatternContext init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
    v13 = *(_QWORD *)a3;
    v14 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[DEPatternContext setThis:](v4, "setThis:", &v13);
    v9 = v14;
    if (v14)
    {
      v10 = (unint64_t *)&v14->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  return v5;
}

- (shared_ptr<siri::dialogengine::PatternContext>)getSharedPtr
{
  PatternContext **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<siri::dialogengine::PatternContext> result;

  cntrl = self->_This.__cntrl_;
  *v2 = self->_This.__ptr_;
  v2[1] = (PatternContext *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PatternContext *)self;
  return result;
}

- (shared_ptr<siri::dialogengine::PatternContext>)This
{
  void *v2;
  PatternContext *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::PatternContext> result;

  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__49730);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(shared_ptr<siri::dialogengine::PatternContext>)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__49729);
}

- (void).cxx_destruct
{
  std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>::~shared_ptr[abi:ne180100]((uint64_t)&self->_This);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
