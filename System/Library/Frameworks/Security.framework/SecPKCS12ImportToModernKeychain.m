@implementation SecPKCS12ImportToModernKeychain

uint64_t __SecPKCS12ImportToModernKeychain_block_invoke(uint64_t a1, CFTypeRef cf)
{
  const __CFDictionary *v4;
  CFTypeID v5;
  uint64_t result;
  const void *v7;
  CFTypeID v8;
  __CFDictionary *v9;
  OSStatus v10;
  int v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const __CFArray *v15;
  CFTypeID v16;
  unsigned int v17;
  const void *v18;
  unsigned int v19;
  const void *ValueAtIndex;
  __CFDictionary *v21;
  OSStatus v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *(const __CFDictionary **)(a1 + 40);
  v5 = CFGetTypeID(cf);
  result = CFDictionaryGetTypeID();
  if (v5 == result)
  {
    if (!CFDictionaryContainsKey((CFDictionaryRef)cf, CFSTR("identity")))
    {
      v11 = 0;
LABEL_17:
      result = CFDictionaryContainsKey((CFDictionaryRef)cf, CFSTR("chain"));
      if (!(_DWORD)result)
      {
LABEL_35:
        if (!v11)
          return result;
        goto LABEL_36;
      }
      result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("chain"));
      if (result)
      {
        v15 = (const __CFArray *)result;
        v16 = CFGetTypeID((CFTypeRef)result);
        result = CFArrayGetTypeID();
        if (v16 == result)
        {
          v17 = 0;
          v18 = (const void *)*MEMORY[0x1E0C9AE50];
          while (1)
          {
            result = CFArrayGetCount(v15);
            if (result <= v17)
              goto LABEL_35;
            v19 = v17;
            ValueAtIndex = CFArrayGetValueAtIndex(v15, v17);
            v21 = secItemOptionsFromPKCS12Options(v4);
            CFDictionaryAddValue(v21, CFSTR("nleg"), v18);
            CFDictionaryAddValue(v21, CFSTR("class"), CFSTR("cert"));
            CFDictionaryAddValue(v21, CFSTR("v_Ref"), ValueAtIndex);
            v22 = SecItemAdd(v21, 0);
            if (v22 == -25299)
              break;
            v11 = v22;
            if (!v22)
            {
              v23 = secLogObjForScope("p12Decode");
              if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                goto LABEL_31;
              *(_WORD *)buf = 0;
              v24 = v23;
              v25 = "cert added to keychain";
LABEL_28:
              _os_log_impl(&dword_18A900000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
              v11 = 0;
              goto LABEL_31;
            }
            v27 = secLogObjForScope("SecError");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              v29 = v11;
              _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "p12Decode: Error %d adding identity to keychain", buf, 8u);
            }
LABEL_31:
            if (v21)
              CFRelease(v21);
            v17 = v19 + 1;
          }
          v26 = secLogObjForScope("p12Decode");
          v11 = 0;
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            goto LABEL_31;
          *(_WORD *)buf = 0;
          v24 = v26;
          v25 = "skipping dup cert";
          goto LABEL_28;
        }
      }
LABEL_34:
      v11 = -26276;
LABEL_36:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
      return result;
    }
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("identity"));
    if (!result)
      goto LABEL_34;
    v7 = (const void *)result;
    v8 = CFGetTypeID((CFTypeRef)result);
    result = SecIdentityGetTypeID();
    if (v8 != result)
      goto LABEL_34;
    v9 = secItemOptionsFromPKCS12Options(v4);
    CFDictionaryAddValue(v9, CFSTR("nleg"), (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionaryAddValue(v9, CFSTR("class"), CFSTR("idnt"));
    CFDictionaryAddValue(v9, CFSTR("v_Ref"), v7);
    v10 = SecItemAdd(v9, 0);
    if (v10 == -25299)
    {
      v12 = secLogObjForScope("p12Decode");
      v11 = 0;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_WORD *)buf = 0;
      v13 = "skipping dup cert";
    }
    else
    {
      v11 = v10;
      if (v10)
      {
        v14 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v29 = v11;
          _os_log_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEFAULT, "p12Decode: Error %d adding identity to keychain", buf, 8u);
        }
        goto LABEL_15;
      }
      v12 = secLogObjForScope("p12Decode");
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:
        if (v9)
          CFRelease(v9);
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      v13 = "cert added to keychain";
    }
    _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    v11 = 0;
    goto LABEL_15;
  }
  return result;
}

@end
