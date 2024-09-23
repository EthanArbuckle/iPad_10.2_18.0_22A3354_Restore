@implementation SecItemAuthDoQuery

uint64_t __SecItemAuthDoQuery_block_invoke(uint64_t a1, CFTypeRef *a2, __CFString **a3)
{
  const __CFDictionary *v6;
  const void *Value;
  const void *v8;
  __CFDictionary *v9;
  const void *v10;
  const void *v11;
  const __CFDictionary **v12;
  __CFDictionary *v13;
  __CFString *v14;
  __CFString *v15;
  CFTypeID v16;
  const __CFBoolean *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CFErrorDomain Domain;
  CFTypeRef v22;
  CFErrorRef v23;
  uint64_t result;
  CFErrorDomain v25;
  CFErrorDomain v26;
  const __CFDictionary *v27;
  CFNumberRef v28;
  CFTypeRef v29;
  CFTypeRef v30;
  CFMutableArrayRef Mutable;
  __CFString *v32;
  CFErrorRef err;

  v6 = *(const __CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  if (v6)
  {
    Value = CFDictionaryGetValue(v6, CFSTR("u_CredRef"));
    if (Value)
    {
      v8 = Value;
      v9 = SecCFDictionaryCOWGetMutable(*(const __CFDictionary ***)(a1 + 56));
      CFDictionarySetValue(v9, CFSTR("u_CredRef"), v8);
    }
    v10 = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), CFSTR("accc"));
    if (v10)
    {
      v11 = v10;
      v12 = *(const __CFDictionary ***)(a1 + 64);
      if (!v12)
        v12 = *(const __CFDictionary ***)(a1 + 56);
      v13 = SecCFDictionaryCOWGetMutable(v12);
      CFDictionarySetValue(v13, CFSTR("accc"), v11);
    }
  }
  v14 = (__CFString *)CFDictionaryGetValue(**(CFDictionaryRef **)(a1 + 56), CFSTR("tkid"));
  if (v14)
  {
    v15 = v14;
    v16 = CFGetTypeID(v14);
    if (v16 != CFStringGetTypeID())
    {
      SecError(-50, a3, CFSTR("Unexpected type"));
      return 1;
    }
    if (*(OSStatus (__cdecl **)(CFDictionaryRef, CFTypeRef *))(a1 + 72) != SecItemCopyMatching)
    {
      v17 = (const __CFBoolean *)CFDictionaryGetValue(**(CFDictionaryRef **)(a1 + 56), CFSTR("u_TokenRawItems"));
      if (!v17 || !CFBooleanGetValue(v17))
      {
        err = 0;
        SecTokenSessionCreate(v15, (CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), (__CFString **)&err);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
          if (*(OSStatus (__cdecl **)(CFDictionaryRef))(a1 + 72) != SecItemDelete
            || !CryptoTokenKitLibraryCore()
            || !getTKErrorDomainSymbolLoc()
            || (Domain = CFErrorGetDomain(err), getTKErrorDomain(), !CFEqual(Domain, v22))
            || CFErrorGetCode(err) != -7)
          {
            if (err)
            {
              if (a3 && !*a3)
                *a3 = (__CFString *)err;
              else
                CFRelease(err);
            }
            return 1;
          }
          v23 = err;
          if (err)
          {
            err = 0;
            CFRelease(v23);
          }
        }
      }
    }
  }
  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    if (!a3 || !*a3 || CFErrorGetCode((CFErrorRef)*a3) != -25330)
      return 1;
    v25 = CFErrorGetDomain((CFErrorRef)*a3);
    v26 = (CFErrorDomain)*MEMORY[0x1E0C9AFC8];
    if (v25 && v26)
    {
      if (!CFEqual(v25, v26))
        return 1;
LABEL_38:
      v27 = CFErrorCopyUserInfo((CFErrorRef)*a3);
      err = (CFErrorRef)-25330;
      v28 = CFNumberCreate(0, kCFNumberCFIndexType, &err);
      v29 = CFDictionaryGetValue(v27, v28);
      v30 = *a2;
      if (*a2 != v29)
      {
        if (!v29 || (CFRetain(v29), (v30 = *a2) != 0))
          CFRelease(v30);
        *a2 = v29;
      }
      if (!v29)
      {
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
        if (*a2)
          CFRelease(*a2);
        *a2 = Mutable;
      }
      CFRelease(v28);
      CFRelease(v27);
      v32 = *a3;
      if (*a3)
      {
        *a3 = 0;
        CFRelease(v32);
      }
      return 2;
    }
    if (v25 == v26)
      goto LABEL_38;
    return 1;
  }
  if (!a3)
    return 0;
  result = (uint64_t)*a3;
  if (*a3)
  {
    *a3 = 0;
    CFRelease((CFTypeRef)result);
    return 0;
  }
  return result;
}

@end
