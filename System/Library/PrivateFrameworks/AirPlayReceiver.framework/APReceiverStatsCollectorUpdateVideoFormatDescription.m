@implementation APReceiverStatsCollectorUpdateVideoFormatDescription

uint64_t __APReceiverStatsCollectorUpdateVideoFormatDescription_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(const void **)(a1 + 40);
  v4 = *(const void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;
  if (v2)
    CFRetain(v2);
  if (v4)
    CFRelease(v4);
  result = CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 192) = result;
  return result;
}

@end
