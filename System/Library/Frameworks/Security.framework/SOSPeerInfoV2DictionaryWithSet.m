@implementation SOSPeerInfoV2DictionaryWithSet

CFTypeID __SOSPeerInfoV2DictionaryWithSet_block_invoke(CFTypeID result, CFTypeRef cf)
{
  uint64_t v2;
  CFTypeID v3;

  if (cf)
  {
    v2 = result;
    v3 = CFGetTypeID(cf);
    result = CFSetGetTypeID();
    if (v3 == result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

@end
