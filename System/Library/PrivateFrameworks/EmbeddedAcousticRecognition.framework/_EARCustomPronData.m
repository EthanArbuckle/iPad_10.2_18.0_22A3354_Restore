@implementation _EARCustomPronData

- (_EARCustomPronData)initWithCustomPronData:(shared_ptr<quasar::CustomPronData>)a3
{
  uint64_t *ptr;
  _EARCustomPronData *v4;
  _EARCustomPronData *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)_EARCustomPronData;
  v4 = -[_EARCustomPronData init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v4->_data.__ptr_, ptr);
  return v5;
}

- (BOOL)isValid
{
  return *(_BYTE *)self->_data.__ptr_;
}

- (id)validationError
{
  CustomPronData *ptr;
  _QWORD *v3;

  ptr = self->_data.__ptr_;
  v3 = (_QWORD *)((char *)ptr + 8);
  if (*((char *)ptr + 31) < 0)
    v3 = (_QWORD *)*v3;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
}

- (id)getProns
{
  return EARHelpers::VectorToArray<quasar::AppLmData::Oov,_EAROovToken * (*)(quasar::AppLmData::Oov const&)>((__int128 **)self->_data.__ptr_ + 4, (void (*)(std::string *))_earOovTokenFromAppLmDataOov);
}

- (id)getRejectedProns
{
  return EARHelpers::VectorToArray<quasar::AppLmData::Oov,_EAROovToken * (*)(quasar::AppLmData::Oov const&)>((__int128 **)self->_data.__ptr_ + 7, (void (*)(std::string *))_earOovTokenFromAppLmDataOov);
}

- (shared_ptr<quasar::CustomPronData>)data
{
  CustomPronData **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::CustomPronData> result;

  cntrl = self->_data.__cntrl_;
  *v2 = self->_data.__ptr_;
  v2[1] = (CustomPronData *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CustomPronData *)self;
  return result;
}

- (void)setData:(shared_ptr<quasar::CustomPronData>)a3
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&self->_data.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_data);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
