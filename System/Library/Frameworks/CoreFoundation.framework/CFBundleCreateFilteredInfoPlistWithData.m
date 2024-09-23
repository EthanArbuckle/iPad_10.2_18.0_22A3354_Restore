@implementation CFBundleCreateFilteredInfoPlistWithData

CFTypeID ___CFBundleCreateFilteredInfoPlistWithData_block_invoke(int a1, CFTypeRef cf)
{
  CFTypeID result;

  result = CFGetTypeID(cf);
  if (result != 7)
    ___CFBundleCreateFilteredInfoPlistWithData_block_invoke_cold_1();
  return result;
}

void ___CFBundleCreateFilteredInfoPlistWithData_block_invoke_2(uint64_t a1, CFStringRef theString)
{
  const void *v4;
  CFIndex v5;
  CFIndex Length;
  CFStringRef v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  CFStringRef v11;
  CFStringRef v12;
  CFStringRef v13;
  CFStringRef v14;
  CFStringRef v15;
  CFRange result;
  uint64_t v17;
  CFRange v18;
  CFRange v19;
  CFRange v20;

  v17 = *MEMORY[0x1E0C80C00];
  result.location = 0;
  result.length = 0;
  v18.length = CFStringGetLength(theString);
  v18.location = 0;
  if (CFStringFindWithOptions(theString, CFSTR(":"), v18, 0, &result))
  {
    v19.length = result.location;
    v19.location = 0;
    v4 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v19);
    v5 = result.location + 1;
    Length = CFStringGetLength(theString);
    v20.length = Length + ~result.location;
    v20.location = v5;
    v7 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v20);
  }
  else
  {
    v4 = CFRetain(theString);
    v7 = 0;
  }
  if (_CFGetProductName_onceToken != -1)
    dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
  v8 = _CFGetProductName__cfBundlePlatform;
  if (v7)
    v9 = CFSTR(":");
  else
    v9 = &stru_1E1337B18;
  if (v7)
    v10 = v7;
  else
    v10 = &stru_1E1337B18;
  v11 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@-%@%@%@"), v4, CFSTR("iphoneos"), v9, v10);
  v12 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@~%@%@%@"), v4, v8, v9, v10);
  v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@-%@~%@%@%@"), v4, CFSTR("iphoneos"), v8, v9, v10);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), theString);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v11);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v12);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v13);
  CFRelease(v11);
  CFRelease(v12);
  CFRelease(v13);
  v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@#CH%@%@"), v4, v9, v10);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v14);
  CFRelease(v14);
  v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@#override%@%@"), v4, v9, v10);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v15);
  CFRelease(v15);
  if (v4)
    CFRelease(v4);
  if (v7)
    CFRelease(v7);
}

void ___CFBundleCreateFilteredInfoPlistWithData_block_invoke_3(uint64_t a1, uint64_t a2)
{
  CFStringRef v3;

  v3 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@:%@"), *(_QWORD *)(a1 + 32), a2);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), v3);
  CFRelease(v3);
}

void ___CFBundleCreateFilteredInfoPlistWithData_block_invoke_cold_1()
{
  qword_1EDCD1038 = (uint64_t)"Property lists must have string keys!";
  __break(1u);
}

@end
