@implementation CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification

uint64_t __CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  if (CSFileIsFlatbuffer(*(const char **)(a1 + 48)))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification_block_invoke_2;
    v8[3] = &unk_1E6774BA8;
    v8[4] = *(_QWORD *)(a1 + 32);
    result = CSSymbolicatorForeachFlatbufferSymbolicatorInSignature(a2, 0, v8);
  }
  else
  {
    v5 = (unsigned int *)CSSymbolicatorCreateWithSignature(a2);
    v7 = v6;
    result = CSIsNull((char)v5, v6);
    if ((result & 1) != 0)
      return result;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CSRelease(v5, v7);
    result = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification_block_invoke_3(uint64_t a1, _QWORD *a2)
{
  CSCppFakeTask *v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CSCppFakeTask *v8;
  _QWORD v9[3];
  void **v10;

  std::vector<std::shared_ptr<CSCppSymbolOwner>>::vector(v9, 1uLL, a2);
  v3 = (CSCppFakeTask *)operator new();
  CSCppFakeTask::CSCppFakeTask(v3, -1, 0);
  v8 = v3;
  v4 = (unsigned int *)CSSymbolicatorCreateWithSymbolOwnersAndCSCppTask(v9, (uint64_t *)&v8, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32));
  v6 = v5;
  if (v8)
    (*(void (**)(CSCppFakeTask *))(*(_QWORD *)v8 + 8))(v8);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, unsigned int *, uint64_t))(v7 + 16))(v7, v4, v6);
  CSRelease(v4, v6);
  v10 = (void **)v9;
  std::vector<std::shared_ptr<CSCppSymbolOwner>>::__destroy_vector::operator()[abi:ne180100](&v10);
}

@end
