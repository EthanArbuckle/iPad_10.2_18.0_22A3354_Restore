@implementation Create420PixelBufferFromPGMFiles

BOOL __Create420PixelBufferFromPGMFiles_block_invoke(FILE **a1, char *__ptr, uint64_t a3, size_t __size, size_t __nitems)
{
  size_t v6;
  _BYTE *v7;
  _BOOL8 v8;

  if (!a3)
    return fread(__ptr, __size, __nitems, a1[4]) == __nitems;
  v6 = __nitems + 1;
  v7 = __ptr + 1;
  do
  {
    v8 = --v6 == 0;
    if (!v6)
      break;
    *(v7 - 1) = fgetc(a1[5]);
    *v7 = fgetc(a1[6]);
    if (ferror(a1[5]))
      break;
    v7 += 2;
  }
  while (!ferror(a1[6]));
  return v8;
}

@end
