@implementation ARPixelBufferConvertTwoComponent16HalfToRGBAHalf

uint64_t __ARPixelBufferConvertTwoComponent16HalfToRGBAHalf_block_invoke(uint64_t a1)
{
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 0);
  return CVPixelBufferUnlockBaseAddress(**(CVPixelBufferRef **)(a1 + 40), 0);
}

@end
