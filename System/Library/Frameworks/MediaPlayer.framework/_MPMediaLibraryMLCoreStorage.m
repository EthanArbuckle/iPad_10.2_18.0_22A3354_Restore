@implementation _MPMediaLibraryMLCoreStorage

- (shared_ptr<mlcore::DeviceLibrary>)_MediaLibrary_coreLibrary
{
  DeviceLibrary **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<mlcore::DeviceLibrary> result;

  cntrl = self->__MediaLibrary_coreLibrary.__cntrl_;
  *v2 = self->__MediaLibrary_coreLibrary.__ptr_;
  v2[1] = (DeviceLibrary *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (DeviceLibrary *)self;
  return result;
}

- (void)set_MediaLibrary_coreLibrary:(shared_ptr<mlcore::DeviceLibrary>)a3
{
  __shared_weak_count *v3;
  DeviceLibrary *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(DeviceLibrary **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->__MediaLibrary_coreLibrary.__cntrl_;
  self->__MediaLibrary_coreLibrary.__ptr_ = v4;
  self->__MediaLibrary_coreLibrary.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
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

- (void).cxx_destruct
{
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->__MediaLibrary_coreLibrary);
}

@end
