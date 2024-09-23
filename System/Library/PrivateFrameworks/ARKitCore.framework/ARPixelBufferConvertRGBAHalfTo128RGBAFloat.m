@implementation ARPixelBufferConvertRGBAHalfTo128RGBAFloat

uint64_t __ARPixelBufferConvertRGBAHalfTo128RGBAFloat_block_invoke(uint64_t a1)
{
  CVPixelBufferUnlockBaseAddress(**(CVPixelBufferRef **)(a1 + 32), 0);
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 40), 0);
}

@end
