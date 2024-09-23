@implementation _NSPredicateOperatorUtilities

+ (BOOL)doRegexForString:(id)a3 pattern:(id)a4 likeProtect:(BOOL)a5 flags:(unint64_t)a6 context:(id *)a7
{
  _BOOL4 v9;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  CFStringCompareFlags v15;
  uint64_t v16;
  UChar *v17;
  size_t v18;
  URegularExpression *v19;
  UErrorCode v20;
  int64_t v22;
  uint64_t Length;
  _BOOL4 v24;
  uint64_t v25;
  UniChar *v26;
  uint64_t v27;
  CFIndex v28;
  __CFString *MutableWithExternalCharactersNoCopy;
  __CFString *v30;
  UniChar *v31;
  UErrorCode v32;
  int v33;
  const __CFString *v35;
  NSString *v36;
  void *v37;
  NSString *v38;
  NSString *v39;
  void *v40;
  NSString *v41;
  NSString *v42;
  _QWORD v43[2];
  unint64_t v44;
  unint64_t v45;
  const __CFString *v46;
  UChar *v47;
  unsigned __int8 v48;
  CFIndex v49;
  UErrorCode status;
  uint64_t v51;
  CFRange v52;
  CFRange v53;
  CFRange v54;

  v9 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v46 = (const __CFString *)a4;
  v12 = objc_msgSend(a4, "length");
  if (v12 >> 30 || (v13 = v12, v14 = objc_msgSend(a3, "length"), v14 >> 30))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid string or pattern length (too long)"), 0));
  v44 = a6 & 2;
  v45 = a6 & 1;
  if ((a6 & 2) != 0)
    v15 = ((uint64_t)(a6 << 63) >> 63) & 1 | 0x180;
  else
    v15 = ((uint64_t)(a6 << 63) >> 63) & 0x101;
  status = U_ZERO_ERROR;
  a7->var2 = 3;
  if (!a7->var1)
  {
    v43[1] = v43;
    v49 = v13;
    MEMORY[0x1E0C80A78](v14);
    v17 = (UChar *)((char *)v43 - v16);
    v48 = 0;
    if (v13 >= 0x1C2)
    {
      v18 = v13 + 200;
      v17 = (UChar *)malloc_type_malloc(2 * (v13 + 200), 0x1000040BDFB0063uLL);
      v48 = 1;
    }
    else
    {
      v18 = 1024;
    }
    v47 = v17;
    if ((a6 & 4) != 0)
    {
      v52.location = 0;
      v52.length = v13;
      CFStringGetCharacters(v46, v52, v17);
      v17[v13] = 0;
      a7->var0 = (id)CFStringCreateWithCharacters(0, v17, v13);
      if (v9)
      {
        objc_msgSend(a1, "copyRegexFindSafePattern:toBuffer:", v46, v17);
        LODWORD(v13) = u_strlen(v17);
        v49 = (int)v13;
      }
    }
    else
    {
      _doPatternNormalization(v46, (void **)&v47, &v48, v9, (CFStringRef *)a7, v15, &v49, v18, kCFStringNormalizationFormKC);
      v17 = v47;
      LODWORD(v13) = v49;
    }
    v19 = uregex_open(v17, v13, 0x28u, 0, &status);
    v20 = status;
    if (status < U_ILLEGAL_ARGUMENT_ERROR || (a6 & 4) != 0)
    {
      if (status < U_ILLEGAL_ARGUMENT_ERROR)
      {
        v22 = 3;
        goto LABEL_24;
      }
    }
    else
    {

      a7->var0 = 0;
      _doPatternNormalization(v46, (void **)&v47, &v48, v9, (CFStringRef *)a7, v15, &v49, v18, kCFStringNormalizationFormC);
      if (v19)
        uregex_close(v19);
      status = U_ZERO_ERROR;
      v19 = uregex_open(v47, v49, 0x28u, 0, &status);
      if (status < U_ILLEGAL_ARGUMENT_ERROR)
      {
        v22 = 2;
LABEL_24:
        a7->var1 = v19;
        a7->var2 = v22;
        if (v48)
          free(v47);
        goto LABEL_26;
      }
      status = v20;
    }
    v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't open pattern %s (string %@, pattern %@, case %ld, canon %ld)"), u_errorName(v20), a3, v46, v45, v44);
    uregex_close(v19);
    if (v48)
      free(v47);
    v40 = (void *)MEMORY[0x1E0C99DA0];
    if (status == U_REGEX_RULE_SYNTAX)
    {
      v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't do regex matching, reason: (%@)"), v39);
      objc_exception_throw((id)objc_msgSend(v40, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v41, 0));
    }
    v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't do regex matching, reason: %@"), v39);
    objc_exception_throw((id)objc_msgSend(v40, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v42, 0));
  }
LABEL_26:
  Length = CFStringGetLength((CFStringRef)a3);
  v24 = Length > 899;
  MEMORY[0x1E0C80A78](Length);
  v26 = (UniChar *)((char *)v43 - v25);
  if (v27 < 900)
  {
    v28 = 1024;
  }
  else
  {
    v28 = Length + 200;
    v26 = (UniChar *)malloc_type_malloc(2 * (Length + 200), 0x1000040BDFB0063uLL);
  }
  v53.location = 0;
  v53.length = Length;
  CFStringGetCharacters((CFStringRef)a3, v53, v26);
  v26[Length] = 0;
  if (((a6 >> 2) & 1) == 0)
  {
    MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v26, Length, v28, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    v30 = MutableWithExternalCharactersNoCopy;
    if ((a6 & 3) != 0)
      CFStringFold(MutableWithExternalCharactersNoCopy, v15, 0);
    CFStringNormalize(v30, (CFStringNormalizationForm)a7->var2);
    if (CFStringGetCharactersPtr(v30) == v26)
    {
      LODWORD(Length) = CFStringGetLength(v30);
    }
    else
    {
      if (Length >= 900)
        free(v26);
      Length = CFStringGetLength(v30);
      v31 = (UniChar *)malloc_type_malloc(2 * Length + 2, 0x1000040BDFB0063uLL);
      v24 = 1;
      v54.location = 0;
      v54.length = Length;
      CFStringGetCharacters(v30, v54, v31);
      v31[Length] = 0;
      v26 = v31;
    }
    CFRelease(v30);
  }
  uregex_setText((URegularExpression *)a7->var1, v26, Length, &status);
  v32 = status;
  if (status > U_ZERO_ERROR)
  {
    v35 = CFSTR("Can't setText %s (string %@, pattern %@, case %ld, canon %ld)");
    goto LABEL_46;
  }
  v33 = uregex_matches((URegularExpression *)a7->var1, 0, &status);
  v32 = status;
  if (status >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    v35 = CFSTR("Can't do match %s (string %@, pattern %@, case %ld, canon %ld)");
LABEL_46:
    v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, u_errorName(v32), a3, v46, v45, v44);
    if (v24)
      free(v26);
    v37 = (void *)MEMORY[0x1E0C99DA0];
    v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't do regex matching, reason: %@"), v36);
    objc_exception_throw((id)objc_msgSend(v37, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v38, 0));
  }
  if (v24)
    free(v26);
  return v33 != 0;
}

