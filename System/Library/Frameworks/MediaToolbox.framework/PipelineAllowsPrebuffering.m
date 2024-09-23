@implementation PipelineAllowsPrebuffering

void __ruleNoConsumerConnected_and_PipelineAllowsPrebuffering_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, const __CFString *, _QWORD, CFTypeRef *);
  CFTypeRef v6;
  CFTypeRef cf;

  cf = 0;
  v4 = *(_QWORD *)(a3 + 8);
  v5 = *(void (**)(uint64_t, const __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                               + 48);
  if (v5)
  {
    v5(v4, CFSTR("DownstreamConsumer"), *MEMORY[0x1E0C9AE00], &cf);
    v6 = cf;
    if (cf)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      CFRelease(v6);
    }
  }
}

@end
