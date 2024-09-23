@implementation CBDiscoveryTypesNearbyInfoV2

void __CBDiscoveryTypesNearbyInfoV2_block_invoke()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char v3;
  int v4;

  v0 = &byte_1E5401524;
  v1 = &byte_1E5401524;
  do
  {
    v3 = *v1;
    v1 += 24;
    if ((v3 & 0x20) != 0)
    {
      v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 30) >= 0xFFFFFFE3)
        _MergedGlobals_0[((unint64_t)(v4 - 1) >> 3) + 28] |= 1 << (-(char)v4 & 7);
    }
    v2 = *(_QWORD *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

@end
