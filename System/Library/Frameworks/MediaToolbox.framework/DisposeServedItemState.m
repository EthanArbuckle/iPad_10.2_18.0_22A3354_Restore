@implementation DisposeServedItemState

void __DisposeServedItemState_block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __DisposeServedItemState_block_invoke_2;
  block[3] = &__block_descriptor_tmp_125;
  v2 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_sync(v2, block);
  v3 = *(NSObject **)(a1 + 32);
  if (v3)
    dispatch_release(v3);
}

void __DisposeServedItemState_block_invoke_2(uint64_t a1)
{
  uint64_t FigBaseObject;
  uint64_t v3;
  void (*v4)(uint64_t);
  const void *v5;

  FigBaseObject = FigPlaybackItemGetFigBaseObject(*(_QWORD *)(a1 + 32));
  if (FigBaseObject)
  {
    v3 = FigBaseObject;
    v4 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (v4)
      v4(v3);
  }
  v5 = *(const void **)(a1 + 32);
  if (v5)
    CFRelease(v5);
}

@end
