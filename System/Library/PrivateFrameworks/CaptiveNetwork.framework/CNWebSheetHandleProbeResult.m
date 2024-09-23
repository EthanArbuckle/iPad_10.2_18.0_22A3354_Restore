@implementation CNWebSheetHandleProbeResult

void __CNWebSheetHandleProbeResult_block_invoke(uint64_t a1)
{
  CNProberProvideResult(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
