@implementation SecAddSharedWebCredential

void __SecAddSharedWebCredential_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v3)
    CFRelease(v3);
}

void __SecAddSharedWebCredential_block_invoke_2(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const void *v8;
  const void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString **v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  CFMutableDictionaryRef Mutable;
  _QWORD v22[4];

  v2 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  v3 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  v4 = *(const void **)(*(_QWORD *)(a1[7] + 8) + 24);
  v5 = *(_QWORD *)(a1[8] + 8) + 24;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2000000000;
  v22[3] = v5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  Mutable = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v2)
    CFDictionaryAddValue((CFMutableDictionaryRef)v19[3], CFSTR("srvr"), v2);
  if (v3)
    CFDictionaryAddValue((CFMutableDictionaryRef)v19[3], CFSTR("acct"), v3);
  if (v4)
    CFDictionaryAddValue((CFMutableDictionaryRef)v19[3], CFSTR("spwd"), v4);
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 0x40000000;
  v17[2] = __SecAddSharedWebCredentialSync_block_invoke;
  v17[3] = &unk_1E1FD9CF0;
  v17[4] = &v18;
  v17[5] = v22;
  v7 = SecOSStatusWith((uint64_t)v17);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
  v8 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(*(_QWORD *)(a1[7] + 8) + 24);
  if (v10)
    CFRelease(v10);
  v11 = a1[8];
  if (v7)
  {
    v12 = *(_QWORD *)(v11 + 8);
    v14 = *(_QWORD *)(v12 + 24);
    v13 = (__CFString **)(v12 + 24);
    if (!v14)
    {
      SecError(v7, v13, CFSTR("Error adding shared password"));
      v11 = a1[8];
    }
  }
  v15 = *(NSObject **)(*(_QWORD *)(a1[9] + 8) + 24);
  v16[0] = v6;
  v16[1] = 0x40000000;
  v16[2] = __SecAddSharedWebCredential_block_invoke_3;
  v16[3] = &unk_1E1FD9D40;
  v16[4] = a1[4];
  v16[5] = v11;
  dispatch_async(v15, v16);
}

void __SecAddSharedWebCredential_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v3)
    CFRelease(v3);
}

@end
