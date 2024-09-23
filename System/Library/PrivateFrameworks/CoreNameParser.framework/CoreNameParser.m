void sub_1DA471A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id charSetWithEndpoints(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  int v11;
  void *v12;
  uint64_t *v14;

  v14 = &a9;
  v10 = (void *)objc_opt_new();
  if (a1 >= 1)
  {
    v11 = 1;
    do
    {
      v14 += 2;
      objc_msgSend(v10, "addCharactersInRange:");
      v11 += 2;
    }
    while (v11 <= a1);
  }
  v12 = (void *)objc_msgSend(v10, "copy");

  return v12;
}

uint64_t _NPStripDiatritics(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByApplyingTransform:reverse:", CFSTR("NFKD; Latin-ASCII; NFC;"), 0);
}

__CFString *_NPCollapseWhitespaceAndStrip(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  size_t v4;
  char *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  UniChar v20;
  int v21;
  int64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  CFIndex v28;
  __CFString *v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  __CFString *v34;
  unint64_t v35;
  _OWORD buffer[8];
  __CFString *v37;
  const UniChar *v38;
  const char *v39;
  uint64_t v40;
  CFIndex v41;
  int64_t v42;
  int64_t v43;
  uint64_t v44;
  CFRange v45;

  v44 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (!v2)
    goto LABEL_35;
  v3 = v2;
  if (v2 > 0x1FF)
  {
    v5 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
    if (v5)
      goto LABEL_5;
LABEL_35:
    v29 = (__CFString *)v1;
    goto LABEL_48;
  }
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v5, v4);
LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const __CFString *)v1;
  v8 = (__CFString *)v7;
  if (v7)
  {
    memset(buffer, 0, sizeof(buffer));
    Length = CFStringGetLength(v7);
    v37 = v8;
    v40 = 0;
    v41 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v8);
    CStringPtr = 0;
    v38 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
    v34 = v8;
    v35 = v3;
    v42 = 0;
    v43 = 0;
    v39 = CStringPtr;
    if (Length < 1)
    {
      v15 = 0;
      v14 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 1;
      v17 = 64;
      do
      {
        if ((unint64_t)v13 >= 4)
          v18 = 4;
        else
          v18 = v13;
        v19 = v41;
        if (v41 <= v13)
        {
          v20 = 0;
        }
        else if (v38)
        {
          v20 = v38[v13 + v40];
        }
        else if (v39)
        {
          v20 = v39[v40 + v13];
        }
        else
        {
          v22 = v42;
          if (v43 <= v13 || v42 > v13)
          {
            v24 = -v18;
            v25 = v18 + v12;
            v26 = v17 - v18;
            v27 = v13 + v24;
            v28 = v27 + 64;
            if (v27 + 64 >= v41)
              v28 = v41;
            v42 = v27;
            v43 = v28;
            if (v41 >= v26)
              v19 = v26;
            v45.length = v19 + v25;
            v45.location = v27 + v40;
            CFStringGetCharacters(v37, v45, (UniChar *)buffer);
            v22 = v42;
          }
          v20 = *((_WORD *)buffer + v13 - v22);
        }
        v21 = objc_msgSend(v6, "characterIsMember:", v20, v34, v35);
        if (v21)
        {
          if ((v16 & 1) == 0)
          {
            *(_WORD *)&v5[2 * v15++] = 32;
            v14 = v14 & 1 | (v20 != 32);
          }
        }
        else
        {
          *(_WORD *)&v5[2 * v15++] = v20;
        }
        ++v13;
        --v12;
        ++v17;
        v16 = v21;
      }
      while (Length != v13);
    }
    v30 = v14;
    v3 = v35;
    v8 = v34;
  }
  else
  {
    v15 = 0;
    v30 = 0;
  }

  do
  {
    v31 = v15;
    if (!v15)
      break;
    --v15;
  }
  while (*(_WORD *)&v5[2 * v31 - 2] == 32);
  if ((v30 & 1) != 0 || v31 < -[__CFString length](v8, "length"))
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v5, v31);

    v8 = (__CFString *)v32;
  }
  if (v3 >= 0x200)
    free(v5);
  v29 = v8;

LABEL_48:
  return v29;
}

id _NPStripQuotationMarks(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;

  v1 = a1;
  if (!objc_msgSend(v1, "length"))
    goto LABEL_7;
  if (_NPStripQuotationMarks_onceToken != -1)
    dispatch_once(&_NPStripQuotationMarks_onceToken, &__block_literal_global_2);
  v2 = objc_msgSend(v1, "characterAtIndex:", 0);
  v3 = objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1);
  if (objc_msgSend((id)_NPStripQuotationMarks_quotationMarksCharset, "characterIsMember:", v2)
    && objc_msgSend((id)_NPStripQuotationMarks_quotationMarksCharset, "characterIsMember:", v3))
  {
    objc_msgSend(v1, "stringByTrimmingCharactersInSet:", _NPStripQuotationMarks_quotationMarksCharset);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v4 = v1;
  }
  v5 = v4;

  return v5;
}

