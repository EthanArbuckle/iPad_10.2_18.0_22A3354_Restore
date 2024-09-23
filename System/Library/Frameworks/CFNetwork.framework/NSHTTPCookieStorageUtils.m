@implementation NSHTTPCookieStorageUtils

+ (id)getEffectiveTLDPlusOne:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(CFSTR("."), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8), (_QWORD)v16);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    v10 = objc_msgSend(v4, "count");
    v11 = &stru_1E1500C68;
    while ((int)v10 > 0)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", --v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", v11);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v11 = v13;
      if (!isTopLevelDomain(v13, 1))
      {
        -[__CFString lowercaseString](v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v13;
        goto LABEL_15;
      }
    }
    v14 = 0;
LABEL_15:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (uint64_t)looksLikeIPAddress:(uint64_t)a1
{
  CFIndex Length;
  uint64_t result;
  char buffer[24];
  _BYTE v6[255];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  Length = CFStringGetLength(a2);
  result = 0;
  if (Length && Length <= 23)
  {
    if (CFStringGetCharacterAtIndex(a2, 0) == 46
      && Length == 1
      && (*(_DWORD *)(MEMORY[0x1E0C80978] + 244) & 0x10000) == 0)
    {
      return 0;
    }
    else
    {
      result = CFStringGetCString(a2, buffer, 24, 0x600u);
      if ((_DWORD)result)
      {
        result = inet_pton(2, buffer, v6);
        if ((_DWORD)result != 1)
          return inet_pton(30, buffer, v6) == 1;
      }
    }
  }
  return result;
}

+ (__CFString)copyStringAndLowerCase:(uint64_t)a1
{
  const __CFAllocator *v3;
  __CFString *MutableCopy;
  const __CFLocale *System;

  objc_opt_self();
  v3 = CFGetAllocator(a2);
  MutableCopy = CFStringCreateMutableCopy(v3, 0, a2);
  System = CFLocaleGetSystem();
  CFStringLowercase(MutableCopy, System);
  return MutableCopy;
}

+ (uint64_t)isURLInMainDocumentDomain:(const __CFURL *)a3 withMainDocumentURL:(int)a4 ignoringTLD:
{
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  CFIndex location;
  CFIndex Length;
  CFRange v14;
  CFIndex v15;
  CFIndex v16;
  CFIndex v17;
  CFIndex v18;
  const __CFString *v19;
  int v20;
  CFIndex v21;
  uint64_t v22;
  const __CFURL *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFAllocator *alloc;
  CFRange result;
  CFRange v29;
  CFRange v30;
  CFRange v31;

  objc_opt_self();
  v7 = CFURLCopyHostName(a2);
  v8 = CFURLCopyHostName(a3);
  if (!((unint64_t)v7 | (unint64_t)v8))
  {
    v7 = (const __CFString *)CFRetain(CFSTR(".^filecookies^"));
    v8 = (const __CFString *)CFRetain(CFSTR(".^filecookies^"));
  }
  v9 = v8;
  if (v7 && v8)
  {
    v10 = +[NSHTTPCookieStorageUtils copyStringAndLowerCase:]((uint64_t)NSHTTPCookieStorageUtils, v7);
    v11 = +[NSHTTPCookieStorageUtils copyStringAndLowerCase:]((uint64_t)NSHTTPCookieStorageUtils, v9);
    if (CFStringCompare(v10, v11, 0) == kCFCompareEqualTo)
    {
      v22 = 1;
      if (!v10)
        goto LABEL_31;
      goto LABEL_30;
    }
    v24 = a3;
    v26 = v7;
    objc_opt_self();
    alloc = CFGetAllocator(v10);
    CFStringFind(v10, CFSTR("."), 8uLL);
    CFStringFind(v11, CFSTR("."), 8uLL);
    location = CFStringFind(v10, CFSTR("."), 4uLL).location;
    if (location == -1 || (Length = location, location != CFStringGetLength(v10) - 1))
      Length = CFStringGetLength(v10);
    v25 = v9;
    v14 = CFStringFind(v11, CFSTR("."), 4uLL);
    result = v14;
    if (v14.location == -1 || (v15 = v14.location, v14.location != CFStringGetLength(v11) - 1))
      v15 = CFStringGetLength(v11);
    if (Length < 1)
    {
LABEL_23:
      v9 = v25;
      v7 = v26;
    }
    else
    {
      v16 = 0;
      v17 = Length;
      while (1)
      {
        v18 = v15 >= v17 ? v17 : v15;
        v29.location = v16;
        v29.length = v17;
        v19 = CFStringCreateWithSubstring(alloc, v10, v29);
        v30.location = (v15 - v17) & ~((v15 - v17) >> 63);
        v30.length = v18;
        if (CFStringCompareWithOptions(v11, v19, v30, 1uLL) == kCFCompareEqualTo)
          break;
        v31.location = v16;
        v31.length = v17;
        v20 = CFStringFindWithOptions(v10, CFSTR("."), v31, 0, &result);
        v21 = result.location;
        CFRelease(v19);
        if (v20)
          v16 = v21 + 1;
        else
          v16 = -1;
        if (v20)
        {
          v17 = Length + ~v21;
          if (v17 > 0)
            continue;
        }
        goto LABEL_23;
      }
      v9 = v25;
      v7 = v26;
      if (v19)
      {
        v22 = a4 | !isTopLevelDomain(v19, 1);
        CFRelease(v19);
        if (!v10)
        {
LABEL_31:
          if (v11)
            CFRelease(v11);
          goto LABEL_33;
        }
LABEL_30:
        CFRelease(v10);
        goto LABEL_31;
      }
    }
    v22 = v24 == 0;
    if (!v10)
      goto LABEL_31;
    goto LABEL_30;
  }
  v22 = 0;
  if (!v8)
  {
    v22 = 0;
    if (!v7)
      return v22;
    goto LABEL_34;
  }
LABEL_33:
  CFRelease(v9);
  if (v7)
LABEL_34:
    CFRelease(v7);
  return v22;
}

@end