+ (__CFLocale)retainedLocale
{
  CFLocaleRef v2;
  __CFNotificationCenter *LocalCenter;
  const __CFString *v5;
  const __CFString *ValueAtIndex;
  const __CFAllocator *v7;
  const __CFString *CanonicalLanguageIdentifierFromString;
  char v9;
  const __CFArray *v10;
  const __CFArray *v11;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  const void *v13;
  const __CFString *Value;
  const __CFString *v15;
  CFLocaleRef v16;

  v2 = (CFLocaleRef)qword_1ECD0A2B8;
  if (!qword_1ECD0A2B8)
  {
    objc_sync_enter(a1);
    if ((_MergedGlobals_131 & 1) == 0)
    {
      _MergedGlobals_131 = 1;
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_localeDidChange, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v5 = (const __CFString *)*MEMORY[0x1E0C9B248];
    ValueAtIndex = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("AppleCollationOrder"), (CFStringRef)*MEMORY[0x1E0C9B248]);
    if (ValueAtIndex
      || (v10 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), v5), (v11 = v10) != 0)
      && (ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v10, 0),
          CFRetain(ValueAtIndex),
          CFRelease(v11),
          ValueAtIndex))
    {
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], ValueAtIndex);
      if (!CanonicalLanguageIdentifierFromString)
      {
        CanonicalLanguageIdentifierFromString = &stru_1E0F56070;
        CFRetain(&stru_1E0F56070);
      }
      v9 = 0;
    }
    else
    {
      CFRetain(&stru_1E0F56070);
      ValueAtIndex = 0;
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      CanonicalLanguageIdentifierFromString = &stru_1E0F56070;
      v9 = 1;
    }
    ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v7, CanonicalLanguageIdentifierFromString);
    v13 = (const void *)*MEMORY[0x1E0C9B088];
    if (CFDictionaryContainsKey(ComponentsFromLocaleIdentifier, (const void *)*MEMORY[0x1E0C9B088]))
      Value = (const __CFString *)CFDictionaryGetValue(ComponentsFromLocaleIdentifier, v13);
    else
      Value = &stru_1E0F56070;
    if (Value)
      v15 = Value;
    else
      v15 = &stru_1E0F56070;
    v16 = CFLocaleCreate(0, v15);
    v2 = v16;
    while (!__ldaxr((unint64_t *)&qword_1ECD0A2B8))
    {
      if (!__stlxr((unint64_t)v16, (unint64_t *)&qword_1ECD0A2B8))
      {
        if ((v9 & 1) != 0)
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    __clrex();
    CFRelease(v16);
    v2 = (CFLocaleRef)qword_1ECD0A2B8;
    if ((v9 & 1) != 0)
      goto LABEL_24;
LABEL_23:
    CFRelease(ValueAtIndex);
LABEL_24:
    CFRelease(CanonicalLanguageIdentifierFromString);
    CFRelease(ComponentsFromLocaleIdentifier);
    objc_sync_exit(a1);
  }
  CFRetain(v2);
  return v2;
}

