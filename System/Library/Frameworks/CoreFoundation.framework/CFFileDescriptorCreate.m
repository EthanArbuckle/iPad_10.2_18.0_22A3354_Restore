@implementation CFFileDescriptorCreate

void __CFFileDescriptorCreate_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __CFRunLoopSource *v3;

  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 50) = 1;
  if (!*(_BYTE *)(v2 + 48))
  {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v2 + 48) = 1;
  }
  v3 = *(__CFRunLoopSource **)(v2 + 56);
  if (v3)
  {
    CFRunLoopSourceSignal(v3);
    _CFRunLoopSourceWakeUpRunLoops(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  }
}

void __CFFileDescriptorCreate_block_invoke(uint64_t a1)
{
  __objc2_class **v2;
  uint64_t Instance;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  uintptr_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uintptr_t v13;
  NSObject *v14;
  NSObject *v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  _QWORD v22[5];
  int v23;
  _QWORD v24[6];
  _QWORD v25[5];
  int v26;
  _QWORD handler[7];

  handler[6] = *MEMORY[0x1E0C80C00];
  v2 = *(__objc2_class ***)(a1 + 40);
  if (CFFileDescriptorGetTypeID_initOnce != -1)
    dispatch_once(&CFFileDescriptorGetTypeID_initOnce, &__block_literal_global_3);
  Instance = _CFRuntimeCreateInstance(v2, 0x3CuLL, 96, 0);
  if (Instance)
  {
    v4 = Instance;
    if (*(_BYTE *)(a1 + 76))
    {
      v5 = (unint64_t *)(Instance + 8);
      v6 = atomic_load((unint64_t *)(Instance + 8));
      while (1)
      {
        v7 = __ldaxr(v5);
        if (v7 != v6)
          break;
        if (__stlxr(v6 | 2, v5))
          goto LABEL_10;
        v8 = 1;
LABEL_11:
        v6 = v7;
        if (v8)
          goto LABEL_12;
      }
      __clrex();
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
LABEL_12:
    *(_DWORD *)(Instance + 20) = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(Instance + 24) = *(_DWORD *)(a1 + 68);
    *(_DWORD *)(Instance + 28) = *(_DWORD *)(a1 + 72);
    *(_QWORD *)(Instance + 32) = 0;
    *(_QWORD *)(Instance + 40) = 0;
    v9 = *(unsigned int *)(a1 + 68);
    v10 = MEMORY[0x1E0C809B0];
    if ((v9 & 0x80000000) == 0)
    {
      v11 = __fdQueue();
      v12 = dispatch_source_create(MEMORY[0x1E0C80DB8], v9, 0, v11);
      handler[0] = v10;
      handler[1] = 0x40000000;
      handler[2] = __CFFileDescriptorCreate_block_invoke_2;
      handler[3] = &__block_descriptor_tmp_2;
      handler[4] = v4;
      handler[5] = v12;
      dispatch_source_set_event_handler(v12, handler);
      v25[0] = v10;
      v25[1] = 0x40000000;
      v25[2] = __CFFileDescriptorCreate_block_invoke_3;
      v25[3] = &__block_descriptor_tmp_3;
      v25[4] = v12;
      v26 = *(_DWORD *)(a1 + 68);
      dispatch_source_set_cancel_handler(v12, v25);
      *(_QWORD *)(v4 + 32) = v12;
    }
    v13 = *(unsigned int *)(a1 + 72);
    if ((v13 & 0x80000000) == 0)
    {
      v14 = __fdQueue();
      v15 = dispatch_source_create(MEMORY[0x1E0C80DF0], v13, 0, v14);
      v24[0] = v10;
      v24[1] = 0x40000000;
      v24[2] = __CFFileDescriptorCreate_block_invoke_4;
      v24[3] = &__block_descriptor_tmp_4;
      v24[4] = v4;
      v24[5] = v15;
      dispatch_source_set_event_handler(v15, v24);
      v22[0] = v10;
      v22[1] = 0x40000000;
      v22[2] = __CFFileDescriptorCreate_block_invoke_5;
      v22[3] = &__block_descriptor_tmp_5;
      v22[4] = v15;
      v23 = *(_DWORD *)(a1 + 72);
      dispatch_source_set_cancel_handler(v15, v22);
      *(_QWORD *)(v4 + 40) = v15;
    }
    *(_WORD *)(v4 + 48) = 257;
    *(_QWORD *)(v4 + 64) = *(_QWORD *)(a1 + 48);
    v16 = *(__int128 **)(a1 + 56);
    if (v16)
    {
      v17 = *v16;
      v18 = v16[1];
      *(_QWORD *)(v4 + 104) = *((_QWORD *)v16 + 4);
      *(_OWORD *)(v4 + 88) = v18;
      *(_OWORD *)(v4 + 72) = v17;
      v19 = *(_QWORD *)(a1 + 56);
      v20 = *(_QWORD *)(v19 + 8);
      v21 = *(uint64_t (**)(uint64_t))(v19 + 16);
      if (v21)
        v20 = v21(v20);
      *(_QWORD *)(v4 + 80) = v20;
    }
    *(_DWORD *)(v4 + 16) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }
}

uint64_t __CFFileDescriptorCreate_block_invoke_3(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  return close(*(_DWORD *)(a1 + 40));
}

void __CFFileDescriptorCreate_block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  __CFRunLoopSource *v3;

  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 51) = 1;
  if (!*(_BYTE *)(v2 + 49))
  {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v2 + 49) = 1;
  }
  v3 = *(__CFRunLoopSource **)(v2 + 56);
  if (v3)
  {
    CFRunLoopSourceSignal(v3);
    _CFRunLoopSourceWakeUpRunLoops(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  }
}

uint64_t __CFFileDescriptorCreate_block_invoke_5(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  return close(*(_DWORD *)(a1 + 40));
}

@end
