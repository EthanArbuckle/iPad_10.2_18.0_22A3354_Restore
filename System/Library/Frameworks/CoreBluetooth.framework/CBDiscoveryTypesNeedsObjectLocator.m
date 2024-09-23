@implementation CBDiscoveryTypesNeedsObjectLocator

void __CBDiscoveryTypesNeedsObjectLocator_block_invoke()
{
  char *v0;
  uint64_t v1;
  int v2;

  v0 = &byte_1E5401524;
  do
  {
    if ((v0[1] & 1) != 0)
    {
      v2 = *((_DWORD *)v0 - 1);
      if ((v2 - 30) >= 0xFFFFFFE3)
        _MergedGlobals_0[((unint64_t)(v2 - 1) >> 3) + 32] |= 1 << (-(char)v2 & 7);
    }
    v1 = *(_QWORD *)(v0 + 12);
    v0 += 24;
  }
  while (v1);
}

@end
