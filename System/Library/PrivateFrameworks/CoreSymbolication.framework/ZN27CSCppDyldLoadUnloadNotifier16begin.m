@implementation ZN27CSCppDyldLoadUnloadNotifier16begin

_QWORD *___ZN27CSCppDyldLoadUnloadNotifier16begin_processingER17CSCppSymbolicatory_block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 64))
  {
    v2 = result;
    *(_QWORD *)v1 = result[5];
    *(_QWORD *)(v1 + 40) = result[6];
    *(_BYTE *)(v1 + 64) = 1;
    v3 = *(_QWORD *)(v1 + 16);
    v4 = *(_QWORD *)(v1 + 24);
    if (v3 != v4)
    {
      do
      {
        v9 = 0;
        v10 = 0;
        std::shared_ptr<CSCppSymbolOwner>::operator=[abi:ne180100](&v9, (uint64_t *)v3);
        v5 = *(_QWORD *)(v3 + 16);
        if (v5 > *(_QWORD *)(v1 + 40))
          CSCppSymbolicator::dyld_activity(v2[5], &v9, v5, *(unsigned __int8 *)(v3 + 24));
        v6 = v10;
        if (v10)
        {
          p_shared_owners = (unint64_t *)&v10->__shared_owners_;
          do
            v8 = __ldaxr(p_shared_owners);
          while (__stlxr(v8 - 1, p_shared_owners));
          if (!v8)
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
        }
        v3 += 32;
      }
      while (v3 != v4);
      v3 = *(_QWORD *)(v1 + 16);
      for (result = *(_QWORD **)(v1 + 24);
            result != (_QWORD *)v3;
    }
    *(_QWORD *)(v1 + 24) = v3;
  }
  return result;
}

@end
