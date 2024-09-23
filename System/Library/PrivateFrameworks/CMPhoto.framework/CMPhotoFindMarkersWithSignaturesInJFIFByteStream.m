@implementation CMPhotoFindMarkersWithSignaturesInJFIFByteStream

uint64_t __CMPhotoFindMarkersWithSignaturesInJFIFByteStream_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8 = (_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * a3);
  if (*(_OWORD *)v8 == 0)
  {
    *v8 = a7;
    v8[1] = a8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return 0;
}

@end