+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4
{
  CFStringCompareFlags v6;
  uint64_t Length;
  BOOL v8;
  uint64_t v9;
  UniChar *v10;
  uint64_t v11;
  CFIndex v12;
  __CFString *MutableWithExternalCharactersNoCopy;
  __CFString *v14;
  _QWORD v16[2];
  CFRange v17;
  CFRange v18;

  v16[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(a3, "length") >> 30)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid string length (too long)"), 0));
  if ((a4 & 2) != 0)
    v6 = ((uint64_t)(a4 << 63) >> 63) & 1 | 0x180;
  else
    v6 = ((uint64_t)(a4 << 63) >> 63) & 0x101;
  Length = CFStringGetLength((CFStringRef)a3);
  v8 = Length > 899;
  MEMORY[0x1E0C80A78](Length);
  v10 = (UniChar *)((char *)v16 - v9);
  if (v11 < 900)
  {
    v12 = 1024;
  }
  else
  {
    v12 = Length + 200;
    v10 = (UniChar *)malloc_type_malloc(2 * (Length + 200), 0x1000040BDFB0063uLL);
  }
  v17.location = 0;
  v17.length = Length;
  CFStringGetCharacters((CFStringRef)a3, v17, v10);
  v10[Length] = 0;
  if ((a4 & 4) != 0)
  {
    if (Length < 900)
      return (id)CFStringCreateWithCharacters(0, v10, Length);
  }
  else
  {
    MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, Length, v12, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    v14 = MutableWithExternalCharactersNoCopy;
    if ((a4 & 3) != 0)
      CFStringFold(MutableWithExternalCharactersNoCopy, v6, 0);
    CFStringNormalize(v14, kCFStringNormalizationFormKC);
    if (CFStringGetCharactersPtr(v14) != v10)
    {
      if (Length >= 900)
        free(v10);
      Length = CFStringGetLength(v14);
      v8 = 1;
      v10 = (UniChar *)malloc_type_malloc(2 * Length + 2, 0x1000040BDFB0063uLL);
      v18.location = 0;
      v18.length = Length;
      CFStringGetCharacters(v14, v18, v10);
    }
    CFRelease(v14);
    v10[Length] = 0;
    if (!v8)
      return (id)CFStringCreateWithCharacters(0, v10, Length);
  }
  return (id)CFStringCreateWithCharactersNoCopy(0, v10, Length, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
}

+ (int64_t)copyRegexFindSafePattern:(id)a3 toBuffer:(unsigned __int16 *)a4
{
  CFIndex Length;
  const __CFString *CharactersPtr;
  uint64_t v8;
  __int16 v9;
  const char *CStringPtr;
  CFIndex v11;
  int64_t v12;
  CFRange v14;
  CFIndex v15;
  int64_t v16;
  CFIndex v17;
  CFStringRef v18;
  int64_t v19;
  __int16 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int16 v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFIndex v32;
  uint64_t v33;
  unsigned __int16 *v34;
  __int16 v35;
  unsigned __int16 *v36;
  int64_t v37;
  unsigned __int16 v38;
  CFIndex v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFStringRef theString[2];
  __int128 v49;
  __int128 v50;
  CFIndex v51;
  uint64_t v52;
  CFRange v53;
  CFRange v54;

  v52 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength((CFStringRef)a3);
  v49 = 0u;
  v47 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  theString[0] = (CFStringRef)a3;
  v51 = 0;
  v50 = (unint64_t)Length;
  CharactersPtr = (const __CFString *)CFStringGetCharactersPtr((CFStringRef)a3);
  theString[1] = CharactersPtr;
  if (CharactersPtr)
  {
    *((_QWORD *)&v50 + 1) = 0;
    v51 = 0;
    *(_QWORD *)&v49 = 0;
    if (Length >= 1)
    {
      v8 = 0;
      v9 = *((_WORD *)CharactersPtr + Length - 1);
      goto LABEL_15;
    }
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
    *((_QWORD *)&v50 + 1) = 0;
    v51 = 0;
    *(_QWORD *)&v49 = CStringPtr;
    if (Length > 0)
    {
      v11 = Length - 1;
      if (CStringPtr)
      {
        v8 = 0;
        v9 = CStringPtr[v11];
      }
      else
      {
        if ((unint64_t)Length >= 5)
          v14.location = Length - 5;
        else
          v14.location = 0;
        v15 = v14.location + 64;
        if (v14.location + 64 >= Length)
          v15 = Length;
        *((_QWORD *)&v50 + 1) = v14.location;
        v51 = v15;
        v14.length = v15 - v14.location;
        CFStringGetCharacters((CFStringRef)a3, v14, (UniChar *)&v40);
        v8 = *((_QWORD *)&v50 + 1);
        v9 = *((_WORD *)&v40 + v11 - *((_QWORD *)&v50 + 1));
      }
LABEL_15:
      if (v9 != 92)
      {
LABEL_24:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v12 = 0;
        v24 = 64;
        while (1)
        {
          if ((unint64_t)v23 >= 4)
            v25 = 4;
          else
            v25 = v23;
          v26 = v50;
          if ((uint64_t)v50 <= v23)
          {
            v27 = 0;
          }
          else
          {
            if (theString[1])
            {
              v27 = *((_WORD *)&theString[1]->isa + v23 + *((_QWORD *)&v49 + 1));
            }
            else if ((_QWORD)v49)
            {
              v27 = *(char *)(v49 + *((_QWORD *)&v49 + 1) + v23);
            }
            else
            {
              if (v51 <= v23 || v8 > v23)
              {
                v29 = v25 + v21;
                v30 = v24 - v25;
                v31 = v23 - v25;
                v32 = v31 + 64;
                if (v31 + 64 >= (uint64_t)v50)
                  v32 = v50;
                *((_QWORD *)&v50 + 1) = v31;
                v51 = v32;
                if ((uint64_t)v50 >= v30)
                  v26 = v30;
                v53.length = v26 + v29;
                v53.location = v31 + *((_QWORD *)&v49 + 1);
                CFStringGetCharacters(theString[0], v53, (UniChar *)&v40);
                v8 = *((_QWORD *)&v50 + 1);
              }
              v27 = *((_WORD *)&v40 + v23 - v8);
            }
            if (v27 <= 0x2Au)
            {
              if (v27 - 40 < 2 || v27 == 36)
                goto LABEL_61;
              if (v27 == 42)
              {
                v34 = &a4[v12];
                if ((v22 & 1) != 0)
                  v35 = 92;
                else
                  v35 = 46;
                *v34 = v35;
                v34[1] = 42;
                v12 += 2;
                v22 = 0;
                goto LABEL_62;
              }
            }
            else
            {
              v33 = v27 - 43;
              if (v33 <= 0x33)
              {
                if (((1 << (v27 - 43)) & 0x9000000000019) != 0)
                  goto LABEL_61;
                if (v33 == 20)
                {
                  if ((v22 & 1) != 0)
                  {
                    v37 = v12 + 1;
                    a4[v12 + 1] = 63;
                    v38 = 92;
                  }
                  else
                  {
                    v38 = 46;
                    v37 = v12;
                  }
                  v22 = 0;
                  a4[v12] = v38;
                  v12 = v37 + 1;
                  goto LABEL_62;
                }
                if (v33 == 49)
                {
                  if ((v22 & 1) != 0)
                  {
                    *(_DWORD *)&a4[v12] = 6029404;
                    v12 += 2;
                  }
                  v22 ^= 1u;
                  goto LABEL_62;
                }
              }
              if (v27 - 123 < 3)
              {
LABEL_61:
                v22 = 0;
                v36 = &a4[v12];
                *v36 = 92;
                v12 += 2;
                v36[1] = v27;
                goto LABEL_62;
              }
            }
          }
          v22 = 0;
          a4[v12++] = v27;
LABEL_62:
          ++v23;
          --v21;
          ++v24;
          if (Length == v23)
            goto LABEL_8;
        }
      }
      if (Length == 1 || (v16 = Length - 2, v17 = v50, (uint64_t)v50 <= Length - 2))
LABEL_76:
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The backslash is a wildcard char, and cannot appear unescaped at the end of a string."), 0, v40, v41, v42, v43, v44, v45, v46, v47));
      v18 = theString[1];
      if (theString[1])
      {
        v19 = *((_QWORD *)&v49 + 1) + v16;
      }
      else
      {
        if ((_QWORD)v49)
        {
          v20 = *(char *)(v49 + *((_QWORD *)&v49 + 1) + v16);
LABEL_23:
          if (v20 == 92)
            goto LABEL_24;
          goto LABEL_76;
        }
        if (v8 > v16 || v51 <= v16)
        {
          v39 = Length - 6;
          if ((unint64_t)v16 < 4)
            v39 = 0;
          if (v39 + 64 < (uint64_t)v50)
            v17 = v39 + 64;
          *((_QWORD *)&v50 + 1) = v39;
          v51 = v17;
          v54.location = *((_QWORD *)&v49 + 1) + v39;
          v54.length = v17 - v39;
          CFStringGetCharacters(theString[0], v54, (UniChar *)&v40);
          v8 = *((_QWORD *)&v50 + 1);
        }
        v19 = v16 - v8;
        v18 = (CFStringRef)&v40;
      }
      v20 = *((_WORD *)&v18->isa + v19);
      goto LABEL_23;
    }
  }
  v12 = 0;
LABEL_8:
  a4[v12] = 0;
  return v12;
}

@end
