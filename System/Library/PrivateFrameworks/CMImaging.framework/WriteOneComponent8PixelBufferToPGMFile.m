@implementation WriteOneComponent8PixelBufferToPGMFile

BOOL __WriteOneComponent8PixelBufferToPGMFile_block_invoke(uint64_t a1, void *__ptr, int a3, int a4, size_t __nitems)
{
  fwrite(__ptr, 1uLL, __nitems, *(FILE **)(a1 + 32));
  return ferror(*(FILE **)(a1 + 32)) == 0;
}

@end
