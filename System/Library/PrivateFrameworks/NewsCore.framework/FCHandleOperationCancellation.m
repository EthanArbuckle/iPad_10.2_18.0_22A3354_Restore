@implementation FCHandleOperationCancellation

uint64_t __FCHandleOperationCancellation_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __FCHandleOperationCancellation_block_invoke_2;
  v4[3] = &unk_1E4649498;
  v1 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v4[5] = &v5;
  objc_msgSend(v1, "performWithLockSync:", v4);
  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __FCHandleOperationCancellation_block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __FCHandleOperationCancellation_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  return result;
}

uint64_t __FCHandleOperationCancellation_block_invoke_4(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  return v2 ^ 1u;
}

@end
