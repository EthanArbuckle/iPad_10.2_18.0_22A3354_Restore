@implementation HandleRenderFrameFromWindowMessage

void __HandleRenderFrameFromWindowMessage_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, _QWORD);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned int *)(a1 + 48);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v5)
    v5(v2, v3, v4, 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
