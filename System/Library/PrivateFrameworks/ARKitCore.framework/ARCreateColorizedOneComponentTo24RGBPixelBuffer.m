@implementation ARCreateColorizedOneComponentTo24RGBPixelBuffer

uint64_t __ARCreateColorizedOneComponentTo24RGBPixelBuffer_block_invoke(uint64_t a1)
{
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 0);
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 40), 0);
}

@end
