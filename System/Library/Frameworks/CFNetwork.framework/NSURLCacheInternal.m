@implementation NSURLCacheInternal

- (void)dealloc
{
  void *cacheRef;
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  objc_super v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  cacheRef = self->_cacheRef;
  if (cacheRef)
  {
    v5 = *((_QWORD *)cacheRef + 2);
    v4 = (std::__shared_weak_count *)*((_QWORD *)cacheRef + 3);
    v11 = v5;
    v12 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    pthread_mutex_lock((pthread_mutex_t *)(v5 + 56));
    *(_BYTE *)(v5 + 40) = 1;
    CFRelease(self->_cacheRef);
    pthread_mutex_unlock((pthread_mutex_t *)(v5 + 56));
    if (v4)
    {
      v8 = (unint64_t *)&v4->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)NSURLCacheInternal;
  -[NSURLCacheInternal dealloc](&v10, sel_dealloc);
}

@end
