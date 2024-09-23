@implementation DYDisplayLinkInterposer

- (DYDisplayLinkInterposer)initWithTarget:(id)a3 selector:(SEL)a4
{
  DYDisplayLinkInterposer *v6;
  volatile int *v7;
  volatile int *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DYDisplayLinkInterposer;
  v6 = -[DYDisplayLinkInterposer init](&v11, sel_init);
  if (v6)
  {
    v6->_target = a3;
    v6->_sel = a4;
    GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, v7);
    if (!spDisplayLinkIdleTime)
    {
      v9 = operator new();
      *(_OWORD *)v9 = 0u;
      *(_OWORD *)(v9 + 16) = 0u;
      *(_DWORD *)(v9 + 32) = 1065353216;
      spDisplayLinkIdleTime = v9;
    }
    GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, v8);
  }
  return v6;
}

- (void)forwardDisplayLinkCallback:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  volatile int *v8;
  pthread_t v9;
  pthread_t *v10;

  if (self->_endTimestamp)
  {
    GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, (volatile int *)a2);
    v5 = mach_absolute_time() - self->_endTimestamp;
    if (g_DYTimebaseInfo != dword_256BC8DD4)
      v5 = __udivti3();
    v6 = spDisplayLinkIdleTime;
    v9 = pthread_self();
    v10 = &v9;
    v7 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,unsigned long long>>>::__emplace_unique_key_args<_opaque_pthread_t *,std::piecewise_construct_t const&,std::tuple<_opaque_pthread_t *&&>,std::tuple<>>(v6, &v9, (uint64_t)&std::piecewise_construct, &v10);
    v7[3] += v5;
    GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdleTimeLock, v8);
  }
  objc_msgSend(self->_target, self->_sel, a3);
  self->_endTimestamp = mach_absolute_time();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYDisplayLinkInterposer;
  -[DYDisplayLinkInterposer dealloc](&v3, sel_dealloc);
}

@end
