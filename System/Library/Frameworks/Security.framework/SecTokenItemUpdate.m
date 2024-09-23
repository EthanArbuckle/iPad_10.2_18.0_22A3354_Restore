@implementation SecTokenItemUpdate

uint64_t __SecTokenItemUpdate_block_invoke(uint64_t a1, const __CFDictionary *a2, const __CFString *a3, CFErrorRef *a4)
{
  const __CFDictionary *MutableCopy;
  void *v9;
  const void *Value;
  void *v11;
  const void *v12;
  uint64_t v13;

  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 40));
  v9 = *(void **)(a1 + 32);
  Value = CFDictionaryGetValue(a2, CFSTR("oid"));
  v11 = SecTokenCopyUpdatedObjectID(v9, (uint64_t)Value, MutableCopy, a4);
  if (!v11)
  {
    v13 = 0;
    if (!MutableCopy)
      return v13;
    goto LABEL_3;
  }
  v12 = v11;
  v13 = SecItemRawUpdate(a3, MutableCopy, (CFTypeRef *)a4);
  CFRelease(v12);
  if (MutableCopy)
LABEL_3:
    CFRelease(MutableCopy);
  return v13;
}

@end
