@implementation CFSetCreateMutableForSOSPeerInfosByIDWithArray

void __CFSetCreateMutableForSOSPeerInfosByIDWithArray_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;

  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == SOSPeerInfoGetTypeID())
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), cf);
  }
}

@end
