@implementation APMediaSenderFDVSourceSubmitPixelBuffer

uint64_t __APMediaSenderFDVSourceSubmitPixelBuffer_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = fvdsrc_submitPixelBufferInternal(*(_QWORD *)(a1 + 40), *(CVPixelBufferRef *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
