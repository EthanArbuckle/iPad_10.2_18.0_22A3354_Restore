@implementation CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification

void __CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  UUID *CFUUIDBytes;
  uint64_t v7;
  uint64_t v8;
  uint64_t BaseAddress;
  uint64_t v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  __n128 (*v15)(uint64_t, uint64_t);
  uint64_t (*v16)();
  uint64_t v17;
  uint64_t v18;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) && CSSymbolOwnerIsDyldSharedCache(a2, a3))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3802000000;
    v15 = __Block_byref_object_copy__8;
    v16 = __Block_byref_object_dispose__8;
    v17 = 0;
    v18 = 0;
    CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes(a2, a3);
    v7 = a1[6];
    v8 = a1[7];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification_block_invoke_8;
    v11[3] = &unk_1E6778F10;
    v11[5] = a2;
    v11[6] = a3;
    v11[4] = &v12;
    _CSSymbolicatorForeachSymbolOwnerWithUUIDBytesAtTime<CFUUIDBytes const>(v7, v8, (uint64_t)CFUUIDBytes, 0x8000000000000000, (uint64_t)v11);
    if (!CSIsNull(v13[5], v13[6]))
    {
      BaseAddress = CSSymbolOwnerGetBaseAddress(a2, a3);
      v10 = CSSymbolOwnerGetBaseAddress(v13[5], v13[6]);
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = BaseAddress - v10;
    }
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification_block_invoke_8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  const char *Name;
  uint64_t result;
  BOOL v8;
  uint64_t v9;

  Name = (const char *)CSSymbolOwnerGetName(a1[5], a1[6]);
  result = CSSymbolOwnerGetName(a2, a3);
  if (Name)
    v8 = result == 0;
  else
    v8 = 1;
  if (!v8)
  {
    result = strcmp(Name, (const char *)result);
    if (!(_DWORD)result)
    {
      v9 = *(_QWORD *)(a1[4] + 8);
      *(_QWORD *)(v9 + 40) = a2;
      *(_QWORD *)(v9 + 48) = a3;
    }
  }
  return result;
}

uint64_t __CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification_block_invoke_3;
  v5[3] = &unk_1E6778F88;
  v3 = a1[5];
  v2 = a1[6];
  v5[4] = a1[4];
  v5[5] = a2;
  return CSSymbolicatorForeachSymbolOwnerAtTime(v3, v2, 0x8000000000000000, (uint64_t)v5);
}

uint64_t __CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification_block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  char MutableInContext;
  uint64_t v5;
  _QWORD v7[5];

  MutableInContext = CSSymbolOwnerMakeMutableInContext(a2, a3, *(CSCppMutableContext **)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = __CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification_block_invoke_4;
  v7[3] = &unk_1E6778F60;
  v7[4] = *(_QWORD *)(a1 + 32);
  return CSSymbolOwnerEditRelocations(MutableInContext, v5, (uint64_t)v7);
}

uint64_t __CSSymbolicatorCreateForTaskSharedCacheWithFlagsAndNotification_block_invoke_4(uint64_t result, _QWORD *a2)
{
  *a2 += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
