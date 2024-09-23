@implementation NodeContextClose

void __NodeContextClose_block_invoke()
{
  dispatch_group_t v0;
  void *v1;

  v0 = dispatch_group_create();
  v1 = (void *)gNodeContextCloseAsyncGroup;
  gNodeContextCloseAsyncGroup = (uint64_t)v0;

}

void __NodeContextClose_block_invoke_6()
{
  std::__shared_weak_count *v0;
  unint64_t *v1;
  unint64_t v2;
  __int128 v3;

  std::mutex::lock(&gNodeContextCloseAsyncSignpostLock);
  v3 = 0uLL;
  std::shared_ptr<TCFURLInfo>::operator=[abi:ne180100]((uint64_t)&gNodeContextCloseAsyncSignpost, &v3);
  v0 = (std::__shared_weak_count *)*((_QWORD *)&v3 + 1);
  if (*((_QWORD *)&v3 + 1))
  {
    v1 = (unint64_t *)(*((_QWORD *)&v3 + 1) + 8);
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 - 1, v1));
    if (!v2)
    {
      ((void (*)(std::__shared_weak_count *))v0->__on_zero_shared)(v0);
      std::__shared_weak_count::__release_weak(v0);
    }
  }
  std::mutex::unlock(&gNodeContextCloseAsyncSignpostLock);
}

@end
