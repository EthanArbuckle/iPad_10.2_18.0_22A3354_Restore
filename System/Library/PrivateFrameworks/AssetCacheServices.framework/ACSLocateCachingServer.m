@implementation ACSLocateCachingServer

void __ACSLocateCachingServer_block_invoke(uint64_t a1, uint64_t a2, CFArrayRef theArray, __CFError *a4)
{
  void *Copy;
  CFURLRef v7;
  const __CFArray *MutableCopy;
  NSObject *v9;
  int v10;
  uint64_t v11;
  CFAbsoluteTime v12;
  uint64_t v13;
  NSObject *v14;
  const __CFDictionary *ValueAtIndex;
  const __CFURL *v16;
  CFMutableArrayRef Mutable;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFArray *v22;
  const __CFString *String;
  const __CFString *v24;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v26;
  CFIndex v27;
  const __CFString *v28;
  const __CFString *v29;
  CFStringRef v30;
  SInt32 v31;
  const __CFString *v32;
  CFStringRef v33;
  CFStringRef v34;
  CFStringRef v35;
  const __CFString *v36;
  CFStringRef v37;
  CFStringRef v38;
  CFStringRef v39;
  CFStringRef v40;
  __CFString *v41;
  CFIndex v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFDictionary *Value;
  CFIndex Count;
  _QWORD block[10];
  int v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  CFURLRef v56;
  __int16 v57;
  const __CFArray *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  CFAbsoluteTime v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    Copy = aclErrorCreateCopy(a4);
LABEL_3:
    v7 = 0;
    MutableCopy = 0;
    goto LABEL_4;
  }
  MutableCopy = theArray;
  if (!theArray)
  {
    Copy = 0;
    v7 = 0;
    goto LABEL_4;
  }
  if (CFArrayGetCount(theArray) < 1)
  {
    Copy = 0;
    goto LABEL_3;
  }
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, 0);
  Copy = (void *)CFDictionaryGetValue(ValueAtIndex, CFSTR("hostport"));
  if (!Copy)
    goto LABEL_53;
  v16 = *(const __CFURL **)(a1 + 40);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v22 = Mutable;
    String = CFURLCopyQueryString(v16, 0);
    if (String)
    {
      v24 = String;
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, String, CFSTR("&"));
      if (!ArrayBySeparatingStrings)
        goto LABEL_47;
      v26 = ArrayBySeparatingStrings;
      if (CFArrayGetCount(ArrayBySeparatingStrings) >= 1)
      {
        v27 = 0;
        do
        {
          v28 = (const __CFString *)CFArrayGetValueAtIndex(v26, v27);
          if (aclIsReservedQueryParameter(v28))
            goto LABEL_48;
          CFArrayAppendValue(v22, v28);
        }
        while (++v27 < CFArrayGetCount(v26));
      }
      CFRelease(v26);
      CFRelease(v24);
    }
    v29 = CFURLCopyHostName(v16);
    if (v29)
    {
      v24 = v29;
      if (CFStringFind(v29, CFSTR(":"), 0).location == -1
        || CFStringHasPrefix(v24, CFSTR("["))
        || (v30 = CFStringCreateWithFormat(0, 0, CFSTR("[%@]"), v24), CFRelease(v24), (v24 = v30) != 0))
      {
        v31 = CFURLGetPortNumber(v16);
        if (v31 <= 0)
        {
          CFRetain(v24);
          v32 = v24;
        }
        else
        {
          v32 = CFStringCreateWithFormat(0, 0, CFSTR("%@:%hu"), v24, (unsigned __int16)v31);
          if (!v32)
            goto LABEL_47;
        }
        v33 = CFURLCreateStringByAddingPercentEscapes(0, v32, 0, CFSTR("!*'();:@&=+$,/?%#[]"), 0x8000100u);
        if (v33)
        {
          v34 = v33;
          v35 = CFStringCreateWithFormat(0, 0, CFSTR("source=%@"), v33);
          if (v35)
          {
            CFArrayAppendValue(v22, v35);
            CFRelease(v35);
            LODWORD(v35) = 1;
          }
          CFRelease(v34);
        }
        else
        {
          LODWORD(v35) = 0;
        }
        CFRelease(v32);
        CFRelease(v24);
        if ((_DWORD)v35)
        {
          v36 = CFURLCopyScheme(v16);
          if (v36)
          {
            v24 = v36;
            if (CFStringCompare(v36, CFSTR("http"), 1uLL))
            {
              v37 = CFURLCreateStringByAddingPercentEscapes(0, v24, 0, CFSTR("!*'();:@&=+$,/?%#[]"), 0x8000100u);
              if (!v37)
                goto LABEL_47;
              v26 = (const __CFArray *)v37;
              v38 = CFStringCreateWithFormat(0, 0, CFSTR("sourceScheme=%@"), v37);
              if (!v38)
              {
LABEL_48:
                v7 = 0;
LABEL_49:
                CFRelease(v26);
LABEL_50:
                CFRelease(v24);
                CFRelease(v22);
                if (v7)
                {
                  Copy = 0;
                  goto LABEL_54;
                }
                goto LABEL_52;
              }
              v39 = v38;
              CFArrayAppendValue(v22, v38);
              CFRelease(v39);
              CFRelease(v26);
            }
            CFRelease(v24);
          }
          v40 = CFURLCopyPath(v16);
          if (v40)
          {
            v24 = v40;
            v41 = CFStringCreateMutable(0, 0);
            if (v41)
            {
              v26 = (const __CFArray *)v41;
              CFStringAppendFormat(v41, 0, CFSTR("http://%@%@"), Copy, v24);
              if (CFArrayGetCount(v22) >= 1)
              {
                v42 = 0;
                v43 = CFSTR("?");
                do
                {
                  v44 = (const __CFString *)CFArrayGetValueAtIndex(v22, v42);
                  CFStringAppend((CFMutableStringRef)v26, v43);
                  CFStringAppend((CFMutableStringRef)v26, v44);
                  ++v42;
                  v43 = CFSTR("&");
                }
                while (v42 < CFArrayGetCount(v22));
              }
              v7 = CFURLCreateWithString(0, (CFStringRef)v26, 0);
              goto LABEL_49;
            }
LABEL_47:
            v7 = 0;
            goto LABEL_50;
          }
        }
      }
    }
    CFRelease(v22);
  }
