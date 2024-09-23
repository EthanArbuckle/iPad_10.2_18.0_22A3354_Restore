@implementation FigLocalQueueEnqueue

void __FigLocalQueueEnqueue_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  void (*v5)(uint64_t, __int128 *);
  void (*v6)(uint64_t, __int128 *);
  const void *v7;
  const void *v8;
  __int128 v9;
  int v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (__int128 *)(a1 + 56);
    if (v3)
    {
      v5 = *(void (**)(uint64_t, __int128 *))(v3 + 16);
      v9 = *v4;
      v10 = *(_DWORD *)(a1 + 72);
      v5(v3, &v9);
    }
    else
    {
      v6 = *(void (**)(uint64_t, __int128 *))(v2 + 16);
      v9 = *v4;
      v10 = *(_DWORD *)(a1 + 72);
      v6(v2, &v9);
    }
  }
  v7 = *(const void **)(a1 + 48);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 40);
  if (v8)
    CFRelease(v8);
}

@end
