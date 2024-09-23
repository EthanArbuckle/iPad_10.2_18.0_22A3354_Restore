@implementation DS_TKeyValueObserverGlue

- (DS_TKeyValueObserverGlue)initWithFunctor:(const void *)a3 observedObjects:(const void *)a4 observedKeyPath:(const void *)a5
{
  DS_TKeyValueObserverGlue *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DS_TKeyValueObserverGlue;
  v8 = -[DS_TKeyValueObserverGlue init](&v10, sel_init);
  std::function<void ()(void)>::operator=(v8->_functor.__f_.__buf_.__lx, (uint64_t)a3);
  -[DS_TKeyValueObserverGlue initCommon:observedKeyPath:](v8, "initCommon:observedKeyPath:", a4, a5);
  return v8;
}

- (DS_TKeyValueObserverGlue)initWithFunctorWithChange:(const void *)a3 observedObjects:(const void *)a4 observedKeyPath:(const void *)a5
{
  DS_TKeyValueObserverGlue *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DS_TKeyValueObserverGlue;
  v8 = -[DS_TKeyValueObserverGlue init](&v10, sel_init);
  std::function<void ()(NSDictionary<NSString *,NSObject *> *)>::operator=(v8->_functorWithChange.__f_.__buf_.__lx, (uint64_t)a3);
  -[DS_TKeyValueObserverGlue initCommon:observedKeyPath:](v8, "initCommon:observedKeyPath:", a4, a5);
  return v8;
}

- (void)initCommon:(const void *)a3 observedKeyPath:(const void *)a4
{
  std::__hash_table<NSObject *,std::hash<std::hash>,std::equal_to<std::hash>,std::allocator<std::hash>>::operator=((uint64_t)&self->_observedObjects, (uint64_t)a3);
  if (&self->_observedKeyPath != a4)
    TString::SetStringRefAsImmutable(&self->_observedKeyPath, *(TString **)a4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *f;
  objc_super v14;
  id v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (operator==((void **)&self->_observedKeyPath.fString.fRef, v10)
    && (v15 = v11,
        std::__hash_table<NSObject *,std::hash<std::hash>,std::equal_to<std::hash>,std::allocator<std::hash>>::find<std::hash>(&self->_observedObjects.__table_.__bucket_list_.__ptr_.__value_, &v15)))
  {
    f = self->_functor.__f_.__f_;
    if (f)
    {
      (*(void (**)(void *))(*(_QWORD *)f + 48))(f);
    }
    else if (self->_functorWithChange.__f_.__f_)
    {
      std::function<void ()(NSDictionary<NSString *,NSObject *> *)>::operator()((uint64_t)&self->_functorWithChange, v12);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)DS_TKeyValueObserverGlue;
    -[DS_TKeyValueObserverGlue observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void).cxx_destruct
{
  DS_TKeyValueObserverGlue *f;
  uint64_t v4;
  DS_TKeyValueObserverGlue *p_functor;
  uint64_t v6;

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&self->_observedKeyPath.fString.fRef);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_observedObjects);
  f = (DS_TKeyValueObserverGlue *)self->_functorWithChange.__f_.__f_;
  if (f == (DS_TKeyValueObserverGlue *)&self->_functorWithChange)
  {
    v4 = 4;
    f = (DS_TKeyValueObserverGlue *)&self->_functorWithChange;
  }
  else
  {
    if (!f)
      goto LABEL_6;
    v4 = 5;
  }
  (*((void (**)(void))f->super.isa + v4))();
LABEL_6:
  p_functor = (DS_TKeyValueObserverGlue *)self->_functor.__f_.__f_;
  if (p_functor == (DS_TKeyValueObserverGlue *)&self->_functor)
  {
    v6 = 4;
    p_functor = (DS_TKeyValueObserverGlue *)&self->_functor;
  }
  else
  {
    if (!p_functor)
      return;
    v6 = 5;
  }
  (*((void (**)(void))p_functor->super.isa + v6))();
}

- (id).cxx_construct
{
  self->_functor.__f_.__f_ = 0;
  *(_OWORD *)&self->_functorWithChange.__f_.__f_ = 0u;
  *(_OWORD *)&self->_observedObjects.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0u;
  self->_observedObjects.__table_.__p2_.__value_ = 0;
  *(_DWORD *)self->_anon_70 = 1065353216;
  self->_observedKeyPath.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  return self;
}

@end
