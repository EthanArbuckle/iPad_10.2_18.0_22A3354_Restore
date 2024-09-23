@implementation CopyPixelBuffer

BOOL __CopyPixelBuffer_block_invoke(_QWORD *a1, void *__dst, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;

  v6 = a1[4];
  if (v6 > a3)
  {
    memcpy(__dst, *(const void **)(a1[5] + 8 * a3), a5 * a4);
    *(_QWORD *)(a1[5] + 8 * a3) += *(_QWORD *)(a1[6] + 8 * a3);
  }
  return v6 > a3;
}

@end
