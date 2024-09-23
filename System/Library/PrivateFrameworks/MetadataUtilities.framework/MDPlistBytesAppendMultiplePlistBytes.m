@implementation MDPlistBytesAppendMultiplePlistBytes

_QWORD *___MDPlistBytesAppendMultiplePlistBytes_block_invoke(_QWORD *result, uint64_t a2)
{
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;

  v2 = *(_QWORD *)(result[4] + 8 * a2);
  if (v2)
  {
    v3 = 8 * a2;
    v4 = *(_QWORD *)(result[6] + 8 * a2);
    if (v4 && !*(_WORD *)(v4 + 32))
      v5 = *(const void **)(v4 + 8);
    else
      v5 = 0;
    return memcpy(*(void **)(result[5] + v3), v5, v2);
  }
  return result;
}

@end
