@implementation SendSavedSampleBuffers

void __sbcins_SendSavedSampleBuffers_block_invoke(uint64_t a1, const void *a2)
{
  int v4;
  uint64_t v5;
  void (*v6)(uint64_t, const void *);

  if (a2)
  {
    v4 = (*(uint64_t (**)(const void *, _QWORD))(*(_QWORD *)(a1 + 32) + 8))(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    if (v4 == 2)
    {
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
    }
    else if (v4 == 1)
    {
      v5 = **(_QWORD **)(a1 + 32);
      v6 = *(void (**)(uint64_t, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (v6)
        v6(v5, a2);
    }
  }
}

@end
