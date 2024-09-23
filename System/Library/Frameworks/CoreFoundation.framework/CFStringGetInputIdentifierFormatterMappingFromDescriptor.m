@implementation CFStringGetInputIdentifierFormatterMappingFromDescriptor

void ___CFStringGetInputIdentifierFormatterMappingFromDescriptor_block_invoke(uint64_t a1)
{
  CFIndex Count;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const void **v9;
  unint64_t v10;
  const void **v11;
  uint64_t v12;
  const void *v13;
  const __CFString *v14;
  _BOOL4 v15;
  unint64_t *v16;
  _BOOL4 v17;
  CFStringRef v18;
  NSException *v19;
  uint64_t v20;
  unint64_t *v21;
  size_t v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 32));
  _CFStringGetInputIdentifierFormatterMappingFromDescriptor_localizedStringFormattingFamilyInfo = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v3 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 32));
  if (((v3 >> 59) & 0xF) != 0)
  {
    v18 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), 2 * v3);
    v19 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v18, 0);
    CFRelease(v18);
    objc_exception_throw(v19);
  }
  v5 = v3;
  if (v3)
    v6 = 2 * v3;
  else
    v6 = 1;
  v7 = MEMORY[0x1E0C80A78](v6, v4);
  v9 = (const void **)((char *)&v20 - v8);
  v22[0] = 0;
  if (v10 >= 0x101)
  {
    v9 = (const void **)_CFCreateArrayStorage(v7, 0, v22);
    v11 = v9;
  }
  else
  {
    v11 = 0;
  }
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 32), v9, &v9[v5]);
  if (v5 >= 1)
  {
    v12 = v5;
    do
    {
      v13 = *v9;
      v14 = (const __CFString *)v9[v5];
      v21 = 0;
      v15 = __CFStringCopyCharSetWithPattern(v14, &v21);
      v16 = v21;
      if (v21)
        v17 = v15;
      else
        v17 = 0;
      if (v17)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)_CFStringGetInputIdentifierFormatterMappingFromDescriptor_localizedStringFormattingFamilyInfo, v13, v21);
        CFRelease(v16);
      }
      ++v9;
      --v12;
    }
    while (v12);
  }
  free(v11);
}

@end