id _NPRemoveEmojis(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  objc_msgSend(v1, "length");
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = ___NPRemoveEmojis_block_invoke;
  v21 = &unk_1EA0BC850;
  v22 = &v23;
  CEMEnumerateEmojiTokensInStringWithBlock();
  if (v24[5])
  {
    v2 = (void *)objc_msgSend(v1, "mutableCopy");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend((id)v24[5], "reverseObjectEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v29, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v15;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v15 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
          v8 = (void *)MEMORY[0x1DF09A480]();
          v9 = objc_msgSend(v7, "rangeValue");
          v11 = v10;
          if (v9 < objc_msgSend(v2, "length") - 1)
            objc_msgSend(v2, "replaceCharactersInRange:withString:", v9, v11, &stru_1EA0BC8D8);
          objc_autoreleasePoolPop(v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v29, 16);
      }
      while (v4);
    }

    v12 = (id)objc_msgSend(v2, "copy");
  }
  else
  {
    v12 = v1;
  }
  _Block_object_dispose(&v23, 8);

  return v12;
}

void sub_1DA47482C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id _NPTrimNonLetters(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _NPTrimNonLetters_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_NPTrimNonLetters_onceToken, &__block_literal_global_11);
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", _NPTrimNonLetters_nonLetterCharacterSet);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _NPTokenizeName(void *a1)
{
  id v1;
  _WORD *v2;
  void *v3;
  const __CFString *v4;
  __CFString *v5;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  UniChar v15;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  CFIndex v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CFStringRef theString;
  const UniChar *v36;
  const char *v37;
  uint64_t v38;
  CFIndex v39;
  int64_t v40;
  int64_t v41;
  CFRange v42;

  v1 = a1;
  if (!objc_msgSend(v1, "length"))
  {
    v3 = 0;
    goto LABEL_40;
  }
  v2 = malloc_type_malloc(2 * objc_msgSend(v1, "length"), 0x1000040BDFB0063uLL);
  v3 = (void *)objc_opt_new();
  v4 = (const __CFString *)v1;
  if (!v4)
    goto LABEL_38;
  v5 = (__CFString *)v4;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  Length = CFStringGetLength(v4);
  theString = v5;
  v38 = 0;
  v39 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v5);
  CStringPtr = 0;
  v36 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  v40 = 0;
  v41 = 0;
  v37 = CStringPtr;
  if (Length < 1)
  {
LABEL_37:

    goto LABEL_38;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 64;
  do
  {
    if ((unint64_t)v10 >= 4)
      v13 = 4;
    else
      v13 = v10;
    v14 = v39;
    if (v39 <= v10)
    {
      v15 = 0;
LABEL_31:
      v2[v11++] = v15;
      goto LABEL_34;
    }
    if (v36)
    {
      v15 = v36[v10 + v38];
    }
    else if (v37)
    {
      v15 = v37[v38 + v10];
    }
    else
    {
      v16 = v40;
      if (v41 <= v10 || v40 > v10)
      {
        v18 = -v13;
        v19 = v13 + v9;
        v20 = v12 - v13;
        v21 = v10 + v18;
        v22 = v21 + 64;
        if (v21 + 64 >= v39)
          v22 = v39;
        v40 = v21;
        v41 = v22;
        if (v39 >= v20)
          v14 = v20;
        v42.length = v14 + v19;
        v42.location = v21 + v38;
        CFStringGetCharacters(theString, v42, (UniChar *)&v27);
        v16 = v40;
      }
      v15 = *((_WORD *)&v27 + v10 - v16);
    }
    if (v15 == 47)
      goto LABEL_29;
    if (v15 != 44)
    {
      if (v15 != 32)
        goto LABEL_31;
LABEL_29:
      if (!v11)
        goto LABEL_34;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v2, v11);
      objc_msgSend(v3, "addObject:", v23);

      goto LABEL_33;
    }
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    v25 = (void *)objc_msgSend(v24, "initWithCharacters:length:", v2, v11, v27, v28, v29, v30, v31, v32, v33, v34);
    objc_msgSend(v3, "addObject:", v25);

    objc_msgSend(v3, "addObject:", CFSTR(","));
LABEL_33:
    v11 = 0;
LABEL_34:
    ++v10;
    --v9;
    ++v12;
  }
  while (Length != v10);

  if (v11)
  {
    v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v2, v11);
    objc_msgSend(v3, "addObject:", v5);
    goto LABEL_37;
  }
LABEL_38:
  free(v2);
LABEL_40:

  return v3;
}

id _NPRemoveParenthesisBracketsAndInside(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  _QWORD block[4];
  __CFString *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___NPRemoveParenthesisBracketsAndInside_block_invoke;
  block[3] = &unk_1EA0BC898;
  v6 = CFSTR("(\\(.*?\\)|\\[.*?\\]|<.*?>)");
  v1 = _NPRemoveParenthesisBracketsAndInside_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_NPRemoveParenthesisBracketsAndInside_onceToken, block);
  objc_msgSend((id)_NPRemoveParenthesisBracketsAndInside_regex, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_1EA0BC8D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _NPRemoveAppSignature(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  _QWORD block[4];
  __CFString *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___NPRemoveAppSignature_block_invoke;
  block[3] = &unk_1EA0BC898;
  v6 = CFSTR("via linkedin");
  v1 = _NPRemoveAppSignature_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_NPRemoveAppSignature_onceToken, block);
  objc_msgSend((id)_NPRemoveAppSignature_appSignatureRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_1EA0BC8D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1E0D15DA8]();
}

uint64_t CFBurstTrieContains()
{
  return MEMORY[0x1E0C981D0]();
}

uint64_t CFBurstTrieCreateFromFile()
{
  return MEMORY[0x1E0C981E8]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x1E0C98208]();
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

