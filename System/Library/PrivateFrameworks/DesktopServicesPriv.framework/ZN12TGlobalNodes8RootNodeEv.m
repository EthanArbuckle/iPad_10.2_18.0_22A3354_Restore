@implementation ZN12TGlobalNodes8RootNodeEv

const void **___ZN12TGlobalNodes8RootNodeEv_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;
  TNodePtr v11;
  id obj;
  uint64_t v13;
  std::__shared_weak_count *v14;
  int v15;
  TString v16;

  TString::TString(&v16, "Computer", 8uLL);
  v15 = 83886081;
  LOBYTE(obj) = 1;
  std::allocate_shared[abi:ne180100]<TFSInfo,std::allocator<TFSInfo>,FSInfoVirtualType,TString &,TCatalogInfo &,void>((char *)&obj, &v16, (unsigned __int8 *)&v15, &v13);
  TNodePtr::TNodePtr(&v11, 0);
  v9 = 0;
  v10 = 0;
  TNode::CreateNode((uint64_t)&v11, (uint64_t)&v13, (uint64_t)&v9, (TNodePtr *)&obj);
  v2 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  objc_storeStrong(*(id **)(a1 + 32), obj);
  v5 = v14;
  if (v14)
  {
    v6 = (unint64_t *)&v14->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v16.fString.fRef);
}

@end
