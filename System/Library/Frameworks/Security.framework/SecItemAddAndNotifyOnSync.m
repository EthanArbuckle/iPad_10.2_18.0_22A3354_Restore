@implementation SecItemAddAndNotifyOnSync

BOOL ___SecItemAddAndNotifyOnSync_block_invoke(_QWORD *a1, __CFString **a2)
{
  void *v4;
  uint64_t v5;
  CFDictionaryRef *v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v4 = (void *)a1[4];
  v5 = *(_QWORD *)(a1[5] + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = ___SecItemAddAndNotifyOnSync_block_invoke_2;
  v11[3] = &unk_1E1FD60B0;
  v6 = (CFDictionaryRef *)(v5 + 32);
  v11[1] = 3221225472;
  v7 = v4;
  v8 = a1[6];
  v12 = v7;
  v13 = v8;
  v9 = SecItemAuthDoQuery(v6, 0, SecItemAdd, a2, v11);

  return v9;
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_2(uint64_t a1, void *a2, const __CFDictionary *a3, uint64_t a4, const __CFDictionary *a5, __CFString **a6)
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SecuritydXPCCallback *v14;
  SecuritydXPCCallback *v15;
  NSObject *v16;
  uint64_t *v17;
  const void *v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v10 = a2;
  if (v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v11 = 0;
  }
  else
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v12 = MEMORY[0x1E0C809B0];
    v31 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = ___SecItemAddAndNotifyOnSync_block_invoke_3;
    v26[3] = &unk_1E1FD6038;
    v27 = *(id *)(a1 + 32);
    SecuritydXPCProxyObject(0, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = [SecuritydXPCCallback alloc];
      v24[0] = v12;
      v24[1] = 3221225472;
      v24[2] = ___SecItemAddAndNotifyOnSync_block_invoke_4;
      v24[3] = &unk_1E1FD6060;
      v25 = *(id *)(a1 + 32);
      v15 = -[SecuritydXPCCallback initWithCallback:](v14, "initWithCallback:", v24);
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = ___SecItemAddAndNotifyOnSync_block_invoke_5;
      v20[3] = &unk_1E1FD6088;
      v22 = &v32;
      v23 = &v28;
      v16 = dispatch_semaphore_create(0);
      v21 = v16;
      objc_msgSend(v13, "SecItemAddAndNotifyOnSync:syncCallback:complete:", a3, v15, v20);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v17 = v29;
      if (a6)
        *a6 = (__CFString *)v29[3];
      if (v17[3])
        v11 = 0;
      else
        v11 = SecItemResultProcess(a3, a5, 0, (const void *)v33[3], *(CFTypeRef **)(a1 + 40), a6);
      v18 = (const void *)v33[3];
      if (v18)
      {
        v33[3] = 0;
        CFRelease(v18);
      }

    }
    else
    {
      v11 = 0;
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }

  return v11;
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___SecItemAddAndNotifyOnSync_block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v12;
  if (v12 || (v9 = v7) != 0)
    v10 = v9;
  else
    v10 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  v11 = v8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
