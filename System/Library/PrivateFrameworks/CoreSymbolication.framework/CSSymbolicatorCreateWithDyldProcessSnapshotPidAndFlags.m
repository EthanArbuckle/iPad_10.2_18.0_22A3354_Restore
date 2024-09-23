@implementation CSSymbolicatorCreateWithDyldProcessSnapshotPidAndFlags

void __CSSymbolicatorCreateWithDyldProcessSnapshotPidAndFlags_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  __int128 v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  __n128 (*v20)(_QWORD *, uint64_t);
  void (*v21)(uint64_t);
  void *__p;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t (*v30)();
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v34[0] = 0;
  v34[1] = 0;
  if (dyld_image_copy_uuid())
  {
    v33 = 0;
    v32 = MEMORY[0x1B5E36C34](a2);
    if (!v32)
    {
      v32 = MEMORY[0x1B5E36C40](a2);
      if (!v32)
        return;
      v33 = 512;
    }
    v27 = &v26;
    v28 = 0x3002000000;
    v29 = __Block_byref_object_copy__1;
    v30 = __Block_byref_object_dispose__2;
    v31 = 0;
    v4 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 0x40000000;
    v25[2] = __CSSymbolicatorCreateWithDyldProcessSnapshotPidAndFlags_block_invoke_3;
    v25[3] = &unk_1E6774AC8;
    v25[4] = &v26;
    v26 = 0;
    MEMORY[0x1B5E36C10](a2, "__TEXT", v25);
    v17 = 0;
    v18 = &v17;
    v19 = 0x4002000000;
    v20 = __Block_byref_object_copy__5;
    v21 = __Block_byref_object_dispose__6;
    v23 = 0;
    v24 = 0;
    __p = 0;
    v16[0] = v4;
    v16[1] = 0x40000000;
    v16[2] = __CSSymbolicatorCreateWithDyldProcessSnapshotPidAndFlags_block_invoke_7;
    v16[3] = &unk_1E6774AF0;
    v16[4] = &v17;
    MEMORY[0x1B5E36C28](a2, v16);
    v14 = v34;
    v13 = 0;
    std::allocate_shared[abi:ne180100]<CSCppSymbolOwner,std::allocator<CSCppSymbolOwner>,UUID const*,int,unsigned long long const&,unsigned long long const&,unsigned int &,_CSArchitecture &,char const*&,void>(&v14, &v13, &kCSBeginningOfTime, &kCSEndOfTime, &v33, v27 + 5, &v32, &v15);
    v5 = v15;
    v6 = v18;
    v7 = *(_QWORD *)(v15 + 32);
    *(_QWORD *)(v15 + 32) = v18[5];
    v6[5] = v7;
    v8 = *(_QWORD *)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6[6];
    v6[6] = v8;
    v9 = *(_QWORD *)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v6[7];
    v6[7] = v9;
    std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), &v15);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (*((_QWORD *)&v15 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    _Block_object_dispose(&v17, 8);
    if (__p)
    {
      v23 = __p;
      operator delete(__p);
    }
    _Block_object_dispose(&v26, 8);
  }
}

uint64_t __CSSymbolicatorCreateWithDyldProcessSnapshotPidAndFlags_block_invoke_3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = *(_QWORD *)(a2 + 4);
  return result;
}

_QWORD *__CSSymbolicatorCreateWithDyldProcessSnapshotPidAndFlags_block_invoke_7(uint64_t a1, CSCppNamedRange *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  CSCppNamedRange *v7;

  v7 = a2;
  v5 = a4;
  v6 = a3;
  return std::vector<CSCppSegmentRange>::emplace_back<unsigned long long &,unsigned long long &,char const*&>((void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), &v6, &v5, &v7);
}

@end
