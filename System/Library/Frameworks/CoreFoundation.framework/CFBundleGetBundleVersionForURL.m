@implementation CFBundleGetBundleVersionForURL

uint64_t ___CFBundleGetBundleVersionForURL_block_invoke(_QWORD *a1, CFStringRef theString, uint64_t a3, int a4)
{
  CFIndex Length;
  uint64_t v8;
  CFRange v10;
  CFRange v11;
  CFRange v12;
  CFRange v13;
  CFRange v14;

  if (!a4)
  {
    v8 = a1[9];
    goto LABEL_21;
  }
  if (a4 == 10 || a4 == 4)
  {
    Length = CFStringGetLength(theString);
    if (Length == a1[10])
    {
      v10.location = 0;
      v10.length = Length;
      if (CFStringCompareWithOptions(theString, CFSTR("Resources"), v10, 1uLL) == kCFCompareEqualTo)
      {
        v8 = a1[4];
        goto LABEL_21;
      }
    }
    if (Length == a1[11])
    {
      v11.location = 0;
      v11.length = Length;
      if (CFStringCompareWithOptions(theString, CFSTR("Contents"), v11, 1uLL) == kCFCompareEqualTo)
      {
        v8 = a1[5];
        goto LABEL_21;
      }
    }
    if (Length == a1[12])
    {
      v12.location = 0;
      v12.length = Length;
      if (CFStringCompareWithOptions(theString, CFSTR("Support Files"), v12, 1uLL) == kCFCompareEqualTo)
      {
        v8 = a1[6];
        goto LABEL_21;
      }
    }
    if (Length == a1[13])
    {
      v13.location = 0;
      v13.length = Length;
      if (CFStringCompareWithOptions(theString, CFSTR("Wrapper"), v13, 0) == kCFCompareEqualTo)
      {
        v8 = a1[7];
        goto LABEL_21;
      }
    }
    if (a4 == 10 && Length == a1[14])
    {
      v14.location = 0;
      v14.length = Length;
      if (CFStringCompareWithOptions(theString, CFSTR("WrappedBundle"), v14, 0) == kCFCompareEqualTo)
      {
        v8 = a1[8];
LABEL_21:
        *(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) = 1;
      }
    }
  }
  return 1;
}

uint64_t ___CFBundleGetBundleVersionForURL_block_invoke_2(uint64_t a1, CFStringRef theString, uint64_t a3, int a4)
{
  CFIndex Length;
  CFRange v8;

  if (a4 == 10 || a4 == 4)
  {
    Length = CFStringGetLength(theString);
    if (Length == *(_QWORD *)(a1 + 40))
    {
      v8.length = Length;
      v8.location = 0;
      if (CFStringCompareWithOptions(theString, CFSTR("Contents"), v8, 1uLL) == kCFCompareEqualTo)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return 1;
}

@end
