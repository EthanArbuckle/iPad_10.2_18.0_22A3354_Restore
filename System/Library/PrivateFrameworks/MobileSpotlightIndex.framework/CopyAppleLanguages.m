@implementation CopyAppleLanguages

void __CopyAppleLanguages_block_invoke()
{
  const __CFArray *v0;
  CFArrayRef v1;
  FILE *v2;
  CFAllocatorRef *v3;
  FILE *v4;
  const __CFAllocator *v6;
  const __CFString *v7;
  CFLocaleIdentifier CanonicalLanguageIdentifierFromString;
  char cStr;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[19];
  _BYTE values[100];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B248]);
  if (v0)
  {
    v1 = v0;
    if (CFArrayGetCount(v0) > 0)
      goto LABEL_20;
    CFRelease(v1);
  }
  v2 = fopen("/var/log/CDIS.custom", "r");
  v3 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (!v2)
  {
LABEL_19:
    *(_OWORD *)values = xmmword_1E6E30730;
    v1 = CFArrayCreate(*v3, (const void **)values, 2, MEMORY[0x1E0C9B378]);
    goto LABEL_20;
  }
  v4 = v2;
  memset(v15, 0, sizeof(v15));
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  memset(values, 0, sizeof(values));
  cStr = 0;
  while (fgets(values, 100, v4))
  {
    if (*(_QWORD *)values == 0x45474155474E414CLL && values[8] == 61)
    {
      sscanf(values, "LANGUAGE=%s\n", &cStr);
      break;
    }
  }
  if (!cStr)
  {
    fclose(v4);
    goto LABEL_19;
  }
  v6 = *v3;
  v7 = CFStringCreateWithCString(*v3, &cStr, 0x600u);
  fclose(v4);
  if (!v7)
    goto LABEL_19;
  CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(v6, v7);
  *(_QWORD *)values = CanonicalLanguageIdentifierFromString;
  CFRelease(v7);
  if (!CanonicalLanguageIdentifierFromString)
    goto LABEL_19;
  v1 = CFArrayCreate(v6, (const void **)values, 1, MEMORY[0x1E0C9B378]);
  CFRelease(*(CFTypeRef *)values);
  if (!v1)
    goto LABEL_19;
LABEL_20:
  CopyAppleLanguages_sAppleLanguages = (uint64_t)v1;
}

@end
