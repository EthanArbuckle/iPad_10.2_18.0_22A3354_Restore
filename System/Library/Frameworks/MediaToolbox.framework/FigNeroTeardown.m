@implementation FigNeroTeardown

void __FigNeroTeardown_block_invoke(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  uint64_t v5;
  const void *ValueAtIndex;
  NSObject *v7;
  _QWORD block[5];

  FigTransportGetLocalRootObject();
  NeroTransportUnregisterObject();
  Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 136));
  if (Count >= 1)
  {
    v3 = Count;
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 136), v4);
      NeroTransportUnregisterObject();
      v7 = *((_QWORD *)ValueAtIndex + 5);
      block[0] = v5;
      block[1] = 0x40000000;
      block[2] = __FigNeroTeardown_block_invoke_2;
      block[3] = &__block_descriptor_tmp_36_4;
      block[4] = ValueAtIndex;
      dispatch_async(v7, block);
      ++v4;
    }
    while (v3 != v4);
  }
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 136));
}

void __FigNeroTeardown_block_invoke_2(uint64_t a1)
{
  nrp_destroy(*(_QWORD *)(a1 + 32));
}

void __FigNeroTeardown_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 128);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 113))
  {
    v4 = *(_QWORD *)(v2 + 104);
    if (v4)
      _FigNeroPlayServerSetDeviceUID(v4, 0);
    FigTransportGetRemoteRootObject();
    NeroTransportSendAsyncMessage();
  }
}

@end
