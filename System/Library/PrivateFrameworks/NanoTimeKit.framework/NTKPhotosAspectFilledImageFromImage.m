@implementation NTKPhotosAspectFilledImageFromImage

uint64_t __NTKPhotosAspectFilledImageFromImage_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
