@implementation GetStatusOfValueForProperty

uint64_t __remoteXPCAsset_GetStatusOfValueForProperty_block_invoke(uint64_t a1)
{
  uint64_t result;
  _DWORD *v3;
  _QWORD *v4;

  result = FigCFDictionaryGetInt32IfPresent();
  if ((_DWORD)result)
  {
    result = 0;
    **(_DWORD **)(a1 + 56) = 2;
    v3 = *(_DWORD **)(a1 + 64);
    if (v3)
      *v3 = 0;
    v4 = *(_QWORD **)(a1 + 72);
    if (v4)
      *v4 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end
