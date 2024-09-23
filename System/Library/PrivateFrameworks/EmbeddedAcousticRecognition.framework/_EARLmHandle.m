@implementation _EARLmHandle

- (id)_initWithHandle:(shared_ptr<kaldi::quasar::LmHandle>)a3
{
  uint64_t *ptr;
  _EARLmHandle *v4;
  _EARLmHandle *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)_EARLmHandle;
  v4 = -[_EARLmHandle init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v4->_handle.__ptr_, ptr);
  return v5;
}

- (shared_ptr<kaldi::quasar::LmHandle>)handle
{
  LmHandle **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<kaldi::quasar::LmHandle> result;

  cntrl = self->_handle.__cntrl_;
  *v2 = self->_handle.__ptr_;
  v2[1] = (LmHandle *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LmHandle *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_handle);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
