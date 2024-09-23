@implementation CFBundleInfoPlistProcessInfoDictionary

void ___CFBundleInfoPlistProcessInfoDictionary_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, a3);
}

void ___CFBundleInfoPlistProcessInfoDictionary_block_invoke(CFMutableArrayRef *a1, const __CFString *cf)
{
  CFRange v4;
  CFIndex Length;
  CFStringRef v6;
  CFStringRef v7;
  __CFDictionary *v8;
  const void *Value;
  CFRange v10;
  uint64_t location;
  CFRange v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex v15;
  CFIndex v16;
  CFIndex v17;
  CFIndex v18;
  int v19;
  CFStringRef v20;
  CFStringRef v21;
  CFStringRef v22;
  int v23;
  const __CFString *v24;
  const void *v25;
  CFMutableArrayRef v26;
  __CFArray *Mutable;
  CFStringRef v28;
  CFStringRef v29;
  CFStringRef v30;
  const __CFArray *v31;
  CFIndex Count;
  const void *ValueAtIndex;
  __CFDictionary *v34;
  const void *v35;
  CFIndex v36;
  CFMutableArrayRef v37;
  _QWORD v38[7];
  CFRange v39;
  CFRange v40;
  CFRange v41;
  CFRange v42;
  CFRange v43;
  CFRange v44;
  CFRange v45;
  CFRange v46;
  CFRange v47;
  CFRange v48;

  v38[6] = *MEMORY[0x1E0C80C00];
  if (CFGetTypeID(cf) != 7)
  {
    CFArrayAppendValue(a1[4], cf);
    return;
  }
  if (cf)
  {
    v4 = CFStringFind(cf, CFSTR("#"), 4uLL);
    if (v4.location > 0)
    {
      Length = CFStringGetLength(cf);
      v41.location = v4.location + v4.length;
      v41.length = Length - (v4.location + v4.length);
      v6 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v41);
      if (CFEqual(v6, CFSTR("CH")))
      {
        if (_isValidSpecialCase_onceToken != -1)
          dispatch_once(&_isValidSpecialCase_onceToken, &__block_literal_global_47);
        if (_isValidSpecialCase_useSpecialCase)
          goto LABEL_8;
      }
      else if (CFEqual(v6, CFSTR("override")))
      {
LABEL_8:
        v42.location = 0;
        v42.length = v4.location;
        v7 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v42);
        v8 = a1[5];
        Value = CFDictionaryGetValue(a1[6], cf);
        CFDictionarySetValue(v8, v7, Value);
        CFArrayAppendValue(a1[4], cf);
        CFRelease(v7);
        if (v6)
          CFRelease(v6);
        return;
      }
      if (v6)
        CFRelease(v6);
    }
    v10 = CFStringFind(cf, CFSTR("-"), 4uLL);
    location = v10.location;
    v12 = CFStringFind(cf, CFSTR("~"), 4uLL);
    if ((v10.location != -1 || v12.location != -1)
      && (v10.location == -1 || v12.location == -1 || v12.location > v10.location))
    {
      v13 = CFStringGetLength(cf);
      v14 = v12.location == -1 ? v13 : v12.location;
      v15 = v12.location == -1 ? -1 : v12.location + v12.length;
      v16 = v12.location == -1 ? 0 : v13 - (v12.location + v12.length);
      if (v10.location == -1)
      {
        location = v12.location;
        v17 = -1;
      }
      else
      {
        v17 = v10.location + v10.length;
      }
      v18 = v10.location == -1 ? 0 : v14 - (v10.location + v10.length);
      if (location >= 1 && (v17 == -1 || v18 >= 1) && (v15 == -1 || v16 >= 1))
      {
        if (v17 != -1 || v15 == -1)
        {
          if (v17 == -1 || v15 != -1)
          {
            v40.location = v15;
            v40.length = v16;
            v19 = _CFBundleSupportedProductName(cf, v40);
            if (v19)
            {
              v44.location = v17;
              v44.length = v18;
              v19 = CFStringFindWithOptions(cf, CFSTR("iphoneos"), v44, 8uLL, 0) != 0;
            }
          }
          else
          {
            v43.location = v17;
            v43.length = v18;
            v19 = CFStringFindWithOptions(cf, CFSTR("iphoneos"), v43, 8uLL, 0);
          }
        }
        else
        {
          v39.location = v15;
          v39.length = v16;
          v19 = _CFBundleSupportedProductName(cf, v39);
        }
        if (v19)
        {
          v45.location = 0;
          v45.length = location;
          v20 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v45);
          if (v17 == -1)
          {
            v21 = 0;
          }
          else
          {
            v46.location = v17;
            v46.length = v18;
            v21 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v46);
          }
          if (v15 == -1)
          {
            v22 = 0;
          }
          else
          {
            v47.location = v15;
            v47.length = v16;
            v22 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v47);
          }
          if (!((unint64_t)v21 | (unint64_t)v22))
          {
            v21 = 0;
            goto LABEL_68;
          }
          if (v21)
          {
            if (v22)
            {
              if (_CFGetProductName_onceToken != -1)
                dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
              v23 = CFEqual((CFTypeRef)_CFGetProductName__cfBundlePlatform, v22);
              if (v23)
                v23 = CFEqual(CFSTR("iphoneos"), v21) != 0;
LABEL_67:
              if (!v23)
              {
                CFArrayAppendValue(a1[4], cf);
                if (!v21)
                  goto LABEL_76;
                goto LABEL_75;
              }
LABEL_68:
              v26 = a1[6];
              Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
              v37 = v26;
              if (_CFGetProductName_onceToken != -1)
                dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
              v28 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@-%@~%@"), v20, CFSTR("iphoneos"), _CFGetProductName__cfBundlePlatform);
              if (_CFGetProductName_onceToken != -1)
                dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
              v29 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@~%@"), v20, _CFGetProductName__cfBundlePlatform);
              v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@-%@"), v20, CFSTR("iphoneos"));
              CFArrayAppendValue(Mutable, v28);
              CFArrayAppendValue(Mutable, v29);
              CFArrayAppendValue(Mutable, v30);
              CFRelease(v28);
              CFRelease(v29);
              CFRelease(v30);
              v31 = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
              Count = CFArrayGetCount(Mutable);
              v38[0] = MEMORY[0x1E0C809B0];
              v38[1] = 0x40000000;
              v38[2] = ___CopySortedOverridesForBaseKey_block_invoke;
              v38[3] = &__block_descriptor_tmp_65;
              v38[4] = v37;
              v38[5] = v31;
              CFArrayApply((uint64_t)Mutable, 0, Count, (uint64_t)v38);
              CFRelease(Mutable);
              ValueAtIndex = CFArrayGetValueAtIndex(v31, 0);
              v34 = a1[5];
              v35 = CFDictionaryGetValue(a1[6], ValueAtIndex);
              CFDictionarySetValue(v34, v20, v35);
              v36 = CFArrayGetCount(v31);
              if (v36 >= 1)
              {
                v48.location = 1;
                v48.length = v36 - 1;
                CFArrayAppendArray(a1[4], v31, v48);
              }
              CFRelease(v31);
              if (!v21)
                goto LABEL_76;
LABEL_75:
              CFRelease(v21);
LABEL_76:
              if (v22)
                CFRelease(v22);
              CFRelease(v20);
              return;
            }
            v24 = CFSTR("iphoneos");
            v25 = v21;
          }
          else
          {
            if (_CFGetProductName_onceToken != -1)
              dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
            v24 = (const __CFString *)_CFGetProductName__cfBundlePlatform;
            v25 = v22;
          }
          v23 = CFEqual(v24, v25);
          goto LABEL_67;
        }
      }
    }
  }
}

@end
