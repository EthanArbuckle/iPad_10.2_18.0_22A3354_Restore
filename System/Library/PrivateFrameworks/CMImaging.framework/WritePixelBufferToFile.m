@implementation WritePixelBufferToFile

void __WritePixelBufferToFile_block_invoke()
{
  FigM2MController *v0;
  void *v1;

  v0 = objc_alloc_init(FigM2MController);
  v1 = (void *)WritePixelBufferToFile_m2m;
  WritePixelBufferToFile_m2m = (uint64_t)v0;

}

BOOL __WritePixelBufferToFile_block_invoke_2(uint64_t a1, void *__ptr, int a3, size_t __size, uint64_t a5, unint64_t a6)
{
  return fwrite(__ptr, __size, (a5 + a6 - 1) / a6, *(FILE **)(a1 + 32)) == (a5 + a6 - 1) / a6;
}

@end
