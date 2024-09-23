@implementation FillPixelBufferWithRandomData

uint64_t __FillPixelBufferWithRandomData_block_invoke(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v7;
  unint64_t v8;

  v5 = a5 * a4;
  if (a5 * a4)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      if (!v7)
      {
        v8 = arc4random();
        v7 = 8;
      }
      *a2++ = v8;
      v8 >>= 8;
      --v7;
      --v5;
    }
    while (v5);
  }
  return 1;
}

@end
