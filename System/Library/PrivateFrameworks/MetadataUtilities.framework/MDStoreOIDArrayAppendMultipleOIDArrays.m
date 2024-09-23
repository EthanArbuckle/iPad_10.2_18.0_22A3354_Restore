@implementation MDStoreOIDArrayAppendMultipleOIDArrays

_QWORD *___MDStoreOIDArrayAppendMultipleOIDArrays_block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result[4] + 8 * a2);
  if (v2)
  {
    v3 = *(unsigned int *)(v2 + 32);
    if ((_DWORD)v3)
      return memcpy(*(void **)(result[5] + 8 * a2), *(const void **)(v2 + 16), 8 * v3);
  }
  return result;
}

@end
