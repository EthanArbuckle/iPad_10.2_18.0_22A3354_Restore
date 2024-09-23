@implementation APConnectivityHelperHandleDynamicStoreNetworkEntityValueChange

void ___APConnectivityHelperHandleDynamicStoreNetworkEntityValueChange_block_invoke(uint64_t a1, const __CFString *a2)
{
  const __CFArray *ArrayBySeparatingStrings;
  CFIndex Count;
  CFIndex v4;

  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a2, CFSTR("/"));
  if (CFArrayGetCount(ArrayBySeparatingStrings) >= 2)
  {
    Count = CFArrayGetCount(ArrayBySeparatingStrings);
    CFArrayGetValueAtIndex(ArrayBySeparatingStrings, Count - 1);
    v4 = CFArrayGetCount(ArrayBySeparatingStrings);
    CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v4 - 2);
    CFDictionaryApplyBlock();
  }
  if (ArrayBySeparatingStrings)
    CFRelease(ArrayBySeparatingStrings);
}

CFIndex ___APConnectivityHelperHandleDynamicStoreNetworkEntityValueChange_block_invoke_2(_QWORD *a1, CFStringRef theString, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  CFIndex result;

  result = CFStringFind(theString, (CFStringRef)a1[4], 0xCuLL).location;
  if (result != -1)
    return a3(a1[5], a1[6], a1[7], a1[8]);
  return result;
}

@end
