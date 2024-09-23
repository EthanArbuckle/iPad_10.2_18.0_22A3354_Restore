@implementation PostEvent

void __ftd_PostEvent_block_invoke(uint64_t a1)
{
  __int128 v2;
  NSObject *v3;
  const void *v4;
  _QWORD v5[5];
  __int128 v6;
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __ftd_PostEvent_block_invoke_2;
  v5[3] = &unk_1E28E44C0;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = v2;
  v7 = *(_DWORD *)(a1 + 56);
  v5[4] = &v8;
  dispatch_sync(v3, v5);
  if (*((_BYTE *)v9 + 24))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 16))();
  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);
  CFRelease(*(CFTypeRef *)(a1 + 32));
  _Block_object_dispose(&v8, 8);
}

CFIndex __ftd_PostEvent_block_invoke_2(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex result;
  CFRange v4;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 40) + 32);
  v4.length = CFArrayGetCount(v2);
  v4.location = 0;
  result = CFArrayGetFirstIndexOfValue(v2, v4, *(const void **)(a1 + 48));
  if (result != -1 && **(_DWORD **)(a1 + 48) == *(_DWORD *)(a1 + 56))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

@end
