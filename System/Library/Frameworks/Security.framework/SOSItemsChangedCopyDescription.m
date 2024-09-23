@implementation SOSItemsChangedCopyDescription

void __SOSItemsChangedCopyDescription_block_invoke(uint64_t a1, const __CFString *cf, const __CFString *a3)
{
  CFTypeID v6;
  CFTypeID TypeID;
  CFStringRef v8;
  CFTypeID v9;
  int KeyType;
  const __CFAllocator *v11;
  uint64_t v12;
  const void *v13;
  const char *v14;
  CFStringRef v15;
  CFTypeRef v16;

  if (!cf)
    goto LABEL_9;
  v6 = CFGetTypeID(cf);
  TypeID = CFStringGetTypeID();
  v8 = 0;
  if (!a3 || v6 != TypeID)
    goto LABEL_10;
  v9 = CFGetTypeID(a3);
  if (v9 != CFDataGetTypeID())
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  KeyType = SOSKVSKeyGetKeyType(cf);
  if (KeyType != 1)
  {
    if (!KeyType)
    {
      v16 = 0;
      v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v12 = SOSCircleCreateFromData((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (CFDataRef)a3, &v16);
      if (v12)
      {
        v13 = (const void *)v12;
        v8 = CFStringCreateWithFormat(v11, 0, CFSTR("%@"), v12);
        CFRelease(v13);
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  v8 = CFCopyDescription(a3);
LABEL_10:
  if (*(_BYTE *)(a1 + 40))
    v14 = "<=";
  else
    v14 = "=>";
  if (v8)
    v15 = v8;
  else
    v15 = a3;
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("    '%@' %s %@\n"), cf, v14, v15);
  if (v8)
    CFRelease(v8);
}

@end
