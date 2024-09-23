@implementation CSSymbolicatorForeachSymbolicatorWithURLFlagsAndNotification

void __CSSymbolicatorForeachSymbolicatorWithURLFlagsAndNotification_block_invoke(uint64_t a1, _QWORD *a2)
{
  CSCppFakeTask *v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CSCppFakeTask *v9;
  _QWORD v10[3];
  void **v11;

  std::vector<std::shared_ptr<CSCppSymbolOwner>>::vector(v10, 1uLL, a2);
  v3 = (CSCppFakeTask *)operator new();
  CSCppFakeTask::CSCppFakeTask(v3, -1, 0);
  v9 = v3;
  v4 = (unsigned int *)CSSymbolicatorCreateWithSymbolOwnersAndCSCppTask(v10, (uint64_t *)&v9, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32));
  v6 = v5;
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, unsigned int *, uint64_t))(v8 + 16))(v8, v4, v6);
  CSRelease(v4, v6);
  v11 = (void **)v10;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v11);
}

@end
