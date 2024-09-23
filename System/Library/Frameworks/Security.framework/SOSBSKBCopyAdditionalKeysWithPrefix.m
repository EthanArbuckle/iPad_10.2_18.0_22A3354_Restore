@implementation SOSBSKBCopyAdditionalKeysWithPrefix

void __SOSBSKBCopyAdditionalKeysWithPrefix_block_invoke(uint64_t a1, const __CFString *cf, const void *a3)
{
  const __CFString *v5;
  CFTypeID v6;
  CFTypeID v7;
  CFTypeID TypeID;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;

  if (!cf || (v5 = cf, v6 = CFGetTypeID(cf), v6 != CFStringGetTypeID()))
    v5 = 0;
  if (a3)
  {
    v7 = CFGetTypeID(a3);
    TypeID = CFDataGetTypeID();
    if (v5)
    {
      if (v7 == TypeID && (unint64_t)CFStringFind(v5, CFSTR("-"), 0).location == 2)
      {
        v9 = SOSKeyedPubKeyIdentifierCopyPrefix(v5);
        v10 = v9;
        v11 = *(CFStringRef *)(a1 + 32);
        if (v9 && v11)
        {
          if (!CFEqual(v9, v11))
          {
LABEL_15:
            CFRelease(v10);
            return;
          }
        }
        else if (v9 != v11)
        {
          goto LABEL_14;
        }
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 40), v5, a3);
LABEL_14:
        if (!v10)
          return;
        goto LABEL_15;
      }
    }
  }
}

@end
