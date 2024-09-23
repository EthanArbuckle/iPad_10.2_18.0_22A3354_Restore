@implementation PushValueChangedHandler

void __PushValueChangedHandler_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void **v6;
  void *v7;
  _QWORD *v8;

  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4)
    v5 = (_QWORD *)(v4 + 24);
  else
    v5 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  *v5 = v3;
  **(_QWORD **)(*(_QWORD *)(a1 + 40) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v6 = *(void ***)(a1 + 40);
  v7 = *v6;
  *v6 = 0;

  v8 = *(_QWORD **)(a1 + 40);
  v8[1] = 0x8000000000000000;
  if (v8 != (_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    free(v8);
}

@end
