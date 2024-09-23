@implementation ZN2re22ResourceSharingManager19processFetchRequestENS0

_QWORD *___ZN2re22ResourceSharingManager19processFetchRequestENS0_12FetchRequestE_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = result[5];
  v2 = *(_QWORD *)(v1 + 80);
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 96);
    v4 = 168 * v2;
    while (*(_QWORD *)(v3 + 8) != result[16])
    {
      v3 += 168;
      v4 -= 168;
      if (!v4)
        return result;
    }
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v3;
  }
  return result;
}

@end
