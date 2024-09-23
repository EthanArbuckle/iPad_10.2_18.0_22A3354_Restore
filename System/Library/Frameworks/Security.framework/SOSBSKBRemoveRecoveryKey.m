@implementation SOSBSKBRemoveRecoveryKey

void __SOSBSKBRemoveRecoveryKey_block_invoke(uint64_t a1, const __CFString *cf, const void *a3)
{
  const __CFString *v5;
  CFTypeID v6;
  CFTypeID v7;
  CFStringRef v8;
  CFStringRef v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!cf || (v5 = cf, v6 = CFGetTypeID(cf), v6 != CFStringGetTypeID()))
    v5 = 0;
  if (a3)
  {
    v7 = CFGetTypeID(a3);
    if (v7 == CFDataGetTypeID())
    {
      if (v5 && (unint64_t)CFStringFind(v5, CFSTR("-"), 0).location == 2)
      {
        v8 = SOSKeyedPubKeyIdentifierCopyPrefix(v5);
        v9 = v8;
        if (v8 && bskbRkbgPrefix)
        {
          if (CFEqual(v8, (CFTypeRef)bskbRkbgPrefix))
          {
LABEL_11:
            secLogObjForScope("bskb-backup");
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v12) = 0;
              _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "skipping recovery key entry", (uint8_t *)&v12, 2u);
            }

            goto LABEL_21;
          }
        }
        else if (v8 == (CFStringRef)bskbRkbgPrefix)
        {
          goto LABEL_11;
        }
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), v5, a3);
LABEL_21:
        if (v9)
          CFRelease(v9);
        return;
      }
    }
    else
    {
      a3 = 0;
    }
  }
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), v5, a3);
  secLogObjForScope("bskb-backup");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = a3;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "adding: %@:%@", (uint8_t *)&v12, 0x16u);
  }

}

@end
