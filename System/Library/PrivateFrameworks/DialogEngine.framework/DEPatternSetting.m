@implementation DEPatternSetting

- (DEPatternSetting)init
{
  DEPatternSetting *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v7;
  std::__shared_weak_count *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DEPatternSetting;
  v2 = -[DEParameter init](&v9, sel_init);
  if (v2)
  {
    -[DEPatternSetting setThis:](v2, "setThis:", &v7, _ZNSt3__115allocate_sharedB8ne180100IN4siri12dialogengine14PatternSettingENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v7));
    v3 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
  return v2;
}

- (DEPatternSetting)initWithSharedPtr:(void *)a3
{
  DEPatternSetting *v4;
  DEPatternSetting *v5;
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
  v15.super_class = (Class)DEPatternSetting;
  v4 = -[DEParameter init](&v15, sel_init);
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
    -[DEPatternSetting setThis:](v4, "setThis:", &v13);
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

- (void)getSharedPtr
{
  return &self->_This;
}

- (NSString)defaultValueFromSetting
{
  void *v2;
  std::string *v3;
  void *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::string v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DEPatternSetting This](self, "This");
  if (*(char *)(v8 + 359) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)(v8 + 336), *(_QWORD *)(v8 + 344));
  else
    v10 = *(std::string *)(v8 + 336);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v10;
  else
    v3 = (std::string *)v10.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return (NSString *)v4;
}

- (shared_ptr<siri::dialogengine::PatternSetting>)This
{
  void *v2;
  PatternSetting *v3;
  __shared_weak_count *v4;
  shared_ptr<siri::dialogengine::PatternSetting> result;

  objc_copyCppObjectAtomic(v2, &self->_This, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__2333);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setThis:(shared_ptr<siri::dialogengine::PatternSetting>)a3
{
  objc_copyCppObjectAtomic(&self->_This, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__2332);
}

- (void).cxx_destruct
{
  std::shared_ptr<siri::dialogengine::VisualComponentsCombination::Entry>::~shared_ptr[abi:ne180100]((uint64_t)&self->_This);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