LABEL_52:
  Copy = aclErrorCreate(*(unsigned int *)(a1 + 80), (const __CFString *)*MEMORY[0x1E0C9AFD0], 22, CFSTR("unable to rewrite %@ for caching server host/port %@"), v18, v19, v20, v21, *(_QWORD *)(a1 + 40));
LABEL_53:
  v7 = 0;
LABEL_54:
  Value = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, CFSTR("advice"));
  MutableCopy = Value;
  if (Value)
  {
    Count = CFDictionaryGetCount(Value);
    MutableCopy = CFDictionaryCreateMutableCopy(0, Count, MutableCopy);
  }
LABEL_4:
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v9 = qword_1ED1B39F0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B39F0, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_DWORD *)(a1 + 80);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 67110914;
    v50 = v10;
    v51 = 2080;
    v52 = v11;
    v53 = 2112;
    v54 = a2;
    v55 = 2112;
    v56 = v7;
    v57 = 2112;
    v58 = MutableCopy;
    v59 = 2112;
    v60 = Copy;
    v61 = 2048;
    v62 = v12;
    v63 = 2048;
    v64 = v13;
    _os_log_impl(&dword_1D4CDC000, v9, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] newURL %@, advice %@, error %@, elapsed %.3f/%.3f", buf, 0x4Eu);
  }
  v14 = *(NSObject **)(a1 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __ACSLocateCachingServer_block_invoke_57;
  block[3] = &unk_1E9877D00;
  block[6] = MutableCopy;
  block[7] = Copy;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v7;
  v48 = *(_DWORD *)(a1 + 80);
  block[8] = *(_QWORD *)(a1 + 48);
  block[9] = v14;
  dispatch_async(v14, block);
}

void __ACSLocateCachingServer_block_invoke_57(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1)
      __ACSLocateCachingServer_block_invoke_57_cold_3();
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    if (CFGetRetainCount(v3) != 1)
      __ACSLocateCachingServer_block_invoke_57_cold_2();
    CFRetain(*(CFTypeRef *)(a1 + 48));
  }
  v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    if (CFGetRetainCount(v4) != 1)
      __ACSLocateCachingServer_block_invoke_57_cold_1();
    CFRetain(*(CFTypeRef *)(a1 + 56));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = *(const void **)(a1 + 40);
  if (v5)
  {
    if (CFGetRetainCount(v5) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), (uint64_t)"modifiedURL", *(_QWORD *)(a1 + 40));
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  v6 = *(const void **)(a1 + 48);
  if (v6)
  {
    if (CFGetRetainCount(v6) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), (uint64_t)"advice", *(_QWORD *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  v7 = *(const void **)(a1 + 56);
  if (v7)
  {
    if (CFGetRetainCount(v7) <= 1)
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), (uint64_t)"error", *(_QWORD *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 56));
    v8 = *(const void **)(a1 + 56);
    if (v8)
      CFRelease(v8);
  }
  v9 = *(const void **)(a1 + 48);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(a1 + 40);
  if (v10)
    CFRelease(v10);
  dispatch_release(*(dispatch_object_t *)(a1 + 72));
}

void __ACSLocateCachingServer_block_invoke_57_cold_1()
{
  __assert_rtn("ACSLocateCachingServer_block_invoke", "AssetCacheLocator.c", 1098, "CFGetRetainCount(error) == 1");
}

void __ACSLocateCachingServer_block_invoke_57_cold_2()
{
  __assert_rtn("ACSLocateCachingServer_block_invoke", "AssetCacheLocator.c", 1097, "CFGetRetainCount(advice) == 1");
}

void __ACSLocateCachingServer_block_invoke_57_cold_3()
{
  __assert_rtn("ACSLocateCachingServer_block_invoke", "AssetCacheLocator.c", 1096, "CFGetRetainCount(newURL) == 1");
}

@end
