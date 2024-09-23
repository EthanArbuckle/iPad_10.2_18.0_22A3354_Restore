@implementation CMPhotoUnifiedJPEGEncoderWriteAROTTableToPtr

uint64_t __CMPhotoUnifiedJPEGEncoderWriteAROTTableToPtr_block_invoke(_QWORD *a1, size_t __n, void *__src)
{
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  uint64_t result;
  void *v8;

  v3 = *(_QWORD *)(a1[4] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  v5 = v4 + __n;
  if (v4 + __n > a1[5])
    return 4294950304;
  v8 = (void *)(a1[6] + v4);
  if (v8 != __src)
  {
    memcpy(v8, __src, __n);
    v3 = *(_QWORD *)(a1[4] + 8);
    v5 = *(_QWORD *)(v3 + 24) + __n;
  }
  result = 0;
  *(_QWORD *)(v3 + 24) = v5;
  return result;
}

@end
