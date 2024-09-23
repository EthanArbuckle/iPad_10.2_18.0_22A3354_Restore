@implementation ATIOBinding

- (ATIOBinding)initWithImpl:(shared_ptr<const AT::IOBinding::Impl>)a3
{
  std::shared_ptr<ClientEntry>::operator=[abi:ne180100](&self->mImpl.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
  return self;
}

- (ATIOBinding)initWithAudioSession:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v11;

  v4 = a3;
  v5 = operator new(0x48uLL);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = &off_1E450E970;
  v6 = v4;
  v5[4] = 0;
  v5[3] = 0;
  *((_DWORD *)v5 + 10) = 1;
  v5[7] = 0;
  v5[8] = 0;
  v5[6] = v6;
  *(_QWORD *)&v11 = v5 + 3;
  *((_QWORD *)&v11 + 1) = v5;
  std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&v11, v5 + 3, (uint64_t)(v5 + 3));
  std::shared_ptr<PowerUsageWatchdog::ClientDescription>::operator=[abi:ne180100]((uint64_t)&self->mImpl, &v11);
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return self;
}

- (ATIOBinding)initWithAudioSessionID:(unsigned int)a3
{

  return 0;
}

- (ATIOBinding)initWithDeviceUID:(id)a3
{
  id v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  CFTypeRef cf;
  __int128 v11;

  v4 = a3;
  v5 = v4;
  if (v4)
    CFRetain(v4);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v5);

  std::allocate_shared[abi:ne180100]<AT::IOBinding::Impl,std::allocator<AT::IOBinding::Impl>,applesauce::CF::StringRef,void>(&v11, &cf);
  std::shared_ptr<PowerUsageWatchdog::ClientDescription>::operator=[abi:ne180100]((uint64_t)&self->mImpl, &v11);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (cf)
    CFRelease(cf);

  return self;
}

- (ATIOBinding)initWithDeviceID:(unsigned int)a3
{
  char *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v10;

  v5 = (char *)operator new(0x48uLL);
  *(_OWORD *)(v5 + 8) = 0u;
  *(_QWORD *)v5 = &off_1E450E970;
  *(_OWORD *)(v5 + 24) = 0u;
  *((_DWORD *)v5 + 10) = 2;
  *((_QWORD *)v5 + 6) = 0;
  uidOfDevice((applesauce::CF::StringRef *)(v5 + 56), a3);
  *((_DWORD *)v5 + 16) = a3;
  *((_DWORD *)v5 + 17) = 0;
  *(_QWORD *)&v10 = v5 + 24;
  *((_QWORD *)&v10 + 1) = v5;
  std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&v10, (_QWORD *)v10, v10);
  std::shared_ptr<PowerUsageWatchdog::ClientDescription>::operator=[abi:ne180100]((uint64_t)&self->mImpl, &v10);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return self;
}

- (ATIOBinding)initWithUseCaseID:(ATIsolatedAudioUseCaseID)a3
{
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;

  std::allocate_shared[abi:ne180100]<AT::IOBinding::Impl,std::allocator<AT::IOBinding::Impl>,ATIsolatedAudioUseCaseID &,void>(&v8, a3.var0);
  std::shared_ptr<PowerUsageWatchdog::ClientDescription>::operator=[abi:ne180100]((uint64_t)&self->mImpl, &v8);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  Impl *ptr;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ptr = self->mImpl.__ptr_;
    v6 = v4[1];
    if (ptr)
      v7 = AT::IOBinding::Impl::operator==((uint64_t)ptr, v6);
    else
      v7 = v6 == 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void **v2;
  void *v3;
  void *__p[2];
  char v6;

  AT::IOBinding::Impl::description((AT::IOBinding::Impl *)__p, (uint64_t)self->mImpl.__ptr_);
  if (v6 >= 0)
    v2 = __p;
  else
    v2 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 < 0)
    operator delete(__p[0]);
  return v3;
}

- (AVAudioSession)session
{
  return (AVAudioSession *)*((id *)self->mImpl.__ptr_ + 3);
}

- (unsigned)sessionID
{
  return objc_msgSend(*((id *)self->mImpl.__ptr_ + 3), "opaqueSessionID");
}

- (NSString)deviceUID
{
  return (NSString *)*((id *)self->mImpl.__ptr_ + 4);
}

- (unsigned)deviceID
{
  return *((_DWORD *)self->mImpl.__ptr_ + 10);
}

- (ATIsolatedAudioUseCaseID)useCaseID
{
  return *(ATIsolatedAudioUseCaseID *)((char *)self->mImpl.__ptr_ + 44);
}

- (void)encodeWithCoder:(id)a3
{
  Impl *ptr;
  int v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;

  ptr = self->mImpl.__ptr_;
  v7 = a3;
  objc_msgSend(v7, "encodeInt:forKey:", *((unsigned int *)ptr + 4), CFSTR("variant"));
  v4 = *((_DWORD *)ptr + 4);
  switch(v4)
  {
    case 1:
      v5 = objc_msgSend(*((id *)ptr + 3), "opaqueSessionID");
      v6 = CFSTR("sessionID");
      goto LABEL_6;
    case 2:
      objc_msgSend(v7, "encodeObject:forKey:", *((_QWORD *)ptr + 4), CFSTR("deviceUID"));
      break;
    case 3:
      v5 = *((unsigned int *)ptr + 11);
      v6 = CFSTR("useCaseID");
LABEL_6:
      objc_msgSend(v7, "encodeInt32:forKey:", v5, v6);
      break;
  }

}

- (ATIOBinding)initWithCoder:(id)a3
{
  id v4;
  ATIOBinding *v5;
  id v6;
  int v7;
  unsigned int v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::runtime_error *exception;
  __int128 v18;
  objc_super v19;
  CFTypeRef cf;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ATIOBinding;
  v5 = -[ATIOBinding init](&v19, sel_init);
  if (!v5)
    goto LABEL_16;
  v6 = v4;
  v7 = objc_msgSend(v6, "decodeIntForKey:", CFSTR("variant"));
  if (v7 == 2)
  {
    objc_msgSend(v6, "decodeObjectForKey:", CFSTR("deviceUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      v12 = v11;
      if (v11)
        CFRetain(v11);
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v12);

      std::allocate_shared[abi:ne180100]<AT::IOBinding::Impl,std::allocator<AT::IOBinding::Impl>,applesauce::CF::StringRef,void>(&v18, &cf);
      if (cf)
        CFRelease(cf);

      goto LABEL_11;
    }

LABEL_18:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unable to decode ATIOBinding");
  }
  if (v7 != 3)
    goto LABEL_18;
  v8 = objc_msgSend(v6, "decodeInt32ForKey:", CFSTR("useCaseID"));
  v9 = operator new(0x48uLL);
  v9[1] = 0;
  v9[2] = 0;
  *v9 = &off_1E450E970;
  AT::IOBinding::Impl::Impl((uint64_t)(v9 + 3), v8);
  *(_QWORD *)&v18 = v9 + 3;
  *((_QWORD *)&v18 + 1) = v9;
  std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&v18, (_QWORD *)v18, v18);
LABEL_11:

  std::shared_ptr<PowerUsageWatchdog::ClientDescription>::operator=[abi:ne180100]((uint64_t)&v5->mImpl, &v18);
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
LABEL_16:

  return v5;
}

- (void).cxx_destruct
{
  std::shared_ptr<PowerUsageWatchdog::ClientDescription>::~shared_ptr[abi:ne180100]((uint64_t)&self->mImpl);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
