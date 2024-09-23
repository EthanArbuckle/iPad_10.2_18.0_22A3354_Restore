@implementation Finalize

void __endpoint_Finalize_block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  const void *v7;
  _QWORD *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;

  v2 = 0;
  v3 = 1;
  do
  {
    v4 = v3;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v2 + 16);
    if (v5)
    {
      v6 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v6)
        v6(v5);
      v7 = *(const void **)(*(_QWORD *)(a1 + 32) + 8 * v2 + 16);
      if (v7)
      {
        CFRelease(v7);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v2 + 16) = 0;
      }
    }
    v3 = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);
  v8 = *(_QWORD **)(a1 + 32);
  v9 = (const void *)v8[8];
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
    v8 = *(_QWORD **)(a1 + 32);
  }
  v10 = (const void *)v8[4];
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v8 = *(_QWORD **)(a1 + 32);
  }
  v11 = (const void *)v8[5];
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    v8 = *(_QWORD **)(a1 + 32);
  }
  v12 = (const void *)v8[6];
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  }
}

@end
