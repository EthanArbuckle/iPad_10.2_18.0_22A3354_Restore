@implementation CreatePixelBufferFromPGMFile

BOOL __CreatePixelBufferFromPGMFile_block_invoke(uint64_t a1, void *__ptr, uint64_t a3, size_t __size, size_t __nitems)
{
  return !a3 && fread(__ptr, __size, __nitems, *(FILE **)(a1 + 32)) == __nitems * __size;
}

@end
