@implementation SOSDoWithCredentialsWhileUnlocked

void __SOSDoWithCredentialsWhileUnlocked_block_invoke(uint64_t a1)
{
  CFTypeRef *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *KeybagAssertionQueue;
  _BOOL4 v7;
  NSObject *v8;
  const void **v9;
  const void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v2 = *(CFTypeRef **)(a1 + 48);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __SOSDoWithCredentialsWhileUnlocked_block_invoke_2;
  v11[3] = &unk_1E1FD2260;
  v13 = &v15;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v12 = v4;
  v14 = v5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2000000000;
  v29 = 0;
  KeybagAssertionQueue = GetKeybagAssertionQueue();
  block = v3;
  v20 = 0x40000000;
  v21 = __SecAKSKeybagHoldLockAssertion_block_invoke;
  v22 = &unk_1E1FDC1F8;
  v23 = &v26;
  v24 = 60;
  v25 = 0;
  dispatch_sync(KeybagAssertionQueue, &block);
  v7 = SecKernError(*((_DWORD *)v27 + 6), v2, CFSTR("Kern return error"), v11[0], 3221225472, __SOSDoWithCredentialsWhileUnlocked_block_invoke_2, &unk_1E1FD2260);
  _Block_object_dispose(&v26, 8);
  if (v7)
  {
    __SOSDoWithCredentialsWhileUnlocked_block_invoke_2((uint64_t)v11);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2000000000;
    v29 = 0;
    v8 = GetKeybagAssertionQueue();
    block = v3;
    v20 = 0x40000000;
    v21 = __SecAKSKeybagDropLockAssertion_block_invoke;
    v22 = &unk_1E1FDC220;
    v23 = &v26;
    LODWORD(v24) = 0;
    dispatch_sync(v8, &block);
    SecKernError(*((_DWORD *)v27 + 6), v2, CFSTR("Kern return error"));
    _Block_object_dispose(&v26, 8);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *((_BYTE *)v16 + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v9 = *(const void ***)(a1 + 48);
    v10 = *v9;
    if (*v9)
    {
      *v9 = 0;
      CFRelease(v10);
    }
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __SOSDoWithCredentialsWhileUnlocked_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
