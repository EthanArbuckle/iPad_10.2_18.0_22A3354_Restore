uint64_t CEMStringIsSingleEmoji(CFStringRef theString)
{
  uint64_t result;
  __int16 v3;
  unsigned __int8 v4;

  if (sharedEmojiData(void)::onceToken != -1)
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
  result = 0;
  if (theString)
  {
    if (sharedEmojiData(void)::data)
    {
      CEM::EmojiData::advance(sharedEmojiData(void)::data, *(_WORD **)(sharedEmojiData(void)::data + 32), 0x100000000, theString);
      return v4 & (v3 != 0);
    }
  }
  return result;
}

_WORD *CEM::EmojiData::advance(uint64_t a1, _WORD *a2, uint64_t a3, CFStringRef theString)
{
  uint64_t Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v11;
  uint64_t v12;
  CFIndex v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  UniChar v17;
  uint64_t v18;
  uint64_t v21;
  CFIndex v22;
  CFIndex v23;
  CFIndex v24;
  uint64_t v25;
  UniChar v26;
  UTF32Char v27;
  CFIndex v28;
  CFIndex v29;
  UniChar *v30;
  CFIndex v31;
  UniChar v32;
  CFIndex v33;
  UniChar v34;
  CFRange v35;
  UniChar *v37;
  CFIndex v38;
  uint64_t v39;
  uint64_t v40;
  UniChar v41[64];
  CFStringRef theStringa;
  UniChar *v43;
  const char *v44;
  CFRange range;
  uint64_t v46;
  CFIndex v47;
  CFRange v48;
  CFRange v49;
  CFRange v50;

  Length = CFStringGetLength(theString);
  theStringa = theString;
  range.location = 0;
  range.length = Length;
  CharactersPtr = CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  v43 = (UniChar *)CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  v46 = 0;
  v47 = 0;
  v44 = CStringPtr;
  if (Length < 1)
  {
    v12 = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 64;
    do
    {
      if ((unint64_t)v13 >= 4)
        v15 = 4;
      else
        v15 = v13;
      v16 = range.length;
      if (range.length <= v13)
      {
        v17 = 0;
      }
      else if (v43)
      {
        v17 = v43[v13 + range.location];
      }
      else if (v44)
      {
        v17 = v44[range.location + v13];
      }
      else
      {
        if (v47 <= v13 || v12 > v13)
        {
          v21 = v15 + v11;
          v22 = v14 - v15;
          v23 = v13 - v15;
          v24 = v23 + 64;
          if (v23 + 64 >= range.length)
            v24 = range.length;
          v46 = v23;
          v47 = v24;
          if (range.length >= v22)
            v16 = v22;
          v48.length = v16 + v21;
          v48.location = v23 + range.location;
          CFStringGetCharacters(theStringa, v48, v41);
          v12 = v46;
        }
        v17 = v41[v13 - v12];
      }
      a2 = (_WORD *)CEM::EmojiData::advance(a1, a2, a3, v17);
      a3 = v18;
      if ((v18 & 0x100000000) == 0)
        break;
      --v11;
      ++v14;
    }
    while (Length - 1 != v13++);
  }
  if (!Length)
  {
    v27 = 0;
    goto LABEL_58;
  }
  v25 = Length - 1;
  if (Length != 1)
  {
    v28 = Length - 2;
    if (Length < 2 || (v29 = range.length, range.length <= v28))
    {
      v32 = 0;
      goto LABEL_41;
    }
    v30 = v43;
    if (v43)
    {
      v31 = range.location + v28;
    }
    else
    {
      if (v44)
      {
        v32 = v44[range.location + v28];
LABEL_47:
        if (v32 >> 10 == 54)
        {
          v33 = range.length;
          if (range.length >= Length)
          {
            v37 = v43;
            if (v43)
            {
              v38 = range.location + v25;
            }
            else
            {
              if (v44)
              {
                v34 = v44[range.location + v25];
                goto LABEL_75;
              }
              if (v47 < Length || v12 >= Length)
              {
                v40 = Length - 5;
                if ((unint64_t)Length < 5)
                  v40 = 0;
                if (v40 + 64 < range.length)
                  v33 = v40 + 64;
                v46 = v40;
                v47 = v33;
                v50.location = range.location + v40;
                v50.length = v33 - v40;
                CFStringGetCharacters(theStringa, v50, v41);
                v12 = v46;
              }
              v38 = v25 - v12;
              v37 = v41;
            }
            v34 = v37[v38];
          }
          else
          {
            v34 = 0;
          }
LABEL_75:
          v27 = (v32 << 10) + v34 - 56613888;
          goto LABEL_58;
        }
LABEL_41:
        v27 = v32;
        goto LABEL_58;
      }
      if (v47 <= v28 || v12 > v28)
      {
        v39 = Length - 6;
        if ((unint64_t)v28 < 4)
          v39 = 0;
        if (v39 + 64 < range.length)
          v29 = v39 + 64;
        v46 = v39;
        v47 = v29;
        v49.location = range.location + v39;
        v49.length = v29 - v39;
        CFStringGetCharacters(theStringa, v49, v41);
        v12 = v46;
      }
      v31 = v28 - v12;
      v30 = v41;
    }
    v32 = v30[v31];
    goto LABEL_47;
  }
  if (range.length < 1)
  {
    v26 = 0;
  }
  else if (v43)
  {
    v26 = v43[range.location];
  }
  else if (v44)
  {
    v26 = v44[range.location];
  }
  else
  {
    if (v47 < 1 || v12 >= 1)
    {
      if (range.length >= 0x40uLL)
        v35.length = 64;
      else
        v35.length = range.length;
      v46 = 0;
      v47 = v35.length;
      v35.location = range.location;
      CFStringGetCharacters(theStringa, v35, v41);
      v12 = v46;
    }
    v26 = v41[-v12];
  }
  v27 = v26;
LABEL_58:
  if ((a3 & 0x10000FFFFLL) == 0x100000000 && CEM::EmojiData::isLegacyUnqualifiedEmojiCodepoint(v27))
    return (_WORD *)CEM::EmojiData::advance(a1, a2, a3, 0xFE0Fu);
  return a2;
}

uint64_t CEMGetSharedEmojiCharacterSet()
{
  if (CEMGetSharedEmojiCharacterSet::onceToken != -1)
    dispatch_once(&CEMGetSharedEmojiCharacterSet::onceToken, &__block_literal_global_42);
  return CEMGetSharedEmojiCharacterSet::characterSet;
}

double ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIcEEE8getCacheEv_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  result = 0.0;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_DWORD *)(v0 + 32) = 1065353216;
  CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getCache(void)::cache = v0;
  return result;
}

double ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileItEEE8getCacheEv_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  result = 0.0;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_DWORD *)(v0 + 32) = 1065353216;
  CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned short>>::getCache(void)::cache = v0;
  return result;
}

double ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIhEEE8getCacheEv_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  result = 0.0;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_DWORD *)(v0 + 32) = 1065353216;
  CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getCache(void)::cache = v0;
  return result;
}

void ___ZN3CEM21createFrameworkBundleEv_block_invoke()
{
  CFMutableStringRef Mutable;
  const __CFAllocator *v1;
  const __CFString *v2;
  const __CFURL *v3;

  Mutable = CFStringCreateMutable(0, 1024);
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "/", 0x8000100u);
  CFStringAppend(Mutable, v2);
  CFStringAppend(Mutable, CFSTR("/System/Library/PrivateFrameworks/CoreEmoji.framework"));
  CFRelease(v2);
  v3 = CFURLCreateWithFileSystemPath(v1, Mutable, kCFURLPOSIXPathStyle, 1u);
  CEM::createFrameworkBundle(void)::frameworkBundle = (uint64_t)CFBundleCreate(v1, v3);
  if (!CEM::createFrameworkBundle(void)::frameworkBundle)
    __assert_rtn("createFrameworkBundle_block_invoke", "CEMUtilityFunctions.cpp", 276, "frameworkBundle && \"CoreEmoji framework bundle could not be found.\"");
  if (v3)
    CFRelease(v3);
  if (Mutable)
    CFRelease(Mutable);
}

void sub_18D71F2C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

const __CFString *CEMStringContainsEmoji(CFStringRef theString)
{
  const __CFString *v1;
  CFIndex Length;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v1 = theString;
  if (theString)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2000000000;
    v8 = 0;
    Length = CFStringGetLength(theString);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 0x40000000;
    v4[2] = __CEMStringContainsEmoji_block_invoke;
    v4[3] = &unk_1E2632F58;
    v4[4] = &v5;
    CEMEnumerateEmojiTokensInStringWithBlock(v1, 0, Length, (uint64_t)v4);
    v1 = (const __CFString *)*((unsigned __int8 *)v6 + 24);
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

void sub_18D71F390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CEMEnumerateEmojiTokensInStringWithBlock(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (sharedEmojiData(void)::onceToken == -1)
  {
    if (!a1)
      return;
  }
  else
  {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
    if (!a1)
      return;
  }
  if (sharedEmojiData(void)::data)
    CEM::EmojiToken::enumerateEmojiTokensInStringWithBlock(a1, a2, a3, 0, (CEM::EmojiData *)sharedEmojiData(void)::data, a4);
}

void CEM::EmojiToken::enumerateEmojiTokensInStringWithBlock(const __CFString *a1, uint64_t a2, uint64_t a3, _QWORD *a4, CEM::EmojiData *a5, uint64_t a6)
{
  const char *CStringPtr;
  uint64_t v10;
  UniChar v11;
  _WORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  UniChar v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  UTF32Char v24;
  int64_t v25;
  uint64_t v26;
  UniChar *v27;
  UniChar v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _BOOL4 v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const void *v49;
  std::__shared_weak_count *v50;
  unint64_t *p_shared_owners;
  unint64_t v52;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  char v60;
  UniChar buffer[64];
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CFRange v69;
  CFRange v70;

  theString = a1;
  v65 = a2;
  v66 = a3;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v67 = 0;
  v68 = 0;
  v64 = CStringPtr;
  v60 = 0;
  if (a3 < 1)
    return;
  v10 = 0;
  v54 = a4;
  do
  {
    v11 = 0;
    v12 = (_WORD *)*((_QWORD *)a5 + 4);
    v13 = a3;
    if (a3 <= v10)
      v13 = v10;
    v57 = v13;
    v14 = -v10;
    v15 = v10 + 64;
    v16 = 0x100000000;
    v55 = v10;
    v17 = 0x100000000;
    v18 = *((_QWORD *)a5 + 4);
    do
    {
      v19 = (unint64_t)v10 >= 4 ? 4 : v10;
      if (v57 == v10)
        break;
      v20 = v11;
      if (v10 < 0 || (v21 = v66, v66 <= v10))
      {
        v11 = 0;
      }
      else if (CharactersPtr)
      {
        v11 = CharactersPtr[v10 + v65];
      }
      else if (v64)
      {
        v11 = v64[v65 + v10];
      }
      else
      {
        if (v68 <= v10 || (v37 = v67, v67 > v10))
        {
          v38 = v19 + v14;
          v39 = v15 - v19;
          v40 = v10 - v19;
          v41 = v40 + 64;
          if (v40 + 64 >= v66)
            v41 = v66;
          v67 = v40;
          v68 = v41;
          if (v66 >= v39)
            v21 = v39;
          v69.length = v21 + v38;
          v69.location = v40 + v65;
          CFStringGetCharacters(theString, v69, buffer);
          v37 = v67;
        }
        v11 = buffer[v10 - v37];
      }
      v22 = CEM::EmojiData::advance((uint64_t)a5, v12, v16, v11);
      if ((v23 & 0x100000000) == 0)
        break;
      v12 = (_WORD *)v22;
      v16 = v23;
      if ((CEM::EmojiData::isValidIndex(a5, (unsigned __int16)v23) & 1) != 0
        || (v11 >> 10 == 55 ? (v24 = (v20 << 10) + v11 - 56613888) : (v24 = v11),
            !CEM::EmojiData::isLegacyUnqualifiedEmojiCodepoint(v24)))
      {
LABEL_38:
        v31 = 1;
        goto LABEL_39;
      }
      v25 = v10 + 1;
      if (v10 + 1 >= a3)
        goto LABEL_35;
      if (v10 < -1 || (v26 = v66, v66 <= v25))
      {
        v28 = 0;
      }
      else
      {
        if (CharactersPtr)
        {
          v27 = (UniChar *)&CharactersPtr[v10 + v65];
LABEL_29:
          v28 = v27[1];
          goto LABEL_33;
        }
        if (!v64)
        {
          if (v68 <= v25 || (v42 = v67, v67 > v25))
          {
            if ((unint64_t)v25 >= 4)
              v43 = v10 - 3;
            else
              v43 = 0;
            if (v43 + 64 < v66)
              v26 = v43 + 64;
            v67 = v43;
            v68 = v26;
            v70.location = v65 + v43;
            v70.length = v26 - v43;
            CFStringGetCharacters(theString, v70, buffer);
            v42 = v67;
          }
          v27 = &buffer[v10 - v42];
          goto LABEL_29;
        }
        v28 = v64[v65 + 1 + v10];
      }
LABEL_33:
      v29 = v28;
      CEM::EmojiData::advance((uint64_t)a5, v12, v16, v28);
      if (v29 == 65039)
        goto LABEL_38;
      v31 = 1;
      if ((v30 & 0x100000000) == 0)
      {
LABEL_35:
        v32 = CEM::EmojiData::advance((uint64_t)a5, v12, v16, 0xFE0Fu);
        v34 = HIDWORD(v33);
        v35 = (unsigned __int16)v33 != 0;
        v36 = v33 & 0xFFFFFFFF0000FFFFLL | ((unint64_t)((v33 - 0x10000) >> 16) << 16);
        if ((v34 & v35) != 0)
        {
          v16 = v36;
          v12 = (_WORD *)v32;
        }
        v31 = v16 & 0x100000000;
      }
LABEL_39:
      if (CEM::EmojiData::isValidIndex(a5, (unsigned __int16)v16))
      {
        v18 = (int)v12;
        v17 = v16;
      }
      ++v10;
      --v14;
      ++v15;
    }
    while (v31);
    v44 = WORD1(v17);
    if (WORD1(v17))
    {
      v45 = operator new();
      v46 = v45;
      v47 = v55;
      if (v54)
        v48 = v54[3];
      else
        v48 = 0;
      CEM::EmojiToken::EmojiToken(v45, v18, v17, a5, v48);
      std::shared_ptr<CEM::EmojiToken>::shared_ptr[abi:ne180100]<CEM::EmojiToken,void>(&v58, v46);
      if (*(_QWORD *)(v58 + 8))
      {
        v49 = (const void *)CEM::EmojiToken::createWrapper(&v58, v54);
        (*(void (**)(uint64_t, const void *, uint64_t, uint64_t, char *))(a6 + 16))(a6, v49, v55, v44, &v60);
        CFRelease(v49);
        v47 = v55 + (v44 - 1);
      }
      v50 = v59;
      if (v59)
      {
        p_shared_owners = (unint64_t *)&v59->__shared_owners_;
        do
          v52 = __ldaxr(p_shared_owners);
        while (__stlxr(v52 - 1, p_shared_owners));
        if (!v52)
        {
          ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
          std::__shared_weak_count::__release_weak(v50);
        }
      }
    }
    else
    {
      v47 = v55;
    }
    v10 = v47 + 1;
  }
  while (v10 < a3 && !v60);
}

void sub_18D71F880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiData::advance(uint64_t a1, _WORD *a2, uint64_t a3, unsigned int a4)
{
  _WORD *v4;
  unsigned __int16 *v5;
  unint64_t v6;
  unsigned __int16 *v7;
  unint64_t v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  unsigned int v11;

  v4 = a2;
  if (a4)
  {
    if ((a3 & 0x100000000) != 0)
    {
      v5 = a2 + 2;
      v6 = (unsigned __int16)*a2;
      if (*a2)
      {
        v7 = &v5[2 * v6];
        do
        {
          v8 = v6 >> 1;
          v9 = &v5[2 * (v6 >> 1)];
          v11 = *v9;
          v10 = v9 + 2;
          v6 += ~(v6 >> 1);
          if (v11 < a4)
            v5 = v10;
          else
            v6 = v8;
        }
        while (v6);
        if (v5 != v7 && *v5 == a4)
          return *(_QWORD *)(a1 + 32) + 2 * (v5[1] & 0x7FFF);
      }
    }
  }
  return (uint64_t)v4;
}

{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a4;
  v5 = a1;
  if (HIWORD(a4))
  {
    v6 = CEM::EmojiData::advance(a1, a2, a3, (unsigned __int16)((a4 >> 10) - 10304));
    v8 = v7;
    a4 = v4 & 0x3FF | 0xDC00;
    a1 = v5;
    a2 = (_WORD *)v6;
    a3 = v8;
  }
  else
  {
    a4 = (unsigned __int16)a4;
  }
  return CEM::EmojiData::advance(a1, a2, a3, a4);
}

uint64_t CEM::EmojiData::isValidIndex(CEM::EmojiData *this, unsigned int a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  uint64_t result;

  v2 = *((unsigned __int16 *)this + 22);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 == 0 || !v3 || *((unsigned __int16 *)this + 21) < (unsigned __int16)v4)
    return 0;
  if (*((unsigned __int16 *)this + 20) != a2 || (result = CEM::shouldShowTaiwanFlagEmoji(this), (_DWORD)result))
  {
    if ((a2 & 0x8000) != 0)
      return 1;
    result = _os_feature_enabled_impl();
    if (a2 < 0xEF5 || (_DWORD)result)
      return 1;
  }
  return result;
}

BOOL CEM::EmojiData::isLegacyUnqualifiedEmojiCodepoint(UTF32Char theChar)
{
  if (_isLegacyUnqualifiedEmojiCodepoint::onceToken != -1)
    dispatch_once(&_isLegacyUnqualifiedEmojiCodepoint::onceToken, &__block_literal_global_6_103);
  return CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)_isLegacyUnqualifiedEmojiCodepoint::__unqualifiedCodepointsCharacterSet, theChar) != 0;
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIcEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v3;
  unsigned __int8 *v4;
  unint64_t v5;
  int8x8_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 **v11;
  unsigned __int8 *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t i;
  unint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  std::string *v37;
  __int128 v38;
  float v39;
  float v40;
  _BOOL8 v41;
  unint64_t v42;
  unint64_t v43;
  int8x8_t prime;
  std::__shared_weak_count *v45;
  std::__shared_weak_count *v46;
  __int128 v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  uint8x8_t v53;
  unint64_t v54;
  uint8x8_t v55;
  uint64_t v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *p_shared_owners;
  unint64_t v60;
  _QWORD *v61;
  unint64_t v62;
  uint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  void *v66;
  uint64_t v67[2];
  char v68;

  if (CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getCache(void)::onceToken != -1)
    dispatch_once(&CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getCache(void)::onceToken, &__block_literal_global_53);
  v3 = CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getCache(void)::cache;
  v4 = (unsigned __int8 *)a1[6];
  v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v4);
  v6 = *(int8x8_t *)(v3 + 8);
  if (v6)
  {
    v7 = v5;
    v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    v9 = v8.u32[0];
    if (v8.u32[0] > 1uLL)
    {
      v10 = v5;
      if (v5 >= *(_QWORD *)&v6)
        v10 = v5 % *(_QWORD *)&v6;
    }
    else
    {
      v10 = (*(_QWORD *)&v6 - 1) & v5;
    }
    v11 = *(unsigned __int8 ***)(*(_QWORD *)v3 + 8 * v10);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        v1 = *(_QWORD *)&v6 - 1;
        do
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v13 == v7)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100](v12 + 16, v4))
            {
              v45 = (std::__shared_weak_count *)*((_QWORD *)v12 + 6);
              if (v45)
              {
                v46 = std::__shared_weak_count::lock(v45);
                *(_QWORD *)&v47 = 0;
                *((_QWORD *)&v47 + 1) = v46;
                if (v46)
                  *(_QWORD *)&v47 = *((_QWORD *)v12 + 5);
              }
              else
              {
                v47 = 0uLL;
              }
              v57 = *(_QWORD *)(a1[5] + 8);
              v58 = *(std::__shared_weak_count **)(v57 + 48);
              *(_OWORD *)(v57 + 40) = v47;
              if (v58)
              {
                p_shared_owners = (unint64_t *)&v58->__shared_owners_;
                do
                  v60 = __ldaxr(p_shared_owners);
                while (__stlxr(v60 - 1, p_shared_owners));
                if (!v60)
                {
                  ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
                  std::__shared_weak_count::__release_weak(v58);
                }
              }
              break;
            }
          }
          else
          {
            if (v9 > 1)
            {
              if (v13 >= *(_QWORD *)&v6)
                v13 %= *(_QWORD *)&v6;
            }
            else
            {
              v13 &= v1;
            }
            if (v13 != v10)
              break;
          }
          v12 = *(unsigned __int8 **)v12;
        }
        while (v12);
      }
    }
  }
  v14 = *(_QWORD *)(a1[5] + 8);
  if (!*(_QWORD *)(v14 + 40))
  {
    v15 = (*(uint64_t (**)(void))(a1[4] + 16))();
    v16 = (_QWORD *)operator new();
    *v16 = &off_1E2632CB8;
    v16[1] = 0;
    v16[2] = 0;
    v16[3] = v15;
    *(_QWORD *)&v17 = v15;
    *((_QWORD *)&v17 + 1) = v16;
    v18 = *(std::__shared_weak_count **)(v14 + 48);
    *(_OWORD *)(v14 + 40) = v17;
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = *(_QWORD *)(a1[5] + 8);
    v22 = *(_QWORD *)(v21 + 40);
    if (v22)
    {
      v23 = *(_QWORD *)(v21 + 48);
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 16);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v26 = a1[6];
      v27 = std::__string_hash<char>::operator()[abi:ne180100](v26);
      v28 = v27;
      v29 = *(_QWORD *)(v3 + 8);
      if (v29)
      {
        v30 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
        v30.i16[0] = vaddlv_u8(v30);
        v31 = v30.u32[0];
        if (v30.u32[0] > 1uLL)
        {
          v1 = v27;
          if (v27 >= v29)
            v1 = v27 % v29;
        }
        else
        {
          v1 = (v29 - 1) & v27;
        }
        v32 = *(uint64_t **)(*(_QWORD *)v3 + 8 * v1);
        if (v32)
        {
          for (i = *v32; i; i = *(_QWORD *)i)
          {
            v34 = *(_QWORD *)(i + 8);
            if (v34 == v28)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)(i + 16), (unsigned __int8 *)v26))
              {
                goto LABEL_116;
              }
            }
            else
            {
              if (v31 > 1)
              {
                if (v34 >= v29)
                  v34 %= v29;
              }
              else
              {
                v34 &= v29 - 1;
              }
              if (v34 != v1)
                break;
            }
          }
        }
      }
      v35 = operator new(0x38uLL);
      v36 = (_QWORD *)(v3 + 16);
      v67[0] = (uint64_t)v35;
      v67[1] = v3 + 16;
      v68 = 0;
      *v35 = 0;
      v35[1] = v28;
      v37 = (std::string *)(v35 + 2);
      if (*(char *)(v26 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v37, *(const std::string::value_type **)v26, *(_QWORD *)(v26 + 8));
      }
      else
      {
        v38 = *(_OWORD *)v26;
        v35[4] = *(_QWORD *)(v26 + 16);
        *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      }
      v35[5] = 0;
      v35[6] = 0;
      v68 = 1;
      v39 = (float)(unint64_t)(*(_QWORD *)(v3 + 24) + 1);
      v40 = *(float *)(v3 + 32);
      if (v29 && (float)(v40 * (float)v29) >= v39)
      {
LABEL_106:
        v63 = *(uint64_t **)(*(_QWORD *)v3 + 8 * v1);
        i = v67[0];
        if (v63)
        {
          *(_QWORD *)v67[0] = *v63;
        }
        else
        {
          *(_QWORD *)v67[0] = *(_QWORD *)(v3 + 16);
          *(_QWORD *)(v3 + 16) = i;
          *(_QWORD *)(*(_QWORD *)v3 + 8 * v1) = v36;
          if (!*(_QWORD *)i)
            goto LABEL_115;
          v64 = *(_QWORD *)(*(_QWORD *)i + 8);
          if ((v29 & (v29 - 1)) != 0)
          {
            if (v64 >= v29)
              v64 %= v29;
          }
          else
          {
            v64 &= v29 - 1;
          }
          v63 = (uint64_t *)(*(_QWORD *)v3 + 8 * v64);
        }
        *v63 = i;
LABEL_115:
        v67[0] = 0;
        ++*(_QWORD *)(v3 + 24);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100](v67);
LABEL_116:
        v65 = *(std::__shared_weak_count **)(i + 48);
        *(_QWORD *)(i + 40) = v22;
        *(_QWORD *)(i + 48) = v23;
        if (v65)
          std::__shared_weak_count::__release_weak(v65);
        return;
      }
      v41 = 1;
      if (v29 >= 3)
        v41 = (v29 & (v29 - 1)) != 0;
      v42 = v41 | (2 * v29);
      v43 = vcvtps_u32_f32(v39 / v40);
      if (v42 <= v43)
        prime = (int8x8_t)v43;
      else
        prime = (int8x8_t)v42;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      v29 = *(_QWORD *)(v3 + 8);
      if (*(_QWORD *)&prime > v29)
        goto LABEL_66;
      if (*(_QWORD *)&prime < v29)
      {
        v54 = vcvtps_u32_f32((float)*(unint64_t *)(v3 + 24) / *(float *)(v3 + 32));
        if (v29 < 3 || (v55 = (uint8x8_t)vcnt_s8((int8x8_t)v29), v55.i16[0] = vaddlv_u8(v55), v55.u32[0] > 1uLL))
        {
          v54 = std::__next_prime(v54);
        }
        else
        {
          v56 = 1 << -(char)__clz(v54 - 1);
          if (v54 >= 2)
            v54 = v56;
        }
        if (*(_QWORD *)&prime <= v54)
          prime = (int8x8_t)v54;
        if (*(_QWORD *)&prime >= v29)
        {
          v29 = *(_QWORD *)(v3 + 8);
        }
        else
        {
          if (prime)
          {
LABEL_66:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v48 = operator new(8 * *(_QWORD *)&prime);
            v49 = *(void **)v3;
            *(_QWORD *)v3 = v48;
            if (v49)
              operator delete(v49);
            v50 = 0;
            *(int8x8_t *)(v3 + 8) = prime;
            do
              *(_QWORD *)(*(_QWORD *)v3 + 8 * v50++) = 0;
            while (*(_QWORD *)&prime != v50);
            v51 = (_QWORD *)*v36;
            if (*v36)
            {
              v52 = v51[1];
              v53 = (uint8x8_t)vcnt_s8(prime);
              v53.i16[0] = vaddlv_u8(v53);
              if (v53.u32[0] > 1uLL)
              {
                if (v52 >= *(_QWORD *)&prime)
                  v52 %= *(_QWORD *)&prime;
              }
              else
              {
                v52 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*(_QWORD *)v3 + 8 * v52) = v36;
              v61 = (_QWORD *)*v51;
              if (*v51)
              {
                do
                {
                  v62 = v61[1];
                  if (v53.u32[0] > 1uLL)
                  {
                    if (v62 >= *(_QWORD *)&prime)
                      v62 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v62 &= *(_QWORD *)&prime - 1;
                  }
                  if (v62 != v52)
                  {
                    if (!*(_QWORD *)(*(_QWORD *)v3 + 8 * v62))
                    {
                      *(_QWORD *)(*(_QWORD *)v3 + 8 * v62) = v51;
                      goto LABEL_97;
                    }
                    *v51 = *v61;
                    *v61 = **(_QWORD **)(*(_QWORD *)v3 + 8 * v62);
                    **(_QWORD **)(*(_QWORD *)v3 + 8 * v62) = v61;
                    v61 = v51;
                  }
                  v62 = v52;
LABEL_97:
                  v51 = v61;
                  v61 = (_QWORD *)*v61;
                  v52 = v62;
                }
                while (v61);
              }
            }
            v29 = (unint64_t)prime;
            goto LABEL_101;
          }
          v66 = *(void **)v3;
          *(_QWORD *)v3 = 0;
          if (v66)
            operator delete(v66);
          v29 = 0;
          *(_QWORD *)(v3 + 8) = 0;
        }
      }
LABEL_101:
      if ((v29 & (v29 - 1)) != 0)
      {
        if (v28 >= v29)
          v1 = v28 % v29;
        else
          v1 = v28;
      }
      else
      {
        v1 = (v29 - 1) & v28;
      }
      goto LABEL_106;
    }
  }
}

void sub_18D7200D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  std::__shared_weak_count *v2;
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t *)va);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3CEM12ReadOnlyFileIcE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 *v3;
  int v4;
  __int128 v5;
  unint64_t v6;
  int v7;
  void **v8;
  const char *v9;
  int v10;
  void **v11;
  const char *v12;
  int v13;
  int st_size;
  size_t v15;
  void *v16;
  void *v17;
  _QWORD *exception;
  _QWORD *v20;
  void *__p[2];
  uint64_t v22;
  stat v23;
  uint64_t v24;
  int v25;

  v2 = operator new();
  v3 = *(__int128 **)(a1 + 40);
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a1 + 48));
  v4 = *(unsigned __int8 *)(a1 + 56);
  *(_QWORD *)v2 = 0;
  *(_QWORD *)(v2 + 8) = 0;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(v2 + 16), *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
  }
  else
  {
    v5 = *v3;
    *(_QWORD *)(v2 + 32) = *((_QWORD *)v3 + 2);
    *(_OWORD *)(v2 + 16) = v5;
  }
  LOBYTE(v6) = HIBYTE(v22);
  if (SHIBYTE(v22) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(v2 + 40), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    LOBYTE(v6) = HIBYTE(v22);
  }
  else
  {
    *(_OWORD *)(v2 + 40) = *(_OWORD *)__p;
    *(_QWORD *)(v2 + 56) = v22;
  }
  *(_DWORD *)(v2 + 64) = 0;
  *(_BYTE *)(v2 + 68) = v4;
  v7 = (char)v6;
  v6 = v6;
  if ((v6 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  if (v6 == 2)
  {
    v11 = (void **)__p[0];
    if (v7 >= 0)
      v11 = __p;
    if (*(_WORD *)v11 != 11122)
      goto LABEL_35;
    *(_DWORD *)(v2 + 64) = 514;
    if (*((char *)v3 + 23) >= 0)
      v12 = (const char *)v3;
    else
      v12 = *(const char **)v3;
    v10 = open(v12, 514, 384);
  }
  else
  {
    if (v6 != 1)
      goto LABEL_35;
    v8 = (void **)__p[0];
    if (v7 >= 0)
      v8 = __p;
    if (*(_BYTE *)v8 != 114)
      goto LABEL_35;
    *(_DWORD *)(v2 + 64) = 0;
    if (*((char *)v3 + 23) >= 0)
      v9 = (const char *)v3;
    else
      v9 = *(const char **)v3;
    v10 = open(v9, 0);
  }
  v13 = v10;
  if (v10 < 0)
  {
LABEL_35:
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
    goto LABEL_39;
  }
  if (fstat(v10, &v23) < 0)
  {
LABEL_38:
    close(v13);
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
LABEL_39:
  }
  st_size = v23.st_size;
  *(_QWORD *)(v2 + 8) = v23.st_size;
  v24 = 0;
  v25 = st_size;
  fcntl(v13, 44, &v24);
  v15 = *(_QWORD *)(v2 + 8);
  if (!v4)
  {
    v17 = (void *)operator new[]();
    *(_QWORD *)v2 = v17;
    if ((read(v13, v17, *(_QWORD *)(v2 + 8)) & 0x8000000000000000) == 0)
      goto LABEL_32;
    goto LABEL_38;
  }
  if (v15)
  {
    v16 = mmap(0, v15, *(_DWORD *)(v2 + 64) & 2 | 1u, 1, v13, 0);
    if (v16 == (void *)-1)
    {
      close(v13);
      v20 = __cxa_allocate_exception(0x20uLL);
      CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(v20);
    }
    *(_QWORD *)v2 = v16;
  }
LABEL_32:
  close(v13);
  if (SHIBYTE(v22) < 0)
    operator delete(__p[0]);
  return v2;
}

void sub_18D72043C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void **v18;
  void *v19;
  void *v22;
  const std::string::value_type *v23;

  __cxa_free_exception(v19);
  if (*(char *)(v16 + 63) < 0)
    operator delete(*v18);
  if (*(char *)(v16 + 39) < 0)
    operator delete(*v17);
  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x18D7921EC](v16, 0x1012C403EBA5055);
  if (a2 == 1)
  {
    v22 = __cxa_begin_catch(a1);
    v23 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(_QWORD *)v22 + 16))(v22);
    std::string::__assign_external((std::string *)(*(_QWORD *)(*(_QWORD *)(v15 + 32) + 8) + 40), v23);
    __cxa_end_catch();
    JUMPOUT(0x18D720348);
  }
  _Unwind_Resume(a1);
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileItEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v3;
  unsigned __int8 *v4;
  unint64_t v5;
  int8x8_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 **v11;
  unsigned __int8 *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t i;
  unint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  std::string *v37;
  __int128 v38;
  float v39;
  float v40;
  _BOOL8 v41;
  unint64_t v42;
  unint64_t v43;
  int8x8_t prime;
  std::__shared_weak_count *v45;
  std::__shared_weak_count *v46;
  __int128 v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  uint8x8_t v53;
  unint64_t v54;
  uint8x8_t v55;
  uint64_t v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *p_shared_owners;
  unint64_t v60;
  _QWORD *v61;
  unint64_t v62;
  uint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  void *v66;
  uint64_t v67[2];
  char v68;

  if (CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned short>>::getCache(void)::onceToken != -1)
    dispatch_once(&CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned short>>::getCache(void)::onceToken, &__block_literal_global_14);
  v3 = CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned short>>::getCache(void)::cache;
  v4 = (unsigned __int8 *)a1[6];
  v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v4);
  v6 = *(int8x8_t *)(v3 + 8);
  if (v6)
  {
    v7 = v5;
    v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    v9 = v8.u32[0];
    if (v8.u32[0] > 1uLL)
    {
      v10 = v5;
      if (v5 >= *(_QWORD *)&v6)
        v10 = v5 % *(_QWORD *)&v6;
    }
    else
    {
      v10 = (*(_QWORD *)&v6 - 1) & v5;
    }
    v11 = *(unsigned __int8 ***)(*(_QWORD *)v3 + 8 * v10);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        v1 = *(_QWORD *)&v6 - 1;
        do
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v13 == v7)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100](v12 + 16, v4))
            {
              v45 = (std::__shared_weak_count *)*((_QWORD *)v12 + 6);
              if (v45)
              {
                v46 = std::__shared_weak_count::lock(v45);
                *(_QWORD *)&v47 = 0;
                *((_QWORD *)&v47 + 1) = v46;
                if (v46)
                  *(_QWORD *)&v47 = *((_QWORD *)v12 + 5);
              }
              else
              {
                v47 = 0uLL;
              }
              v57 = *(_QWORD *)(a1[5] + 8);
              v58 = *(std::__shared_weak_count **)(v57 + 48);
              *(_OWORD *)(v57 + 40) = v47;
              if (v58)
              {
                p_shared_owners = (unint64_t *)&v58->__shared_owners_;
                do
                  v60 = __ldaxr(p_shared_owners);
                while (__stlxr(v60 - 1, p_shared_owners));
                if (!v60)
                {
                  ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
                  std::__shared_weak_count::__release_weak(v58);
                }
              }
              break;
            }
          }
          else
          {
            if (v9 > 1)
            {
              if (v13 >= *(_QWORD *)&v6)
                v13 %= *(_QWORD *)&v6;
            }
            else
            {
              v13 &= v1;
            }
            if (v13 != v10)
              break;
          }
          v12 = *(unsigned __int8 **)v12;
        }
        while (v12);
      }
    }
  }
  v14 = *(_QWORD *)(a1[5] + 8);
  if (!*(_QWORD *)(v14 + 40))
  {
    v15 = (*(uint64_t (**)(void))(a1[4] + 16))();
    v16 = (_QWORD *)operator new();
    *v16 = &off_1E2632D28;
    v16[1] = 0;
    v16[2] = 0;
    v16[3] = v15;
    *(_QWORD *)&v17 = v15;
    *((_QWORD *)&v17 + 1) = v16;
    v18 = *(std::__shared_weak_count **)(v14 + 48);
    *(_OWORD *)(v14 + 40) = v17;
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = *(_QWORD *)(a1[5] + 8);
    v22 = *(_QWORD *)(v21 + 40);
    if (v22)
    {
      v23 = *(_QWORD *)(v21 + 48);
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 16);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v26 = a1[6];
      v27 = std::__string_hash<char>::operator()[abi:ne180100](v26);
      v28 = v27;
      v29 = *(_QWORD *)(v3 + 8);
      if (v29)
      {
        v30 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
        v30.i16[0] = vaddlv_u8(v30);
        v31 = v30.u32[0];
        if (v30.u32[0] > 1uLL)
        {
          v1 = v27;
          if (v27 >= v29)
            v1 = v27 % v29;
        }
        else
        {
          v1 = (v29 - 1) & v27;
        }
        v32 = *(uint64_t **)(*(_QWORD *)v3 + 8 * v1);
        if (v32)
        {
          for (i = *v32; i; i = *(_QWORD *)i)
          {
            v34 = *(_QWORD *)(i + 8);
            if (v34 == v28)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)(i + 16), (unsigned __int8 *)v26))
              {
                goto LABEL_116;
              }
            }
            else
            {
              if (v31 > 1)
              {
                if (v34 >= v29)
                  v34 %= v29;
              }
              else
              {
                v34 &= v29 - 1;
              }
              if (v34 != v1)
                break;
            }
          }
        }
      }
      v35 = operator new(0x38uLL);
      v36 = (_QWORD *)(v3 + 16);
      v67[0] = (uint64_t)v35;
      v67[1] = v3 + 16;
      v68 = 0;
      *v35 = 0;
      v35[1] = v28;
      v37 = (std::string *)(v35 + 2);
      if (*(char *)(v26 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v37, *(const std::string::value_type **)v26, *(_QWORD *)(v26 + 8));
      }
      else
      {
        v38 = *(_OWORD *)v26;
        v35[4] = *(_QWORD *)(v26 + 16);
        *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      }
      v35[5] = 0;
      v35[6] = 0;
      v68 = 1;
      v39 = (float)(unint64_t)(*(_QWORD *)(v3 + 24) + 1);
      v40 = *(float *)(v3 + 32);
      if (v29 && (float)(v40 * (float)v29) >= v39)
      {
LABEL_106:
        v63 = *(uint64_t **)(*(_QWORD *)v3 + 8 * v1);
        i = v67[0];
        if (v63)
        {
          *(_QWORD *)v67[0] = *v63;
        }
        else
        {
          *(_QWORD *)v67[0] = *(_QWORD *)(v3 + 16);
          *(_QWORD *)(v3 + 16) = i;
          *(_QWORD *)(*(_QWORD *)v3 + 8 * v1) = v36;
          if (!*(_QWORD *)i)
            goto LABEL_115;
          v64 = *(_QWORD *)(*(_QWORD *)i + 8);
          if ((v29 & (v29 - 1)) != 0)
          {
            if (v64 >= v29)
              v64 %= v29;
          }
          else
          {
            v64 &= v29 - 1;
          }
          v63 = (uint64_t *)(*(_QWORD *)v3 + 8 * v64);
        }
        *v63 = i;
LABEL_115:
        v67[0] = 0;
        ++*(_QWORD *)(v3 + 24);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100](v67);
LABEL_116:
        v65 = *(std::__shared_weak_count **)(i + 48);
        *(_QWORD *)(i + 40) = v22;
        *(_QWORD *)(i + 48) = v23;
        if (v65)
          std::__shared_weak_count::__release_weak(v65);
        return;
      }
      v41 = 1;
      if (v29 >= 3)
        v41 = (v29 & (v29 - 1)) != 0;
      v42 = v41 | (2 * v29);
      v43 = vcvtps_u32_f32(v39 / v40);
      if (v42 <= v43)
        prime = (int8x8_t)v43;
      else
        prime = (int8x8_t)v42;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      v29 = *(_QWORD *)(v3 + 8);
      if (*(_QWORD *)&prime > v29)
        goto LABEL_66;
      if (*(_QWORD *)&prime < v29)
      {
        v54 = vcvtps_u32_f32((float)*(unint64_t *)(v3 + 24) / *(float *)(v3 + 32));
        if (v29 < 3 || (v55 = (uint8x8_t)vcnt_s8((int8x8_t)v29), v55.i16[0] = vaddlv_u8(v55), v55.u32[0] > 1uLL))
        {
          v54 = std::__next_prime(v54);
        }
        else
        {
          v56 = 1 << -(char)__clz(v54 - 1);
          if (v54 >= 2)
            v54 = v56;
        }
        if (*(_QWORD *)&prime <= v54)
          prime = (int8x8_t)v54;
        if (*(_QWORD *)&prime >= v29)
        {
          v29 = *(_QWORD *)(v3 + 8);
        }
        else
        {
          if (prime)
          {
LABEL_66:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v48 = operator new(8 * *(_QWORD *)&prime);
            v49 = *(void **)v3;
            *(_QWORD *)v3 = v48;
            if (v49)
              operator delete(v49);
            v50 = 0;
            *(int8x8_t *)(v3 + 8) = prime;
            do
              *(_QWORD *)(*(_QWORD *)v3 + 8 * v50++) = 0;
            while (*(_QWORD *)&prime != v50);
            v51 = (_QWORD *)*v36;
            if (*v36)
            {
              v52 = v51[1];
              v53 = (uint8x8_t)vcnt_s8(prime);
              v53.i16[0] = vaddlv_u8(v53);
              if (v53.u32[0] > 1uLL)
              {
                if (v52 >= *(_QWORD *)&prime)
                  v52 %= *(_QWORD *)&prime;
              }
              else
              {
                v52 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*(_QWORD *)v3 + 8 * v52) = v36;
              v61 = (_QWORD *)*v51;
              if (*v51)
              {
                do
                {
                  v62 = v61[1];
                  if (v53.u32[0] > 1uLL)
                  {
                    if (v62 >= *(_QWORD *)&prime)
                      v62 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v62 &= *(_QWORD *)&prime - 1;
                  }
                  if (v62 != v52)
                  {
                    if (!*(_QWORD *)(*(_QWORD *)v3 + 8 * v62))
                    {
                      *(_QWORD *)(*(_QWORD *)v3 + 8 * v62) = v51;
                      goto LABEL_97;
                    }
                    *v51 = *v61;
                    *v61 = **(_QWORD **)(*(_QWORD *)v3 + 8 * v62);
                    **(_QWORD **)(*(_QWORD *)v3 + 8 * v62) = v61;
                    v61 = v51;
                  }
                  v62 = v52;
LABEL_97:
                  v51 = v61;
                  v61 = (_QWORD *)*v61;
                  v52 = v62;
                }
                while (v61);
              }
            }
            v29 = (unint64_t)prime;
            goto LABEL_101;
          }
          v66 = *(void **)v3;
          *(_QWORD *)v3 = 0;
          if (v66)
            operator delete(v66);
          v29 = 0;
          *(_QWORD *)(v3 + 8) = 0;
        }
      }
LABEL_101:
      if ((v29 & (v29 - 1)) != 0)
      {
        if (v28 >= v29)
          v1 = v28 % v29;
        else
          v1 = v28;
      }
      else
      {
        v1 = (v29 - 1) & v28;
      }
      goto LABEL_106;
    }
  }
}

void sub_18D720BA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  std::__shared_weak_count *v2;
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t *)va);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  _Unwind_Resume(a1);
}

void ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIhEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v3;
  unsigned __int8 *v4;
  unint64_t v5;
  int8x8_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 **v11;
  unsigned __int8 *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t i;
  unint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  std::string *v37;
  __int128 v38;
  float v39;
  float v40;
  _BOOL8 v41;
  unint64_t v42;
  unint64_t v43;
  int8x8_t prime;
  std::__shared_weak_count *v45;
  std::__shared_weak_count *v46;
  __int128 v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  uint8x8_t v53;
  unint64_t v54;
  uint8x8_t v55;
  uint64_t v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *p_shared_owners;
  unint64_t v60;
  _QWORD *v61;
  unint64_t v62;
  uint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  void *v66;
  uint64_t v67[2];
  char v68;

  if (CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getCache(void)::onceToken != -1)
    dispatch_once(&CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getCache(void)::onceToken, &__block_literal_global_71);
  v3 = CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getCache(void)::cache;
  v4 = (unsigned __int8 *)a1[6];
  v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v4);
  v6 = *(int8x8_t *)(v3 + 8);
  if (v6)
  {
    v7 = v5;
    v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    v9 = v8.u32[0];
    if (v8.u32[0] > 1uLL)
    {
      v10 = v5;
      if (v5 >= *(_QWORD *)&v6)
        v10 = v5 % *(_QWORD *)&v6;
    }
    else
    {
      v10 = (*(_QWORD *)&v6 - 1) & v5;
    }
    v11 = *(unsigned __int8 ***)(*(_QWORD *)v3 + 8 * v10);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        v1 = *(_QWORD *)&v6 - 1;
        do
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v13 == v7)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100](v12 + 16, v4))
            {
              v45 = (std::__shared_weak_count *)*((_QWORD *)v12 + 6);
              if (v45)
              {
                v46 = std::__shared_weak_count::lock(v45);
                *(_QWORD *)&v47 = 0;
                *((_QWORD *)&v47 + 1) = v46;
                if (v46)
                  *(_QWORD *)&v47 = *((_QWORD *)v12 + 5);
              }
              else
              {
                v47 = 0uLL;
              }
              v57 = *(_QWORD *)(a1[5] + 8);
              v58 = *(std::__shared_weak_count **)(v57 + 48);
              *(_OWORD *)(v57 + 40) = v47;
              if (v58)
              {
                p_shared_owners = (unint64_t *)&v58->__shared_owners_;
                do
                  v60 = __ldaxr(p_shared_owners);
                while (__stlxr(v60 - 1, p_shared_owners));
                if (!v60)
                {
                  ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
                  std::__shared_weak_count::__release_weak(v58);
                }
              }
              break;
            }
          }
          else
          {
            if (v9 > 1)
            {
              if (v13 >= *(_QWORD *)&v6)
                v13 %= *(_QWORD *)&v6;
            }
            else
            {
              v13 &= v1;
            }
            if (v13 != v10)
              break;
          }
          v12 = *(unsigned __int8 **)v12;
        }
        while (v12);
      }
    }
  }
  v14 = *(_QWORD *)(a1[5] + 8);
  if (!*(_QWORD *)(v14 + 40))
  {
    v15 = (*(uint64_t (**)(void))(a1[4] + 16))();
    v16 = (_QWORD *)operator new();
    *v16 = &off_1E2632CF0;
    v16[1] = 0;
    v16[2] = 0;
    v16[3] = v15;
    *(_QWORD *)&v17 = v15;
    *((_QWORD *)&v17 + 1) = v16;
    v18 = *(std::__shared_weak_count **)(v14 + 48);
    *(_OWORD *)(v14 + 40) = v17;
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = *(_QWORD *)(a1[5] + 8);
    v22 = *(_QWORD *)(v21 + 40);
    if (v22)
    {
      v23 = *(_QWORD *)(v21 + 48);
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 16);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v26 = a1[6];
      v27 = std::__string_hash<char>::operator()[abi:ne180100](v26);
      v28 = v27;
      v29 = *(_QWORD *)(v3 + 8);
      if (v29)
      {
        v30 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
        v30.i16[0] = vaddlv_u8(v30);
        v31 = v30.u32[0];
        if (v30.u32[0] > 1uLL)
        {
          v1 = v27;
          if (v27 >= v29)
            v1 = v27 % v29;
        }
        else
        {
          v1 = (v29 - 1) & v27;
        }
        v32 = *(uint64_t **)(*(_QWORD *)v3 + 8 * v1);
        if (v32)
        {
          for (i = *v32; i; i = *(_QWORD *)i)
          {
            v34 = *(_QWORD *)(i + 8);
            if (v34 == v28)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)(i + 16), (unsigned __int8 *)v26))
              {
                goto LABEL_116;
              }
            }
            else
            {
              if (v31 > 1)
              {
                if (v34 >= v29)
                  v34 %= v29;
              }
              else
              {
                v34 &= v29 - 1;
              }
              if (v34 != v1)
                break;
            }
          }
        }
      }
      v35 = operator new(0x38uLL);
      v36 = (_QWORD *)(v3 + 16);
      v67[0] = (uint64_t)v35;
      v67[1] = v3 + 16;
      v68 = 0;
      *v35 = 0;
      v35[1] = v28;
      v37 = (std::string *)(v35 + 2);
      if (*(char *)(v26 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v37, *(const std::string::value_type **)v26, *(_QWORD *)(v26 + 8));
      }
      else
      {
        v38 = *(_OWORD *)v26;
        v35[4] = *(_QWORD *)(v26 + 16);
        *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      }
      v35[5] = 0;
      v35[6] = 0;
      v68 = 1;
      v39 = (float)(unint64_t)(*(_QWORD *)(v3 + 24) + 1);
      v40 = *(float *)(v3 + 32);
      if (v29 && (float)(v40 * (float)v29) >= v39)
      {
LABEL_106:
        v63 = *(uint64_t **)(*(_QWORD *)v3 + 8 * v1);
        i = v67[0];
        if (v63)
        {
          *(_QWORD *)v67[0] = *v63;
        }
        else
        {
          *(_QWORD *)v67[0] = *(_QWORD *)(v3 + 16);
          *(_QWORD *)(v3 + 16) = i;
          *(_QWORD *)(*(_QWORD *)v3 + 8 * v1) = v36;
          if (!*(_QWORD *)i)
            goto LABEL_115;
          v64 = *(_QWORD *)(*(_QWORD *)i + 8);
          if ((v29 & (v29 - 1)) != 0)
          {
            if (v64 >= v29)
              v64 %= v29;
          }
          else
          {
            v64 &= v29 - 1;
          }
          v63 = (uint64_t *)(*(_QWORD *)v3 + 8 * v64);
        }
        *v63 = i;
LABEL_115:
        v67[0] = 0;
        ++*(_QWORD *)(v3 + 24);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100](v67);
LABEL_116:
        v65 = *(std::__shared_weak_count **)(i + 48);
        *(_QWORD *)(i + 40) = v22;
        *(_QWORD *)(i + 48) = v23;
        if (v65)
          std::__shared_weak_count::__release_weak(v65);
        return;
      }
      v41 = 1;
      if (v29 >= 3)
        v41 = (v29 & (v29 - 1)) != 0;
      v42 = v41 | (2 * v29);
      v43 = vcvtps_u32_f32(v39 / v40);
      if (v42 <= v43)
        prime = (int8x8_t)v43;
      else
        prime = (int8x8_t)v42;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      v29 = *(_QWORD *)(v3 + 8);
      if (*(_QWORD *)&prime > v29)
        goto LABEL_66;
      if (*(_QWORD *)&prime < v29)
      {
        v54 = vcvtps_u32_f32((float)*(unint64_t *)(v3 + 24) / *(float *)(v3 + 32));
        if (v29 < 3 || (v55 = (uint8x8_t)vcnt_s8((int8x8_t)v29), v55.i16[0] = vaddlv_u8(v55), v55.u32[0] > 1uLL))
        {
          v54 = std::__next_prime(v54);
        }
        else
        {
          v56 = 1 << -(char)__clz(v54 - 1);
          if (v54 >= 2)
            v54 = v56;
        }
        if (*(_QWORD *)&prime <= v54)
          prime = (int8x8_t)v54;
        if (*(_QWORD *)&prime >= v29)
        {
          v29 = *(_QWORD *)(v3 + 8);
        }
        else
        {
          if (prime)
          {
LABEL_66:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v48 = operator new(8 * *(_QWORD *)&prime);
            v49 = *(void **)v3;
            *(_QWORD *)v3 = v48;
            if (v49)
              operator delete(v49);
            v50 = 0;
            *(int8x8_t *)(v3 + 8) = prime;
            do
              *(_QWORD *)(*(_QWORD *)v3 + 8 * v50++) = 0;
            while (*(_QWORD *)&prime != v50);
            v51 = (_QWORD *)*v36;
            if (*v36)
            {
              v52 = v51[1];
              v53 = (uint8x8_t)vcnt_s8(prime);
              v53.i16[0] = vaddlv_u8(v53);
              if (v53.u32[0] > 1uLL)
              {
                if (v52 >= *(_QWORD *)&prime)
                  v52 %= *(_QWORD *)&prime;
              }
              else
              {
                v52 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*(_QWORD *)v3 + 8 * v52) = v36;
              v61 = (_QWORD *)*v51;
              if (*v51)
              {
                do
                {
                  v62 = v61[1];
                  if (v53.u32[0] > 1uLL)
                  {
                    if (v62 >= *(_QWORD *)&prime)
                      v62 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v62 &= *(_QWORD *)&prime - 1;
                  }
                  if (v62 != v52)
                  {
                    if (!*(_QWORD *)(*(_QWORD *)v3 + 8 * v62))
                    {
                      *(_QWORD *)(*(_QWORD *)v3 + 8 * v62) = v51;
                      goto LABEL_97;
                    }
                    *v51 = *v61;
                    *v61 = **(_QWORD **)(*(_QWORD *)v3 + 8 * v62);
                    **(_QWORD **)(*(_QWORD *)v3 + 8 * v62) = v61;
                    v61 = v51;
                  }
                  v62 = v52;
LABEL_97:
                  v51 = v61;
                  v61 = (_QWORD *)*v61;
                  v52 = v62;
                }
                while (v61);
              }
            }
            v29 = (unint64_t)prime;
            goto LABEL_101;
          }
          v66 = *(void **)v3;
          *(_QWORD *)v3 = 0;
          if (v66)
            operator delete(v66);
          v29 = 0;
          *(_QWORD *)(v3 + 8) = 0;
        }
      }
LABEL_101:
      if ((v29 & (v29 - 1)) != 0)
      {
        if (v28 >= v29)
          v1 = v28 % v29;
        else
          v1 = v28;
      }
      else
      {
        v1 = (v29 - 1) & v28;
      }
      goto LABEL_106;
    }
  }
}

void sub_18D721268(_Unwind_Exception *a1, uint64_t a2, ...)
{
  std::__shared_weak_count *v2;
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t *)va);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3CEM12ReadOnlyFileIhE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 *v3;
  int v4;
  __int128 v5;
  unint64_t v6;
  int v7;
  void **v8;
  const char *v9;
  int v10;
  void **v11;
  const char *v12;
  int v13;
  int st_size;
  size_t v15;
  void *v16;
  void *v17;
  _QWORD *exception;
  _QWORD *v20;
  void *__p[2];
  uint64_t v22;
  stat v23;
  uint64_t v24;
  int v25;

  v2 = operator new();
  v3 = *(__int128 **)(a1 + 40);
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a1 + 48));
  v4 = *(unsigned __int8 *)(a1 + 56);
  *(_QWORD *)v2 = 0;
  *(_QWORD *)(v2 + 8) = 0;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(v2 + 16), *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
  }
  else
  {
    v5 = *v3;
    *(_QWORD *)(v2 + 32) = *((_QWORD *)v3 + 2);
    *(_OWORD *)(v2 + 16) = v5;
  }
  LOBYTE(v6) = HIBYTE(v22);
  if (SHIBYTE(v22) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(v2 + 40), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    LOBYTE(v6) = HIBYTE(v22);
  }
  else
  {
    *(_OWORD *)(v2 + 40) = *(_OWORD *)__p;
    *(_QWORD *)(v2 + 56) = v22;
  }
  *(_DWORD *)(v2 + 64) = 0;
  *(_BYTE *)(v2 + 68) = v4;
  v7 = (char)v6;
  v6 = v6;
  if ((v6 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  if (v6 == 2)
  {
    v11 = (void **)__p[0];
    if (v7 >= 0)
      v11 = __p;
    if (*(_WORD *)v11 != 11122)
      goto LABEL_35;
    *(_DWORD *)(v2 + 64) = 514;
    if (*((char *)v3 + 23) >= 0)
      v12 = (const char *)v3;
    else
      v12 = *(const char **)v3;
    v10 = open(v12, 514, 384);
  }
  else
  {
    if (v6 != 1)
      goto LABEL_35;
    v8 = (void **)__p[0];
    if (v7 >= 0)
      v8 = __p;
    if (*(_BYTE *)v8 != 114)
      goto LABEL_35;
    *(_DWORD *)(v2 + 64) = 0;
    if (*((char *)v3 + 23) >= 0)
      v9 = (const char *)v3;
    else
      v9 = *(const char **)v3;
    v10 = open(v9, 0);
  }
  v13 = v10;
  if (v10 < 0)
  {
LABEL_35:
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
    goto LABEL_39;
  }
  if (fstat(v10, &v23) < 0)
  {
LABEL_38:
    close(v13);
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
LABEL_39:
  }
  st_size = v23.st_size;
  *(_QWORD *)(v2 + 8) = v23.st_size;
  v24 = 0;
  v25 = st_size;
  fcntl(v13, 44, &v24);
  v15 = *(_QWORD *)(v2 + 8);
  if (!v4)
  {
    v17 = (void *)operator new[]();
    *(_QWORD *)v2 = v17;
    if ((read(v13, v17, *(_QWORD *)(v2 + 8)) & 0x8000000000000000) == 0)
      goto LABEL_32;
    goto LABEL_38;
  }
  if (v15)
  {
    v16 = mmap(0, v15, *(_DWORD *)(v2 + 64) & 2 | 1u, 1, v13, 0);
    if (v16 == (void *)-1)
    {
      close(v13);
      v20 = __cxa_allocate_exception(0x20uLL);
      CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(v20);
    }
    *(_QWORD *)v2 = v16;
  }
LABEL_32:
  close(v13);
  if (SHIBYTE(v22) < 0)
    operator delete(__p[0]);
  return v2;
}

void sub_18D7215CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void **v18;
  void *v19;
  void *v22;
  const std::string::value_type *v23;

  __cxa_free_exception(v19);
  if (*(char *)(v16 + 63) < 0)
    operator delete(*v18);
  if (*(char *)(v16 + 39) < 0)
    operator delete(*v17);
  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x18D7921EC](v16, 0x1012C403EBA5055);
  if (a2 == 1)
  {
    v22 = __cxa_begin_catch(a1);
    v23 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(_QWORD *)v22 + 16))(v22);
    std::string::__assign_external((std::string *)(*(_QWORD *)(*(_QWORD *)(v15 + 32) + 8) + 40), v23);
    __cxa_end_catch();
    JUMPOUT(0x18D7214D8);
  }
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t ___ZN3CEM12ReadOnlyFileItE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 *v3;
  int v4;
  __int128 v5;
  unint64_t v6;
  int v7;
  void **v8;
  const char *v9;
  int v10;
  void **v11;
  const char *v12;
  int v13;
  int st_size;
  size_t v15;
  void *v16;
  void *v17;
  _QWORD *exception;
  _QWORD *v20;
  void *__p[2];
  uint64_t v22;
  stat v23;
  uint64_t v24;
  int v25;

  v2 = operator new();
  v3 = *(__int128 **)(a1 + 40);
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a1 + 48));
  v4 = *(unsigned __int8 *)(a1 + 56);
  *(_QWORD *)v2 = 0;
  *(_QWORD *)(v2 + 8) = 0;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(v2 + 16), *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
  }
  else
  {
    v5 = *v3;
    *(_QWORD *)(v2 + 32) = *((_QWORD *)v3 + 2);
    *(_OWORD *)(v2 + 16) = v5;
  }
  LOBYTE(v6) = HIBYTE(v22);
  if (SHIBYTE(v22) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(v2 + 40), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    LOBYTE(v6) = HIBYTE(v22);
  }
  else
  {
    *(_OWORD *)(v2 + 40) = *(_OWORD *)__p;
    *(_QWORD *)(v2 + 56) = v22;
  }
  *(_DWORD *)(v2 + 64) = 0;
  *(_BYTE *)(v2 + 68) = v4;
  v7 = (char)v6;
  v6 = v6;
  if ((v6 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  if (v6 == 2)
  {
    v11 = (void **)__p[0];
    if (v7 >= 0)
      v11 = __p;
    if (*(_WORD *)v11 != 11122)
      goto LABEL_35;
    *(_DWORD *)(v2 + 64) = 514;
    if (*((char *)v3 + 23) >= 0)
      v12 = (const char *)v3;
    else
      v12 = *(const char **)v3;
    v10 = open(v12, 514, 384);
  }
  else
  {
    if (v6 != 1)
      goto LABEL_35;
    v8 = (void **)__p[0];
    if (v7 >= 0)
      v8 = __p;
    if (*(_BYTE *)v8 != 114)
      goto LABEL_35;
    *(_DWORD *)(v2 + 64) = 0;
    if (*((char *)v3 + 23) >= 0)
      v9 = (const char *)v3;
    else
      v9 = *(const char **)v3;
    v10 = open(v9, 0);
  }
  v13 = v10;
  if (v10 < 0)
  {
LABEL_35:
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
    goto LABEL_39;
  }
  if (fstat(v10, &v23) < 0)
  {
LABEL_38:
    close(v13);
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
LABEL_39:
  }
  st_size = v23.st_size;
  *(_QWORD *)(v2 + 8) = v23.st_size;
  v24 = 0;
  v25 = st_size;
  fcntl(v13, 44, &v24);
  v15 = *(_QWORD *)(v2 + 8);
  if (!v4)
  {
    v17 = (void *)operator new[]();
    *(_QWORD *)v2 = v17;
    if ((read(v13, v17, *(_QWORD *)(v2 + 8)) & 0x8000000000000000) == 0)
      goto LABEL_32;
    goto LABEL_38;
  }
  if (v15)
  {
    v16 = mmap(0, v15, *(_DWORD *)(v2 + 64) & 2 | 1u, 1, v13, 0);
    if (v16 == (void *)-1)
    {
      close(v13);
      v20 = __cxa_allocate_exception(0x20uLL);
      CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(v20);
    }
    *(_QWORD *)v2 = v16;
  }
LABEL_32:
  close(v13);
  if (SHIBYTE(v22) < 0)
    operator delete(__p[0]);
  return v2;
}

void sub_18D721A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void **v18;
  void *v19;
  void *v22;
  const std::string::value_type *v23;

  __cxa_free_exception(v19);
  if (*(char *)(v16 + 63) < 0)
    operator delete(*v18);
  if (*(char *)(v16 + 39) < 0)
    operator delete(*v17);
  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x18D7921EC](v16, 0x1012C403EBA5055);
  if (a2 == 1)
  {
    v22 = __cxa_begin_catch(a1);
    v23 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(_QWORD *)v22 + 16))(v22);
    std::string::__assign_external((std::string *)(*(_QWORD *)(*(_QWORD *)(v15 + 32) + 8) + 40), v23);
    __cxa_end_catch();
    JUMPOUT(0x18D721974);
  }
  _Unwind_Resume(a1);
}

const __CFURL *CEMCreateEmojiCharacterSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFLocale *a5)
{
  const __CFURL *v5;
  UInt8 *v6;
  uint64_t v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  const __CFData *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD *exception;
  void *v22[2];
  char v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  _QWORD v26[7];
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  __n128 (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  void *__p;
  uint64_t v34;
  uint64_t v35;
  _QWORD block[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  __n128 (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)(uint64_t);
  uint64_t v42;
  std::__shared_weak_count *v43;

  v5 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("emoji"), CFSTR("bitmap"), 0, 0, a5);
  v6 = (UInt8 *)operator new[]();
  if (!v5)
    goto LABEL_23;
  CFURLGetFileSystemRepresentation(v5, 1u, v6, 1024);
  CFRelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v22, (char *)v6);
  v28 = 0;
  v29 = &v28;
  v30 = 0x4002000000;
  v31 = __Block_byref_object_copy__62;
  v32 = __Block_byref_object_dispose__63;
  v34 = 0;
  v35 = 0;
  __p = 0;
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 0x40000000;
  v26[2] = ___ZN3CEM12ReadOnlyFileIhE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke;
  v26[3] = &unk_1E2633070;
  v26[5] = v22;
  v26[6] = "r";
  v27 = 1;
  v26[4] = &v28;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3802000000;
  v40 = __Block_byref_object_copy__66;
  v41 = __Block_byref_object_dispose__67;
  v42 = 0;
  v43 = 0;
  if ((v8 & 1) == 0
  {
    CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getQueue(void)::attributes = (uint64_t)dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  }
  if ((v9 & 1) == 0
  {
    CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getQueue(void)::queue = (uint64_t)dispatch_queue_create("com.apple.NLPUtils.SingletonResourceManager", (dispatch_queue_attr_t)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getQueue(void)::attributes);
  }
  block[0] = v7;
  block[1] = 0x40000000;
  block[2] = ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIhEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke;
  block[3] = &unk_1E2633098;
  block[6] = v22;
  block[4] = v26;
  block[5] = &v37;
  dispatch_sync((dispatch_queue_t)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<unsigned char>>::getQueue(void)::queue, block);
  v10 = (std::__shared_weak_count *)v38[6];
  v24 = v38[5];
  v25 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  _Block_object_dispose(&v37, 8);
  v13 = v43;
  if (v43)
  {
    v14 = (unint64_t *)&v43->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (*((char *)v29 + 63) < 0)
  {
    if (!v29[6])
      goto LABEL_14;
LABEL_25:
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ResourceCreationException::ResourceCreationException(exception, (__int128 *)(v29 + 5));
  }
  if (*((_BYTE *)v29 + 63))
    goto LABEL_25;
LABEL_14:
  _Block_object_dispose(&v28, 8);
  if (SHIBYTE(v35) < 0)
    operator delete(__p);
  if (v23 < 0)
    operator delete(v22[0]);
  v16 = CFDataCreate(0, *(const UInt8 **)v24, *(_QWORD *)(v24 + 8));
  v5 = CFCharacterSetCreateWithBitmapRepresentation(0, v16);
  CFRelease(v16);
  v17 = v25;
  if (v25)
  {
    v18 = (unint64_t *)&v25->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
LABEL_23:
  MEMORY[0x18D7921C8](v6, 0x1000C8077774924);
  return v5;
}

void sub_18D721EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,__int16 buf,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  uint64_t v36;

  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Block_object_dispose(&buf, 8);
  if (a36 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      buf = 0;
      _os_log_error_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to load emoji.bitmap", (uint8_t *)&buf, 2u);
    }
    __cxa_end_catch();
    JUMPOUT(0x18D721DFCLL);
  }
  MEMORY[0x18D7921C8](v36, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned char> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned char>,CEM::ReadOnlyFile<unsigned char>>,std::allocator<CEM::ReadOnlyFile<unsigned char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    CEM::ReadOnlyFile<unsigned char>::~ReadOnlyFile(result);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

uint64_t CEM::ReadOnlyFile<unsigned char>::~ReadOnlyFile(uint64_t a1)
{
  void *v2;
  const char *v3;
  int v4;
  int v5;

  v2 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    if (*(_BYTE *)(a1 + 68))
    {
      munmap(*(void **)a1, *(_QWORD *)(a1 + 8));
    }
    else
    {
      if (*(_DWORD *)(a1 + 64) != 2)
        goto LABEL_10;
      v3 = (const char *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0)
        v3 = *(const char **)v3;
      v4 = open(v3, 2);
      v5 = v4;
      v2 = *(void **)a1;
      if ((v4 & 0x80000000) == 0)
      {
        write(v4, *(const void **)a1, *(_QWORD *)(a1 + 8));
        close(v5);
        v2 = *(void **)a1;
      }
      if (v2)
LABEL_10:
        MEMORY[0x18D7921C8](v2, 0x1000C8077774924);
    }
  }
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  return a1;
}

void ___ZL15sharedEmojiDatav_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFLocale *a5)
{
  const __CFURL *v5;
  const __CFLocale *v6;
  const __CFURL *v7;
  CEM::EmojiData *v8;

  v5 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("emoji"), CFSTR("dat"), 0, 0, a5);
  v7 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("emojimeta"), CFSTR("dat"), 0, 0, v6);
  if (v5)
  {
    v8 = (CEM::EmojiData *)operator new();
    CEM::EmojiData::EmojiData(v8, v5, v7);
  }
  if (v7)
    CFRelease(v7);
}

void sub_18D7221A0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  uint64_t v9;
  uint64_t v11;

  v11 = v9;
  MEMORY[0x18D7921EC](v11, 0x1070C408606C210);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      a9 = 0;
      _os_log_error_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to load emoji data", (uint8_t *)&a9, 2u);
    }
    __cxa_end_catch();
    JUMPOUT(0x18D722178);
  }
  _Unwind_Resume(a1);
}

CFURLRef CEM::copyResourceURLFromFrameworkBundle(CEM *this, const __CFString *a2, const __CFString *a3, __CFString *a4, const __CFLocale *a5)
{
  CEM *FrameworkBundle;
  const __CFLocale *v10;
  __CFBundle *v11;
  const __CFString *v12;
  CFURLRef v13;

  FrameworkBundle = (CEM *)CEM::createFrameworkBundle(this);
  if (!FrameworkBundle)
    return 0;
  v11 = FrameworkBundle;
  if (a4)
  {
    v12 = CEM::copyPreferredLocaleIdentifierFromFrameworkBundleWithLocale(FrameworkBundle, (__CFBundle *)a4, v10);
    if (v12)
    {
      v13 = CFBundleCopyResourceURLForLocalization(v11, (CFStringRef)this, a2, a3, v12);
      CFRelease(v12);
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = CFBundleCopyResourceURL(FrameworkBundle, (CFStringRef)this, a2, a3);
  }
  CFRelease(v11);
  return v13;
}

void sub_18D7222F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFBundle *>::reset((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t CEM::createFrameworkBundle(CEM *this)
{
  if (CEM::createFrameworkBundle(void)::onceToken != -1)
    dispatch_once(&CEM::createFrameworkBundle(void)::onceToken, &__block_literal_global_25);
  CFRetain((CFTypeRef)CEM::createFrameworkBundle(void)::frameworkBundle);
  return CEM::createFrameworkBundle(void)::frameworkBundle;
}

void CEM::EmojiData::EmojiData(CEM::EmojiData *this, const __CFURL *a2, const __CFURL *a3)
{
  void *v3;

  CEM::getFileSystemRepresentationFromCFURL((CEM *)&v3, a2);
}

void sub_18D72269C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  uint64_t v37;

  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](v37);
  _Block_object_dispose(&a24, 8);
  if (a37 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(a1);
}

void CEM::getFileSystemRepresentationFromCFURL(CEM *this, const __CFURL *a2)
{
  void *v4;

  v4 = (void *)operator new[]();
  bzero(v4, 0x400uLL);
  CFURLGetFileSystemRepresentation(a2, 1u, (UInt8 *)v4, 1024);
  std::string::basic_string[abi:ne180100]<0>(this, (char *)v4);
  JUMPOUT(0x18D7921C8);
}

void sub_18D722794(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x18D7921C8](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void CEM::ReadOnlyFile<char>::open(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  _QWORD *exception;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  _QWORD v19[7];
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __n128 (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  void *__p;
  uint64_t v27;
  uint64_t v28;
  _QWORD block[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  __n128 (*v33)(uint64_t, uint64_t);
  uint64_t (*v34)(uint64_t);
  uint64_t v35;
  std::__shared_weak_count *v36;

  v21 = 0;
  v22 = &v21;
  v23 = 0x4002000000;
  v24 = __Block_byref_object_copy__49;
  v25 = __Block_byref_object_dispose__50;
  v27 = 0;
  v28 = 0;
  __p = 0;
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 0x40000000;
  v19[2] = ___ZN3CEM12ReadOnlyFileIcE4openERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEPKcb_block_invoke;
  v19[3] = &unk_1E2633128;
  v19[5] = a2;
  v19[6] = a3;
  v20 = 1;
  v19[4] = &v21;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3802000000;
  v33 = __Block_byref_object_copy__17;
  v34 = __Block_byref_object_dispose__18;
  v35 = 0;
  v36 = 0;
  if ((v5 & 1) == 0)
  {
    v15 = a2;
    a2 = v15;
    if (v16)
    {
      CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getQueue(void)::attributes = (uint64_t)dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      a2 = v15;
    }
  }
  if ((v6 & 1) == 0)
  {
    v18 = a2;
    a2 = v18;
    if (v17)
    {
      CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getQueue(void)::queue = (uint64_t)dispatch_queue_create("com.apple.NLPUtils.SingletonResourceManager", (dispatch_queue_attr_t)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getQueue(void)::attributes);
      a2 = v18;
    }
  }
  block[0] = v4;
  block[1] = 0x40000000;
  block[2] = ___ZN3CEM24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIcEEE11getResourceERKS7_U13block_pointerFPS9_vE_block_invoke;
  block[3] = &unk_1E2633150;
  block[5] = &v30;
  block[6] = a2;
  block[4] = v19;
  dispatch_sync((dispatch_queue_t)CEM::SingletonResourceManager<std::string,CEM::ReadOnlyFile<char>>::getQueue(void)::queue, block);
  v7 = v31;
  *a1 = v31[5];
  v8 = v7[6];
  a1[1] = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  _Block_object_dispose(&v30, 8);
  v11 = v36;
  if (v36)
  {
    p_shared_owners = (unint64_t *)&v36->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if ((*((char *)v22 + 63) & 0x80000000) == 0)
  {
    if (!*((_BYTE *)v22 + 63))
      goto LABEL_13;
LABEL_17:
    exception = __cxa_allocate_exception(0x20uLL);
    CEM::ResourceCreationException::ResourceCreationException(exception, (__int128 *)(v22 + 5));
  }
  if (v22[6])
    goto LABEL_17;
LABEL_13:
  _Block_object_dispose(&v21, 8);
  if (SHIBYTE(v28) < 0)
    operator delete(__p);
}

void sub_18D722A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;

  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](v29);
  _Block_object_dispose(&a19, 8);
  if (a29 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *internal::marisa::Trie::Trie(_QWORD *this)
{
  *this = 0;
  return this;
}

internal::marisa::grimoire::trie::LoudsTrie **internal::marisa::Trie::build(internal::marisa::grimoire::trie::LoudsTrie **a1, uint64_t *a2, _QWORD *a3, unsigned int a4)
{
  internal::marisa::grimoire::trie::LoudsTrie *v8;
  internal::marisa::grimoire::trie::LoudsTrie *v9;
  internal::marisa::grimoire::trie::LoudsTrie *v10;
  _QWORD *exception;
  internal::marisa::grimoire::trie::LoudsTrie *v13;

  v8 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E0DE4E10]);
  if (!v8)
  {
    v13 = 0;
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x800000014;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:20: MARISA_"
                   "MEMORY_ERROR: temp.get() == NULL";
  }
  v9 = v8;
  internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v8);
  v13 = v9;
  internal::marisa::grimoire::trie::LoudsTrie::build(v9, a2, a3, a4);
  v10 = *a1;
  *a1 = v9;
  v13 = v10;
  return internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v13);
}

void sub_18D722B7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x18D7921E0](v1, MEMORY[0x1E0DE4E10]);
  _Unwind_Resume(a1);
}

internal::marisa::grimoire::trie::LoudsTrie **internal::marisa::Trie::map(internal::marisa::grimoire::trie::LoudsTrie **this, const void *a2, uint64_t a3)
{
  internal::marisa::grimoire::trie::LoudsTrie *v6;
  internal::marisa::grimoire::trie::LoudsTrie *v7;
  internal::marisa::grimoire::trie::LoudsTrie *v8;
  _QWORD *exception;
  _QWORD *v11;
  _BYTE v12[40];
  internal::marisa::grimoire::trie::LoudsTrie *v13;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x200000029;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:41: MARISA_"
                   "NULL_ERROR: (ptr == NULL) && (size != 0)";
  }
  v6 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E0DE4E10]);
  if (!v6)
  {
    v13 = 0;
    v11 = __cxa_allocate_exception(0x20uLL);
    *v11 = &off_1E26321F0;
    v11[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    v11[2] = 0x80000002CLL;
    v11[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:44: MARISA_MEMORY"
             "_ERROR: temp.get() == NULL";
  }
  v7 = v6;
  internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v6);
  v13 = v7;
  internal::marisa::grimoire::io::Mapper::Mapper((uint64_t)v12);
  internal::marisa::grimoire::io::Mapper::open((internal::marisa::grimoire::io::Mapper *)v12, a2, a3);
  internal::marisa::grimoire::trie::LoudsTrie::map(v13, (internal::marisa::grimoire::io::Mapper *)v12);
  v8 = *this;
  *this = v13;
  v13 = v8;
  internal::marisa::grimoire::io::Mapper::~Mapper((internal::marisa::grimoire::io::Mapper *)v12);
  return internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v13);
}

void sub_18D722CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((internal::marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

void internal::marisa::Trie::write(internal::marisa::grimoire::trie::LoudsTrie ***a1, uint64_t a2)
{
  _QWORD *exception;
  FILE *v5[4];

  if (!*a1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000064;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:100: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::io::Writer::Writer((uint64_t)v5);
  internal::marisa::grimoire::io::Writer::open((uint64_t)v5, a2);
  internal::marisa::grimoire::trie::LoudsTrie::write(*a1, (internal::marisa::grimoire::io::Writer *)v5);
  internal::marisa::grimoire::io::Writer::~Writer(v5);
}

void sub_18D722DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, FILE *a9)
{
  internal::marisa::grimoire::io::Writer::~Writer(&a9);
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::Trie::get_payload(uint64_t *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *exception;

  v3 = *a1;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x10000006DLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:109: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  return internal::marisa::grimoire::trie::LoudsTrie::get_payload(v3, a2, a3);
}

uint64_t internal::marisa::Trie::lookup(internal::marisa::grimoire::vector::BitVector **a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  internal::marisa::grimoire::vector::BitVector *v4;
  _QWORD *exception;

  v4 = *a1;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000073;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:115: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  return internal::marisa::grimoire::trie::LoudsTrie::lookup(v4, a2, a3, a4);
}

uint64_t internal::marisa::Trie::common_prefix_search(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *exception;

  v4 = *a1;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x10000007FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:127: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  return internal::marisa::grimoire::trie::LoudsTrie::common_prefix_search(v4, a2, a3, a4);
}

void internal::marisa::Trie::predictive_search(internal::marisa::grimoire::vector::BitVector **a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  internal::marisa::grimoire::vector::BitVector *v5;
  _QWORD *exception;

  v5 = *a1;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000086;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:134: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::trie::LoudsTrie::predictive_search(v5, a2, a3, a4, a5);
}

void internal::marisa::Trie::advance(internal::marisa::grimoire::vector::BitVector **a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  internal::marisa::grimoire::vector::BitVector *v5;
  _QWORD *exception;

  v5 = *a1;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x10000008CLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:140: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::trie::LoudsTrie::advance(v5, a2, a3, a4, a5);
}

void internal::marisa::Trie::enumerate_entries(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  _QWORD *exception;

  v4 = *a1;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000093;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:147: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries(v4, a2, a3, a4);
}

void internal::marisa::Trie::enumerate_children(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *exception;

  v3 = *a1;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000099;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/trie.cc:153: MARISA"
                   "_STATE_ERROR: trie_.get() == NULL";
  }
  internal::marisa::grimoire::trie::LoudsTrie::enumerate_children(v3, a2, a3);
}

void internal::marisa::Exception::~Exception(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t internal::marisa::Exception::what(internal::marisa::Exception *this)
{
  return *((_QWORD *)this + 3);
}

internal::marisa::grimoire::trie::LoudsTrie **internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(internal::marisa::grimoire::trie::LoudsTrie **a1)
{
  internal::marisa::grimoire::trie::LoudsTrie *v2;

  v2 = *a1;
  if (v2)
  {
    internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie(v2);
    MEMORY[0x18D7921EC]();
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t internal::marisa::grimoire::io::Writer::Writer(uint64_t this)
{
  *(_QWORD *)this = 0;
  *(_DWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

void internal::marisa::grimoire::io::Writer::~Writer(FILE **this)
{
  if (*((_BYTE *)this + 24))
    fclose(*this);
}

FILE *internal::marisa::grimoire::io::Writer::open(uint64_t a1, uint64_t a2)
{
  FILE *result;
  int v4;

  result = *(FILE **)a1;
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  *(_QWORD *)(a1 + 16) = a2;
  v4 = *(unsigned __int8 *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = 0;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

uint64_t internal::marisa::grimoire::io::Writer::seek(uint64_t this, size_t __nitems)
{
  size_t v2;
  uint64_t v3;
  size_t v4;
  _QWORD *exception;
  _QWORD __buf[129];

  v2 = __nitems;
  v3 = this;
  __buf[128] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)this && *(_DWORD *)(this + 8) == -1 && !*(_QWORD *)(this + 16))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x10000004FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer."
                   "cc:79: MARISA_STATE_ERROR: !is_open()";
  }
  if (__nitems)
  {
    if (__nitems > 0x10)
    {
      bzero(__buf, 0x400uLL);
      do
      {
        if (v2 >= 0x400)
          v4 = 1024;
        else
          v4 = v2;
        this = internal::marisa::grimoire::io::Writer::write_data(v3, (char *)__buf, v4);
        v2 -= v4;
      }
      while (v2);
    }
    else
    {
      __buf[0] = 0;
      __buf[1] = 0;
      return internal::marisa::grimoire::io::Writer::write_data(this, (char *)__buf, __nitems);
    }
  }
  return this;
}

uint64_t internal::marisa::grimoire::io::Writer::write_data(uint64_t this, char *__buf, size_t __nitems)
{
  size_t v3;
  char *v4;
  uint64_t v5;
  FILE *v6;
  size_t v7;
  _QWORD *exception;
  const char *v9;
  _QWORD *v10;

  v3 = __nitems;
  v4 = __buf;
  v5 = this;
  v6 = *(FILE **)this;
  if (!*(_QWORD *)this && *(_DWORD *)(this + 8) == -1 && !*(_QWORD *)(this + 16))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x100000076;
    v9 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc:118: MA"
         "RISA_STATE_ERROR: !is_open()";
    goto LABEL_20;
  }
  if (__nitems)
  {
    if (*(_DWORD *)(this + 8) != -1)
    {
      while (1)
      {
        v7 = v3 >= 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v3;
        this = write(*(_DWORD *)(v5 + 8), v4, v7);
        if (this <= 0)
          break;
        v4 += this;
        v3 -= this;
        if (!v3)
          return this;
      }
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_1E26321F0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
      exception[2] = 0x900000084;
      v9 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc:132: "
           "MARISA_IO_ERROR: size_written <= 0";
LABEL_20:
      exception[3] = v9;
    }
    if (v6)
    {
      if (fwrite(__buf, 1uLL, __nitems, v6) != __nitems)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *exception = &off_1E26321F0;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
        exception[2] = 0x900000089;
        v9 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc:137"
             ": MARISA_IO_ERROR: ::fwrite(data, 1, size, file_) != size";
        goto LABEL_20;
      }
      this = fflush(*(FILE **)v5);
      if ((_DWORD)this)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *exception = &off_1E26321F0;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
        exception[2] = 0x90000008ALL;
        v9 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc:138"
             ": MARISA_IO_ERROR: ::fflush(file_) != 0";
        goto LABEL_20;
      }
    }
    else
    {
      this = *(_QWORD *)(this + 16);
      if (this)
      {
        this = std::ostream::write();
        if ((*(_BYTE *)(this + *(_QWORD *)(*(_QWORD *)this - 24) + 32) & 5) != 0)
        {
          v10 = __cxa_allocate_exception(0x20uLL);
          *v10 = &off_1E26321F0;
          v10[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.cc";
          v10[2] = 0x90000008FLL;
          v10[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer."
                   "cc:143: MARISA_IO_ERROR: !stream_->write(static_cast<const char*>(data), static_cast<std::streamsize>(size))";
        }
      }
    }
  }
  return this;
}

void sub_18D723494()
{
  __break(1u);
}

void sub_18D7234F8()
{
  __cxa_end_catch();
  JUMPOUT(0x18D723500);
}

uint64_t internal::marisa::grimoire::io::Mapper::Mapper(uint64_t this)
{
  *(_QWORD *)this = 0;
  *(_QWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_DWORD *)(this + 32) = -1;
  return this;
}

void internal::marisa::grimoire::io::Mapper::~Mapper(internal::marisa::grimoire::io::Mapper *this)
{
  void *v2;
  int v3;

  v2 = (void *)*((_QWORD *)this + 1);
  if (v2 != (void *)-1)
    munmap(v2, *((_QWORD *)this + 3));
  v3 = *((_DWORD *)this + 8);
  if (v3 != -1)
    close(v3);
}

uint64_t *internal::marisa::grimoire::io::Mapper::swap(uint64_t *this, internal::marisa::grimoire::io::Mapper *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *this;
  *this = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  v4 = this[1];
  v3 = this[2];
  v5 = *((_QWORD *)a2 + 2);
  this[1] = *((_QWORD *)a2 + 1);
  this[2] = v5;
  *((_QWORD *)a2 + 1) = v4;
  *((_QWORD *)a2 + 2) = v3;
  v6 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  LODWORD(v6) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v6;
  return this;
}

__n128 internal::marisa::grimoire::io::Mapper::open(internal::marisa::grimoire::io::Mapper *this, const void *a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  int v5;
  __n128 result;
  _QWORD *exception;
  _OWORD v8[2];
  int v9;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x200000050;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper."
                   "cc:80: MARISA_NULL_ERROR: (ptr == NULL) && (size != 0)";
  }
  v3 = *(_OWORD *)this;
  v4 = *((_OWORD *)this + 1);
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = -1;
  *((_QWORD *)this + 2) = a3;
  *((_QWORD *)this + 3) = 0;
  v8[0] = v3;
  v8[1] = v4;
  v5 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = -1;
  v9 = v5;
  internal::marisa::grimoire::io::Mapper::~Mapper((internal::marisa::grimoire::io::Mapper *)v8);
  return result;
}

uint64_t internal::marisa::grimoire::io::Mapper::seek(internal::marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  _QWORD *exception;
  const char *v4;

  if (!*(_QWORD *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000059;
    v4 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc:89: MAR"
         "ISA_STATE_ERROR: !is_open()";
    goto LABEL_6;
  }
  if (*((_QWORD *)this + 2) < a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x90000005ALL;
    v4 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc:90: MAR"
         "ISA_IO_ERROR: size > avail_";
LABEL_6:
    exception[3] = v4;
  }
  return internal::marisa::grimoire::io::Mapper::map_data(this, a2);
}

uint64_t internal::marisa::grimoire::io::Mapper::map_data(internal::marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  _QWORD *exception;
  const char *v8;

  v2 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000073;
    v8 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc:115: MA"
         "RISA_STATE_ERROR: !is_open()";
LABEL_6:
    exception[3] = v8;
  }
  v3 = *((_QWORD *)this + 2);
  v4 = v3 >= a2;
  v5 = v3 - a2;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000074;
    v8 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.cc:116: MA"
         "RISA_IO_ERROR: size > avail_";
    goto LABEL_6;
  }
  *(_QWORD *)this = v2 + a2;
  *((_QWORD *)this + 2) = v5;
  return v2;
}

internal::marisa::grimoire::trie::LoudsTrie *internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(internal::marisa::grimoire::trie::LoudsTrie *this)
{
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 89) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *(_OWORD *)((char *)this + 345) = 0u;
  *(_OWORD *)((char *)this + 393) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 297) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *(_OWORD *)((char *)this + 441) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *(_OWORD *)((char *)this + 553) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
  *(_OWORD *)((char *)this + 601) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 37) = 0u;
  *(_OWORD *)((char *)this + 505) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *(_OWORD *)((char *)this + 649) = 0u;
  *((_OWORD *)this + 39) = 0u;
  *((_OWORD *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 697) = 0u;
  *((_OWORD *)this + 42) = 0u;
  *((_OWORD *)this + 43) = 0u;
  *((_QWORD *)this + 90) = 0;
  *((_DWORD *)this + 182) = 0;
  *((_QWORD *)this + 92) = 0;
  internal::marisa::grimoire::trie::Tail::Tail((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 744));
  *((_BYTE *)this + 1048) = 0;
  *(_OWORD *)((char *)this + 1016) = 0u;
  *(_OWORD *)((char *)this + 1032) = 0u;
  *(_OWORD *)((char *)this + 1000) = 0u;
  *((_OWORD *)this + 66) = 0u;
  *((_QWORD *)this + 134) = 3;
  *((_QWORD *)this + 135) = 0x100000000200;
  *((_DWORD *)this + 272) = 0x20000;
  internal::marisa::grimoire::io::Mapper::Mapper((uint64_t)this + 1096);
  return this;
}

void sub_18D7238B8(_Unwind_Exception *a1)
{
  internal::marisa::grimoire::vector::BitVector *v1;
  internal::marisa::grimoire::vector::BitVector *v2;
  internal::marisa::grimoire::vector::BitVector *v3;
  internal::marisa::grimoire::trie::Tail *v4;
  internal::marisa::grimoire::trie::LoudsTrie **v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v9;

  v9 = *((_QWORD *)v1 + 126);
  if (v9)
    MEMORY[0x18D7921C8](v9, 0x1000C8077774924);
  internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(v5);
  internal::marisa::grimoire::trie::Tail::~Tail(v4);
  if (*v7)
    MEMORY[0x18D7921C8](*v7, 0x1000C8077774924);
  if (*v6)
    MEMORY[0x18D7921C8](*v6, 0x1000C8077774924);
  internal::marisa::grimoire::vector::BitVector::~BitVector(v3);
  internal::marisa::grimoire::vector::BitVector::~BitVector(v2);
  internal::marisa::grimoire::vector::BitVector::~BitVector(v1);
  _Unwind_Resume(a1);
}

void internal::marisa::grimoire::trie::Tail::~Tail(internal::marisa::grimoire::trie::Tail *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *((_QWORD *)this + 26);
  if (v2)
    MEMORY[0x18D7921C8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 20);
  if (v3)
    MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 14);
  if (v4)
    MEMORY[0x18D7921C8](v4, 0x1000C8077774924);
  v5 = *((_QWORD *)this + 6);
  if (v5)
    MEMORY[0x18D7921C8](v5, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x18D7921C8](*(_QWORD *)this, 0x1000C8077774924);
}

void internal::marisa::grimoire::vector::BitVector::~BitVector(internal::marisa::grimoire::vector::BitVector *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 20);
  if (v2)
    MEMORY[0x18D7921C8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 14);
  if (v3)
    MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 8);
  if (v4)
    MEMORY[0x18D7921C8](v4, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x18D7921C8](*(_QWORD *)this, 0x1000C8077774924);
}

void internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie(internal::marisa::grimoire::trie::LoudsTrie *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  internal::marisa::grimoire::io::Mapper::~Mapper((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 1096));
  v2 = *((_QWORD *)this + 126);
  if (v2)
    MEMORY[0x18D7921C8](v2, 0x1000C8077774924);
  internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((internal::marisa::grimoire::trie::LoudsTrie **)this + 125);
  v3 = *((_QWORD *)this + 119);
  if (v3)
    MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 113);
  if (v4)
    MEMORY[0x18D7921C8](v4, 0x1000C8077774924);
  v5 = *((_QWORD *)this + 107);
  if (v5)
    MEMORY[0x18D7921C8](v5, 0x1000C8077774924);
  v6 = *((_QWORD *)this + 99);
  if (v6)
    MEMORY[0x18D7921C8](v6, 0x1000C8077774924);
  v7 = *((_QWORD *)this + 93);
  if (v7)
    MEMORY[0x18D7921C8](v7, 0x1000C8077774924);
  v8 = *((_QWORD *)this + 84);
  if (v8)
    MEMORY[0x18D7921C8](v8, 0x1000C8077774924);
  v9 = *((_QWORD *)this + 78);
  if (v9)
    MEMORY[0x18D7921C8](v9, 0x1000C8077774924);
  v10 = *((_QWORD *)this + 72);
  if (v10)
    MEMORY[0x18D7921C8](v10, 0x1000C8077774924);
  v11 = *((_QWORD *)this + 66);
  if (v11)
    MEMORY[0x18D7921C8](v11, 0x1000C8077774924);
  v12 = *((_QWORD *)this + 60);
  if (v12)
    MEMORY[0x18D7921C8](v12, 0x1000C8077774924);
  v13 = *((_QWORD *)this + 52);
  if (v13)
    MEMORY[0x18D7921C8](v13, 0x1000C8077774924);
  v14 = *((_QWORD *)this + 46);
  if (v14)
    MEMORY[0x18D7921C8](v14, 0x1000C8077774924);
  v15 = *((_QWORD *)this + 40);
  if (v15)
    MEMORY[0x18D7921C8](v15, 0x1000C8077774924);
  v16 = *((_QWORD *)this + 34);
  if (v16)
    MEMORY[0x18D7921C8](v16, 0x1000C8077774924);
  v17 = *((_QWORD *)this + 26);
  if (v17)
    MEMORY[0x18D7921C8](v17, 0x1000C8077774924);
  v18 = *((_QWORD *)this + 20);
  if (v18)
    MEMORY[0x18D7921C8](v18, 0x1000C8077774924);
  v19 = *((_QWORD *)this + 14);
  if (v19)
    MEMORY[0x18D7921C8](v19, 0x1000C8077774924);
  v20 = *((_QWORD *)this + 8);
  if (v20)
    MEMORY[0x18D7921C8](v20, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x18D7921C8](*(_QWORD *)this, 0x1000C8077774924);
}

void internal::marisa::grimoire::trie::LoudsTrie::build(internal::marisa::grimoire::trie::LoudsTrie *a1, uint64_t *a2, _QWORD *a3, unsigned int a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD v10[2];
  int v11;

  v7 = 3;
  v8 = 0x100000000200;
  v9 = 0x20000;
  internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v7, a4);
  v10[0] = v7;
  v10[1] = v8;
  v11 = v9;
  internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)&v7);
  internal::marisa::grimoire::trie::LoudsTrie::build_((uint64_t)&v7, a2, a3, (uint64_t)v10);
  internal::marisa::grimoire::trie::LoudsTrie::swap(a1, (internal::marisa::grimoire::trie::LoudsTrie *)&v7);
  internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)&v7);
}

void sub_18D723D90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)va);
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_(uint64_t a1, uint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t i;
  unint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  _OWORD v33[3];
  __int128 v34;
  unint64_t v35[4];
  _OWORD v36[3];
  char v37;

  memset(v36, 0, 41);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::resize((uint64_t *)v36, (a2[1] - *a2) >> 4);
  v8 = *a2;
  if (a2[1] != *a2)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = *((_QWORD *)&v36[0] + 1) + v10;
      v13 = (uint64_t *)(v8 + v9);
      v15 = *v13;
      v14 = v13[1];
      *(_QWORD *)v12 = v15;
      *(_DWORD *)(v12 + 8) = v14;
      *(_DWORD *)(v12 + 12) = 1065353216;
      ++v11;
      v8 = *a2;
      v10 += 24;
      v9 += 16;
    }
    while (v11 < (a2[1] - *a2) >> 4);
  }
  v34 = 0u;
  memset(v35, 0, 25);
  internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::Key>(a1, (uint64_t *)v36, &v34, a4, 1);
  memset(v33, 0, 41);
  internal::marisa::grimoire::vector::Vector<std::pair<unsigned int,unsigned int>>::resize((uint64_t *)v33, v35[1]);
  v16 = *((_QWORD *)&v33[1] + 1);
  if (*((_QWORD *)&v33[1] + 1))
  {
    v17 = 0;
    v18 = *((_QWORD *)&v34 + 1);
    v19 = (_DWORD *)(*((_QWORD *)&v33[0] + 1) + 4);
    do
    {
      *(v19 - 1) = *(_DWORD *)(v18 + 4 * v17);
      *v19 = v17++;
      v19 += 2;
    }
    while (v16 != v17);
  }
  v20 = v34;
  v34 = 0u;
  memset(v35, 0, 25);
  if (v20)
  {
    MEMORY[0x18D7921C8](v20, 0x1000C8077774924);
    v16 = *((_QWORD *)&v33[1] + 1);
  }
  v21 = 126 - 2 * __clz(v16);
  if (v16)
    v22 = v21;
  else
    v22 = 0;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(*((uint64_t *)&v33[0] + 1), (unsigned int *)(*((_QWORD *)&v33[0] + 1) + 8 * v16), (uint64_t)&v37, v22, 1);
  if (*((_QWORD *)&v33[1] + 1))
  {
    v23 = 0;
    v24 = 0;
    do
    {
      for (i = *((_QWORD *)&v33[0] + 1); ; i = *((_QWORD *)&v33[0] + 1))
      {
        v26 = *(unsigned int *)(i + 8 * v23);
        if (v24 >= v26)
          break;
        internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 208), 0);
        ++v24;
      }
      if (v24 == v26)
      {
        internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 208), 1);
        ++v24;
      }
      ++v23;
    }
    while (v23 < *((_QWORD *)&v33[1] + 1));
  }
  else
  {
    v24 = 0;
  }
  for (; v24 < *(_QWORD *)(a1 + 648); ++v24)
    internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 208), 0);
  v27 = (uint64_t *)(a1 + 208);
  internal::marisa::grimoire::vector::BitVector::push_back(v27, 0);
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)v27, 0, 1);
  if (a3)
  {
    std::vector<unsigned long>::resize((uint64_t)a3, (a2[1] - *a2) >> 4);
    if (a2[1] != *a2)
    {
      v28 = 0;
      v29 = 0;
      v30 = *((_QWORD *)&v33[0] + 1);
      do
      {
        v31 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)v27, *(unsigned int *)(v30 + v28));
        v30 = *((_QWORD *)&v33[0] + 1);
        *(_QWORD *)(*a3 + 8 * *(unsigned int *)(*((_QWORD *)&v33[0] + 1) + v28 + 4)) = v31;
        ++v29;
        v28 += 8;
      }
      while (v29 < (a2[1] - *a2) >> 4);
    }
  }
  if (*(_QWORD *)&v33[0])
    MEMORY[0x18D7921C8](*(_QWORD *)&v33[0], 0x1000C8077774924);
  if ((_QWORD)v34)
    MEMORY[0x18D7921C8](v34, 0x1000C8077774924);
  result = *(_QWORD *)&v36[0];
  if (*(_QWORD *)&v36[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v36[0], 0x1000C8077774924);
  return result;
}

void sub_18D724094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  if (a15)
    MEMORY[0x18D7921C8](a15, 0x1000C8077774924);
  if (a21)
    MEMORY[0x18D7921C8](a21, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t *internal::marisa::grimoire::trie::LoudsTrie::swap(internal::marisa::grimoire::trie::LoudsTrie *this, internal::marisa::grimoire::trie::LoudsTrie *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  internal::marisa::grimoire::vector::BitVector::swap(this, a2);
  internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), (internal::marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 208));
  internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), (internal::marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 416));
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 78, (uint64_t *)a2 + 78);
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 84, (uint64_t *)a2 + 84);
  v4 = *((_QWORD *)this + 90);
  *((_QWORD *)this + 90) = *((_QWORD *)a2 + 90);
  *((_QWORD *)a2 + 90) = v4;
  LODWORD(v4) = *((_DWORD *)this + 182);
  *((_DWORD *)this + 182) = *((_DWORD *)a2 + 182);
  *((_DWORD *)a2 + 182) = v4;
  v5 = *((_QWORD *)this + 92);
  *((_QWORD *)this + 92) = *((_QWORD *)a2 + 92);
  *((_QWORD *)a2 + 92) = v5;
  internal::marisa::grimoire::trie::Tail::swap((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), (internal::marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 744));
  v6 = *((_QWORD *)this + 125);
  *((_QWORD *)this + 125) = *((_QWORD *)a2 + 125);
  *((_QWORD *)a2 + 125) = v6;
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 126, (uint64_t *)a2 + 126);
  v7 = *((_QWORD *)this + 132);
  *((_QWORD *)this + 132) = *((_QWORD *)a2 + 132);
  *((_QWORD *)a2 + 132) = v7;
  v8 = *((_QWORD *)this + 133);
  *((_QWORD *)this + 133) = *((_QWORD *)a2 + 133);
  *((_QWORD *)a2 + 133) = v8;
  v9 = *((_QWORD *)this + 134);
  *((_QWORD *)this + 134) = *((_QWORD *)a2 + 134);
  *((_QWORD *)a2 + 134) = v9;
  v10 = *((_QWORD *)this + 135);
  *((_QWORD *)this + 135) = *((_QWORD *)a2 + 135);
  *((_QWORD *)a2 + 135) = v10;
  LODWORD(v9) = *((_DWORD *)this + 272);
  *((_DWORD *)this + 272) = *((_DWORD *)a2 + 272);
  *((_DWORD *)a2 + 272) = v9;
  return internal::marisa::grimoire::io::Mapper::swap((uint64_t *)this + 137, (internal::marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 1096));
}

void internal::marisa::grimoire::trie::LoudsTrie::map(internal::marisa::grimoire::trie::LoudsTrie *this, internal::marisa::grimoire::io::Mapper *a2)
{
  _BYTE v4[1096];
  uint64_t v5[5];

  internal::marisa::grimoire::trie::Header::map((internal::marisa::grimoire::trie::Header *)v4, a2);
  internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)v4);
  internal::marisa::grimoire::trie::LoudsTrie::map_((internal::marisa::grimoire::trie::LoudsTrie *)v4, a2);
  internal::marisa::grimoire::io::Mapper::swap(v5, a2);
  internal::marisa::grimoire::trie::LoudsTrie::swap(this, (internal::marisa::grimoire::trie::LoudsTrie *)v4);
  internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)v4);
}

void sub_18D72428C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  internal::marisa::grimoire::trie::LoudsTrie::~LoudsTrie((internal::marisa::grimoire::trie::LoudsTrie *)&a9);
  _Unwind_Resume(a1);
}

_BYTE *internal::marisa::grimoire::trie::Header::map(internal::marisa::grimoire::trie::Header *this, internal::marisa::grimoire::io::Mapper *a2)
{
  _BYTE *result;
  uint64_t v3;
  int v4;
  int v5;
  _QWORD *exception;

  result = (_BYTE *)internal::marisa::grimoire::io::Mapper::map_data(a2, 0x10uLL);
  if (*result != 87)
    goto LABEL_7;
  v3 = 1u;
  do
  {
    if (v3 == 16)
      return result;
    v4 = result[v3];
    v5 = internal::marisa::grimoire::trie::Header::get_header(void)::buf[v3++];
  }
  while (v4 == v5);
  if ((unint64_t)(v3 - 2) <= 0xE)
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/header.h";
    exception[2] = 0xA00000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/heade"
                   "r.h:21: MARISA_FORMAT_ERROR: !test_header(ptr)";
  }
  return result;
}

double internal::marisa::grimoire::trie::LoudsTrie::map_(internal::marisa::grimoire::trie::LoudsTrie *this, internal::marisa::grimoire::io::Mapper *a2)
{
  internal::marisa::grimoire::trie::LoudsTrie *v4;
  internal::marisa::grimoire::trie::LoudsTrie *v5;
  internal::marisa::grimoire::trie::LoudsTrie *v6;
  unsigned int v7;
  double result;
  _QWORD *exception;
  uint64_t v10;
  double v11;
  int v12;

  internal::marisa::grimoire::vector::BitVector::map(this, a2);
  internal::marisa::grimoire::vector::BitVector::map((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), a2);
  internal::marisa::grimoire::vector::BitVector::map((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), a2);
  internal::marisa::grimoire::vector::Vector<unsigned char>::map((__int128 *)this + 39, a2);
  internal::marisa::grimoire::vector::FlatVector::map((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 672), a2);
  internal::marisa::grimoire::trie::Tail::map((internal::marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2);
  if (*((_QWORD *)this + 59) && !*((_QWORD *)this + 96))
  {
    v4 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E0DE4E10]);
    v5 = v4;
    if (v4)
      internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
    v10 = *((_QWORD *)this + 125);
    *((_QWORD *)this + 125) = v5;
    internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((internal::marisa::grimoire::trie::LoudsTrie **)&v10);
    v6 = (internal::marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
    if (!v6)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_1E26321F0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x800000249;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/lou"
                     "ds-trie.cc:585: MARISA_MEMORY_ERROR: next_trie_.get() == NULL";
    }
    internal::marisa::grimoire::trie::LoudsTrie::map_(v6, a2);
  }
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::map((__int128 *)this + 63, a2);
  *((_QWORD *)this + 132) = *((_QWORD *)this + 129) - 1;
  *((_QWORD *)this + 133) = *(unsigned int *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v7 = *(_DWORD *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v10 = 3;
  *(_QWORD *)&v11 = 0x100000000200;
  v12 = 0x20000;
  internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v10, v7);
  *((_QWORD *)this + 134) = v10;
  result = v11;
  *((double *)this + 135) = v11;
  *((_DWORD *)this + 272) = v12;
  return result;
}

void sub_18D7244C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x18D7921E0](v1, MEMORY[0x1E0DE4E10]);
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::write(internal::marisa::grimoire::trie::LoudsTrie **this, internal::marisa::grimoire::io::Writer *a2)
{
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, "We love Marisa.", 0x10uLL);
  return internal::marisa::grimoire::trie::LoudsTrie::write_(this, a2);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::write_(internal::marisa::grimoire::trie::LoudsTrie **this, internal::marisa::grimoire::io::Writer *a2)
{
  internal::marisa::grimoire::trie::LoudsTrie *v4;
  int v6;
  unsigned int __buf;

  internal::marisa::grimoire::vector::BitVector::write_((internal::marisa::grimoire::vector::BitVector *)this, a2);
  internal::marisa::grimoire::vector::BitVector::write_((internal::marisa::grimoire::vector::BitVector *)(this + 26), a2);
  internal::marisa::grimoire::vector::BitVector::write_((internal::marisa::grimoire::vector::BitVector *)(this + 52), a2);
  internal::marisa::grimoire::vector::Vector<unsigned char>::write_((uint64_t)(this + 78), a2);
  internal::marisa::grimoire::vector::FlatVector::write_((internal::marisa::grimoire::vector::FlatVector *)(this + 84), a2);
  internal::marisa::grimoire::trie::Tail::write((internal::marisa::grimoire::trie::Tail *)(this + 93), a2);
  v4 = this[125];
  if (v4)
    internal::marisa::grimoire::trie::LoudsTrie::write_(v4, a2);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::write_((uint64_t)(this + 126), a2);
  __buf = this[133];
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  v6 = *((_DWORD *)this + 271) | *((_DWORD *)this + 268) | *((_DWORD *)this + 272);
  return internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&v6, 4uLL);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::get_payload(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t v5;

  v3 = *(unsigned __int8 *)(a2 + 31);
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a2 + 16);
  if (v3)
    return 0;
  v5 = *(_QWORD *)a2;
  if (((*(_QWORD *)(*(_QWORD *)(a1 + 224) + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
    return 0;
  *a3 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(a1 + 208), v5);
  return 1;
}

void internal::marisa::grimoire::trie::LoudsTrie::predictive_search(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  int v10;
  std::string __p;
  char v12;
  unint64_t v13;
  unint64_t v14;

  v13 = 0;
  v14 = 0;
  v12 = 0;
  memset(&__p, 0, sizeof(__p));
  while (v13 < a3)
  {
    if ((internal::marisa::grimoire::trie::LoudsTrie::predictive_find_child(this, a2, a3, &v13, &v14, &__p) & 1) == 0)
      goto LABEL_8;
  }
  v10 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v10 = __p.__r_.__value_.__r.__words[1];
  internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries_DFS((unint64_t)this, v14, (uint64_t)&__p, &v12, a4, (v10 - a3) & ~((v10 - (int)a3) >> 31), a5);
LABEL_8:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_18D724718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::predictive_find_child(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, std::string *a6)
{
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v12 = (*(unsigned __int8 *)(a2 + *a4) ^ (32 * *a5) ^ *a5) & *((_QWORD *)this + 132);
  v13 = *((_QWORD *)this + 128);
  if (*a5 != *(_DWORD *)(v13 + 12 * v12))
  {
    v15 = internal::marisa::grimoire::vector::BitVector::select0(this, *a5);
    v16 = *((_QWORD *)this + 2);
    if (((*(_QWORD *)(v16 + (((v15 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v15 + 1)) & 1) != 0)
    {
      v17 = v15 - *a5;
      *a5 = v17;
      v18 = v15 + 2;
      v19 = 0xFFFFFFFFLL;
      while (1)
      {
        if (((*(_QWORD *)(*((_QWORD *)this + 54) + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v17) & 1) != 0)
        {
          if (v19 == 0xFFFFFFFFLL)
          {
            v19 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)((char *)this + 416), v17);
            v17 = *a5;
          }
          else
          {
            ++v19;
          }
          v21 = *a4;
          v22 = *((_QWORD *)this + 90);
          v23 = (unint64_t)(v22 * v19) >> 6;
          v24 = (v22 * v19) & 0x3F;
          v25 = v24 + v22;
          v26 = *((_QWORD *)this + 86);
          v27 = *(_QWORD *)(v26 + 8 * v23) >> v24;
          if (v25 > 0x40)
            v27 |= (2 * *(_QWORD *)(v26 + 8 * v23 + 8)) << (v24 ^ 0x3Fu);
          v28 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + v17) | ((*((_DWORD *)this + 182) & v27) << 8);
          v29 = *((_QWORD *)this + 125);
          if (v29)
          {
            if ((internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(v29, a2, a3, a4, v28, a6) & 1) != 0)
              return 1;
          }
          else if (internal::marisa::grimoire::trie::Tail::prefix_match((_QWORD *)this + 93, a2, a3, a4, v28, a6))
          {
            return 1;
          }
          if (*a4 != v21)
            return 0;
          v17 = *a5;
          v16 = *((_QWORD *)this + 2);
        }
        else
        {
          v20 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + v17);
          if (v20 == *(unsigned __int8 *)(a2 + *a4))
          {
            std::string::push_back(a6, v20);
            ++*a4;
            return 1;
          }
        }
        *a5 = ++v17;
        v30 = *(_QWORD *)(v16 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v18;
        ++v18;
        if ((v30 & 1) == 0)
          return 0;
      }
    }
    return 0;
  }
  v14 = *(unsigned int *)(v13 + 12 * v12 + 8);
  if (v14 > 0xFFFFFEFF)
  {
    std::string::push_back(a6, v14);
    ++*a4;
    goto LABEL_24;
  }
  v31 = *((_QWORD *)this + 125);
  if (v31)
  {
    if ((internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(v31, a2, a3, a4, v14, a6) & 1) != 0)
      goto LABEL_24;
    return 0;
  }
  if (!internal::marisa::grimoire::trie::Tail::prefix_match((_QWORD *)this + 93, a2, a3, a4, v14, a6))
    return 0;
LABEL_24:
  *a5 = *(unsigned int *)(*((_QWORD *)this + 128) + 12 * v12 + 4);
  return 1;
}

unint64_t internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries_DFS(unint64_t result, unint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, int a6, uint64_t a7)
{
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  std::string::size_type v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  if (!*a4)
  {
    v11 = result;
    if ((a7 & 0x80000000) != 0 || a6 <= (int)a7)
    {
      if (((*(_QWORD *)(*(_QWORD *)(result + 224) + ((a2 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a2) & 1) == 0
        || ((v12 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(result + 208), a2), v13 = *(char *)(a3 + 23), v13 >= 0)? (v14 = a3): (v14 = *(_QWORD *)a3), v13 >= 0 ? (v15 = *(unsigned __int8 *)(a3 + 23)) : (v15 = *(_QWORD *)(a3 + 8)), result = std::function<void ()(unsigned long,std::string_view,BOOL &)>::operator()(a5, v12, v14, v15, (uint64_t)a4), !*a4))
      {
        v16 = *(char *)(a3 + 23) >= 0 ? *(unsigned __int8 *)(a3 + 23) : *(_QWORD *)(a3 + 8);
        result = internal::marisa::grimoire::vector::BitVector::select0((internal::marisa::grimoire::vector::BitVector *)v11, a2);
        if (!*a4)
        {
          v17 = result;
          v18 = 0xFFFFFFFFLL;
          do
          {
            if (((*(_QWORD *)(*(_QWORD *)(v11 + 16) + (((v17 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v17 + 1)) & 1) == 0)
              break;
            if (((*(_QWORD *)(*(_QWORD *)(v11 + 432) + (((v17 - a2) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v17 - a2)) & 1) != 0)
            {
              if (v18 == 0xFFFFFFFFLL)
                v18 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(v11 + 416), v17 - a2);
              else
                ++v18;
              v19 = *(_QWORD *)(v11 + 720);
              v20 = (unint64_t)(v19 * v18) >> 6;
              v21 = (v19 * v18) & 0x3F;
              v22 = v21 + v19;
              v23 = *(_QWORD *)(v11 + 688);
              v24 = *(_QWORD *)(v23 + 8 * v20) >> v21;
              if (v22 > 0x40)
                v24 |= (2 * *(_QWORD *)(v23 + 8 * v20 + 8)) << (v21 ^ 0x3Fu);
              v25 = *(unsigned __int8 *)(*(_QWORD *)(v11 + 640) - a2 + v17) | ((*(_DWORD *)(v11 + 728) & v24) << 8);
              v26 = *(_QWORD *)(v11 + 1000);
              if (v26)
                internal::marisa::grimoire::trie::LoudsTrie::restore_(v26, (std::string *)a3, v25);
              else
                internal::marisa::grimoire::trie::Tail::restore((_QWORD *)(v11 + 744), (std::string *)a3, v25);
            }
            else
            {
              std::string::push_back((std::string *)a3, *(_BYTE *)(*(_QWORD *)(v11 + 640) - a2 + v17));
            }
            v27 = *(unsigned __int8 *)(a3 + 23);
            if ((v27 & 0x80u) != 0)
              v27 = *(_DWORD *)(a3 + 8);
            internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries_DFS(v11, v17 - a2, a3, a4, a5, (v27 - v16 + a6), a7);
            v28 = *(unsigned __int8 *)(a3 + 23);
            v29 = (char)v28;
            v30 = a3 + v28;
            if (v29 >= 0)
            {
              v31 = a3;
            }
            else
            {
              v30 = *(_QWORD *)a3 + *(_QWORD *)(a3 + 8);
              v31 = *(_QWORD *)a3;
            }
            result = (unint64_t)std::string::erase((std::string *)a3, v16, v30 - (v31 + v16));
            ++v17;
          }
          while (!*a4);
        }
      }
    }
  }
  return result;
}

void internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *__p;
  int v18;
  unsigned __int8 v19;
  char v20;

  if ((a4 & 0x80000000) != 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 31);
    v10 = *(_QWORD *)(a2 + 16);
    v9 = *(_BYTE *)(a2 + 31);
LABEL_8:
    v20 = 0;
    v12 = *(_QWORD *)(a2 + 8) + v10;
    v13 = a2 + 8 + v8;
    if (v9 >= 0)
      v14 = v13;
    else
      v14 = v12;
    if (v9 >= 0)
      v15 = a2 + 8;
    else
      v15 = *(_QWORD *)(a2 + 8);
    std::string::__init_with_size[abi:ne180100]<std::reverse_iterator<std::__wrap_iter<char const*>>,std::reverse_iterator<std::__wrap_iter<char const*>>>(&__p, v14, v14, v15, v15, v14 - v15);
    if ((v19 & 0x80u) == 0)
      v16 = v19;
    else
      v16 = v18;
    internal::marisa::grimoire::trie::LoudsTrie::enumerate_entries_DFS(a1, *(_QWORD *)a2, (uint64_t)&__p, &v20, a3, v16, a4);
    if ((char)v19 < 0)
      operator delete(__p);
    return;
  }
  v8 = *(unsigned __int8 *)(a2 + 31);
  v9 = v8;
  v10 = *(_QWORD *)(a2 + 16);
  if ((v8 & 0x80u) == 0)
    v11 = *(unsigned __int8 *)(a2 + 31);
  else
    v11 = *(_QWORD *)(a2 + 16);
  if (v11 <= a4)
    goto LABEL_8;
}

void sub_18D724D28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::function<void ()(unsigned long,std::string_view,BOOL &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[0] = a3;
  v8[1] = a4;
  v7 = a2;
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)v5 + 48))(v5, &v7, v8, a5);
}

void internal::marisa::grimoire::trie::LoudsTrie::enumerate_children(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  std::string::size_type v7;
  const std::string::value_type **v8;
  std::string *p_p;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  std::string::size_type size;
  std::string *v23;
  std::string *v24;
  char *v25;
  std::string::value_type v26;
  char v28;
  uint64_t v29;
  std::string *v30;
  uint64_t v31;
  int v32;
  std::string::value_type v33;
  uint64_t v34;
  uint64_t v35;
  int v36[2];
  std::string v37;
  unint64_t v38;
  std::string __p;
  unsigned __int8 v40;
  char v41;

  v40 = 0;
  v5 = *(unsigned __int8 *)(a2 + 31);
  v6 = (char)v5;
  v7 = *(_QWORD *)(a2 + 16);
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a2 + 16);
  if (v5)
  {
    v8 = (const std::string::value_type **)(a2 + 8);
    v38 = *(_QWORD *)a2;
    p_p = &__p;
    if (v6 < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *v8, v7);
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v8;
      __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      v33 = *(_BYTE *)(__p.__r_.__value_.__r.__words[0] + __p.__r_.__value_.__l.__size_ - 1);
      v34 = --__p.__r_.__value_.__l.__size_;
    }
    else
    {
      v33 = __p.__r_.__value_.__s.__data_[HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1];
      v34 = HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1;
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = v34 & 0x7F;
    }
    p_p->__r_.__value_.__s.__data_[v34] = 0;
    v37.__r_.__value_.__s.__data_[0] = v33;
    v35 = *(_QWORD *)(a3 + 24);
    if (!v35)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, std::string *, unint64_t *, unsigned __int8 *))(*(_QWORD *)v35 + 48))(v35, &v37, &v38, &v40);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v11 = internal::marisa::grimoire::vector::BitVector::select0((internal::marisa::grimoire::vector::BitVector *)a1, *(_QWORD *)a2);
    v12 = v11 - *(_QWORD *)a2;
    *(_QWORD *)v36 = a1 + 744;
    v13 = 0xFFFFFFFFLL;
    do
    {
      ++v11;
      if (((*(_QWORD *)(*(_QWORD *)(a1 + 16) + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        break;
      memset(&v37, 0, sizeof(v37));
      if (((*(_QWORD *)(*(_QWORD *)(a1 + 432) + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
      {
        if (v13 == 0xFFFFFFFFLL)
          v13 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(a1 + 416), v12);
        else
          ++v13;
        v14 = *(_QWORD *)(a1 + 720);
        v15 = (unint64_t)(v14 * v13) >> 6;
        v16 = (v14 * v13) & 0x3F;
        v17 = v16 + v14;
        v18 = *(_QWORD *)(a1 + 688);
        v19 = *(_QWORD *)(v18 + 8 * v15) >> v16;
        if (v17 > 0x40)
          v19 |= (2 * *(_QWORD *)(v18 + 8 * v15 + 8)) << (v16 ^ 0x3Fu);
        v20 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 640) + v12) | ((*(_DWORD *)(a1 + 728) & v19) << 8);
        v21 = *(_QWORD *)(a1 + 1000);
        if (v21)
          internal::marisa::grimoire::trie::LoudsTrie::restore_(v21, &v37, v20);
        else
          internal::marisa::grimoire::trie::Tail::restore(*(_QWORD **)v36, &v37, v20);
        size = HIBYTE(v37.__r_.__value_.__r.__words[2]);
        if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v23 = &v37;
        else
          v23 = (std::string *)v37.__r_.__value_.__r.__words[0];
        if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          size = v37.__r_.__value_.__l.__size_;
        if (size)
        {
          v24 = (std::string *)((char *)v23 + size - 1);
          if (v24 > v23)
          {
            v25 = &v23->__r_.__value_.__s.__data_[1];
            do
            {
              v26 = *(v25 - 1);
              *(v25 - 1) = v24->__r_.__value_.__s.__data_[0];
              v24->__r_.__value_.__s.__data_[0] = v26;
              v24 = (std::string *)((char *)v24 - 1);
            }
            while (v25++ < (char *)v24);
          }
        }
      }
      else
      {
        std::string::push_back(&v37, *(_BYTE *)(*(_QWORD *)(a1 + 640) + v12));
      }
      __p = v37;
      memset(&v37, 0, sizeof(v37));
      v38 = v12;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
        v28 = *(_BYTE *)(__p.__r_.__value_.__r.__words[0] + __p.__r_.__value_.__l.__size_ - 1);
        v29 = --__p.__r_.__value_.__l.__size_;
      }
      else
      {
        v28 = *((_BYTE *)&v38 + HIBYTE(__p.__r_.__value_.__r.__words[2]) + 7);
        v29 = HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1;
        *((_BYTE *)&__p.__r_.__value_.__s + 23) = v29 & 0x7F;
        v30 = &__p;
      }
      v30->__r_.__value_.__s.__data_[v29] = 0;
      v41 = v28;
      v31 = *(_QWORD *)(a3 + 24);
      if (!v31)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(uint64_t, char *, unint64_t *, unsigned __int8 *))(*(_QWORD *)v31 + 48))(v31, &v41, &v38, &v40);
      v32 = v40;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v37.__r_.__value_.__l.__data_);
      ++v12;
    }
    while (!v32);
  }
}

void sub_18D7250BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::lookup(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  unint64_t v9;
  unint64_t v10;

  v9 = 0;
  v10 = 0;
  while (v9 < a3)
  {
    if ((internal::marisa::grimoire::trie::LoudsTrie::find_child(this, a2, a3, &v9, &v10) & 1) == 0)
      return 0;
  }
  if (((*(_QWORD *)(*((_QWORD *)this + 28) + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    *a4 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)((char *)this + 208), v10);
    return 1;
  }
  return 0;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::find_child(internal::marisa::grimoire::vector::BitVector *this, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v10 = (*(unsigned __int8 *)(a2 + *a4) ^ (32 * *a5) ^ *a5) & *((_QWORD *)this + 132);
  v11 = *((_QWORD *)this + 128);
  if (*a5 != *(_DWORD *)(v11 + 12 * v10))
  {
    v13 = internal::marisa::grimoire::vector::BitVector::select0(this, *a5);
    v14 = *((_QWORD *)this + 2);
    if (((*(_QWORD *)(v14 + (((v13 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v13 + 1)) & 1) != 0)
    {
      v15 = v13 - *a5;
      *a5 = v15;
      v16 = v13 + 2;
      v17 = 0xFFFFFFFFLL;
      while (1)
      {
        if (((*(_QWORD *)(*((_QWORD *)this + 54) + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
        {
          if (v17 == 0xFFFFFFFFLL)
          {
            v17 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)((char *)this + 416), v15);
            v15 = *a5;
          }
          else
          {
            ++v17;
          }
          v18 = *a4;
          v19 = *((_QWORD *)this + 90);
          v20 = (unint64_t)(v19 * v17) >> 6;
          v21 = (v19 * v17) & 0x3F;
          v22 = v21 + v19;
          v23 = *((_QWORD *)this + 86);
          v24 = *(_QWORD *)(v23 + 8 * v20) >> v21;
          if (v22 > 0x40)
            v24 |= (2 * *(_QWORD *)(v23 + 8 * v20 + 8)) << (v21 ^ 0x3Fu);
          v25 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + v15) | ((*((_DWORD *)this + 182) & v24) << 8);
          v26 = *((_QWORD *)this + 125);
          if (v26)
          {
            if ((internal::marisa::grimoire::trie::LoudsTrie::match_(v26, a2, a3, a4, v25) & 1) != 0)
              return 1;
          }
          else if ((internal::marisa::grimoire::trie::Tail::match((_QWORD *)this + 93, a2, a3, a4, v25) & 1) != 0)
          {
            return 1;
          }
          if (*a4 != v18)
            return 0;
          v15 = *a5;
          v14 = *((_QWORD *)this + 2);
        }
        else if (*(unsigned __int8 *)(*((_QWORD *)this + 80) + v15) == *(unsigned __int8 *)(a2 + *a4))
        {
          ++*a4;
          return 1;
        }
        *a5 = ++v15;
        v27 = *(_QWORD *)(v14 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v16;
        ++v16;
        if ((v27 & 1) == 0)
          return 0;
      }
    }
    return 0;
  }
  v12 = *(unsigned int *)(v11 + 12 * v10 + 8);
  if (v12 > 0xFFFFFEFF)
  {
    ++*a4;
    goto LABEL_24;
  }
  v28 = *((_QWORD *)this + 125);
  if (v28)
  {
    if ((internal::marisa::grimoire::trie::LoudsTrie::match_(v28, a2, a3, a4, v12) & 1) != 0)
      goto LABEL_24;
    return 0;
  }
  if ((internal::marisa::grimoire::trie::Tail::match((_QWORD *)this + 93, a2, a3, a4, v12) & 1) == 0)
    return 0;
LABEL_24:
  *a5 = *(unsigned int *)(*((_QWORD *)this + 128) + 12 * v10 + 4);
  return 1;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::common_prefix_search(uint64_t this, uint64_t a2, unint64_t a3, uint64_t a4)
{
  internal::marisa::grimoire::vector::BitVector *v7;
  internal::marisa::grimoire::vector::BitVector *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  char v15;

  v7 = (internal::marisa::grimoire::vector::BitVector *)this;
  v15 = 0;
  v13 = 0;
  v14 = 0;
  v8 = (internal::marisa::grimoire::vector::BitVector *)(this + 208);
  if ((**(_BYTE **)(this + 224) & 1) != 0)
  {
    v9 = internal::marisa::grimoire::vector::BitVector::rank1((internal::marisa::grimoire::vector::BitVector *)(this + 208), 0);
    this = std::function<void ()(unsigned long,std::string_view,BOOL &)>::operator()(a4, v9, a2, 0, (uint64_t)&v15);
    if (v15)
      v10 = 1;
    else
      v10 = a3 == 0;
    if (v10)
      return this;
  }
  else if (!a3)
  {
    return this;
  }
  this = internal::marisa::grimoire::trie::LoudsTrie::find_child(v7, a2, a3, &v13, &v14);
  if ((_DWORD)this)
  {
    do
    {
      if (((*(_QWORD *)(*((_QWORD *)v7 + 28) + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
      {
        v11 = internal::marisa::grimoire::vector::BitVector::rank1(v8, v14);
        this = std::function<void ()(unsigned long,std::string_view,BOOL &)>::operator()(a4, v11, a2, v13, (uint64_t)&v15);
        if (v15)
          v12 = 1;
        else
          v12 = v13 >= a3;
        if (v12)
          return this;
      }
      else if (v13 >= a3)
      {
        return this;
      }
      this = internal::marisa::grimoire::trie::LoudsTrie::find_child(v7, a2, a3, &v13, &v14);
    }
    while ((this & 1) != 0);
  }
  return this;
}

uint64_t *internal::marisa::grimoire::vector::BitVector::swap(internal::marisa::grimoire::vector::BitVector *this, internal::marisa::grimoire::vector::BitVector *a2)
{
  uint64_t v4;
  uint64_t v5;

  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  v4 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v4;
  v5 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v5;
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 8, (uint64_t *)a2 + 8);
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 14, (uint64_t *)a2 + 14);
  return internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 20, (uint64_t *)a2 + 20);
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned char>::swap(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *result;
  *result = *a2;
  *a2 = v2;
  v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  v4 = result[2];
  v5 = result[3];
  v6 = a2[3];
  result[2] = a2[2];
  result[3] = v6;
  a2[2] = v4;
  a2[3] = v5;
  v7 = result[4];
  result[4] = a2[4];
  a2[4] = v7;
  LOBYTE(v7) = *((_BYTE *)result + 40);
  *((_BYTE *)result + 40) = *((_BYTE *)a2 + 40);
  *((_BYTE *)a2 + 40) = v7;
  return result;
}

uint64_t *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 > 0x555555555555555)
      v5 = 0xAAAAAAAAAAAAAAALL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::realloc(result, a2);
  }
  v6 = v3[3];
  v7 = v2 - v6;
  if (v2 > v6)
  {
    v8 = 24 * v6;
    do
    {
      v9 = v3[1] + v8;
      *(_QWORD *)v9 = 0;
      *(_QWORD *)(v9 + 8) = 0;
      *(_DWORD *)(v9 + 16) = 0;
      v8 += 24;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  _DWORD *v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  __int128 v17[3];
  uint64_t v18;
  uint64_t v19;
  int v20;

  internal::marisa::grimoire::trie::LoudsTrie::build_current_trie<internal::marisa::grimoire::trie::Key>((uint64_t *)a1, (uint64_t)a2, a3, a4, a5);
  memset(v17, 0, 41);
  if (a2[3])
    internal::marisa::grimoire::trie::LoudsTrie::build_next_trie<internal::marisa::grimoire::trie::Key>(a1, a2, v17, a4, a5);
  v9 = *(_DWORD **)(a1 + 1000);
  if (v9)
  {
    v10 = (v9[268] + 1) | v9[271] | v9[272];
    v18 = 3;
    v19 = 0x100000000200;
    v20 = 0x20000;
    internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v18, v10);
  }
  else
  {
    if (*(_QWORD *)(a1 + 840))
      v11 = 0x2000;
    else
      v11 = 4096;
    v12 = *(_DWORD *)(a4 + 16) | *(_DWORD *)(a4 + 8) | v11 | 1;
    v18 = 3;
    v19 = 0x100000000200;
    v20 = 0x20000;
    internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v18, v12);
  }
  *(_QWORD *)(a1 + 1072) = v18;
  *(_QWORD *)(a1 + 1080) = v19;
  *(_DWORD *)(a1 + 1088) = v20;
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)(a1 + 416), 0, 0);
  if (*((_QWORD *)&v17[1] + 1))
  {
    v13 = 0;
    v14 = 0;
    do
    {
      do
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 432) + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14;
        ++v14;
      }
      while ((v15 & 1) == 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 632) + v14 - 1) = *(_DWORD *)(*((_QWORD *)&v17[0] + 1) + 4 * v13);
      *(_DWORD *)(*((_QWORD *)&v17[0] + 1) + 4 * v13++) >>= 8;
    }
    while (v13 < *((_QWORD *)&v17[1] + 1));
  }
  internal::marisa::grimoire::vector::FlatVector::build((__int128 *)(a1 + 672), (uint64_t)v17);
  internal::marisa::grimoire::trie::LoudsTrie::fill_cache(a1);
  result = *(_QWORD *)&v17[0];
  if (*(_QWORD *)&v17[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v17[0], 0x1000C8077774924);
  return result;
}

void sub_18D725834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

void internal::marisa::grimoire::vector::Vector<std::pair<unsigned int,unsigned int>>::resize(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = a2;
  v4 = a1[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 >> 60)
      v5 = 0x1FFFFFFFFFFFFFFFLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(a1, a2);
  }
  v6 = a1[3];
  if (v2 > v6)
    bzero((void *)(a1[1] + 8 * v6), 8 * (v2 - v6));
  a1[3] = v2;
}

uint64_t *internal::marisa::grimoire::vector::BitVector::push_back(uint64_t *this, int a2)
{
  unint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *exception;
  uint64_t v7;

  v2 = this[6];
  if (v2 == 0xFFFFFFFF)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/bit-vector.h";
    exception[2] = 0x70000003ALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/bit"
                   "-vector.h:58: MARISA_SIZE_ERROR: size_ == MARISA_UINT32_MAX";
  }
  v4 = this;
  v5 = this[3];
  if (v2 == v5 << 6)
  {
    v7 = 0;
    this = internal::marisa::grimoire::vector::Vector<unsigned long long>::resize(this, v5 + 1, &v7);
    v2 = v4[6];
  }
  if (a2)
  {
    *(_QWORD *)(v4[1] + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v2;
    ++v4[7];
  }
  v4[6] = v2 + 1;
  return this;
}

uint64_t internal::marisa::grimoire::vector::BitVector::build(internal::marisa::grimoire::vector::BitVector *this, int a2, int a3)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[4];
  __int128 v9;
  _BYTE v10[25];
  __int128 v11;
  _BYTE v12[25];
  __int128 v13;
  _BYTE v14[25];

  memset(v8, 0, 41);
  v11 = 0u;
  memset(v12, 0, sizeof(v12));
  v13 = 0u;
  memset(v14, 0, sizeof(v14));
  v8[3] = 0u;
  v9 = 0u;
  memset(v10, 0, sizeof(v10));
  internal::marisa::grimoire::vector::BitVector::build_index((internal::marisa::grimoire::vector::BitVector *)v8, this, a2, a3);
  internal::marisa::grimoire::vector::Vector<unsigned long long>::shrink(this);
  v4 = v8[0];
  v8[0] = *(_OWORD *)this;
  *(_OWORD *)this = v4;
  v5 = *(_QWORD *)&v8[1];
  *(_QWORD *)&v8[1] = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = v5;
  v6 = *(_OWORD *)((char *)&v8[1] + 8);
  *(_OWORD *)((char *)&v8[1] + 8) = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = v6;
  LOBYTE(v5) = BYTE8(v8[2]);
  BYTE8(v8[2]) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = v5;
  internal::marisa::grimoire::vector::BitVector::swap(this, (internal::marisa::grimoire::vector::BitVector *)v8);
  if ((_QWORD)v13)
    MEMORY[0x18D7921C8](v13, 0x1000C8077774924);
  if ((_QWORD)v11)
    MEMORY[0x18D7921C8](v11, 0x1000C8077774924);
  if ((_QWORD)v9)
    MEMORY[0x18D7921C8](v9, 0x1000C8077774924);
  result = *(_QWORD *)&v8[0];
  if (*(_QWORD *)&v8[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v8[0], 0x1000C8077774924);
  return result;
}

void sub_18D725AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  internal::marisa::grimoire::vector::BitVector::~BitVector((internal::marisa::grimoire::vector::BitVector *)&a9);
  _Unwind_Resume(a1);
}

void std::vector<unsigned long>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<unsigned long>::__append((char **)a1, a2 - v2);
  }
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_next_trie<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unsigned int *v10;
  _DWORD *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  internal::marisa::grimoire::trie::LoudsTrie *v21;
  internal::marisa::grimoire::trie::LoudsTrie *v22;
  uint64_t v23;
  uint64_t result;
  _QWORD *exception;
  __int128 v26;
  _BYTE v27[25];
  internal::marisa::grimoire::trie::LoudsTrie *v28;

  if (*(_QWORD *)a4 == a5)
  {
    v26 = 0u;
    memset(v27, 0, sizeof(v27));
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::resize((uint64_t *)&v26, a2[3]);
    v9 = a2[3];
    if (v9)
    {
      v10 = (unsigned int *)(*((_QWORD *)&v26 + 1) + 8);
      v11 = (_DWORD *)(a2[1] + 8);
      do
      {
        v12 = *((_QWORD *)v11 - 1);
        v13 = *v11;
        v11 += 6;
        *((_QWORD *)v10 - 1) = v12 + v13 - 1;
        *v10 = v13;
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    internal::marisa::grimoire::trie::Tail::build((__int128 *)(a1 + 744), (uint64_t)&v26, a3, *(_DWORD *)(a4 + 12));
  }
  else
  {
    v26 = 0u;
    memset(v27, 0, sizeof(v27));
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::resize((uint64_t *)&v26, a2[3]);
    if (a2[3])
    {
      v15 = 0;
      v16 = 0;
      do
      {
        v17 = *((_QWORD *)&v26 + 1) + v15;
        v18 = a2[1] + v15;
        v19 = *(unsigned int *)(v18 + 8);
        *(_QWORD *)v17 = *(_QWORD *)v18 + v19;
        *(_DWORD *)(v17 + 8) = v19;
        *(_DWORD *)(v17 + 12) = *(_DWORD *)(v18 + 12);
        ++v16;
        v15 += 24;
      }
      while (v16 < a2[3]);
    }
    v20 = *a2;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_OWORD *)((char *)a2 + 25) = 0u;
    if (v20)
      MEMORY[0x18D7921C8](v20, 0x1000C8077774924);
    v21 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E0DE4E10]);
    v22 = v21;
    if (v21)
      internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v21);
    v28 = *(internal::marisa::grimoire::trie::LoudsTrie **)(a1 + 1000);
    *(_QWORD *)(a1 + 1000) = v22;
    internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v28);
    v23 = *(_QWORD *)(a1 + 1000);
    if (!v23)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_1E26321F0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x8000001EBLL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/lou"
                     "ds-trie.cc:491: MARISA_MEMORY_ERROR: next_trie_.get() == NULL";
    }
    internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::ReverseKey>(v23, (uint64_t)&v26, a3, a4, a5 + 1);
  }
  result = v26;
  if ((_QWORD)v26)
    return MEMORY[0x18D7921C8](v26, 0x1000C8077774924);
  return result;
}

void sub_18D725D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  MEMORY[0x18D7921E0](v9, MEMORY[0x1E0DE4E10]);
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 >> 59)
      v5 = 0xFFFFFFFFFFFFFFFLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::realloc(result, a2);
  }
  v6 = v3[3];
  v7 = v2 - v6;
  if (v2 > v6)
  {
    v8 = 16 * v6;
    do
    {
      v9 = (_QWORD *)(v3[1] + v8);
      *v9 = 0;
      v9[1] = 0;
      v8 += 16;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  _DWORD *v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  __int128 v17[3];
  uint64_t v18;
  uint64_t v19;
  int v20;

  internal::marisa::grimoire::trie::LoudsTrie::build_current_trie<internal::marisa::grimoire::trie::ReverseKey>((uint64_t *)a1, a2, a3, a4, a5);
  memset(v17, 0, 41);
  if (*(_QWORD *)(a2 + 24))
    internal::marisa::grimoire::trie::LoudsTrie::build_next_trie<internal::marisa::grimoire::trie::ReverseKey>(a1, a2, v17, a4, a5);
  v9 = *(_DWORD **)(a1 + 1000);
  if (v9)
  {
    v10 = (v9[268] + 1) | v9[271] | v9[272];
    v18 = 3;
    v19 = 0x100000000200;
    v20 = 0x20000;
    internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v18, v10);
  }
  else
  {
    if (*(_QWORD *)(a1 + 840))
      v11 = 0x2000;
    else
      v11 = 4096;
    v12 = *(_DWORD *)(a4 + 16) | *(_DWORD *)(a4 + 8) | v11 | 1;
    v18 = 3;
    v19 = 0x100000000200;
    v20 = 0x20000;
    internal::marisa::grimoire::trie::Config::parse_((internal::marisa::grimoire::trie::Config *)&v18, v12);
  }
  *(_QWORD *)(a1 + 1072) = v18;
  *(_QWORD *)(a1 + 1080) = v19;
  *(_DWORD *)(a1 + 1088) = v20;
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)(a1 + 416), 0, 0);
  if (*((_QWORD *)&v17[1] + 1))
  {
    v13 = 0;
    v14 = 0;
    do
    {
      do
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 432) + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14;
        ++v14;
      }
      while ((v15 & 1) == 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 632) + v14 - 1) = *(_DWORD *)(*((_QWORD *)&v17[0] + 1) + 4 * v13);
      *(_DWORD *)(*((_QWORD *)&v17[0] + 1) + 4 * v13++) >>= 8;
    }
    while (v13 < *((_QWORD *)&v17[1] + 1));
  }
  internal::marisa::grimoire::vector::FlatVector::build((__int128 *)(a1 + 672), (uint64_t)v17);
  internal::marisa::grimoire::trie::LoudsTrie::fill_cache(a1);
  result = *(_QWORD *)&v17[0];
  if (*(_QWORD *)&v17[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v17[0], 0x1000C8077774924);
  return result;
}

void sub_18D725F8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_next_trie<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t result;
  internal::marisa::grimoire::trie::LoudsTrie *v16;
  internal::marisa::grimoire::trie::LoudsTrie *v17;
  uint64_t v18;
  _QWORD *exception;
  _OWORD v20[3];

  if (*(_QWORD *)a4 == a5)
  {
    memset(v20, 0, 41);
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::resize((uint64_t *)v20, *(_QWORD *)(a2 + 24));
    v9 = *(_QWORD *)(a2 + 24);
    if (v9)
    {
      v10 = (_DWORD *)(*((_QWORD *)&v20[0] + 1) + 8);
      v11 = (_DWORD *)(*(_QWORD *)(a2 + 8) + 8);
      do
      {
        v12 = *((_QWORD *)v11 - 1);
        v13 = *v11;
        v11 += 6;
        *((_QWORD *)v10 - 1) = v12 - 1;
        *v10 = v13;
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    internal::marisa::grimoire::trie::Tail::build((__int128 *)(a1 + 744), (uint64_t)v20, a3, *(_DWORD *)(a4 + 12));
    result = *(_QWORD *)&v20[0];
    if (*(_QWORD *)&v20[0])
      return MEMORY[0x18D7921C8](*(_QWORD *)&v20[0], 0x1000C8077774924);
  }
  else
  {
    v16 = (internal::marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x1E0DE4E10]);
    v17 = v16;
    if (v16)
      internal::marisa::grimoire::trie::LoudsTrie::LoudsTrie(v16);
    *(_QWORD *)&v20[0] = *(_QWORD *)(a1 + 1000);
    *(_QWORD *)(a1 + 1000) = v17;
    internal::marisa::scoped_ptr<internal::marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((internal::marisa::grimoire::trie::LoudsTrie **)v20);
    v18 = *(_QWORD *)(a1 + 1000);
    if (!v18)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_1E26321F0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x8000001FDLL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/lou"
                     "ds-trie.cc:509: MARISA_MEMORY_ERROR: next_trie_.get() == NULL";
    }
    return internal::marisa::grimoire::trie::LoudsTrie::build_trie<internal::marisa::grimoire::trie::ReverseKey>(v18, a2, a3, a4, a5 + 1);
  }
  return result;
}

void sub_18D726120(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x18D7921E0](v1, MEMORY[0x1E0DE4E10]);
  _Unwind_Resume(a1);
}

uint64_t *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 > 0xAAAAAAAAAAAAAAALL)
      v5 = 0x1555555555555555;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::realloc(result, a2);
  }
  v6 = v3[3];
  v7 = v2 - v6;
  if (v2 > v6)
  {
    v8 = 12 * v6;
    do
    {
      v9 = v3[1] + v8;
      *(_QWORD *)v9 = 0;
      *(_DWORD *)(v9 + 8) = 0x800000;
      v8 += 12;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::fill_cache(uint64_t this)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  internal::marisa::grimoire::vector::BitVector *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;

  v1 = *(_QWORD *)(this + 1032);
  if (v1)
  {
    v2 = this;
    v3 = 0;
    v4 = 0;
    v5 = (internal::marisa::grimoire::vector::BitVector *)(this + 416);
    do
    {
      v6 = *(_QWORD *)(v2 + 1016);
      v7 = *(unsigned int *)(v6 + v3 + 4);
      if ((_DWORD)v7)
      {
        *(_BYTE *)(v6 + v3 + 8) = *(_BYTE *)(*(_QWORD *)(v2 + 632) + v7);
        v8 = *(_QWORD *)(v2 + 1016);
        if (((*(_QWORD *)(*(_QWORD *)(v2 + 432) + ((v7 >> 3) & 0x1FFFFFF8)) >> v7) & 1) != 0)
        {
          this = internal::marisa::grimoire::vector::BitVector::rank1(v5, v7);
          v9 = *(_QWORD *)(v2 + 720);
          v10 = (unint64_t)(v9 * this) >> 6;
          v11 = (v9 * this) & 0x3F;
          v12 = v11 + v9;
          v13 = *(_QWORD *)(v2 + 688);
          v14 = *(_QWORD *)(v13 + 8 * v10);
          if (v12 > 0x40)
            v15 = ((2 * *(_QWORD *)(v13 + 8 * v10 + 8)) << (v11 ^ 0x3Fu)) | (v14 >> v11);
          else
            v15 = v14 >> v11;
          v16 = *(_DWORD *)(v2 + 728) & v15;
        }
        else
        {
          v16 = 0xFFFFFF;
        }
        *(_DWORD *)(v8 + v3 + 8) = *(unsigned __int8 *)(v8 + v3 + 8) | (v16 << 8);
        v1 = *(_QWORD *)(v2 + 1032);
      }
      else
      {
        *(_QWORD *)(v6 + v3) = -1;
      }
      ++v4;
      v3 += 12;
    }
    while (v4 < v1);
  }
  return this;
}

uint64_t internal::marisa::grimoire::vector::BitVector::map(internal::marisa::grimoire::vector::BitVector *this, internal::marisa::grimoire::io::Mapper *a2)
{
  uint64_t result;
  _OWORD v4[4];
  __int128 v5;
  _BYTE v6[25];
  __int128 v7;
  _BYTE v8[25];
  __int128 v9;
  _BYTE v10[25];

  memset(v4, 0, 41);
  v7 = 0u;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  memset(v10, 0, sizeof(v10));
  v4[3] = 0u;
  v5 = 0u;
  memset(v6, 0, sizeof(v6));
  internal::marisa::grimoire::vector::BitVector::map_((internal::marisa::grimoire::vector::BitVector *)v4, a2);
  internal::marisa::grimoire::vector::BitVector::swap(this, (internal::marisa::grimoire::vector::BitVector *)v4);
  if ((_QWORD)v9)
    MEMORY[0x18D7921C8](v9, 0x1000C8077774924);
  if ((_QWORD)v7)
    MEMORY[0x18D7921C8](v7, 0x1000C8077774924);
  if ((_QWORD)v5)
    MEMORY[0x18D7921C8](v5, 0x1000C8077774924);
  result = *(_QWORD *)&v4[0];
  if (*(_QWORD *)&v4[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v4[0], 0x1000C8077774924);
  return result;
}

void sub_18D7263CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  internal::marisa::grimoire::vector::BitVector::~BitVector((internal::marisa::grimoire::vector::BitVector *)&a9);
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned char>::map(__int128 *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  return result;
}

void sub_18D726474(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::FlatVector::map(internal::marisa::grimoire::vector::FlatVector *this, internal::marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _OWORD v9[3];
  uint64_t v10;
  int v11;
  uint64_t v12;

  memset(v9, 0, 41);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  internal::marisa::grimoire::vector::FlatVector::map_((internal::marisa::grimoire::vector::FlatVector *)v9, a2);
  v3 = *(_OWORD *)this;
  *(_OWORD *)this = v9[0];
  v9[0] = v3;
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *(_QWORD *)&v9[1];
  *(_QWORD *)&v9[1] = v4;
  v5 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  v6 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = v10;
  v10 = v6;
  LODWORD(v6) = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = v11;
  v11 = v6;
  v7 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v12;
  result = v3;
  v12 = v7;
  if ((_QWORD)v3)
    return MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  return result;
}

void sub_18D72656C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::map(__int128 *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  return result;
}

void sub_18D726628(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

void internal::marisa::grimoire::trie::LoudsTrie::advance(internal::marisa::grimoire::vector::BitVector *this@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  unint64_t v9;
  uint64_t v10;
  std::string *p_p;
  std::string *v12;
  char v13;
  std::string *v14;
  std::string::size_type size;
  std::string *v16;
  BOOL v17;
  char *v18;
  std::string::value_type v19;
  std::string *v21;
  std::string v22;
  std::string __str;
  unint64_t v24;
  unint64_t v25;
  std::string __p;
  char v27;

  if (*(_QWORD *)a4 == 0xFFFFFFFFLL)
  {
    MEMORY[0xFFFFFFFF] = 0xFFFFFFFFLL;
    if (*(char *)(a4 + 31) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)0x100000007, *(const std::string::value_type **)(a4 + 8), *(_QWORD *)(a4 + 16));
    }
    else
    {
      MEMORY[0x100000007] = *(_OWORD *)(a4 + 8);
      MEMORY[0x100000017] = *(_QWORD *)(a4 + 24);
    }
    return;
  }
  v25 = *(_QWORD *)a4;
  if (*(char *)(a4 + 31) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a4 + 8), *(_QWORD *)(a4 + 16));
  else
    __p = *(std::string *)(a4 + 8);
  v24 = 0;
  if (!a3)
  {
LABEL_18:
    *a5 = v25;
    v12 = (std::string *)(a5 + 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(v12, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      *v12 = __p;
    goto LABEL_44;
  }
  v9 = 0;
  while ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_21;
    v24 = v9 + 1;
    if (*(unsigned __int8 *)(a2 + v9) != *((unsigned __int8 *)&v25 + HIBYTE(__p.__r_.__value_.__r.__words[2]) + 7))
    {
LABEL_25:
      *a5 = 0xFFFFFFFFLL;
      a5[1] = 0;
      a5[2] = 0;
      a5[3] = 0;
      goto LABEL_44;
    }
    v10 = HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1;
    --*((_BYTE *)&__p.__r_.__value_.__s + 23);
    ++v9;
    p_p = &__p;
LABEL_17:
    p_p->__r_.__value_.__s.__data_[v10] = 0;
    if (v9 >= a3)
      goto LABEL_18;
  }
  if (__p.__r_.__value_.__l.__size_)
  {
    v24 = v9 + 1;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (*(unsigned __int8 *)(a2 + v9) != *(unsigned __int8 *)(__p.__r_.__value_.__r.__words[0]
                                                             + __p.__r_.__value_.__l.__size_
                                                             - 1))
      goto LABEL_25;
    v10 = --__p.__r_.__value_.__l.__size_;
    ++v9;
    goto LABEL_17;
  }
LABEL_21:
  memset(&__str, 0, sizeof(__str));
  while (v24 < a3)
  {
    if ((internal::marisa::grimoire::trie::LoudsTrie::predictive_find_child(this, a2, a3, &v24, &v25, &__str) & 1) == 0)
    {
      *a5 = 0xFFFFFFFFLL;
      a5[1] = 0;
      a5[2] = 0;
      a5[3] = 0;
      goto LABEL_42;
    }
  }
  std::string::basic_string(&v22, &__str, v24 - v9, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v27);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = v22;
  v13 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
  size = v22.__r_.__value_.__l.__size_;
  v14 = (std::string *)v22.__r_.__value_.__r.__words[0];
  if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
  {
    v14 = &__p;
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  v16 = (std::string *)((char *)v14 + size - 1);
  if (size)
    v17 = v16 > v14;
  else
    v17 = 0;
  if (v17)
  {
    v18 = &v14->__r_.__value_.__s.__data_[1];
    do
    {
      v19 = *(v18 - 1);
      *(v18 - 1) = v16->__r_.__value_.__s.__data_[0];
      v16->__r_.__value_.__s.__data_[0] = v19;
      v16 = (std::string *)((char *)v16 - 1);
    }
    while (v18++ < (char *)v16);
    v13 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  *a5 = v25;
  v21 = (std::string *)(a5 + 1);
  if (v13 < 0)
    std::string::__init_copy_ctor_external(v21, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    *v21 = __p;
LABEL_42:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
LABEL_44:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_18D726910(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a17 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  _Unwind_Resume(exception_object);
}

void internal::marisa::grimoire::trie::LoudsTrie::restore_(uint64_t a1, std::string *a2, unint64_t a3)
{
  internal::marisa::grimoire::vector::BitVector *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v6 = (internal::marisa::grimoire::vector::BitVector *)(a1 + 416);
  v7 = (_QWORD *)(a1 + 744);
  while (1)
  {
    while (1)
    {
      v8 = *(_QWORD *)(a1 + 1056) & a3;
      v9 = *(_QWORD *)(a1 + 1024);
      if (a3 != *(_DWORD *)(v9 + 12 * v8 + 4))
        break;
      v10 = *(unsigned int *)(v9 + 12 * v8 + 8);
      if (v10 <= 0xFFFFFEFF)
      {
        v20 = *(_QWORD *)(a1 + 1000);
        if (v20)
          internal::marisa::grimoire::trie::LoudsTrie::restore_(v20, a2, v10);
        else
          internal::marisa::grimoire::trie::Tail::restore(v7, a2, v10);
      }
      else
      {
        std::string::push_back(a2, v10);
      }
      a3 = *(unsigned int *)(*(_QWORD *)(a1 + 1024) + 12 * v8);
      if (!(_DWORD)a3)
        return;
    }
    v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 640) + a3);
    if (((*(_QWORD *)(*(_QWORD *)(a1 + 432) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
    {
      v12 = internal::marisa::grimoire::vector::BitVector::rank1(v6, a3);
      v13 = *(_QWORD *)(a1 + 720);
      v14 = (unint64_t)(v13 * v12) >> 6;
      v15 = (v13 * v12) & 0x3F;
      v16 = v15 + v13;
      v17 = *(_QWORD *)(a1 + 688);
      v18 = *(_QWORD *)(v17 + 8 * v14);
      v19 = v16 > 0x40
          ? ((2 * *(_QWORD *)(v17 + 8 * v14 + 8)) << (v15 ^ 0x3Fu)) | (v18 >> v15)
          : v18 >> v15;
      v21 = v11 | ((*(_DWORD *)(a1 + 728) & v19) << 8);
      v22 = *(_QWORD *)(a1 + 1000);
      if (v22)
        internal::marisa::grimoire::trie::LoudsTrie::restore_(v22, a2, v21);
      else
        internal::marisa::grimoire::trie::Tail::restore(v7, a2, v21);
    }
    else
    {
      std::string::push_back(a2, v11);
    }
    if (a3 <= *(_QWORD *)(a1 + 1064))
      break;
    a3 = internal::marisa::grimoire::vector::BitVector::select1((internal::marisa::grimoire::vector::BitVector *)a1, a3)
       + ~a3;
  }
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::match_(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t a5)
{
  internal::marisa::grimoire::vector::BitVector *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v10 = (internal::marisa::grimoire::vector::BitVector *)(a1 + 416);
  v11 = (_QWORD *)(a1 + 744);
  while (1)
  {
    while (1)
    {
      v12 = *(_QWORD *)(a1 + 1056) & a5;
      v13 = *(_QWORD *)(a1 + 1024);
      if (a5 == *(_DWORD *)(v13 + 12 * v12 + 4))
        break;
      if (((*(_QWORD *)(*(_QWORD *)(a1 + 432) + ((a5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a5) & 1) != 0)
      {
        v15 = *(_QWORD *)(a1 + 1000);
        v16 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 640) + a5);
        v17 = internal::marisa::grimoire::vector::BitVector::rank1(v10, a5);
        v18 = *(_QWORD *)(a1 + 720);
        v19 = (unint64_t)(v18 * v17) >> 6;
        v20 = (v18 * v17) & 0x3F;
        v21 = v20 + v18;
        v22 = *(_QWORD *)(a1 + 688);
        v23 = *(_QWORD *)(v22 + 8 * v19);
        if (v15)
        {
          v24 = v23 >> v20;
          if (v21 > 0x40)
            v24 |= (2 * *(_QWORD *)(v22 + 8 * v19 + 8)) << (v20 ^ 0x3Fu);
          v25 = v16 | ((*(_DWORD *)(a1 + 728) & v24) << 8);
          v26 = *(_QWORD *)(a1 + 1000);
          if (v26)
          {
            if ((internal::marisa::grimoire::trie::LoudsTrie::match_(v26, a2, a3, a4, v25) & 1) == 0)
              return 0;
            goto LABEL_27;
          }
        }
        else
        {
          if (v21 > 0x40)
            v28 = ((2 * *(_QWORD *)(v22 + 8 * v19 + 8)) << (v20 ^ 0x3Fu)) | (v23 >> v20);
          else
            v28 = v23 >> v20;
          v25 = v16 | ((*(_DWORD *)(a1 + 728) & v28) << 8);
        }
        if ((internal::marisa::grimoire::trie::Tail::match(v11, a2, a3, a4, v25) & 1) == 0)
          return 0;
      }
      else
      {
        if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 640) + a5) != *(unsigned __int8 *)(a2 + *a4))
          return 0;
        ++*a4;
      }
LABEL_27:
      if (a5 <= *(_QWORD *)(a1 + 1064))
        return 1;
      if (*a4 >= a3)
        return 0;
      a5 = internal::marisa::grimoire::vector::BitVector::select1((internal::marisa::grimoire::vector::BitVector *)a1, a5)+ ~a5;
    }
    v14 = *(unsigned int *)(v13 + 12 * v12 + 8);
    if (v14 <= 0xFFFFFEFF)
    {
      v27 = *(_QWORD *)(a1 + 1000);
      if (v27)
      {
        if ((internal::marisa::grimoire::trie::LoudsTrie::match_(v27, a2, a3, a4, v14) & 1) == 0)
          return 0;
      }
      else if ((internal::marisa::grimoire::trie::Tail::match(v11, a2, a3, a4, v14) & 1) == 0)
      {
        return 0;
      }
    }
    else
    {
      if (*(unsigned __int8 *)(a2 + *a4) != v14)
        return 0;
      ++*a4;
    }
    a5 = *(unsigned int *)(*(_QWORD *)(a1 + 1024) + 12 * v12);
    if (!(_DWORD)a5)
      return 1;
    if (*a4 >= a3)
      return 0;
  }
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t a5, std::string *a6)
{
  internal::marisa::grimoire::vector::BitVector *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v12 = (internal::marisa::grimoire::vector::BitVector *)(a1 + 416);
  v13 = (_QWORD *)(a1 + 744);
  while (1)
  {
    v14 = *(_QWORD *)(a1 + 1056) & a5;
    v15 = *(_QWORD *)(a1 + 1024);
    if (a5 != *(_DWORD *)(v15 + 12 * v14 + 4))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 640) + a5);
      if (((*(_QWORD *)(*(_QWORD *)(a1 + 432) + ((a5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a5) & 1) != 0)
      {
        v18 = internal::marisa::grimoire::vector::BitVector::rank1(v12, a5);
        v19 = *(_QWORD *)(a1 + 720);
        v20 = (unint64_t)(v19 * v18) >> 6;
        v21 = (v19 * v18) & 0x3F;
        v22 = v21 + v19;
        v23 = *(_QWORD *)(a1 + 688);
        v24 = *(_QWORD *)(v23 + 8 * v20);
        if (v22 > 0x40)
          v25 = ((2 * *(_QWORD *)(v23 + 8 * v20 + 8)) << (v21 ^ 0x3Fu)) | (v24 >> v21);
        else
          v25 = v24 >> v21;
        v27 = v17 | ((*(_DWORD *)(a1 + 728) & v25) << 8);
        v28 = *(_QWORD *)(a1 + 1000);
        if (v28)
        {
          if ((internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(v28, a2, a3, a4, v27, a6) & 1) == 0)
            return 0;
        }
        else if (!internal::marisa::grimoire::trie::Tail::prefix_match(v13, a2, a3, a4, v27, a6))
        {
          return 0;
        }
      }
      else
      {
        if (v17 != *(unsigned __int8 *)(a2 + *a4))
          return 0;
        std::string::push_back(a6, v17);
        ++*a4;
      }
      if (a5 <= *(_QWORD *)(a1 + 1064))
        return 1;
      a5 = internal::marisa::grimoire::vector::BitVector::select1((internal::marisa::grimoire::vector::BitVector *)a1, a5)+ ~a5;
      goto LABEL_23;
    }
    v16 = *(unsigned int *)(v15 + 12 * v14 + 8);
    if (v16 > 0xFFFFFEFF)
    {
      if (*(unsigned __int8 *)(a2 + *a4) != v16)
        return 0;
      std::string::push_back(a6, v16);
      ++*a4;
      goto LABEL_22;
    }
    v26 = *(_QWORD *)(a1 + 1000);
    if (!v26)
      break;
    if ((internal::marisa::grimoire::trie::LoudsTrie::prefix_match_(v26, a2, a3, a4, v16, a6) & 1) == 0)
      return 0;
LABEL_22:
    a5 = *(unsigned int *)(*(_QWORD *)(a1 + 1024) + 12 * v14);
    if (!(_DWORD)a5)
      return 1;
LABEL_23:
    if (*a4 >= a3)
    {
      internal::marisa::grimoire::trie::LoudsTrie::restore_(a1, a6, a5);
      return 1;
    }
  }
  if (internal::marisa::grimoire::trie::Tail::prefix_match(v13, a2, a3, a4, v16, a6))
    goto LABEL_22;
  return 0;
}

uint64_t internal::marisa::grimoire::trie::Config::parse_(internal::marisa::grimoire::trie::Config *this, unsigned int a2)
{
  _QWORD *exception;

  if (a2 >= 0x100000)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x500000034;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/confi"
                   "g.h:52: MARISA_CODE_ERROR: (config_flags & ~MARISA_CONFIG_MASK) != 0";
  }
  if ((a2 & 0x7F) != 0)
    *(_QWORD *)this = a2 & 0x7F;
  internal::marisa::grimoire::trie::Config::parse_cache_level((uint64_t)this, a2);
  internal::marisa::grimoire::trie::Config::parse_tail_mode((uint64_t)this, a2);
  return internal::marisa::grimoire::trie::Config::parse_node_order((uint64_t)this, a2);
}

uint64_t internal::marisa::grimoire::trie::Config::parse_cache_level(uint64_t this, __int16 a2)
{
  unsigned int v2;
  int v3;
  _QWORD *exception;

  v2 = a2 & 0xF80;
  v3 = 512;
  if (v2 > 0x1FF)
  {
    if (v2 == 512)
      goto LABEL_11;
    if (v2 != 1024)
    {
      v3 = a2 & 0xF80;
      if (v2 != 2048)
        goto LABEL_9;
      goto LABEL_11;
    }
LABEL_10:
    v3 = a2 & 0xF80;
    goto LABEL_11;
  }
  if ((a2 & 0xF80) == 0)
    goto LABEL_11;
  if (v2 == 128)
    goto LABEL_10;
  v3 = a2 & 0xF80;
  if (v2 != 256)
  {
LABEL_9:
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x500000060;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/confi"
                   "g.h:96: MARISA_CODE_ERROR: undefined cache level";
  }
LABEL_11:
  *(_DWORD *)(this + 8) = v3;
  return this;
}

uint64_t internal::marisa::grimoire::trie::Config::parse_tail_mode(uint64_t this, __int16 a2)
{
  int v2;
  int v3;
  _QWORD *exception;

  v2 = 4096;
  v3 = a2 & 0xF000;
  if ((a2 & 0xF000) != 0 && v3 != 4096)
  {
    if (v3 != 0x2000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_1E26321F0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x500000075;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/con"
                     "fig.h:117: MARISA_CODE_ERROR: undefined tail mode";
    }
    v2 = 0x2000;
  }
  *(_DWORD *)(this + 12) = v2;
  return this;
}

uint64_t internal::marisa::grimoire::trie::Config::parse_node_order(uint64_t this, int a2)
{
  int v2;
  int v3;
  _QWORD *exception;

  v2 = 0x20000;
  v3 = a2 & 0xF0000;
  if ((a2 & 0xF0000) != 0 && v3 != 0x20000)
  {
    if (v3 != 0x10000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &off_1E26321F0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x50000008ALL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/con"
                     "fig.h:138: MARISA_CODE_ERROR: undefined node order";
    }
    v2 = 0x10000;
  }
  *(_DWORD *)(this + 16) = v2;
  return this;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E2631BD0, MEMORY[0x1E0DE42D0]);
}

void sub_18D7271E4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned long long>::resize(uint64_t *result, unint64_t a2, _QWORD *a3)
{
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;

  v4 = a2;
  v5 = result;
  v6 = result[4];
  if (v6 < a2)
  {
    v7 = 2 * v6;
    if (v6 >> 60)
      v7 = 0x1FFFFFFFFFFFFFFFLL;
    if (v6 > a2 >> 1)
      a2 = v7;
    result = internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, a2);
  }
  v8 = v5[3];
  v9 = v4 - v8;
  if (v4 > v8)
  {
    v10 = (_QWORD *)(v5[1] + 8 * v8);
    do
    {
      *v10++ = *a3;
      --v9;
    }
    while (v9);
  }
  v5[3] = v4;
  return result;
}

_QWORD *internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(uint64_t *a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = operator new[](8 * a2, MEMORY[0x1E0DE4E10]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (uint64_t *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x18D7921C8);
  return result;
}

_QWORD *internal::marisa::grimoire::vector::Vector<unsigned long long>::shrink(_QWORD *result)
{
  uint64_t v1;
  _QWORD *exception;

  if (*((_BYTE *)result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x100000072;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:114: MARISA_STATE_ERROR: fixed_";
  }
  v1 = result[3];
  if (v1 != result[4])
    return internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, v1);
  return result;
}

uint64_t internal::marisa::grimoire::vector::BitVector::map_(internal::marisa::grimoire::vector::BitVector *this, internal::marisa::grimoire::io::Mapper *a2)
{
  unint64_t v4;
  _QWORD *exception;

  internal::marisa::grimoire::vector::Vector<unsigned long long>::map((__int128 *)this, a2);
  *((_QWORD *)this + 6) = *(unsigned int *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v4 = *(unsigned int *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (*((_QWORD *)this + 6) < v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/bit-vector.h";
    exception[2] = 0xA00000086;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/bit"
                   "-vector.h:134: MARISA_FORMAT_ERROR: temp_num_1s > size_";
  }
  *((_QWORD *)this + 7) = v4;
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map((__int128 *)this + 4, a2);
  internal::marisa::grimoire::vector::Vector<unsigned int>::map((__int128 *)this + 7, a2);
  return internal::marisa::grimoire::vector::Vector<unsigned int>::map((__int128 *)this + 10, a2);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned long long>::map(__int128 *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned long long>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  return result;
}

void sub_18D727514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map(__int128 *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  return result;
}

void sub_18D7275D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned int>::map(__int128 *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned int>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  return result;
}

void sub_18D72768C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned long long>::map_(uint64_t a1, internal::marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  _QWORD *exception;

  v4 = *(_QWORD *)internal::marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 7) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0xA000000D2;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:210: MARISA_FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  internal::marisa::grimoire::io::Mapper::map<unsigned long long>(this, (uint64_t *)(a1 + 16), v4 >> 3);
  internal::marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4 >> 3;
  return internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t internal::marisa::grimoire::io::Mapper::map<unsigned long long>(internal::marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x20000001FLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:31: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x700000020;
    v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:32: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = internal::marisa::grimoire::io::Mapper::map_data(a1, 8 * a3);
  *a2 = result;
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(uint64_t result)
{
  _QWORD *exception;

  if (*(_BYTE *)(result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x10000007ALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:122: MARISA_STATE_ERROR: fixed_";
  }
  *(_BYTE *)(result + 40) = 1;
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::map_(uint64_t a1, internal::marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *exception;

  v4 = *(_QWORD *)internal::marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  v5 = v4 / 0xC;
  if (v4 % 0xC)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0xA000000D2;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:210: MARISA_FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  internal::marisa::grimoire::io::Mapper::map<internal::marisa::grimoire::vector::RankIndex>(this, (uint64_t *)(a1 + 16), v5);
  internal::marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v5;
  return internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t internal::marisa::grimoire::io::Mapper::map<internal::marisa::grimoire::vector::RankIndex>(internal::marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x20000001FLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:31: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x700000020;
    v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:32: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = internal::marisa::grimoire::io::Mapper::map_data(a1, 12 * a3);
  *a2 = result;
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned int>::map_(uint64_t a1, internal::marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  _QWORD *exception;

  v4 = *(_QWORD *)internal::marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 3) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0xA000000D2;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:210: MARISA_FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  internal::marisa::grimoire::io::Mapper::map<unsigned int>(this, (uint64_t *)(a1 + 16), v4 >> 2);
  internal::marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4 >> 2;
  return internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t internal::marisa::grimoire::io::Mapper::map<unsigned int>(internal::marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x20000001FLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:31: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h";
    exception[2] = 0x700000020;
    v6 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/mapper.h:32: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = internal::marisa::grimoire::io::Mapper::map_data(a1, 4 * a3);
  *a2 = result;
  return result;
}

_QWORD *internal::marisa::grimoire::vector::FlatVector::map_(internal::marisa::grimoire::vector::FlatVector *this, internal::marisa::grimoire::io::Mapper *a2)
{
  uint64_t v4;
  _QWORD *result;
  _QWORD *exception;

  internal::marisa::grimoire::vector::Vector<unsigned long long>::map((__int128 *)this, a2);
  v4 = *(unsigned int *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (v4 >= 0x21)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/flat-vector.h";
    exception[2] = 0xA00000084;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/fla"
                   "t-vector.h:132: MARISA_FORMAT_ERROR: temp_value_size > 32";
  }
  *((_QWORD *)this + 6) = v4;
  *((_DWORD *)this + 14) = *(_DWORD *)internal::marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  result = (_QWORD *)internal::marisa::grimoire::io::Mapper::map_data(a2, 8uLL);
  *((_QWORD *)this + 8) = *result;
  return result;
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned long long>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 >> 60)
      v5 = 0x1FFFFFFFFFFFFFFFLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = internal::marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, a2);
  }
  v3[3] = v2;
  return result;
}

void internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::resize(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = a2;
  v4 = a1[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 > 0xAAAAAAAAAAAAAAALL)
      v5 = 0x1555555555555555;
    if (v4 > a2 >> 1)
      a2 = v5;
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::realloc(a1, a2);
  }
  v6 = a1[3];
  if (v2 > v6)
    bzero((void *)(a1[1] + 12 * v6), 12 * (v2 - v6));
  a1[3] = v2;
}

_DWORD *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::realloc(uint64_t *a1, uint64_t a2)
{
  _DWORD *result;
  uint64_t v5;
  uint64_t *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = operator new[](12 * a2, MEMORY[0x1E0DE4E10]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (uint64_t *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6;
      v7[2] = *((_DWORD *)v6 + 2);
      *(_QWORD *)v7 = v8;
      v7 += 3;
      v6 = (uint64_t *)((char *)v6 + 12);
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x18D7921C8);
  return result;
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned int>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 >> 61)
      v5 = 0x3FFFFFFFFFFFFFFFLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)internal::marisa::grimoire::vector::Vector<unsigned int>::realloc(result, a2);
  }
  v3[3] = v2;
  return result;
}

_DWORD *internal::marisa::grimoire::vector::Vector<unsigned int>::realloc(uint64_t *a1, uint64_t a2)
{
  _DWORD *result;
  uint64_t v5;
  int *v6;
  _DWORD *v7;
  int v8;
  uint64_t v9;

  result = operator new[](4 * a2, MEMORY[0x1E0DE4E10]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (int *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x18D7921C8);
  return result;
}

uint64_t internal::marisa::grimoire::vector::BitVector::write_(internal::marisa::grimoire::vector::BitVector *this, internal::marisa::grimoire::io::Writer *a2)
{
  int v5;
  int __buf;

  internal::marisa::grimoire::vector::Vector<unsigned long long>::write_((uint64_t)this, a2);
  __buf = *((_QWORD *)this + 6);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  v5 = *((_QWORD *)this + 7);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&v5, 4uLL);
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::write_((uint64_t)this + 64, a2);
  internal::marisa::grimoire::vector::Vector<unsigned int>::write_((uint64_t)this + 112, a2);
  return internal::marisa::grimoire::vector::Vector<unsigned int>::write_((uint64_t)this + 160, a2);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned long long>::write_(uint64_t a1, internal::marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = 8 * *(_QWORD *)(a1 + 24);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  internal::marisa::grimoire::io::Writer::write<unsigned long long>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return internal::marisa::grimoire::io::Writer::seek((uint64_t)this, 0);
}

uint64_t internal::marisa::grimoire::io::Writer::write<unsigned long long>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x200000021;
    v5 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:33: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x700000022;
    v5 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:34: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return internal::marisa::grimoire::io::Writer::write_data(a1, a2, 8 * a3);
}

uint64_t internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::write_(uint64_t a1, internal::marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = 12 * *(_QWORD *)(a1 + 24);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  internal::marisa::grimoire::io::Writer::write<internal::marisa::grimoire::vector::RankIndex>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return internal::marisa::grimoire::io::Writer::seek((uint64_t)this, 4 * (*(_DWORD *)(a1 + 24) & 1));
}

uint64_t internal::marisa::grimoire::io::Writer::write<internal::marisa::grimoire::vector::RankIndex>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x200000021;
    v5 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:33: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x700000022;
    v5 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:34: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return internal::marisa::grimoire::io::Writer::write_data(a1, a2, 12 * a3);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned int>::write_(uint64_t a1, internal::marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = 4 * *(_QWORD *)(a1 + 24);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  internal::marisa::grimoire::io::Writer::write<unsigned int>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return internal::marisa::grimoire::io::Writer::seek((uint64_t)this, 4 * (*(_DWORD *)(a1 + 24) & 1));
}

uint64_t internal::marisa::grimoire::io::Writer::write<unsigned int>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x200000021;
    v5 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:33: MARI"
         "SA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x700000022;
    v5 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h:34: MARI"
         "SA_SIZE_ERROR: num_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return internal::marisa::grimoire::io::Writer::write_data(a1, a2, 4 * a3);
}

uint64_t internal::marisa::grimoire::vector::FlatVector::write_(internal::marisa::grimoire::vector::FlatVector *this, internal::marisa::grimoire::io::Writer *a2)
{
  uint64_t __buf;

  internal::marisa::grimoire::vector::Vector<unsigned long long>::write_((uint64_t)this, a2);
  LODWORD(__buf) = *((_QWORD *)this + 6);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  LODWORD(__buf) = *((_DWORD *)this + 14);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  __buf = *((_QWORD *)this + 8);
  return internal::marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 8uLL);
}

_QWORD *std::string::__init_with_size[abi:ne180100]<std::reverse_iterator<std::__wrap_iter<char const*>>,std::reverse_iterator<std::__wrap_iter<char const*>>>(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v6 = result;
  if (a6 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a6 > 0x16)
  {
    v10 = (a6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a6 | 7) != 0x17)
      v10 = a6 | 7;
    v11 = v10 + 1;
    result = operator new(v10 + 1);
    v6[1] = a6;
    v6[2] = v11 | 0x8000000000000000;
    *v6 = result;
    v6 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a6;
  }
  while (a3 != a5)
  {
    v12 = *(_BYTE *)--a3;
    *(_BYTE *)v6 = v12;
    v6 = (_QWORD *)((char *)v6 + 1);
  }
  *(_BYTE *)v6 = 0;
  return result;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

char *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::realloc(uint64_t *a1, uint64_t a2)
{
  char *result;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  int v8;
  uint64_t v9;

  result = (char *)operator new[](24 * a2, MEMORY[0x1E0DE4E10]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (_DWORD *)(a1[1] + 16);
    v7 = result + 16;
    do
    {
      *((_QWORD *)v7 - 2) = *((_QWORD *)v6 - 2);
      *(v7 - 2) = *(v6 - 2);
      *(v7 - 1) = *(v6 - 1);
      v8 = *v6;
      v6 += 6;
      *v7 = v8;
      v7 += 6;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x18D7921C8);
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_current_trie<internal::marisa::grimoire::trie::Key>(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  __n128 v34;
  uint64_t v35;
  __n128 *v36;
  unint64_t v37;
  __n128 *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unsigned int *v43;
  uint64_t *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int32 *v57;
  float v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float *v63;
  float v64;
  uint64_t v65;
  _DWORD *v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  uint64_t result;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  __n128 v78;
  int v79;
  __int128 v80;
  uint64_t v81[4];
  _OWORD v82[2];
  __int128 v83;
  _OWORD v84[4];

  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 8);
  if (v9)
  {
    v11 = 0;
    v12 = (_DWORD *)(v10 + 16);
    do
    {
      *v12 = v11;
      v12 += 6;
      ++v11;
    }
    while (v9 != v11);
  }
  v13 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v10, v10 + 24 * v9, 0);
  v14 = 256;
  if (a5 != 1)
    v14 = 1;
  do
  {
    v15 = v14;
    v14 *= 2;
  }
  while (v15 < v13 / *(unsigned int *)(a4 + 8));
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::resize(a1 + 126, v15);
  a1[132] = v15 - 1;
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 1);
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
  v16 = a1 + 78;
  LOBYTE(v84[0]) = 0;
  internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(a1 + 78, v84);
  v77 = a1 + 52;
  internal::marisa::grimoire::vector::BitVector::push_back(a1 + 52, 0);
  v72 = a5;
  memset(v84, 0, 41);
  v83 = 0u;
  memset(v82, 0, sizeof(v82));
  v80 = 0u;
  memset(v81, 0, 25);
  v78.n128_u64[0] = *(_QWORD *)(a2 + 24) << 32;
  v78.n128_u32[2] = 0;
  std::deque<internal::marisa::grimoire::trie::Range>::push_back(v82, (uint64_t *)&v78);
  v17 = *((_QWORD *)&v83 + 1);
  if (*((_QWORD *)&v83 + 1))
  {
    v73 = a1 + 78;
    do
    {
      v18 = a1[58];
      v19 = (unsigned int *)(*(_QWORD *)(*((_QWORD *)&v82[0] + 1) + 8 * ((unint64_t)v83 / 0x155))
                           + 12 * ((unint64_t)v83 % 0x155));
      v20 = *v19;
      v21 = v19[1];
      v22 = v19[2];
      *(_QWORD *)&v83 = v83 + 1;
      *((_QWORD *)&v83 + 1) = v17 - 1;
      if ((unint64_t)v83 >= 0x2AA)
      {
        v23 = v18;
        operator delete(**((void ***)&v82[0] + 1));
        v18 = v23;
        *((_QWORD *)&v82[0] + 1) += 8;
        *(_QWORD *)&v83 = v83 - 341;
      }
      v76 = v17;
      v24 = v18 - v17;
      if (v20 < v21)
      {
        while (1)
        {
          v25 = *(_QWORD *)(a2 + 8);
          if (*(_DWORD *)(v25 + 24 * v20 + 8) != (_DWORD)v22)
            break;
          *(_DWORD *)(v25 + 24 * v20 + 12) = v24;
          v20 = (v20 + 1);
          if ((_DWORD)v21 == (_DWORD)v20)
            goto LABEL_49;
        }
      }
      if ((_DWORD)v20 != (_DWORD)v21)
      {
        v75 = v18;
        v26 = v80;
        v80 = 0u;
        memset(v81, 0, 25);
        if (v26)
          MEMORY[0x18D7921C8](v26, 0x1000C8077774924);
        v27 = *(_QWORD *)(a2 + 8);
        v28 = *(float *)(v27 + 24 * v20 + 12);
        v29 = v20 + 1;
        if (v20 + 1 < v21)
        {
          v30 = 24 * v20;
          v31 = (v20 << 32) + 0x100000000;
          do
          {
            if (*(unsigned __int8 *)(*(_QWORD *)(v27 + v30) + v22) != *(unsigned __int8 *)(*(_QWORD *)(v27 + v30 + 24)
                                                                                          + v22))
            {
              *(float *)&v32 = v28;
              v78.n128_u64[0] = v31 + v20;
              v78.n128_u64[1] = v22 | ((unint64_t)v32 << 32);
              internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
              v27 = *(_QWORD *)(a2 + 8);
              v28 = 0.0;
              LODWORD(v20) = v29;
            }
            v28 = v28 + *(float *)(v27 + v30 + 36);
            ++v29;
            v30 += 24;
            v31 += 0x100000000;
          }
          while (v21 != v29);
        }
        *(float *)&v33 = v28;
        v78.n128_u32[0] = v20;
        v78.n128_u32[1] = v21;
        v78.n128_u64[1] = v22 | ((unint64_t)v33 << 32);
        v34 = internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
        v16 = a1 + 78;
        v35 = v75;
        if (*(_DWORD *)(a4 + 16) == 0x20000)
        {
          v36 = (__n128 *)*((_QWORD *)&v80 + 1);
          v37 = v81[1];
          if (v81[1] < 129)
          {
            v38 = 0;
            v40 = 0;
          }
          else
          {
            v38 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<internal::marisa::grimoire::trie::WeightedRange>(v81[1]);
            v40 = v39;
          }
          std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(v36, &v36[v37], (uint64_t)&v78, v37, v38, v40, v34);
          if (v38)
            operator delete(v38);
          v35 = v75;
        }
        v41 = v81[1];
        if (v35 == v76)
          a1[133] = v81[1];
        if (v41)
        {
          v42 = 0;
          do
          {
            v43 = (unsigned int *)(*((_QWORD *)&v80 + 1) + 16 * v42);
            v44 = (uint64_t *)v43;
            v45 = v43[2];
            v46 = *v43;
            v47 = *(_QWORD *)(a2 + 8);
            v48 = *(unsigned int *)(v47 + 24 * *v43 + 8);
            v49 = v45 + 1;
            if (v45 + 1 >= v48)
            {
              v50 = v43[2];
              LODWORD(v48) = v45 + 1;
            }
            else
            {
              v50 = v48 - 1;
              v51 = v43[2];
              do
              {
                v52 = v51;
                v51 = v49;
                v53 = (uint64_t *)(v47 + 24 * v46);
                v54 = *v43;
                while (++v54 < (unint64_t)v43[1])
                {
                  v55 = *v53;
                  v56 = v53[3];
                  v53 += 3;
                  if (*(unsigned __int8 *)(v55 + v51) != *(unsigned __int8 *)(v56 + v51))
                  {
                    v50 = v52;
                    LODWORD(v48) = v51;
                    goto LABEL_43;
                  }
                }
                v49 = v51 + 1;
              }
              while (v51 + 1 != v48);
            }
LABEL_43:
            v58 = *((float *)v43 + 3);
            v57 = v43 + 3;
            v59 = v58;
            v60 = ((32 * v24) ^ v24 ^ *(unsigned __int8 *)(*(_QWORD *)(v47 + 24 * v46) + v45)) & a1[132];
            v61 = a1[127];
            v62 = v61 + 12 * v60;
            v64 = *(float *)(v62 + 8);
            v63 = (float *)(v62 + 8);
            if (v64 < v59)
            {
              v65 = a1[81];
              v66 = (_DWORD *)(v61 + 12 * v60);
              *v66 = v24;
              v66[1] = v65;
              *v63 = v59;
              v45 = *((unsigned int *)v44 + 2);
            }
            if (v50 == v45)
            {
              v78.n128_u8[0] = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 24 * *(unsigned int *)v44) + v50);
              internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(v73, &v78);
              internal::marisa::grimoire::vector::BitVector::push_back(v77, 0);
            }
            else
            {
              v78.n128_u8[0] = 0;
              internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(v73, &v78);
              internal::marisa::grimoire::vector::BitVector::push_back(v77, 1);
              v78 = 0uLL;
              v79 = 0;
              v67 = *((unsigned int *)v44 + 2);
              v78.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(a2 + 8) + 24 * *(unsigned int *)v44) + v67;
              v78.n128_u64[1] = (v48 - v67);
              v78.n128_u32[3] = *v57;
              internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::push_back((uint64_t *)v84, (uint64_t)&v78);
            }
            *((_DWORD *)v44 + 2) = v48;
            std::deque<internal::marisa::grimoire::trie::Range>::push_back(v82, v44);
            internal::marisa::grimoire::vector::BitVector::push_back(a1, 1);
            ++v42;
          }
          while (v42 < v81[1]);
        }
      }
LABEL_49:
      internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
      v17 = *((_QWORD *)&v83 + 1);
    }
    while (*((_QWORD *)&v83 + 1));
  }
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)a1, v72 == 1, 1);
  internal::marisa::grimoire::vector::Vector<unsigned char>::shrink(v16);
  internal::marisa::grimoire::trie::LoudsTrie::build_terminals<internal::marisa::grimoire::trie::Key>((uint64_t)a1, a2, a3);
  v68 = *(_OWORD *)a2;
  *(_OWORD *)a2 = v84[0];
  v84[0] = v68;
  v69 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = *(_QWORD *)&v84[1];
  *(_QWORD *)&v84[1] = v69;
  v70 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)((char *)&v84[1] + 8);
  *(_OWORD *)((char *)&v84[1] + 8) = v70;
  LOBYTE(v69) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a2 + 40) = BYTE8(v84[2]);
  BYTE8(v84[2]) = v69;
  if ((_QWORD)v80)
    MEMORY[0x18D7921C8](v80, 0x1000C8077774924);
  std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100](v82);
  result = *(_QWORD *)&v84[0];
  if (*(_QWORD *)&v84[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v84[0], 0x1000C8077774924);
  return result;
}

void sub_18D728B00(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, ...)
{
  uint64_t v18;
  uint64_t v21;
  _QWORD *exception;
  va_list va;

  va_start(va, a18);
  if (a13)
    MEMORY[0x18D7921C8](a13, 0x1000C8077774924);
  std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100]((uint64_t *)va);
  v21 = *(_QWORD *)(v18 - 144);
  if (v21)
    MEMORY[0x18D7921C8](v21, 0x1000C8077774924);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
    exception[2] = 0x8000001D3;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds"
                   "-trie.cc:467: MARISA_MEMORY_ERROR: std::bad_alloc";
  }
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::vector::FlatVector::build(__int128 *a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _OWORD v9[3];
  uint64_t v10;
  int v11;
  uint64_t v12;

  memset(v9, 0, 41);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  internal::marisa::grimoire::vector::FlatVector::build_((uint64_t)v9, a2);
  v3 = *a1;
  *a1 = v9[0];
  v9[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v9[1];
  *(_QWORD *)&v9[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  v6 = *((_QWORD *)a1 + 6);
  *((_QWORD *)a1 + 6) = v10;
  v10 = v6;
  LODWORD(v6) = *((_DWORD *)a1 + 14);
  *((_DWORD *)a1 + 14) = v11;
  v11 = v6;
  v7 = *((_QWORD *)a1 + 8);
  *((_QWORD *)a1 + 8) = v12;
  result = v3;
  v12 = v7;
  if ((_QWORD)v3)
    return MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  return result;
}

void sub_18D728CD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(uint64_t *result, _BYTE *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  size_t v8;

  v3 = result;
  v4 = result[3];
  v5 = result[4];
  v6 = v4 + 1;
  if (v5 < (unint64_t)(v4 + 1))
  {
    v7 = 2 * v5;
    if (v5 < 0)
      v7 = -1;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    result = (uint64_t *)internal::marisa::grimoire::vector::Vector<unsigned char>::realloc(result, v8);
    v4 = v3[3];
  }
  *(_BYTE *)(v3[1] + v4) = *a2;
  ++v3[3];
  return result;
}

__n128 internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back(uint64_t *a1, __n128 *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 result;

  v4 = a1[3];
  v5 = a1[4];
  v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    v7 = 2 * v5;
    if (v5 >> 59)
      v7 = 0xFFFFFFFFFFFFFFFLL;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::realloc(a1, v8);
    v4 = a1[3];
  }
  result = *a2;
  *(__n128 *)(a1[1] + 16 * v4) = *a2;
  ++a1[3];
  return result;
}

uint64_t *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::push_back(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = result;
  v4 = result[3];
  v5 = result[4];
  v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    v7 = 2 * v5;
    if (v5 > 0x555555555555555)
      v7 = 0xAAAAAAAAAAAAAAALL;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    result = (uint64_t *)internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::realloc(result, v8);
    v4 = v3[3];
  }
  v9 = v3[1] + 24 * v4;
  *(_QWORD *)v9 = *(_QWORD *)a2;
  *(_DWORD *)(v9 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(v9 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(v9 + 16) = *(_DWORD *)(a2 + 16);
  ++v3[3];
  return result;
}

_BYTE *internal::marisa::grimoire::vector::Vector<unsigned char>::shrink(_BYTE *result)
{
  size_t v1;
  _QWORD *exception;

  if (result[40])
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x100000072;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:114: MARISA_STATE_ERROR: fixed_";
  }
  v1 = *((_QWORD *)result + 3);
  if (v1 != *((_QWORD *)result + 4))
    return internal::marisa::grimoire::vector::Vector<unsigned char>::realloc((uint64_t *)result, v1);
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_terminals<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t result;
  _OWORD v13[3];

  memset(v13, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)v13, *(_QWORD *)(a2 + 24));
  v5 = *(_QWORD *)(a2 + 24);
  if (v5)
  {
    v6 = *((_QWORD *)&v13[0] + 1);
    v7 = (unsigned int *)(*(_QWORD *)(a2 + 16) + 16);
    do
    {
      *(_DWORD *)(v6 + 4 * *v7) = *(v7 - 1);
      v7 += 6;
      --v5;
    }
    while (v5);
  }
  else
  {
    v6 = *((_QWORD *)&v13[0] + 1);
  }
  v8 = *a3;
  v9 = *(_QWORD *)&v13[1];
  *(_QWORD *)a3 = *(_QWORD *)&v13[0];
  *((_QWORD *)a3 + 1) = v6;
  v13[0] = v8;
  v10 = *((_QWORD *)a3 + 2);
  *((_QWORD *)a3 + 2) = v9;
  *(_QWORD *)&v13[1] = v10;
  v11 = *(__int128 *)((char *)a3 + 24);
  *(__int128 *)((char *)a3 + 24) = *(_OWORD *)((char *)&v13[1] + 8);
  *(_OWORD *)((char *)&v13[1] + 8) = v11;
  LOBYTE(v10) = *((_BYTE *)a3 + 40);
  *((_BYTE *)a3 + 40) = BYTE8(v13[2]);
  result = v8;
  BYTE8(v13[2]) = v10;
  if ((_QWORD)v8)
    return MEMORY[0x18D7921C8](v8, 0x1000C8077774924);
  return result;
}

void sub_18D728FB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;

  v4 = a2;
  v5 = a1;
  v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 241)
  {
    v7 = 0;
    goto LABEL_69;
  }
  v7 = 0;
  do
  {
    v8 = internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::Key>(v5, v5 + 24 * (v6 / 0x30uLL), v4 - 24, a3);
    v9 = v8;
    v10 = v5;
    v11 = v4;
    v12 = v5;
    v13 = v4;
    while (v10 < v11)
    {
      v14 = *(unsigned int *)(v10 + 8);
      v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(_QWORD *)v10 + a3);
      if (v15 > v8)
        break;
      if (v15 == v8)
      {
        v16 = *(_QWORD *)v10;
        *(_QWORD *)v10 = *(_QWORD *)v12;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v12 + 8);
        v17 = *(_QWORD *)(v10 + 12);
        *(_DWORD *)(v10 + 12) = *(_DWORD *)(v12 + 12);
        *(_DWORD *)(v10 + 16) = *(_DWORD *)(v12 + 16);
        *(_QWORD *)v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(_QWORD *)(v12 + 12) = v17;
        v12 += 24;
      }
LABEL_11:
      v10 += 24;
    }
    if (v10 < v11)
    {
      v18 = v11 - 24;
      do
      {
        v11 = v18;
        v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19)
          v20 = -1;
        else
          v20 = *(unsigned __int8 *)(*(_QWORD *)v11 + a3);
        if (v20 < v8)
          break;
        if (v20 == v8)
        {
          v21 = *(_QWORD *)(v13 - 24);
          v13 -= 24;
          v22 = *(_QWORD *)v11;
          *(_QWORD *)v11 = v21;
          *(_DWORD *)(v11 + 8) = *(_DWORD *)(v13 + 8);
          v23 = *(_QWORD *)(v11 + 12);
          *(_DWORD *)(v11 + 12) = *(_DWORD *)(v13 + 12);
          *(_DWORD *)(v11 + 16) = *(_DWORD *)(v13 + 16);
          *(_QWORD *)v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(_QWORD *)(v13 + 12) = v23;
        }
        v18 = v11 - 24;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      v24 = *(_QWORD *)v10;
      v25 = *(_DWORD *)(v10 + 16);
      *(_QWORD *)v10 = *(_QWORD *)v11;
      v26 = *(_QWORD *)(v10 + 8);
      *(_DWORD *)(v10 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v10 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v10 + 16) = *(_DWORD *)(v11 + 16);
      *(_QWORD *)v11 = v24;
      *(_QWORD *)(v11 + 8) = v26;
      *(_DWORD *)(v11 + 16) = v25;
      goto LABEL_11;
    }
    v44 = v7;
    if (v12 > v5)
    {
      v27 = 0;
      do
      {
        v28 = v12 + v27;
        v29 = v10 + v27;
        v30 = *(_QWORD *)(v12 + v27 - 24);
        v31 = *(_DWORD *)(v12 + v27 - 8);
        *(_QWORD *)(v28 - 24) = *(_QWORD *)(v10 + v27 - 24);
        v32 = *(_QWORD *)(v12 + v27 - 16);
        *(_DWORD *)(v28 - 16) = *(_DWORD *)(v10 + v27 - 16);
        *(_DWORD *)(v28 - 12) = *(_DWORD *)(v10 + v27 - 12);
        *(_DWORD *)(v28 - 8) = *(_DWORD *)(v10 + v27 - 8);
        *(_QWORD *)(v29 - 24) = v30;
        *(_QWORD *)(v29 - 16) = v32;
        *(_DWORD *)(v29 - 8) = v31;
        v27 -= 24;
      }
      while (v12 + v27 > v5);
      v10 += v27;
    }
    while (v13 < v4)
    {
      v33 = *(_QWORD *)v13;
      v34 = *(_DWORD *)(v13 + 16);
      *(_QWORD *)v13 = *(_QWORD *)v11;
      v35 = *(_QWORD *)(v13 + 8);
      *(_DWORD *)(v13 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v13 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v13 + 16) = *(_DWORD *)(v11 + 16);
      *(_QWORD *)v11 = v33;
      *(_QWORD *)(v11 + 8) = v35;
      *(_DWORD *)(v11 + 16) = v34;
      v11 += 24;
      v13 += 24;
    }
    v36 = v10 - v5;
    v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v5) >> 3);
    v38 = v11 - v10;
    v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v10) >> 3);
    if (v37 <= v39)
    {
      v40 = v4 - v11;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)) <= v39)
      {
        if (v36 == 24)
        {
          v41 = v44 + 1;
        }
        else
        {
          if (v36 < 25)
            goto LABEL_53;
          v41 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v5, v10, a3)+ v44;
        }
        v44 = v41;
LABEL_53:
        if (v40 == 24)
        {
          v7 = v44 + 1;
        }
        else if (v40 < 25)
        {
          v7 = v44;
        }
        else
        {
          v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v11, v4, a3)+ v44;
        }
        if (v38 == 24)
        {
          ++v7;
        }
        else if (v38 >= 25)
        {
          if (v9 == -1)
          {
            ++v7;
            v5 = v11;
            goto LABEL_64;
          }
          ++a3;
        }
        v5 = v10;
LABEL_64:
        v4 = v11;
        goto LABEL_65;
      }
    }
    if (v38 == 24)
      goto LABEL_32;
    if (v38 < 25)
    {
      v7 = v44;
    }
    else if (v8 == -1)
    {
LABEL_32:
      v7 = v44 + 1;
    }
    else
    {
      v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v10, v11, a3 + 1)+ v44;
    }
    v42 = v4 - v11;
    if (v37 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)))
    {
      if (v42 == 24)
      {
        ++v7;
      }
      else if (v42 >= 25)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v11, v4, a3);
      }
      v4 = v10;
    }
    else
    {
      if (v36 == 24)
      {
        ++v7;
      }
      else if (v36 >= 25)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Key *>(v5, v10, a3);
      }
      v5 = v11;
    }
LABEL_65:
    v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 240);
LABEL_69:
  if (v6 >= 25)
    v7 += internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::Key *>(v5, v4, a3);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;

  if (*(unsigned int *)(a1 + 8) <= a4)
    v4 = -1;
  else
    v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + a4);
  if (*(unsigned int *)(a2 + 8) <= a4)
    v5 = -1;
  else
    v5 = *(unsigned __int8 *)(*(_QWORD *)a2 + a4);
  if (*(unsigned int *)(a3 + 8) <= a4)
    v6 = -1;
  else
    v6 = *(unsigned __int8 *)(*(_QWORD *)a3 + a4);
  if (v4 <= v5)
    v7 = v5;
  else
    v7 = v4;
  if (v4 >= v5)
    v4 = v5;
  if (v4 <= v6)
    v4 = v6;
  if (v7 >= v6)
    return v4;
  else
    return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::Key *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1 + 24;
  if (a1 + 24 >= a2)
    return 1;
  v7 = 1;
  do
  {
    v8 = v3;
    if (v3 <= a1)
    {
      v10 = 0;
    }
    else
    {
      while (1)
      {
        v9 = v8 - 24;
        v10 = internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::Key>(v8 - 24, v8, a3);
        if (v10 < 1)
          break;
        v11 = *(_QWORD *)(v8 - 24);
        v12 = *(_DWORD *)(v8 - 8);
        *(_QWORD *)(v8 - 24) = *(_QWORD *)v8;
        v13 = *(_QWORD *)(v8 + 8);
        *(_DWORD *)(v8 - 8) = *(_DWORD *)(v8 + 16);
        *(_QWORD *)v8 = v11;
        v14 = *(_QWORD *)(v8 - 16);
        *(_QWORD *)(v8 - 16) = v13;
        *(_QWORD *)(v8 + 8) = v14;
        *(_DWORD *)(v8 + 16) = v12;
        v8 -= 24;
        if (v9 <= a1)
        {
          v10 = 1;
          break;
        }
      }
    }
    if (v10)
      ++v7;
    v3 += 24;
  }
  while (v3 < a2);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  uint64_t result;
  unsigned int v12;

  v3 = *(unsigned int *)(a1 + 8);
  v4 = *(unsigned int *)(a2 + 8);
  v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4)
      v12 = -1;
    else
      v12 = 1;
    if ((_DWORD)v3 == (_DWORD)v4)
      return 0;
    else
      return v12;
  }
  else
  {
    v6 = v4 - a3;
    v7 = (unsigned __int8 *)(*(_QWORD *)a1 + a3);
    v8 = (unsigned __int8 *)(*(_QWORD *)a2 + a3);
    while (v6)
    {
      v9 = *v7;
      v10 = *v8;
      result = (v9 - v10);
      if (v9 != v10)
        return result;
      --v6;
      ++v7;
      ++v8;
      if (!--v5)
        goto LABEL_6;
    }
    return 1;
  }
}

_BYTE *internal::marisa::grimoire::vector::Vector<unsigned char>::realloc(uint64_t *a1, size_t __sz)
{
  _BYTE *result;
  uint64_t v5;
  char *v6;
  _BYTE *v7;
  char v8;
  uint64_t v9;

  result = operator new[](__sz, MEMORY[0x1E0DE4E10]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (char *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = __sz;
  if (v9)
    JUMPOUT(0x18D7921C8);
  return result;
}

void std::deque<internal::marisa::grimoire::trie::Range>::push_back(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 341 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<internal::marisa::grimoire::trie::Range>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x155)) + 12 * (v7 % 0x155);
  v9 = *a2;
  *(_DWORD *)(v8 + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)v8 = v9;
  ++a1[5];
}

void std::deque<internal::marisa::grimoire::trie::Range>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x155;
  v4 = v2 - 341;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFFCuLL);
      std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFFCuLL);
    std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFFCuLL);
  std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_18D729A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<internal::marisa::grimoire::trie::Range *>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

_OWORD *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::realloc(uint64_t *a1, uint64_t a2)
{
  _OWORD *result;
  uint64_t v5;
  __int128 *v6;
  _OWORD *v7;
  __int128 v8;
  uint64_t v9;

  result = operator new[](16 * a2, MEMORY[0x1E0DE4E10]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (__int128 *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x18D7921C8);
  return result;
}

void *std::get_temporary_buffer[abi:ne180100]<internal::marisa::grimoire::trie::WeightedRange>(uint64_t a1)
{
  unint64_t v1;
  const std::nothrow_t *v2;
  void *result;
  BOOL v4;

  if (a1 < 1)
    return 0;
  if (a1 >= 0x7FFFFFFFFFFFFFFLL)
    v1 = 0x7FFFFFFFFFFFFFFLL;
  else
    v1 = a1;
  v2 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
  while (1)
  {
    result = operator new(16 * v1, v2);
    if (result)
      break;
    v4 = v1 > 1;
    v1 >>= 1;
    if (!v4)
      return 0;
  }
  return result;
}

double std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4, __n128 *a5, uint64_t a6, __n128 a7)
{
  unint64_t v13;
  __n128 *v14;
  unint64_t v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;

  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      a7.n128_u32[0] = a2[-1].n128_u32[3];
      if (a7.n128_f32[0] > a1->n128_f32[3])
      {
        a7 = *a1;
        *a1 = a2[-1];
        a2[-1] = a7;
      }
    }
    else if ((uint64_t)a4 > 128)
    {
      v13 = a4 >> 1;
      v14 = &a1[a4 >> 1];
      v15 = a4 >> 1;
      if ((uint64_t)a4 <= a6)
      {
        v17.n128_f64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, v14, a3, v15, a5, a7);
        v18.n128_f64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[v13], v17);
        a7.n128_u64[0] = std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*>(a5, &a5[v13], &a5[v13], &a5[a4], a1, v18).n128_u64[0];
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, v14, a3, v15, a5, a6);
        std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), a5, a6);
        a7.n128_u64[0] = std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>((__int128 *)a1, (__int128 *)&a1[a4 >> 1], (__int128 *)a2, a3, a4 >> 1, a4 - (a4 >> 1), (char *)a5, a6, v16).n128_u64[0];
      }
    }
    else
    {
      std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>((uint64_t)a1, (uint64_t)a2);
    }
  }
  return a7.n128_f64[0];
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  if (result != a2)
  {
    v2 = result + 16;
    if (result + 16 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = *(float *)(v4 + 28);
        v6 = *(float *)(v4 + 12);
        v4 = v2;
        if (v5 > v6)
        {
          v10 = *(_QWORD *)v2;
          v11 = *(_DWORD *)(v2 + 8);
          v7 = v3;
          while (1)
          {
            *(_OWORD *)(result + v7 + 16) = *(_OWORD *)(result + v7);
            if (!v7)
              break;
            v8 = *(float *)(result + v7 - 4);
            v7 -= 16;
            if (v5 <= v8)
            {
              v9 = result + v7 + 16;
              goto LABEL_10;
            }
          }
          v9 = result;
LABEL_10:
          *(_QWORD *)v9 = v10;
          *(_DWORD *)(v9 + 8) = v11;
          *(float *)(v9 + 12) = v5;
        }
        v2 = v4 + 16;
        v3 += 16;
      }
      while (v4 + 16 != a2);
    }
  }
  return result;
}

double std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4, __n128 *a5, __n128 a6)
{
  __n128 *v10;
  __n128 v12;

  if (a4)
  {
    if (a4 == 2)
    {
      v10 = a2 - 1;
      if (a2[-1].n128_f32[3] <= a1->n128_f32[3])
      {
        *a5 = *a1;
        a6 = *v10;
      }
      else
      {
        *a5 = *v10;
        a6 = *a1;
      }
      a5[1] = a6;
    }
    else if (a4 == 1)
    {
      a6 = *a1;
      *a5 = *a1;
    }
    else if ((uint64_t)a4 > 8)
    {
      std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, &a1[a4 >> 1], a3, a4 >> 1, a5, a4 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[a4 >> 1], a4 - (a4 >> 1));
      a6.n128_u64[0] = std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*>(a1, &a1[a4 >> 1], &a1[a4 >> 1], a2, a5, v12).n128_u64[0];
    }
    else
    {
      a6.n128_u64[0] = std::__insertion_sort_move[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, a2, a5).n128_u64[0];
    }
  }
  return a6.n128_f64[0];
}

__n128 std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*,internal::marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, __n128 result)
{
  __n128 v6;
  __n128 v7;
  __n128 v8;
  uint64_t v9;

  while (1)
  {
    if (a1 == a2)
    {
      while (a3 != a4)
      {
        v8 = *a3++;
        result.n128_u64[0] = v8.n128_u64[0];
        *a5++ = v8;
      }
      return result;
    }
    if (a3 == a4)
      break;
    if (a3->n128_f32[3] <= a1->n128_f32[3])
    {
      v7 = *a1++;
      result = v7;
    }
    else
    {
      v6 = *a3++;
      result = v6;
    }
    *a5++ = result;
  }
  if (a1 != a2)
  {
    v9 = 0;
    do
    {
      result = a1[v9];
      a5[v9++] = result;
    }
    while (&a1[v9] != a2);
  }
  return result;
}

__n128 std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8, __n128 result)
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  unint64_t v21;
  unint64_t v22;
  __int128 *v23;
  float v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  __int128 *v29;
  float v30;
  __int128 *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  __int128 *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 *v39;
  uint64_t v40;
  __n128 v43;

  if (a6)
  {
    v10 = a6;
    do
    {
      if (v10 <= a8 || a5 <= a8)
      {
        std::__buffered_inplace_merge[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(a1, a2, a3, a4, a5, v10, a7);
        return result;
      }
      if (!a5)
        return result;
      v12 = 0;
      result.n128_u32[0] = *((_DWORD *)a2 + 3);
      v13 = -a5;
      while (1)
      {
        v14 = &a1[v12];
        if (result.n128_f32[0] > *((float *)&a1[v12] + 3))
          break;
        ++v12;
        if (__CFADD__(v13++, 1))
          return result;
      }
      v16 = -v13;
      v39 = a3;
      v40 = a8;
      if (-v13 >= v10)
      {
        if (v13 == -1)
        {
          v43 = (__n128)a1[v12];
          a1[v12] = *a2;
          result = v43;
          *a2 = (__int128)v43;
          return result;
        }
        if (v13 > 0)
          v16 = 1 - v13;
        v26 = v16 >> 1;
        v20 = &a1[(v16 >> 1) + v12];
        v19 = a3;
        if (a3 != a2)
        {
          v27 = a3 - a2;
          v19 = a2;
          do
          {
            v28 = v27 >> 1;
            v29 = &v19[v27 >> 1];
            v30 = *((float *)v29 + 3);
            v31 = v29 + 1;
            v27 += ~(v27 >> 1);
            if (v30 > *((float *)v20 + 3))
              v19 = v31;
            else
              v27 = v28;
          }
          while (v27);
        }
        v18 = v19 - a2;
      }
      else
      {
        if (v10 >= 0)
          v17 = v10;
        else
          v17 = v10 + 1;
        v18 = v17 >> 1;
        v19 = &a2[v17 >> 1];
        v20 = a2;
        if (v14 != a2)
        {
          v21 = ((char *)a2 - (char *)a1 - v12 * 16) >> 4;
          v20 = &a1[v12];
          do
          {
            v22 = v21 >> 1;
            v23 = &v20[v21 >> 1];
            v24 = *((float *)v23 + 3);
            v25 = v23 + 1;
            v21 += ~(v21 >> 1);
            if (*((float *)v19 + 3) > v24)
              v21 = v22;
            else
              v20 = v25;
          }
          while (v21);
        }
        v26 = ((char *)v20 - (char *)a1 - v12 * 16) >> 4;
      }
      a5 = -(v26 + v13);
      v32 = v10 - v18;
      v33 = v18;
      v34 = std::__rotate[abi:ne180100]<std::_ClassicAlgPolicy,internal::marisa::grimoire::trie::WeightedRange *,internal::marisa::grimoire::trie::WeightedRange *>((char *)v20, (char *)a2, (char *)v19);
      v35 = v33;
      v36 = (__int128 *)v34;
      if (v26 + v35 >= v10 - (v26 + v35) - v13)
      {
        v38 = v35;
        std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(v34, v19, v39, a4, a5, v32, a7, v40);
        v19 = v20;
        v32 = v38;
        a5 = v26;
        a8 = v40;
        a3 = v36;
      }
      else
      {
        v37 = v26;
        a8 = v40;
        std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(v14, v20, v34, a4, v37, v35, a7, v40);
        v14 = v36;
        a3 = v39;
      }
      v10 = v32;
      a1 = v14;
      a2 = v19;
    }
    while (v32);
  }
  return result;
}

__n128 std::__insertion_sort_move[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, __n128 *a3)
{
  __n128 result;
  __n128 *v4;
  uint64_t v5;
  __n128 *v6;
  __n128 *v7;
  __n128 *v8;
  __n128 *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    result = *a1;
    *a3 = *a1;
    v4 = a1 + 1;
    if (&a1[1] != a2)
    {
      v5 = 0;
      v6 = a3;
      do
      {
        v7 = a1;
        v8 = v6;
        a1 = v4;
        v9 = ++v6;
        if (v7[1].n128_f32[3] > v8->n128_f32[3])
        {
          *v6 = *v8;
          v9 = a3;
          if (v8 != a3)
          {
            v10 = v5;
            while (1)
            {
              v9 = (__n128 *)((char *)a3 + v10);
              if (v7[1].n128_f32[3] <= *(float *)((char *)&a3->n128_f32[-1] + v10))
                break;
              *v9 = v9[-1];
              v10 -= 16;
              if (!v10)
              {
                v9 = a3;
                break;
              }
            }
          }
        }
        result = *a1;
        *v9 = *a1;
        v4 = a1 + 1;
        v5 += 16;
      }
      while (&a1[1] != a2);
    }
  }
  return result;
}

__int128 *std::__buffered_inplace_merge[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(__int128 *result, __int128 *a2, __int128 *a3, int a4, uint64_t a5, uint64_t a6, char *__src)
{
  uint64_t v7;
  float *v8;
  __int128 *v9;
  float v10;
  float v11;
  char *v12;
  unint64_t v13;
  float *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;

  if (a5 <= a6)
  {
    if (result != a2)
    {
      v13 = 0;
      do
      {
        *(_OWORD *)&__src[v13] = result[v13 / 0x10];
        v13 += 16;
      }
      while (&result[v13 / 0x10] != a2);
      if (v13)
      {
        v14 = (float *)__src;
        while (a2 != a3)
        {
          if (*((float *)a2 + 3) <= v14[3])
          {
            v17 = *(_OWORD *)v14;
            v14 += 4;
            v16 = v17;
          }
          else
          {
            v15 = *a2++;
            v16 = v15;
          }
          *result++ = v16;
          if (&__src[v13] == (char *)v14)
            return result;
        }
        return (__int128 *)memmove(result, v14, __src - (char *)v14 + v13);
      }
    }
  }
  else if (a2 != a3)
  {
    v7 = 0;
    do
    {
      *(_OWORD *)&__src[v7 * 16] = a2[v7];
      ++v7;
    }
    while (&a2[v7] != a3);
    if (v7 * 16)
    {
      v8 = (float *)&__src[v7 * 16];
      v9 = a3 - 1;
      while (a2 != result)
      {
        v10 = *(v8 - 1);
        v11 = *((float *)a2 - 1);
        if (v10 <= v11)
          v12 = (char *)(v8 - 4);
        else
          v12 = (char *)(a2 - 1);
        if (v10 <= v11)
          v8 -= 4;
        else
          --a2;
        *v9-- = *(_OWORD *)v12;
        if (v8 == (float *)__src)
          return result;
      }
      v18 = 0;
      do
      {
        v9[v18 / 4] = *(_OWORD *)&v8[v18 - 4];
        v18 -= 4;
      }
      while (&v8[v18] != (float *)__src);
    }
  }
  return result;
}

char *std::__rotate[abi:ne180100]<std::_ClassicAlgPolicy,internal::marisa::grimoire::trie::WeightedRange *,internal::marisa::grimoire::trie::WeightedRange *>(char *__src, char *a2, char *a3)
{
  char *v4;
  int64_t v6;
  size_t v7;
  __int128 v9;
  __int128 v10;

  v4 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if (__src + 16 == a2)
    {
      v9 = *(_OWORD *)__src;
      v6 = a3 - a2;
      memmove(__src, a2, a3 - a2);
      v4 = &__src[v6];
      *(_OWORD *)v4 = v9;
    }
    else if (a2 + 16 == a3)
    {
      v4 = __src + 16;
      v10 = *((_OWORD *)a3 - 1);
      v7 = a3 - 16 - __src;
      if (a3 - 16 != __src)
        memmove(__src + 16, __src, v7);
      *(_OWORD *)__src = v10;
    }
    else
    {
      return (char *)std::__rotate_gcd[abi:ne180100]<std::_ClassicAlgPolicy,internal::marisa::grimoire::trie::WeightedRange *>(__src, a2, a3);
    }
  }
  return v4;
}

_OWORD *std::__rotate_gcd[abi:ne180100]<std::_ClassicAlgPolicy,internal::marisa::grimoire::trie::WeightedRange *>(_OWORD *a1, _OWORD *a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;
  _OWORD *v14;
  _OWORD *v15;
  _OWORD *v16;
  BOOL v17;
  char v18;
  uint64_t v19;

  v3 = a2 - a1;
  if (v3 == a3 - a2)
  {
    if (a1 != a2 && a2 != a3)
    {
      v4 = 0;
      do
      {
        v5 = a1[v4];
        a1[v4] = a2[v4];
        v6 = (uint64_t)&a1[v4 + 1];
        a2[v4] = v5;
        v7 = (uint64_t)&a2[++v4];
      }
      while ((_OWORD *)v6 != a2 && v7 != (_QWORD)a3);
    }
  }
  else
  {
    v9 = a3 - a2;
    v10 = a2 - a1;
    do
    {
      v11 = v10;
      v10 = v9;
      v9 = v11 % v9;
    }
    while (v9);
    if (v10)
    {
      v12 = &a1[v10];
      do
      {
        v13 = *--v12;
        v14 = &v12[v3];
        v15 = v12;
        do
        {
          v16 = v15;
          v15 = v14;
          *v16 = *v14;
          v17 = __OFSUB__(v3, a3 - v14);
          v19 = v3 - (a3 - v14);
          v18 = (v19 < 0) ^ v17;
          v14 = &a1[v19];
          if (v18)
            v14 = &v15[v3];
        }
        while (v14 != v12);
        *v15 = v13;
      }
      while (v12 != a1);
    }
    return &a1[a3 - a2];
  }
  return a2;
}

uint64_t std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 170;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 341;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<internal::marisa::grimoire::trie::Range *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<internal::marisa::grimoire::trie::Range *>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

uint64_t internal::marisa::grimoire::vector::FlatVector::build_(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;
  _BOOL8 v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;

  v4 = *(_QWORD *)(a2 + 24);
  if (!v4)
    goto LABEL_10;
  v5 = 0;
  v6 = *(unsigned int **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  do
  {
    v9 = *v6++;
    v8 = v9;
    if (v9 > v5)
      v5 = v8;
    --v7;
  }
  while (v7);
  if (v5)
  {
    v10 = 0;
    do
    {
      ++v10;
      v11 = v5 > 1;
      v5 >>= 1;
    }
    while (v11);
  }
  else
  {
LABEL_10:
    v10 = 0;
  }
  v12 = v4 != 0;
  v13 = (unint64_t)(v10 * v4 + 63) >> 6;
  if (v10)
    v14 = v13;
  else
    v14 = v12;
  result = (uint64_t)internal::marisa::grimoire::vector::Vector<unsigned long long>::resize((uint64_t *)a1, v14);
  if (v14)
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * *(_QWORD *)(a1 + 24) - 8) = 0;
  *(_QWORD *)(a1 + 48) = v10;
  if (v10)
    *(_DWORD *)(a1 + 56) = 0xFFFFFFFF >> -(char)v10;
  v16 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 64) = v16;
  if (v16)
  {
    v17 = 0;
    do
    {
      result = internal::marisa::grimoire::vector::FlatVector::set(a1, v17, *(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v17));
      ++v17;
    }
    while (v17 < *(_QWORD *)(a2 + 24));
  }
  return result;
}

uint64_t internal::marisa::grimoire::vector::FlatVector::set(uint64_t this, uint64_t a2, int a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *(_QWORD *)(this + 48);
  v4 = (unint64_t)(v3 * a2) >> 6;
  v5 = (v3 * a2) & 0x3F;
  v6 = *(unsigned int *)(this + 56);
  v7 = *(_QWORD *)(this + 8);
  v8 = v6 & a3;
  *(_QWORD *)(v7 + 8 * v4) = *(_QWORD *)(v7 + 8 * v4) & ~(v6 << (v3 * a2)) | (v8 << (v3 * a2));
  if ((unint64_t)(v5 + v3) >= 0x41)
    *(_QWORD *)(v7 + 8 * v4 + 8) = *(_QWORD *)(v7 + 8 * v4 + 8) & ~(v6 >> -(char)v5) | (v8 >> -(char)v5);
  return this;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int *v18;
  char v19;
  BOOL v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;

  v8 = (unsigned int *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = ((char *)a2 - (char *)v9) >> 3;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v21 = *(a2 - 2);
        v22 = *v9;
        if (v21 < *v9 || v22 >= v21 && *(a2 - 1) < v9[1])
        {
          *v9 = v21;
          *(a2 - 2) = v22;
          v23 = v9[1];
          v9[1] = *(a2 - 1);
          *(a2 - 1) = v23;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, v9 + 2, a2 - 2);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, v9 + 2, v9 + 4, a2 - 2);
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, v9 + 2, v9 + 4, v9 + 6, a2 - 2);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, a2);
          else
            return (uint64_t)std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[2 * (v13 >> 1)];
          if ((unint64_t)v12 < 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(&v9[2 * (v13 >> 1)], v9, a2 - 2);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, &v9[2 * (v13 >> 1)], a2 - 2);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9 + 2, v15 - 2, a2 - 4);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9 + 4, &v9[2 * v14 + 2], a2 - 6);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v15 - 2, v15, &v9[2 * v14 + 2]);
            v16 = *(_QWORD *)v9;
            *(_QWORD *)v9 = *(_QWORD *)v15;
            *(_QWORD *)v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(v9 - 2);
          if (v17 >= *v9 && (*v9 < v17 || *(v9 - 1) >= v9[1]))
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(v9, a2);
            v9 = (unsigned int *)result;
            goto LABEL_19;
          }
LABEL_14:
          v18 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(v9, a2);
          if ((v19 & 1) == 0)
            goto LABEL_17;
          v20 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, v18);
          v9 = v18 + 2;
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v18 + 2, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v20)
              continue;
LABEL_17:
            result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(v8, v18, a3, -v11, a5 & 1);
            v9 = v18 + 2;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v18;
          if (v20)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,std::pair<unsigned int,unsigned int> *>(v9, a2, a2, a3);
        return result;
    }
  }
}

unsigned int *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, unsigned int *a2)
{
  unsigned int *v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;

  if (result != a2)
  {
    v2 = result + 2;
    if (result + 2 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v6 = v5[2];
        v7 = *v5;
        if (v6 < *v5 || v7 >= v6 && v5[3] < v5[1])
        {
          v9 = v5[2];
          v8 = v5[3];
          v10 = v5[1];
          v5[2] = v7;
          v4[1] = v10;
          v11 = result;
          if (v5 != result)
          {
            v12 = v3;
            do
            {
              v13 = *(unsigned int *)((char *)result + v12 - 8);
              if (v13 <= v9)
              {
                if (v13 < v9)
                {
                  v11 = v5;
                  goto LABEL_17;
                }
                v11 = (unsigned int *)((char *)result + v12);
                v14 = *(unsigned int *)((char *)result + v12 - 4);
                if (v14 <= v8)
                  goto LABEL_17;
              }
              else
              {
                v14 = *(unsigned int *)((char *)result + v12 - 4);
              }
              v5 -= 2;
              v15 = (unsigned int *)((char *)result + v12);
              *v15 = v13;
              v15[1] = v14;
              v12 -= 8;
            }
            while (v12);
            v11 = result;
          }
LABEL_17:
          *v11 = v9;
          v11[1] = v8;
        }
        v2 = v4 + 2;
        v3 += 8;
      }
      while (v4 + 2 != a2);
    }
  }
  return result;
}

unsigned int *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, unsigned int *a2)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *i;
  unsigned int v10;

  if (result != a2)
  {
    v2 = result + 2;
    if (result + 2 != a2)
    {
      v3 = result + 1;
      do
      {
        v4 = result;
        result = v2;
        v5 = v4[2];
        v6 = *v4;
        if (v5 < *v4 || v6 >= v5 && v4[3] < v4[1])
        {
          v7 = *result;
          v8 = result[1];
          for (i = v3; ; i -= 2)
          {
            v10 = *i;
            i[1] = v6;
            i[2] = v10;
            v6 = *(i - 3);
            if (v6 <= v7 && (v6 < v7 || *(i - 2) <= v8))
              break;
          }
          *(i - 1) = v7;
          *i = v8;
        }
        v2 = result + 2;
        v3 += 2;
      }
      while (result + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int *v6;
  int *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v3 = *a2;
  v4 = *a1;
  if (*a2 >= *a1 && (v4 < v3 || a2[1] >= a1[1]))
  {
    v9 = *a3;
    if (*a3 >= v3 && (v3 < v9 || a3[1] >= a2[1]))
      return 0;
    *a2 = v9;
    *a3 = v3;
    v11 = (int *)(a2 + 1);
    v10 = a2[1];
    a2[1] = a3[1];
    a3[1] = v10;
    v12 = *a2;
    v13 = *a1;
    if (*a2 >= *a1 && (v13 < v12 || *v11 >= a1[1]))
      return 1;
    *a1 = v12;
    v6 = (int *)(a1 + 1);
    *a2 = v13;
    v8 = 2;
  }
  else
  {
    v5 = *a3;
    if (*a3 < v3 || v3 >= v5 && a3[1] < a2[1])
    {
      *a1 = v5;
      v6 = (int *)(a1 + 1);
      *a3 = v4;
      v7 = (int *)(a3 + 1);
      v8 = 1;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      v14 = a1[1];
      a1[1] = a2[1];
      a2[1] = v14;
      v15 = *a3;
      v16 = *a2;
      if (*a3 >= *a2 && (v16 < v15 || a3[1] >= v14))
        return 1;
      *a2 = v15;
      *a3 = v16;
      v7 = (int *)(a3 + 1);
      v8 = 2;
      v6 = (int *)(a2 + 1);
    }
    v11 = v7;
  }
  v17 = *v6;
  *v6 = *v11;
  *v11 = v17;
  return v8;
}

unsigned int *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(unsigned int *a1, unsigned int *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int *i;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;

  v3 = *a1;
  v2 = a1[1];
  v4 = *(a2 - 2);
  if (v4 <= *a1 && (v4 < v3 || *(a2 - 1) <= v2))
  {
    for (i = a1 + 2; i < a2 && *i <= v3 && (*i < v3 || i[1] <= v2); i += 2)
      ;
  }
  else
  {
    i = a1;
    do
    {
      v7 = i[2];
      i += 2;
      v6 = v7;
    }
    while (v7 <= v3 && (v6 < v3 || i[1] <= v2));
  }
  if (i < a2)
  {
    for (a2 -= 2; v4 > v3 || v4 >= v3 && a2[1] > v2; a2 -= 2)
    {
      v8 = *(a2 - 2);
      v4 = v8;
    }
  }
  if (i < a2)
  {
    v9 = *i;
    v10 = *a2;
    do
    {
      *i = v10;
      *a2 = v9;
      v11 = i[1];
      i[1] = a2[1];
      a2[1] = v11;
      do
      {
        v12 = i[2];
        i += 2;
        v9 = v12;
      }
      while (v12 <= v3 && (v9 < v3 || i[1] <= v2));
      do
      {
        do
        {
          v13 = *(a2 - 2);
          a2 -= 2;
          v10 = v13;
          v14 = v13 >= v3;
        }
        while (v13 > v3);
      }
      while (v14 && a2[1] > v2);
    }
    while (i < a2);
  }
  if (i - 2 != a1)
  {
    *a1 = *(i - 2);
    a1[1] = *(i - 1);
  }
  *(i - 2) = v3;
  *(i - 1) = v2;
  return i;
}

unsigned int *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  unsigned int v18;

  v2 = 0;
  v3 = *a1;
  v4 = a1[1];
  while (1)
  {
    v5 = a1[v2 + 2];
    if (v5 >= v3 && (v5 > v3 || a1[v2 + 3] >= v4))
      break;
    v2 += 2;
  }
  v6 = (unint64_t)&a1[v2 + 2];
  if (v2 * 4)
  {
    do
    {
      v8 = *(a2 - 2);
      a2 -= 2;
      v7 = v8;
    }
    while (v8 >= v3 && (v7 > v3 || a2[1] >= v4));
  }
  else
  {
LABEL_19:
    if (v6 < (unint64_t)a2)
    {
      do
      {
        v10 = *(a2 - 2);
        a2 -= 2;
        v9 = v10;
        if (v10 < v3)
          break;
        if (v9 > v3)
          goto LABEL_19;
      }
      while (a2[1] >= v4 && v6 < (unint64_t)a2);
    }
  }
  if (v6 >= (unint64_t)a2)
  {
    v13 = (unsigned int *)v6;
  }
  else
  {
    v12 = *a2;
    v13 = (unsigned int *)v6;
    v14 = a2;
    do
    {
      *v13 = v12;
      *v14 = v5;
      v15 = v13[1];
      v13[1] = v14[1];
      v14[1] = v15;
      do
      {
        do
        {
          v16 = v13[2];
          v13 += 2;
          v5 = v16;
          v17 = v16 > v3;
        }
        while (v16 < v3);
      }
      while (!v17 && v13[1] < v4);
      do
      {
        v18 = *(v14 - 2);
        v14 -= 2;
        v12 = v18;
      }
      while (v18 >= v3 && (v12 > v3 || v14[1] >= v4));
    }
    while (v13 < v14);
  }
  if (v13 - 2 != a1)
  {
    *a1 = *(v13 - 2);
    a1[1] = *(v13 - 1);
  }
  *(v13 - 2) = v3;
  *(v13 - 1) = v4;
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2)
{
  uint64_t v4;
  _BOOL8 result;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  uint64_t v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;

  v4 = ((char *)a2 - (char *)a1) >> 3;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 2);
      v7 = *a1;
      if (v6 < *a1 || v7 >= v6 && *(a2 - 1) < a1[1])
      {
        *a1 = v6;
        *(a2 - 2) = v7;
        v8 = a1[1];
        a1[1] = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2);
      return 1;
    default:
      v9 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4);
      v10 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  do
  {
    v13 = *v9;
    if (*v10 >= *v9 && (v13 < *v10 || v10[1] >= v9[1]))
      goto LABEL_22;
    v14 = *v10;
    v15 = v10[1];
    *v10 = v13;
    v10[1] = v9[1];
    v16 = a1;
    if (v9 == a1)
      goto LABEL_21;
    v17 = v11;
    while (1)
    {
      v18 = (char *)a1 + v17;
      v19 = *(unsigned int *)((char *)a1 + v17 + 8);
      if (v19 <= v14)
        break;
      v20 = *((_DWORD *)v18 + 3);
LABEL_18:
      v9 -= 2;
      *((_DWORD *)v18 + 4) = v19;
      *(unsigned int *)((char *)a1 + v17 + 20) = v20;
      v17 -= 8;
      if (v17 == -16)
      {
        v16 = a1;
        goto LABEL_21;
      }
    }
    if (v19 < v14)
    {
      v16 = v9;
      goto LABEL_21;
    }
    v20 = *(unsigned int *)((char *)a1 + v17 + 12);
    if (v20 > v15)
      goto LABEL_18;
    v16 = (unsigned int *)((char *)a1 + v17 + 16);
LABEL_21:
    *v16 = v14;
    v16[1] = v15;
    if (++v12 == 8)
      return v10 + 2 == a2;
LABEL_22:
    v9 = v10;
    v11 += 8;
    v10 += 2;
  }
  while (v10 != a2);
  return 1;
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4)
{
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a2, a3);
  v9 = *a4;
  v10 = *a3;
  if (*a4 < *a3 || v10 >= v9 && a4[1] < a3[1])
  {
    *a3 = v9;
    *a4 = v10;
    v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    v12 = *a3;
    v13 = *a2;
    if (*a3 < *a2 || v13 >= v12 && a3[1] < a2[1])
    {
      *a2 = v12;
      *a3 = v13;
      v14 = a2[1];
      a2[1] = a3[1];
      a3[1] = v14;
      v15 = *a2;
      v16 = *a1;
      if (*a2 < *a1 || v16 >= v15 && a2[1] < a1[1])
      {
        *a1 = v15;
        *a2 = v16;
        v17 = a1[1];
        a1[1] = a2[1];
        a2[1] = v17;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  uint64_t result;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *a4;
  if (*a5 < *a4 || v12 >= v11 && a5[1] < a4[1])
  {
    *a4 = v11;
    *a5 = v12;
    v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    v14 = *a4;
    v15 = *a3;
    if (*a4 < *a3 || v15 >= v14 && a4[1] < a3[1])
    {
      *a3 = v14;
      *a4 = v15;
      v16 = a3[1];
      a3[1] = a4[1];
      a4[1] = v16;
      v17 = *a3;
      v18 = *a2;
      if (*a3 < *a2 || v18 >= v17 && a3[1] < a2[1])
      {
        *a2 = v17;
        *a3 = v18;
        v19 = a2[1];
        a2[1] = a3[1];
        a3[1] = v19;
        v20 = *a2;
        v21 = *a1;
        if (*a2 < *a1 || v21 >= v20 && a2[1] < a1[1])
        {
          *a1 = v20;
          *a2 = v21;
          v22 = a1[1];
          a1[1] = a2[1];
          a2[1] = v22;
        }
      }
    }
  }
  return result;
}

unsigned int *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int *v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int *v22;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) >> 3;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[2 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, a4, v9, v12);
        v12 -= 2;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *a1;
        if (*v14 < *a1 || v16 >= v15 && v14[1] < a1[1])
        {
          *v14 = v16;
          *a1 = v15;
          v17 = v14[1];
          v14[1] = a1[1];
          a1[1] = v17;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 2;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v18 = (unint64_t)v8 >> 3;
      v19 = a2 - 2;
      do
      {
        v21 = *a1;
        v20 = a1[1];
        v22 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a4, v18);
        if (v19 == v22)
        {
          *v22 = v21;
          v22[1] = v20;
        }
        else
        {
          *v22 = *v19;
          v22[1] = v19[1];
          *v19 = v21;
          v19[1] = v20;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, (uint64_t)(v22 + 2), a4, ((char *)(v22 + 2) - (char *)a1) >> 3);
        }
        v19 -= 2;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(uint64_t result, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (unsigned int *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = v8[2];
        if (*v8 < v10 || v10 >= *v8 && *(_DWORD *)(result + 8 * v7 + 4) < v8[3])
        {
          v8 += 2;
          v7 = v9;
        }
      }
      v11 = *v8;
      if (*v8 >= *a4 && (*a4 < v11 || v8[1] >= a4[1]))
      {
        v12 = *a4;
        v13 = a4[1];
        *a4 = v11;
        a4[1] = v8[1];
        if (v5 >= v7)
        {
          while (1)
          {
            v15 = 2 * v7;
            v7 = (2 * v7) | 1;
            v14 = (unsigned int *)(result + 8 * v7);
            v16 = v15 + 2;
            if (v16 < a3)
            {
              v17 = v14[2];
              if (*v14 < v17 || v17 >= *v14 && *(_DWORD *)(result + 8 * v7 + 4) < v14[3])
              {
                v14 += 2;
                v7 = v16;
              }
            }
            v18 = *v14;
            if (*v14 < v12 || v18 <= v12 && v14[1] < v13)
              break;
            *v8 = v18;
            v8[1] = v14[1];
            v8 = v14;
            if (v5 < v7)
              goto LABEL_22;
          }
        }
        v14 = v8;
LABEL_22:
        *v14 = v12;
        v14[1] = v13;
      }
    }
  }
  return result;
}

unsigned int *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    v7 = v3 + 1;
    result += 2 * v3 + 2;
    v8 = 2 * v3;
    v3 = (2 * v3) | 1;
    v9 = v8 + 2;
    if (v9 < a3)
    {
      v10 = result[2];
      if (*result < v10 || v10 >= *result && v6[2 * v7 + 1] < result[3])
      {
        result += 2;
        v3 = v9;
      }
    }
    *v6 = *result;
    v6[1] = result[1];
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = (unsigned int *)(result + 8 * (v4 >> 1));
    v7 = *v6;
    v8 = *(_DWORD *)(a2 - 8);
    if (*v6 < v8 || v8 >= v7 && *(_DWORD *)(result + 8 * v5 + 4) < *(_DWORD *)(a2 - 4))
    {
      v9 = *(_DWORD *)(a2 - 8);
      v10 = *(_DWORD *)(a2 - 4);
      *(_DWORD *)(a2 - 8) = v7;
      *(_DWORD *)(a2 - 4) = v6[1];
      if (v4 >= 2)
      {
        while (1)
        {
          v12 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v11 = (unsigned int *)(result + 8 * v5);
          v13 = *v11;
          if (*v11 >= v9)
          {
            if (v13 > v9)
              break;
            v14 = *(_DWORD *)(result + 8 * v5 + 4);
            if (v14 >= v10)
              break;
          }
          else
          {
            v14 = v11[1];
          }
          *v6 = v13;
          v6[1] = v14;
          v6 = (unsigned int *)(result + 8 * v5);
          if (v12 <= 1)
            goto LABEL_12;
        }
      }
      v11 = v6;
LABEL_12:
      *v11 = v9;
      v11[1] = v10;
    }
  }
  return result;
}

void std::vector<unsigned long>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<internal::marisa::grimoire::trie::Range *>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      v18 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void std::vector<unsigned long>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

char *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Entry>::realloc(uint64_t *a1, uint64_t a2)
{
  char *result;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = (char *)operator new[](16 * a2, MEMORY[0x1E0DE4E10]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (uint64_t *)(a1[1] + 8);
    v7 = result + 8;
    do
    {
      *(v7 - 1) = *(v6 - 1);
      v8 = *v6;
      v6 += 2;
      *v7 = v8;
      v7 += 2;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x18D7921C8);
  return result;
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_current_trie<internal::marisa::grimoire::trie::ReverseKey>(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  __n128 v33;
  uint64_t v34;
  __n128 *v35;
  unint64_t v36;
  __n128 *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unsigned int *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int32 *v57;
  float v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float *v63;
  float v64;
  _DWORD *v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  uint64_t result;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v75;
  uint64_t v76;
  int v77;
  __n128 v78;
  int v79;
  __int128 v80;
  uint64_t v81[4];
  _OWORD v82[2];
  __int128 v83;
  _OWORD v84[4];

  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 8);
  if (v8)
  {
    v10 = 0;
    v11 = (_DWORD *)(v9 + 16);
    do
    {
      *v11 = v10;
      v11 += 6;
      ++v10;
    }
    while (v8 != v10);
  }
  v12 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v9, v9 + 24 * v8, 0);
  v13 = 256;
  if (a5 != 1)
    v13 = 1;
  do
  {
    v14 = v13;
    v13 *= 2;
  }
  while (v14 < v12 / *(unsigned int *)(a4 + 8));
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::resize(a1 + 126, v14);
  a1[132] = v14 - 1;
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 1);
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
  v15 = a1 + 78;
  LOBYTE(v84[0]) = 0;
  internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(a1 + 78, v84);
  internal::marisa::grimoire::vector::BitVector::push_back(a1 + 52, 0);
  memset(v84, 0, 41);
  v83 = 0u;
  memset(v82, 0, sizeof(v82));
  v80 = 0u;
  memset(v81, 0, 25);
  v78.n128_u64[0] = *(_QWORD *)(a2 + 24) << 32;
  v78.n128_u32[2] = 0;
  std::deque<internal::marisa::grimoire::trie::Range>::push_back(v82, (uint64_t *)&v78);
  v16 = *((_QWORD *)&v83 + 1);
  if (*((_QWORD *)&v83 + 1))
  {
    v72 = a1 + 52;
    v73 = a1 + 78;
    do
    {
      v17 = a1[58];
      v18 = (unsigned int *)(*(_QWORD *)(*((_QWORD *)&v82[0] + 1) + 8 * ((unint64_t)v83 / 0x155))
                           + 12 * ((unint64_t)v83 % 0x155));
      v19 = *v18;
      v20 = v18[1];
      v21 = v18[2];
      *(_QWORD *)&v83 = v83 + 1;
      *((_QWORD *)&v83 + 1) = v16 - 1;
      if ((unint64_t)v83 >= 0x2AA)
      {
        v22 = v17;
        v23 = v16;
        operator delete(**((void ***)&v82[0] + 1));
        v16 = v23;
        v17 = v22;
        *((_QWORD *)&v82[0] + 1) += 8;
        *(_QWORD *)&v83 = v83 - 341;
      }
      if (v19 < v20)
      {
        while (1)
        {
          v24 = *(_QWORD *)(a2 + 8);
          if (*(_DWORD *)(v24 + 24 * v19 + 8) != (_DWORD)v21)
            break;
          *(_DWORD *)(v24 + 24 * v19 + 12) = v17 - v16;
          v19 = (v19 + 1);
          if ((_DWORD)v20 == (_DWORD)v19)
            goto LABEL_49;
        }
      }
      if ((_DWORD)v19 != (_DWORD)v20)
      {
        v76 = v16;
        v77 = v17 - v16;
        v25 = v80;
        v80 = 0u;
        memset(v81, 0, 25);
        if (v25)
          MEMORY[0x18D7921C8](v25, 0x1000C8077774924);
        v75 = v17;
        v26 = *(_QWORD *)(a2 + 8);
        v27 = *(float *)(v26 + 24 * v19 + 12);
        v28 = v19 + 1;
        if (v19 + 1 < v20)
        {
          v29 = 24 * v19;
          v30 = (v19 << 32) + 0x100000000;
          do
          {
            if (*(unsigned __int8 *)(*(_QWORD *)(v26 + v29) - v21 - 1) != *(unsigned __int8 *)(*(_QWORD *)(v26 + v29 + 24)
                                                                                              - v21
                                                                                              - 1))
            {
              *(float *)&v31 = v27;
              v78.n128_u64[0] = v30 + v19;
              v78.n128_u64[1] = v21 | ((unint64_t)v31 << 32);
              internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
              v26 = *(_QWORD *)(a2 + 8);
              v27 = 0.0;
              LODWORD(v19) = v28;
            }
            v27 = v27 + *(float *)(v26 + v29 + 36);
            ++v28;
            v29 += 24;
            v30 += 0x100000000;
          }
          while (v20 != v28);
        }
        *(float *)&v32 = v27;
        v78.n128_u32[0] = v19;
        v78.n128_u32[1] = v20;
        v78.n128_u64[1] = v21 | ((unint64_t)v32 << 32);
        v33 = internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
        v15 = a1 + 78;
        v34 = v76;
        if (*(_DWORD *)(a4 + 16) == 0x20000)
        {
          v35 = (__n128 *)*((_QWORD *)&v80 + 1);
          v36 = v81[1];
          if (v81[1] < 129)
          {
            v37 = 0;
            v39 = 0;
          }
          else
          {
            v37 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<internal::marisa::grimoire::trie::WeightedRange>(v81[1]);
            v39 = v38;
          }
          std::__stable_sort<std::_ClassicAlgPolicy,std::greater<internal::marisa::grimoire::trie::WeightedRange> &,internal::marisa::grimoire::trie::WeightedRange*>(v35, &v35[v36], (uint64_t)&v78, v36, v37, v39, v33);
          if (v37)
            operator delete(v37);
          v34 = v76;
        }
        v40 = v81[1];
        if (v75 == v34)
          a1[133] = v81[1];
        if (v40)
        {
          v41 = 0;
          do
          {
            v42 = (unsigned int *)(*((_QWORD *)&v80 + 1) + 16 * v41);
            v43 = (uint64_t *)v42;
            v44 = v42[2];
            v45 = *(_QWORD *)(a2 + 8);
            v46 = *(unsigned int *)(v45 + 24 * *v42 + 8);
            v47 = v44 + 1;
            if (v44 + 1 >= v46)
            {
              v48 = v42[2];
              LODWORD(v46) = v44 + 1;
            }
            else
            {
              v48 = v46 - 1;
              v49 = (uint64_t *)(v45 + 24 * *v42);
              v50 = v42[2];
              do
              {
                v51 = v50;
                v50 = v47;
                v52 = v49;
                v53 = *v42;
                while (++v53 < (unint64_t)v42[1])
                {
                  v54 = *v52;
                  v55 = v52[3];
                  v52 += 3;
                  if (*(unsigned __int8 *)(v54 + ~v51 - 1) != *(unsigned __int8 *)(v55 + ~v51 - 1))
                  {
                    v48 = v51;
                    LODWORD(v46) = v47;
                    goto LABEL_43;
                  }
                }
                ++v47;
              }
              while (v50 + 1 != v46);
            }
LABEL_43:
            v56 = a1[81];
            v58 = *((float *)v42 + 3);
            v57 = v42 + 3;
            v59 = v58;
            v60 = a1[132] & v56;
            v61 = a1[127];
            v62 = v61 + 12 * v60;
            v64 = *(float *)(v62 + 8);
            v63 = (float *)(v62 + 8);
            if (v64 < v59)
            {
              v65 = (_DWORD *)(v61 + 12 * v60);
              *v65 = v77;
              v65[1] = v56;
              *v63 = v59;
              v44 = *((unsigned int *)v43 + 2);
            }
            if (v48 == v44)
            {
              v78.n128_u8[0] = *(_BYTE *)(~v48 + *(_QWORD *)(*(_QWORD *)(a2 + 8) + 24 * *(unsigned int *)v43));
              internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(v73, &v78);
              internal::marisa::grimoire::vector::BitVector::push_back(v72, 0);
            }
            else
            {
              v78.n128_u8[0] = 0;
              internal::marisa::grimoire::vector::Vector<unsigned char>::push_back(v73, &v78);
              internal::marisa::grimoire::vector::BitVector::push_back(v72, 1);
              v78 = 0uLL;
              v79 = 0;
              v66 = *((unsigned int *)v43 + 2);
              v78.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(a2 + 8) + 24 * *(unsigned int *)v43) - v66;
              v78.n128_u64[1] = (v46 - v66);
              v78.n128_u32[3] = *v57;
              internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Key>::push_back((uint64_t *)v84, (uint64_t)&v78);
            }
            *((_DWORD *)v43 + 2) = v46;
            std::deque<internal::marisa::grimoire::trie::Range>::push_back(v82, v43);
            internal::marisa::grimoire::vector::BitVector::push_back(a1, 1);
            ++v41;
          }
          while (v41 < v81[1]);
        }
      }
LABEL_49:
      internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
      v16 = *((_QWORD *)&v83 + 1);
    }
    while (*((_QWORD *)&v83 + 1));
  }
  internal::marisa::grimoire::vector::BitVector::push_back(a1, 0);
  internal::marisa::grimoire::vector::BitVector::build((internal::marisa::grimoire::vector::BitVector *)a1, a5 == 1, 1);
  internal::marisa::grimoire::vector::Vector<unsigned char>::shrink(v15);
  internal::marisa::grimoire::trie::LoudsTrie::build_terminals<internal::marisa::grimoire::trie::ReverseKey>((uint64_t)a1, a2, a3);
  v67 = *(_OWORD *)a2;
  *(_OWORD *)a2 = v84[0];
  v84[0] = v67;
  v68 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = *(_QWORD *)&v84[1];
  *(_QWORD *)&v84[1] = v68;
  v69 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)((char *)&v84[1] + 8);
  *(_OWORD *)((char *)&v84[1] + 8) = v69;
  LOBYTE(v68) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a2 + 40) = BYTE8(v84[2]);
  BYTE8(v84[2]) = v68;
  if ((_QWORD)v80)
    MEMORY[0x18D7921C8](v80, 0x1000C8077774924);
  std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100](v82);
  result = *(_QWORD *)&v84[0];
  if (*(_QWORD *)&v84[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v84[0], 0x1000C8077774924);
  return result;
}

void sub_18D72C4BC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v27;
  uint64_t v30;
  _QWORD *exception;

  if (a21)
    MEMORY[0x18D7921C8](a21, 0x1000C8077774924);
  std::deque<internal::marisa::grimoire::trie::Range>::~deque[abi:ne180100](&a27);
  v30 = *(_QWORD *)(v27 - 144);
  if (v30)
    MEMORY[0x18D7921C8](v30, 0x1000C8077774924);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds-trie.cc";
    exception[2] = 0x8000001D3;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/louds"
                   "-trie.cc:467: MARISA_MEMORY_ERROR: std::bad_alloc";
  }
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::trie::LoudsTrie::build_terminals<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t result;
  _OWORD v13[3];

  memset(v13, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)v13, *(_QWORD *)(a2 + 24));
  v5 = *(_QWORD *)(a2 + 24);
  if (v5)
  {
    v6 = *((_QWORD *)&v13[0] + 1);
    v7 = (unsigned int *)(*(_QWORD *)(a2 + 16) + 16);
    do
    {
      *(_DWORD *)(v6 + 4 * *v7) = *(v7 - 1);
      v7 += 6;
      --v5;
    }
    while (v5);
  }
  else
  {
    v6 = *((_QWORD *)&v13[0] + 1);
  }
  v8 = *a3;
  v9 = *(_QWORD *)&v13[1];
  *(_QWORD *)a3 = *(_QWORD *)&v13[0];
  *((_QWORD *)a3 + 1) = v6;
  v13[0] = v8;
  v10 = *((_QWORD *)a3 + 2);
  *((_QWORD *)a3 + 2) = v9;
  *(_QWORD *)&v13[1] = v10;
  v11 = *(__int128 *)((char *)a3 + 24);
  *(__int128 *)((char *)a3 + 24) = *(_OWORD *)((char *)&v13[1] + 8);
  *(_OWORD *)((char *)&v13[1] + 8) = v11;
  LOBYTE(v10) = *((_BYTE *)a3 + 40);
  *((_BYTE *)a3 + 40) = BYTE8(v13[2]);
  result = v8;
  BYTE8(v13[2]) = v10;
  if ((_QWORD)v8)
    return MEMORY[0x18D7921C8](v8, 0x1000C8077774924);
  return result;
}

void sub_18D72C690(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;

  v4 = a2;
  v5 = a1;
  v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 241)
  {
    v7 = 0;
    goto LABEL_69;
  }
  v7 = 0;
  do
  {
    v8 = internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::ReverseKey>(v5, v5 + 24 * (v6 / 0x30uLL), v4 - 24, a3);
    v9 = v8;
    v10 = v5;
    v11 = v4;
    v12 = v5;
    v13 = v4;
    while (v10 < v11)
    {
      v14 = *(unsigned int *)(v10 + 8);
      v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(_QWORD *)v10 - a3 - 1);
      if (v15 > v8)
        break;
      if (v15 == v8)
      {
        v16 = *(_QWORD *)v10;
        *(_QWORD *)v10 = *(_QWORD *)v12;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v12 + 8);
        v17 = *(_QWORD *)(v10 + 12);
        *(_DWORD *)(v10 + 12) = *(_DWORD *)(v12 + 12);
        *(_DWORD *)(v10 + 16) = *(_DWORD *)(v12 + 16);
        *(_QWORD *)v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(_QWORD *)(v12 + 12) = v17;
        v12 += 24;
      }
LABEL_11:
      v10 += 24;
    }
    if (v10 < v11)
    {
      v18 = v11 - 24;
      do
      {
        v11 = v18;
        v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19)
          v20 = -1;
        else
          v20 = *(unsigned __int8 *)(*(_QWORD *)v11 - a3 - 1);
        if (v20 < v8)
          break;
        if (v20 == v8)
        {
          v21 = *(_QWORD *)(v13 - 24);
          v13 -= 24;
          v22 = *(_QWORD *)v11;
          *(_QWORD *)v11 = v21;
          *(_DWORD *)(v11 + 8) = *(_DWORD *)(v13 + 8);
          v23 = *(_QWORD *)(v11 + 12);
          *(_DWORD *)(v11 + 12) = *(_DWORD *)(v13 + 12);
          *(_DWORD *)(v11 + 16) = *(_DWORD *)(v13 + 16);
          *(_QWORD *)v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(_QWORD *)(v13 + 12) = v23;
        }
        v18 = v11 - 24;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      v24 = *(_QWORD *)v10;
      v25 = *(_DWORD *)(v10 + 16);
      *(_QWORD *)v10 = *(_QWORD *)v11;
      v26 = *(_QWORD *)(v10 + 8);
      *(_DWORD *)(v10 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v10 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v10 + 16) = *(_DWORD *)(v11 + 16);
      *(_QWORD *)v11 = v24;
      *(_QWORD *)(v11 + 8) = v26;
      *(_DWORD *)(v11 + 16) = v25;
      goto LABEL_11;
    }
    v44 = v7;
    if (v12 > v5)
    {
      v27 = 0;
      do
      {
        v28 = v12 + v27;
        v29 = v10 + v27;
        v30 = *(_QWORD *)(v12 + v27 - 24);
        v31 = *(_DWORD *)(v12 + v27 - 8);
        *(_QWORD *)(v28 - 24) = *(_QWORD *)(v10 + v27 - 24);
        v32 = *(_QWORD *)(v12 + v27 - 16);
        *(_DWORD *)(v28 - 16) = *(_DWORD *)(v10 + v27 - 16);
        *(_DWORD *)(v28 - 12) = *(_DWORD *)(v10 + v27 - 12);
        *(_DWORD *)(v28 - 8) = *(_DWORD *)(v10 + v27 - 8);
        *(_QWORD *)(v29 - 24) = v30;
        *(_QWORD *)(v29 - 16) = v32;
        *(_DWORD *)(v29 - 8) = v31;
        v27 -= 24;
      }
      while (v12 + v27 > v5);
      v10 += v27;
    }
    while (v13 < v4)
    {
      v33 = *(_QWORD *)v13;
      v34 = *(_DWORD *)(v13 + 16);
      *(_QWORD *)v13 = *(_QWORD *)v11;
      v35 = *(_QWORD *)(v13 + 8);
      *(_DWORD *)(v13 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v13 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v13 + 16) = *(_DWORD *)(v11 + 16);
      *(_QWORD *)v11 = v33;
      *(_QWORD *)(v11 + 8) = v35;
      *(_DWORD *)(v11 + 16) = v34;
      v11 += 24;
      v13 += 24;
    }
    v36 = v10 - v5;
    v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v5) >> 3);
    v38 = v11 - v10;
    v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v10) >> 3);
    if (v37 <= v39)
    {
      v40 = v4 - v11;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)) <= v39)
      {
        if (v36 == 24)
        {
          v41 = v44 + 1;
        }
        else
        {
          if (v36 < 25)
            goto LABEL_53;
          v41 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v5, v10, a3)+ v44;
        }
        v44 = v41;
LABEL_53:
        if (v40 == 24)
        {
          v7 = v44 + 1;
        }
        else if (v40 < 25)
        {
          v7 = v44;
        }
        else
        {
          v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v11, v4, a3)+ v44;
        }
        if (v38 == 24)
        {
          ++v7;
        }
        else if (v38 >= 25)
        {
          if (v9 == -1)
          {
            ++v7;
            v5 = v11;
            goto LABEL_64;
          }
          ++a3;
        }
        v5 = v10;
LABEL_64:
        v4 = v11;
        goto LABEL_65;
      }
    }
    if (v38 == 24)
      goto LABEL_32;
    if (v38 < 25)
    {
      v7 = v44;
    }
    else if (v8 == -1)
    {
LABEL_32:
      v7 = v44 + 1;
    }
    else
    {
      v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v10, v11, a3 + 1)+ v44;
    }
    v42 = v4 - v11;
    if (v37 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)))
    {
      if (v42 == 24)
      {
        ++v7;
      }
      else if (v42 >= 25)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v11, v4, a3);
      }
      v4 = v10;
    }
    else
    {
      if (v36 == 24)
      {
        ++v7;
      }
      else if (v36 >= 25)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::ReverseKey *>(v5, v10, a3);
      }
      v5 = v11;
    }
LABEL_65:
    v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 240);
LABEL_69:
  if (v6 >= 25)
    v7 += internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::ReverseKey *>(v5, v4, a3);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;

  if (*(unsigned int *)(a1 + 8) <= a4)
    v4 = -1;
  else
    v4 = *(unsigned __int8 *)(~a4 + *(_QWORD *)a1);
  if (*(unsigned int *)(a2 + 8) <= a4)
    v5 = -1;
  else
    v5 = *(unsigned __int8 *)(~a4 + *(_QWORD *)a2);
  if (*(unsigned int *)(a3 + 8) <= a4)
    v6 = -1;
  else
    v6 = *(unsigned __int8 *)(~a4 + *(_QWORD *)a3);
  if (v4 <= v5)
    v7 = v5;
  else
    v7 = v4;
  if (v4 >= v5)
    v4 = v5;
  if (v4 <= v6)
    v4 = v6;
  if (v7 >= v6)
    return v4;
  else
    return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::ReverseKey *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1 + 24;
  if (a1 + 24 >= a2)
    return 1;
  v7 = 1;
  do
  {
    v8 = v3;
    if (v3 <= a1)
    {
      v10 = 0;
    }
    else
    {
      while (1)
      {
        v9 = v8 - 24;
        v10 = internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::ReverseKey>(v8 - 24, v8, a3);
        if (v10 < 1)
          break;
        v11 = *(_QWORD *)(v8 - 24);
        v12 = *(_DWORD *)(v8 - 8);
        *(_QWORD *)(v8 - 24) = *(_QWORD *)v8;
        v13 = *(_QWORD *)(v8 + 8);
        *(_DWORD *)(v8 - 8) = *(_DWORD *)(v8 + 16);
        *(_QWORD *)v8 = v11;
        v14 = *(_QWORD *)(v8 - 16);
        *(_QWORD *)(v8 - 16) = v13;
        *(_QWORD *)(v8 + 8) = v14;
        *(_DWORD *)(v8 + 16) = v12;
        v8 -= 24;
        if (v9 <= a1)
        {
          v10 = 1;
          break;
        }
      }
    }
    if (v10)
      ++v7;
    v3 += 24;
  }
  while (v3 < a2);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  uint64_t result;
  unsigned int v12;

  v3 = *(unsigned int *)(a1 + 8);
  v4 = *(unsigned int *)(a2 + 8);
  v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4)
      v12 = -1;
    else
      v12 = 1;
    if ((_DWORD)v3 == (_DWORD)v4)
      return 0;
    else
      return v12;
  }
  else
  {
    v6 = v4 - a3;
    v7 = (unsigned __int8 *)(*(_QWORD *)a2 + ~a3);
    v8 = (unsigned __int8 *)(*(_QWORD *)a1 + ~a3);
    while (v6)
    {
      v9 = *v8;
      v10 = *v7;
      result = (v9 - v10);
      if (v9 != v10)
        return result;
      --v6;
      --v7;
      --v8;
      if (!--v5)
        goto LABEL_6;
    }
    return 1;
  }
}

char *internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::trie::Cache>::realloc(uint64_t *a1, uint64_t a2)
{
  char *result;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  int v8;
  uint64_t v9;

  result = (char *)operator new[](12 * a2, MEMORY[0x1E0DE4E10]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (_DWORD *)(a1[1] + 8);
    v7 = result + 8;
    do
    {
      *((_QWORD *)v7 - 1) = *((_QWORD *)v6 - 1);
      v8 = *v6;
      v6 += 3;
      *v7 = v8;
      v7 += 3;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x18D7921C8);
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned char>::map_(uint64_t a1, internal::marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;

  v4 = *(_QWORD *)internal::marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  *(_QWORD *)(a1 + 16) = internal::marisa::grimoire::io::Mapper::map_data(this, v4);
  internal::marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4;
  return internal::marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t internal::marisa::grimoire::vector::Vector<unsigned char>::write_(uint64_t a1, internal::marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = *(_QWORD *)(a1 + 24);
  internal::marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  internal::marisa::grimoire::io::Writer::write<unsigned char>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return internal::marisa::grimoire::io::Writer::seek((uint64_t)this, -*(_DWORD *)(a1 + 24) & 7);
}

uint64_t internal::marisa::grimoire::io::Writer::write<unsigned char>(uint64_t a1, char *a2, size_t a3)
{
  _QWORD *exception;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer.h";
    exception[2] = 0x200000021;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/io/writer."
                   "h:33: MARISA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
  }
  return internal::marisa::grimoire::io::Writer::write_data(a1, a2, a3);
}

double internal::marisa::grimoire::trie::Tail::Tail(internal::marisa::grimoire::trie::Tail *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *(_OWORD *)((char *)this + 73) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  return result;
}

uint64_t internal::marisa::grimoire::trie::Tail::build(__int128 *a1, uint64_t a2, __int128 *a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t result;
  _QWORD *exception;
  const char *v17;
  _OWORD v18[3];
  _OWORD v19[4];
  __int128 v20;
  _BYTE v21[25];
  __int128 v22;
  _BYTE v23[25];
  __int128 v24;
  _BYTE v25[25];

  if (!a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc";
    exception[2] = 0x200000011;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc:17: MA"
          "RISA_NULL_ERROR: offsets == NULL";
    goto LABEL_28;
  }
  if (a4 == 0x2000)
    goto LABEL_15;
  if (a4 != 4096)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc";
    exception[2] = 0x500000028;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc:40: MA"
          "RISA_CODE_ERROR: undefined tail mode";
LABEL_28:
    exception[3] = v17;
  }
  v5 = *(_QWORD *)(a2 + 24);
  if (v5)
  {
    v6 = 0;
    a4 = 4096;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + 8) + 16 * v6;
      v8 = *(unsigned int *)(v7 + 8);
      if ((_DWORD)v8)
        break;
LABEL_11:
      if (++v6 == v5)
        goto LABEL_15;
    }
    v9 = -v8;
    v10 = *(_QWORD *)v7 + 1;
    while (*(_BYTE *)(v10 + v9))
    {
      if (__CFADD__(v9++, 1))
        goto LABEL_11;
    }
    a4 = 0x2000;
  }
  else
  {
    a4 = 4096;
  }
LABEL_15:
  memset(v18, 0, 41);
  memset(v19, 0, 41);
  v22 = 0u;
  memset(v23, 0, sizeof(v23));
  v24 = 0u;
  memset(v25, 0, sizeof(v25));
  v19[3] = 0u;
  v20 = 0u;
  memset(v21, 0, sizeof(v21));
  internal::marisa::grimoire::trie::Tail::build_((uint64_t)v18, a2, a3, a4);
  v12 = *a1;
  *a1 = v18[0];
  v18[0] = v12;
  v13 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v18[1];
  *(_QWORD *)&v18[1] = v13;
  v14 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v18[1] + 8);
  *(_OWORD *)((char *)&v18[1] + 8) = v14;
  LOBYTE(v13) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v18[2]);
  BYTE8(v18[2]) = v13;
  internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::vector::BitVector *)(a1 + 3), (internal::marisa::grimoire::vector::BitVector *)v19);
  if ((_QWORD)v24)
    MEMORY[0x18D7921C8](v24, 0x1000C8077774924);
  if ((_QWORD)v22)
    MEMORY[0x18D7921C8](v22, 0x1000C8077774924);
  if ((_QWORD)v20)
    MEMORY[0x18D7921C8](v20, 0x1000C8077774924);
  if (*(_QWORD *)&v19[0])
    MEMORY[0x18D7921C8](*(_QWORD *)&v19[0], 0x1000C8077774924);
  result = *(_QWORD *)&v18[0];
  if (*(_QWORD *)&v18[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v18[0], 0x1000C8077774924);
  return result;
}

void sub_18D72D118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  internal::marisa::grimoire::trie::Tail::~Tail((internal::marisa::grimoire::trie::Tail *)&a9);
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::trie::Tail::build_(uint64_t a1, uint64_t a2, __int128 *a3, int a4)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t i;
  unint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t result;
  _QWORD *exception;
  _QWORD *v31;
  char v32;
  _QWORD v33[2];
  _OWORD v34[3];

  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 8);
  if (v8)
  {
    v10 = 0;
    v11 = (_DWORD *)(v9 + 12);
    do
    {
      *v11 = v10;
      v11 += 4;
      ++v10;
    }
    while (v8 != v10);
  }
  internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v9, v9 + 16 * v8, 0);
  memset(v34, 0, 41);
  v12 = *(_QWORD *)(a2 + 24);
  LODWORD(v33[0]) = 0;
  internal::marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)v34, v12, v33);
  v33[0] = 0;
  v33[1] = 0;
  v13 = *(_QWORD *)(a2 + 24);
  if (v13)
  {
    v14 = v33;
    do
    {
      --v13;
      v15 = *(_QWORD *)(a2 + 8);
      v16 = v15 + 16 * v13;
      v18 = (unsigned int *)(v16 + 8);
      v17 = *(unsigned int *)(v16 + 8);
      if (!*(_DWORD *)(v16 + 8))
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *exception = &off_1E26321F0;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc";
        exception[2] = 0x4000000ACLL;
        exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/t"
                       "ail.cc:172: MARISA_RANGE_ERROR: current.length() == 0";
      }
      v19 = 0;
      v20 = 0;
      v21 = *((unsigned int *)v14 + 2);
      while (v21 != v20)
      {
        if (*(unsigned __int8 *)(*v14 + v19) != *(unsigned __int8 *)(*(_QWORD *)v16 + v19))
          goto LABEL_13;
        ++v20;
        --v19;
        if (v17 == v20)
          goto LABEL_14;
      }
      v20 = *((unsigned int *)v14 + 2);
LABEL_13:
      if (v20 != v17)
      {
        v22 = *((_QWORD *)&v34[0] + 1);
        goto LABEL_17;
      }
LABEL_14:
      v22 = *((_QWORD *)&v34[0] + 1);
      if ((_DWORD)v21)
      {
        *(_DWORD *)(*((_QWORD *)&v34[0] + 1) + 4 * *(unsigned int *)(v15 + 16 * v13 + 12)) = v21
                                                                                             - v17
                                                                                             + *(_DWORD *)(*((_QWORD *)&v34[0] + 1) + 4 * *((unsigned int *)v14 + 3));
        goto LABEL_29;
      }
LABEL_17:
      *(_DWORD *)(v22 + 4 * *(unsigned int *)(v15 + 16 * v13 + 12)) = *(_QWORD *)(a1 + 24);
      v23 = *v18;
      if ((_DWORD)v23)
      {
        for (i = 0; i < v23; ++i)
        {
          v32 = *(_BYTE *)(*(_QWORD *)v16 - v23 + i + 1);
          internal::marisa::grimoire::vector::Vector<unsigned char>::push_back((uint64_t *)a1, &v32);
          v23 = *v18;
        }
        if (a4 != 4096)
        {
          if (v23 >= 2)
          {
            v25 = 1;
            do
            {
              internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 48), 0);
              ++v25;
            }
            while (v25 < *v18);
          }
LABEL_27:
          internal::marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 48), 1);
          goto LABEL_28;
        }
      }
      else if (a4 != 4096)
      {
        goto LABEL_27;
      }
      v32 = 0;
      internal::marisa::grimoire::vector::Vector<unsigned char>::push_back((uint64_t *)a1, &v32);
LABEL_28:
      if (*(_DWORD *)(a1 + 28))
      {
        v31 = __cxa_allocate_exception(0x20uLL);
        *v31 = &off_1E26321F0;
        v31[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc";
        v31[2] = 0x7000000C2;
        v31[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/trie/tail.cc"
                 ":194: MARISA_SIZE_ERROR: buf_.size() > MARISA_UINT32_MAX";
      }
LABEL_29:
      v14 = (_QWORD *)v16;
    }
    while (v13);
  }
  internal::marisa::grimoire::vector::Vector<unsigned char>::shrink((_BYTE *)a1);
  v26 = *a3;
  *a3 = v34[0];
  v34[0] = v26;
  v27 = *((_QWORD *)a3 + 2);
  *((_QWORD *)a3 + 2) = *(_QWORD *)&v34[1];
  *(_QWORD *)&v34[1] = v27;
  v28 = *(__int128 *)((char *)a3 + 24);
  *(__int128 *)((char *)a3 + 24) = *(_OWORD *)((char *)&v34[1] + 8);
  *(_OWORD *)((char *)&v34[1] + 8) = v28;
  LOBYTE(v27) = *((_BYTE *)a3 + 40);
  *((_BYTE *)a3 + 40) = BYTE8(v34[2]);
  result = v26;
  BYTE8(v34[2]) = v27;
  if ((_QWORD)v26)
    return MEMORY[0x18D7921C8](v26, 0x1000C8077774924);
  return result;
}

void sub_18D72D424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a13)
    MEMORY[0x18D7921C8](a13, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t *internal::marisa::grimoire::trie::Tail::swap(internal::marisa::grimoire::trie::Tail *this, internal::marisa::grimoire::trie::Tail *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  return internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::trie::Tail *)((char *)this + 48), (internal::marisa::grimoire::trie::Tail *)((char *)a2 + 48));
}

uint64_t internal::marisa::grimoire::trie::Tail::map(internal::marisa::grimoire::trie::Tail *this, internal::marisa::grimoire::io::Mapper *a2)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;
  __int128 v8[3];
  _OWORD v9[4];
  __int128 v10;
  _BYTE v11[25];
  __int128 v12;
  _BYTE v13[25];
  __int128 v14;
  _BYTE v15[25];

  memset(v8, 0, 41);
  memset(v9, 0, 41);
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  v14 = 0u;
  memset(v15, 0, sizeof(v15));
  v9[3] = 0u;
  v10 = 0u;
  memset(v11, 0, sizeof(v11));
  internal::marisa::grimoire::vector::Vector<char>::map(v8, a2);
  internal::marisa::grimoire::vector::BitVector::map((internal::marisa::grimoire::vector::BitVector *)v9, a2);
  v4 = *(_OWORD *)this;
  *(_OWORD *)this = v8[0];
  v8[0] = v4;
  v5 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *(_QWORD *)&v8[1];
  *(_QWORD *)&v8[1] = v5;
  v6 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(__int128 *)((char *)&v8[1] + 8);
  *(__int128 *)((char *)&v8[1] + 8) = v6;
  LOBYTE(v5) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = BYTE8(v8[2]);
  BYTE8(v8[2]) = v5;
  internal::marisa::grimoire::vector::BitVector::swap((internal::marisa::grimoire::trie::Tail *)((char *)this + 48), (internal::marisa::grimoire::vector::BitVector *)v9);
  if ((_QWORD)v14)
    MEMORY[0x18D7921C8](v14, 0x1000C8077774924);
  if ((_QWORD)v12)
    MEMORY[0x18D7921C8](v12, 0x1000C8077774924);
  if ((_QWORD)v10)
    MEMORY[0x18D7921C8](v10, 0x1000C8077774924);
  if (*(_QWORD *)&v9[0])
    MEMORY[0x18D7921C8](*(_QWORD *)&v9[0], 0x1000C8077774924);
  result = *(_QWORD *)&v8[0];
  if (*(_QWORD *)&v8[0])
    return MEMORY[0x18D7921C8](*(_QWORD *)&v8[0], 0x1000C8077774924);
  return result;
}

void sub_18D72D5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  internal::marisa::grimoire::trie::Tail::~Tail((internal::marisa::grimoire::trie::Tail *)&a9);
  _Unwind_Resume(a1);
}

uint64_t internal::marisa::grimoire::trie::Tail::write(internal::marisa::grimoire::trie::Tail *this, internal::marisa::grimoire::io::Writer *a2)
{
  internal::marisa::grimoire::vector::Vector<unsigned char>::write_((uint64_t)this, a2);
  return internal::marisa::grimoire::vector::BitVector::write_((internal::marisa::grimoire::trie::Tail *)((char *)this + 48), a2);
}

void internal::marisa::grimoire::trie::Tail::restore(_QWORD *a1, std::string *this, unint64_t a3)
{
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  std::string::value_type v8;
  unsigned __int8 *v9;
  int v10;

  v3 = a3;
  if (a1[12])
  {
    do
    {
      std::string::push_back(this, *(_BYTE *)(a1[2] + v3));
      v6 = *(_QWORD *)(a1[8] + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v3;
      ++v3;
    }
    while ((v6 & 1) == 0);
  }
  else
  {
    v7 = a1[2];
    v8 = *(_BYTE *)(v7 + a3);
    if (v8)
    {
      v9 = (unsigned __int8 *)(a3 + v7 + 1);
      do
      {
        std::string::push_back(this, v8);
        v10 = *v9++;
        v8 = v10;
      }
      while (v10);
    }
  }
}

uint64_t internal::marisa::grimoire::trie::Tail::match(_QWORD *a1, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  _BYTE *v9;
  int v10;
  int v11;

  v5 = a1[2];
  if (a1[12])
  {
    v6 = *a4;
    do
    {
      if (*(unsigned __int8 *)(v5 + a5) != *(unsigned __int8 *)(a2 + v6))
        break;
      *a4 = ++v6;
      if (((*(_QWORD *)(a1[8] + ((a5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a5) & 1) != 0)
        return 1;
      ++a5;
    }
    while (v6 < a3);
  }
  else
  {
    v7 = (unsigned __int8 *)(v5 + a5);
    v8 = *a4;
    v11 = *v7;
    v9 = v7 + 1;
    v10 = v11;
    while (v10 == *(unsigned __int8 *)(a2 + v8))
    {
      *a4 = ++v8;
      v10 = *v9;
      if (!*v9)
        return 1;
      ++v9;
      if (v8 >= a3)
        return 0;
    }
  }
  return 0;
}

BOOL internal::marisa::grimoire::trie::Tail::prefix_match(_QWORD *a1, uint64_t a2, unint64_t a3, unint64_t *a4, unint64_t a5, std::string *this)
{
  unint64_t v7;
  unint64_t v12;
  int v13;
  int v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned __int8 v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  unsigned __int8 *v24;
  int v25;

  v7 = a5;
  if (a1[12])
  {
    v12 = *a4;
    while (1)
    {
      v13 = *(unsigned __int8 *)(a1[2] + v7);
      v14 = *(unsigned __int8 *)(a2 + v12);
      v15 = v13 == v14;
      if (v13 != v14)
        break;
      std::string::push_back(this, v13);
      v12 = *a4 + 1;
      *a4 = v12;
      if (((*(_QWORD *)(a1[8] + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
        break;
      ++v7;
      if (v12 >= a3)
      {
        do
        {
          std::string::push_back(this, *(_BYTE *)(a1[2] + v7));
          v16 = *(_QWORD *)(a1[8] + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7;
          ++v7;
        }
        while ((v16 & 1) == 0);
        return 1;
      }
    }
  }
  else
  {
    v17 = a1[2];
    v18 = *a4;
    v19 = v17 + a5 - *a4;
    v20 = *(_BYTE *)(v17 + a5);
    v21 = *a4;
    while (1)
    {
      v22 = *(unsigned __int8 *)(a2 + v21);
      v15 = v20 == v22;
      if (v20 != v22)
        break;
      std::string::push_back(this, v20);
      v23 = *a4;
      v21 = *a4 + 1;
      *a4 = v21;
      v20 = *(_BYTE *)(v19 + v21);
      if (!v20)
        break;
      if (v21 >= a3)
      {
        v24 = (unsigned __int8 *)(v7 - v18 + v17 + v23 + 2);
        do
        {
          std::string::push_back(this, v20);
          v25 = *v24++;
          v20 = v25;
        }
        while (v25);
        return 1;
      }
    }
  }
  return v15;
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned int>::resize(uint64_t *result, unint64_t a2, _DWORD *a3)
{
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _DWORD *v10;

  v4 = a2;
  v5 = result;
  v6 = result[4];
  if (v6 < a2)
  {
    v7 = 2 * v6;
    if (v6 >> 61)
      v7 = 0x3FFFFFFFFFFFFFFFLL;
    if (v6 > a2 >> 1)
      a2 = v7;
    result = (uint64_t *)internal::marisa::grimoire::vector::Vector<unsigned int>::realloc(result, a2);
  }
  v8 = v5[3];
  v9 = v4 - v8;
  if (v4 > v8)
  {
    v10 = (_DWORD *)(v5[1] + 4 * v8);
    do
    {
      *v10++ = *a3;
      --v9;
    }
    while (v9);
  }
  v5[3] = v4;
  return result;
}

uint64_t internal::marisa::grimoire::vector::Vector<char>::map(__int128 *a1, internal::marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  internal::marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x18D7921C8](v3, 0x1000C8077774924);
  return result;
}

void sub_18D72D9C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x18D7921C8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;

  v4 = a2;
  v5 = a1;
  v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 161)
  {
    v7 = 0;
    goto LABEL_68;
  }
  v7 = 0;
  do
  {
    v8 = internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::Entry>(v5, v5 + 16 * ((unint64_t)v6 >> 5), v4 - 16, a3);
    v9 = v8;
    v10 = v5;
    v11 = v4;
    v12 = v5;
    v13 = v4;
    while (v10 < v11)
    {
      v14 = *(unsigned int *)(v10 + 8);
      v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(_QWORD *)v10 - a3);
      if (v15 > v8)
        break;
      if (v15 == v8)
      {
        v16 = *(_QWORD *)v10;
        v17 = *(_DWORD *)(v10 + 12);
        *(_QWORD *)v10 = *(_QWORD *)v12;
        *(_QWORD *)(v10 + 8) = *(_QWORD *)(v12 + 8);
        *(_QWORD *)v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(_DWORD *)(v12 + 12) = v17;
        v12 += 16;
      }
LABEL_11:
      v10 += 16;
    }
    if (v10 < v11)
    {
      v18 = v11 - 16;
      do
      {
        v11 = v18;
        v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19)
          v20 = -1;
        else
          v20 = *(unsigned __int8 *)(*(_QWORD *)v11 - a3);
        if (v20 < v8)
          break;
        if (v20 == v8)
        {
          v21 = *(_QWORD *)(v13 - 16);
          v13 -= 16;
          v22 = *(_QWORD *)v11;
          v23 = *(_DWORD *)(v11 + 12);
          *(_QWORD *)v11 = v21;
          *(_QWORD *)(v11 + 8) = *(_QWORD *)(v13 + 8);
          *(_QWORD *)v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(_DWORD *)(v13 + 12) = v23;
        }
        v18 = v11 - 16;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      v24 = *(_QWORD *)v10;
      *(_QWORD *)v10 = *(_QWORD *)v11;
      v25 = *(_QWORD *)(v11 + 8);
      *(_QWORD *)v11 = v24;
      v26 = *(_QWORD *)(v10 + 8);
      *(_QWORD *)(v10 + 8) = v25;
      *(_QWORD *)(v11 + 8) = v26;
      goto LABEL_11;
    }
    v42 = v7;
    while (v12 > v5)
    {
      v28 = *(_QWORD *)(v12 - 16);
      v12 -= 16;
      v27 = v28;
      v29 = *(_QWORD *)(v10 - 16);
      v10 -= 16;
      *(_QWORD *)v12 = v29;
      v30 = *(_QWORD *)(v10 + 8);
      *(_QWORD *)v10 = v27;
      v31 = *(_QWORD *)(v12 + 8);
      *(_QWORD *)(v12 + 8) = v30;
      *(_QWORD *)(v10 + 8) = v31;
    }
    while (v13 < v4)
    {
      v32 = *(_QWORD *)v13;
      *(_QWORD *)v13 = *(_QWORD *)v11;
      v33 = *(_QWORD *)(v11 + 8);
      *(_QWORD *)v11 = v32;
      v34 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)(v13 + 8) = v33;
      *(_QWORD *)(v11 + 8) = v34;
      v11 += 16;
      v13 += 16;
    }
    v35 = v10 - v5;
    v36 = (uint64_t)(v10 - v5) >> 4;
    v37 = v11 - v10;
    if (v36 <= (uint64_t)(v11 - v10) >> 4)
    {
      v38 = v4 - v11;
      if (v37 >> 4 >= (uint64_t)(v4 - v11) >> 4)
      {
        if (v35 == 16)
        {
          v39 = v42 + 1;
        }
        else
        {
          if (v35 < 17)
            goto LABEL_52;
          v39 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v5, v10, a3)+ v42;
        }
        v42 = v39;
LABEL_52:
        if (v38 == 16)
        {
          v7 = v42 + 1;
        }
        else if (v38 < 17)
        {
          v7 = v42;
        }
        else
        {
          v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v11, v4, a3)+ v42;
        }
        if (v37 == 16)
        {
          ++v7;
        }
        else if (v37 >= 17)
        {
          if (v9 == -1)
          {
            ++v7;
            v5 = v11;
            goto LABEL_63;
          }
          ++a3;
        }
        v5 = v10;
LABEL_63:
        v4 = v11;
        goto LABEL_64;
      }
    }
    if (v37 == 16)
      goto LABEL_31;
    if (v37 < 17)
    {
      v7 = v42;
    }
    else if (v8 == -1)
    {
LABEL_31:
      v7 = v42 + 1;
    }
    else
    {
      v7 = internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v10, v11, a3 + 1)+ v42;
    }
    v40 = v4 - v11;
    if (v36 >= (uint64_t)(v4 - v11) >> 4)
    {
      if (v40 == 16)
      {
        ++v7;
      }
      else if (v40 >= 17)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v11, v4, a3);
      }
      v4 = v10;
    }
    else
    {
      if (v35 == 16)
      {
        ++v7;
      }
      else if (v35 >= 17)
      {
        v7 += internal::marisa::grimoire::algorithm::details::sort<internal::marisa::grimoire::trie::Entry *>(v5, v10, a3);
      }
      v5 = v11;
    }
LABEL_64:
    v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 160);
LABEL_68:
  if (v6 >= 17)
    v7 += internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::Entry *>(v5, v4, a3);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::median<internal::marisa::grimoire::trie::Entry>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;

  if (*(unsigned int *)(a1 + 8) <= a4)
    v4 = -1;
  else
    v4 = *(unsigned __int8 *)(*(_QWORD *)a1 - a4);
  if (*(unsigned int *)(a2 + 8) <= a4)
    v5 = -1;
  else
    v5 = *(unsigned __int8 *)(*(_QWORD *)a2 - a4);
  if (*(unsigned int *)(a3 + 8) <= a4)
    v6 = -1;
  else
    v6 = *(unsigned __int8 *)(*(_QWORD *)a3 - a4);
  if (v4 <= v5)
    v7 = v5;
  else
    v7 = v4;
  if (v4 >= v5)
    v4 = v5;
  if (v4 <= v6)
    v4 = v6;
  if (v7 >= v6)
    return v4;
  else
    return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::insertion_sort<internal::marisa::grimoire::trie::Entry *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (_QWORD *)(a1 + 16);
  if (a1 + 16 >= a2)
    return 1;
  v7 = 1;
  do
  {
    v8 = v3;
    if ((unint64_t)v3 <= a1)
    {
      v10 = 0;
    }
    else
    {
      while (1)
      {
        v9 = v8 - 2;
        v10 = internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::Entry>((uint64_t)(v8 - 2), (uint64_t)v8, a3);
        if (v10 < 1)
          break;
        v11 = *(v8 - 2);
        *(v8 - 2) = *v8;
        v12 = v8[1];
        *v8 = v11;
        v13 = *(v8 - 1);
        *(v8 - 1) = v12;
        v8[1] = v13;
        v8 -= 2;
        if ((unint64_t)v9 <= a1)
        {
          v10 = 1;
          break;
        }
      }
    }
    if (v10)
      ++v7;
    v3 += 2;
  }
  while ((unint64_t)v3 < a2);
  return v7;
}

uint64_t internal::marisa::grimoire::algorithm::details::compare<internal::marisa::grimoire::trie::Entry>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  uint64_t result;
  unsigned int v12;

  v3 = *(unsigned int *)(a1 + 8);
  v4 = *(unsigned int *)(a2 + 8);
  v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4)
      v12 = -1;
    else
      v12 = 1;
    if ((_DWORD)v3 == (_DWORD)v4)
      return 0;
    else
      return v12;
  }
  else
  {
    v6 = v4 - a3;
    v7 = (unsigned __int8 *)(*(_QWORD *)a2 - a3);
    v8 = (unsigned __int8 *)(*(_QWORD *)a1 - a3);
    while (v6)
    {
      v9 = *v8;
      v10 = *v7;
      result = (v9 - v10);
      if (v9 != v10)
        return result;
      --v6;
      --v7;
      --v8;
      if (!--v5)
        goto LABEL_6;
    }
    return 1;
  }
}

uint64_t internal::marisa::grimoire::vector::BitVector::rank1(internal::marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = a2 >> 9;
  v3 = *((_QWORD *)this + 10);
  v4 = *(unsigned int *)(v3 + 12 * (a2 >> 9));
  switch((a2 >> 6) & 7)
  {
    case 1uLL:
      v5 = *(_DWORD *)(v3 + 12 * v2 + 4) & 0x7F;
      goto LABEL_10;
    case 2uLL:
      v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 7;
      goto LABEL_5;
    case 3uLL:
      v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 15;
LABEL_5:
      v4 += v6;
      break;
    case 4uLL:
      v4 += (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 23;
      break;
    case 5uLL:
      v5 = *(_DWORD *)(v3 + 12 * v2 + 8) & 0x1FF;
      goto LABEL_10;
    case 6uLL:
      v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 9) & 0x1FF;
      goto LABEL_10;
    case 7uLL:
      v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 18) & 0x1FF;
LABEL_10:
      v4 += v5;
      break;
    default:
      break;
  }
  v7 = *(_QWORD *)(*((_QWORD *)this + 2) + 8 * (a2 >> 6)) & ~(-1 << a2);
  v8 = (((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) & 0x3333333333333333);
  return v4 + ((0x101010101010101 * (((v8 >> 4) & 0x707070707070707) + (v8 & 0x707070707070707))) >> 56);
}

unint64_t internal::marisa::grimoire::vector::BitVector::select0(internal::marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unint64_t v12;
  internal::marisa::grimoire::vector::_anonymous_namespace_ *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *((_QWORD *)this + 16);
  if ((a2 & 0x1FF) == 0)
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  v5 = *((_QWORD *)this + 10);
  if (v3 + 10 >= v4)
  {
    v7 = v5 + 12 * v3;
    v8 = v3-- << 9;
    v9 = (unsigned int *)(v7 + 12);
    do
    {
      v10 = *v9;
      v9 += 3;
      ++v3;
      v8 += 512;
    }
    while (v8 - v10 <= a2);
  }
  else
  {
    do
    {
      if (((v4 + v3) >> 1 << 9) - *(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2)
        v4 = (v4 + v3) >> 1;
      else
        v3 = (v4 + v3) >> 1;
    }
    while (v3 + 1 < v4);
  }
  v11 = (unsigned int *)(v5 + 12 * v3);
  v12 = v11[1];
  v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(a2 - (v3 << 9) + *v11);
  v14 = 8 * v3;
  if ((unint64_t)v13 >= 256 - (v12 >> 23))
  {
    v15 = *(unsigned int *)(v5 + 12 * v3 + 8);
    v16 = (v15 >> 9) & 0x1FF;
    if ((unint64_t)v13 >= 384 - v16)
    {
      v18 = (v15 >> 18) & 0x1FF;
      if ((unint64_t)v13 >= 448 - v18)
      {
        v14 |= 7uLL;
        v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v18 - 448);
      }
      else
      {
        v14 |= 6uLL;
        v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v16 - 384);
      }
    }
    else if ((unint64_t)v13 >= 320 - (v15 & 0x1FF))
    {
      v14 |= 5uLL;
      v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v15 & 0x1FF) - 320);
    }
    else
    {
      v14 |= 4uLL;
      v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 23) - 256);
    }
  }
  else if ((unint64_t)v13 >= 128 - (unint64_t)(v12 >> 7))
  {
    v17 = (v12 >> 15);
    if ((unint64_t)v13 >= 192 - v17)
    {
      v14 |= 3uLL;
      v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v17 - 192);
    }
    else
    {
      v14 |= 2uLL;
      v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 7)
                                                                                      - 128);
    }
  }
  else if ((unint64_t)v13 >= 64 - (v12 & 0x7F))
  {
    v14 |= 1uLL;
    v13 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 & 0x7F) - 64);
  }
}

unint64_t internal::marisa::grimoire::vector::`anonymous namespace'::select_bit(internal::marisa::grimoire::vector::_anonymous_namespace_ *this, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (((a3 - ((a3 >> 1) & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((a3 - ((a3 >> 1) & 0x5555555555555555)) & 0x3333333333333333);
  v4 = (v3 + (v3 >> 4)) & 0xF0F0F0F0F0F0F0FLL;
  v5 = __clz(__rbit64(((((0x101010101010101 * v4) | 0x8080808080808080)
                      - 0x101010101010101 * (_QWORD)this
                      - 0x101010101010101) >> 7) & 0x101010101010101));
  return v5
       + a2
                                                                               * ((_QWORD)this
                                                                                - ((unint64_t)(0x101010101010100 * v4) >> v5))
                                                                               + (a3 >> v5)];
}

unint64_t internal::marisa::grimoire::vector::BitVector::select1(internal::marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  internal::marisa::grimoire::vector::_anonymous_namespace_ *v16;
  uint64_t v17;
  unint64_t v18;
  internal::marisa::grimoire::vector::_anonymous_namespace_ *v19;
  BOOL v20;
  internal::marisa::grimoire::vector::_anonymous_namespace_ *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;
  internal::marisa::grimoire::vector::_anonymous_namespace_ *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  internal::marisa::grimoire::vector::_anonymous_namespace_ *v33;
  BOOL v34;

  v2 = *((_QWORD *)this + 22);
  if ((a2 & 0x1FF) == 0)
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  v5 = *((_QWORD *)this + 10);
  if (v3 + 10 >= v4)
  {
    v7 = v5 + 12 * v3--;
    v8 = (unsigned int *)(v7 + 12);
    do
    {
      v9 = *v8;
      v8 += 3;
      ++v3;
    }
    while (v9 <= a2);
  }
  else
  {
    do
    {
      if (*(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2)
        v4 = (v4 + v3) >> 1;
      else
        v3 = (v4 + v3) >> 1;
    }
    while (v3 + 1 < v4);
  }
  v10 = (unsigned int *)(v5 + 12 * v3);
  v11 = v10[1];
  v12 = a2 - *v10;
  v13 = 8 * v3;
  if (v12 >= v11 >> 23)
  {
    v23 = v11 >> 23;
    v24 = *(unsigned int *)(v5 + 12 * v3 + 8);
    v25 = (v24 >> 9) & 0x1FF;
    v26 = (v24 >> 18) & 0x1FF;
    v27 = v13 | 7;
    v28 = v12 >= v26;
    if (v12 < v26)
      v29 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v25);
    else
      v29 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v26);
    if (!v28)
      v27 = v13 | 6;
    v30 = v24 & 0x1FF;
    v31 = v13 | 5;
    v32 = v13 | 4;
    v33 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v23);
    v34 = v12 >= v30;
    if (v12 < v30)
      v21 = v33;
    else
      v21 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v30);
    if (v34)
      v32 = v31;
    if (v12 < v25)
    {
      v22 = v32;
    }
    else
    {
      v21 = v29;
      v22 = v27;
    }
  }
  else
  {
    v14 = v11 >> 7;
    v15 = (v11 >> 15);
    v16 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - (v11 >> 7));
    if (v12 < v15)
    {
      v17 = v13 | 2;
    }
    else
    {
      v16 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v15);
      v17 = v13 | 3;
    }
    v18 = v11 & 0x7F;
    v20 = v12 >= v18;
    v19 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v18);
    if (v20)
      v13 |= 1uLL;
    else
      v19 = (internal::marisa::grimoire::vector::_anonymous_namespace_ *)v12;
    v20 = v12 >= v14;
    if (v12 < v14)
      v21 = v19;
    else
      v21 = v16;
    if (v20)
      v22 = v17;
    else
      v22 = v13;
  }
}

void internal::marisa::grimoire::vector::BitVector::build_index(internal::marisa::grimoire::vector::BitVector *this, const internal::marisa::grimoire::vector::BitVector *a2, int a3, int a4)
{
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  int v14;
  unsigned int v15;
  _DWORD *v16;
  unsigned int v17;
  _DWORD *v18;
  unsigned int v19;
  _DWORD *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t *v24;
  _DWORD *v25;
  _DWORD *v26;
  int v27;

  v8 = *((_QWORD *)a2 + 6);
  v9 = (uint64_t *)((char *)this + 64);
  v10 = v8 >> 9;
  if ((v8 & 0x1FF) != 0)
    ++v10;
  internal::marisa::grimoire::vector::Vector<internal::marisa::grimoire::vector::RankIndex>::resize(v9, v10 + 1);
  if (*((_QWORD *)a2 + 3))
    __asm { BR              X10 }
  if ((v8 & 0x1FF) != 0)
  {
    v11 = (v8 - 1) >> 9;
    switch(((v8 - 1) >> 6) & 7)
    {
      case 0uLL:
        v12 = *((_QWORD *)this + 9);
        v13 = (_DWORD *)(v12 + 12 * v11);
        v14 = -*v13;
        v15 = v13[1] & 0xFFFFFF80 | v14 & 0x7F;
        v13[1] = v15;
        goto LABEL_9;
      case 1uLL:
        v12 = *((_QWORD *)this + 9);
        v16 = (_DWORD *)(v12 + 12 * v11);
        v15 = v16[1];
        v14 = -*v16;
LABEL_9:
        v17 = v15 & 0xFFFF807F | (v14 << 7);
        *(_DWORD *)(v12 + 12 * v11 + 4) = v17;
        goto LABEL_11;
      case 2uLL:
        v12 = *((_QWORD *)this + 9);
        v18 = (_DWORD *)(v12 + 12 * v11);
        v17 = v18[1];
        v14 = -*v18;
LABEL_11:
        v19 = v17 & 0xFF807FFF | (v14 << 15);
        *(_DWORD *)(v12 + 12 * v11 + 4) = v19;
        goto LABEL_13;
      case 3uLL:
        v12 = *((_QWORD *)this + 9);
        v20 = (_DWORD *)(v12 + 12 * v11);
        v19 = v20[1];
        v14 = -*v20;
LABEL_13:
        *(_DWORD *)(v12 + 12 * v11 + 4) = v19 & 0x7FFFFF | ((unsigned __int16)v14 << 23);
        goto LABEL_15;
      case 4uLL:
        v12 = *((_QWORD *)this + 9);
        v14 = -*(_DWORD *)(v12 + 12 * v11);
LABEL_15:
        v21 = v12 + 12 * v11;
        v22 = *(_DWORD *)(v21 + 8) & 0xFFFFFE00 | v14 & 0x1FF;
        *(_DWORD *)(v21 + 8) = v22;
        goto LABEL_16;
      case 5uLL:
        v12 = *((_QWORD *)this + 9);
        v25 = (_DWORD *)(v12 + 12 * v11);
        v22 = v25[2];
        v14 = -*v25;
LABEL_16:
        v23 = v22 & 0xFFFC01FF | ((v14 & 0x1FF) << 9);
        *(_DWORD *)(v12 + 12 * v11 + 8) = v23;
        goto LABEL_17;
      case 6uLL:
        v12 = *((_QWORD *)this + 9);
        v26 = (_DWORD *)(v12 + 12 * v11);
        v23 = v26[2];
        v14 = -*v26;
LABEL_17:
        *(_DWORD *)(v12 + 12 * v11 + 8) = v23 & 0xF803FFFF | ((v14 & 0x1FF) << 18);
        break;
      default:
        break;
    }
  }
  *((_QWORD *)this + 6) = v8;
  *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
  *(_DWORD *)(*((_QWORD *)this + 9) + 12 * *((_QWORD *)this + 11) - 12) = 0;
  if (a3)
  {
    v27 = v8;
    internal::marisa::grimoire::vector::Vector<unsigned int>::push_back((uint64_t *)this + 14, &v27);
    internal::marisa::grimoire::vector::Vector<unsigned int>::shrink((_DWORD *)this + 28);
  }
  if (a4)
  {
    v24 = (uint64_t *)((char *)this + 160);
    v27 = v8;
    internal::marisa::grimoire::vector::Vector<unsigned int>::push_back(v24, &v27);
    internal::marisa::grimoire::vector::Vector<unsigned int>::shrink(v24);
  }
}

uint64_t *internal::marisa::grimoire::vector::Vector<unsigned int>::push_back(uint64_t *result, _DWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = result;
  v4 = result[3];
  v5 = result[4];
  v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    v7 = 2 * v5;
    if (v5 >> 61)
      v7 = 0x3FFFFFFFFFFFFFFFLL;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    result = (uint64_t *)internal::marisa::grimoire::vector::Vector<unsigned int>::realloc(result, v8);
    v4 = v3[3];
    v6 = v4 + 1;
  }
  *(_DWORD *)(v3[1] + 4 * v4) = *a2;
  v3[3] = v6;
  return result;
}

_DWORD *internal::marisa::grimoire::vector::Vector<unsigned int>::shrink(_DWORD *result)
{
  uint64_t v1;
  _QWORD *exception;

  if (*((_BYTE *)result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &off_1E26321F0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x100000072;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/TrieUtils/src/third_party/marisa/lib/marisa/grimoire/vector/vec"
                   "tor.h:114: MARISA_STATE_ERROR: fixed_";
  }
  v1 = *((_QWORD *)result + 3);
  if (v1 != *((_QWORD *)result + 4))
    return internal::marisa::grimoire::vector::Vector<unsigned int>::realloc((uint64_t *)result, v1);
  return result;
}

void nlp::CFScopedPtr<__CFBundle *>::reset(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  *a1 = 0;
}

void nlp::CFScopedPtr<__CFLocale const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

CEM::LocalizedStringTable *CEM::LocalizedStringTable::LocalizedStringTable(CEM::LocalizedStringTable *this, CFTypeRef cf, const __CFLocale *a3)
{
  CEM *v5;
  CEM *FrameworkBundle;
  const __CFLocale *v7;

  *(_QWORD *)this = CFRetain(cf);
  v5 = (CEM *)CFRetain(a3);
  *((_QWORD *)this + 1) = v5;
  FrameworkBundle = (CEM *)CEM::createFrameworkBundle(v5);
  *((_QWORD *)this + 2) = FrameworkBundle;
  *((_QWORD *)this + 3) = CEM::copyPreferredLocaleIdentifierFromFrameworkBundleWithLocale(FrameworkBundle, *((__CFBundle **)this + 1), v7);
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 850045863;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_QWORD *)this + 12) = 0;
  return this;
}

void sub_18D72EA98(_Unwind_Exception *a1)
{
  const void **v1;
  const void **v2;
  const void **v3;
  const void **v4;

  v4 = v3;
  nlp::CFScopedPtr<__CFBundle *>::reset(v4);
  nlp::CFScopedPtr<__CFLocale const*>::reset(v2, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v1, 0);
  _Unwind_Resume(a1);
}

CFStringRef CEM::LocalizedStringTable::copyValueForKey(CEM::LocalizedStringTable *this, const __CFString *a2)
{
  BOOL IsChinese;
  CFAllocatorRef *v5;
  CFMutableStringRef MutableCopy;
  const __CFDictionary *LocalizedDataView;
  const __CFDictionary *v8;
  const __CFString *Value;
  CFStringRef Copy;

  IsChinese = CEM::deviceIsChinese(this);
  v5 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (IsChinese)
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a2);
    CFStringAppend(MutableCopy, CFSTR("@CH-SKU"));
    if (MutableCopy)
    {
      LocalizedDataView = (const __CFDictionary *)CEM::LocalizedStringTable::_getLocalizedDataView(this);
      if (CFDictionaryContainsKey(LocalizedDataView, MutableCopy))
        a2 = MutableCopy;
    }
  }
  else
  {
    MutableCopy = 0;
  }
  v8 = (const __CFDictionary *)CEM::LocalizedStringTable::_getLocalizedDataView(this);
  Value = (const __CFString *)CFDictionaryGetValue(v8, a2);
  if (Value)
  {
    Copy = CFStringCreateCopy(*v5, Value);
    if (!MutableCopy)
      return Copy;
    goto LABEL_11;
  }
  Copy = 0;
  if (MutableCopy)
LABEL_11:
    CFRelease(MutableCopy);
  return Copy;
}

void sub_18D72EBA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t CEM::LocalizedStringTable::_getLocalizedDataView(CEM::LocalizedStringTable *this)
{
  std::mutex *v2;
  uint64_t v3;
  const void *v4;

  v2 = (std::mutex *)((char *)this + 40);
  std::mutex::lock((std::mutex *)((char *)this + 40));
  v3 = *((_QWORD *)this + 4);
  if (!v3)
  {
    v4 = (const void *)CFBundleCopyLocalizedStringTableForLocalization();
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)this + 4, v4);
    v3 = *((_QWORD *)this + 4);
  }
  std::mutex::unlock(v2);
  return v3;
}

void sub_18D72EC28(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFDictionary const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

uint64_t *std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v2 + 8), 0);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

uint64_t CEM::initNSBundle(CEM *this)
{
  if (CEM::FoundationLibrary(void)::token != -1)
    dispatch_once(&CEM::FoundationLibrary(void)::token, &__block_literal_global_6);
  if (CEM::initNSBundle(void)::token != -1)
    dispatch_once(&CEM::initNSBundle(void)::token, &__block_literal_global);
  return CEM::classNSBundle;
}

uint64_t CEM::NSBundleFunction(CEM *this)
{
  return CEM::classNSBundle;
}

void nlp::CFScopedPtr<__CFURL const*>::reset(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  *a1 = 0;
}

Class ___ZN3CEML12initNSBundleEv_block_invoke()
{
  Class result;
  uint64_t v1;

  result = objc_getClass("NSBundle");
  CEM::classNSBundle = (uint64_t)result;
  if (result)
  {
    CEM::getNSBundleClass[0] = CEM::NSBundleFunction;
  }
  else
  {
    v1 = abort_report_np();
    return (Class)___ZN3CEML17FoundationLibraryEv_block_invoke(v1);
  }
  return result;
}

uint64_t CEM::initNSString(CEM *this)
{
  if (CEM::FoundationLibrary(void)::token != -1)
    dispatch_once(&CEM::FoundationLibrary(void)::token, &__block_literal_global_6);
  if (CEM::initNSString(void)::token != -1)
    dispatch_once(&CEM::initNSString(void)::token, &__block_literal_global_11);
  return CEM::classNSString;
}

uint64_t CEM::NSStringFunction(CEM *this)
{
  return CEM::classNSString;
}

Class ___ZN3CEML12initNSStringEv_block_invoke()
{
  Class result;
  int v1;
  CFStringRef v2;

  result = objc_getClass("NSString");
  CEM::classNSString = (uint64_t)result;
  if (result)
  {
    CEM::getNSStringClass = CEM::NSStringFunction;
  }
  else
  {
    v1 = abort_report_np();
    return (Class)CEM::VoiceoverStrings::createDescription(v1, v2);
  }
  return result;
}

CFStringRef CEM::VoiceoverStrings::createDescription(CEM::LocalizedStringTable **a1, CFStringRef theString, int a3, int a4)
{
  CFMutableStringRef MutableCopy;
  __CFString *VoiceoverSearchKeyForEmoji;
  CFStringRef v10;
  __CFString *v11;

  if (!theString || !*a1)
    return 0;
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  CFStringTransform(MutableCopy, 0, CFSTR("Any-SoftbankSMS"), 0);
  if (CFStringCompare(theString, MutableCopy, 0))
  {
    VoiceoverSearchKeyForEmoji = createVoiceoverSearchKeyForEmoji(MutableCopy, 0, a3, a4);
    v10 = CEM::LocalizedStringTable::copyValueForKey(*a1, VoiceoverSearchKeyForEmoji);
    if (v10)
      goto LABEL_12;
  }
  else
  {
    VoiceoverSearchKeyForEmoji = 0;
  }
  v11 = createVoiceoverSearchKeyForEmoji(theString, 0, a3, a4);
  if (VoiceoverSearchKeyForEmoji)
    CFRelease(VoiceoverSearchKeyForEmoji);
  v10 = CEM::LocalizedStringTable::copyValueForKey(*a1, v11);
  if (v10)
  {
    VoiceoverSearchKeyForEmoji = v11;
LABEL_12:
    if (!VoiceoverSearchKeyForEmoji)
      goto LABEL_14;
    goto LABEL_13;
  }
  VoiceoverSearchKeyForEmoji = createVoiceoverSearchKeyForEmoji(theString, 1, a3, a4);
  if (v11)
    CFRelease(v11);
  v10 = CEM::LocalizedStringTable::copyValueForKey(*a1, VoiceoverSearchKeyForEmoji);
  if (!VoiceoverSearchKeyForEmoji)
    goto LABEL_14;
LABEL_13:
  CFRelease(VoiceoverSearchKeyForEmoji);
LABEL_14:
  if (MutableCopy)
    CFRelease(MutableCopy);
  return v10;
}

void sub_18D72F068(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  const void *v5;
  va_list va1;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v5 = va_arg(va2, const void *);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2);
  _Unwind_Resume(a1);
}

__CFString *createVoiceoverSearchKeyForEmoji(const __CFString *a1, int a2, int a3, int a4)
{
  CFIndex Length;
  __CFString *Mutable;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t i;
  CFIndex v12;
  UniChar *v13;
  int64_t v14;
  int v15;
  int v16;
  const __CFString *v19;
  int64_t v20;
  int64_t v22;
  const __CFString *v23;
  BOOL v24;
  const __CFString *v25;
  UniChar buffer[64];
  CFStringRef theString;
  UniChar *v30;
  const char *v31;
  uint64_t v32;
  CFIndex v33;
  int64_t v34;
  int64_t v35;
  char __str[16];
  uint64_t v37;
  CFRange v38;

  v37 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(a1);
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("UnicodeHex."));
  theString = a1;
  v32 = 0;
  v33 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v30 = (UniChar *)CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v34 = 0;
  v35 = 0;
  v31 = CStringPtr;
  if (Length >= 1)
  {
    for (i = 0; i != Length; ++i)
    {
      v12 = v33;
      if (v33 <= i)
      {
        LOWORD(v15) = 0;
      }
      else
      {
        v13 = v30;
        if (v30)
        {
          v14 = v32 + i;
          goto LABEL_8;
        }
        if (!v31)
        {
          v20 = v34;
          if (v35 <= i || v34 > i)
          {
            v22 = i - 4;
            if ((unint64_t)i < 4)
              v22 = 0;
            if (v22 + 64 < v33)
              v12 = v22 + 64;
            v34 = v22;
            v35 = v12;
            v38.location = v32 + v22;
            v38.length = v12 - v22;
            CFStringGetCharacters(theString, v38, buffer);
            v20 = v34;
          }
          v14 = i - v20;
          v13 = buffer;
LABEL_8:
          v15 = v13[v14];
          if (v15 == 8205)
            v16 = a2;
          else
            v16 = 1;
          if (i == Length - 1 && v15 == 65039 || v16 == 0)
            continue;
          goto LABEL_22;
        }
        LOWORD(v15) = v31[v32 + i];
      }
      v15 = (unsigned __int16)v15;
LABEL_22:
      snprintf(__str, 0x10uLL, "%x", v15);
      v19 = CFStringCreateWithCString(0, __str, 0x8000100u);
      CFStringAppend(Mutable, v19);
      CFRelease(v19);
    }
  }
  if (a3 || a4)
  {
    v23 = CFSTR(".diverse");
    if (a4)
      v24 = a3 == 0;
    else
      v24 = 1;
    if (!v24)
      v23 = CFSTR(".diverse_hair");
    if (a3)
      v25 = v23;
    else
      v25 = CFSTR(".hair");
    CFStringAppend(Mutable, v25);
    if (a4 == 4)
      CFStringAppend(Mutable, CFSTR("@bald"));
  }
  return Mutable;
}

void nlp::CFScopedPtr<__CFString *>::reset(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  *a1 = 0;
}

void std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor(v4 - 32);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *CEM::AdaptationDatabase::executeStatement(CEM::AdaptationDatabase *this, CEM::Statement *a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  v5[0] = &off_1E26327E8;
  v5[1] = this;
  v6 = v5;
  CEM::AdaptationDatabase::executeStatement((uint64_t)a2, a3, (uint64_t)v5);
  result = v6;
  if (v6 == v5)
  {
    v4 = 4;
    result = v5;
  }
  else
  {
    if (!v6)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

void sub_18D72F42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 24;
        std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(*((_QWORD **)v4 - 2));
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void CEM::Statement::~Statement(void **this)
{
  void **v2;

  v2 = this + 7;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
}

void std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_1E2632E08[v2])(&v4, a1);
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSJ_1EJS8_jdSE_SH_EEEEEEDcSL_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSJ_1EJS8_jdSE_SH_EEEEEEDcSL_DpT0_(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void CEM::AdaptationDatabase::executeStatement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  size_t v19;
  int v20;
  char *v21;
  int v22;
  const void *v23;
  const void *v24;
  char *v25;
  char *v26;
  __int128 v27;
  char *v28;
  char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t *v34;
  uint64_t **v35;
  uint64_t **v36;
  uint64_t *i;
  _QWORD *v38;
  uint64_t v39;
  int v40;
  NSObject *v41;
  std::mutex *v42;
  uint64_t *v44;
  _QWORD *v45[2];
  __int128 v46;
  uint64_t v47;
  char v48;
  _BYTE buf[28];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v42 = (std::mutex *)(a1 + 32);
  std::mutex::lock((std::mutex *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 24);
  if (v5)
  {
    *(_QWORD *)(a2 + 96) = v5;
    CEM::Statement::prepare((CEM::Statement *)a2);
    while (1)
    {
      if (!*(_QWORD *)(a2 + 80))
        goto LABEL_55;
      v6 = *(_QWORD *)(a2 + 56);
      if (*(_QWORD *)(a2 + 64) == v6)
        goto LABEL_49;
      v7 = 0;
      v8 = 0;
      while (1)
      {
        LODWORD(v44) = 1;
        *(_QWORD *)buf = a2;
        *(_QWORD *)&buf[8] = &v44;
        *(_QWORD *)&buf[16] = v8;
        v9 = *(unsigned int *)(v6 + v7 + 24);
        if ((_DWORD)v9 == -1)
          std::__throw_bad_variant_access[abi:ne180100]();
        *(_QWORD *)&v46 = buf;
        ((void (*)(__int128 *))*(&off_1E2633440 + v9))(&v46);
        if ((_DWORD)v44)
          break;
        ++v8;
        v6 = *(_QWORD *)(a2 + 56);
        v7 += 32;
        if (v8 >= (*(_QWORD *)(a2 + 64) - v6) >> 5)
          goto LABEL_49;
      }
      if (cem_logging_get_adaptation_log_onceToken != -1)
        dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
      v10 = cem_logging_get_adaptation_log_log;
      if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
      {
        v11 = *(char *)(a2 + 55);
        v12 = *(_QWORD *)(a2 + 32);
        v13 = sqlite3_errmsg(*(sqlite3 **)(a2 + 96));
        *(_DWORD *)buf = 67109634;
        v14 = a2 + 32;
        if (v11 < 0)
          v14 = v12;
        *(_DWORD *)&buf[4] = v8;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = v14;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v13;
        _os_log_error_impl(&dword_18D71E000, v10, OS_LOG_TYPE_ERROR, "Could not bind argument (%d) for query '%{public}s'. Error: '%{public}s'", buf, 0x1Cu);
      }
LABEL_49:
      while (1)
      {
        v40 = sqlite3_step(*(sqlite3_stmt **)(a2 + 80));
        *(_DWORD *)(a2 + 104) = v40;
        if (v40 != 100)
          break;
        v45[0] = 0;
        v45[1] = 0;
        v44 = (uint64_t *)v45;
        v15 = sqlite3_column_count(*(sqlite3_stmt **)(a2 + 80));
        if (v15)
        {
          v16 = 0;
          v17 = v15;
          do
          {
            v18 = sqlite3_column_name(*(sqlite3_stmt **)(a2 + 80), v16);
            v19 = strlen(v18);
            switch(sqlite3_column_type(*(sqlite3_stmt **)(a2 + 80), v16))
            {
              case 1:
                *(_DWORD *)buf = sqlite3_column_int(*(sqlite3_stmt **)(a2 + 80), v16);
                v20 = 1;
                goto LABEL_28;
              case 2:
                *(_QWORD *)buf = sqlite3_column_double(*(sqlite3_stmt **)(a2 + 80), v16);
                v20 = 2;
                goto LABEL_28;
              case 3:
                v21 = (char *)sqlite3_column_text(*(sqlite3_stmt **)(a2 + 80), v16);
                std::string::basic_string[abi:ne180100]<0>(&v46, v21);
                *(_OWORD *)buf = v46;
                *(_QWORD *)&buf[16] = v47;
                v20 = 3;
                goto LABEL_28;
              case 4:
                v22 = sqlite3_column_bytes(*(sqlite3_stmt **)(a2 + 80), v16);
                v23 = sqlite3_column_blob(*(sqlite3_stmt **)(a2 + 80), v16);
                if (v22)
                {
                  if (v22 < 0)
                    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                  v24 = v23;
                  v25 = (char *)operator new(v22);
                  v26 = &v25[v22];
                  memmove(v25, v24, v22);
                  *(_QWORD *)&v27 = v25;
                  *((_QWORD *)&v27 + 1) = v26;
                }
                else
                {
                  v26 = 0;
                  v27 = 0uLL;
                }
                *(_OWORD *)buf = v27;
                *(_QWORD *)&buf[16] = v26;
                v20 = 4;
LABEL_28:
                *(_DWORD *)&buf[24] = v20;
                break;
              case 5:
                *(_DWORD *)&buf[24] = 0;
                break;
              default:
                __assert_rtn("getValueForColumnAtIndex", "Statement.cpp", 94, "false && \"SQLITE column type currently not supported.\"");
            }
            v28 = (char *)operator new(0x58uLL);
            v29 = v28;
            *(_QWORD *)&v46 = v28;
            *((_QWORD *)&v46 + 1) = v45;
            v30 = v28 + 32;
            LOBYTE(v47) = 0;
            if (v19 >= 0x7FFFFFFFFFFFFFF8)
              std::string::__throw_length_error[abi:ne180100]();
            if (v19 >= 0x17)
            {
              v31 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v19 | 7) != 0x17)
                v31 = v19 | 7;
              v32 = v31 + 1;
              v30 = operator new(v31 + 1);
              *((_QWORD *)v29 + 5) = v19;
              *((_QWORD *)v29 + 6) = v32 | 0x8000000000000000;
              *((_QWORD *)v29 + 4) = v30;
            }
            else
            {
              v28[55] = v19;
              if (!v19)
                goto LABEL_37;
            }
            memmove(v30, v18, v19);
LABEL_37:
            *((_BYTE *)v30 + v19) = 0;
            v29[56] = 0;
            *((_DWORD *)v29 + 20) = -1;
            v33 = *(_DWORD *)&buf[24];
            if (*(_DWORD *)&buf[24] != -1)
            {
              ((void (*)(char *))off_1E2632E58[*(unsigned int *)&buf[24]])(&v48);
              *((_DWORD *)v29 + 20) = v33;
            }
            LOBYTE(v47) = 1;
            v34 = (uint64_t *)v46;
            v35 = v45;
            v36 = v45;
            for (i = v45[0]; i; i = v35[1])
            {
              while (1)
              {
                v35 = (uint64_t **)i;
                v38 = i + 4;
                if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v34 + 4, i + 4) & 0x80) == 0)
                  break;
                i = *v35;
                v36 = v35;
                if (!*v35)
                  goto LABEL_45;
              }
              if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v38, v34 + 4) & 0x80) == 0)
                goto LABEL_46;
              v36 = v35 + 1;
            }
LABEL_45:
            std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::__insert_node_at(&v44, (uint64_t)v35, v36, v34);
            *(_QWORD *)&v46 = 0;
LABEL_46:
            std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v46);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
            ++v16;
          }
          while (v16 != v17);
        }
        v39 = *(_QWORD *)(a3 + 24);
        if (!v39)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(uint64_t, uint64_t **))(*(_QWORD *)v39 + 48))(v39, &v44);
        std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(v45[0]);
      }
      *(_DWORD *)(a2 + 104) = sqlite3_finalize(*(sqlite3_stmt **)(a2 + 80));
      CEM::Statement::prepare((CEM::Statement *)a2);
    }
  }
  if (cem_logging_get_adaptation_log_onceToken != -1)
    dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
  v41 = cem_logging_get_adaptation_log_log;
  if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18D71E000, v41, OS_LOG_TYPE_DEBUG, "Database connection uninitialized; not executing SQL statement.",
      buf,
      2u);
  }
LABEL_55:
  std::mutex::unlock(v42);
}

void sub_18D72FB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  std::mutex::unlock(a12);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::__insert_node_at(uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _BYTE *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v4 = (uint64_t *)**result;
  if (v4)
  {
    *result = v4;
    a4 = *a3;
  }
  v5 = result[1];
  *((_BYTE *)a4 + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      v6 = (uint64_t *)a4[2];
      if (*((_BYTE *)v6 + 24))
        break;
      v7 = (uint64_t *)v6[2];
      v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        v11 = v7[1];
        if (!v11 || (v12 = *(unsigned __int8 *)(v11 + 24), v9 = (_BYTE *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            v13 = (uint64_t **)a4[2];
          }
          else
          {
            v13 = (uint64_t **)v6[1];
            v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              v14[2] = (uint64_t)v6;
              v7 = (uint64_t *)v6[2];
            }
            v13[2] = v7;
            *(_QWORD *)(v6[2] + 8 * (*(_QWORD *)v6[2] != (_QWORD)v6)) = v13;
            *v13 = v6;
            v6[2] = (uint64_t)v13;
            v7 = v13[2];
            v6 = (uint64_t *)*v7;
          }
          *((_BYTE *)v13 + 24) = 1;
          *((_BYTE *)v7 + 24) = 0;
          v17 = v6[1];
          *v7 = v17;
          if (v17)
            *(_QWORD *)(v17 + 16) = v7;
          v6[2] = v7[2];
          *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }
      else if (!v8 || (v10 = *((unsigned __int8 *)v8 + 24), v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          v15 = a4[1];
          *v6 = v15;
          if (v15)
          {
            *(_QWORD *)(v15 + 16) = v6;
            v7 = (uint64_t *)v6[2];
          }
          a4[2] = (uint64_t)v7;
          *(_QWORD *)(v6[2] + 8 * (*(_QWORD *)v6[2] != (_QWORD)v6)) = a4;
          a4[1] = (uint64_t)v6;
          v6[2] = (uint64_t)a4;
          v7 = (uint64_t *)a4[2];
        }
        else
        {
          a4 = (uint64_t *)a4[2];
        }
        *((_BYTE *)a4 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v6 = (uint64_t *)v7[1];
        v16 = *v6;
        v7[1] = *v6;
        if (v16)
          *(_QWORD *)(v16 + 16) = v7;
        v6[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v6;
        *v6 = (uint64_t)v7;
LABEL_29:
        v7[2] = (uint64_t)v6;
        break;
      }
      *((_BYTE *)v6 + 24) = 1;
      a4 = v7;
      *((_BYTE *)v7 + 24) = v7 == v5;
      *v9 = 1;
    }
    while (v7 != v5);
  }
  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,0>((uint64_t)v1 + 32);
    operator delete(v1);
  }
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, _QWORD *a2)
{
  size_t v2;
  size_t v3;
  size_t v4;
  size_t v5;
  size_t v6;
  int v7;

  v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (_QWORD *)*a1;
    v3 = v2;
  }
  v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (_QWORD *)*a2;
    v5 = v4;
  }
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (v3 == v5)
      return 0;
    if (v3 >= v5)
      return 1;
  }
  return 255;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSP_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEEOSX_EEEDcSP_DpT0_(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = *a3;
}

double _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSP_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEEOSX_EEEDcSP_DpT0_(uint64_t a1, _QWORD *a2, double *a3)
{
  double result;

  result = *a3;
  *a2 = *(_QWORD *)a3;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSP_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEEOSX_EEEDcSP_DpT0_(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result;

  result = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  *a2 = result;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  a3->n128_u64[0] = 0;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSP_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEEOSX_EEEDcSP_DpT0_(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result;

  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  result = *a3;
  *a2 = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  return result;
}

void std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E26327E8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E26327E8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::operator()(uint64_t a1, _QWORD *a2)
{
  uint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  _QWORD *v28;

  v3 = *(uint64_t **)(a1 + 8);
  v4 = v3[1];
  v5 = v3[2];
  if (v4 >= v5)
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - *v3) >> 3);
    if (v8 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *v3) >> 3);
    v10 = 2 * v9;
    if (2 * v9 <= v8 + 1)
      v10 = v8 + 1;
    if (v9 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v10;
    v28 = v3 + 2;
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v12 = (char *)operator new(24 * v11);
    }
    else
    {
      v12 = 0;
    }
    v24 = v12;
    v25 = &v12[24 * v8];
    v27 = &v12[24 * v11];
    std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::map[abi:ne180100]((uint64_t)v25, a2);
    v13 = (uint64_t)v25;
    v7 = (uint64_t)(v25 + 24);
    v26 = v25 + 24;
    v15 = *v3;
    v14 = v3[1];
    if (v14 == *v3)
    {
      v22 = v3[1];
    }
    else
    {
      v16 = 0;
      do
      {
        v17 = v13 + v16;
        *(_QWORD *)(v17 - 24) = *(_QWORD *)(v14 + v16 - 24);
        v18 = (uint64_t *)(v14 + v16 - 16);
        v19 = *v18;
        *(_QWORD *)(v13 + v16 - 16) = *v18;
        v20 = v13 + v16 - 16;
        v21 = *(_QWORD *)(v14 + v16 - 8);
        *(_QWORD *)(v17 - 8) = v21;
        if (v21)
        {
          *(_QWORD *)(v19 + 16) = v20;
          *(_QWORD *)(v14 + v16 - 24) = v18;
          *v18 = 0;
          *(_QWORD *)(v14 + v16 - 8) = 0;
        }
        else
        {
          *(_QWORD *)(v17 - 24) = v20;
        }
        v16 -= 24;
      }
      while (v14 + v16 != v15);
      v13 += v16;
      v22 = *v3;
      v14 = v3[1];
      v7 = (uint64_t)v26;
    }
    *v3 = v13;
    v24 = (char *)v22;
    v25 = (char *)v22;
    v3[1] = v7;
    v26 = (char *)v14;
    v23 = (char *)v3[2];
    v3[2] = (uint64_t)v27;
    v27 = v23;
    result = std::__split_buffer<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::~__split_buffer((uint64_t)&v24);
  }
  else
  {
    result = std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::map[abi:ne180100](v3[1], a2);
    v7 = v4 + 24;
    v3[1] = v4 + 24;
  }
  v3[1] = v7;
  return result;
}

void sub_18D730124(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN3CEM18AdaptationDatabase16executeStatementERNS_9StatementEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0,std::allocator<CEM::AdaptationDatabase::executeStatement(CEM::Statement &)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a1 == a2)
    return 1;
  if ((a2 & a1) < 0 != __OFSUB__(a1, a2))
    return strcmp((const char *)(a1 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::map[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  uint64_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  BOOL v10;
  uint64_t **v11;
  uint64_t **v12;
  uint64_t *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  __int128 v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v21[2];
  char v22;

  *(_QWORD *)(a1 + 8) = 0;
  v3 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  v4 = a2 + 1;
  v5 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    while (1)
    {
      v6 = *(uint64_t **)(a1 + 8);
      v7 = v3;
      if (*(uint64_t **)a1 != v3)
      {
        v8 = *(uint64_t **)(a1 + 8);
        v9 = v3;
        if (v6)
        {
          do
          {
            v7 = v8;
            v8 = (uint64_t *)v8[1];
          }
          while (v8);
        }
        else
        {
          do
          {
            v7 = (uint64_t *)v9[2];
            v10 = *v7 == (_QWORD)v9;
            v9 = v7;
          }
          while (v10);
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v7 + 4, v5 + 4) & 0x80) == 0)
          break;
      }
      v11 = (uint64_t **)v3;
      v12 = (uint64_t **)v3;
      if (!v6)
        goto LABEL_19;
      v12 = (uint64_t **)(v7 + 1);
      if (!v7[1])
      {
        v11 = (uint64_t **)v7;
LABEL_19:
        v15 = (char *)operator new(0x58uLL);
        v16 = v15;
        v21[0] = (uint64_t *)v15;
        v21[1] = v3;
        v22 = 0;
        if (*((char *)v5 + 55) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)(v15 + 32), (const std::string::value_type *)v5[4], v5[5]);
        }
        else
        {
          v17 = *((_OWORD *)v5 + 2);
          *((_QWORD *)v15 + 6) = v5[6];
          *((_OWORD *)v15 + 2) = v17;
        }
        std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)(v16 + 56), (uint64_t)(v5 + 7));
        v22 = 1;
        std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::__insert_node_at((uint64_t **)a1, (uint64_t)v11, v12, v21[0]);
        v21[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v21);
      }
LABEL_23:
      v18 = (_QWORD *)v5[1];
      if (v18)
      {
        do
        {
          v19 = v18;
          v18 = (_QWORD *)*v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          v19 = (_QWORD *)v5[2];
          v10 = *v19 == (_QWORD)v5;
          v5 = v19;
        }
        while (!v10);
      }
      v5 = v19;
      if (v19 == v4)
        return a1;
    }
    v11 = (uint64_t **)v3;
    v12 = (uint64_t **)v3;
    if (v6)
    {
      v13 = v6;
      do
      {
        while (1)
        {
          v11 = (uint64_t **)v13;
          v14 = v13 + 4;
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v5 + 4, v13 + 4) & 0x80) == 0)
            break;
          v13 = *v11;
          v12 = v11;
          if (!*v11)
            goto LABEL_19;
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v14, v5 + 4) & 0x80) == 0)
          goto LABEL_23;
        v12 = v11 + 1;
        v13 = v11[1];
      }
      while (v13);
    }
    goto LABEL_19;
  }
  return a1;
}

void sub_18D7303A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  _QWORD **v2;
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(*v2);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;
    std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::destroy(*(_QWORD **)(i - 16));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::__copy_constructor(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v5;

  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 24) = -1;
  v3 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v3 != -1)
  {
    ((void (*)(char *, uint64_t, uint64_t))off_1E2632E30[v3])(&v5, a1, a2);
    *(_DWORD *)(a1 + 24) = v3;
  }
  return a1;
}

void sub_18D730498(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor(v1);
  _Unwind_Resume(a1);
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSR_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEERKSZ_EEEDcSR_DpT0_(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = *a3;
}

double _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSR_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEERKSZ_EEEDcSR_DpT0_(uint64_t a1, _QWORD *a2, double *a3)
{
  double result;

  result = *a3;
  *a2 = *(_QWORD *)a3;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSR_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEERKSZ_EEEDcSR_DpT0_(int a1, std::string *this, __int128 *a3)
{
  __int128 v3;

  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v3 = *a3;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
}

void *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateEjdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_6vectorIhNSC_IhEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISI_LNS0_6_TraitE1EEEEEvRSJ_OT_EUlRSR_OT0_E_JRNS0_6__baseILSM_1EJS8_jdSE_SH_EEERKSZ_EEEDcSR_DpT0_(int a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  const void *v4;
  size_t v5;
  char *v7;
  void *result;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = *(const void **)a3;
  v3 = *(_QWORD *)(a3 + 8);
  v5 = v3 - *(_QWORD *)a3;
  if (v3 != *(_QWORD *)a3)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a2, v3 - *(_QWORD *)a3);
    v7 = (char *)a2[1];
    result = memmove(v7, v4, v5);
    a2[1] = &v7[v5];
  }
  return result;
}

void sub_18D730554(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t CEMCreateEmojiLocaleData(CFLocaleIdentifier localeIdentifier)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFAllocator *v6;
  const __CFLocale *v7;
  const __CFString *Value;
  CFLocaleRef v9;
  const __CFURL *v10;
  const __CFURL *v11;
  const __CFURL *v12;
  __int128 buf;

  if (localeIdentifier)
  {
    if (sharedEmojiData(void)::onceToken != -1)
      dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
    v2 = sharedEmojiData(void)::data;
    v3 = sharedMonochromeSymbolData(localeIdentifier);
    if (v2)
    {
      v4 = v3;
      v5 = operator new();
      *(_OWORD *)(v5 + 16) = 0u;
      *(_OWORD *)v5 = 0u;
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v7 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], localeIdentifier);
      Value = (const __CFString *)CFLocaleGetValue(v7, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
      if (CFStringCompare(CFSTR("ars"), Value, 0))
      {
        v9 = v7;
      }
      else
      {
        v9 = CFLocaleCreate(v6, CFSTR("ar"));
        if (v7)
          CFRelease(v7);
      }
      *(_OWORD *)(v5 + 40) = 0u;
      *(_QWORD *)(v5 + 32) = v9;
      *(_OWORD *)(v5 + 72) = 0u;
      *(_QWORD *)(v5 + 88) = 0;
      *(_OWORD *)(v5 + 56) = 0u;
      *(_QWORD *)(v5 + 96) = v2;
      *(_QWORD *)(v5 + 104) = v4;
      v10 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
      *(_QWORD *)&buf = v10;
      v11 = CFURLCreateCopyAppendingPathComponent(v6, v10, CFSTR("/Library/Keyboard"), 1u);
      if (v10)
        CFRelease(v10);
      v12 = CFURLCreateCopyAppendingPathComponent(v6, v11, CFSTR("emoji_adaptation.db"), 0);
      if (v11)
        CFRelease(v11);
      *(_DWORD *)(v5 + 112) = 0;
      CEM::getUTF8StringFromCFString((_QWORD *)(v5 + 120), localeIdentifier);
      CEM::getFileSystemRepresentationFromCFURL((CEM *)&buf, v12);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(buf) = 0;
    _os_log_fault_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "A valid, non-null locale identifier is required to initialize a CEMEmojiLocaleDataRef.", (uint8_t *)&buf, 2u);
  }
  return 0;
}

void sub_18D730C00(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18D7306A4);
}

const __CFString *sharedMonochromeSymbolData(const __CFString *localeIdentifier)
{
  const __CFLocale *v1;
  const __CFString *Value;
  _BOOL4 v3;

  if (!localeIdentifier)
    return localeIdentifier;
  v1 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], localeIdentifier);
  Value = (const __CFString *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
  if (CFStringCompare(Value, CFSTR("zh"), 0) == kCFCompareEqualTo
    || CFStringCompare(Value, CFSTR("yue"), 0) == kCFCompareEqualTo)
  {
    v3 = 1;
    if (!v1)
      goto LABEL_8;
    goto LABEL_7;
  }
  v3 = CFStringCompare(Value, CFSTR("ja"), 0) == kCFCompareEqualTo;
  if (v1)
LABEL_7:
    CFRelease(v1);
LABEL_8:
  if (!v3)
    return 0;
  if (sharedMonochromeSymbolData(__CFString const*)::onceToken != -1)
    dispatch_once(&sharedMonochromeSymbolData(__CFString const*)::onceToken, &__block_literal_global_49);
  return (const __CFString *)sharedMonochromeSymbolData(__CFString const*)::data;
}

void sub_18D730EC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void ___ZL26sharedMonochromeSymbolDataPK10__CFString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFLocale *a5)
{
  const __CFURL *v5;
  const __CFLocale *v6;
  const __CFURL *v7;
  CEM::EmojiData *v8;

  v5 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("monochrome_symbol"), CFSTR("dat"), 0, 0, a5);
  v7 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("monochrome_symbolmeta"), CFSTR("dat"), 0, 0, v6);
  if (v5)
  {
    v8 = (CEM::EmojiData *)operator new();
    CEM::EmojiData::EmojiData(v8, v5, v7);
  }
  if (v7)
    CFRelease(v7);
}

void sub_18D730F88(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  uint64_t v9;
  uint64_t v11;

  v11 = v9;
  MEMORY[0x18D7921EC](v11, 0x1070C408606C210);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      a9 = 0;
      _os_log_error_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to load emoji data", (uint8_t *)&a9, 2u);
    }
    __cxa_end_catch();
    JUMPOUT(0x18D730F60);
  }
  _Unwind_Resume(a1);
}

void CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock(uint64_t a1, const __CFString *a2, CFRange a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t *v6;
  _QWORD v7[6];

  if (a1)
  {
    v6 = *(uint64_t **)(a1 + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock_block_invoke;
    v7[3] = &unk_1E2632E88;
    v7[4] = a6;
    v7[5] = a1;
    CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(v6, a2, a3, a5, 0, (uint64_t)v7);
  }
}

void sub_18D7310F0(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void CEMEmojiLocaleDataEnumerateSearchResultsIncludingSubstringsInStringWithBlock(uint64_t a1, const __CFString *a2, CFRange a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t *v6;
  _QWORD v7[6];

  if (a1)
  {
    v6 = *(uint64_t **)(a1 + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __CEMEmojiLocaleDataEnumerateSearchResultsIncludingSubstringsInStringWithBlock_block_invoke;
    v7[3] = &unk_1E2632EB0;
    v7[4] = a6;
    v7[5] = a1;
    CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(v6, a2, a3, a5, 1u, (uint64_t)v7);
  }
}

void sub_18D7311E0(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

__CFArray *CEMEmojiLocaleDataCreateEmojiTokensForString(__CFArray *a1, const __CFString *a2, const __CFString *a3, uint64_t a4, unsigned int a5, int a6)
{
  __CFArray *Wrappers;
  const __CFString *v11;
  BOOL v12;
  CFLocaleRef *v14;
  uint64_t *v15;
  CFMutableStringRef MutableCopy;
  _OWORD *v18;
  __CFArray *CEMEmojiTokensCFArray;
  __int128 v20;
  __int128 v21;
  char *v22;
  __int128 v23;
  char *v24;
  void **v25;

  Wrappers = a1;
  if (!a1)
    return Wrappers;
  v11 = (const __CFString *)MEMORY[0x18D791E5C](*(_QWORD *)(*((_QWORD *)a1 + 3) + 32));
  if (v11)
  {
    v12 = !CFStringHasPrefix(v11, CFSTR("en")) || a2 == 0;
    if (!v12 && a5 == 1)
    {
      if (CFStringCompare(a2, CFSTR("smile"), 1uLL))
      {
        if (CFStringCompare(a2, CFSTR("smiley"), 1uLL))
        {
          if (CFStringCompare(a2, CFSTR("happy"), 1uLL))
            goto LABEL_10;
          v18 = operator new(0x48uLL);
          *((_QWORD *)&v23 + 1) = (char *)v18 + 72;
          v24 = (char *)v18 + 72;
          v18[2] = xmmword_1E2632F28;
          v18[3] = *(_OWORD *)off_1E2632F38;
          *((_QWORD *)v18 + 8) = CFSTR("🙃");
          *v18 = xmmword_1E2632F08;
          v18[1] = *(_OWORD *)&off_1E2632F18;
          *(_QWORD *)&v23 = v18;
          CEMEmojiTokensCFArray = createCEMEmojiTokensCFArray((const __CFString ***)&v23);
        }
        else
        {
          v18 = operator new(0x20uLL);
          *((_QWORD *)&v23 + 1) = v18 + 2;
          v24 = (char *)(v18 + 2);
          *v18 = xmmword_1E2632EE8;
          v18[1] = *(_OWORD *)&off_1E2632EF8;
          *(_QWORD *)&v23 = v18;
          CEMEmojiTokensCFArray = createCEMEmojiTokensCFArray((const __CFString ***)&v23);
        }
      }
      else
      {
        v18 = operator new(0x18uLL);
        *((_QWORD *)&v23 + 1) = (char *)v18 + 24;
        v24 = (char *)v18 + 24;
        *v18 = xmmword_1E2632ED0;
        *((_QWORD *)v18 + 2) = CFSTR("😀");
        *(_QWORD *)&v23 = v18;
        CEMEmojiTokensCFArray = createCEMEmojiTokensCFArray((const __CFString ***)&v23);
      }
      Wrappers = CEMEmojiTokensCFArray;
      operator delete(v18);
      return Wrappers;
    }
  }
LABEL_10:
  v14 = (CFLocaleRef *)*((_QWORD *)Wrappers + 3);
  v22 = 0;
  v21 = 0uLL;
  if (!*v14 || (v15 = (uint64_t *)v14, (*((_WORD *)*v14 + 60) & 2) == 0))
  {
    if (a5 > 6 || (v15 = (uint64_t *)v14, ((1 << a5) & 0x72) == 0))
      v15 = (uint64_t *)(v14 + 1);
  }
  CEM::EmojiLocaleData::exactMatchEmojiTokensForSingleWord((uint64_t)&v23, (uint64_t)v14, a2, a3, a5, v15, a6);
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((void **)&v21);
  v20 = v23;
  v21 = v23;
  v22 = v24;
  v24 = 0;
  v23 = 0uLL;
  v25 = (void **)&v23;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&v25);
  if ((_QWORD)v20 == *((_QWORD *)&v20 + 1))
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, a2);
    CFStringLowercase(MutableCopy, v14[4]);
    CEM::EmojiLocaleData::exactMatchEmojiTokensForSingleWord((uint64_t)&v23, (uint64_t)v14, MutableCopy, a3, a5, v15, a6);
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((void **)&v21);
    v21 = v23;
    v22 = v24;
    v24 = 0;
    v23 = 0uLL;
    v25 = (void **)&v23;
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&v25);
    CFRelease(MutableCopy);
  }
  Wrappers = CEM::EmojiToken::createWrappers((uint64_t **)&v21, Wrappers);
  *(_QWORD *)&v23 = &v21;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v23);
  return Wrappers;
}

void sub_18D7314C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;

  operator delete(v15);
  _Unwind_Resume(a1);
}

__CFArray *createCEMEmojiTokensCFArray(const __CFString ***a1)
{
  __CFArray *Mutable;
  const __CFString **v3;
  const __CFString **v4;
  const void *v5;
  const void *v6;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1[1] - *a1, MEMORY[0x1E0C9B378]);
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    v5 = (const void *)CEMEmojiTokenCreateWithString(*v3, 0);
    if (v5)
    {
      v6 = v5;
      CFArrayAppendValue(Mutable, v5);
      CFRelease(v6);
    }
    ++v3;
  }
  return Mutable;
}

void std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](v4 - 16);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t CEMEmojiTokenCreateWithString(const __CFString *a1, _QWORD *a2)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    return 0;
  if (sharedEmojiData(void)::onceToken != -1)
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
  v4 = sharedEmojiData(void)::data;
  v5 = a2 ? (const __CFString *)MEMORY[0x18D791E5C](*(_QWORD *)(a2[3] + 32)) : 0;
  v6 = sharedMonochromeSymbolData(v5);
  if (!v4)
    return 0;
  v7 = (uint64_t)v6;
  CEM::EmojiData::advance(v4, *(_WORD **)(v4 + 32), 0x100000000, a1);
  v9 = v8 & 0x100000000;
  v10 = (unsigned __int16)v8;
  if ((BYTE4(v8) & ((unsigned __int16)v8 != 0)) == 0 && v7)
  {
    CEM::EmojiData::advance(v7, *(_WORD **)(v7 + 32), 0x100000000, a1);
    v9 = v8 & 0x100000000;
    v10 = (unsigned __int16)v8;
  }
  if (v10 && v9 != 0)
    return CEMEmojiTokenCreateWithIndex((unsigned __int16)v8, a2);
  else
    return 0;
}

uint64_t CEMEmojiTokenCreateWithIndex(unsigned int a1, _QWORD *a2)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  CEM::EmojiData *v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  uint64_t Wrapper;
  unint64_t v15;
  uint64_t v17[2];

  if (sharedEmojiData(void)::onceToken != -1)
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
  v4 = sharedEmojiData(void)::data;
  if (a2)
    v5 = (const __CFString *)MEMORY[0x18D791E5C](*(_QWORD *)(a2[3] + 32));
  else
    v5 = 0;
  v6 = sharedMonochromeSymbolData(v5);
  if (!v6
    || (v7 = (CEM::EmojiData *)v6, v8 = WORD2(v6[1].info), v9 = a1 >= v8, v10 = a1 - v8, v10 == 0 || !v9)
    || WORD1(v6[1].info) < (unsigned __int16)v10)
  {
    v7 = (CEM::EmojiData *)v4;
    if (!v4)
      return 0;
  }
  if (a2)
    v11 = a2[3];
  else
    v11 = 0;
  v12 = (std::__shared_weak_count *)operator new(0x48uLL);
  v12->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  v12->__shared_weak_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1E26329A0;
  v17[0] = CEM::EmojiToken::EmojiToken((uint64_t)&v12[1], a1, v7, v11);
  v17[1] = (uint64_t)v12;
  Wrapper = CEM::EmojiToken::createWrapper(v17, a2);
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  return Wrapper;
}

void std::__shared_ptr_emplace<CEM::EmojiToken>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E26329A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CEM::EmojiToken>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E26329A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x18D7921ECLL);
}

void std::__shared_ptr_emplace<CEM::EmojiToken>::__on_zero_shared(uint64_t a1)
{
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(a1 + 32), 0);
}

uint64_t CEMEmojiLocaleDataGetLocaleIdentifier(uint64_t result)
{
  if (result)
    JUMPOUT(0x18D791E5CLL);
  return result;
}

__CFArray *CEMEmojiLocaleDataCopyCommonEmojiTokens(const void *a1)
{
  __CFArray *Wrappers;
  uint64_t *v3[3];
  void **v4;

  if (!a1)
    return 0;
  memset(v3, 0, sizeof(v3));
  Wrappers = CEM::EmojiToken::createWrappers(v3, a1);
  v4 = (void **)v3;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&v4);
  return Wrappers;
}

void sub_18D73197C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

unint64_t CEMEmojiLocaleDataGetMecabraFlags(uint64_t a1, unsigned int a2, CFStringRef theString)
{
  std::string::value_type v3;
  uint64_t *v4;
  uint64_t v5;
  __int16 v6;
  unint64_t v7;
  std::string *v9;
  std::string::size_type size;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  std::string v15;
  std::string v16;
  std::string v17;

  if (!a1)
    return 0;
  v3 = a2;
  v4 = *(uint64_t **)(a1 + 24);
  v5 = *v4;
  if (!*v4 || (v6 = *(_WORD *)(v5 + 120), (v6 & 2) == 0))
  {
    if (a2 <= 6 && ((1 << a2) & 0x72) != 0)
    {
      if (!v5)
        return 0;
    }
    else
    {
      v5 = v4[1];
      if (!v5)
        return 0;
    }
    v6 = *(_WORD *)(v5 + 120);
  }
  if ((v6 & 1) == 0)
    return 0;
  CEM::getUTF8StringFromCFString(&v17, theString);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v15, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  else
    v15 = v17;
  std::string::basic_string[abi:ne180100]<0>(v13, "’");
  std::string::basic_string[abi:ne180100]<0>(__p, "'");
  CEM::replace((uint64_t)&v16, &v15, (uint64_t)v13, (uint64_t)__p);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  v17 = v16;
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if ((*(_WORD *)(v5 + 120) & 2) != 0)
    std::string::push_back(&v17, v3);
  LODWORD(v16.__r_.__value_.__l.__data_) = 0;
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = &v17;
  else
    v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  else
    size = v17.__r_.__value_.__l.__size_;
  if (trie::MarisaTrie<unsigned int,char>::lookup(v5 + 16, (uint64_t)v9, size, &v16))
    v7 = (unint64_t)LODWORD(v16.__r_.__value_.__l.__data_) >> 22;
  else
    v7 = 0;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  return v7;
}

void sub_18D731B28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (*(char *)(v26 - 25) < 0)
    operator delete(*(void **)(v26 - 48));
  _Unwind_Resume(exception_object);
}

uint64_t CEMEmojiLocaleDataEnableAdaptation(uint64_t result, int a2)
{
  int *v2;
  int v3;

  if (result)
  {
    v2 = (int *)(*(_QWORD *)(result + 24) + 112);
    if (!a2)
    {
      v3 = 1;
      goto LABEL_7;
    }
    if (*v2
      || (result = CEM::AdaptationController::initialize((CEM::AdaptationController *)(*(_QWORD *)(result + 24) + 112)),
          (_DWORD)result))
    {
      v3 = 2;
LABEL_7:
      *v2 = v3;
    }
  }
  return result;
}

uint64_t CEMEmojiLocaleDataRecordEmojiEngagement(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t v3;
  uint64_t v5;
  size_t v6;
  void **v7;
  void *v8;
  void **v9;
  void **v10;
  size_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v19;
  uint64_t *v20;
  __int128 *p_dst;
  uint64_t v22;
  uint64_t v23;
  CEM::AdaptationDatabase *v24;
  int v25;
  NSObject *v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  uint64_t *v31;
  __int128 *v32;
  uint64_t v33;
  uint64_t v34;
  CEM::AdaptationDatabase *v35;
  unint64_t v36;
  NSObject *v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  size_t v41;
  uint64_t *v42;
  __int128 *v43;
  uint64_t v44;
  uint64_t v45;
  CEM::AdaptationDatabase *v46;
  int v47;
  int v48;
  NSObject *v49;
  unsigned __int8 v50;
  uint64_t v51;
  uint64_t v52;
  size_t v53;
  uint64_t *v54;
  __int128 *v55;
  uint64_t v56;
  uint64_t v57;
  CEM::AdaptationDatabase *v58;
  unint64_t v59;
  NSObject *v60;
  uint64_t v61;
  size_t v62;
  uint64_t *v63;
  uint64_t i;
  const char *v65;
  int v66;
  const char *v67;
  int v68;
  uint64_t v69;
  void **v70;
  void **__src;
  void *__p[2];
  unsigned __int8 v73;
  void *v74[2];
  unsigned __int8 v75;
  _BYTE v76[24];
  __int128 __dst;
  unint64_t v78;
  uint8_t buf[8];
  uint64_t v80;
  uint64_t v81;
  void *v82[14];
  uint8_t *v83;
  char v84;
  __int128 v85;
  unint64_t v86;
  int v87;
  _DWORD v88[8];
  uint64_t v89;

  v3 = 0;
  v89 = *MEMORY[0x1E0C80C00];
  if (!a1 || !a2 || !a3)
    return v3;
  v5 = *(_QWORD *)(a1 + 24);
  CEM::getUTF8StringFromCFString(v74, a2);
  v6 = v75;
  v7 = (void **)v74[0];
  v8 = v74[1];
  CEM::getUTF8StringFromCFString(__p, a3);
  if ((v6 & 0x80u) == 0)
    v9 = v74;
  else
    v9 = v7;
  if ((v6 & 0x80u) != 0)
    v6 = (size_t)v8;
  if ((v73 & 0x80u) == 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  if ((v73 & 0x80u) == 0)
    v11 = v73;
  else
    v11 = (size_t)__p[1];
  if (*(_DWORD *)(v5 + 112) != 2)
  {
    v3 = 0;
    if ((v73 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  __src = v9;
  v12 = *(_QWORD *)(v5 + 168);
  std::mutex::lock((std::mutex *)(v12 + 64));
  if (!*(_QWORD *)(*(_QWORD *)(v12 + 128) + 24))
  {
    std::mutex::unlock((std::mutex *)(v12 + 64));
    goto LABEL_143;
  }
  v69 = v5;
  if ((v13 & 1) == 0
  {
  }
  if ((v14 & 1) == 0
  {
  }
  v15 = v12 + 144;
  if (*(char *)(v12 + 167) < 0)
  {
    v17 = *(_QWORD *)(v12 + 144);
    v16 = *(_QWORD *)(v12 + 152);
  }
  else
  {
    v16 = *(unsigned __int8 *)(v12 + 167);
    v17 = v12 + 144;
  }
  if (byte_1EE0729DF >= 0)
    v19 = byte_1EE0729DF;
  else
    v19 = unk_1EE0729D0;
  if (byte_1EE0729DF >= 0)
    v20 = &CEM::AdaptationDatabaseController::getStringId(std::string_view)const::sql;
  else
    v20 = (uint64_t *)CEM::AdaptationDatabaseController::getStringId(std::string_view)const::sql;
  if (v6 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v6 >= 0x17)
  {
    v22 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v22 = v6 | 7;
    v23 = v22 + 1;
    p_dst = (__int128 *)operator new(v22 + 1);
    *((_QWORD *)&__dst + 1) = v6;
    v78 = v23 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    v15 = v12 + 144;
    goto LABEL_41;
  }
  HIBYTE(v78) = v6;
  p_dst = &__dst;
  if (v6)
LABEL_41:
    memmove(p_dst, __src, v6);
  *((_BYTE *)p_dst + v6) = 0;
  v85 = __dst;
  v86 = v78;
  v87 = 3;
  v80 = 0;
  v81 = 0;
  *(_QWORD *)buf = 0;
  v83 = buf;
  v84 = 0;
  *(_QWORD *)buf = operator new(0x20uLL);
  v80 = *(_QWORD *)buf;
  v81 = *(_QWORD *)buf + 32;
  v80 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v85, (uint64_t)v88, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v82, v17, v16, v20, v19, (uint64_t *)buf);
  v83 = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  v24 = (CEM::AdaptationDatabase *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v85);
  CEM::AdaptationDatabase::executeStatement(v24, *(CEM::Statement **)(v12 + 128), (uint64_t)v82);
  v70 = v10;
  if (*((_QWORD *)&v85 + 1) != (_QWORD)v85)
  {
    if (*(_DWORD *)(*(_QWORD *)v85 + 80) == 1)
    {
      v25 = *(_DWORD *)(*(_QWORD *)v85 + 56);
      goto LABEL_50;
    }
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v26 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18D71E000, v26, OS_LOG_TYPE_ERROR, "Could not extract uint32_t from std::variant<T> column value map. getStringId(...);",
        buf,
        2u);
    }
  }
  v25 = 0;
LABEL_50:
  *(_QWORD *)buf = &v85;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  CEM::Statement::~Statement(v82);
  if (v25)
    goto LABEL_77;
  if ((v27 & 1) == 0
  {
    v15 = v12 + 144;
  }
  if (*(char *)(v12 + 167) < 0)
  {
    v29 = *(_QWORD *)(v12 + 144);
    v28 = *(_QWORD *)(v12 + 152);
  }
  else
  {
    v28 = *(unsigned __int8 *)(v12 + 167);
    v29 = v15;
  }
  if (byte_1EE0729FF >= 0)
    v30 = byte_1EE0729FF;
  else
    v30 = unk_1EE0729F0;
  if (byte_1EE0729FF >= 0)
    v31 = &CEM::AdaptationDatabaseController::createStringId(std::string_view)::sql;
  else
    v31 = (uint64_t *)CEM::AdaptationDatabaseController::createStringId(std::string_view)::sql;
  if (v6 >= 0x17)
  {
    v33 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v33 = v6 | 7;
    v34 = v33 + 1;
    v32 = (__int128 *)operator new(v33 + 1);
    *((_QWORD *)&__dst + 1) = v6;
    v78 = v34 | 0x8000000000000000;
    *(_QWORD *)&__dst = v32;
    v15 = v12 + 144;
  }
  else
  {
    HIBYTE(v78) = v6;
    v32 = &__dst;
    if (!v6)
      goto LABEL_68;
  }
  memmove(v32, __src, v6);
LABEL_68:
  *((_BYTE *)v32 + v6) = 0;
  v85 = __dst;
  v86 = v78;
  v87 = 3;
  v80 = 0;
  v81 = 0;
  *(_QWORD *)buf = 0;
  v83 = buf;
  v84 = 0;
  *(_QWORD *)buf = operator new(0x20uLL);
  v80 = *(_QWORD *)buf;
  v81 = *(_QWORD *)buf + 32;
  v80 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v85, (uint64_t)v88, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v82, v29, v28, v31, v30, (uint64_t *)buf);
  v83 = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  v35 = (CEM::AdaptationDatabase *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v85);
  CEM::AdaptationDatabase::executeStatement(v35, *(CEM::Statement **)(v12 + 128), (uint64_t)v82);
  v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v85 + 1) - v85) >> 3);
  if (v36 != 1)
  {
    if (v36)
    {
      v65 = "(rows.size() == 1) && \"createStringId: Database inconsistency: exactly 1 ID has been not assigned to this s"
            "tring; cannot continue.\"";
      v66 = 108;
    }
    else
    {
      v65 = "(rows.size() > 0) && \"createStringId: Database inconsistency: ID insertion failed; cannot continue.\"";
      v66 = 107;
    }
    __assert_rtn("createStringId", "AdaptationDatabaseController.cpp", v66, v65);
  }
  if (*(_DWORD *)(*(_QWORD *)v85 + 80) == 1)
  {
    v25 = *(_DWORD *)(*(_QWORD *)v85 + 56);
  }
  else
  {
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v37 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18D71E000, v37, OS_LOG_TYPE_ERROR, "Could not extract uint32_t from std::variant<T> column value map. createStringId(...);",
        buf,
        2u);
    }
    v25 = 0;
  }
  *(_QWORD *)buf = &v85;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  CEM::Statement::~Statement(v82);
LABEL_77:
  if ((v38 & 1) == 0
  {
    v15 = v12 + 144;
  }
  if (*(char *)(v12 + 167) < 0)
  {
    v40 = *(_QWORD *)(v12 + 144);
    v39 = *(_QWORD *)(v12 + 152);
  }
  else
  {
    v39 = *(unsigned __int8 *)(v12 + 167);
    v40 = v15;
  }
  if (byte_1EE07299F >= 0)
    v41 = byte_1EE07299F;
  else
    v41 = unk_1EE072990;
  if (byte_1EE07299F >= 0)
    v42 = &CEM::AdaptationDatabaseController::getEmojiId(std::string_view)const::sql;
  else
    v42 = (uint64_t *)CEM::AdaptationDatabaseController::getEmojiId(std::string_view)const::sql;
  if (v11 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v11 >= 0x17)
  {
    v44 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v44 = v11 | 7;
    v45 = v44 + 1;
    v43 = (__int128 *)operator new(v44 + 1);
    *((_QWORD *)&__dst + 1) = v11;
    v78 = v45 | 0x8000000000000000;
    *(_QWORD *)&__dst = v43;
    v15 = v12 + 144;
    goto LABEL_94;
  }
  HIBYTE(v78) = v11;
  v43 = &__dst;
  if (v11)
LABEL_94:
    memmove(v43, v70, v11);
  *((_BYTE *)v43 + v11) = 0;
  v85 = __dst;
  v86 = v78;
  v87 = 3;
  v80 = 0;
  v81 = 0;
  *(_QWORD *)buf = 0;
  v83 = buf;
  v84 = 0;
  *(_QWORD *)buf = operator new(0x20uLL);
  v80 = *(_QWORD *)buf;
  v81 = *(_QWORD *)buf + 32;
  v80 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v85, (uint64_t)v88, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v82, v40, v39, v42, v41, (uint64_t *)buf);
  v83 = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  v46 = (CEM::AdaptationDatabase *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v85);
  CEM::AdaptationDatabase::executeStatement(v46, *(CEM::Statement **)(v12 + 128), (uint64_t)v82);
  v47 = v25;
  if (*((_QWORD *)&v85 + 1) != (_QWORD)v85)
  {
    if (*(_DWORD *)(*(_QWORD *)v85 + 80) == 1)
    {
      v48 = *(_DWORD *)(*(_QWORD *)v85 + 56);
      goto LABEL_103;
    }
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v49 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18D71E000, v49, OS_LOG_TYPE_ERROR, "Could not extract uint32_t from std::variant<T> column value map. getEmojiId(...);",
        buf,
        2u);
    }
  }
  v48 = 0;
LABEL_103:
  *(_QWORD *)buf = &v85;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  CEM::Statement::~Statement(v82);
  if (v48)
    goto LABEL_130;
  if ((v50 & 1) == 0
  {
    v15 = v12 + 144;
  }
  if (*(char *)(v12 + 167) < 0)
  {
    v52 = *(_QWORD *)(v12 + 144);
    v51 = *(_QWORD *)(v12 + 152);
  }
  else
  {
    v51 = *(unsigned __int8 *)(v12 + 167);
    v52 = v15;
  }
  if (byte_1EE0729BF >= 0)
    v53 = byte_1EE0729BF;
  else
    v53 = unk_1EE0729B0;
  if (byte_1EE0729BF >= 0)
    v54 = &CEM::AdaptationDatabaseController::createEmojiId(std::string_view)::sql;
  else
    v54 = (uint64_t *)CEM::AdaptationDatabaseController::createEmojiId(std::string_view)::sql;
  if (v11 >= 0x17)
  {
    v56 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v56 = v11 | 7;
    v57 = v56 + 1;
    v55 = (__int128 *)operator new(v56 + 1);
    *((_QWORD *)&__dst + 1) = v11;
    v78 = v57 | 0x8000000000000000;
    *(_QWORD *)&__dst = v55;
    v15 = v12 + 144;
  }
  else
  {
    HIBYTE(v78) = v11;
    v55 = &__dst;
    if (!v11)
      goto LABEL_121;
  }
  memmove(v55, v70, v11);
LABEL_121:
  *((_BYTE *)v55 + v11) = 0;
  v85 = __dst;
  v86 = v78;
  v87 = 3;
  v80 = 0;
  v81 = 0;
  *(_QWORD *)buf = 0;
  v83 = buf;
  v84 = 0;
  *(_QWORD *)buf = operator new(0x20uLL);
  v80 = *(_QWORD *)buf;
  v81 = *(_QWORD *)buf + 32;
  v80 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v85, (uint64_t)v88, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v82, v52, v51, v54, v53, (uint64_t *)buf);
  v83 = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  v58 = (CEM::AdaptationDatabase *)std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v85);
  CEM::AdaptationDatabase::executeStatement(v58, *(CEM::Statement **)(v12 + 128), (uint64_t)v82);
  v59 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v85 + 1) - v85) >> 3);
  if (v59 != 1)
  {
    if (v59)
    {
      v67 = "(rows.size() == 1) && \"createEmojiId: Database inconsistency: exactly 1 ID has not been assigned to this em"
            "oji; cannot continue.\"";
      v68 = 70;
    }
    else
    {
      v67 = "(rows.size() > 0) && \"createEmojiId: Database inconsistency: ID insertion failed; cannot continue.\"";
      v68 = 69;
    }
    __assert_rtn("createEmojiId", "AdaptationDatabaseController.cpp", v68, v67);
  }
  v47 = v25;
  if (*(_DWORD *)(*(_QWORD *)v85 + 80) == 1)
  {
    v48 = *(_DWORD *)(*(_QWORD *)v85 + 56);
  }
  else
  {
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v60 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18D71E000, v60, OS_LOG_TYPE_ERROR, "Could not extract uint32_t from std::variant<T> column value map. createEmojiId(...);",
        buf,
        2u);
    }
    v48 = 0;
  }
  *(_QWORD *)buf = &v85;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  CEM::Statement::~Statement(v82);
LABEL_130:
  if (*(char *)(v12 + 167) < 0)
  {
    v15 = *(_QWORD *)(v12 + 144);
    v61 = *(_QWORD *)(v12 + 152);
  }
  else
  {
    v61 = *(unsigned __int8 *)(v12 + 167);
  }
  if (byte_1EE072A5F >= 0)
    v62 = byte_1EE072A5F;
  else
    v62 = unk_1EE072A50;
  if (byte_1EE072A5F >= 0)
    v63 = &CEM::AdaptationDatabaseController::recordEmojiEngagement(std::string_view,std::string_view)::sql;
  else
    v63 = (uint64_t *)CEM::AdaptationDatabaseController::recordEmojiEngagement(std::string_view,std::string_view)::sql;
  LODWORD(v85) = v47;
  v87 = 1;
  v88[0] = v48;
  v88[6] = 1;
  v80 = 0;
  v81 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&__dst = buf;
  BYTE8(__dst) = 0;
  *(_QWORD *)buf = operator new(0x40uLL);
  v80 = *(_QWORD *)buf;
  v81 = *(_QWORD *)buf + 64;
  v80 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&v85, (uint64_t)&v89, *(uint64_t *)buf);
  CEM::Statement::Statement((uint64_t)v82, v15, v61, v63, v62, (uint64_t *)buf);
  *(_QWORD *)&__dst = buf;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__dst);
  for (i = 32; i != -32; i -= 32)
    std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v85 + i);
  CEM::AdaptationDatabase::executeStatement((CEM::AdaptationDatabase *)v76, *(CEM::Statement **)(v12 + 128), (uint64_t)v82);
  *(_QWORD *)&v85 = v76;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
  CEM::Statement::~Statement(v82);
  std::mutex::unlock((std::mutex *)(v12 + 64));
  LODWORD(v82[0]) = v47;
  if (v47)
  {
    trie::CedarMinimalPrefixTrie<unsigned int,char>::addEntry(v69 + 176, (uint64_t)__src, v6, v82);
    v3 = 1;
    goto LABEL_144;
  }
LABEL_143:
  v3 = 0;
LABEL_144:
  if ((v73 & 0x80) != 0)
LABEL_22:
    operator delete(__p[0]);
LABEL_23:
  if ((char)v75 < 0)
    operator delete(v74[0]);
  return v3;
}

void sub_18D732818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  std::mutex::unlock(a11);
  if (a20 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(a1);
}

void CEMEmojiLocaleDataResetAdaptationDatabase(uint64_t a1)
{
  uint64_t v1;
  CEM::AdaptationController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6[3];
  void *v7[14];
  void **v8;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 24);
    v2 = (CEM::AdaptationController *)(v1 + 112);
    if (*(_DWORD *)(v1 + 112) || CEM::AdaptationController::initialize(v2))
    {
      v3 = *(_QWORD *)(v1 + 168);
      if (*(_QWORD *)(*(_QWORD *)(v3 + 128) + 24))
      {
        if (*(char *)(v3 + 167) < 0)
        {
          v4 = *(_QWORD *)(v3 + 144);
          v5 = *(_QWORD *)(v3 + 152);
        }
        else
        {
          v4 = v3 + 144;
          v5 = *(unsigned __int8 *)(v3 + 167);
        }
        memset(v6, 0, sizeof(v6));
        CEM::Statement::Statement((uint64_t)v7, v4, v5, "BEGIN TRANSACTION;\n"
          "END TRANSACTION;",
          0x6FuLL,
          v6);
        v8 = (void **)v6;
        std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v8);
        CEM::AdaptationDatabase::executeStatement((CEM::AdaptationDatabase *)v6, *(CEM::Statement **)(v3 + 128), (uint64_t)v7);
        v8 = (void **)v6;
        std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100](&v8);
        CEM::Statement::~Statement(v7);
      }
      cedar::da<unsigned int,-1,-2,true,1,0ul>::clear(v1 + 184, 1);
      if (!*(_DWORD *)(v1 + 112))
        *(_DWORD *)v2 = 1;
    }
  }
}

void sub_18D732A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  CEM::Statement::~Statement((void **)va);
  _Unwind_Resume(a1);
}

uint64_t CEMEMFSearchEngineIsLocaleSupported(CEM *a1, const __CFLocale *a2)
{
  CEM::SearchEngineResources *NormalizedLocale;
  const __CFLocale *v4;
  CFBundleRef SearchEngineBundleForLocale;
  const __CFLocale *v6;
  CFBundleRef v7;
  _BOOL8 v8;
  const __CFLocale *v9;
  const __CFString *Value;
  const __CFString *v11;
  const __CFLocale *v12;
  __CFString *v13;
  __CFString *v14;
  CFURLRef v15;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  NormalizedLocale = CEM::createNormalizedLocale(a1, a2);
  SearchEngineBundleForLocale = CEM::SearchEngineResources::createSearchEngineBundleForLocale(NormalizedLocale, v4);
  v7 = SearchEngineBundleForLocale;
  if (SearchEngineBundleForLocale)
    CFRelease(SearchEngineBundleForLocale);
  if (NormalizedLocale)
    CFRelease(NormalizedLocale);
  if (v7)
    return 1;
  v9 = CEM::createNormalizedLocale(a1, v6);
  Value = (const __CFString *)CFLocaleGetValue(v9, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
  v11 = (const __CFString *)CFLocaleGetValue(v9, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
  if (CFStringCompare(Value, CFSTR("en"), 0) || v11 && CFStringCompare(v11, CFSTR("US"), 0))
  {
    v13 = CFSTR("LocaleData");
    v14 = (__CFString *)v9;
  }
  else
  {
    v14 = 0;
    v13 = CFSTR("LocaleData-en");
  }
  v15 = CEM::copyResourceURLFromFrameworkBundle((CEM *)v13, CFSTR("dat"), 0, v14, v12);
  v8 = v15 != 0;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = MEMORY[0x18D791E5C](v9);
      _os_log_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Legacy search is supported by locale '%@'", buf, 0xCu);
    }
    CFRelease(v15);
  }
  if (v9)
    CFRelease(v9);
  return v8;
}

void sub_18D732C54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v2;
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)va);
  if (v2)
    CFRelease(v2);
  _Unwind_Resume(a1);
}

CFBundleRef CEMEMFSearchEngineCreateBundleForLocaleIdentifier(CFLocaleIdentifier localeIdentifier)
{
  CEM::SearchEngineResources *v1;
  const __CFLocale *v2;
  CEM::SearchEngineResources *v3;
  CFBundleRef SearchEngineBundleForLocale;

  v1 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], localeIdentifier);
  if (!v1)
    return 0;
  v3 = v1;
  SearchEngineBundleForLocale = CEM::SearchEngineResources::createSearchEngineBundleForLocale(v1, v2);
  CFRelease(v3);
  return SearchEngineBundleForLocale;
}

void sub_18D732D24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t CEMEmojiTokenCreateWithLongCharacter(unsigned int a1, _QWORD *a2)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (sharedEmojiData(void)::onceToken != -1)
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
  v4 = sharedEmojiData(void)::data;
  if (a2)
    v5 = (const __CFString *)MEMORY[0x18D791E5C](*(_QWORD *)(a2[3] + 32));
  else
    v5 = 0;
  v6 = sharedMonochromeSymbolData(v5);
  if (!v4)
    return 0;
  v7 = (uint64_t)v6;
  CEM::EmojiData::advance(v4, *(_WORD **)(v4 + 32), 0x100000000, a1);
  v9 = v8 & 0x100000000;
  v10 = (unsigned __int16)v8;
  if ((BYTE4(v8) & ((unsigned __int16)v8 != 0)) == 0 && v7)
  {
    CEM::EmojiData::advance(v7, *(_WORD **)(v7 + 32), 0x100000000, a1);
    v9 = v8 & 0x100000000;
    v10 = (unsigned __int16)v8;
  }
  if (!v10 || v9 == 0)
    return 0;
  else
    return CEMEmojiTokenCreateWithIndex((unsigned __int16)v8, a2);
}

uint64_t CEMEmojiTokenGetString(uint64_t result)
{
  if (result)
    return *(_QWORD *)(*(_QWORD *)(result + 24) + 8);
  return result;
}

uint64_t CEMEmojiTokenSupportsSkinToneVariants(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = *(_QWORD *)(result + 24);
    v2 = *(_QWORD *)(v1 + 40);
    v3 = *(unsigned __int16 *)(v1 + 22);
    v4 = *(unsigned __int16 *)(v2 + 44);
    if (v3 > v4
      && *(unsigned __int16 *)(v2 + 42) >= (unsigned __int16)(v3 - v4))
    {
      return (*(unsigned __int16 *)(**(_QWORD **)(v2 + 16) + 16 * (~v4 + v3) + 10) >> 6) & 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CEMEmojiTokenCreateSkinToneVariant(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  _WORD *v10;
  int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  v2 = a1;
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 24);
    v4 = *(_QWORD *)(v3 + 40);
    v5 = *(unsigned __int16 *)(v3 + 22);
    v6 = *(unsigned __int16 *)(v4 + 44);
    if (v5 > v6
      && *(unsigned __int16 *)(v4 + 42) >= (unsigned __int16)(v5 - v6)
      && (*(_WORD *)(**(_QWORD **)(v4 + 16) + 16 * (~v6 + v5) + 10) & 0x40) != 0)
    {
      v10 = CEM::EmojiData::advance(v4, *(_WORD **)(v4 + 32), 0x100000000, *(CFStringRef *)(v3 + 8));
      if (a2 == 1)
        v11 = 127995;
      else
        v11 = a2 + 127993;
      if (a2)
        v12 = v11;
      else
        v12 = 0;
      v13 = CEM::EmojiData::advance(*(_QWORD *)(v3 + 40), v10, v9, v12);
      v15 = v14;
      v16 = operator new();
      CEM::EmojiToken::EmojiToken(v16, v13, v15, *(CEM::EmojiData **)(v3 + 40), *(_QWORD *)v3);
      std::shared_ptr<CEM::EmojiToken>::shared_ptr[abi:ne180100]<CEM::EmojiToken,void>(&v20, v16);
      v2 = CEM::EmojiToken::createWrapper(&v20, *(const void **)(v2 + 40));
      v17 = v21;
      if (v21)
      {
        p_shared_owners = (unint64_t *)&v21->__shared_owners_;
        do
          v19 = __ldaxr(p_shared_owners);
        while (__stlxr(v19 - 1, p_shared_owners));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_18D732FF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18D732EF4);
}

_QWORD *std::shared_ptr<CEM::EmojiToken>::shared_ptr[abi:ne180100]<CEM::EmojiToken,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v6;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_1E2632C80;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  v6 = 0;
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&v6, 0);
  return a1;
}

void sub_18D7330A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<CEM::EmojiToken *,std::shared_ptr<CEM::EmojiToken>::__shared_ptr_default_delete<CEM::EmojiToken,CEM::EmojiToken>,std::allocator<CEM::EmojiToken>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t std::__shared_ptr_pointer<CEM::EmojiToken *,std::shared_ptr<CEM::EmojiToken>::__shared_ptr_default_delete<CEM::EmojiToken,CEM::EmojiToken>,std::allocator<CEM::EmojiToken>>::__on_zero_shared(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 24);
  if (v1)
  {
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v1 + 8), 0);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<CEM::EmojiToken *,std::shared_ptr<CEM::EmojiToken>::__shared_ptr_default_delete<CEM::EmojiToken,CEM::EmojiToken>,std::allocator<CEM::EmojiToken>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000018D747AC3))
    return a1 + 24;
  else
    return 0;
}

uint64_t CEMEmojiTokenGetSkinTone(uint64_t result)
{
  if (result)
    return *(unsigned int *)(*(_QWORD *)(result + 24) + 16);
  return result;
}

uint64_t CEMEmojiTokenGetHairStyle(uint64_t result)
{
  if (result)
    return *(unsigned __int8 *)(*(_QWORD *)(result + 24) + 20);
  return result;
}

uint64_t CEMEmojiTokenGetGender(uint64_t result)
{
  if (result)
    return *(unsigned int *)(*(_QWORD *)(result + 24) + 28);
  return result;
}

uint64_t CEMEmojiTokenCreateHairStyleVariant(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _WORD *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v2 = a1;
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 24);
    v4 = *(_QWORD *)(v3 + 40);
    v5 = *(unsigned __int16 *)(v3 + 22);
    v6 = *(unsigned __int16 *)(v4 + 44);
    if (v5 > v6
      && *(unsigned __int16 *)(v4 + 42) >= (unsigned __int16)(v5 - v6)
      && (*(_WORD *)(**(_QWORD **)(v4 + 16) + 16 * (~v6 + v5) + 10) & 0x100) != 0)
    {
      v9 = CEM::EmojiData::advance(v4, *(_WORD **)(v4 + 32), 0x100000000, *(CFStringRef *)(v3 + 8));
      v10 = *(_QWORD *)(v3 + 40);
      v13 = (_WORD *)CEM::EmojiData::advance(v10, v9, v11, 0x200Du);
      if (a2 > 4)
        v14 = 0;
      else
        v14 = dword_18D747B58[a2];
      v15 = CEM::EmojiData::advance(v10, v13, v12, v14);
      v17 = v16;
      v18 = operator new();
      CEM::EmojiToken::EmojiToken(v18, v15, v17, *(CEM::EmojiData **)(v3 + 40), *(_QWORD *)v3);
      std::shared_ptr<CEM::EmojiToken>::shared_ptr[abi:ne180100]<CEM::EmojiToken,void>(&v22, v18);
      v2 = CEM::EmojiToken::createWrapper(&v22, *(const void **)(v2 + 40));
      v19 = v23;
      if (v23)
      {
        p_shared_owners = (unint64_t *)&v23->__shared_owners_;
        do
          v21 = __ldaxr(p_shared_owners);
        while (__stlxr(v21 - 1, p_shared_owners));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_18D733324(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18D73320CLL);
}

uint64_t CEMEmojiTokenSupportsHairStyleVariants(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = *(_QWORD *)(result + 24);
    v2 = *(_QWORD *)(v1 + 40);
    v3 = *(unsigned __int16 *)(v1 + 22);
    v4 = *(unsigned __int16 *)(v2 + 44);
    if (v3 > v4
      && *(unsigned __int16 *)(v2 + 42) >= (unsigned __int16)(v3 - v4))
    {
      return HIBYTE(*(unsigned __int16 *)(**(_QWORD **)(v2 + 16) + 16 * (~v4 + v3) + 10)) & 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CEMEmojiTokenGetPresentationStyle(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;

  if (result)
  {
    v1 = *(_QWORD *)(result + 24);
    v2 = *(_QWORD *)(v1 + 40);
    v3 = *(unsigned __int16 *)(v1 + 22);
    v4 = *(unsigned __int16 *)(v2 + 44);
    if (v3 <= v4
      || *(unsigned __int16 *)(v2 + 42) < (unsigned __int16)(v3 - v4))
    {
      return 0;
    }
    v5 = *(_WORD *)(**(_QWORD **)(v2 + 16) + 16 * (~v4 + v3) + 10);
    result = (v5 & 0x20) != 0 ? 1 : 2;
    if ((v5 & 0x30) == 0)
      return 0;
  }
  return result;
}

uint64_t CEMEmojiTokenSupportsPresentationStyle()
{
  return 0;
}

uint64_t CEMEmojiTokenCreatePresentationVariant()
{
  return 0;
}

uint64_t CEMEmojiTokenCreateCopyRemovingModifiers(uint64_t a1)
{
  uint64_t v1;
  CEM::EmojiToken *CopyRemovingModifiers;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v7;
  std::__shared_weak_count *v8;

  v1 = a1;
  if (a1)
  {
    CopyRemovingModifiers = CEM::EmojiToken::createCopyRemovingModifiers(*(CEM::EmojiData ***)(a1 + 24));
    std::shared_ptr<CEM::EmojiToken>::shared_ptr[abi:ne180100]<CEM::EmojiToken,void>(&v7, (uint64_t)CopyRemovingModifiers);
    v1 = CEM::EmojiToken::createWrapper(&v7, *(const void **)(v1 + 40));
    v3 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
  return v1;
}

void sub_18D7334BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18D7334A8);
}

BOOL CEMEmojiTokensAreEquivalent(uint64_t a1, uint64_t a2, int a3)
{
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  int v5;

  if (a1)
  {
    v3 = *(unsigned __int16 **)(a1 + 24);
    if (!a2)
      return (a1 | a2) == 0;
  }
  else
  {
    v3 = 0;
    if (!a2)
      return (a1 | a2) == 0;
  }
  if (v3)
  {
    v4 = *(unsigned __int16 **)(a2 + 24);
    if (v4)
    {
      if (a3)
      {
        v5 = CEM::EmojiToken::baseIndex((CEM::EmojiToken *)v3);
        return v5 == CEM::EmojiToken::baseIndex((CEM::EmojiToken *)v4);
      }
      else
      {
        return v3[11] == v4[11];
      }
    }
  }
  return (a1 | a2) == 0;
}

__CFArray *CEMEmojiTokenCopyRelatedEmoji(uint64_t **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFArray *Wrappers;
  uint64_t *v9;
  uint64_t v10;
  const __CFDictionary *v11;
  const __CFString *v12;
  const __CFArray *Value;
  CFIndex i;
  const __CFString *ValueAtIndex;
  uint64_t v16;
  CEM::EmojiData *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  char *v37;
  __int128 v38;
  int64x2_t v39;
  char *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  int64x2_t v45;
  char *v46;
  __int128 v47;
  int64x2_t *v48;
  int64x2_t v49;
  char *v50;
  char **v51;

  Wrappers = (__CFArray *)a1;
  if (a1)
  {
    v9 = a1[3];
    v10 = *v9;
    if (*v9)
    {
      v45 = 0uLL;
      v46 = 0;
      v11 = *(const __CFDictionary **)(v10 + 24);
      if (v11)
      {
        v12 = (const __CFString *)v9[1];
        Value = (const __CFArray *)CFDictionaryGetValue(v11, v12);
        if (Value)
        {
          for (i = 0; i < CFArrayGetCount(Value); ++i)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Value, i);
            if (CFStringCompare(ValueAtIndex, v12, 0))
            {
              v16 = operator new();
              v17 = *(CEM::EmojiData **)(v10 + 96);
              v18 = CEM::EmojiData::advance((uint64_t)v17, *((_WORD **)v17 + 4), 0x100000000, ValueAtIndex);
              CEM::EmojiToken::EmojiToken(v16, v18, v19, v17, v10);
              std::shared_ptr<CEM::EmojiToken>::shared_ptr[abi:ne180100]<CEM::EmojiToken,void>(&v47, v16);
              v20 = v45.i64[1];
              if (v45.i64[1] >= (unint64_t)v46)
              {
                v25 = (v45.i64[1] - v45.i64[0]) >> 4;
                v26 = v25 + 1;
                if ((unint64_t)(v25 + 1) >> 60)
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                v27 = (uint64_t)&v46[-v45.i64[0]];
                if ((uint64_t)&v46[-v45.i64[0]] >> 3 > v26)
                  v26 = v27 >> 3;
                if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
                  v28 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v28 = v26;
                v51 = &v46;
                v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v28);
                v31 = &v29[16 * v25];
                v32 = *((_QWORD *)&v47 + 1);
                *(_OWORD *)v31 = v47;
                if (v32)
                {
                  v33 = (unint64_t *)(v32 + 8);
                  do
                    v34 = __ldxr(v33);
                  while (__stxr(v34 + 1, v33));
                }
                v35 = (_QWORD *)v45.i64[1];
                v36 = (_QWORD *)v45.i64[0];
                if (v45.i64[1] == v45.i64[0])
                {
                  v39 = vdupq_n_s64(v45.u64[1]);
                  v37 = &v29[16 * v25];
                }
                else
                {
                  v37 = &v29[16 * v25];
                  do
                  {
                    v38 = *((_OWORD *)v35 - 1);
                    v35 -= 2;
                    *((_OWORD *)v37 - 1) = v38;
                    v37 -= 16;
                    *v35 = 0;
                    v35[1] = 0;
                  }
                  while (v35 != v36);
                  v39 = v45;
                }
                v24 = v31 + 16;
                v45.i64[0] = (uint64_t)v37;
                v45.i64[1] = (uint64_t)(v31 + 16);
                v49 = v39;
                v40 = v46;
                v46 = &v29[16 * v30];
                v50 = v40;
                v48 = (int64x2_t *)v39.i64[0];
                std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)&v48);
              }
              else
              {
                *(_QWORD *)v45.i64[1] = v47;
                v21 = *((_QWORD *)&v47 + 1);
                *(_QWORD *)(v20 + 8) = *((_QWORD *)&v47 + 1);
                if (v21)
                {
                  v22 = (unint64_t *)(v21 + 8);
                  do
                    v23 = __ldxr(v22);
                  while (__stxr(v23 + 1, v22));
                }
                v24 = (_OWORD *)(v20 + 16);
              }
              v45.i64[1] = (uint64_t)v24;
              v41 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
              if (*((_QWORD *)&v47 + 1))
              {
                v42 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
                do
                  v43 = __ldaxr(v42);
                while (__stlxr(v43 - 1, v42));
                if (!v43)
                {
                  ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
                  std::__shared_weak_count::__release_weak(v41);
                }
              }
            }
          }
        }
      }
      sortEmojiTokens((__int128 **)&v45, *(_BYTE *)(v10 + 784), a3, a4, a5, a6, a7, a8);
    }
    else
    {
      v45 = 0uLL;
      v46 = 0;
    }
    Wrappers = CEM::EmojiToken::createWrappers((uint64_t **)&v45, *((const void **)Wrappers + 5));
    v48 = &v45;
    std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  }
  return Wrappers;
}

void sub_18D7337F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13)
{
  a13 = (void **)&a9;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100](&a13);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18D7337CCLL);
}

uint64_t CEMEmojiTokenIsCommon(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = *(_QWORD *)(result + 24);
    v2 = *(_QWORD *)(v1 + 40);
    v3 = *(unsigned __int16 *)(v1 + 22);
    v4 = *(unsigned __int16 *)(v2 + 44);
    if (v3 > v4
      && *(unsigned __int16 *)(v2 + 42) >= (unsigned __int16)(v3 - v4))
    {
      return (*(unsigned __int16 *)(**(_QWORD **)(v2 + 16) + 16 * (~v4 + v3) + 10) >> 7) & 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFString *CEMEmojiTokenCopyName(__CFString *result, int a2)
{
  if (result)
    return CEM::EmojiToken::copyNameWithCount(result->length, a2, 1);
  return result;
}

__CFString *CEMEmojiTokenCopyNameWithCount(__CFString *result, int a2, uint64_t a3)
{
  if (result)
    return CEM::EmojiToken::copyNameWithCount(result->length, a2, a3);
  return result;
}

uint64_t CEMEmojiTokenGetIndex(uint64_t result)
{
  if (result)
    return *(unsigned __int16 *)(*(_QWORD *)(result + 24) + 22);
  return result;
}

uint64_t CEMEmojiTokenGetLocaleData(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

BOOL CEMEmojiTokenIsSupportedForLocaleAndSearchMode(uint64_t a1, uint64_t a2, int a3)
{
  return a1
      && a2
      && CEM::EmojiLocaleData::emojiIndexIsSupported(*(_QWORD *)(a2 + 24), a3, *(unsigned __int16 *)(*(_QWORD *)(a1 + 24) + 22));
}

uint64_t CEMLongCharacterIsEmoji(unsigned int a1)
{
  uint64_t result;
  __int16 v3;
  unsigned __int8 v4;

  if (sharedEmojiData(void)::onceToken != -1)
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
  result = sharedEmojiData(void)::data;
  if (sharedEmojiData(void)::data)
  {
    CEM::EmojiData::advance(sharedEmojiData(void)::data, *(_WORD **)(sharedEmojiData(void)::data + 32), 0x100000000, a1);
    return v4 & (v3 != 0);
  }
  return result;
}

unsigned __int16 *CEMCopyEmojiTokens(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned __int16 *v4;
  __CFArray *Mutable;
  unsigned __int16 v6;
  CFStringRef String;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const void *v10;

  if (sharedEmojiData(void)::onceToken != -1)
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
  v4 = (unsigned __int16 *)sharedEmojiData(void)::data;
  if (sharedEmojiData(void)::data)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    if (v4[21])
    {
      v6 = 1;
      do
      {
        if (CEM::EmojiData::isValidIndex((CEM::EmojiData *)v4, v6))
        {
          String = CEM::EmojiData::createString((CEM::EmojiData *)v4, (unsigned __int16)(v4[22] + v6));
          if (String)
          {
            CFArrayAppendValue(Mutable, String);
            CFRelease(String);
          }
        }
        ++v6;
      }
      while (v4[21] >= v6);
    }
    if (Mutable)
    {
      v4 = (unsigned __int16 *)CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      for (i = 0; i < CFArrayGetCount(Mutable); ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Mutable, i);
        if (CFStringCompare(ValueAtIndex, CFSTR("🇹🇼"), 0) || CEM::shouldShowTaiwanFlagEmoji(0))
        {
          v10 = (const void *)CEMEmojiTokenCreateWithString(ValueAtIndex, a3);
          CFArrayAppendValue((CFMutableArrayRef)v4, v10);
          CFRelease(v10);
        }
      }
      CFRelease(Mutable);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

__n128 __Block_byref_object_copy__62(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__63(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

_QWORD *CEM::ResourceCreationException::ResourceCreationException(_QWORD *a1, __int128 *a2)
{
  std::string *v3;
  __int128 v4;

  *a1 = &off_1E2632BB0;
  v3 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

void sub_18D733C44(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void CEM::ResourceCreationException::~ResourceCreationException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_1E2632BB0;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  CEM::ResourceCreationException::~ResourceCreationException(this);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t CEM::ResourceCreationException::what(CEM::ResourceCreationException *this)
{
  uint64_t result;

  result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0)
    return *(_QWORD *)result;
  return result;
}

__n128 __Block_byref_object_copy__66(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__67(uint64_t a1)
{
  return std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](a1 + 40);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1)
{
  int v1;
  unint64_t v2;
  BOOL v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;

  v1 = *(char *)(a1 + 23);
  v2 = *(_QWORD *)(a1 + 8);
  v3 = v1 < 0;
  if (v1 >= 0)
    v4 = (uint64_t *)a1;
  else
    v4 = *(uint64_t **)a1;
  if (!v3)
    v2 = *(unsigned __int8 *)(a1 + 23);
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      v34 = 0x9DDFEA08EB382D69;
      v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      v50 = v46 + v48;
      v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      v53 = v47 + v2 + v46 + v44;
      v54 = v53 + v43;
      v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      v57 = v56 + v45 + v48;
      v58 = __ROR8__(v57, 44);
      v59 = v57 + v49;
      v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      v62 = *v4;
      v61 = v4 + 4;
      v63 = v62 - 0x4B6D499041670D8DLL * v43;
      v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v65 = *(v61 - 3);
        v66 = v63 + v54 + v50 + v65;
        v67 = v61[2];
        v68 = v61[3];
        v69 = v61[1];
        v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        v70 = v52 + v59;
        v71 = *(v61 - 2);
        v72 = *(v61 - 1);
        v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        v74 = v73 + v59 + v72;
        v75 = v73 + v65 + v71;
        v54 = v75 + v72;
        v76 = __ROR8__(v75, 44) + v73;
        v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        v55 = v76 + __ROR8__(v74 + v77, 21);
        v78 = v63 + v60 + *v61;
        v59 = v78 + v69 + v67 + v68;
        v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        v52 = v77;
        v64 += 64;
      }
      while (v64);
      v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      v9 = (char *)v4 + v2;
      v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      v12 = v4[1];
      v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      v16 = v4 + 2;
      v14 = v4[2];
      v15 = v16[1];
      v17 = __ROR8__(v13 + v15, 52);
      v18 = __ROR8__(v13, 37);
      v19 = v13 + v12;
      v20 = __ROR8__(v19, 7);
      v21 = v19 + v14;
      v22 = v20 + v18;
      v23 = *((_QWORD *)v9 - 4) + v14;
      v24 = v11 + v15;
      v25 = __ROR8__(v24 + v23, 52);
      v26 = v22 + v17;
      v27 = __ROR8__(v23, 37);
      v28 = *((_QWORD *)v9 - 3) + v23;
      v29 = __ROR8__(v28, 7);
      v30 = v26 + __ROR8__(v21, 31);
      v31 = v28 + v10;
      v32 = v31 + v24;
      v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      v34 = 0x9AE16A3B2F90404FLL;
      v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      v36 = v4[1];
      v37 = 0xB492B66FBE98F273 * *v4;
      v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      v5 = *v4;
      v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      v82 = *(_DWORD *)v4;
      v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

BOOL std::equal_to<std::string>::operator()[abi:ne180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  BOOL v13;
  _BOOL8 v14;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 0;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
    return memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)) == 0;
  if (!a1[23])
    return 1;
  v6 = v2 - 1;
  do
  {
    v8 = *a1++;
    v7 = v8;
    v10 = *a2++;
    v9 = v10;
    v12 = v6-- != 0;
    v13 = v7 == v9;
    v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;

  v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((_BYTE *)a1 + 16))
    {
      v2 = *(std::__shared_weak_count **)(v1 + 48);
      if (v2)
        std::__shared_weak_count::__release_weak(v2);
      if (*(char *)(v1 + 39) < 0)
        operator delete(*(void **)(v1 + 16));
    }
    operator delete((void *)v1);
  }
}

void std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned char> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned char>,CEM::ReadOnlyFile<unsigned char>>,std::allocator<CEM::ReadOnlyFile<unsigned char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned char> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned char>,CEM::ReadOnlyFile<unsigned char>>,std::allocator<CEM::ReadOnlyFile<unsigned char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000018D745E8BLL))
    return a1 + 24;
  else
    return 0;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  std::string *v7;
  std::string::size_type size;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

_QWORD *CEM::ReadOnlyFileCreationException::ReadOnlyFileCreationException(_QWORD *a1)
{
  __int128 __p;
  char v4;

  std::operator+<char>();
  CEM::ResourceCreationException::ResourceCreationException(a1, &__p);
  if (v4 < 0)
    operator delete((void *)__p);
  *a1 = &off_1E2632BD8;
  return a1;
}

void sub_18D734400(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CEM::ReadOnlyFileCreationException::~ReadOnlyFileCreationException(std::exception *this)
{
  CEM::ResourceCreationException::~ResourceCreationException(this);
  JUMPOUT(0x18D7921ECLL);
}

void CEMEnumerateEmojiTokensInStringWithLocaleAndBlock(const __CFString *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  if (sharedEmojiData(void)::onceToken == -1)
  {
    if (!a1)
      return;
  }
  else
  {
    dispatch_once(&sharedEmojiData(void)::onceToken, &__block_literal_global_43);
    if (!a1)
      return;
  }
  if (sharedEmojiData(void)::data)
    CEM::EmojiToken::enumerateEmojiTokensInStringWithBlock(a1, a2, a3, a4, (CEM::EmojiData *)sharedEmojiData(void)::data, a5);
}

const __CFString *CEMCreateStringByStrippingEmojiCharacters(const __CFString *a1)
{
  const __CFString *v1;
  CFIndex Length;
  const __CFAllocator *v3;
  CFRange v4;
  const __CFString *v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  CFTypeRef cf;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v1 = a1;
  Length = CFStringGetLength(a1);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3002000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  cf = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Length);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = __CEMCreateStringByStrippingEmojiCharacters_block_invoke;
  v7[3] = &unk_1E2632FA0;
  v7[4] = &v18;
  v7[5] = &v14;
  v7[6] = &v8;
  v7[7] = v1;
  CEMEnumerateEmojiTokensInStringWithBlock(v1, 0, Length, (uint64_t)v7);
  v4.location = v15[3];
  if (Length > v4.location)
  {
    v4.length = Length - v4.location;
    v5 = CFStringCreateWithSubstring(v3, v1, v4);
    CFStringAppend((CFMutableStringRef)v9[5], v5);
    if (v5)
      CFRelease(v5);
  }
  if (*((_BYTE *)v19 + 24))
  {
    v1 = (const __CFString *)v9[5];
    v9[5] = 0;
  }
  else
  {
    CFRetain(v1);
  }
  _Block_object_dispose(&v8, 8);
  if (cf)
    CFRelease(cf);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v1;
}

void sub_18D734674(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  const void *v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v5 = va_arg(va1, const void *);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v15 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  v20 = va_arg(va2, _QWORD);
  v21 = va_arg(va2, _QWORD);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Block_object_dispose(va1, 8);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)(v2 + 40));
  _Block_object_dispose(va2, 8);
  _Block_object_dispose((const void *)(v3 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(result + 40) = v2;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  nlp::CFScopedPtr<__CFString *>::reset((const void **)(a1 + 40));
}

void sub_18D734790(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

const __CFString *CEMCreateStringByTranslatingEmojiCharactersToNameInString(const __CFString *a1, int a2, CFTypeRef cf)
{
  const __CFString *v3;
  _QWORD *v6;
  CFIndex Length;
  _QWORD v9[8];
  int v10;
  _QWORD v11[4];
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  CFMutableStringRef MutableCopy;
  _QWORD *v17;

  v3 = a1;
  if (a1)
  {
    v17 = 0;
    nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::acquire((const void **)&v17, cf);
    v6 = v17;
    if (!v17)
    {
      v6 = (_QWORD *)CEMCreateEmojiLocaleData(CFSTR("en_US"));
      v17 = v6;
    }
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    MutableCopy = 0;
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v3);
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2000000000;
    v12[3] = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2000000000;
    v11[3] = 0;
    Length = CFStringGetLength(v3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __CEMCreateStringByTranslatingEmojiCharactersToNameInString_block_invoke;
    v9[3] = &unk_1E2632FC8;
    v10 = a2;
    v9[4] = v12;
    v9[5] = v11;
    v9[6] = &v13;
    v9[7] = cf;
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock(v3, 0, Length, v6, (uint64_t)v9);
    v3 = (const __CFString *)v14[3];
    _Block_object_dispose(v11, 8);
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);
    if (v6)
      CFRelease(v6);
  }
  return v3;
}

void sub_18D734910(_Unwind_Exception *a1)
{
  uint64_t v1;

  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset((const void **)(v1 - 88), 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::acquire(const void **a1, CFTypeRef cf)
{
  if (*a1 != cf)
  {
    CFRetain(cf);
    nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(a1, cf);
  }
}

void sub_18D734B64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

uint64_t trie::MarisaTrie<unsigned int,char>::load(uint64_t a1, char *a2, unint64_t a3)
{
  char *v7;
  uint64_t v8;

  if (a3 >= 0xF)
  {
    if (*(_QWORD *)a2 == 0x2065766F6C206557 && *(_QWORD *)(a2 + 7) == 0x2E61736972614D20)
    {
      internal::marisa::Trie::map((internal::marisa::grimoire::trie::LoudsTrie **)(a1 + 16), a2, a3);
      return 1;
    }
  }
  else if (a3 < 4)
  {
    return 0;
  }
  v7 = a2 + 4;
  v8 = *(unsigned int *)a2;
  internal::marisa::Trie::map((internal::marisa::grimoire::trie::LoudsTrie **)(a1 + 16), a2 + 4, v8);
  *(_QWORD *)(a1 + 24) = &v7[v8];
  *(_QWORD *)(a1 + 32) = (a3 - v8 - 4) >> 2;
  return 1;
}

_QWORD *trie::MarisaTrie<unsigned int,char>::~MarisaTrie(_QWORD *a1)
{
  void *v2;

  *a1 = &off_1E2632148;
  v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  internal::marisa::Trie::~Trie((internal::marisa::Trie *)(a1 + 2));
  return a1;
}

__n128 __Block_byref_object_copy__49(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

__n128 __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__18(uint64_t a1)
{
  return std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](a1 + 40);
}

uint64_t CEM::ReadOnlyFile<char>::~ReadOnlyFile(uint64_t a1)
{
  void *v2;
  const char *v3;
  int v4;
  int v5;

  v2 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    if (*(_BYTE *)(a1 + 68))
    {
      munmap(*(void **)a1, *(_QWORD *)(a1 + 8));
    }
    else
    {
      if (*(_DWORD *)(a1 + 64) != 2)
        goto LABEL_10;
      v3 = (const char *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0)
        v3 = *(const char **)v3;
      v4 = open(v3, 2);
      v5 = v4;
      v2 = *(void **)a1;
      if ((v4 & 0x80000000) == 0)
      {
        write(v4, *(const void **)a1, *(_QWORD *)(a1 + 8));
        close(v5);
        v2 = *(void **)a1;
      }
      if (v2)
LABEL_10:
        MEMORY[0x18D7921C8](v2, 0x1000C8077774924);
    }
  }
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  return a1;
}

void std::__shared_ptr_pointer<CEM::ReadOnlyFile<char> *,std::shared_ptr<CEM::ReadOnlyFile<char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<char>,CEM::ReadOnlyFile<char>>,std::allocator<CEM::ReadOnlyFile<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<char> *,std::shared_ptr<CEM::ReadOnlyFile<char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<char>,CEM::ReadOnlyFile<char>>,std::allocator<CEM::ReadOnlyFile<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    CEM::ReadOnlyFile<char>::~ReadOnlyFile(result);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<char> *,std::shared_ptr<CEM::ReadOnlyFile<char>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<char>,CEM::ReadOnlyFile<char>>,std::allocator<CEM::ReadOnlyFile<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000018D7465E7))
    return a1 + 24;
  else
    return 0;
}

void trie::MarisaTrie<unsigned int,char>::~MarisaTrie(_QWORD *a1)
{
  trie::MarisaTrie<unsigned int,char>::~MarisaTrie(a1);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t trie::Trie<unsigned int,char,internal::marisa::Cursor>::build(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t i;
  void *v10;
  size_t v11;
  std::vector<std::string>::pointer end;
  std::string *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *__p;
  char *v35;
  unint64_t v36;
  std::vector<std::string> v37;
  std::__split_buffer<std::string> __v;

  memset(&v37, 0, sizeof(v37));
  __p = 0;
  v35 = 0;
  v36 = 0;
  if (a2)
  {
    for (i = 0; i != a2; ++i)
    {
      v10 = *(void **)(a3 + 8 * i);
      v11 = *(_QWORD *)(a4 + 8 * i);
      end = v37.__end_;
      if (v37.__end_ >= v37.__end_cap_.__value_)
      {
        v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_ - (char *)v37.__begin_) >> 3);
        v15 = v14 + 1;
        if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3) > v15)
          v15 = 0x5555555555555556 * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3) >= 0x555555555555555)
          v16 = 0xAAAAAAAAAAAAAAALL;
        else
          v16 = v15;
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v37.__end_cap_;
        if (v16)
          v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v16);
        else
          v17 = 0;
        __v.__first_ = (std::__split_buffer<std::string>::pointer)v16;
        __v.__begin_ = (std::__split_buffer<std::string>::pointer)(v16 + 24 * v14);
        __v.__end_ = __v.__begin_;
        __v.__end_cap_.__value_ = (std::string *)(v16 + 24 * v17);
        std::string::basic_string[abi:ne180100](__v.__begin_->__r_.__value_.__r.__words, v10, v11);
        ++__v.__end_;
        std::vector<std::string>::__swap_out_circular_buffer(&v37, &__v);
        v13 = v37.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
      }
      else
      {
        std::string::basic_string[abi:ne180100](v37.__end_->__r_.__value_.__r.__words, *(void **)(a3 + 8 * i), *(_QWORD *)(a4 + 8 * i));
        v13 = end + 1;
      }
      v37.__end_ = v13;
      if (a5)
      {
        v18 = *(_QWORD *)(a5 + 8 * i);
        v19 = v35;
        if ((unint64_t)v35 >= v36)
        {
          v21 = __p;
          v22 = (v35 - __p) >> 2;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v24 = v36 - (_QWORD)__p;
          if ((uint64_t)(v36 - (_QWORD)__p) >> 1 > v23)
            v23 = v24 >> 1;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL)
            v25 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          if (v25)
            v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v25);
          else
            v26 = 0;
          v27 = (char *)(v25 + 4 * v22);
          *(_DWORD *)v27 = v18;
          v20 = v27 + 4;
          while (v19 != __p)
          {
            v28 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v27 - 1) = v28;
            v27 -= 4;
          }
          __p = v27;
          v36 = v25 + 4 * v26;
          if (v21)
            operator delete(v21);
        }
        else
        {
          *(_DWORD *)v35 = v18;
          v20 = v35 + 4;
        }
        v35 = v20;
      }
    }
  }
  v29 = *a1;
  if (a5)
    v30 = (*(uint64_t (**)(void))(v29 + 64))();
  else
    v30 = (*(uint64_t (**)(void))(v29 + 56))();
  v31 = v30;
  if (__p)
    operator delete(__p);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  return v31;
}

void sub_18D73510C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, std::__split_buffer<std::string> *a10, uint64_t a11, void *__pa, void *a13, uint64_t a14, char a15)
{
  if (__pa)
  {
    a13 = __pa;
    operator delete(__pa);
  }
  __pa = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

uint64_t trie::Trie<unsigned int,char,internal::marisa::Cursor>::lookup(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v6;

  v6 = 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)a1 + 80))(a1, a2, a3, &v6);
  *a4 = v6;
  return result;
}

_QWORD *trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E2632530;
  v6[1] = a4;
  v7 = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)a1 + 88))(a1, a2, a3, v6);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_18D735240(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E26324D8;
  v6[1] = a4;
  v7 = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)a1 + 96))(a1, a2, a3, v6);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_18D735318(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t trie::MarisaTrie<unsigned int,char>::serialize@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v4;
  int v5;
  const std::string::value_type *v6;
  void **v7;
  std::string::size_type v8;
  uint64_t v9;
  std::string::value_type __s[4];
  void *__p[2];
  int64_t v13;
  _QWORD v14[2];
  uint64_t v15;
  _QWORD v16[10];
  char v17;
  uint64_t v18;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v14);
  internal::marisa::Trie::write((internal::marisa::grimoire::trie::LoudsTrie ***)(a1 + 16), (uint64_t)&v15);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>(__p, (uint64_t)v16);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = HIBYTE(v13);
    if (v13 < 0)
      v5 = (int)__p[1];
    *(_DWORD *)__s = v5;
    v6 = *(const std::string::value_type **)(a1 + 24);
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    a2->__r_.__value_.__r.__words[0] = 0;
    std::string::append(a2, __s, 4uLL);
    if (v13 >= 0)
      v7 = __p;
    else
      v7 = (void **)__p[0];
    if (v13 >= 0)
      v8 = HIBYTE(v13);
    else
      v8 = (std::string::size_type)__p[1];
    std::string::append(a2, (const std::string::value_type *)v7, v8);
    std::string::append(a2, v6, 4 * v4);
    if (SHIBYTE(v13) < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    a2->__r_.__value_.__r.__words[2] = v13;
  }
  v14[0] = *MEMORY[0x1E0DE4F50];
  v9 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v14 + *(_QWORD *)(v14[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v15 = v9;
  v16[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (v17 < 0)
    operator delete((void *)v16[8]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x18D792198](&v18);
}

void sub_18D7354A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

uint64_t trie::MarisaTrie<unsigned int,char>::build(uint64_t a1, uint64_t **a2)
{
  return trie::MarisaTrie<unsigned int,char>::buildFromKeys(a1, *a2, a2[1], 0);
}

uint64_t trie::MarisaTrie<unsigned int,char>::build(uint64_t a1, uint64_t **a2, int **a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  int *v30;
  uint64_t *v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *__p;
  void *v38;
  uint64_t v39;

  __p = 0;
  v38 = 0;
  v39 = 0;
  v5 = *a2;
  v6 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * (v6 - v5) != a3[1] - *a3)
    __assert_rtn("build", "MarisaTrie.h", 61, "keys.size() == values.size()");
  v9 = trie::MarisaTrie<unsigned int,char>::buildFromKeys(a1, v5, v6, &__p);
  if ((_DWORD)v9)
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (a2[1] - *a2);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (v12 - v11) >> 2;
    if (v10 <= v13)
    {
      if (v10 >= v13)
      {
LABEL_20:
        v27 = *(_QWORD *)(a1 + 40);
        v28 = (char *)a2[1] - (char *)*a2;
        if (v28)
        {
          v29 = v28 / 24;
          v30 = *a3;
          v31 = (uint64_t *)__p;
          if (v29 <= 1)
            v29 = 1;
          do
          {
            v33 = *v30++;
            v32 = v33;
            v34 = *v31++;
            *(_DWORD *)(v27 + 4 * v34) = v32;
            --v29;
          }
          while (v29);
        }
        v35 = (*(_QWORD *)(a1 + 48) - v27) >> 2;
        *(_QWORD *)(a1 + 24) = v27;
        *(_QWORD *)(a1 + 32) = v35;
        goto LABEL_25;
      }
      v26 = v11 - 0x5555555555555554 * (a2[1] - *a2);
    }
    else
    {
      v14 = v10 - v13;
      v15 = *(_QWORD *)(a1 + 56);
      if (v10 - v13 > (v15 - v12) >> 2)
      {
        if (v10 >> 62)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v16 = v15 - v11;
        if (v16 >> 1 > v10)
          v10 = v16 >> 1;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
          v17 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v17 = v10;
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v17);
        v19 = *(char **)(a1 + 40);
        v20 = *(char **)(a1 + 48);
        v21 = &v18[4 * v13];
        v23 = &v18[4 * v22];
        bzero(v21, 4 * v14);
        v24 = &v21[4 * v14];
        while (v20 != v19)
        {
          v25 = *((_DWORD *)v20 - 1);
          v20 -= 4;
          *((_DWORD *)v21 - 1) = v25;
          v21 -= 4;
        }
        *(_QWORD *)(a1 + 40) = v21;
        *(_QWORD *)(a1 + 48) = v24;
        *(_QWORD *)(a1 + 56) = v23;
        if (v19)
          operator delete(v19);
        goto LABEL_20;
      }
      bzero(*(void **)(a1 + 48), 4 * v14);
      v26 = v12 + 4 * v14;
    }
    *(_QWORD *)(a1 + 48) = v26;
    goto LABEL_20;
  }
LABEL_25:
  if (__p)
  {
    v38 = __p;
    operator delete(__p);
  }
  return v9;
}

void sub_18D7356F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t trie::MarisaTrie<unsigned int,char>::lookup(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *a4)
{
  uint64_t v6;
  unint64_t v8;

  v8 = 0;
  v6 = internal::marisa::Trie::lookup((internal::marisa::grimoire::vector::BitVector **)(a1 + 16), a2, a3, &v8);
  if ((_DWORD)v6)
    *a4 = trie::MarisaTrie<unsigned int,char>::getCustomPayload(a1, v8);
  return v6;
}

_QWORD *trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E2632480;
  v6[1] = a1;
  v6[2] = a4;
  v7 = v6;
  internal::marisa::Trie::common_prefix_search((uint64_t *)(a1 + 16), a2, a3, (uint64_t)v6);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_18D73580C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *trie::MarisaTrie<unsigned int,char>::enumerateCompletions(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7[0] = &off_1E2632428;
  v7[1] = a1;
  v7[2] = a4;
  v8 = v7;
  internal::marisa::Trie::predictive_search((internal::marisa::grimoire::vector::BitVector **)(a1 + 16), a2, a3, (uint64_t)v7, a5);
  result = v8;
  if (v8 == v7)
  {
    v6 = 4;
    result = v7;
  }
  else
  {
    if (!v8)
      return result;
    v6 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v6))();
}

void sub_18D7358E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

double trie::MarisaTrie<unsigned int,char>::root@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

BOOL trie::MarisaTrie<unsigned int,char>::isValid(uint64_t a1, _QWORD *a2)
{
  return *a2 != 0xFFFFFFFFLL;
}

void trie::MarisaTrie<unsigned int,char>::advance(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(a1 + 16), a3, a4, a2, a5);
}

uint64_t trie::MarisaTrie<unsigned int,char>::getPayload(uint64_t *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t payload;
  unint64_t v8;

  if (!(*(unsigned int (**)(uint64_t *))(*a1 + 112))(a1))
    return 0;
  v8 = 0;
  payload = internal::marisa::Trie::get_payload(a1 + 2, a2, &v8);
  if ((_DWORD)payload)
    *a3 = trie::MarisaTrie<unsigned int,char>::getCustomPayload((uint64_t)a1, v8);
  return payload;
}

_QWORD *trie::MarisaTrie<unsigned int,char>::enumerateEntries(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = (_QWORD *)(*(uint64_t (**)(unint64_t *))(*a1 + 112))(a1);
  if ((_DWORD)result)
  {
    v10[0] = &off_1E2632378;
    v10[1] = a1;
    v10[2] = a3;
    v11 = v10;
    internal::marisa::Trie::enumerate_entries(a1 + 2, a2, (uint64_t)v10, a4);
    result = v11;
    if (v11 == v10)
    {
      v9 = 4;
      result = v10;
    }
    else
    {
      if (!v11)
        return result;
      v9 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v9))();
  }
  return result;
}

void sub_18D735A9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *trie::MarisaTrie<unsigned int,char>::enumerateChildren(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = (_QWORD *)(*(uint64_t (**)(uint64_t *))(*a1 + 112))(a1);
  if ((_DWORD)result)
  {
    v8[0] = &off_1E26323D0;
    v8[1] = a3;
    v9 = v8;
    internal::marisa::Trie::enumerate_children(a1 + 2, a2, (uint64_t)v8);
    result = v9;
    if (v9 == v8)
    {
      v7 = 4;
      result = v8;
    }
    else
    {
      if (!v9)
        return result;
      v7 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
  }
  return result;
}

void sub_18D735B94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E26323D0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E26323D0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::operator()(uint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a1 + 8);
  v5 = *a2;
  v3 = *(_QWORD *)(v2 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)v3 + 48))(v3, &v5);
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie10MarisaTrieIjcE17enumerateChildrenERKN8internal6marisa6CursorERKNSt3__18functionIFvcS6_RbEEEEUlcS6_S9_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateChildren(internal::marisa::Cursor const&,std::function<void ()(char,internal::marisa::Cursor const&,BOOL &)> const&)::{lambda(char,internal::marisa::Cursor const&,BOOL &)#1}>,void ()(char,internal::marisa::Cursor const&,BOOL &)>::target_type()
{
}

void std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E2632378;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E2632378;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::operator()(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  int CustomPayload;

  v6 = *a3;
  v7 = a3[1];
  CustomPayload = trie::MarisaTrie<unsigned int,char>::getCustomPayload(*(_QWORD *)(a1 + 8), *a2);
  return std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), CustomPayload, v6, v7, a4);
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie10MarisaTrieIjcE16enumerateEntriesERKN8internal6marisa6CursorERKNSt3__18functionIFvjNS7_17basic_string_viewIcNS7_11char_traitsIcEEEERbEEEiEUlmSC_SD_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateEntries(internal::marisa::Cursor const&,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target_type()
{
}

unint64_t trie::MarisaTrie<unsigned int,char>::getCustomPayload(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  std::logic_error *exception;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (v2 <= a2)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::out_of_range::out_of_range[abi:ne180100](exception, "Marisa Payload");
      __cxa_throw(exception, (struct type_info *)off_1E2631BD8, MEMORY[0x1E0DE42E0]);
    }
    return *(unsigned int *)(*(_QWORD *)(a1 + 24) + 4 * a2);
  }
  return a2;
}

void sub_18D735E20(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6;
  _QWORD v7[2];

  v7[0] = a3;
  v7[1] = a4;
  v6 = a2;
  if (!a1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, _QWORD *, uint64_t))(*(_QWORD *)a1 + 48))(a1, &v6, v7, a5);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

void std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E2632428;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E2632428;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::operator()(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  int CustomPayload;

  v6 = *a3;
  v7 = a3[1];
  CustomPayload = trie::MarisaTrie<unsigned int,char>::getCustomPayload(*(_QWORD *)(a1 + 8), *a2);
  return std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), CustomPayload, v6, v7, a4);
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie10MarisaTrieIjcE20enumerateCompletionsENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEERKNS2_8functionIFvjS6_RbEEEiEUlmS6_S8_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target_type()
{
}

void std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E2632480;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E2632480;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::operator()(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  int CustomPayload;

  v6 = *a3;
  v7 = a3[1];
  CustomPayload = trie::MarisaTrie<unsigned int,char>::getCustomPayload(*(_QWORD *)(a1 + 8), *a2);
  return std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), CustomPayload, v6, v7, a4);
}

uint64_t std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie10MarisaTrieIjcE22enumeratePrefixStringsENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEERKNS2_8functionIFvjS6_RbEEEEUlmS6_S8_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1},std::allocator<trie::MarisaTrie<unsigned int,char>::enumeratePrefixStrings(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&)::{lambda(unsigned long,std::string_view,BOOL &)#1}>,void ()(unsigned long,std::string_view,BOOL &)>::target_type()
{
}

uint64_t trie::MarisaTrie<unsigned int,char>::buildFromKeys(uint64_t a1, uint64_t *a2, uint64_t *a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v7;
  char *v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  void *__p;
  _QWORD *v24;
  char *v25;

  v4 = a4;
  v5 = a1;
  __p = 0;
  v24 = 0;
  v25 = 0;
  if (a2 != a3)
  {
    v7 = a2;
    v8 = 0;
    v9 = 0;
    v10 = v24;
    do
    {
      if (*((char *)v7 + 23) < 0)
      {
        v12 = (uint64_t *)*v7;
        v11 = v7[1];
      }
      else
      {
        v11 = *((unsigned __int8 *)v7 + 23);
        v12 = v7;
      }
      if (v9 >= v25)
      {
        v13 = (v9 - v8) >> 4;
        v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 60)
        {
          v24 = v10;
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        v15 = v25 - v8;
        if ((v25 - v8) >> 3 > v14)
          v14 = v15 >> 3;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
          v16 = 0xFFFFFFFFFFFFFFFLL;
        else
          v16 = v14;
        if (v16 >> 60)
        {
          v24 = v10;
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v17 = (char *)operator new(16 * v16);
        v18 = &v17[16 * v13];
        *(_QWORD *)v18 = v12;
        *((_QWORD *)v18 + 1) = v11;
        v19 = (char *)__p;
        v8 = v18;
        if (v9 != __p)
        {
          do
          {
            *((_OWORD *)v8 - 1) = *((_OWORD *)v9 - 1);
            v8 -= 16;
            v9 -= 16;
          }
          while (v9 != v19);
          v9 = v19;
        }
        v10 = v18 + 16;
        __p = v8;
        v25 = &v17[16 * v16];
        if (v9)
          operator delete(v9);
      }
      else
      {
        *(_QWORD *)v9 = v12;
        *((_QWORD *)v9 + 1) = v11;
        v10 = v9 + 16;
      }
      v7 += 3;
      v9 = (char *)v10;
    }
    while (v7 != a3);
    v24 = v10;
    v5 = a1;
    v4 = a4;
  }
  internal::marisa::Trie::build((internal::marisa::grimoire::trie::LoudsTrie **)(v5 + 16), (uint64_t *)&__p, v4, *(_DWORD *)(v5 + 8));
  if (__p)
  {
    v24 = __p;
    operator delete(__p);
  }
  return 1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x1E0DE4FD0];
  v3 = MEMORY[0x1E0DE4FD0] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x1E0DE4FD0] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x1E0DE4F50];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 16);
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_18D7363BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x18D792198](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::stringbuf::str[abi:ne180100]<std::allocator<char>>(_QWORD *__dst, uint64_t a2)
{
  _QWORD *v2;
  int v3;
  size_t v4;
  unint64_t v5;
  unint64_t v6;
  const void **v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v2 = __dst;
  v3 = *(_DWORD *)(a2 + 96);
  if ((v3 & 0x10) != 0)
  {
    v5 = *(_QWORD *)(a2 + 88);
    v6 = *(_QWORD *)(a2 + 48);
    if (v5 < v6)
    {
      *(_QWORD *)(a2 + 88) = v6;
      v5 = v6;
    }
    v7 = (const void **)(a2 + 40);
  }
  else
  {
    if ((v3 & 8) == 0)
    {
      v4 = 0;
      *((_BYTE *)__dst + 23) = 0;
      goto LABEL_16;
    }
    v7 = (const void **)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 32);
  }
  v8 = *v7;
  v4 = v5 - (_QWORD)*v7;
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 >= 0x17)
  {
    v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v9 = v4 | 7;
    v10 = v9 + 1;
    v11 = operator new(v9 + 1);
    v2[1] = v4;
    v2[2] = v10 | 0x8000000000000000;
    *v2 = v11;
    v2 = v11;
  }
  else
  {
    *((_BYTE *)__dst + 23) = v4;
    if (!v4)
      goto LABEL_16;
  }
  __dst = memmove(v2, v8, v4);
LABEL_16:
  *((_BYTE *)v2 + v4) = 0;
  return __dst;
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x1E0DE4F50];
  v3 = *MEMORY[0x1E0DE4F50];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F50];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x18D792198](a1 + 128);
  return a1;
}

void std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E26324D8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E26324D8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4)
{
  return std::function<void ()(long long,std::string_view,BOOL &)>::operator()(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24), *a2, *a3, a3[1], a4);
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie4TrieIjcN8internal6marisa6CursorEE20enumerateCompletionsEPKcmRKNSt3__18functionIFvxNS7_17basic_string_viewIcNS7_11char_traitsIcEEEERbEEEiEUljSC_SD_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

uint64_t std::function<void ()(long long,std::string_view,BOOL &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  _QWORD v7[2];

  v7[0] = a3;
  v7[1] = a4;
  v6 = a2;
  if (!a1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)a1 + 48))(a1, &v6, v7, a5);
}

void std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2632530;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E2632530;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4)
{
  return std::function<void ()(long long,std::string_view,BOOL &)>::operator()(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24), *a2, *a3, a3[1], a4);
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie4TrieIjcN8internal6marisa6CursorEE22enumeratePrefixStringsEPKcmRKNSt3__18functionIFvxNS7_17basic_string_viewIcNS7_11char_traitsIcEEEERbEEEEUljSC_SD_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,internal::marisa::Cursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 3;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::vector<std::string>::pointer begin;
  std::string *end;
  std::__split_buffer<std::string>::pointer v4;
  std::string *v5;
  __int128 v6;
  std::string *v7;
  std::string *v8;
  std::string *value;

  begin = this->__begin_;
  end = this->__end_;
  v4 = __v->__begin_;
  if (end == this->__begin_)
  {
    v5 = __v->__begin_;
  }
  else
  {
    do
    {
      v5 = v4 - 1;
      v6 = *(_OWORD *)&end[-1].__r_.__value_.__l.__data_;
      v4[-1].__r_.__value_.__r.__words[2] = end[-1].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v4[-1].__r_.__value_.__l.__data_ = v6;
      end[-1].__r_.__value_.__l.__size_ = 0;
      end[-1].__r_.__value_.__r.__words[2] = 0;
      end[-1].__r_.__value_.__r.__words[0] = 0;
      --v4;
      --end;
    }
    while (end != begin);
  }
  __v->__begin_ = v5;
  v7 = this->__begin_;
  this->__begin_ = v5;
  __v->__begin_ = v7;
  v8 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v8;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

void CEM::EmojiSearchTrie::EmojiSearchTrie(CEM::EmojiSearchTrie *this, const __CFLocale *a2, const __CFURL *a3)
{
  _BYTE v5[24];

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = &off_1E2632148;
  *((_DWORD *)this + 6) = 0;
  internal::marisa::Trie::Trie((_QWORD *)this + 4);
  *((_QWORD *)this + 9) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  CEM::getFileSystemRepresentationFromCFURL((CEM *)v5, a3);
}

uint64_t sub_18D7369C0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  const __CFLocale *v27;
  void **v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  const __CFString *Value;
  _QWORD *exception;
  _QWORD *v35;
  __int128 v36;
  uint64_t v37;

  CEM::ReadOnlyFile<char>::open((_QWORD *)(v26 + 80), (uint64_t)&v36, (uint64_t)"r");
  if (SHIBYTE(v37) < 0)
    operator delete((void *)v36);
  *(_QWORD *)(v26 + 96) = 0;
  v28 = (void **)(v26 + 96);
  *(_WORD *)(v26 + 120) = 0;
  *(_QWORD *)(v26 + 104) = 0;
  *(_QWORD *)(v26 + 112) = 0;
  v29 = **(_QWORD **)(v26 + 80);
  if (*(_DWORD *)v29 != 1068023249)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v36, "string map file is invalid");
    CEM::ResourceCreationException::ResourceCreationException(exception, &v36);
  }
  if (*(_WORD *)(v29 + 4) != 1)
  {
    v35 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v36, "string map file version is not supported");
    CEM::ResourceCreationException::ResourceCreationException(v35, &v36);
  }
  v30 = *(unsigned int *)(v29 + 8);
  v31 = *(unsigned int *)(v29 + 12);
  *(_QWORD *)v26 = v29 + 16 + v30;
  *(_QWORD *)(v26 + 8) = v31;
  *(_WORD *)(v26 + 120) = *(_WORD *)(v29 + 6);
  trie::MarisaTrie<unsigned int,char>::load(v25, (char *)(v29 + 16), v30);
  Value = (const __CFString *)CFLocaleGetValue(v27, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
  CEM::getUTF8StringFromCFString(&v36, Value);
  if (*(char *)(v26 + 119) < 0)
    operator delete(*v28);
  *(_OWORD *)v28 = v36;
  *(_QWORD *)(v26 + 112) = v37;
  return v26;
}

void sub_18D736B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  void *v19;
  int v20;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v20 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v16 + 119) < 0)
        operator delete(*v18);
      std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](v17);
      trie::MarisaTrie<unsigned int,char>::~MarisaTrie(v15);
      _Unwind_Resume(a1);
    }
  }
  else if (!v20)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v19);
  goto LABEL_6;
}

void CEM::EmojiSearchTrie::payloadToIndexes(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  uint64_t v7;
  uint64_t v8;
  _WORD *v9;
  uint64_t v10;
  unint64_t v11;
  _WORD *v13;
  unint64_t v14;
  _WORD *v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  __int16 v24;

  v4 = a2 & 0x3FFFFF;
  v5 = *a1;
  v6 = (_WORD *)(*a1 + 2 * v4);
  if ((a1[15] & 1) != 0)
  {
    v8 = a1[1];
    v9 = (_WORD *)(*a1 + 2 * v4);
    if (v8 != v4)
    {
      v9 = (_WORD *)(*a1 + 2 * v4);
      v10 = 2 * v8 - 2 * v4;
      while (*v9)
      {
        ++v9;
        v10 -= 2;
        if (!v10)
        {
          v9 = (_WORD *)(v5 + 2 * v8);
          break;
        }
      }
    }
    v7 = v9 - v6;
  }
  else
  {
    v7 = a2 >> 22;
    v8 = a1[1];
  }
  v11 = (unint64_t)&v6[v7];
  if (v5 + 2 * v8 >= v11 && v7 != 0)
  {
    v13 = *(_WORD **)(a3 + 8);
    do
    {
      v14 = *(_QWORD *)(a3 + 16);
      if ((unint64_t)v13 >= v14)
      {
        v16 = *(_WORD **)a3;
        v17 = (uint64_t)v13 - *(_QWORD *)a3;
        if (v17 <= -3)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v18 = v17 >> 1;
        v19 = v14 - (_QWORD)v16;
        if (v19 <= (v17 >> 1) + 1)
          v20 = v18 + 1;
        else
          v20 = v19;
        if (v19 >= 0x7FFFFFFFFFFFFFFELL)
          v21 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v21 = v20;
        if (v21)
        {
          if (v21 < 0)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = (char *)operator new(2 * v21);
        }
        else
        {
          v22 = 0;
        }
        v23 = &v22[2 * v18];
        *(_WORD *)v23 = *v6;
        v15 = v23 + 2;
        while (v13 != v16)
        {
          v24 = *--v13;
          *((_WORD *)v23 - 1) = v24;
          v23 -= 2;
        }
        *(_QWORD *)a3 = v23;
        *(_QWORD *)(a3 + 8) = v15;
        *(_QWORD *)(a3 + 16) = &v22[2 * v21];
        if (v16)
          operator delete(v16);
      }
      else
      {
        *v13 = *v6;
        v15 = v13 + 1;
      }
      *(_QWORD *)(a3 + 8) = v15;
      ++v6;
      v13 = v15;
    }
    while (v6 != (_WORD *)v11);
  }
}

__n128 CEM::replace(uint64_t a1, std::string *this, uint64_t a3, uint64_t a4)
{
  std::string::size_type i;
  std::string::size_type size;
  std::string *v10;
  int v11;
  char *v12;
  int64_t v13;
  char *v14;
  char *v15;
  int64_t v16;
  int v17;
  int64_t v18;
  char *v19;
  char *v20;
  int v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  uint64_t v24;
  __n128 result;

  for (i = 0; ; i += v24)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      v10 = (std::string *)this->__r_.__value_.__r.__words[0];
      size = this->__r_.__value_.__l.__size_;
    }
    else
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v10 = this;
    }
    v11 = *(char *)(a3 + 23);
    v12 = v11 >= 0 ? (char *)a3 : *(char **)a3;
    v13 = v11 >= 0 ? *(unsigned __int8 *)(a3 + 23) : *(_QWORD *)(a3 + 8);
    if (size < i)
      break;
    if (v13)
    {
      v14 = (char *)v10 + i;
      v15 = (char *)v10 + size;
      v16 = size - i;
      if (v16 >= v13)
      {
        v17 = *v12;
        while (1)
        {
          v18 = v16 - v13;
          if (v18 == -1)
            break;
          v19 = (char *)memchr(v14, v17, v18 + 1);
          if (!v19)
            break;
          v20 = v19;
          if (!memcmp(v19, v12, v13))
          {
            if (v20 == v15)
              goto LABEL_32;
            i = v20 - (char *)v10;
            goto LABEL_22;
          }
          v14 = v20 + 1;
          v16 = v15 - (v20 + 1);
          if (v16 < v13)
            goto LABEL_32;
        }
      }
      break;
    }
LABEL_22:
    if (i == -1)
      break;
    v21 = *(char *)(a4 + 23);
    if (v21 >= 0)
      v22 = (const std::string::value_type *)a4;
    else
      v22 = *(const std::string::value_type **)a4;
    if (v21 >= 0)
      v23 = *(unsigned __int8 *)(a4 + 23);
    else
      v23 = *(_QWORD *)(a4 + 8);
    std::string::replace(this, i, v13, v22, v23);
    v24 = *(unsigned __int8 *)(a4 + 23);
    if ((v24 & 0x80u) != 0)
      v24 = *(_QWORD *)(a4 + 8);
  }
LABEL_32:
  result = *(__n128 *)&this->__r_.__value_.__l.__data_;
  *(_OWORD *)a1 = *(_OWORD *)&this->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)&this->__r_.__value_.__l + 2);
  this->__r_.__value_.__l.__size_ = 0;
  this->__r_.__value_.__r.__words[2] = 0;
  this->__r_.__value_.__r.__words[0] = 0;
  return result;
}

uint64_t CEM::EmojiSearchTrie::getPayload(uint64_t a1, uint64_t a2, int a3, _DWORD *a4)
{
  uint64_t *v5;
  uint64_t Payload;
  void *v8[3];
  char v9;
  int v10;

  v10 = a3;
  v5 = (uint64_t *)(a1 + 16);
  if ((*(_WORD *)(a1 + 120) & 2) == 0)
    return trie::MarisaTrie<unsigned int,char>::getPayload((uint64_t *)(a1 + 16), a2, a4);
  internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(a1 + 32), (uint64_t)&v10, 1uLL, a2, v8);
  Payload = trie::MarisaTrie<unsigned int,char>::getPayload(v5, (uint64_t)v8, a4);
  if (v9 < 0)
    operator delete(v8[1]);
  return Payload;
}

void sub_18D736F18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

__n128 std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_1E26322C8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E26322C8;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, _QWORD *a3)
{
  unsigned int v3;
  uint64_t v4;

  v3 = *a2;
  if ((*(_WORD *)(*(_QWORD *)(a1 + 8) + 120) & 2) == 0
    || (v4 = a3[1]) != 0 && **(_DWORD **)(a1 + 16) == *(char *)(v4 + *a3 - 1))
  {
    CEM::EmojiSearchTrie::payloadToIndexes(*(uint64_t **)(a1 + 8), v3, *(_QWORD *)(a1 + 24));
  }
}

uint64_t std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK3CEM15EmojiSearchTrie22findEmojiForSingleWordEPK10__CFStringS3_18CEMEmojiSearchTypehE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0,std::allocator<CEM::EmojiSearchTrie::findEmojiForSingleWord(__CFString const*,__CFString const*,CEMEmojiSearchType,unsigned char)::$_0>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_initialize(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t i;
  uint64_t v6;
  unint64_t v7;
  uint64_t j;

  v2 = (_QWORD *)(a1 + 8);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>((void **)(a1 + 8), 256, 256);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<char>((void **)(a1 + 16), 4, 0);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<int>((void **)(a1 + 24), 1, 0);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>((void **)(a1 + 32), 256, 0);
  cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>((void **)(a1 + 40), 1, 0);
  v3 = 0;
  **(_QWORD **)(a1 + 8) = 0xFFFFFFFF00000000;
  v4 = 0xFFFFFFFE00000000;
  for (i = 8; i != 2048; i += 8)
  {
    v6 = v3;
    if (i == 2040)
      v7 = 0xFFFFFFFF00000000;
    else
      v7 = v4;
    if (!v3)
      v6 = 4294967041;
    *(_QWORD *)(*v2 + i) = v7 | v6;
    v4 -= 0x100000000;
    --v3;
  }
  *(_QWORD *)(a1 + 60) = 0x10000000100;
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 16) = 1;
  **(_DWORD **)(a1 + 16) = 4;
  *(_QWORD *)(a1 + 68) = 0x100000004;
  *(_QWORD *)a1 = 0;
  for (j = 40; j != 297; ++j)
    *(_WORD *)(a1 + 2 * j) = j - 39;
}

uint64_t *std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    if (*(char *)(v2 + 167) < 0)
      operator delete(*(void **)(v2 + 144));
    std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](v2 + 128);
    std::mutex::~mutex((std::mutex *)(v2 + 64));
    std::mutex::~mutex((std::mutex *)v2);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>(void **a1, int a2, int a3)
{
  void *v6;
  unsigned __int8 v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = malloc_type_realloc(*a1, 8 * a2, 0x100004000313F17uLL);
  if (!v6)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/3949dc93-559d-11ef-b093-5a7ac3341c94/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v6;
  if ((v7 & 1) == 0
  {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>(cedar::da<unsigned int,-1,-2,true,1,0ul>::node *&,int,int)::T0 = 0;
  }
  if (a3 != a2)
  {
    v8 = (uint64_t *)((char *)*a1 + 8 * a3);
    v9 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>(cedar::da<unsigned int,-1,-2,true,1,0ul>::node *&,int,int)::T0;
    v10 = 8 * a2 - 8 * a3;
    do
    {
      *v8++ = v9;
      v10 -= 8;
    }
    while (v10);
  }
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<char>(void **a1, int a2, int a3)
{
  uint64_t v6;
  char *v7;

  v6 = a2;
  v7 = (char *)malloc_type_realloc(*a1, a2, 0x100004077774924uLL);
  if (!v7)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/3949dc93-559d-11ef-b093-5a7ac3341c94/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v7;
  if (a3 != a2)
    bzero(&v7[a3], v6 - a3);
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<int>(void **a1, int a2, int a3)
{
  size_t v6;
  char *v7;

  v6 = 4 * a2;
  v7 = (char *)malloc_type_realloc(*a1, v6, 0x100004052888210uLL);
  if (!v7)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/3949dc93-559d-11ef-b093-5a7ac3341c94/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v7;
  if (a3 != a2)
    bzero(&v7[4 * a3], v6 - 4 * a3);
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>(void **a1, int a2, int a3)
{
  void *v6;
  unsigned __int8 v7;
  __int16 *v8;
  __int16 v9;
  uint64_t v10;

  v6 = malloc_type_realloc(*a1, 2 * a2, 0x1000040BDFB0063uLL);
  if (!v6)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/3949dc93-559d-11ef-b093-5a7ac3341c94/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v6;
  if ((v7 & 1) == 0
  {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>(cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo *&,int,int)::T0 = 0;
  }
  if (a3 != a2)
  {
    v8 = (__int16 *)((char *)*a1 + 2 * a3);
    v9 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>(cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo *&,int,int)::T0;
    v10 = 2 * a2 - 2 * a3;
    do
    {
      *v8++ = v9;
      v10 -= 2;
    }
    while (v10);
  }
}

__n128 cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(void **a1, int a2, int a3)
{
  void *v6;
  __n128 result;
  unsigned __int8 v8;
  __n128 *v9;
  uint64_t v10;

  v6 = malloc_type_realloc(*a1, 20 * a2, 0x1000040A86A77D5uLL);
  if (!v6)
  {
    free(*a1);
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "cedar: %s [%d]: %s", "/AppleInternal/Library/BuildRoots/3949dc93-559d-11ef-b093-5a7ac3341c94/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/trie/cedarpp.h", 770, "memory reallocation failed\n");
    exit(1);
  }
  *a1 = v6;
  if ((v8 & 1) == 0
  {
    *(_QWORD *)&cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(cedar::da<unsigned int,-1,-2,true,1,0ul>::block *&,int,int)::T0 = 0;
    DWORD2(cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(cedar::da<unsigned int,-1,-2,true,1,0ul>::block *&,int,int)::T0) = 16843008;
    *(_QWORD *)((char *)&cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(cedar::da<unsigned int,-1,-2,true,1,0ul>::block *&,int,int)::T0
              + 12) = 0;
  }
  if (a3 != a2)
  {
    v9 = (__n128 *)((char *)*a1 + 20 * a3);
    v10 = 20 * a2 - 20 * a3;
    do
    {
      result = (__n128)cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(cedar::da<unsigned int,-1,-2,true,1,0ul>::block *&,int,int)::T0;
      v9[1].n128_u32[0] = dword_1ECF16398;
      *v9 = result;
      v9 = (__n128 *)((char *)v9 + 20);
      v10 -= 20;
    }
    while (v10);
  }
  return result;
}

void trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie(_QWORD *a1)
{
  trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie(a1);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t trie::Trie<unsigned int,char,trie::CedarTrieCursor>::build(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t i;
  void *v10;
  size_t v11;
  std::vector<std::string>::pointer end;
  std::string *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *__p;
  char *v35;
  unint64_t v36;
  std::vector<std::string> v37;
  std::__split_buffer<std::string> __v;

  memset(&v37, 0, sizeof(v37));
  __p = 0;
  v35 = 0;
  v36 = 0;
  if (a2)
  {
    for (i = 0; i != a2; ++i)
    {
      v10 = *(void **)(a3 + 8 * i);
      v11 = *(_QWORD *)(a4 + 8 * i);
      end = v37.__end_;
      if (v37.__end_ >= v37.__end_cap_.__value_)
      {
        v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_ - (char *)v37.__begin_) >> 3);
        v15 = v14 + 1;
        if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3) > v15)
          v15 = 0x5555555555555556 * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_cap_.__value_ - (char *)v37.__begin_) >> 3) >= 0x555555555555555)
          v16 = 0xAAAAAAAAAAAAAAALL;
        else
          v16 = v15;
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v37.__end_cap_;
        if (v16)
          v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v16);
        else
          v17 = 0;
        __v.__first_ = (std::__split_buffer<std::string>::pointer)v16;
        __v.__begin_ = (std::__split_buffer<std::string>::pointer)(v16 + 24 * v14);
        __v.__end_ = __v.__begin_;
        __v.__end_cap_.__value_ = (std::string *)(v16 + 24 * v17);
        std::string::basic_string[abi:ne180100](__v.__begin_->__r_.__value_.__r.__words, v10, v11);
        ++__v.__end_;
        std::vector<std::string>::__swap_out_circular_buffer(&v37, &__v);
        v13 = v37.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
      }
      else
      {
        std::string::basic_string[abi:ne180100](v37.__end_->__r_.__value_.__r.__words, *(void **)(a3 + 8 * i), *(_QWORD *)(a4 + 8 * i));
        v13 = end + 1;
      }
      v37.__end_ = v13;
      if (a5)
      {
        v18 = *(_QWORD *)(a5 + 8 * i);
        v19 = v35;
        if ((unint64_t)v35 >= v36)
        {
          v21 = __p;
          v22 = (v35 - __p) >> 2;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v24 = v36 - (_QWORD)__p;
          if ((uint64_t)(v36 - (_QWORD)__p) >> 1 > v23)
            v23 = v24 >> 1;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL)
            v25 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          if (v25)
            v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v25);
          else
            v26 = 0;
          v27 = (char *)(v25 + 4 * v22);
          *(_DWORD *)v27 = v18;
          v20 = v27 + 4;
          while (v19 != __p)
          {
            v28 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v27 - 1) = v28;
            v27 -= 4;
          }
          __p = v27;
          v36 = v25 + 4 * v26;
          if (v21)
            operator delete(v21);
        }
        else
        {
          *(_DWORD *)v35 = v18;
          v20 = v35 + 4;
        }
        v35 = v20;
      }
    }
  }
  v29 = *a1;
  if (a5)
    v30 = (*(uint64_t (**)(void))(v29 + 64))();
  else
    v30 = (*(uint64_t (**)(void))(v29 + 56))();
  v31 = v30;
  if (__p)
    operator delete(__p);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  return v31;
}

void sub_18D73790C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, std::__split_buffer<std::string> *a10, uint64_t a11, void *__pa, void *a13, uint64_t a14, char a15)
{
  if (__pa)
  {
    a13 = __pa;
    operator delete(__pa);
  }
  __pa = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

uint64_t trie::Trie<unsigned int,char,trie::CedarTrieCursor>::lookup(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v6;

  v6 = 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)a1 + 80))(a1, a2, a3, &v6);
  *a4 = v6;
  return result;
}

_QWORD *trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E2632948;
  v6[1] = a4;
  v7 = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)a1 + 88))(a1, a2, a3, v6);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_18D737A40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E26328F0;
  v6[1] = a4;
  v7 = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)a1 + 96))(a1, a2, a3, v6);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_18D737B18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::serialize@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[10];
  char v6;
  uint64_t v7;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v4);
  std::ostream::write();
  std::ostream::write();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1, (uint64_t)v5);
  v4[0] = *MEMORY[0x1E0DE4F50];
  v2 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v4 + *(_QWORD *)(v4[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v4[2] = v2;
  v5[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (v6 < 0)
    operator delete((void *)v5[8]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x18D792198](&v7);
}

void sub_18D737C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v29;

  *(_QWORD *)(v29 + *(_QWORD *)(*MEMORY[0x1E0DE4F50] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  if (a26 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x18D792198](&a29);
  _Unwind_Resume(a1);
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::build(uint64_t a1, _QWORD *a2)
{
  char *v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  int v13;
  uint64_t v14;
  void *__p;
  void *v18;
  unint64_t v19;

  __p = 0;
  v18 = 0;
  v19 = 0;
  if (a2[1] != *a2)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    LODWORD(v6) = 1;
    do
    {
      if ((unint64_t)v5 >= v4)
      {
        v8 = (v5 - v3) >> 2;
        v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 62)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        if ((uint64_t)(v4 - (_QWORD)v3) >> 1 > v9)
          v9 = (uint64_t)(v4 - (_QWORD)v3) >> 1;
        if (v4 - (unint64_t)v3 >= 0x7FFFFFFFFFFFFFFCLL)
          v10 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v10 = v9;
        if (v10)
          v10 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v10);
        else
          v11 = 0;
        v12 = (_DWORD *)(v10 + 4 * v8);
        *v12 = v6;
        v7 = v12 + 1;
        while (v5 != v3)
        {
          v13 = *((_DWORD *)v5 - 1);
          v5 -= 4;
          *--v12 = v13;
        }
        v4 = v10 + 4 * v11;
        __p = v12;
        v19 = v4;
        if (v3)
          operator delete(v3);
        v3 = (char *)v12;
      }
      else
      {
        *(_DWORD *)v5 = v6;
        v7 = v5 + 4;
      }
      v18 = v7;
      v6 = (v6 + 1);
      v5 = (char *)v7;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 3) >= v6);
  }
  v14 = (*(uint64_t (**)(uint64_t, _QWORD *, void **))(*(_QWORD *)a1 + 64))(a1, a2, &__p);
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }
  return v14;
}

void sub_18D737DFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::build(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t *v14;

  v3 = *a2;
  v4 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a2) >> 3) != (uint64_t)(a3[1] - *a3) >> 2)
    __assert_rtn("build", "CedarMinimalPrefixTrie.h", 78, "keys.size() == values.size()");
  if (v4 == v3)
  {
    v11 = 1;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    LODWORD(v11) = 1;
    do
    {
      v12 = (uint64_t **)(v3 + v8);
      if (*((char *)v12 + 23) < 0)
      {
        v14 = *v12;
        v13 = v12[1];
      }
      else
      {
        v13 = (uint64_t *)*((unsigned __int8 *)v12 + 23);
        v14 = (uint64_t *)v12;
      }
      v11 = v11 & (*(unsigned int (**)(uint64_t, uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)a1 + 152))(a1, v14, v13, *a3 + v9);
      ++v10;
      v3 = *a2;
      v9 += 4;
      v8 += 24;
    }
    while (v10 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  cedar::da<unsigned int,-1,-2,true,1,0ul>::restore(a1 + 8);
  return v11;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::load(uint64_t a1, int *a2, unint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  int v8;

  v6 = a1 + 8;
  cedar::da<unsigned int,-1,-2,true,1,0ul>::clear(a1 + 8, 0);
  if (a3 >= 8)
    v7 = (a3 & 0xFFFFFFFFFFFFFFF8) - *a2;
  else
    v7 = 0;
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 16) = (char *)a2 + *a2;
  if ((v7 & 7) != 0)
    v8 = (v7 >> 3) + 1;
  else
    v8 = v7 >> 3;
  *(_DWORD *)(a1 + 72) = v8;
  *(_DWORD *)(a1 + 84) = 1;
  cedar::da<unsigned int,-1,-2,true,1,0ul>::restore(v6);
  return 1;
}

BOOL trie::CedarMinimalPrefixTrie<unsigned int,char>::lookup(uint64_t a1, uint64_t a2, unint64_t a3, int *a4)
{
  int v5;
  int v6;
  unint64_t v8;
  unint64_t v9;

  v8 = 0;
  v9 = 0;
  v5 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(a1 + 8, a2, &v9, &v8, a3);
  if (v5 == -2)
    v6 = -1;
  else
    v6 = v5;
  *a4 = v6;
  return v6 != -1;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::enumeratePrefixStrings(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;

  v13 = 0;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1);
  v12 = result;
  if (a3)
  {
    v9 = 0;
    do
    {
      v12 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(*(_QWORD *)a1 + 120))(a1, &v12, a2 + v9, 1);
      result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)a1 + 112))(a1, &v12);
      if (!(_DWORD)result)
        break;
      v11 = 0;
      result = (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(_QWORD *)a1 + 128))(a1, &v12, &v11);
      if ((result & 1) != 0)
      {
        if (a3 >= v9 + 1)
          v10 = v9 + 1;
        else
          v10 = a3;
        result = std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(*(_QWORD *)(a4 + 24), v11, a2, v10, (uint64_t)&v13);
        ++v9;
        if (v13)
          return result;
      }
      else
      {
        ++v9;
      }
    }
    while (v9 != a3);
  }
  return result;
}

void trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(uint64_t a1, const void *a2, size_t a3, uint64_t a4, uint64_t a5)
{
  void **v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *__dst[2];
  unint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1);
  v18 = (*(uint64_t (**)(uint64_t, _QWORD *, const void *, size_t))(*(_QWORD *)a1 + 120))(a1, v19, a2, a3);
  if ((*(unsigned int (**)(uint64_t, uint64_t *))(*(_QWORD *)a1 + 112))(a1, &v18))
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    if (a3 >= 0x17)
    {
      v11 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((a3 | 7) != 0x17)
        v11 = a3 | 7;
      v12 = v11 + 1;
      v10 = (void **)operator new(v11 + 1);
      __dst[1] = (void *)a3;
      v17 = v12 | 0x8000000000000000;
      __dst[0] = v10;
    }
    else
    {
      HIBYTE(v17) = a3;
      v10 = __dst;
      if (!a3)
      {
LABEL_10:
        *((_BYTE *)v10 + a3) = 0;
        v13 = operator new(0x28uLL);
        *v13 = &off_1E2632898;
        v13[1] = __dst;
        v13[2] = a2;
        v13[3] = a3;
        v13[4] = a4;
        v20 = v13;
        (*(void (**)(uint64_t, uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)a1 + 136))(a1, &v18, v19, a5);
        v14 = v20;
        if (v20 == v19)
        {
          v15 = 4;
          v14 = v19;
        }
        else
        {
          if (!v20)
            goto LABEL_15;
          v15 = 5;
        }
        (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_15:
        if (SHIBYTE(v17) < 0)
          operator delete(__dst[0]);
        return;
      }
    }
    memmove(v10, a2, a3);
    goto LABEL_10;
  }
}

void sub_18D7382B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, char *a20)
{
  char *v20;
  char *v22;
  uint64_t v23;

  v22 = a20;
  if (a20 == v20)
  {
    v23 = 4;
    v22 = &a17;
  }
  else
  {
    if (!a20)
      goto LABEL_6;
    v23 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
LABEL_6:
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::root()
{
  return 0;
}

BOOL trie::CedarMinimalPrefixTrie<unsigned int,char>::isValid(uint64_t a1, _QWORD *a2)
{
  return *a2 != -1;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::advance(uint64_t a1, unint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v6 = 0;
  v7 = v4;
  if (cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(a1 + 8, a3, &v7, &v6, a4) == -2)
    return -1;
  else
    return v7;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::getPayload(uint64_t a1, unint64_t *a2, _DWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;

  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 112))(a1);
  if ((_DWORD)result)
  {
    v7 = *a2;
    v9 = 0;
    v10 = v7;
    v8 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(a1 + 8, (uint64_t)&unk_18D74A7D2, &v10, &v9, 0);
    *a3 = v8;
    return v8 != -1;
  }
  return result;
}

void trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateEntries(_QWORD *a1, unint64_t *a2, uint64_t a3, unsigned int a4)
{
  _QWORD *v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  std::string::size_type size;
  char v16;
  std::string *p_p;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  size_t v21;
  size_t v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  std::string *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  std::string::size_type v32;
  char v33;
  std::string __p;
  std::string::size_type v35;
  unint64_t v36;

  if ((*(unsigned int (**)(_QWORD *))(*a1 + 112))(a1))
  {
    memset(&__p, 0, sizeof(__p));
    v35 = 0;
    v33 = 0;
    v8 = a1 + 1;
    v9 = *a2;
    v36 = *a2;
    v10 = cedar::da<unsigned int,-1,-2,true,1,0ul>::begin(a1 + 1, &v36, &v35);
    if (v10 != -2)
    {
      v11 = HIDWORD(v9);
      v31 = a3;
      v32 = a4;
      while (1)
      {
        v12 = v35;
        v13 = v36;
        v14 = HIDWORD(v36);
        if ((a4 & 0x80000000) != 0 || v35 <= v32)
        {
          size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            size = __p.__r_.__value_.__l.__size_;
          if (size < v35)
          {
            std::string::resize(&__p, v35, 0);
            v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          if (v16 >= 0)
            p_p = &__p;
          else
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          p_p->__r_.__value_.__s.__data_[v12] = 0;
          v18 = v13;
          v19 = v12;
          if (v14)
          {
            v18 = v13;
            v30 = a4;
            v20 = a1[3];
            v21 = strlen((const char *)(v20 - *(int *)(a1[2] + 8 * v13)));
            if (v21 >= v12)
              v22 = v12;
            else
              v22 = v21;
            if (v12 >= v21)
              v19 = v12 - v21;
            else
              v19 = 0;
            v23 = v20 - v22;
            a4 = v30;
            memcpy((char *)p_p + v19, (const void *)(v23 + (v13 >> 32)), v22);
          }
          for (; v19; --v19)
          {
            v24 = a1[2];
            v25 = *(int *)(v24 + 8 * v18 + 4);
            *((_BYTE *)&p_p[-1].__r_.__value_.__r.__words[2] + v19 + 7) = *(_BYTE *)(v24 + 8 * v25) ^ v18;
            v18 = v25;
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v26 = &__p;
          else
            v26 = (std::string *)__p.__r_.__value_.__r.__words[0];
          std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(*(_QWORD *)(v31 + 24), v10, (uint64_t)v26, v12, (uint64_t)&v33);
          v11 = HIDWORD(v9);
          v8 = a1 + 1;
        }
        if ((_DWORD)v14)
        {
          if (!v11)
          {
            v13 = v13;
            v27 = a1[2];
            v12 -= *(int *)(v27 + 8 * v13) + (uint64_t)(int)v14;
            break;
          }
          goto LABEL_3;
        }
        v27 = a1[2];
        v29 = *(int *)(v27 + 8 * v13);
        v28 = *(unsigned __int8 *)(a1[5] + 2 * v29);
        if (!*(_BYTE *)(a1[5] + 2 * v29))
          break;
LABEL_37:
        v36 = v29 ^ v28;
        v35 = v12 + 1;
        v10 = cedar::da<unsigned int,-1,-2,true,1,0ul>::begin(v8, &v36, &v35);
        if (v10 == -2)
          goto LABEL_3;
      }
      while (v13 != v9)
      {
        v28 = *(unsigned __int8 *)(a1[5] + 2 * v13);
        v13 = *(int *)(v27 + 8 * v13 + 4);
        --v12;
        if (v28)
        {
          v29 = *(int *)(v27 + 8 * v13);
          goto LABEL_37;
        }
      }
    }
LABEL_3:
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_18D738640(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateChildren(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  char v21;
  uint64_t v22;
  char v23;

  result = (*(uint64_t (**)(_QWORD *))(*a1 + 112))(a1);
  if (!(_DWORD)result)
    return result;
  v21 = 0;
  v7 = a1[5];
  if (!v7)
    __assert_rtn("enumerateChildren", "cedarpp.h", 261, "_ninfo");
  v8 = *a2;
  v9 = HIDWORD(*a2);
  if (v9)
  {
    v10 = -(int)v9;
    if ((v10 & 0x80000000) != 0)
    {
LABEL_5:
      v11 = -v10;
      v12 = *(_BYTE *)(a1[3] + v11);
      if (v12)
      {
        v22 = (v11 << 32) + 0x100000000;
        v23 = v12;
        v13 = *(_QWORD *)(a3 + 24);
        if (v13)
          return (*(uint64_t (**)(uint64_t, char *, uint64_t *, char *))(*(_QWORD *)v13 + 48))(v13, &v23, &v22, &v21);
LABEL_23:
        std::__throw_bad_function_call[abi:ne180100]();
      }
      return result;
    }
  }
  else
  {
    v10 = *(_DWORD *)(a1[2] + 8 * v8);
    if ((v10 & 0x80000000) != 0)
      goto LABEL_5;
  }
  v14 = v10;
  if (v8 && ((v15 = a1[2], *(int *)(v15 + 8 * v14) < 1) || *(_DWORD *)(v15 + 8 * v14 + 4) != (_DWORD)v8))
    v16 = (unsigned __int8 *)(v7 + 2 * v8 + 1);
  else
    v16 = (unsigned __int8 *)(v7 + 2 * v14);
  v17 = *v16;
  if (v17)
  {
    while (1)
    {
      v18 = v17 ^ v14;
      v22 = v18;
      v23 = v17;
      v19 = *(_QWORD *)(a3 + 24);
      if (!v19)
        break;
      result = (*(uint64_t (**)(uint64_t, char *, uint64_t *, char *))(*(_QWORD *)v19 + 48))(v19, &v23, &v22, &v21);
      v17 = *(unsigned __int8 *)(a1[5] + 2 * v18);
      if (v21)
        v20 = 1;
      else
        v20 = v17 == 0;
      if (v20)
        return result;
    }
    goto LABEL_23;
  }
  return result;
}

BOOL trie::CedarMinimalPrefixTrie<unsigned int,char>::addEntry(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *a4)
{
  uint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unint64_t v15;
  int v16;
  unsigned __int8 *v17;
  unint64_t v18;
  unint64_t v19;
  unsigned __int8 *v20;
  unint64_t v21;
  unsigned __int8 v22;
  BOOL v23;
  unint64_t v24;
  int v25;
  int *v26;
  int v27;
  int v28;
  char *v29;
  unsigned __int8 *v30;
  int v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int *v37;
  _DWORD **v38;
  int v39;
  int v40;
  int v41;
  int *v42;
  uint64_t v43;
  _BYTE *v44;
  unint64_t v45;
  char *v46;
  char v47;
  _DWORD *v49;
  unsigned __int8 *v50;
  uint64_t v51;
  unsigned __int8 v52;
  unsigned __int8 v53;
  unsigned __int8 v54;
  unsigned __int8 v55;
  unsigned __int8 v56;
  char v57;

  if (a3)
  {
    v8 = a1 + 8;
    v51 = 0;
    if (!*(_QWORD *)(a1 + 40) || !*(_QWORD *)(a1 + 48))
      cedar::da<unsigned int,-1,-2,true,1,0ul>::restore(a1 + 8);
    v9 = **(_DWORD **)(a1 + 16);
    if ((v9 & 0x80000000) == 0)
    {
      v10 = 0;
      while (a3 != v10)
      {
        v11 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, (unsigned __int8 *)(a2 + v10));
        v12 = v11;
        v51 = v11;
        ++v10;
        v9 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 8 * v11);
        if (v9 < 0)
          goto LABEL_11;
      }
      v57 = 0;
      v17 = (unsigned __int8 *)&v57;
      goto LABEL_34;
    }
    v12 = 0;
    v10 = 0;
LABEL_11:
    v13 = -v9;
    if (v13 >= 4)
    {
      v14 = (unsigned __int8 *)(*(_QWORD *)(a1 + 24) + v13);
      v50 = &v14[-v10];
      v15 = v10;
      if (v10 < a3)
      {
        v15 = v10;
        while (1)
        {
          v16 = *v14++;
          if (*(unsigned __int8 *)(a2 + v15) != v16)
            break;
          if (a3 == ++v15)
            goto LABEL_19;
        }
      }
      if (v15 == a3)
      {
LABEL_19:
        v15 = a3;
        if (!v50[a3])
        {
          v30 = v50;
          goto LABEL_53;
        }
      }
      v49 = a4;
      if (HIDWORD(v12))
      {
        v51 = v12;
        v18 = -(uint64_t)*(int *)(*(_QWORD *)(a1 + 16) + 8 * v12);
        if (v13 > v18)
        {
          do
          {
            v56 = *(_BYTE *)(*(_QWORD *)(a1 + 24) + v18);
            v51 = (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v56);
            ++v18;
          }
          while (v13 != v18);
        }
      }
      v19 = v15 - v10;
      if (v15 > v10)
      {
        v20 = (unsigned __int8 *)(a2 + v10);
        v21 = v19;
        do
        {
          v22 = *v20++;
          v55 = v22;
          v51 = (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v55);
          --v21;
        }
        while (v21);
      }
      if (v50[v15])
      {
        v54 = v50[v15];
        *(_DWORD *)(*(_QWORD *)(a1 + 16)
                  + 8
                  * (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v54)) = v9 + ~(_DWORD)v19;
        v19 -= 4;
      }
      v23 = __CFADD__(v19, v13);
      v24 = v19 + v13;
      a4 = v49;
      if (!v23)
      {
        do
        {
          v25 = *(_DWORD *)(a1 + 80);
          v26 = *(int **)(a1 + 32);
          v27 = *v26 + 1;
          *v26 = v27;
          if (v25 == v27)
          {
            v28 = 2 * *(_DWORD *)(a1 + 80);
            *(_DWORD *)(a1 + 80) = v28;
            cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<int>((void **)(a1 + 32), v28, **(_DWORD **)(a1 + 32));
          }
          *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * **(int **)(a1 + 32)) = v13;
          v13 += 5;
        }
        while (v13 <= v24);
      }
      if (v15 == a3)
      {
        v53 = 0;
        v17 = &v53;
LABEL_34:
        v29 = (char *)(*(_QWORD *)(a1 + 16)
                     + 8
                     * (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, v17));
LABEL_54:
        *(_DWORD *)v29 = *a4;
        return a3 != 0;
      }
      if (v50[v15])
      {
        v10 = v15 + 1;
      }
      else
      {
        v53 = 0;
        v31 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v53);
        v10 = v15 + 1;
        *(_DWORD *)(*(_QWORD *)(a1 + 16) + 8 * v31) += *(_DWORD *)&v50[v15 + 1];
      }
      v52 = *(_BYTE *)(a2 + v15);
      v12 = (int)cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(v8, &v51, &v52);
    }
    if (a3 == v10)
    {
      v32 = *(int **)(a1 + 32);
      v33 = *v32;
      if ((_DWORD)v33)
      {
        v34 = v32[v33];
        *(_BYTE *)(*(_QWORD *)(a1 + 24) + v34) = 0;
        *(_DWORD *)(*(_QWORD *)(a1 + 16) + 8 * v12) = -(int)v34;
        --**(_DWORD **)(a1 + 32);
        v35 = v34 + *(_QWORD *)(a1 + 24);
        *(_DWORD *)(v35 + 1) = 0;
        v29 = (char *)(v35 + 1);
        goto LABEL_54;
      }
    }
    v36 = a3 - v10 + 5;
    v38 = (_DWORD **)(a1 + 24);
    v37 = *(int **)(a1 + 24);
    v39 = *(_DWORD *)(a1 + 76);
    v40 = *v37;
    if (v39 < *v37 + v36)
    {
      if (v39 <= v36)
        v41 = a3 - v10 + 5;
      else
        v41 = *(_DWORD *)(a1 + 76);
      *(_DWORD *)(a1 + 76) = v41 + v39;
      cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<char>((void **)(a1 + 24), v41 + v39, *v37);
      v40 = **(_DWORD **)(a1 + 24);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 16) + 8 * v12) = -v40;
    v42 = *(int **)(a1 + 24);
    v43 = *v42;
    v44 = (char *)v42 + v43;
    v30 = (unsigned __int8 *)v42 + v43 - v10;
    v45 = a3 - v10;
    if (a3 > v10)
    {
      v46 = (char *)(a2 + v10);
      do
      {
        v47 = *v46++;
        *v44++ = v47;
        --v45;
      }
      while (v45);
      v42 = *v38;
      LODWORD(v43) = **v38;
    }
    *v42 = v43 + v36;
LABEL_53:
    v29 = (char *)&v30[a3 + 1];
    goto LABEL_54;
  }
  return a3 != 0;
}

uint64_t trie::CedarMinimalPrefixTrie<unsigned int,char>::removeEntry()
{
  return 0;
}

void trie::CedarMinimalPrefixTrie<unsigned int,char>::clear(uint64_t a1)
{
  cedar::da<unsigned int,-1,-2,true,1,0ul>::clear(a1 + 8, 1);
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::clear(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a1 + 8;
  if (*(_DWORD *)(a1 + 76))
  {
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  else if (*(_QWORD *)v4)
  {
    free(*(void **)v4);
  }
  v5 = *(void **)(a1 + 16);
  if (v5)
    free(v5);
  v6 = *(void **)(a1 + 24);
  if (v6)
    free(v6);
  v7 = *(void **)(a1 + 32);
  if (v7)
    free(v7);
  v8 = *(void **)(a1 + 40);
  if (v8)
    free(v8);
  *(_DWORD *)(v4 + 64) = 0;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  if (a2)
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_initialize(a1);
  *(_DWORD *)(a1 + 76) = 0;
}

void cedar::da<unsigned int,-1,-2,true,1,0ul>::restore(uint64_t a1)
{
  void **v2;
  uint64_t v3;
  uint64_t *v4;
  int v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _BYTE *v14;
  unsigned int v15;
  BOOL v16;
  int v17;
  BOOL v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 *v25;
  __int16 v26;
  uint64_t v27;
  int *v28;
  int v29;
  int *v30;
  int v31;
  _DWORD *v32;
  uint64_t v33;
  int *v34;

  v3 = *(_QWORD *)(a1 + 40);
  v2 = (void **)(a1 + 40);
  if (!v3)
  {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>(v2, *(int *)(a1 + 64) >> 8, 0);
    *(_DWORD *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    *(_DWORD *)(a1 + 48) = 0;
    v19 = (int *)(a1 + 48);
    if (*(int *)(a1 + 64) >= 1)
    {
      v20 = 0;
      v21 = 0;
      v22 = *(_QWORD *)(a1 + 40);
      v23 = 256;
      while (1)
      {
        v24 = v22 + 20 * v20;
        *(_WORD *)(v24 + 8) = 0;
        v25 = (__int16 *)(v24 + 8);
        if ((int)v21 >= ((_DWORD)v20 << 8) + 256)
          break;
        v26 = 0;
        v27 = (int)v21;
        v28 = (int *)(*(_QWORD *)(a1 + 8) + 8 * (int)v21 + 4);
        do
        {
          v29 = *v28;
          v28 += 2;
          if (v29 < 0)
          {
            v16 = v26++ == 0;
            *v25 = v26;
            if (v16)
            {
              *(_DWORD *)(v22 + 20 * v20 + 16) = v21;
              v26 = 1;
            }
          }
          ++v27;
          LODWORD(v21) = v21 + 1;
        }
        while (v23 != v27);
        if (v26)
          v30 = (int *)(a1 + 56);
        else
          v30 = (int *)(a1 + 48);
        if (v26 == 1)
          v30 = (int *)(a1 + 52);
        v31 = *v30;
        if (*v30)
          goto LABEL_42;
        v32 = (_DWORD *)(v22 + 20 * v20);
        if (!v26)
        {
          v31 = 0;
          goto LABEL_43;
        }
        v33 = v20;
LABEL_46:
        *(_DWORD *)(v22 + 20 * v33 + 4) = v20;
        *v32 = v20;
        *v30 = v20++;
        v23 += 256;
        v21 = v27;
        if ((int)v27 >= *(_DWORD *)(a1 + 64))
          goto LABEL_2;
      }
      v31 = *v19;
      if (*v19)
      {
        v30 = (int *)(a1 + 48);
        v27 = v21;
LABEL_42:
        v32 = (_DWORD *)(v22 + 20 * v20);
LABEL_43:
        v21 = v27;
      }
      else
      {
        v32 = (_DWORD *)(v22 + 20 * v20);
        v30 = (int *)(a1 + 48);
      }
      v34 = (int *)(v22 + 20 * v31);
      *v32 = *v34;
      *(_DWORD *)(v22 + 20 * v20 + 4) = *v30;
      v33 = *v34;
      v27 = v21;
      v32 = v34;
      goto LABEL_46;
    }
  }
LABEL_2:
  v4 = (uint64_t *)(a1 + 32);
  v5 = *(_DWORD *)(a1 + 64);
  if (!*(_QWORD *)(a1 + 32))
  {
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>((void **)(a1 + 32), v5, 0);
    v5 = *(_DWORD *)(a1 + 64);
    if (v5 >= 1)
    {
      for (i = 0; i < v5; ++i)
      {
        v7 = *(_QWORD *)(a1 + 8);
        v8 = *(unsigned int *)(v7 + 8 * i + 4);
        if ((v8 & 0x80000000) == 0)
        {
          v9 = *(int *)(v7 + 8 * v8);
          v10 = (v9 ^ i);
          if (v9 != i)
          {
            v11 = *v4;
            v12 = *v4 + 2 * v8;
            v15 = *(unsigned __int8 *)(v12 + 1);
            v14 = (_BYTE *)(v12 + 1);
            v13 = v15;
            if ((_DWORD)v8)
              v16 = v13 == 0;
            else
              v16 = 0;
            if (!v16 || (v13 = 0, *(_DWORD *)(v7 + 8 * v9 + 4) == (_DWORD)v8))
            {
              if (v13 < v10)
              {
                do
                {
                  v17 = v9 ^ v13;
                  v13 = *(unsigned __int8 *)(v11 + 2 * (int)(v9 ^ v13));
                  if (*(_BYTE *)(v11 + 2 * v17))
                    v18 = v13 >= v10;
                  else
                    v18 = 1;
                }
                while (!v18);
                v14 = (_BYTE *)(v11 + 2 * v17);
              }
            }
            *(_BYTE *)(v11 + 2 * (int)((v9 ^ i) ^ v9)) = v13;
            *v14 = v10;
            v5 = *(_DWORD *)(a1 + 64);
          }
        }
      }
    }
  }
  *(_DWORD *)(a1 + 60) = v5;
  *(_DWORD *)(a1 + 68) = **(_DWORD **)(a1 + 16);
  *(_DWORD *)(a1 + 72) = 1;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_follow<cedar::da<unsigned int,-1,-2,true,1,0ul>::empty_callback>(uint64_t a1, _QWORD *a2, unsigned __int8 *a3)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  _BYTE *v26;
  unsigned int v27;
  int v28;
  BOOL v29;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  signed int *v39;
  signed int v40;
  signed int v41;
  uint64_t v42;
  signed int place;
  unsigned __int8 *v44;
  int v45;
  int v46;
  uint64_t v47;
  _WORD *v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  unsigned __int8 *v56;
  int v57;
  unsigned __int8 v58;
  int v59;
  uint64_t v60;
  int *v61;
  uint64_t v62;
  int *v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  unsigned int v73;
  _BYTE *v74;
  unsigned int v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  __int16 *v81;
  int v82;
  int *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _WORD *v88;
  int v89;
  int v90;
  int *v91;
  uint64_t v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  uint64_t v98;
  _QWORD *v99;
  int v100;
  _BYTE v101[256];
  uint64_t v102;

  v4 = a2;
  v102 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *a2;
  v8 = *(_DWORD *)(v6 + 8 * *a2);
  v9 = *a3;
  if (v8 < 0 || (v10 = v8 ^ v9, v11 = *(int *)(v6 + 8 * v10 + 4), (v11 & 0x80000000) != 0))
  {
    result = cedar::da<unsigned int,-1,-2,true,1,0ul>::_pop_enode(a1, *(_DWORD *)(v6 + 8 * *a2), *a3, v7);
    v22 = *a3;
    v23 = *(_QWORD *)(a1 + 32);
    v24 = v23 + 2 * *v4;
    v27 = *(unsigned __int8 *)(v24 + 1);
    v26 = (_BYTE *)(v24 + 1);
    v25 = v27;
    if ((v8 & 0x80000000) == 0 && v25 < v22)
    {
      do
      {
        v28 = result ^ v25 ^ v22;
        v25 = *(unsigned __int8 *)(v23 + 2 * v28);
        if (*(_BYTE *)(v23 + 2 * v28))
          v29 = v25 >= v22;
        else
          v29 = 1;
      }
      while (!v29);
      v26 = (_BYTE *)(v23 + 2 * v28);
    }
    *(_BYTE *)(v23 + 2 * (int)result) = v25;
    *v26 = v22;
  }
  else
  {
    result = v8 ^ v9;
    if ((_DWORD)v11 != (_DWORD)v7)
    {
      v13 = *(_DWORD *)(v6 + 8 * v11);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(unsigned __int8 *)(v14 + 2 * v7 + 1);
      LOBYTE(v16) = v15;
      LOBYTE(v17) = *(_BYTE *)(v14 + 2 * v11 + 1);
      while (1)
      {
        v18 = 2 * (v13 ^ v17);
        v17 = *(unsigned __int8 *)(v14 + v18);
        if (!*(_BYTE *)(v14 + v18))
          break;
        v16 = *(unsigned __int8 *)(v14 + 2 * (v8 ^ v16));
        if (!v16)
        {
          v19 = a1;
          v20 = *(_DWORD *)(v6 + 8 * *a2);
          v21 = v9;
          goto LABEL_18;
        }
      }
      v19 = a1;
      v20 = *(_DWORD *)(v6 + 8 * v11);
      v15 = *(unsigned __int8 *)(v14 + 2 * v11 + 1);
      v21 = -1;
LABEL_18:
      v30 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_set_child(v19, v101, v20, v15, v21);
      v31 = v30;
      if (v101 == v30)
      {
        place = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find_place(a1);
      }
      else
      {
        v99 = v4;
        v32 = *(_DWORD *)(a1 + 56);
        if (v32)
        {
          v33 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 20 * v32);
          v34 = (__int16)((_WORD)v30 - (unsigned __int16)v101 + 1);
          v97 = v33;
          v95 = v34;
          do
          {
            v35 = *(_QWORD *)(a1 + 40);
            v36 = v32;
            v37 = *(__int16 *)(v35 + 20 * v32 + 8);
            if (v37 >= v34 && v34 < *(__int16 *)(v35 + 20 * v32 + 10))
            {
              v38 = v35 + 20 * v32;
              v41 = *(_DWORD *)(v38 + 16);
              v39 = (signed int *)(v38 + 16);
              v40 = v41;
              v42 = *(_QWORD *)(a1 + 8);
              place = v41;
              do
              {
                v44 = v101;
                v4 = v99;
                while (1)
                {
                  v45 = *++v44;
                  if ((*(_DWORD *)(v42 + 8 * (place ^ v101[0] ^ v45) + 4) & 0x80000000) == 0)
                    break;
                  if (v44 == v31)
                  {
                    *v39 = place;
                    goto LABEL_36;
                  }
                }
                v46 = *(_DWORD *)(v42 + 8 * place + 4);
                place = -v46;
              }
              while (v40 + v46);
            }
            *(_WORD *)(v35 + 20 * v36 + 10) = v34;
            v47 = a1 + 2 * v37;
            v49 = *(__int16 *)(v47 + 80);
            v48 = (_WORD *)(v47 + 80);
            if (v34 < v49)
              *v48 = v34;
            v50 = v35 + 20 * v36;
            v32 = *(_DWORD *)(v50 + 4);
            v51 = *(_DWORD *)(v50 + 12);
            *(_DWORD *)(v50 + 12) = v51 + 1;
            if (!v51)
            {
              cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(v35, v36, (_DWORD *)(a1 + 56), (int *)(a1 + 52));
              v34 = v95;
              v33 = v97;
            }
          }
          while (v36 != v33);
        }
        place = cedar::da<unsigned int,-1,-2,true,1,0ul>::_add_block(a1) << 8;
        v4 = v99;
LABEL_36:
        v10 = v8 ^ v9;
      }
      v94 = place ^ v101[0];
      LODWORD(v52) = *(_DWORD *)v4;
      if (v17)
        v53 = v8;
      else
        v53 = v13;
      if (!v17)
        LODWORD(v52) = v11;
      v100 = v52;
      if (v17 && v101[0] == v9)
      {
        v52 = (int)v52;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 2 * (int)v52 + 1) = v9;
      }
      else
      {
        v52 = (int)v52;
      }
      v54 = v94;
      *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8 * v52) = v94;
      if (v101 <= v31)
      {
        if (v9)
          v55 = -1;
        else
          v55 = 0;
        v93 = v55;
        v96 = v53;
        v98 = (uint64_t)v53 >> 8;
        v91 = (int *)(a1 + 52);
        v56 = v101;
        v92 = 2 * v10;
        while (1)
        {
          v57 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_pop_enode(a1, v54, *v56, v100);
          if (v56 == v31)
            v58 = 0;
          else
            v58 = v56[1];
          v59 = v53 ^ *v56;
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 2 * v57) = v58;
          if (v17 && v59 == (_DWORD)v10)
            goto LABEL_88;
          v60 = *(_QWORD *)(a1 + 8);
          v61 = (int *)(v60 + 8 * v57);
          v62 = v59;
          v63 = (int *)(v60 + 8 * v59);
          v64 = *v63;
          *v61 = *v63;
          if (v64 >= 1 && *v56)
          {
            v65 = *(_QWORD *)(a1 + 32);
            v66 = *(unsigned __int8 *)(v65 + 2 * v59 + 1);
            *(_BYTE *)(v65 + 2 * v57 + 1) = v66;
            v67 = *(_QWORD *)(a1 + 8);
            v68 = *v61;
            do
            {
              *(_DWORD *)(v67 + 8 * (v68 ^ v66) + 4) = v57;
              v68 = *v61;
              v66 = *(unsigned __int8 *)(v65 + 2 * (*v61 ^ v66));
            }
            while (v66);
          }
          v69 = *v4;
          if (!v17 && v59 == (_DWORD)v69)
          {
            *v4 = v57;
            v69 = v57;
          }
          v70 = v17 == 0;
          if (v59 != (_DWORD)v10)
            v70 = 0;
          if (!v70)
            break;
          v71 = *(_QWORD *)(a1 + 32);
          v72 = v71 + 2 * v69;
          v75 = *(unsigned __int8 *)(v72 + 1);
          v74 = (_BYTE *)(v72 + 1);
          LOBYTE(v73) = v75;
          if (v75 < v9)
          {
            do
            {
              v76 = v8 ^ v73;
              v73 = *(unsigned __int8 *)(v71 + 2 * v76);
              if (*(_BYTE *)(v71 + 2 * v76))
                v77 = v73 >= v9;
              else
                v77 = 1;
            }
            while (!v77);
            v74 = (_BYTE *)(v71 + 2 * v76);
          }
          *(_BYTE *)(v71 + v92) = v73;
          *v74 = v9;
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 2 * v62 + 1) = 0;
          *v63 = v93;
          *(_DWORD *)(v60 + 8 * v62 + 4) = *v4;
LABEL_87:
          v53 = v96;
LABEL_88:
          if (++v56 > v31)
            goto LABEL_89;
        }
        v10 = (unint64_t)v4;
        v78 = *(_QWORD *)(a1 + 40);
        v79 = v98;
        v80 = v78 + 20 * (int)v98;
        v82 = *(unsigned __int16 *)(v80 + 8);
        v81 = (__int16 *)(v80 + 8);
        *v81 = v82 + 1;
        v83 = (int *)(v81 + 4);
        if (!v82)
        {
          *v83 = v59;
          *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v59) = -v59 | ((unint64_t)-v59 << 32);
          if (v59 >= 0x100)
          {
            cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(*(_QWORD *)(a1 + 40), v98, (_DWORD *)(a1 + 48), v91);
            v79 = v98;
          }
          goto LABEL_84;
        }
        v84 = *v83;
        v85 = *(_QWORD *)(a1 + 8);
        v86 = *(unsigned int *)(v85 + 8 * v84 + 4);
        *(_QWORD *)(v85 + 8 * v59) = -(int)v84 | (unint64_t)(v86 << 32);
        *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8 * -(int)v86) = -v59;
        *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8 * v84 + 4) = -v59;
        if (*v81 == 2)
        {
          v79 = v98;
          if (v59 < 0x100)
            goto LABEL_83;
        }
        else
        {
          v79 = v98;
          if (v59 < 0x100 || *(_DWORD *)(v78 + 20 * (int)v98 + 12) != 1)
            goto LABEL_83;
        }
        cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(*(_QWORD *)(a1 + 40), v79, v91, (int *)(a1 + 56));
        v79 = v98;
LABEL_83:
        *(_DWORD *)(v78 + 20 * v79 + 12) = 0;
LABEL_84:
        v87 = v78 + 20 * v79;
        v89 = *(__int16 *)(v87 + 10);
        v88 = (_WORD *)(v87 + 10);
        v90 = *(__int16 *)(a1 + 2 * *v81 + 80);
        if (v89 < v90)
          *v88 = v90;
        *(_WORD *)(*(_QWORD *)(a1 + 32) + 2 * v62) = 0;
        v4 = (_QWORD *)v10;
        LODWORD(v10) = v8 ^ v9;
        v54 = v94;
        goto LABEL_87;
      }
LABEL_89:
      if (v17)
        return v54 ^ v9;
      else
        return v10;
    }
  }
  return result;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_pop_enode(uint64_t a1, int a2, int a3, int a4)
{
  int place;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _WORD *v15;
  __int16 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  _DWORD *v23;
  int *v24;
  int v25;

  if (a2 < 0)
    place = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find_place(a1);
  else
    place = a3 ^ a2;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = place;
  v11 = (int *)(v9 + 8 * place);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = (uint64_t)place >> 8;
  v14 = v12 + 20 * (place >> 8);
  v16 = *(_WORD *)(v14 + 8);
  v15 = (_WORD *)(v14 + 8);
  *v15 = v16 - 1;
  if (v16 == 1)
  {
    if (v10 < 0x100)
      goto LABEL_14;
    v23 = (_DWORD *)(a1 + 52);
    v24 = (int *)(a1 + 48);
    goto LABEL_13;
  }
  v17 = v9 + 8 * v10;
  v18 = *v11;
  *(_DWORD *)(v9 + 8 * -*v11 + 4) = *(_DWORD *)(v17 + 4);
  v19 = *(int *)(v17 + 4);
  *(_DWORD *)(v9 - 8 * v19) = v18;
  v20 = v12 + 20 * (int)v13;
  v22 = *(_DWORD *)(v20 + 16);
  v21 = (_DWORD *)(v20 + 16);
  if ((_DWORD)v10 == v22)
    *v21 = -(int)v19;
  if (v10 >= 0x100 && *v15 == 1 && *(_DWORD *)(v12 + 20 * (int)v13 + 12) != 1)
  {
    v23 = (_DWORD *)(a1 + 56);
    v24 = (int *)(a1 + 52);
    v12 = *(_QWORD *)(a1 + 40);
LABEL_13:
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(v12, v13, v23, v24);
  }
LABEL_14:
  if (a3)
    v25 = -1;
  else
    v25 = 0;
  *v11 = v25;
  *(_DWORD *)(v9 + 8 * v10 + 4) = a4;
  if (a2 < 0)
    *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8 * a4) = v10 ^ a3;
  return v10;
}

_BYTE *cedar::da<unsigned int,-1,-2,true,1,0ul>::_set_child(uint64_t a1, _BYTE *a2, int a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  if (a4)
  {
    --a2;
  }
  else
  {
    *a2 = 0;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 2 * a3;
    a4 = *(unsigned __int8 *)(v5 + v6);
    if (!*(_BYTE *)(v5 + v6))
      goto LABEL_9;
  }
  if (a4 < a5)
  {
    do
    {
      *++a2 = a4;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 2 * (a4 ^ a3);
      a4 = *(unsigned __int8 *)(v7 + v8);
      if (*(_BYTE *)(v7 + v8))
        v9 = a4 < a5;
      else
        v9 = 0;
    }
    while (v9);
  }
LABEL_9:
  if (a5 != -1)
    *++a2 = a5;
  if (a4)
  {
    do
    {
      *++a2 = a4;
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 2 * (a4 ^ a3);
      a4 = *(unsigned __int8 *)(v10 + v11);
    }
    while (*(_BYTE *)(v10 + v11));
  }
  return a2;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_find_place(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 52);
  if (v1)
    return *(unsigned int *)(*(_QWORD *)(a1 + 40) + 20 * v1 + 16);
  v1 = *(_DWORD *)(a1 + 56);
  if (v1)
    return *(unsigned int *)(*(_QWORD *)(a1 + 40) + 20 * v1 + 16);
  else
    return cedar::da<unsigned int,-1,-2,true,1,0ul>::_add_block(a1) << 8;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_transfer_block(uint64_t result, int a2, _DWORD *a3, int *a4)
{
  int v4;
  uint64_t v5;
  int *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int *v11;
  int *v12;

  v4 = a2;
  v5 = result + 20 * a2;
  v8 = *(_DWORD *)(v5 + 4);
  v6 = (int *)(v5 + 4);
  v7 = v8;
  if (v8 == a2)
  {
    v9 = 0;
  }
  else
  {
    v10 = *(_DWORD *)(result + 20 * a2);
    *(_DWORD *)(result + 20 * v10 + 4) = v7;
    v9 = *v6;
    *(_DWORD *)(result + 20 * *v6) = v10;
    if (*a3 != a2)
      goto LABEL_5;
  }
  *a3 = v9;
LABEL_5:
  if (*a4)
  {
    v11 = (int *)(result + 20 * a2);
LABEL_8:
    v12 = (int *)(result + 20 * *a4);
    *v11 = *v12;
    *v6 = *a4;
    v4 = *v12;
    v11 = v12;
    goto LABEL_9;
  }
  v11 = (int *)(result + 20 * a2);
  if (!*((_WORD *)v11 + 4))
    goto LABEL_8;
LABEL_9:
  *(_DWORD *)(result + 20 * v4 + 4) = a2;
  *v11 = a2;
  *a4 = a2;
  return result;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_add_block(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int *v15;
  int v16;

  v2 = *(_DWORD *)(a1 + 64);
  if (v2 == *(_DWORD *)(a1 + 60))
  {
    *(_DWORD *)(a1 + 60) = 2 * v2;
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::node>((void **)(a1 + 8), 2 * v2, 2 * v2);
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::ninfo>((void **)(a1 + 32), *(_DWORD *)(a1 + 60), *(_DWORD *)(a1 + 64));
    cedar::da<unsigned int,-1,-2,true,1,0ul>::_realloc_array<cedar::da<unsigned int,-1,-2,true,1,0ul>::block>((void **)(a1 + 40), *(int *)(a1 + 60) >> 8, *(int *)(a1 + 64) >> 8);
    v2 = *(_DWORD *)(a1 + 64);
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 20 * (v2 >> 8) + 16) = v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v2) = (-255 - v2) | ((unint64_t)~v2 << 32);
  v3 = *(int *)(a1 + 64);
  v4 = v3 + 1;
  v5 = 0xFFFFFFFE00000000 - (v3 << 32);
  v6 = -(int)v3;
  do
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v4) = v5 + v6;
    v7 = *(int *)(a1 + 64);
    v8 = v4++ - 1;
    v5 -= 0x100000000;
    --v6;
  }
  while (v8 < v7 + 253);
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * ((int)v7 + 255)) = (-254 - v7) | ((unint64_t)-(int)v7 << 32);
  v9 = *(_DWORD *)(a1 + 64);
  v10 = v9 >> 8;
  v11 = *(_DWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = (uint64_t)v9 >> 8;
  v14 = (int *)(v12 + 20 * v10);
  if (v11)
  {
    v15 = (int *)(v12 + 20 * v11);
    *v14 = *v15;
    *(_DWORD *)(v12 + 20 * (int)v13 + 4) = *(_DWORD *)(a1 + 56);
    LODWORD(v13) = *v15;
    v14 = v15;
  }
  *(_DWORD *)(v12 + 20 * (int)v13 + 4) = v10;
  *v14 = v10;
  *(_DWORD *)(a1 + 56) = v10;
  v16 = *(_DWORD *)(a1 + 64) + 256;
  *(_DWORD *)(a1 + 64) = v16;
  return ((v16 >> 8) - 1);
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::begin(_QWORD *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  size_t v15;

  v3 = a1[4];
  if (!v3)
    __assert_rtn("begin", "cedarpp.h", 690, "_ninfo");
  v7 = *a2;
  v8 = HIDWORD(*a2);
  if (v8)
  {
    v9 = -(int)v8;
    if (-(int)v8 < 0)
      goto LABEL_16;
  }
  else
  {
    v9 = *(_DWORD *)(a1[1] + 8 * v7);
    if (v9 < 0)
      goto LABEL_16;
  }
  v10 = *(unsigned __int8 *)(v3 + 2 * v7 + 1);
  if (v7)
  {
    if (!*(_BYTE *)(v3 + 2 * v7 + 1))
    {
      v11 = a1[1];
LABEL_14:
      v13 = (unsigned int *)(v11 + 8 * (v9 ^ v10));
      return *v13;
    }
    goto LABEL_10;
  }
  v10 = *(unsigned __int8 *)(v3 + 2 * (v9 ^ v10));
  if (v10)
  {
LABEL_10:
    v11 = a1[1];
    do
    {
      v12 = v9 ^ v10;
      *a2 = v12;
      v9 = *(_DWORD *)(v11 + 8 * v12);
      v10 = *(unsigned __int8 *)(v3 + 2 * v12 + 1);
      ++*a3;
    }
    while (v10 && (v9 & 0x80000000) == 0);
    if ((v9 & 0x80000000) == 0)
      goto LABEL_14;
    LODWORD(v7) = *(_DWORD *)a2;
LABEL_16:
    v14 = -v9;
    v15 = strlen((const char *)(a1[2] + v14));
    *a2 = v7 | ((unint64_t)(v15 - v9) << 32);
    *a3 += v15;
    v13 = (unsigned int *)(a1[2] + v14 + v15 + 1);
    return *v13;
  }
  return 4294967294;
}

uint64_t cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, unint64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v18;
  unsigned int *v19;

  v5 = *a3;
  v6 = HIDWORD(*a3);
  if (!v6)
  {
    v7 = *(_QWORD *)(a1 + 8);
    v8 = *(_DWORD *)(v7 + 8 * v5);
    if ((v8 & 0x80000000) == 0)
    {
      while (1)
      {
        v9 = *a4;
        if (*a4 == a5)
          break;
        v10 = v8 ^ *(unsigned __int8 *)(a2 + v9);
        if (*(_DWORD *)(v7 + 8 * v10 + 4) != (_DWORD)v5)
          return 4294967294;
        *a4 = v9 + 1;
        *a3 = v10;
        v8 = *(_DWORD *)(v7 + 8 * v10);
        LODWORD(v5) = v10;
        if ((v8 & 0x80000000) != 0)
          goto LABEL_6;
      }
      if (*(_DWORD *)(v7 + 8 * v8 + 4) == (_DWORD)v5)
      {
        v19 = (unsigned int *)(v7 + 8 * v8);
        return *v19;
      }
      return 0xFFFFFFFFLL;
    }
LABEL_6:
    v6 = -v8;
  }
  v11 = *a4;
  v12 = *(_QWORD *)(a1 + 16) + v6;
  if (*a4 >= a5)
  {
    v16 = *a4;
  }
  else
  {
    v13 = (unsigned __int8 *)(*(_QWORD *)(a1 + 16) + v6);
    v14 = *a4;
    while (1)
    {
      v15 = *v13++;
      if (*(unsigned __int8 *)(a2 + v14) != v15)
        break;
      *a4 = ++v14;
      if (a5 == v14)
      {
        v14 = a5;
        break;
      }
    }
    if (v14 == v11)
    {
      v16 = v11;
    }
    else
    {
      *((_DWORD *)a3 + 1) = v6 - v11 + v14;
      v16 = *a4;
    }
    if (v16 < a5)
      return 4294967294;
  }
  v18 = v12 - v11;
  if (*(_BYTE *)(v18 + v16))
    return 0xFFFFFFFFLL;
  v19 = (unsigned int *)(a5 + v18 + 1);
  return *v19;
}

void std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

__n128 std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x28uLL);
  *(_QWORD *)v2 = &off_1E2632898;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E2632898;
  result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t *a1, int *a2, uint64_t a3, uint64_t a4)
{
  size_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  const void *v14;
  uint64_t v15;

  v8 = *(_QWORD *)(a3 + 8);
  v9 = a1[3];
  v10 = v9 + v8;
  v11 = a1[1];
  v12 = *(char *)(v11 + 23);
  if (v12 < 0)
    v13 = *(_QWORD *)(v11 + 8);
  else
    v13 = *(unsigned __int8 *)(v11 + 23);
  v14 = *(const void **)a3;
  if (v13 < v10)
  {
    std::string::resize((std::string *)a1[1], v9 + v8, 0);
    v11 = a1[1];
    v9 = a1[3];
    LOBYTE(v12) = *(_BYTE *)(v11 + 23);
  }
  v15 = v11;
  if ((v12 & 0x80) == 0)
  {
    if (!v8)
      goto LABEL_9;
    goto LABEL_8;
  }
  v15 = *(_QWORD *)v11;
  if (v8)
  {
LABEL_8:
    memmove((void *)(v15 + v9), v14, v8);
    v11 = a1[1];
    LOBYTE(v12) = *(_BYTE *)(v11 + 23);
  }
LABEL_9:
  if ((v12 & 0x80) != 0)
    v11 = *(_QWORD *)v11;
  return std::function<void ()(unsigned int,std::string_view,BOOL &)>::operator()(*(_QWORD *)(a1[4] + 24), *a2, v11, v10, a4);
}

uint64_t std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie22CedarMinimalPrefixTrieIjcE20enumerateCompletionsENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEERKNS2_8functionIFvjS6_RbEEEiEUlRKjS6_S8_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1},std::allocator<trie::CedarMinimalPrefixTrie<unsigned int,char>::enumerateCompletions(std::string_view,std::function<void ()(unsigned int,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int const&,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

void std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E26328F0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E26328F0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4)
{
  return std::function<void ()(long long,std::string_view,BOOL &)>::operator()(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24), *a2, *a3, a3[1], a4);
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie4TrieIjcNS_15CedarTrieCursorEE20enumerateCompletionsEPKcmRKNSt3__18functionIFvxNS5_17basic_string_viewIcNS5_11char_traitsIcEEEERbEEEiEUljSA_SB_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumerateCompletions(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&,int)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

void std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2632948;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E2632948;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::operator()(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4)
{
  return std::function<void ()(long long,std::string_view,BOOL &)>::operator()(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24), *a2, *a3, a3[1], a4);
}

uint64_t std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK4trie4TrieIjcNS_15CedarTrieCursorEE22enumeratePrefixStringsEPKcmRKNSt3__18functionIFvxNS5_17basic_string_viewIcNS5_11char_traitsIcEEEERbEEEEUljSA_SB_E_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1},std::allocator<trie::Trie<unsigned int,char,trie::CedarTrieCursor>::enumeratePrefixStrings(char const*,unsigned long,std::function<void ()(long long,std::string_view,BOOL &)> const&)::{lambda(unsigned int,std::string_view,BOOL &)#1}>,void ()(unsigned int,std::string_view,BOOL &)>::target_type()
{
}

_QWORD *trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie(_QWORD *a1)
{
  *a1 = &off_1E2632728;
  cedar::da<unsigned int,-1,-2,true,1,0ul>::clear((uint64_t)(a1 + 1), 0);
  return a1;
}

void CEM::AdaptationController::sortEmojiTokensIfEnabled(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t *v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  __int128 *v19;
  std::vector<std::string>::pointer end;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  std::string *v26;
  std::string *v27;
  std::__split_buffer<std::string>::pointer v28;
  __int128 v29;
  std::vector<std::string>::pointer begin;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint8x8_t v38;
  unint64_t v39;
  unsigned __int8 **v40;
  unsigned __int8 *j;
  unint64_t v42;
  std::string *v43;
  void *v44;
  float v45;
  _BOOL8 v46;
  unint64_t v47;
  unint64_t v48;
  int8x8_t prime;
  std::string *v50;
  std::__split_buffer<std::string>::pointer v51;
  uint64_t v52;
  std::__split_buffer<std::string>::pointer v53;
  std::string::size_type size;
  uint8x8_t v55;
  unint64_t v56;
  uint8x8_t v57;
  uint64_t v58;
  std::string *v59;
  std::string::size_type v60;
  std::__split_buffer<std::string>::pointer first;
  std::string::size_type *v62;
  unint64_t v63;
  std::__split_buffer<std::string>::pointer v64;
  _OWORD *v65;
  unint64_t v66;
  std::__split_buffer<std::string>::pointer v67;
  unint64_t v68;
  uint8x8_t v69;
  unint64_t v70;
  unint64_t v71;
  unsigned __int8 **v72;
  unsigned __int8 *k;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  _QWORD *v82;
  _QWORD *v83;
  char *v84;
  __int128 v85;
  int64x2_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  _QWORD *v94;
  _QWORD *v95;
  char *v96;
  __int128 v97;
  int64x2_t v98;
  uint64_t v99;
  std::vector<std::string> v100;
  __int128 v101;
  _QWORD v102[2];
  void *__p[3];
  uint64_t v104;
  _QWORD *v105;
  void **v106;
  char v107;
  std::__split_buffer<std::string> __v;
  int v109;
  _QWORD v110[4];

  v110[1] = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)a1 == 2)
  {
    __p[0] = 0;
    __v.__first_ = 0;
    v6 = cedar::da<unsigned int,-1,-2,true,1,0ul>::_find(a1 + 72, a2, (unint64_t *)__p, (unint64_t *)&__v, a3);
    if (v6 <= 0xFFFFFFFD)
    {
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 56);
      if ((v9 & 1) == 0
      {
      }
      if (*(char *)(v8 + 167) < 0)
      {
        v10 = *(_QWORD *)(v8 + 144);
        v11 = *(_QWORD *)(v8 + 152);
      }
      else
      {
        v10 = v8 + 144;
        v11 = *(unsigned __int8 *)(v8 + 167);
      }
      if (byte_1EE072A1F >= 0)
        v12 = byte_1EE072A1F;
      else
        v12 = unk_1EE072A10;
      if (byte_1EE072A1F >= 0)
        v13 = &CEM::AdaptationDatabaseController::getRecentEmojisForStringId(unsigned int,unsigned long)const::sql;
      else
        v13 = (uint64_t *)CEM::AdaptationDatabaseController::getRecentEmojisForStringId(unsigned int,unsigned long)const::sql;
      LODWORD(__v.__first_) = v7;
      LODWORD(__v.__end_cap_.__value_) = 1;
      LODWORD(__v.__end_cap_.__value_) = 3;
      v109 = 1;
      v102[0] = 0;
      v101 = 0uLL;
      v106 = (void **)&v101;
      v107 = 0;
      *(_QWORD *)&v101 = operator new(0x40uLL);
      *((_QWORD *)&v101 + 1) = v101;
      v102[0] = v101 + 64;
      *((_QWORD *)&v101 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>((uint64_t)&__v, (uint64_t)v110, v101);
      CEM::Statement::Statement((uint64_t)__p, v10, v11, v13, v12, (uint64_t *)&v101);
      v106 = (void **)&v101;
      std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v106);
      for (i = 32; i != -32; i -= 32)
        std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v + i);
      CEM::AdaptationDatabase::executeStatement((CEM::AdaptationDatabase *)&v101, *(CEM::Statement **)(v8 + 128), (uint64_t)__p);
      v16 = *((_QWORD *)&v101 + 1);
      v15 = v101;
      memset(&v100, 0, sizeof(v100));
      if (*((_QWORD *)&v101 + 1) != (_QWORD)v101)
      {
        do
        {
          std::string::basic_string[abi:ne180100]<0>(&__v, "emoji");
          v17 = std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::find<std::string>(v15, &__v);
          if (SHIBYTE(__v.__end_) < 0)
            operator delete(__v.__first_);
          v18 = v15 + 8;
          if ((_QWORD *)(v15 + 8) != v17 && *((_DWORD *)v17 + 20) == 3)
          {
            v19 = (__int128 *)(v17 + 7);
            end = v100.__end_;
            if (v100.__end_ >= v100.__end_cap_.__value_)
            {
              v22 = 0xAAAAAAAAAAAAAAABLL * (((char *)v100.__end_ - (char *)v100.__begin_) >> 3);
              v23 = v22 + 1;
              if (v22 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * (((char *)v100.__end_cap_.__value_ - (char *)v100.__begin_) >> 3) > v23)
                v23 = 0x5555555555555556 * (((char *)v100.__end_cap_.__value_ - (char *)v100.__begin_) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v100.__end_cap_.__value_ - (char *)v100.__begin_) >> 3) >= 0x555555555555555)
                v24 = 0xAAAAAAAAAAAAAAALL;
              else
                v24 = v23;
              __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v100.__end_cap_;
              if (v24)
              {
                v26 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v24);
              }
              else
              {
                v26 = 0;
                v25 = 0;
              }
              v28 = v26 + v22;
              __v.__first_ = v26;
              __v.__begin_ = v28;
              __v.__end_ = v28;
              __v.__end_cap_.__value_ = &v26[v25];
              if (*((char *)v17 + 79) < 0)
              {
                std::string::__init_copy_ctor_external(v28, (const std::string::value_type *)v17[7], v17[8]);
                v28 = __v.__end_;
              }
              else
              {
                v29 = *v19;
                v28->__r_.__value_.__r.__words[2] = v17[9];
                *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
              }
              __v.__end_ = v28 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&v100, &__v);
              v27 = v100.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__v);
            }
            else
            {
              if (*((char *)v17 + 79) < 0)
              {
                std::string::__init_copy_ctor_external(v100.__end_, (const std::string::value_type *)v17[7], v17[8]);
              }
              else
              {
                v21 = *v19;
                v100.__end_->__r_.__value_.__r.__words[2] = v17[9];
                *(_OWORD *)&end->__r_.__value_.__l.__data_ = v21;
              }
              v27 = end + 1;
            }
            v100.__end_ = v27;
          }
          v15 = v18 + 16;
        }
        while (v18 + 16 != v16);
      }
      __v.__first_ = (std::__split_buffer<std::string>::pointer)&v101;
      std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
      CEM::Statement::~Statement(__p);
      begin = v100.__begin_;
      v31 = (unint64_t)v100.__end_;
      if (v100.__begin_ != v100.__end_)
      {
        memset(&__v, 0, 32);
        LODWORD(__v.__end_cap_.__value_) = 1065353216;
        v32 = *(_QWORD **)a4;
        v33 = *(_QWORD **)(a4 + 8);
        if (v33 != *(_QWORD **)a4)
        {
          v34 = 0;
          while (1)
          {
            CEM::getUTF8StringFromCFString(__p, *(CFStringRef *)(v32[2 * v34] + 8));
            v35 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)__p);
            v36 = v35;
            v37 = (unint64_t)__v.__begin_;
            if (__v.__begin_)
            {
              v38 = (uint8x8_t)vcnt_s8((int8x8_t)__v.__begin_);
              v38.i16[0] = vaddlv_u8(v38);
              v39 = v38.u32[0];
              if (v38.u32[0] > 1uLL)
              {
                v31 = v35;
                if ((std::__split_buffer<std::string>::pointer)v35 >= __v.__begin_)
                  v31 = v35 % (unint64_t)__v.__begin_;
              }
              else
              {
                v31 = ((unint64_t)&__v.__begin_[-1].__r_.__value_.__r.__words[2] + 7) & v35;
              }
              v40 = (unsigned __int8 **)*((_QWORD *)&__v.__first_->__r_.__value_.__l.__data_ + v31);
              if (v40)
              {
                for (j = *v40; j; j = *(unsigned __int8 **)j)
                {
                  v42 = *((_QWORD *)j + 1);
                  if (v42 == v36)
                  {
                    if (std::equal_to<std::string>::operator()[abi:ne180100](j + 16, (unsigned __int8 *)__p))
                      goto LABEL_115;
                  }
                  else
                  {
                    if (v39 > 1)
                    {
                      if (v42 >= v37)
                        v42 %= v37;
                    }
                    else
                    {
                      v42 &= v37 - 1;
                    }
                    if (v42 != v31)
                      break;
                  }
                }
              }
            }
            v43 = (std::string *)operator new(0x30uLL);
            v43->__r_.__value_.__r.__words[0] = 0;
            v43->__r_.__value_.__l.__size_ = v36;
            *(_OWORD *)&v43->__r_.__value_.__r.__words[2] = *(_OWORD *)__p;
            v44 = __p[2];
            memset(__p, 0, sizeof(__p));
            v43[1].__r_.__value_.__l.__size_ = (std::string::size_type)v44;
            v43[1].__r_.__value_.__r.__words[2] = v34;
            v45 = (float)((unint64_t)__v.__end_cap_.__value_->__r_.__value_.__r.__words + 1);
            if (!v37 || (float)(*(float *)&__v.__end_cap_.__value_ * (float)v37) < v45)
              break;
LABEL_105:
            first = __v.__first_;
            v62 = (std::string::size_type *)*((_QWORD *)&__v.__first_->__r_.__value_.__l.__data_ + v31);
            if (v62)
            {
              v43->__r_.__value_.__r.__words[0] = *v62;
            }
            else
            {
              v43->__r_.__value_.__r.__words[0] = (std::string::size_type)__v.__end_;
              __v.__end_ = v43;
              first->__r_.__value_.__r.__words[v31] = (std::string::size_type)&__v.__end_;
              if (!v43->__r_.__value_.__r.__words[0])
                goto LABEL_114;
              v63 = *(_QWORD *)(v43->__r_.__value_.__r.__words[0] + 8);
              if ((v37 & (v37 - 1)) != 0)
              {
                if (v63 >= v37)
                  v63 %= v37;
              }
              else
              {
                v63 &= v37 - 1;
              }
              v62 = &__v.__first_->__r_.__value_.__r.__words[v63];
            }
            *v62 = (std::string::size_type)v43;
LABEL_114:
            ++__v.__end_cap_.__value_;
LABEL_115:
            if (SHIBYTE(__p[2]) < 0)
              operator delete(__p[0]);
            ++v34;
            v32 = *(_QWORD **)a4;
            v33 = *(_QWORD **)(a4 + 8);
            if (v34 >= ((uint64_t)v33 - *(_QWORD *)a4) >> 4)
            {
              begin = v100.__begin_;
              v31 = (unint64_t)v100.__end_;
              goto LABEL_129;
            }
          }
          v46 = (v37 & (v37 - 1)) != 0;
          if (v37 < 3)
            v46 = 1;
          v47 = v46 | (2 * v37);
          v48 = vcvtps_u32_f32(v45 / *(float *)&__v.__end_cap_.__value_);
          if (v47 <= v48)
            prime = (int8x8_t)v48;
          else
            prime = (int8x8_t)v47;
          if (*(_QWORD *)&prime == 1)
          {
            prime = (int8x8_t)2;
          }
          else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
          {
            prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
            v37 = (unint64_t)__v.__begin_;
          }
          if (*(_QWORD *)&prime > v37)
            goto LABEL_71;
          if (*(_QWORD *)&prime < v37)
          {
            v56 = vcvtps_u32_f32((float)(unint64_t)__v.__end_cap_.__value_ / *(float *)&__v.__end_cap_.__value_);
            if (v37 < 3 || (v57 = (uint8x8_t)vcnt_s8((int8x8_t)v37), v57.i16[0] = vaddlv_u8(v57), v57.u32[0] > 1uLL))
            {
              v56 = std::__next_prime(v56);
            }
            else
            {
              v58 = 1 << -(char)__clz(v56 - 1);
              if (v56 >= 2)
                v56 = v58;
            }
            if (*(_QWORD *)&prime <= v56)
              prime = (int8x8_t)v56;
            if (*(_QWORD *)&prime >= v37)
            {
              v37 = (unint64_t)__v.__begin_;
            }
            else
            {
              if (prime)
              {
LABEL_71:
                if (*(_QWORD *)&prime >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v50 = (std::string *)operator new(8 * *(_QWORD *)&prime);
                v51 = __v.__first_;
                __v.__first_ = v50;
                if (v51)
                  operator delete(v51);
                v52 = 0;
                __v.__begin_ = (std::__split_buffer<std::string>::pointer)prime;
                do
                  __v.__first_->__r_.__value_.__r.__words[v52++] = 0;
                while (*(_QWORD *)&prime != v52);
                v53 = __v.__end_;
                if (__v.__end_)
                {
                  size = __v.__end_->__r_.__value_.__l.__size_;
                  v55 = (uint8x8_t)vcnt_s8(prime);
                  v55.i16[0] = vaddlv_u8(v55);
                  if (v55.u32[0] > 1uLL)
                  {
                    if (size >= *(_QWORD *)&prime)
                      size %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    size &= *(_QWORD *)&prime - 1;
                  }
                  __v.__first_->__r_.__value_.__r.__words[size] = (std::string::size_type)&__v.__end_;
                  v59 = (std::string *)v53->__r_.__value_.__r.__words[0];
                  if (v53->__r_.__value_.__r.__words[0])
                  {
                    do
                    {
                      v60 = v59->__r_.__value_.__l.__size_;
                      if (v55.u32[0] > 1uLL)
                      {
                        if (v60 >= *(_QWORD *)&prime)
                          v60 %= *(_QWORD *)&prime;
                      }
                      else
                      {
                        v60 &= *(_QWORD *)&prime - 1;
                      }
                      if (v60 != size)
                      {
                        if (!__v.__first_->__r_.__value_.__r.__words[v60])
                        {
                          __v.__first_->__r_.__value_.__r.__words[v60] = (std::string::size_type)v53;
                          goto LABEL_96;
                        }
                        v53->__r_.__value_.__r.__words[0] = v59->__r_.__value_.__r.__words[0];
                        v59->__r_.__value_.__r.__words[0] = **((_QWORD **)&__v.__first_->__r_.__value_.__l.__data_ + v60);
                        **((_QWORD **)&__v.__first_->__r_.__value_.__l.__data_ + v60) = v59;
                        v59 = v53;
                      }
                      v60 = size;
LABEL_96:
                      v53 = v59;
                      v59 = (std::string *)v59->__r_.__value_.__r.__words[0];
                      size = v60;
                    }
                    while (v59);
                  }
                }
                v37 = (unint64_t)prime;
                goto LABEL_100;
              }
              v64 = __v.__first_;
              __v.__first_ = 0;
              if (v64)
                operator delete(v64);
              v37 = 0;
              __v.__begin_ = 0;
            }
          }
LABEL_100:
          if ((v37 & (v37 - 1)) != 0)
          {
            if (v36 >= v37)
              v31 = v36 % v37;
            else
              v31 = v36;
          }
          else
          {
            v31 = (v37 - 1) & v36;
          }
          goto LABEL_105;
        }
        v32 = *(_QWORD **)(a4 + 8);
LABEL_129:
        v101 = 0uLL;
        v102[0] = 0;
        if (begin == (std::vector<std::string>::pointer)v31)
        {
          v65 = 0;
        }
        else
        {
          v65 = 0;
          do
          {
            v66 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)begin);
            v67 = __v.__begin_;
            if (__v.__begin_)
            {
              v68 = v66;
              v69 = (uint8x8_t)vcnt_s8((int8x8_t)__v.__begin_);
              v69.i16[0] = vaddlv_u8(v69);
              v70 = v69.u32[0];
              if (v69.u32[0] > 1uLL)
              {
                v71 = v66;
                if ((std::__split_buffer<std::string>::pointer)v66 >= __v.__begin_)
                  v71 = v66 % (unint64_t)__v.__begin_;
              }
              else
              {
                v71 = ((unint64_t)&__v.__begin_[-1].__r_.__value_.__r.__words[2] + 7) & v66;
              }
              v72 = (unsigned __int8 **)*((_QWORD *)&__v.__first_->__r_.__value_.__l.__data_ + v71);
              if (v72)
              {
                for (k = *v72; k; k = *(unsigned __int8 **)k)
                {
                  v74 = *((_QWORD *)k + 1);
                  if (v74 == v68)
                  {
                    if (std::equal_to<std::string>::operator()[abi:ne180100](k + 16, (unsigned __int8 *)begin))
                    {
                      v75 = *(_QWORD *)a4 + 16 * *((_QWORD *)k + 5);
                      if ((unint64_t)v65 >= v102[0])
                      {
                        v76 = (uint64_t)((uint64_t)v65 - v101) >> 4;
                        if ((unint64_t)(v76 + 1) >> 60)
                          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                        v77 = (uint64_t)(v102[0] - v101) >> 3;
                        if (v77 <= v76 + 1)
                          v77 = v76 + 1;
                        if (v102[0] - (_QWORD)v101 >= 0x7FFFFFFFFFFFFFF0uLL)
                          v78 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v78 = v77;
                        v105 = v102;
                        v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v78);
                        v81 = &v79[16 * v76];
                        *(_OWORD *)v81 = *(_OWORD *)v75;
                        *(_QWORD *)v75 = 0;
                        *(_QWORD *)(v75 + 8) = 0;
                        v82 = (_QWORD *)*((_QWORD *)&v101 + 1);
                        v83 = (_QWORD *)v101;
                        if (*((_QWORD *)&v101 + 1) == (_QWORD)v101)
                        {
                          v86 = vdupq_n_s64(*((unint64_t *)&v101 + 1));
                          v84 = &v79[16 * v76];
                        }
                        else
                        {
                          v84 = &v79[16 * v76];
                          do
                          {
                            v85 = *((_OWORD *)v82 - 1);
                            v82 -= 2;
                            *((_OWORD *)v84 - 1) = v85;
                            v84 -= 16;
                            *v82 = 0;
                            v82[1] = 0;
                          }
                          while (v82 != v83);
                          v86 = (int64x2_t)v101;
                        }
                        v65 = v81 + 16;
                        *(_QWORD *)&v101 = v84;
                        *((_QWORD *)&v101 + 1) = v81 + 16;
                        *(int64x2_t *)&__p[1] = v86;
                        v87 = v102[0];
                        v102[0] = &v79[16 * v80];
                        v104 = v87;
                        __p[0] = (void *)v86.i64[0];
                        std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)__p);
                      }
                      else
                      {
                        *v65++ = *(_OWORD *)v75;
                        *(_QWORD *)v75 = 0;
                        *(_QWORD *)(v75 + 8) = 0;
                      }
                      *((_QWORD *)&v101 + 1) = v65;
                      break;
                    }
                  }
                  else
                  {
                    if (v70 > 1)
                    {
                      if (v74 >= (unint64_t)v67)
                        v74 %= (unint64_t)v67;
                    }
                    else
                    {
                      v74 &= (unint64_t)&v67[-1].__r_.__value_.__r.__words[2] + 7;
                    }
                    if (v74 != v71)
                      break;
                  }
                }
              }
            }
            ++begin;
          }
          while (begin != (std::vector<std::string>::pointer)v31);
          v32 = *(_QWORD **)a4;
          v33 = *(_QWORD **)(a4 + 8);
        }
        for (; v32 != v33; v32 += 2)
        {
          if (*v32)
          {
            if ((unint64_t)v65 >= v102[0])
            {
              v88 = (uint64_t)((uint64_t)v65 - v101) >> 4;
              if ((unint64_t)(v88 + 1) >> 60)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              v89 = (uint64_t)(v102[0] - v101) >> 3;
              if (v89 <= v88 + 1)
                v89 = v88 + 1;
              if (v102[0] - (_QWORD)v101 >= 0x7FFFFFFFFFFFFFF0uLL)
                v90 = 0xFFFFFFFFFFFFFFFLL;
              else
                v90 = v89;
              v105 = v102;
              v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v90);
              v93 = &v91[16 * v88];
              *(_OWORD *)v93 = *(_OWORD *)v32;
              *v32 = 0;
              v32[1] = 0;
              v94 = (_QWORD *)*((_QWORD *)&v101 + 1);
              v95 = (_QWORD *)v101;
              if (*((_QWORD *)&v101 + 1) == (_QWORD)v101)
              {
                v98 = vdupq_n_s64(*((unint64_t *)&v101 + 1));
                v96 = &v91[16 * v88];
              }
              else
              {
                v96 = &v91[16 * v88];
                do
                {
                  v97 = *((_OWORD *)v94 - 1);
                  v94 -= 2;
                  *((_OWORD *)v96 - 1) = v97;
                  v96 -= 16;
                  *v94 = 0;
                  v94[1] = 0;
                }
                while (v94 != v95);
                v98 = (int64x2_t)v101;
              }
              v65 = v93 + 16;
              *(_QWORD *)&v101 = v96;
              *((_QWORD *)&v101 + 1) = v93 + 16;
              *(int64x2_t *)&__p[1] = v98;
              v99 = v102[0];
              v102[0] = &v91[16 * v92];
              v104 = v99;
              __p[0] = (void *)v98.i64[0];
              std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)__p);
            }
            else
            {
              *v65++ = *(_OWORD *)v32;
              *v32 = 0;
              v32[1] = 0;
            }
            *((_QWORD *)&v101 + 1) = v65;
          }
        }
        std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((void **)a4);
        *(_OWORD *)a4 = v101;
        *(_QWORD *)(a4 + 16) = v102[0];
        v102[0] = 0;
        v101 = 0uLL;
        __p[0] = &v101;
        std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
        std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::~__hash_table((uint64_t)&__v);
      }
      __p[0] = &v100;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    }
  }
}

void sub_18D73A950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  _Unwind_Resume(a1);
}

void std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate(void **a1)
{
  void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = v1;
    if ((void *)v3 != v1)
    {
      do
        v3 = std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](v3 - 16);
      while ((void *)v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::~__hash_table(uint64_t a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a1);
}

uint64_t std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned long>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t CEM::AdaptationController::initialize(CEM::AdaptationController *this)
{
  std::string *v2;
  std::__fs::filesystem::path::__string_view v3;
  std::string *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v5;
  std::basic_string_view<_CharT, _Traits>::size_type v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  unsigned __int8 v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint8x8_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned __int8 **v20;
  unsigned __int8 *v21;
  unint64_t v22;
  std::string *v23;
  std::string *v24;
  unint64_t *p_size;
  std::__shared_weak_count *v26;
  unint64_t v27;
  sqlite3 **v28;
  const char *v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint8x8_t v38;
  unint64_t v39;
  unsigned __int8 **v40;
  unsigned __int8 *i;
  unint64_t v42;
  char *v43;
  std::string *v44;
  float v45;
  _BOOL8 v46;
  unint64_t v47;
  unint64_t v48;
  int8x8_t prime;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD **v53;
  unint64_t v54;
  uint8x8_t v55;
  unint64_t v56;
  uint8x8_t v57;
  uint64_t v58;
  _QWORD *j;
  unint64_t v60;
  uint64_t v61;
  std::string::size_type *v62;
  std::string::size_type v63;
  unint64_t v64;
  size_t v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned __int8 v74;
  uint64_t v75;
  uint64_t v76;
  size_t v77;
  uint64_t *v78;
  uint64_t v79;
  std::__fs::filesystem::path *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v85;
  unint64_t *p_shared_weak_owners;
  unint64_t v87;
  std::__shared_weak_count *v88;
  std::__shared_weak_count *v89;
  std::__shared_weak_count *v90;
  void *v91;
  std::string::size_type v92;
  const char *v93;
  std::string::size_type v94;
  void *__src;
  std::__shared_weak_count *v96;
  unsigned int v97;
  size_t v98;
  std::string v99;
  _QWORD v100[3];
  _QWORD *v101;
  std::__fs::filesystem::path v102;
  std::__fs::filesystem::path *v103;
  std::string __dst;
  std::__shared_weak_count *v105[2];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v2 = (std::string *)((char *)this + 32);
  v3 = std::__fs::filesystem::path::__parent_path((const std::__fs::filesystem::path *)((char *)this + 32));
  if (v3.__size_ > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v3.__size_ >= 0x17)
  {
    v5 = (v3.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3.__size_ | 7) != 0x17)
      v5 = v3.__size_ | 7;
    v6 = v5 + 1;
    p_dst = (std::string *)operator new(v5 + 1);
    __dst.__r_.__value_.__l.__size_ = v3.__size_;
    __dst.__r_.__value_.__r.__words[2] = v6 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v3.__size_;
    p_dst = &__dst;
    if (!v3.__size_)
      goto LABEL_9;
  }
  memmove(p_dst, v3.__data_, v3.__size_);
LABEL_9:
  p_dst->__r_.__value_.__s.__data_[v3.__size_] = 0;
  v102.__pn_ = __dst;
  std::__fs::filesystem::__status(&v102, 0);
  v7 = __dst.__r_.__value_.__s.__data_[0] != 255 && __dst.__r_.__value_.__s.__data_[0]
    || std::__fs::filesystem::__create_directories(&v102, 0);
  if ((SHIBYTE(v102.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((v7 & 1) != 0)
      goto LABEL_15;
LABEL_24:
    *(_DWORD *)this = 0;
    return v7;
  }
  operator delete(v102.__pn_.__r_.__value_.__l.__data_);
  if ((v7 & 1) == 0)
    goto LABEL_24;
LABEL_15:
  v8 = operator new();
  v9 = v8;
  v10 = *((unsigned __int8 *)this + 31);
  if ((v10 & 0x80u) == 0)
    v11 = (char *)this + 8;
  else
    v11 = (char *)*((_QWORD *)this + 1);
  if ((v10 & 0x80u) != 0)
    v10 = *((_QWORD *)this + 2);
  v98 = v10;
  *(_QWORD *)v8 = 850045863;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_QWORD *)(v8 + 56) = 0;
  *(_QWORD *)(v8 + 64) = 850045863;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_QWORD *)(v8 + 120) = 0;
  std::mutex::lock((std::mutex *)v8);
  if ((v12 & 1) == 0
  {
    CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache = 0u;
    *(_OWORD *)&qword_1EE072A78 = 0u;
    dword_1EE072A88 = 1065353216;
  }
  v97 = v7;
  __src = v11;
  if (*((char *)this + 55) < 0)
    std::string::__init_copy_ctor_external(&v99, *((const std::string::value_type **)this + 4), *((_QWORD *)this + 5));
  else
    v99 = *v2;
  v13 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v99);
  v14 = *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
        + 1);
  if (!*((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
        + 1))
    goto LABEL_42;
  v15 = v13;
  v16 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                                       + 8));
  v16.i16[0] = vaddlv_u8(v16);
  v17 = v16.u32[0];
  if (v16.u32[0] > 1uLL)
  {
    v18 = v13;
    v19 = 0x1EE072000uLL;
    if (v13 >= *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                + 1))
      v18 = v13
          % *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
            + 1);
  }
  else
  {
    v18 = (*((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
           + 1)
         - 1) & v13;
    v19 = 0x1EE072000;
  }
  v20 = *(unsigned __int8 ***)(*(_QWORD *)(v19 + 2664) + 8 * v18);
  if (!v20)
    goto LABEL_42;
  v21 = *v20;
  if (!*v20)
    goto LABEL_42;
  while (1)
  {
    v22 = *((_QWORD *)v21 + 1);
    if (v22 == v15)
      break;
    if (v17 > 1)
    {
      if (v22 >= v14)
        v22 %= v14;
    }
    else
    {
      v22 &= v14 - 1;
    }
    if (v22 != v18)
      goto LABEL_42;
LABEL_41:
    v21 = *(unsigned __int8 **)v21;
    if (!v21)
      goto LABEL_42;
  }
  if (!std::equal_to<std::string>::operator()[abi:ne180100](v21 + 16, (unsigned __int8 *)&v99))
    goto LABEL_41;
  v89 = (std::__shared_weak_count *)*((_QWORD *)v21 + 6);
  if (v89)
  {
    v85 = *((_QWORD *)v21 + 5);
    p_shared_weak_owners = (unint64_t *)&v89->__shared_weak_owners_;
    do
      v87 = __ldxr(p_shared_weak_owners);
    while (__stxr(v87 + 1, p_shared_weak_owners));
    if (v89->__shared_owners_ != -1)
    {
      *(_QWORD *)(v9 + 128) = v85;
      v88 = std::__shared_weak_count::lock(v89);
      *(_QWORD *)(v9 + 136) = v88;
      if (!v88)
        std::__throw_bad_weak_ptr[abi:ne180100]();
      v65 = v98;
LABEL_145:
      std::__shared_weak_count::__release_weak(v89);
      goto LABEL_146;
    }
    std::__shared_weak_count::__release_weak(v89);
  }
LABEL_42:
  v23 = (std::string *)operator new(0x78uLL);
  v24 = v23;
  v23->__r_.__value_.__l.__size_ = 0;
  p_size = &v23->__r_.__value_.__l.__size_;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E26329D8;
  v26 = (std::__shared_weak_count *)&v23[1];
  v96 = (std::__shared_weak_count *)v23;
  if (*((char *)this + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v23 + 1, *((const std::string::value_type **)this + 4), *((_QWORD *)this + 5));
  }
  else
  {
    v26->std::__shared_count = *(std::__shared_count *)&v2->__r_.__value_.__l.__data_;
    v23[1].__r_.__value_.__r.__words[2] = v2->__r_.__value_.__r.__words[2];
  }
  v24[2].__r_.__value_.__l.__size_ = 850045863;
  v27 = (unint64_t)&v24[2].__r_.__value_.__l.__size_;
  v24[2].__r_.__value_.__r.__words[0] = 0;
  v28 = (sqlite3 **)&v24[2];
  *(_OWORD *)&v24[2].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v24[3].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&v24[4].__r_.__value_.__l.__data_ = 0u;
  v24[4].__r_.__value_.__r.__words[2] = 0;
  v29 = (const char *)v26;
  v30 = 0x1EE072000uLL;
  if (SHIBYTE(v24[1].__r_.__value_.__r.__words[2]) < 0)
    v29 = (const char *)v26->__vftable;
  if (sqlite3_open_v2(v29, (sqlite3 **)&v24[2], 65542, 0))
  {
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v31 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
    {
      v92 = (std::string::size_type)v26;
      if (SHIBYTE(v24[1].__r_.__value_.__r.__words[2]) < 0)
        v92 = (std::string::size_type)v26->__vftable;
      v93 = sqlite3_errmsg(*v28);
      LODWORD(__dst.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)__dst.__r_.__value_.__r.__words + 4) = v92;
      WORD2(__dst.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&__dst.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v93;
      _os_log_error_impl(&dword_18D71E000, v31, OS_LOG_TYPE_ERROR, "Could not open database: '%{public}s'; Error: '%{public}s'",
        (uint8_t *)&__dst,
        0x16u);
      v30 = 0x1EE072000;
    }
    *v28 = 0;
  }
  else
  {
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v32 = cem_logging_get_adaptation_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_DEBUG))
    {
      v94 = (std::string::size_type)v26;
      if (SHIBYTE(v24[1].__r_.__value_.__r.__words[2]) < 0)
        v94 = (std::string::size_type)v26->__vftable;
      LODWORD(__dst.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__dst.__r_.__value_.__r.__words + 4) = v94;
      _os_log_debug_impl(&dword_18D71E000, v32, OS_LOG_TYPE_DEBUG, "Opened database connection successfully: '%s'", (uint8_t *)&__dst, 0xCu);
    }
  }
  if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__dst, v99.__r_.__value_.__l.__data_, v99.__r_.__value_.__l.__size_);
  else
    __dst = v99;
  v105[0] = v26;
  v105[1] = (std::__shared_weak_count *)v24;
  v33 = &v24->__r_.__value_.__r.__words[2];
  do
    v34 = __ldxr(v33);
  while (__stxr(v34 + 1, v33));
  v35 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__dst);
  v36 = v35;
  v37 = *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
        + 1);
  if (*((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
       + 1))
  {
    v38 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                                         + 8));
    v38.i16[0] = vaddlv_u8(v38);
    v39 = v38.u32[0];
    if (v38.u32[0] > 1uLL)
    {
      v27 = v35;
      if (v35 >= *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                  + 1))
        v27 = v35
            % *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
              + 1);
    }
    else
    {
      v27 = (*((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
             + 1)
           - 1) & v35;
    }
    v40 = *(unsigned __int8 ***)(*(_QWORD *)(v30 + 2664) + 8 * v27);
    if (v40)
    {
      for (i = *v40; i; i = *(unsigned __int8 **)i)
      {
        v42 = *((_QWORD *)i + 1);
        if (v42 == v36)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)&__dst))
          {
            v89 = v96;
            v90 = v96;
            goto LABEL_137;
          }
        }
        else
        {
          if (v39 > 1)
          {
            if (v42 >= v37)
              v42 %= v37;
          }
          else
          {
            v42 &= v37 - 1;
          }
          if (v42 != v27)
            break;
        }
      }
      v30 = 0x1EE072000uLL;
    }
  }
  v43 = (char *)operator new(0x38uLL);
  v102.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
  v102.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)&qword_1EE072A78;
  v102.__pn_.__r_.__value_.__s.__data_[16] = 0;
  *(_QWORD *)v43 = 0;
  *((_QWORD *)v43 + 1) = v36;
  v44 = (std::string *)(v43 + 16);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    v89 = v96;
    std::string::__init_copy_ctor_external(v44, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v44->__r_.__value_.__l.__data_ = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
    *((_QWORD *)v43 + 4) = *((_QWORD *)&__dst.__r_.__value_.__l + 2);
    v89 = v96;
  }
  *(_OWORD *)(v43 + 40) = *(_OWORD *)v105;
  v105[0] = 0;
  v105[1] = 0;
  v102.__pn_.__r_.__value_.__s.__data_[16] = 1;
  v45 = (float)(unint64_t)(qword_1EE072A80 + 1);
  if (!v37 || (float)(*(float *)&dword_1EE072A88 * (float)v37) < v45)
  {
    v46 = 1;
    if (v37 >= 3)
      v46 = (v37 & (v37 - 1)) != 0;
    v47 = v46 | (2 * v37);
    v48 = vcvtps_u32_f32(v45 / *(float *)&dword_1EE072A88);
    if (v47 <= v48)
      prime = (int8x8_t)v48;
    else
      prime = (int8x8_t)v47;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v37 = *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
          + 1);
    if (*(_QWORD *)&prime <= *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                              + 1))
    {
      if (*(_QWORD *)&prime < *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                               + 1))
      {
        v56 = vcvtps_u32_f32((float)(unint64_t)qword_1EE072A80 / *(float *)&dword_1EE072A88);
        if (*((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
             + 1) < 3uLL
          || (v57 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                                                   + 8)),
              v57.i16[0] = vaddlv_u8(v57),
              v57.u32[0] > 1uLL))
        {
          v56 = std::__next_prime(v56);
        }
        else
        {
          v58 = 1 << -(char)__clz(v56 - 1);
          if (v56 >= 2)
            v56 = v58;
        }
        if (*(_QWORD *)&prime <= v56)
          prime = (int8x8_t)v56;
        if (*(_QWORD *)&prime >= v37)
        {
          v37 = *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                + 1);
        }
        else
        {
          if (prime)
            goto LABEL_93;
          v91 = *(void **)(v30 + 2664);
          *(_QWORD *)(v30 + 2664) = 0;
          if (v91)
            operator delete(v91);
          v37 = 0;
          *((_QWORD *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
          + 1) = 0;
        }
      }
    }
    else
    {
LABEL_93:
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v50 = operator new(8 * *(_QWORD *)&prime);
      v51 = *(void **)(v30 + 2664);
      *(_QWORD *)(v30 + 2664) = v50;
      if (v51)
        operator delete(v51);
      v52 = 0;
      *((int8x8_t *)&CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
      + 1) = prime;
      do
        *(_QWORD *)(*(_QWORD *)(v30 + 2664) + 8 * v52++) = 0;
      while (*(_QWORD *)&prime != v52);
      v53 = (_QWORD **)qword_1EE072A78;
      if (qword_1EE072A78)
      {
        v54 = *(_QWORD *)(qword_1EE072A78 + 8);
        v55 = (uint8x8_t)vcnt_s8(prime);
        v55.i16[0] = vaddlv_u8(v55);
        if (v55.u32[0] > 1uLL)
        {
          if (v54 >= *(_QWORD *)&prime)
            v54 %= *(_QWORD *)&prime;
        }
        else
        {
          v54 &= *(_QWORD *)&prime - 1;
        }
        *(_QWORD *)(CEM::AdaptationDatabaseController::getSharedAdaptationDatabaseCache(void)::__adaptationDatabaseCache
                  + 8 * v54) = &qword_1EE072A78;
        for (j = *v53; j; v54 = v60)
        {
          v60 = j[1];
          if (v55.u32[0] > 1uLL)
          {
            if (v60 >= *(_QWORD *)&prime)
              v60 %= *(_QWORD *)&prime;
          }
          else
          {
            v60 &= *(_QWORD *)&prime - 1;
          }
          if (v60 != v54)
          {
            v61 = *(_QWORD *)(v30 + 2664);
            if (!*(_QWORD *)(v61 + 8 * v60))
            {
              *(_QWORD *)(v61 + 8 * v60) = v53;
              goto LABEL_118;
            }
            *v53 = (_QWORD *)*j;
            *j = **(_QWORD **)(*(_QWORD *)(v30 + 2664) + 8 * v60);
            **(_QWORD **)(*(_QWORD *)(v30 + 2664) + 8 * v60) = j;
            j = v53;
          }
          v60 = v54;
LABEL_118:
          v53 = (_QWORD **)j;
          j = (_QWORD *)*j;
        }
      }
      v37 = (unint64_t)prime;
    }
    if ((v37 & (v37 - 1)) != 0)
    {
      if (v36 >= v37)
        v27 = v36 % v37;
      else
        v27 = v36;
    }
    else
    {
      v27 = (v37 - 1) & v36;
    }
  }
  v62 = *(std::string::size_type **)(*(_QWORD *)(v30 + 2664) + 8 * v27);
  v63 = v102.__pn_.__r_.__value_.__r.__words[0];
  if (v62)
  {
    *(_QWORD *)v102.__pn_.__r_.__value_.__l.__data_ = *v62;
    goto LABEL_135;
  }
  *(_QWORD *)v102.__pn_.__r_.__value_.__l.__data_ = qword_1EE072A78;
  qword_1EE072A78 = v63;
  *(_QWORD *)(*(_QWORD *)(v30 + 2664) + 8 * v27) = &qword_1EE072A78;
  if (*(_QWORD *)v63)
  {
    v64 = *(_QWORD *)(*(_QWORD *)v63 + 8);
    if ((v37 & (v37 - 1)) != 0)
    {
      if (v64 >= v37)
        v64 %= v37;
    }
    else
    {
      v64 &= v37 - 1;
    }
    v62 = (std::string::size_type *)(*(_QWORD *)(v30 + 2664) + 8 * v64);
LABEL_135:
    *v62 = v63;
  }
  v102.__pn_.__r_.__value_.__r.__words[0] = 0;
  ++qword_1EE072A80;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<CEM::ReadOnlyFile<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t *)&v102);
  v90 = v105[1];
  if (v105[1])
LABEL_137:
    std::__shared_weak_count::__release_weak(v90);
  v65 = v98;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  *(_QWORD *)(v9 + 128) = v26;
  *(_QWORD *)(v9 + 136) = v89;
  do
    v66 = __ldxr(p_size);
  while (__stxr(v66 + 1, p_size));
  do
    v67 = __ldaxr(p_size);
  while (__stlxr(v67 - 1, p_size));
  if (!v67)
  {
    ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
    goto LABEL_145;
  }
LABEL_146:
  if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v99.__r_.__value_.__l.__data_);
  std::mutex::unlock((std::mutex *)v9);
  if (v65 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v65 >= 0x17)
  {
    v69 = (v65 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v65 | 7) != 0x17)
      v69 = v65 | 7;
    v70 = v69 + 1;
    v68 = operator new(v69 + 1);
    *(_QWORD *)(v9 + 152) = v65;
    *(_QWORD *)(v9 + 160) = v70 | 0x8000000000000000;
    *(_QWORD *)(v9 + 144) = v68;
    goto LABEL_155;
  }
  *(_BYTE *)(v9 + 167) = v65;
  v68 = (void *)(v9 + 144);
  if (v65)
LABEL_155:
    memmove(v68, __src, v65);
  *((_BYTE *)v68 + v65) = 0;
  if (*(char *)(v9 + 167) < 0)
  {
    v72 = *(_QWORD *)(v9 + 144);
    v71 = *(_QWORD *)(v9 + 152);
  }
  else
  {
    v71 = *(unsigned __int8 *)(v9 + 167);
    v72 = v9 + 144;
  }
  memset(&v102, 0, sizeof(v102));
  CEM::Statement::Statement((uint64_t)&__dst, v72, v71, "BEGIN TRANSACTION;\n"
    "L, emoji_id INTEGER NOT NULL, timestamp TEXT NOT NULL, FOREIGN KEY(string_id) REFERENCES string(id), FOREIGN KEY(emo"
    "ji_id) REFERENCES emoji(id));\n"
    "END TRANSACTION;",
    0x210uLL,
    (uint64_t *)&v102);
  v99.__r_.__value_.__r.__words[0] = (std::string::size_type)&v102;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v99);
  CEM::AdaptationDatabase::executeStatement((CEM::AdaptationDatabase *)&v102, *(CEM::Statement **)(v9 + 128), (uint64_t)&__dst);
  v99.__r_.__value_.__r.__words[0] = (std::string::size_type)&v102;
  std::vector<std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v99);
  CEM::Statement::~Statement((void **)&__dst.__r_.__value_.__l.__data_);
  std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((uint64_t *)this + 7, v9);
  v73 = *((_QWORD *)this + 7);
  v100[0] = &off_1E2632840;
  v100[1] = this;
  v101 = v100;
  if ((v74 & 1) == 0
  {
  }
  if (*(char *)(v73 + 167) < 0)
  {
    v75 = *(_QWORD *)(v73 + 144);
    v76 = *(_QWORD *)(v73 + 152);
  }
  else
  {
    v75 = v73 + 144;
    v76 = *(unsigned __int8 *)(v73 + 167);
  }
  if (byte_1EE072A3F >= 0)
    v77 = byte_1EE072A3F;
  else
    v77 = unk_1EE072A30;
  if (byte_1EE072A3F >= 0)
    v78 = &CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)const::sql;
  else
    v78 = (uint64_t *)CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)const::sql;
  memset(&v102, 0, sizeof(v102));
  CEM::Statement::Statement((uint64_t)&__dst, v75, v76, v78, v77, (uint64_t *)&v102);
  v99.__r_.__value_.__r.__words[0] = (std::string::size_type)&v102;
  std::vector<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v99);
  v79 = *(_QWORD *)(v73 + 128);
  v102.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E2632320;
  v102.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)v100;
  v103 = &v102;
  CEM::AdaptationDatabase::executeStatement(v79, (uint64_t)&__dst, (uint64_t)&v102);
  v80 = v103;
  v7 = v97;
  if (v103 == &v102)
  {
    v81 = 4;
    v80 = &v102;
LABEL_173:
    (*(void (**)(std::__fs::filesystem::path *))(v80->__pn_.__r_.__value_.__r.__words[0] + 8 * v81))(v80);
  }
  else if (v103)
  {
    v81 = 5;
    goto LABEL_173;
  }
  CEM::Statement::~Statement((void **)&__dst.__r_.__value_.__l.__data_);
  v82 = v101;
  if (v101 == v100)
  {
    v83 = 4;
    v82 = v100;
LABEL_178:
    (*(void (**)(_QWORD *))(*v82 + 8 * v83))(v82);
  }
  else if (v101)
  {
    v83 = 5;
    goto LABEL_178;
  }
  return v7;
}

void sub_18D73B8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char *a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint8_t buf,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,std::__shared_weak_count *a40)
{
  char *v41;
  uint64_t v42;

  v41 = a25;
  if (a25 == &a22)
  {
    v42 = 4;
    v41 = &a22;
  }
  else
  {
    if (!a25)
      goto LABEL_6;
    v42 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v41 + 8 * v42))();
LABEL_6:
  _Unwind_Resume(a1);
}

void std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2632840;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E2632840;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::operator()(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  unint64_t v4;
  int v6;

  v3 = *a2;
  v4 = a2[1];
  v6 = *a3;
  return trie::CedarMinimalPrefixTrie<unsigned int,char>::addEntry(*(_QWORD *)(a1 + 8) + 64, v3, v4, &v6);
}

uint64_t std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN3CEM20AdaptationController10initializeEvE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CEM::AdaptationController::initialize(void)::$_0,std::allocator<CEM::AdaptationController::initialize(void)::$_0>,void ()(std::string_view,unsigned int)>::target_type()
{
}

__n128 __Block_byref_object_copy__84(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__85(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

__n128 __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__10(uint64_t a1)
{
  return std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](a1 + 40);
}

uint64_t CEM::ReadOnlyFile<unsigned short>::~ReadOnlyFile(uint64_t a1)
{
  void *v2;
  const char *v3;
  int v4;
  int v5;

  v2 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    if (*(_BYTE *)(a1 + 68))
    {
      munmap(*(void **)a1, *(_QWORD *)(a1 + 8));
    }
    else
    {
      if (*(_DWORD *)(a1 + 64) != 2)
        goto LABEL_10;
      v3 = (const char *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0)
        v3 = *(const char **)v3;
      v4 = open(v3, 2);
      v5 = v4;
      v2 = *(void **)a1;
      if ((v4 & 0x80000000) == 0)
      {
        write(v4, *(const void **)a1, *(_QWORD *)(a1 + 8));
        close(v5);
        v2 = *(void **)a1;
      }
      if (v2)
LABEL_10:
        MEMORY[0x18D7921C8](v2, 0x1000C80BDFB0063);
    }
  }
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  return a1;
}

void std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned short> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned short>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned short>,CEM::ReadOnlyFile<unsigned short>>,std::allocator<CEM::ReadOnlyFile<unsigned short>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned short> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned short>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned short>,CEM::ReadOnlyFile<unsigned short>>,std::allocator<CEM::ReadOnlyFile<unsigned short>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    CEM::ReadOnlyFile<unsigned short>::~ReadOnlyFile(result);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<CEM::ReadOnlyFile<unsigned short> *,std::shared_ptr<CEM::ReadOnlyFile<unsigned short>>::__shared_ptr_default_delete<CEM::ReadOnlyFile<unsigned short>,CEM::ReadOnlyFile<unsigned short>>,std::allocator<CEM::ReadOnlyFile<unsigned short>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000018D74650ELL))
    return a1 + 24;
  else
    return 0;
}

CFStringRef CEM::EmojiData::createString(CEM::EmojiData *this, unsigned int a2)
{
  _QWORD *v2;
  uint64_t v4;
  CFStringRef result;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)*((_QWORD *)this + 2);
  if (v2)
  {
    v4 = *((unsigned __int16 *)this + 22);
    if (a2 > v4 && *((unsigned __int16 *)this + 21) >= (unsigned __int16)(a2 - v4))
    {
      result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const char *)(*v2 + *(unsigned int *)(*v2 + 16 * (~v4 + a2) + 18)), 0x8000100u);
      if (result)
        return result;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = a2;
        _os_log_error_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to create CFString for emoji at index %d", (uint8_t *)v6, 8u);
      }
    }
  }
  return 0;
}

void ___ZL34_isLegacyUnqualifiedEmojiCodepointj_block_invoke()
{
  __CFCharacterSet *Mutable;
  uint64_t i;
  CFRange v2;

  Mutable = CFCharacterSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  for (i = 0; i != 816; i += 4)
  {
    v2.location = *(unsigned int *)&_isLegacyUnqualifiedEmojiCodepoint::unqualifiedCodepoints[i];
    v2.length = 1;
    CFCharacterSetAddCharactersInRange(Mutable, v2);
  }
  _isLegacyUnqualifiedEmojiCodepoint::__unqualifiedCodepointsCharacterSet = (uint64_t)Mutable;
}

uint64_t _CFInit_EmojiLocaleDataWrapper(uint64_t result)
{
  *(_QWORD *)(result + 16) = &off_1E2632B70;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

uint64_t nlp::CFFinalize(nlp *this, const void *a2)
{
  return (**((uint64_t (***)(char *))this + 2))((char *)this + 16);
}

void EmojiLocaleDataWrapper::~EmojiLocaleDataWrapper(EmojiLocaleDataWrapper *this)
{
  *(_QWORD *)this = &off_1E2632B70;
  std::unique_ptr<CEM::EmojiLocaleData>::reset[abi:ne180100]((uint64_t *)this + 1, 0);
}

{
  *(_QWORD *)this = &off_1E2632B70;
  std::unique_ptr<CEM::EmojiLocaleData>::reset[abi:ne180100]((uint64_t *)this + 1, 0);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t nlp::CFType::Equal()
{
  return 0;
}

uint64_t nlp::CFType::Hash(nlp::CFType *this)
{
  return 0;
}

uint64_t nlp::CFType::CopyFormattingDesc(nlp::CFType *this, const __CFDictionary *a2)
{
  return 0;
}

uint64_t nlp::CFType::CopyDebugDesc(nlp::CFType *this)
{
  return 0;
}

uint64_t *std::unique_ptr<CEM::EmojiLocaleData>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 792));
    CEM::AdaptationController::~AdaptationController((CEM::AdaptationController *)(v2 + 112));
    std::unique_ptr<CEM::TextToSpeechStrings>::reset[abi:ne180100]((uint64_t *)(v2 + 88), 0);
    std::unique_ptr<CEM::VoiceoverStrings>::reset[abi:ne180100]((uint64_t **)(v2 + 80), 0);
    std::unique_ptr<CEM::LocalizedStringTable>::reset[abi:ne180100]((uint64_t *)(v2 + 72), 0);
    if (*(char *)(v2 + 71) < 0)
      operator delete(*(void **)(v2 + 48));
    nlp::CFScopedPtr<__CFStringTokenizer *>::reset((const void **)(v2 + 40), 0);
    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)(v2 + 32), 0);
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)(v2 + 24), 0);
    std::unique_ptr<CEM::EmojiSearchTrie>::reset[abi:ne180100]((uint64_t *)(v2 + 16), 0);
    std::unique_ptr<CEM::EmojiSearchTrie>::reset[abi:ne180100]((uint64_t *)(v2 + 8), 0);
    std::unique_ptr<CEM::EmojiSearchTrie>::reset[abi:ne180100]((uint64_t *)v2, 0);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

void CEM::AdaptationController::~AdaptationController(CEM::AdaptationController *this)
{
  trie::CedarMinimalPrefixTrie<unsigned int,char>::~CedarMinimalPrefixTrie((_QWORD *)this + 8);
  std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((uint64_t *)this + 7, 0);
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

uint64_t *std::unique_ptr<CEM::TextToSpeechStrings>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {

    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)v2, 0);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

uint64_t **std::unique_ptr<CEM::VoiceoverStrings>::reset[abi:ne180100](uint64_t **result, uint64_t *a2)
{
  uint64_t *v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    std::unique_ptr<CEM::LocalizedStringTable>::reset[abi:ne180100](v2, 0);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

uint64_t *std::unique_ptr<CEM::LocalizedStringTable>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 40));
    nlp::CFScopedPtr<__CFDictionary const*>::reset((const void **)(v2 + 32), 0);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v2 + 24), 0);
    nlp::CFScopedPtr<__CFBundle *>::reset((const void **)(v2 + 16));
    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)(v2 + 8), 0);
    nlp::CFScopedPtr<__CFString const*>::reset((const void **)v2, 0);
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

void nlp::CFScopedPtr<__CFStringTokenizer *>::reset(const void **a1, const void *a2)
{
  const void *v4;

  v4 = *a1;
  if (v4)
    CFRelease(v4);
  *a1 = a2;
}

uint64_t *std::unique_ptr<CEM::EmojiSearchTrie>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    if (*(char *)(v2 + 119) < 0)
      operator delete(*(void **)(v2 + 96));
    std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100](v2 + 80);
    trie::MarisaTrie<unsigned int,char>::~MarisaTrie((_QWORD *)(v2 + 16));
    JUMPOUT(0x18D7921ECLL);
  }
  return result;
}

const char **std::__find_impl[abi:ne180100]<char const* const*,char const* const*,std::string,std::__identity>(const char **a1, const char **a2, const void **a3)
{
  const char **v3;
  char v5;
  size_t v6;
  const void *v7;

  v3 = a1;
  if (a1 != a2)
  {
    v5 = *((_BYTE *)a3 + 23);
    if (v5 >= 0)
      v6 = *((unsigned __int8 *)a3 + 23);
    else
      v6 = (size_t)a3[1];
    if (v5 >= 0)
      v7 = a3;
    else
      v7 = *a3;
    while (v6 != strlen(*v3) || memcmp(v7, *v3, v6))
    {
      if (++v3 == a2)
        return a2;
    }
  }
  return v3;
}

void *createEmojiSearchTrie(_QWORD *a1, CFLocaleRef locale, int a3)
{
  const __CFString *Value;
  const __CFString *v7;
  const __CFString *v8;
  const __CFLocale *v9;
  CEM *v10;
  _BOOL4 v11;
  int64_t v12;
  CFURLRef v13;
  const __CFURL *v14;
  CEM::EmojiSearchTrie *v15;
  const __CFLocale *v16;
  const __CFString *v17;
  CFURLRef v18;
  CEM::EmojiSearchTrie *v19;
  CFURLRef v20;
  const __CFURL *v21;
  CEM::EmojiSearchTrie *v22;
  const __CFLocale *v23;
  CFURLRef v24;
  __CFString *v25;
  CEM::EmojiSearchTrie *v26;
  void *result;
  const __CFLocale *v28;
  const __CFURL *v29;
  CEM::EmojiSearchTrie *v30;
  void *__p[2];
  char v32;

  Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
  v7 = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
  v8 = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E0C9B090]);
  v10 = (CEM *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E0C9B080]);
  if (Value && CFStringCompare(Value, CFSTR("en"), 0) == kCFCompareEqualTo)
  {
    if (v7)
      v11 = CFStringCompare(v7, CFSTR("US"), 0) == kCFCompareEqualTo;
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  if (v8 && CFStringCompare(v8, CFSTR("Latn"), 0) == kCFCompareEqualTo)
  {
    CEM::getUTF8StringFromCFString(__p, Value);
    v12 = (char *)std::__find_impl[abi:ne180100]<char const* const*,char const* const*,std::string,std::__identity>((const char **)createEmojiSearchTrie(__CFLocale const*,CEMEmojiSearchType)::indianLanguageCodesCustomLoading, (const char **)&__block_descriptor_tmp_189, (const void **)__p)- (char *)createEmojiSearchTrie(__CFLocale const*,CEMEmojiSearchType)::indianLanguageCodesCustomLoading;
    if (v32 < 0)
      operator delete(__p[0]);
    if (v12 != 72)
    {
      v13 = CEM::copyResourceURLFromFrameworkBundle(v10, CFSTR("dat"), CFSTR("IndicLatnTries"), 0, v9);
      __p[0] = v13;
      if (v13)
      {
        v14 = v13;
        if (CFURLResourceIsReachable(v13, 0))
        {
          v15 = (CEM::EmojiSearchTrie *)operator new();
          CEM::EmojiSearchTrie::EmojiSearchTrie(v15, locale, v14);
        }
        CFRelease(v14);
      }
    }
  }
  if (a3
    && (CFStringCompare(Value, CFSTR("zh"), 0) == kCFCompareEqualTo
     || CFStringCompare(Value, CFSTR("yue"), 0) == kCFCompareEqualTo
     || CFStringCompare(Value, CFSTR("ja"), 0) == kCFCompareEqualTo))
  {
    if (CFStringCompare(Value, CFSTR("ja"), 0))
      v17 = CFSTR("StaticAssets/zh.shared");
    else
      v17 = CFSTR("StaticAssets/ja");
    v18 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("LocaleData"), CFSTR("dat"), v17, 0, v16);
    __p[0] = v18;
    if (CFURLResourceIsReachable(v18, 0))
    {
      v19 = (CEM::EmojiSearchTrie *)operator new();
      CEM::EmojiSearchTrie::EmojiSearchTrie(v19, locale, v18);
    }
    if (v18)
      CFRelease(v18);
  }
  if (v11)
  {
    v20 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("LocaleData-en"), CFSTR("dat"), 0, 0, v9);
    __p[0] = v20;
    if (v20)
    {
      v21 = v20;
      v22 = (CEM::EmojiSearchTrie *)operator new();
      CEM::EmojiSearchTrie::EmojiSearchTrie(v22, locale, v21);
    }
  }
  else
  {
    v24 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("LocaleData"), CFSTR("dat"), 0, (__CFString *)locale, v9);
    __p[0] = v24;
    if (v24
      || (a3 ? (v25 = CFSTR("FindReplace")) : (v25 = CFSTR("CharacterPicker")),
          v24 = CEM::copyResourceURLFromFrameworkBundle((CEM *)v25, CFSTR("dat"), 0, (__CFString *)locale, v23),
          (__p[0] = v24) != 0))
    {
      v26 = (CEM::EmojiSearchTrie *)operator new();
      CEM::EmojiSearchTrie::EmojiSearchTrie(v26, locale, v24);
    }
  }
  result = (void *)CFStringCompare(Value, CFSTR("en"), 0);
  if (!result)
  {
    result = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("LocaleData-en"), CFSTR("dat"), 0, 0, v28);
    __p[0] = result;
    if (result)
    {
      v29 = (const __CFURL *)result;
      v30 = (CEM::EmojiSearchTrie *)operator new();
      CEM::EmojiSearchTrie::EmojiSearchTrie(v30, locale, v29);
    }
  }
  *a1 = 0;
  return result;
}

void sub_18D73C81C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  MEMORY[0x18D7921EC](v2, 0x10F2C40A1E3B818);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)va);
  _Unwind_Resume(a1);
}

void CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(uint64_t *a1, const __CFString *a2, CFRange a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  CFMutableStringRef MutableCopy;
  CFIndex Length;
  CFStringRef v10;
  std::string::size_type v11;
  uint64_t v12;
  int v13;
  std::string::size_type v14;
  std::string *v16;
  std::string::size_type v17;
  std::string *v19;
  int64_t size;
  std::string::size_type v21;
  char *v22;
  char *v23;
  int64_t v24;
  std::string *v25;
  char *v26;
  int v27;
  int64_t v28;
  char *v29;
  char *v30;
  std::string *v31;
  std::string::size_type v32;
  std::string::size_type v33;
  std::string::size_type v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  int v38;
  const char *v39;
  const __CFString *v40;
  CFRange v41;
  int v42;
  uint64_t v43;
  uint64_t *i;
  uint64_t v45;
  UniChar CharacterAtIndex;
  __int128 *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  CFRange CurrentTokenRange;
  CFIndex *v57;
  CFIndex *v58;
  CFIndex v59;
  CFIndex v60;
  BOOL v61;
  BOOL v62;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  CFIndex *v68;
  uint64_t *v69;
  CFIndex v70;
  CFIndex v71;
  std::string::size_type v72;
  std::string::size_type v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  int64_t v77;
  unint64_t v78;
  uint64_t v79;
  CFIndex *v80;
  CFIndex v81;
  __CFStringTokenizer *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  _WORD *isa;
  BOOL v90;
  unsigned __int16 *v91;
  int v92;
  int v93;
  char v94;
  __int128 *v95;
  __int128 *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  _WORD *v100;
  uint64_t v101;
  std::string *v102;
  __int128 v103;
  CFRange v104;
  __CFStringTokenizer *v105;
  CFIndex v106;
  uint64_t *v107;
  CFStringRef v110;
  CFIndex location;
  const __CFString *theString;
  CFIndex range;
  uint64_t v116;
  char v117;
  uint64_t v118;
  __CFStringTokenizer *v119;
  __int128 v120;
  _QWORD v121[2];
  void (*v122)(uint64_t, uint64_t, uint64_t);
  void *v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  __n128 (*v128)(_QWORD *, uint64_t);
  void (*v129)(uint64_t);
  void *__p;
  void *v131;
  uint64_t v132;
  __CFString *v133;
  char v134;
  CFStringRef v135;
  std::string v136;
  std::string v137;
  std::string v138;
  std::string v139;
  std::string *v140;
  __int128 v141;
  CFIndex v142;
  __int128 *v143;
  uint64_t v144;
  CFRange v145;
  CFRange v146;
  CFRange v147;

  location = a3.location;
  v144 = *MEMORY[0x1E0C80C00];
  range = a3.length;
  if (a3.length <= 0x4000)
  {
    v6 = (uint64_t)a1;
    v7 = *a1;
    if (!*a1 || (v107 = a1, (*(_WORD *)(v7 + 120) & 2) == 0))
    {
      if (a4 <= 6 && (v107 = a1, ((1 << a4) & 0x72) != 0))
      {
        if (!v7)
          return;
      }
      else
      {
        v107 = a1 + 1;
        if (!a1[1])
          return;
      }
    }
    v135 = CFStringCreateWithSubstring(0, a2, a3);
    v134 = 0;
    MutableCopy = CFStringCreateMutableCopy(0, 0, v135);
    v133 = MutableCopy;
    CFStringLowercase(MutableCopy, *(CFLocaleRef *)(v6 + 32));
    Length = CFStringGetLength(MutableCopy);
    if (Length >= range)
    {
      v125 = 0;
      v126 = &v125;
      v127 = 0x4002000000;
      v128 = __Block_byref_object_copy__146;
      v129 = __Block_byref_object_dispose__147;
      v132 = 0;
      __p = 0;
      v131 = 0;
      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 0x40000000;
      v122 = ___ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbE_block_invoke;
      v123 = &unk_1E2633268;
      v124 = &v125;
      v116 = v6;
      theString = MutableCopy;
      if (!MutableCopy)
        goto LABEL_86;
      v145.location = 0;
      v145.length = range;
      v10 = CFStringCreateWithSubstring(0, MutableCopy, v145);
      v140 = (std::string *)v10;
      if (!v10)
        goto LABEL_86;
      CEM::getUTF8StringFromCFString(&v139, v10);
      memset(&v138, 0, sizeof(v138));
      if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v137, v139.__r_.__value_.__l.__data_, v139.__r_.__value_.__l.__size_);
      else
        v137 = v139;
      std::string::basic_string[abi:ne180100]<0>(&v136, " ");
      v11 = 0;
      v12 = 0;
      v106 = Length;
      while (1)
      {
        v13 = SHIBYTE(v137.__r_.__value_.__r.__words[2]);
        v14 = HIBYTE(v137.__r_.__value_.__r.__words[2]);
        if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
          break;
        if (v11 >= HIBYTE(v137.__r_.__value_.__r.__words[2]) || v12 == -1)
          goto LABEL_59;
        v16 = &v137;
        v17 = HIBYTE(v137.__r_.__value_.__r.__words[2]);
LABEL_27:
        if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v19 = &v136;
        else
          v19 = (std::string *)v136.__r_.__value_.__r.__words[0];
        if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(v136.__r_.__value_.__r.__words[2]);
        else
          size = v136.__r_.__value_.__l.__size_;
        v21 = v11;
        if (size)
        {
          v22 = (char *)v16 + v11;
          v23 = (char *)v16 + v17;
          v24 = v17 - v11;
          if (v24 >= size)
          {
            v27 = v19->__r_.__value_.__s.__data_[0];
            do
            {
              v28 = v24 - size;
              if (v28 == -1)
                break;
              v29 = (char *)memchr(v22, v27, v28 + 1);
              if (!v29)
                break;
              v30 = v29;
              if (!memcmp(v29, v19, size))
              {
                if (v30 == v23)
                  break;
                v21 = v30 - (char *)v16;
                if (v30 - (char *)v16 == -1)
                  break;
                goto LABEL_51;
              }
              v22 = v30 + 1;
              v24 = v23 - (v30 + 1);
            }
            while (v24 >= size);
          }
          if (v13 < 0)
          {
            v14 = v137.__r_.__value_.__l.__size_;
            v25 = (std::string *)v137.__r_.__value_.__r.__words[0];
            v26 = (char *)(v137.__r_.__value_.__r.__words[0] + (int)v11);
          }
          else
          {
            v25 = &v137;
            v26 = (char *)&v137 + (int)v11;
          }
          std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char *>,std::__wrap_iter<char *>>(&v141, v26, (char *)v25 + v14, (char *)v25 + v14 - v26);
          *(_QWORD *)&v120 = &v138;
          std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100]((std::vector<std::string> **)&v120, &v141);
          if (SHIBYTE(v142) < 0)
            operator delete((void *)v141);
          if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
            v11 = v137.__r_.__value_.__l.__size_;
          else
            v11 = HIBYTE(v137.__r_.__value_.__r.__words[2]);
        }
        else
        {
LABEL_51:
          v31 = (std::string *)v137.__r_.__value_.__r.__words[0];
          if (v13 >= 0)
            v31 = &v137;
          std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char *>,std::__wrap_iter<char *>>(&v141, (char *)v31 + (int)v11, (char *)v31 + (int)v21, (int)v21 - (uint64_t)(int)v11);
          *(_QWORD *)&v120 = &v138;
          std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100]((std::vector<std::string> **)&v120, &v141);
          if (SHIBYTE(v142) < 0)
            operator delete((void *)v141);
          v32 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
          if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v32 = v136.__r_.__value_.__l.__size_;
          v11 = v32 + v21;
        }
        ++v12;
      }
      v17 = v137.__r_.__value_.__l.__size_;
      if (v11 < v137.__r_.__value_.__l.__size_ && v12 != -1)
      {
        v16 = (std::string *)v137.__r_.__value_.__r.__words[0];
        goto LABEL_27;
      }
LABEL_59:
      if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v136.__r_.__value_.__l.__data_);
        LOBYTE(v13) = *((_BYTE *)&v137.__r_.__value_.__s + 23);
      }
      v6 = v116;
      MutableCopy = (CFMutableStringRef)theString;
      if ((v13 & 0x80) != 0)
        operator delete(v137.__r_.__value_.__l.__data_);
      v34 = v138.__r_.__value_.__l.__size_;
      v33 = v138.__r_.__value_.__r.__words[0];
      while (2)
      {
        if (v33 != v34)
        {
          LOBYTE(v120) = 0;
          v35 = *(unsigned __int8 *)(v33 + 23);
          if (*(char *)(v33 + 23) < 0)
          {
            v36 = *(const char **)v33;
            v37 = *(_QWORD *)(v33 + 8);
          }
          else
          {
            v36 = (const char *)v33;
            v37 = *(unsigned __int8 *)(v33 + 23);
          }
          do
          {
            if (!v37)
              goto LABEL_81;
            v38 = v36[--v37];
          }
          while (v38 != 46);
          if (v37 == -1)
            goto LABEL_81;
          if ((v35 & 0x80) != 0)
          {
            if (v37 != *(_QWORD *)(v33 + 8) - 1)
            {
              v39 = *(const char **)v33;
              goto LABEL_76;
            }
LABEL_81:
            v33 += 24;
            continue;
          }
          if (v37 == v35 - 1)
            goto LABEL_81;
          v39 = (const char *)v33;
LABEL_76:
          v40 = CFStringCreateWithCString(0, v39, 0x8000100u);
          *(_QWORD *)&v141 = v40;
          if (!v40)
            goto LABEL_81;
          v41 = CFStringFind(theString, v40, 0);
          if (v41.location != -1 && v41.length)
            ((void (*)(_QWORD *, CFIndex, CFIndex, __int128 *))v122)(v121, v41.location, v41.length, &v120);
          v42 = v120;
          CFRelease(v40);
          if (!v42)
            goto LABEL_81;
        }
        break;
      }
      *(_QWORD *)&v141 = &v138;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
      if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v139.__r_.__value_.__l.__data_);
      Length = v106;
      if (v140)
        CFRelease(v140);
LABEL_86:
      memset(&v139, 0, sizeof(v139));
      v120 = xmmword_18D745C40;
      if (!*(_QWORD *)(v6 + 16))
        goto LABEL_111;
      if (Length >= 1)
      {
        v43 = 0;
        do
        {
          for (i = (uint64_t *)v126[5]; i != (uint64_t *)v126[6]; i += 2)
          {
            v45 = i[1];
            if (*i < v43 && v45 + *i > v43)
            {
              if (*i != -1)
              {
                v43 += v45;
                goto LABEL_109;
              }
              break;
            }
          }
          if (v43 >= 1)
          {
            CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v43 - 1);
            if (!isWhitespace(CharacterAtIndex))
            {
LABEL_108:
              ++v43;
              continue;
            }
          }
          *(_QWORD *)&v141 = &off_1E2632218;
          *((_QWORD *)&v141 + 1) = theString;
          v142 = range;
          v143 = &v141;
          CEM::EmojiLocaleData::emojiTokensForStringPrefix((uint64_t)&v138, v6, a2, v43, range - v43, a4, a5, *(_QWORD *)(v6 + 16), (uint64_t *)&v120, (uint64_t)&v141);
          std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((void **)&v139.__r_.__value_.__l.__data_);
          v139 = v138;
          memset(&v138, 0, sizeof(v138));
          v137.__r_.__value_.__r.__words[0] = (std::string::size_type)&v138;
          std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
          v48 = v143;
          if (v143 == &v141)
          {
            v48 = &v141;
            v49 = 4;
          }
          else
          {
            if (!v143)
              goto LABEL_106;
            v49 = 5;
          }
          (*(void (**)(void))(*(_QWORD *)v48 + 8 * v49))();
LABEL_106:
          if (v139.__r_.__value_.__l.__size_ == v139.__r_.__value_.__r.__words[0])
            goto LABEL_108;
          v50 = *((_QWORD *)&v120 + 1);
          v51 = v120 + location;
          (*(void (**)(uint64_t, std::string *, _QWORD, _QWORD, char *))(a6 + 16))(a6, &v139, v120 + location, *((_QWORD *)&v120 + 1), &v134);
          v43 = v51 + v50;
LABEL_109:
          ;
        }
        while (v43 < Length);
      }
      MutableCopy = (CFMutableStringRef)theString;
      if (!v134)
      {
LABEL_111:
        v146.location = 0;
        v146.length = range;
        CFStringTokenizerSetString(*(CFStringTokenizerRef *)(v6 + 40), MutableCopy, v146);
        v52 = 0;
        v53 = 0;
        v54 = 0;
        v119 = 0;
        memset(&v138, 0, sizeof(v138));
        while (1)
        {
          v55 = v116;
          if (!CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)(v116 + 40)))
            break;
          CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(_QWORD *)(v116 + 40));
          v57 = (CFIndex *)v126[5];
          v58 = (CFIndex *)v126[6];
          if (v57 == v58)
          {
LABEL_126:
            if ((unint64_t)v53 >= v54)
            {
              v64 = v53 - v52;
              v65 = v64 + 1;
              if ((unint64_t)(v64 + 1) >> 61)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              if ((uint64_t)(v54 - (_QWORD)v52) >> 2 > v65)
                v65 = (uint64_t)(v54 - (_QWORD)v52) >> 2;
              if (v54 - (unint64_t)v52 >= 0x7FFFFFFFFFFFFFF8)
                v66 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v66 = v65;
              if (v66)
                v66 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long>>(v66);
              else
                v67 = 0;
              v68 = (CFIndex *)(v66 + 8 * v64);
              *v68 = CurrentTokenRange.location;
              v69 = v68 + 1;
              while (v53 != v52)
              {
                v70 = *--v53;
                *--v68 = v70;
              }
              v54 = v66 + 8 * v67;
              if (v52)
                operator delete(v52);
              v52 = v68;
              v53 = v69;
            }
            else
            {
              *v53++ = CurrentTokenRange.location;
            }
            v71 = CurrentTokenRange.location + CurrentTokenRange.length;
            v72 = v138.__r_.__value_.__l.__size_;
            if (v138.__r_.__value_.__l.__size_ >= v138.__r_.__value_.__r.__words[2])
            {
              v74 = (void *)v138.__r_.__value_.__r.__words[0];
              v75 = (uint64_t)(v138.__r_.__value_.__l.__size_ - v138.__r_.__value_.__r.__words[0]) >> 3;
              v76 = v75 + 1;
              if ((unint64_t)(v75 + 1) >> 61)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              v77 = v138.__r_.__value_.__r.__words[2] - v138.__r_.__value_.__r.__words[0];
              if ((uint64_t)(v138.__r_.__value_.__r.__words[2] - v138.__r_.__value_.__r.__words[0]) >> 2 > v76)
                v76 = v77 >> 2;
              if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8)
                v78 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v78 = v76;
              if (v78)
              {
                v78 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long>>(v78);
                v72 = v138.__r_.__value_.__l.__size_;
                v74 = (void *)v138.__r_.__value_.__r.__words[0];
              }
              else
              {
                v79 = 0;
              }
              v80 = (CFIndex *)(v78 + 8 * v75);
              *v80 = v71;
              v73 = (std::string::size_type)(v80 + 1);
              while ((void *)v72 != v74)
              {
                v81 = *(_QWORD *)(v72 - 8);
                v72 -= 8;
                *--v80 = v81;
              }
              v138.__r_.__value_.__r.__words[0] = (std::string::size_type)v80;
              v138.__r_.__value_.__l.__size_ = v73;
              v138.__r_.__value_.__r.__words[2] = v78 + 8 * v79;
              if (v74)
                operator delete(v74);
            }
            else
            {
              *(_QWORD *)v138.__r_.__value_.__l.__size_ = v71;
              v73 = v72 + 8;
            }
            v138.__r_.__value_.__l.__size_ = v73;
          }
          else
          {
            v59 = CurrentTokenRange.length + CurrentTokenRange.location;
            while (1)
            {
              v60 = v57[1] + *v57;
              v61 = CurrentTokenRange.location >= *v57 && CurrentTokenRange.location < v60;
              v62 = !v61 || v59 <= *v57;
              if (!v62 && v59 <= v60)
                break;
              v57 += 2;
              if (v57 == v58)
                goto LABEL_126;
            }
          }
        }
        CEM::getUTF8StringFromCFString(&v137, theString);
        if (v52 != v53)
        {
          v82 = 0;
          v83 = 0;
          v110 = (CFStringRef)(v116 + 48);
          v105 = 0;
          v84 = -1;
          v85 = v52;
          while (1)
          {
            v118 = 0;
            v86 = *v85;
            v118 = *v85;
            v120 = xmmword_18D745C40;
            v87 = *(unsigned __int8 *)(v55 + 71);
            v88 = (char)v87;
            if ((v87 & 0x80u) != 0)
              v87 = *(_QWORD *)(v55 + 56);
            if (v87 == 2)
            {
              if (v88 >= 0)
                isa = (_WORD *)(v116 + 48);
              else
                isa = v110->isa;
              if (*isa == 28523)
              {
                *(_QWORD *)&v141 = &off_1E2632270;
                v143 = &v141;
                CEM::EmojiLocaleData::emojiTokensForStringPrefix((uint64_t)&v136, v116, theString, v86, range - v86, a4, a5, *v107, (uint64_t *)&v120, (uint64_t)&v141);
                goto LABEL_185;
              }
              if (*isa != 26746)
              {
                v90 = *isa == 24938;
LABEL_178:
                v94 = v90;
                goto LABEL_184;
              }
              v94 = 1;
            }
            else
            {
              if (v87 == 3)
              {
                if (v88 >= 0)
                  v91 = (unsigned __int16 *)(v116 + 48);
                else
                  v91 = (unsigned __int16 *)v110->isa;
                v92 = *v91;
                v93 = *((unsigned __int8 *)v91 + 2);
                v90 = v92 == 30073 && v93 == 101;
                goto LABEL_178;
              }
              v94 = 0;
            }
LABEL_184:
            v117 = v94;
            v95 = (__int128 *)operator new(0x20uLL);
            *(_QWORD *)v95 = &off_1E2632C00;
            *((_QWORD *)v95 + 1) = &v138;
            *((_QWORD *)v95 + 2) = &v118;
            *((_QWORD *)v95 + 3) = &v117;
            v143 = v95;
            CEM::EmojiLocaleData::emojiTokensForStringPrefix((uint64_t)&v136, v116, theString, v86, range - v86, a4, a5, *v107, (uint64_t *)&v120, (uint64_t)&v141);
LABEL_185:
            std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((void **)&v139.__r_.__value_.__l.__data_);
            v139 = v136;
            memset(&v136, 0, sizeof(v136));
            v140 = &v136;
            std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v140);
            v96 = v143;
            v55 = v116;
            if (v143 == &v141)
            {
              v96 = &v141;
              v97 = 4;
              goto LABEL_189;
            }
            if (v143)
            {
              v97 = 5;
LABEL_189:
              (*(void (**)(void))(*(_QWORD *)v96 + 8 * v97))();
            }
            if ((a5 & 1) != 0
              || v84 == -1
              || (uint64_t)v120 < v84
              || (uint64_t)v120 >= v84 + v83
              || *((_QWORD *)&v120 + 1) + (_QWORD)v120 <= v84
              || *((_QWORD *)&v120 + 1) + (_QWORD)v120 > v84 + v83)
            {
              if (v139.__r_.__value_.__l.__size_ == v139.__r_.__value_.__r.__words[0])
                goto LABEL_207;
              v98 = *(unsigned __int8 *)(v116 + 71);
              v99 = (char)v98;
              if ((v98 & 0x80u) != 0)
                v98 = *(_QWORD *)(v116 + 56);
              if (v98 != 2)
                goto LABEL_204;
              v100 = v99 >= 0 ? (_WORD *)(v116 + 48) : v110->isa;
              if (*v100 != 28523)
                goto LABEL_204;
              if (!v105)
              {
                v147.length = range;
                v147.location = 0;
                v82 = CFStringTokenizerCreate(0, theString, v147, 0, *(CFLocaleRef *)(v116 + 32));
                v119 = v82;
              }
              v103 = v120;
              if ((!CFStringTokenizerGoToTokenAtIndex(v82, v120)
                 || CFStringTokenizerGetCurrentTokenRange(v82).location == (_QWORD)v103)
                && CFStringTokenizerGoToTokenAtIndex(v82, *((_QWORD *)&v103 + 1) + v103 - 1)
                && (v104 = CFStringTokenizerGetCurrentTokenRange(v82),
                    v104.location + v104.length >= *((_QWORD *)&v103 + 1) + (_QWORD)v103))
              {
                if (v104.location != -1)
                {
                  v105 = v82;
LABEL_204:
                  v83 = *((_QWORD *)&v120 + 1);
                  v84 = v120;
                  v101 = v120 + location;
                  v102 = &v137;
                  if ((v137.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    v102 = (std::string *)v137.__r_.__value_.__r.__words[0];
                  CEM::AdaptationController::sortEmojiTokensIfEnabled(v116 + 112, (uint64_t)v102 + v101, *((unint64_t *)&v120 + 1), (uint64_t)&v139);
                  (*(void (**)(uint64_t, std::string *, uint64_t, uint64_t, char *))(a6 + 16))(a6, &v139, v101, v83, &v134);
LABEL_207:
                  if (v134)
                    goto LABEL_221;
                  goto LABEL_208;
                }
                v105 = v82;
              }
              else
              {
                v105 = v82;
              }
            }
LABEL_208:
            if (++v85 == v53)
              goto LABEL_221;
          }
        }
        v82 = 0;
LABEL_221:
        if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v137.__r_.__value_.__l.__data_);
        if (v138.__r_.__value_.__r.__words[0])
        {
          v138.__r_.__value_.__l.__size_ = v138.__r_.__value_.__r.__words[0];
          operator delete(v138.__r_.__value_.__l.__data_);
        }
        if (v52)
          operator delete(v52);
        if (v82)
          CFRelease(v82);
      }
      *(_QWORD *)&v141 = &v139;
      std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
      _Block_object_dispose(&v125, 8);
      if (__p)
      {
        v131 = __p;
        operator delete(__p);
      }
      MutableCopy = v133;
    }
    if (MutableCopy)
      CFRelease(MutableCopy);
    if (v135)
      CFRelease(v135);
  }
}

void sub_18D73D508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40,uint64_t a41,const void *a42,uint64_t a43,const void *a44,uint64_t a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,void *a60)
{
  uint64_t v60;

  a27 = v60 - 208;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  if (*(char *)(v60 - 153) < 0)
    operator delete(a60);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v60 - 144), 0);
  _Block_object_dispose(&a34, 8);
  if (__p)
  {
    a40 = (uint64_t)__p;
    operator delete(__p);
  }
  nlp::CFScopedPtr<__CFString *>::reset(&a42);
  nlp::CFScopedPtr<__CFString const*>::reset(&a44, 0);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__146(_QWORD *a1, uint64_t a2)
{
  __n128 result;

  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__147(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void ___ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  unint64_t v6;
  char *v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;

  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = (char *)v5[6];
  v6 = v5[7];
  if ((unint64_t)v7 >= v6)
  {
    v9 = (char *)v5[5];
    v10 = (v7 - v9) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v12 = v6 - (_QWORD)v9;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
    {
      if (v13 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v14 = (char *)operator new(16 * v13);
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[16 * v10];
    *(_QWORD *)v15 = a2;
    *((_QWORD *)v15 + 1) = a3;
    v8 = v15 + 16;
    if (v7 != v9)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v7 - 1);
        v15 -= 16;
        v7 -= 16;
      }
      while (v7 != v9);
      v7 = (char *)v5[5];
    }
    v5[5] = v15;
    v5[6] = v8;
    v5[7] = &v14[16 * v13];
    if (v7)
      operator delete(v7);
  }
  else
  {
    *(_QWORD *)v7 = a2;
    *((_QWORD *)v7 + 1) = a3;
    v8 = v7 + 16;
  }
  v5[6] = v8;
}

BOOL isWhitespace(UniChar theChar)
{
  unsigned __int8 v2;

  {
    isWhitespace(unsigned short)::whitespaceCharacter = (uint64_t)CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  }
  return CFCharacterSetIsCharacterMember((CFCharacterSetRef)isWhitespace(unsigned short)::whitespaceCharacter, theChar) != 0;
}

void sub_18D73D8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiLocaleData::emojiTokensForStringPrefix(uint64_t a1, uint64_t a2, CFStringRef theString, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10)
{
  int v12;
  int v16;
  const char *CStringPtr;
  uint64_t v18;
  int64_t v19;
  UniChar *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  UniChar *v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  unsigned __int16 *v36;
  unsigned __int16 *v37;
  void **v38;
  unint64_t v39;
  void **v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  _QWORD *v51;
  _QWORD *v52;
  char *v53;
  __int128 v54;
  int64x2_t v55;
  uint64_t v56;
  uint64_t v58;
  char v59;
  int v60;
  uint64_t v62;
  unsigned __int16 *v63;
  unsigned __int16 *v64;
  uint64_t v65;
  void *v66;
  std::string __p;
  void *v68[2];
  __int128 v69;
  unsigned int v70;
  _BYTE v71[4];
  UniChar buffer[4];
  int64x2_t v73;
  uint64_t v74;
  uint64_t v75;
  CFStringRef theStringa;
  const UniChar *CharactersPtr;
  const char *v78;
  uint64_t v79;
  int64_t v80;
  int64_t v81;
  int64_t v82;
  CFRange v83;

  v59 = a7;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if (a8)
  {
    v12 = a6;
    if (a4 + a5 > CFStringGetLength(theString))
      __assert_rtn("findEmojiForStringPrefix", "CEMEmojiSearchTrie.cpp", 121, "range.location + range.length <= CFStringGetLength(string)");
    if (v12)
      v16 = v12;
    else
      v16 = 2;
    v60 = v16;
    v63 = 0;
    v64 = 0;
    v65 = 0;
    theStringa = theString;
    v79 = a4;
    v80 = a5;
    CharactersPtr = CFStringGetCharactersPtr(theString);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    v81 = 0;
    v82 = 0;
    v78 = CStringPtr;
    v70 = 0;
    *(_OWORD *)v68 = 0u;
    v69 = 0u;
    if (a5 >= 1)
    {
      v18 = 0;
      v19 = 0;
      v58 = a4;
      v62 = a4 + 1;
      v20 = buffer;
      v21 = 64;
      while (1)
      {
        if ((unint64_t)v19 >= 4)
          v22 = 4;
        else
          v22 = v19;
        v23 = v80;
        if (v80 <= v19)
        {
          LOBYTE(v25) = 0;
          goto LABEL_23;
        }
        if (CharactersPtr)
        {
          v24 = (UniChar *)&CharactersPtr[v19 + v79];
        }
        else
        {
          if (v78)
          {
            v25 = v78[v79 + v19];
            goto LABEL_22;
          }
          v30 = v81;
          if (v82 <= v19 || v81 > v19)
          {
            v32 = v22 + v18;
            v33 = v21 - v22;
            v34 = v19 - v22;
            v35 = v34 + 64;
            if (v34 + 64 >= v80)
              v35 = v80;
            v81 = v34;
            v82 = v35;
            if (v80 >= v33)
              v23 = v33;
            v83.length = v23 + v32;
            v83.location = v79 + v34;
            CFStringGetCharacters(theStringa, v83, buffer);
            v30 = v81;
          }
          v24 = &v20[-v30];
        }
        v25 = *v24;
        if ((unsigned __int16)v25 == 8217)
        {
          LOBYTE(v25) = 39;
          goto LABEL_23;
        }
LABEL_22:
        if ((unsigned __int16)v25 >= 0x80u)
        {
          if ((unsigned __int16)v25 > 0x7FFu)
          {
            LOWORD(v28) = ((unsigned __int16)v25 >> 12) | 0xFFE0;
            v71[1] = (v25 >> 6) & 0x3F | 0x80;
            v29 = 2;
          }
          else
          {
            v28 = (v25 >> 6) | 0xFFFFFFC0;
            v29 = 1;
          }
          v71[0] = v28;
          v26 = v29 + 1;
          v71[v29] = v25 & 0x3F | 0x80;
          goto LABEL_24;
        }
LABEL_23:
        v71[0] = v25;
        v26 = 1;
LABEL_24:
        internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(a8 + 32), (uint64_t)v71, v26, (uint64_t)v68, &v66);
        v68[0] = v66;
        std::string::operator=((std::string *)&v68[1], &__p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (v68[0] != (void *)0xFFFFFFFFLL)
        {
          v66 = (void *)(v62 + v19);
          v27 = *(_QWORD *)(a10 + 24);
          if (!v27)
            std::__throw_bad_function_call[abi:ne180100]();
          if ((*(unsigned int (**)(uint64_t, void **))(*(_QWORD *)v27 + 48))(v27, &v66)
            && CEM::EmojiSearchTrie::getPayload(a8, (uint64_t)v68, v60, &v70))
          {
            if ((v59 & 1) == 0)
              v64 = v63;
            CEM::EmojiSearchTrie::payloadToIndexes((uint64_t *)a8, v70, (uint64_t)&v63);
            *a9 = v58;
            a9[1] = v19 + 1;
          }
          ++v19;
          --v18;
          ++v21;
          ++v20;
          if (a5 != v19)
            continue;
        }
        if (SHIBYTE(v69) < 0)
          operator delete(v68[1]);
        break;
      }
    }
    v36 = v63;
    v37 = v64;
    if (v63 != v64)
    {
      do
      {
        CEM::EmojiLocaleData::createEmojiToken(v68, a2, v12, *v36);
        if (v68[0])
        {
          v38 = *(void ***)(a1 + 8);
          v39 = *(_QWORD *)(a1 + 16);
          if ((unint64_t)v38 >= v39)
          {
            v44 = ((uint64_t)v38 - *(_QWORD *)a1) >> 4;
            v45 = v44 + 1;
            if ((unint64_t)(v44 + 1) >> 60)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v46 = v39 - *(_QWORD *)a1;
            if (v46 >> 3 > v45)
              v45 = v46 >> 3;
            if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0)
              v47 = 0xFFFFFFFFFFFFFFFLL;
            else
              v47 = v45;
            v75 = a1 + 16;
            v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v47);
            v50 = &v48[16 * v44];
            *(_OWORD *)v50 = *(_OWORD *)v68;
            v68[0] = 0;
            v68[1] = 0;
            v52 = *(_QWORD **)a1;
            v51 = *(_QWORD **)(a1 + 8);
            if (v51 == *(_QWORD **)a1)
            {
              v55 = vdupq_n_s64((unint64_t)v51);
              v53 = &v48[16 * v44];
            }
            else
            {
              v53 = &v48[16 * v44];
              do
              {
                v54 = *((_OWORD *)v51 - 1);
                v51 -= 2;
                *((_OWORD *)v53 - 1) = v54;
                v53 -= 16;
                *v51 = 0;
                v51[1] = 0;
              }
              while (v51 != v52);
              v55 = *(int64x2_t *)a1;
            }
            v40 = (void **)(v50 + 16);
            *(_QWORD *)a1 = v53;
            *(_QWORD *)(a1 + 8) = v50 + 16;
            v73 = v55;
            v56 = *(_QWORD *)(a1 + 16);
            *(_QWORD *)(a1 + 16) = &v48[16 * v49];
            v74 = v56;
            *(_QWORD *)buffer = v55.i64[0];
            std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)buffer);
          }
          else
          {
            *v38 = v68[0];
            v38[1] = v68[1];
            v68[0] = 0;
            v68[1] = 0;
            v40 = v38 + 2;
          }
          *(_QWORD *)(a1 + 8) = v40;
        }
        else
        {
          v41 = (std::__shared_weak_count *)v68[1];
          if (v68[1])
          {
            v42 = (unint64_t *)((char *)v68[1] + 8);
            do
              v43 = __ldaxr(v42);
            while (__stlxr(v43 - 1, v42));
            if (!v43)
            {
              ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
              std::__shared_weak_count::__release_weak(v41);
            }
          }
        }
        ++v36;
      }
      while (v36 != v37);
      v36 = v63;
    }
    if (v36)
      operator delete(v36);
  }
  return sortEmojiTokens((__int128 **)a1, *(_BYTE *)(a2 + 784), (uint64_t)theString, a4, a5, a6, a7, a8);
}

void sub_18D73DDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a26);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<long>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

void std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

__n128 std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_1E2632C00;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E2632C00;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *a2;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD **)v3;
  v4 = *(_QWORD **)(v3 + 8);
  if (v5 != v4)
  {
    while (*v5 != v2)
    {
      if (++v5 == v4)
      {
        v5 = v4;
        break;
      }
    }
  }
  if (v5 == v4)
    return 0;
  if (**(_BYTE **)(a1 + 24))
    return 1;
  return v2 - **(_QWORD **)(a1 + 16) > 1;
}

uint64_t std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbEE3$_2"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_2>,BOOL ()(long)>::target_type()
{
}

void std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E2632270;
  return result;
}

void std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E2632270;
}

uint64_t std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::operator()()
{
  return 1;
}

uint64_t std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbEE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_1>,BOOL ()(long)>::target_type()
{
}

uint64_t CEM::EmojiLocaleData::createEmojiToken(_QWORD *a1, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t result;
  unsigned __int16 *v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  _QWORD *v12;

  result = CEM::EmojiLocaleData::emojiIndexIsSupported(a2, a3, a4);
  if ((result & 1) != 0)
  {
    v8 = *(unsigned __int16 **)(a2 + 104);
    if (!v8
      || (v9 = v8[22], v10 = a4 >= v9, v11 = a4 - v9, v11 == 0 || !v10)
      || v8[21] < (unsigned __int16)v11)
    {
      v8 = *(unsigned __int16 **)(a2 + 96);
    }
    v12 = operator new(0x48uLL);
    v12[1] = 0;
    v12[2] = 0;
    *v12 = &off_1E26329A0;
    result = CEM::EmojiToken::EmojiToken((uint64_t)(v12 + 3), a4, (CEM::EmojiData *)v8, a2);
    *a1 = result;
    a1[1] = v12;
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

void sub_18D73E0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _QWORD *v16;
  std::__shared_weak_count *v17;
  void *v20;

  std::__shared_weak_count::~__shared_weak_count(v17);
  operator delete(v20);
  if (a2 != 1)
    _Unwind_Resume(a1);
  __cxa_begin_catch(a1);
  *v16 = 0;
  v16[1] = 0;
  __cxa_end_catch();
}

uint64_t sortEmojiTokens(__int128 **a1, UInt8 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 *v9;
  __int128 *v10;
  __int128 **v11;
  unint64_t v12;
  uint64_t v13;
  __int128 *v14;
  __int128 *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  char *v21;
  __int128 v22;
  int64x2_t v23;
  uint64_t v24;
  CEM::EmojiToken *v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  CEM::EmojiToken *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  BOOL v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t i;
  unsigned int v51;
  const __CFString *v52;
  const __CFString *v53;
  CFIndex Length;
  CFIndex v55;
  uint64_t v56;
  unsigned int CharacterAtIndex;
  CFIndex v58;
  unsigned int v60;
  uint64_t v61;
  int v62;
  int v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  const __CFData *v67;
  __int128 *v68;
  __int128 *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  _OWORD *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  __int128 v82;
  unint64_t *v83;
  unint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  char *v87;
  __int128 v88;
  int64x2_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t *v93;
  unint64_t v94;
  _OWORD *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  __int128 *v102;
  __int128 v103;
  unint64_t *v104;
  unint64_t v105;
  _QWORD *v106;
  _QWORD *v107;
  char *v108;
  __int128 v109;
  int64x2_t v110;
  uint64_t v111;
  int v113;
  const char *v114;
  const char *v115;
  __int128 *v116;
  uint64_t v117;
  const __CFAllocator *allocator;
  __int128 **v119;
  int64x2_t v120;
  _QWORD v121[2];
  _OWORD v122[2];
  int v123;
  const __CFString *v124;
  UInt8 bytes[32];
  __int128 v126;
  __int128 v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v9 = *a1;
  v11 = a1 + 1;
  v10 = a1[1];
  v12 = 126 - 2 * __clz(v10 - v9);
  bytes[0] = a2;
  if (v10 == v9)
    v13 = 0;
  else
    v13 = v12;
  std::__introsort<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,false>(v9, v10, (char *)bytes, v13, 1, a6, a7, a8);
  memset(v122, 0, sizeof(v122));
  v123 = 1065353216;
  v120 = 0uLL;
  v121[0] = 0;
  v14 = *v11;
  v15 = *a1;
  v16 = (char *)*v11 - (char *)*a1;
  v119 = a1;
  if (*v11 != *a1)
  {
    if (v16 < 0)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    *(_QWORD *)&v126 = v121;
    v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v16 >> 4);
    v19 = (_QWORD *)v120.i64[1];
    v20 = (_QWORD *)v120.i64[0];
    if (v120.i64[1] == v120.i64[0])
    {
      v23 = vdupq_n_s64(v120.u64[1]);
      v21 = v17;
    }
    else
    {
      v21 = v17;
      do
      {
        v22 = *((_OWORD *)v19 - 1);
        v19 -= 2;
        *((_OWORD *)v21 - 1) = v22;
        v21 -= 16;
        *v19 = 0;
        v19[1] = 0;
      }
      while (v19 != v20);
      v23 = v120;
    }
    v120.i64[0] = (uint64_t)v21;
    v120.i64[1] = (uint64_t)v17;
    *(int64x2_t *)&bytes[8] = v23;
    v24 = v121[0];
    v121[0] = &v17[16 * v18];
    *(_QWORD *)&bytes[24] = v24;
    *(_QWORD *)bytes = v23.i64[0];
    std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)bytes);
    v15 = *a1;
    v14 = a1[1];
  }
  if (v15 != v14)
  {
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v114 = "_longCharForGenderPersonCategory";
    v115 = "false && \"An unsupported CEMEmojiGender member was supplied and does not have a corresponding person codepoint\"";
    v116 = v14;
    do
    {
      v25 = *(CEM::EmojiToken **)v15;
      v26 = (std::__shared_weak_count *)*((_QWORD *)v15 + 1);
      if (v26)
      {
        p_shared_owners = (unint64_t *)&v26->__shared_owners_;
        do
          v28 = __ldxr(p_shared_owners);
        while (__stxr(v28 + 1, p_shared_owners));
        v29 = CEM::EmojiToken::baseIndex(v25);
        do
          v30 = __ldaxr(p_shared_owners);
        while (__stlxr(v30 - 1, p_shared_owners));
        if (!v30)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      else
      {
        v29 = CEM::EmojiToken::baseIndex(v25);
      }
      v31 = *((_QWORD *)&v122[0] + 1);
      if (*((_QWORD *)&v122[0] + 1))
      {
        v32 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)v122 + 8));
        v32.i16[0] = vaddlv_u8(v32);
        v33 = v32.u32[0];
        if (v32.u32[0] > 1uLL)
        {
          v34 = v29;
          if (*((_QWORD *)&v122[0] + 1) <= v29)
            v34 = v29 % *((_QWORD *)&v122[0] + 1);
        }
        else
        {
          v34 = (DWORD2(v122[0]) - 1) & v29;
        }
        v35 = *(_QWORD **)(*(_QWORD *)&v122[0] + 8 * v34);
        if (v35)
        {
          v36 = (_QWORD *)*v35;
          if (*v35)
          {
            v117 = *((_QWORD *)&v122[0] + 1) - 1;
            do
            {
              v37 = v36[1];
              if (v37 == v29)
              {
                v38 = v36[2];
                v39 = (std::__shared_weak_count *)v36[3];
                if (v39)
                {
                  v40 = (unint64_t *)&v39->__shared_owners_;
                  do
                    v41 = __ldxr(v40);
                  while (__stxr(v41 + 1, v40));
                }
                v42 = *(CEM::EmojiToken **)v15;
                v43 = (std::__shared_weak_count *)*((_QWORD *)v15 + 1);
                if (v43)
                {
                  v44 = (unint64_t *)&v43->__shared_owners_;
                  do
                    v45 = __ldxr(v44);
                  while (__stxr(v45 + 1, v44));
                  v46 = *(unsigned __int16 *)(v38 + 22) == *((unsigned __int16 *)v42 + 11);
                  do
                    v47 = __ldaxr(v44);
                  while (__stlxr(v47 - 1, v44));
                  if (!v47)
                  {
                    ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
                    std::__shared_weak_count::__release_weak(v43);
                  }
                }
                else
                {
                  v46 = *(unsigned __int16 *)(v38 + 22) == *((unsigned __int16 *)v42 + 11);
                }
                if (v39)
                {
                  v48 = (unint64_t *)&v39->__shared_owners_;
                  do
                    v49 = __ldaxr(v48);
                  while (__stlxr(v49 - 1, v48));
                  if (!v49)
                  {
                    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
                    std::__shared_weak_count::__release_weak(v39);
                  }
                }
                if (v46)
                  goto LABEL_151;
              }
              else
              {
                if (v33 > 1)
                {
                  if (v37 >= v31)
                    v37 %= v31;
                }
                else
                {
                  v37 &= v117;
                }
                if (v37 != v34)
                  break;
              }
              v36 = (_QWORD *)*v36;
            }
            while (v36);
          }
        }
      }
      if (!*(_DWORD *)(*(_QWORD *)v15 + 28))
      {
        v91 = v120.i64[1];
        if (v120.i64[1] >= v121[0])
        {
          v96 = (v120.i64[1] - v120.i64[0]) >> 4;
          v97 = v96 + 1;
          if ((unint64_t)(v96 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v98 = v121[0] - v120.i64[0];
          if ((v121[0] - v120.i64[0]) >> 3 > v97)
            v97 = v98 >> 3;
          if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF0)
            v99 = 0xFFFFFFFFFFFFFFFLL;
          else
            v99 = v97;
          *(_QWORD *)&v126 = v121;
          v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v99);
          v102 = (__int128 *)&v100[16 * v96];
          v103 = *v15;
          *v102 = *v15;
          if (*((_QWORD *)&v103 + 1))
          {
            v104 = (unint64_t *)(*((_QWORD *)&v103 + 1) + 8);
            do
              v105 = __ldxr(v104);
            while (__stxr(v105 + 1, v104));
          }
          v106 = (_QWORD *)v120.i64[1];
          v107 = (_QWORD *)v120.i64[0];
          if (v120.i64[1] == v120.i64[0])
          {
            v110 = vdupq_n_s64(v120.u64[1]);
            v108 = &v100[16 * v96];
          }
          else
          {
            v108 = &v100[16 * v96];
            do
            {
              v109 = *((_OWORD *)v106 - 1);
              v106 -= 2;
              *((_OWORD *)v108 - 1) = v109;
              v108 -= 16;
              *v106 = 0;
              v106[1] = 0;
            }
            while (v106 != v107);
            v110 = v120;
          }
          v95 = v102 + 1;
          v120.i64[0] = (uint64_t)v108;
          v120.i64[1] = (uint64_t)(v102 + 1);
          *(int64x2_t *)&bytes[8] = v110;
          v111 = v121[0];
          v121[0] = &v100[16 * v101];
          *(_QWORD *)&bytes[24] = v111;
          *(_QWORD *)bytes = v110.i64[0];
          std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)bytes);
        }
        else
        {
          *(_QWORD *)v120.i64[1] = *(_QWORD *)v15;
          v92 = *((_QWORD *)v15 + 1);
          *(_QWORD *)(v91 + 8) = v92;
          if (v92)
          {
            v93 = (unint64_t *)(v92 + 8);
            do
              v94 = __ldxr(v93);
            while (__stxr(v94 + 1, v93));
          }
          v95 = (_OWORD *)(v91 + 16);
        }
        v120.i64[1] = (uint64_t)v95;
        std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::insert[abi:ne180100]((uint64_t)v122, (uint64_t)v15);
        goto LABEL_151;
      }
      for (i = 0; i != 4; ++i)
      {
        v51 = kDefaultInclusiveWomanManSortOrdering[i];
        if (!v51)
          continue;
        v52 = *(const __CFString **)(*(_QWORD *)v15 + 8);
        if (CFStringGetLength(v52) > 16)
        {
          v53 = v52;
          goto LABEL_99;
        }
        v126 = 0u;
        v127 = 0u;
        memset(bytes, 0, sizeof(bytes));
        Length = CFStringGetLength(v52);
        if (Length < 1)
          goto LABEL_81;
        v55 = 0;
        v56 = 0;
        do
        {
          CharacterAtIndex = CFStringGetCharacterAtIndex(v52, v55);
          v58 = v55 + 1;
          if (CharacterAtIndex >> 10 == 54 && v58 < Length)
          {
            v60 = CFStringGetCharacterAtIndex(v52, v55 + 1);
            if (v60 >> 10 != 55)
            {
              ++v55;
              continue;
            }
            CharacterAtIndex = v60 + (CharacterAtIndex << 10) - 56613888;
          }
          else
          {
            v58 = v55;
          }
          *(_DWORD *)&bytes[4 * v56++] = CharacterAtIndex;
          v55 = v58 + 1;
        }
        while (v55 < Length && v55 != 16);
        if (v55 < Length)
          v61 = 0;
        else
          v61 = v56;
        if ((*(_DWORD *)bytes - 128104) < 2 || *(_DWORD *)bytes == 129489)
        {
          if (v51 <= 3)
          {
            *(_DWORD *)bytes = dword_18D747A14[v51 - 1];
            goto LABEL_94;
          }
          v113 = 39;
LABEL_156:
          __assert_rtn(v114, "CEMGenderFactory.cpp", v113, v115);
        }
LABEL_81:
        v62 = *(_DWORD *)&bytes[4];
        v61 = 1;
        if (*(_DWORD *)&bytes[4] == 65039)
          v61 = 2;
        if (v51 != 3)
        {
          *(_DWORD *)&bytes[4 * v61] = 8205;
          if (v51 == 1)
          {
            v63 = 9794;
          }
          else
          {
            if (v51 != 2)
            {
              v113 = 54;
              v114 = "_longCharForGenderLegacyEncoding";
              v115 = "false && \"An unsupported CEMEmojiGender member was supplied and does not have a corresponding gender symbol\"";
              goto LABEL_156;
            }
            v63 = 9792;
          }
          v64 = v62 == 65039;
          v65 = 8;
          if (v64)
            v65 = 12;
          *(_DWORD *)((unint64_t)bytes | v65) = v63;
          v66 = 16;
          if (!v64)
            v66 = 12;
          *(_DWORD *)&bytes[v66] = 65039;
          v61 = 4;
          if (v64)
            v61 = 5;
        }
LABEL_94:
        v67 = CFDataCreate(allocator, bytes, 4 * v61);
        v53 = CFStringCreateFromExternalRepresentation(allocator, v67, 0x1C000100u);
        if (!v53)
        {
          v53 = (const __CFString *)CFRetain(v52);
          if (!v67)
            goto LABEL_99;
LABEL_98:
          CFRelease(v67);
          goto LABEL_99;
        }
        if (v67)
          goto LABEL_98;
LABEL_99:
        v124 = v53;
        if (v53)
        {
          v69 = *v119;
          v68 = v119[1];
          if (*v119 == v68)
            goto LABEL_127;
          while (CFStringCompare(*(CFStringRef *)(*(_QWORD *)v69 + 8), v53, 0))
          {
            if (++v69 == v68)
            {
              v69 = v68;
              break;
            }
          }
          if (v69 != v119[1])
          {
            v70 = v120.i64[1];
            if (v120.i64[1] >= v121[0])
            {
              v75 = (v120.i64[1] - v120.i64[0]) >> 4;
              v76 = v75 + 1;
              if ((unint64_t)(v75 + 1) >> 60)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              v77 = v121[0] - v120.i64[0];
              if ((v121[0] - v120.i64[0]) >> 3 > v76)
                v76 = v77 >> 3;
              if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF0)
                v78 = 0xFFFFFFFFFFFFFFFLL;
              else
                v78 = v76;
              *(_QWORD *)&v126 = v121;
              v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v78);
              v81 = &v79[16 * v75];
              v82 = *v69;
              *(_OWORD *)v81 = *v69;
              if (*((_QWORD *)&v82 + 1))
              {
                v83 = (unint64_t *)(*((_QWORD *)&v82 + 1) + 8);
                do
                  v84 = __ldxr(v83);
                while (__stxr(v84 + 1, v83));
              }
              v85 = (_QWORD *)v120.i64[1];
              v86 = (_QWORD *)v120.i64[0];
              if (v120.i64[1] == v120.i64[0])
              {
                v89 = vdupq_n_s64(v120.u64[1]);
                v87 = &v79[16 * v75];
              }
              else
              {
                v87 = &v79[16 * v75];
                do
                {
                  v88 = *((_OWORD *)v85 - 1);
                  v85 -= 2;
                  *((_OWORD *)v87 - 1) = v88;
                  v87 -= 16;
                  *v85 = 0;
                  v85[1] = 0;
                }
                while (v85 != v86);
                v89 = v120;
              }
              v74 = v81 + 16;
              v120.i64[0] = (uint64_t)v87;
              v120.i64[1] = (uint64_t)(v81 + 16);
              *(int64x2_t *)&bytes[8] = v89;
              v90 = v121[0];
              v121[0] = &v79[16 * v80];
              *(_QWORD *)&bytes[24] = v90;
              *(_QWORD *)bytes = v89.i64[0];
              std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)bytes);
            }
            else
            {
              *(_QWORD *)v120.i64[1] = *(_QWORD *)v69;
              v71 = *((_QWORD *)v69 + 1);
              *(_QWORD *)(v70 + 8) = v71;
              if (v71)
              {
                v72 = (unint64_t *)(v71 + 8);
                do
                  v73 = __ldxr(v72);
                while (__stxr(v73 + 1, v72));
              }
              v74 = (_OWORD *)(v70 + 16);
            }
            v120.i64[1] = (uint64_t)v74;
            std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::insert[abi:ne180100]((uint64_t)v122, (uint64_t)v69);
            v53 = v124;
          }
          if (v53)
LABEL_127:
            CFRelease(v53);
        }
      }
LABEL_151:
      ++v15;
    }
    while (v15 != v116);
  }
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__vdeallocate((void **)v119);
  *(int64x2_t *)v119 = v120;
  v119[2] = (__int128 *)v121[0];
  v121[0] = 0;
  v120 = 0uLL;
  *(_QWORD *)bytes = &v120;
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)bytes);
  return std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::~unordered_set[abi:ne180100]((uint64_t)v122);
}

void sub_18D73E998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  _Unwind_Resume(exception_object);
}

void std::__introsort<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,false>(__int128 *a1, __int128 *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  __int128 *v12;
  __int128 *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  unint64_t v17;
  __int128 *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  char *v42;
  int v43;
  __int128 *v44;
  __int128 *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  int v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  int v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  int v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  int v66;
  char *v67;
  __int128 *v68;
  __int128 *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  unsigned int v73;
  unsigned int v74;
  uint64_t v75;
  int v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  int v80;
  char *v81;
  uint64_t v82;
  int v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  int v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  BOOL v101;
  BOOL v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unsigned int v110;
  unsigned int v111;
  uint64_t v112;
  int v113;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  int v117;
  char *v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  int v122;
  uint64_t v123;
  int v124;
  char *v125;
  uint64_t v126;
  unint64_t v127;
  int v128;
  char *v129;
  unsigned int v130;
  uint64_t v131;
  int v132;
  char *v133;
  uint64_t v134;
  unint64_t v135;
  int v136;
  char *v137;
  unsigned int v138;
  uint64_t v139;
  int v140;
  char *v141;
  uint64_t v142;
  unint64_t v143;
  int v144;
  char *v145;
  __int128 *v146;
  unsigned int v147;
  uint64_t v148;
  int v149;
  char *v150;
  uint64_t v151;
  unint64_t v152;
  int v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  unsigned int v158;
  unsigned int v159;
  unsigned int v160;
  uint64_t v161;
  int v162;
  char *v163;
  uint64_t v164;
  unint64_t v165;
  int v166;
  char *v167;
  uint64_t v168;
  int v169;
  char *v170;
  uint64_t v171;
  unint64_t v172;
  int v173;
  char *v174;
  unsigned int v175;
  std::__shared_weak_count *v176;
  unint64_t *v177;
  unint64_t v178;
  uint64_t v179;
  unsigned int v180;
  uint64_t v181;
  unsigned int v182;
  __int128 *v183;
  __int128 *v184;
  __int128 *v185;
  unsigned int v186;
  unsigned int v187;
  uint64_t v188;
  int v189;
  char *v190;
  uint64_t v191;
  unint64_t v192;
  int v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  unsigned int v197;
  unsigned int v198;
  uint64_t v199;
  int v200;
  char *v201;
  uint64_t v202;
  unint64_t v203;
  int v204;
  char *v205;
  std::__shared_weak_count *v206;
  unint64_t *v207;
  unint64_t v208;
  int64_t v209;
  int64_t v210;
  int64_t v211;
  uint64_t v212;
  __int128 *v213;
  __int128 *v214;
  unsigned int v215;
  unsigned int v216;
  uint64_t v217;
  int v218;
  char *v219;
  uint64_t v220;
  unint64_t v221;
  int v222;
  char *v223;
  __int128 *v224;
  unsigned int v225;
  unsigned int v226;
  uint64_t v227;
  int v228;
  char *v229;
  uint64_t v230;
  unint64_t v231;
  int v232;
  char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  __int128 *v237;
  unsigned int v238;
  unsigned int v239;
  uint64_t v240;
  int v241;
  char *v242;
  uint64_t v243;
  unint64_t v244;
  int v245;
  char *v246;
  unsigned int v247;
  unsigned int v248;
  uint64_t v249;
  int v250;
  char *v251;
  uint64_t v252;
  unint64_t v253;
  int v254;
  char *v255;
  std::__shared_weak_count *v256;
  unint64_t *v257;
  unint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  unsigned int v266;
  unsigned int v267;
  uint64_t v268;
  int v269;
  char *v270;
  uint64_t v271;
  unint64_t v272;
  int v273;
  char *v274;
  __int128 *v275;
  uint64_t v277;
  __n128 v278;
  unint64_t v279;
  __int128 *v280;
  unsigned int v281;
  unsigned int v282;
  std::__shared_weak_count *v283;
  unint64_t *v284;
  unint64_t v285;
  uint64_t v287;
  int v288;
  char *v289;
  uint64_t v290;
  unint64_t v291;
  int v292;
  char *v293;
  uint64_t v294;
  unsigned int v295;
  unsigned int v296;
  uint64_t v297;
  int v298;
  char *v299;
  uint64_t v300;
  unint64_t v301;
  int v302;
  char *v303;
  std::__shared_weak_count *v304;
  unint64_t *v305;
  unint64_t v306;
  uint64_t v307;
  int v308;
  char *v309;
  __int128 *v310;
  __int128 *v311;
  unsigned int v312;
  unsigned int v313;
  uint64_t v314;
  int v315;
  char *v316;
  uint64_t v317;
  unint64_t v318;
  int v319;
  char *v320;
  uint64_t v321;
  uint64_t v322;
  unsigned int v323;
  unsigned int v324;
  uint64_t v325;
  int v326;
  char *v327;
  uint64_t v328;
  unint64_t v329;
  int v330;
  char *v331;
  std::__shared_weak_count *v332;
  unint64_t *v333;
  unint64_t v334;
  uint64_t v335;
  unint64_t v336;
  int v337;
  char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  _QWORD *v342;
  uint64_t v343;
  __int128 *v344;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  uint64_t v349;

  v8 = a5;
LABEL_2:
  v12 = a2;
  v344 = a2 - 1;
  v340 = (uint64_t)(a2 - 3);
  v13 = a1;
  while (2)
  {
    a1 = v13;
    v14 = (char *)v12 - (char *)v13;
    v15 = v12 - v13;
    v16 = xmmword_18D745C50;
    switch(v15)
    {
      case 0:
      case 1:
        return;
      case 2:
        v179 = *(_QWORD *)v344;
        v180 = *(unsigned __int16 *)(*(_QWORD *)v344 + 22);
        if (v180 - 1295 <= 4)
        {
          v181 = *(_QWORD *)a1;
          v182 = *(unsigned __int16 *)(*(_QWORD *)a1 + 22);
          if (v182 - 1295 <= 4)
          {
            if (v182 >= v180)
              return;
            goto LABEL_506;
          }
        }
        if (!*a3)
          return;
        v307 = 0;
        v308 = *(_DWORD *)(v179 + 28);
        v348 = xmmword_18D745C50;
        v309 = (char *)&v349;
        while (*((_DWORD *)&v348 + v307) != v308)
        {
          if (++v307 == 4)
            goto LABEL_499;
        }
        v309 = (char *)&v348 + 4 * v307;
LABEL_499:
        v335 = 0;
        v336 = (v309 - (char *)&v348) >> 2;
        v337 = *(_DWORD *)(*(_QWORD *)a1 + 28);
        v348 = xmmword_18D745C50;
        v338 = (char *)&v349;
        while (*((_DWORD *)&v348 + v335) != v337)
        {
          if (++v335 == 4)
            goto LABEL_504;
        }
        v338 = (char *)&v348 + 4 * v335;
LABEL_504:
        if (v336 >= (v338 - (char *)&v348) >> 2)
          return;
        v181 = *(_QWORD *)a1;
        v179 = *(_QWORD *)v344;
LABEL_506:
        *(_QWORD *)a1 = v179;
        *((_QWORD *)a2 - 2) = v181;
        v339 = *((_QWORD *)a1 + 1);
        *((_QWORD *)a1 + 1) = *((_QWORD *)a2 - 1);
        *((_QWORD *)a2 - 1) = v339;
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (_QWORD *)a1 + 2, v344, *a3, a5, a6, a7, a8, v340);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (_QWORD *)a1 + 2, (_QWORD *)a1 + 4, v344, a3, a6, a7, a8);
        return;
      case 5:
        std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,0>(a1, (_QWORD *)a1 + 2, (_QWORD *)a1 + 4, (_QWORD *)a1 + 6, v344, a3, a7, a8);
        return;
      default:
        if (v14 <= 383)
        {
          if ((v8 & 1) != 0)
          {
            if (a1 == v12)
              return;
            v183 = a1 + 1;
            if (a1 + 1 == a2)
              return;
            v184 = a1;
            while (1)
            {
              v185 = v184;
              v184 = v183;
              v186 = *(unsigned __int16 *)(*((_QWORD *)v185 + 2) + 22);
              if (v186 - 1295 > 4)
                break;
              v187 = *(unsigned __int16 *)(*(_QWORD *)v185 + 22);
              if (v187 - 1295 > 4)
                break;
              if (v187 < v186)
                goto LABEL_272;
LABEL_297:
              v183 = v184 + 1;
              if (v184 + 1 == a2)
                return;
            }
            if (!*a3)
              goto LABEL_297;
            v188 = 0;
            v189 = *(_DWORD *)(*(_QWORD *)v184 + 28);
            v348 = v16;
            while (*((_DWORD *)&v348 + v188) != v189)
            {
              if (++v188 == 4)
              {
                v190 = (char *)&v349;
                goto LABEL_266;
              }
            }
            v190 = (char *)&v348 + 4 * v188;
LABEL_266:
            v191 = 0;
            v192 = (v190 - (char *)&v348) >> 2;
            v193 = *(_DWORD *)(*(_QWORD *)v185 + 28);
            v348 = v16;
            while (*((_DWORD *)&v348 + v191) != v193)
            {
              if (++v191 == 4)
              {
                v194 = (char *)&v349;
                goto LABEL_271;
              }
            }
            v194 = (char *)&v348 + 4 * v191;
LABEL_271:
            if (v192 >= (v194 - (char *)&v348) >> 2)
              goto LABEL_297;
LABEL_272:
            v347 = *v184;
            *(_QWORD *)v184 = 0;
            *((_QWORD *)v184 + 1) = 0;
            v195 = (uint64_t)v184;
            while (1)
            {
              v196 = v195;
              v195 = (uint64_t)v185;
              std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v196, v185);
              if ((__int128 *)v195 == a1)
                break;
              v185 = (__int128 *)(v195 - 16);
              v197 = *(unsigned __int16 *)(v347 + 22);
              if (v197 - 1295 > 4 || (v198 = *(unsigned __int16 *)(*(_QWORD *)v185 + 22), v198 - 1295 > 4))
              {
                if (!*a3)
                  goto LABEL_292;
                v199 = 0;
                v200 = *(_DWORD *)(v347 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v199) != v200)
                {
                  if (++v199 == 4)
                  {
                    v201 = (char *)&v349;
                    goto LABEL_284;
                  }
                }
                v201 = (char *)&v348 + 4 * v199;
LABEL_284:
                v202 = 0;
                v203 = (v201 - (char *)&v348) >> 2;
                v204 = *(_DWORD *)(*(_QWORD *)v185 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v202) != v204)
                {
                  if (++v202 == 4)
                  {
                    v205 = (char *)&v349;
                    goto LABEL_289;
                  }
                }
                v205 = (char *)&v348 + 4 * v202;
LABEL_289:
                if (v203 >= (v205 - (char *)&v348) >> 2)
                  goto LABEL_292;
              }
              else if (v198 >= v197)
              {
                goto LABEL_292;
              }
            }
            v195 = (uint64_t)a1;
LABEL_292:
            std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v195, &v347);
            v206 = (std::__shared_weak_count *)*((_QWORD *)&v347 + 1);
            v16 = xmmword_18D745C50;
            if (*((_QWORD *)&v347 + 1))
            {
              v207 = (unint64_t *)(*((_QWORD *)&v347 + 1) + 8);
              do
                v208 = __ldaxr(v207);
              while (__stlxr(v208 - 1, v207));
              if (!v208)
              {
                ((void (*)(std::__shared_weak_count *, __n128))v206->__on_zero_shared)(v206, xmmword_18D745C50);
                std::__shared_weak_count::__release_weak(v206);
                v16 = xmmword_18D745C50;
              }
            }
            goto LABEL_297;
          }
          if (a1 == v12)
            return;
          v310 = a1 + 1;
          if (a1 + 1 == a2)
            return;
          while (1)
          {
            v311 = a1;
            a1 = v310;
            v312 = *(unsigned __int16 *)(*((_QWORD *)v311 + 2) + 22);
            if (v312 - 1295 > 4)
              break;
            v313 = *(unsigned __int16 *)(*(_QWORD *)v311 + 22);
            if (v313 - 1295 > 4)
              break;
            if (v313 < v312)
              goto LABEL_473;
LABEL_496:
            v310 = a1 + 1;
            if (a1 + 1 == a2)
              return;
          }
          if (!*a3)
            goto LABEL_496;
          v314 = 0;
          v315 = *(_DWORD *)(*(_QWORD *)a1 + 28);
          v348 = v16;
          while (*((_DWORD *)&v348 + v314) != v315)
          {
            if (++v314 == 4)
            {
              v316 = (char *)&v349;
              goto LABEL_467;
            }
          }
          v316 = (char *)&v348 + 4 * v314;
LABEL_467:
          v317 = 0;
          v318 = (v316 - (char *)&v348) >> 2;
          v319 = *(_DWORD *)(*(_QWORD *)v311 + 28);
          v348 = v16;
          while (*((_DWORD *)&v348 + v317) != v319)
          {
            if (++v317 == 4)
            {
              v320 = (char *)&v349;
              goto LABEL_472;
            }
          }
          v320 = (char *)&v348 + 4 * v317;
LABEL_472:
          if (v318 >= (v320 - (char *)&v348) >> 2)
            goto LABEL_496;
LABEL_473:
          v347 = *a1;
          *(_QWORD *)a1 = 0;
          *((_QWORD *)a1 + 1) = 0;
          v321 = (uint64_t)a1;
          do
          {
            while (1)
            {
              v322 = v321;
              v321 = (uint64_t)v311;
              std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v322, v311);
              v311 = (__int128 *)(v321 - 16);
              v323 = *(unsigned __int16 *)(v347 + 22);
              if (v323 - 1295 > 4)
                break;
              v324 = *(unsigned __int16 *)(*(_QWORD *)v311 + 22);
              if (v324 - 1295 > 4)
                break;
              if (v324 >= v323)
                goto LABEL_490;
            }
            if (!*a3)
              break;
            v325 = 0;
            v326 = *(_DWORD *)(v347 + 28);
            v348 = xmmword_18D745C50;
            while (*((_DWORD *)&v348 + v325) != v326)
            {
              if (++v325 == 4)
              {
                v327 = (char *)&v349;
                goto LABEL_484;
              }
            }
            v327 = (char *)&v348 + 4 * v325;
LABEL_484:
            v328 = 0;
            v329 = (v327 - (char *)&v348) >> 2;
            v330 = *(_DWORD *)(*(_QWORD *)v311 + 28);
            v348 = xmmword_18D745C50;
            while (*((_DWORD *)&v348 + v328) != v330)
            {
              if (++v328 == 4)
              {
                v331 = (char *)&v349;
                goto LABEL_489;
              }
            }
            v331 = (char *)&v348 + 4 * v328;
LABEL_489:
            ;
          }
          while (v329 < (v331 - (char *)&v348) >> 2);
LABEL_490:
          std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v321, &v347);
          v332 = (std::__shared_weak_count *)*((_QWORD *)&v347 + 1);
          if (*((_QWORD *)&v347 + 1))
          {
            v333 = (unint64_t *)(*((_QWORD *)&v347 + 1) + 8);
            do
              v334 = __ldaxr(v333);
            while (__stlxr(v334 - 1, v333));
            if (!v334)
            {
              ((void (*)(std::__shared_weak_count *))v332->__on_zero_shared)(v332);
              std::__shared_weak_count::__release_weak(v332);
            }
          }
          v16 = xmmword_18D745C50;
          goto LABEL_496;
        }
        if (!a4)
        {
          if (a1 == v12)
            return;
          v209 = (unint64_t)(v15 - 2) >> 1;
          v210 = v209;
          while (1)
          {
            v211 = v210;
            if (v209 < v210)
              goto LABEL_378;
            v212 = (2 * v210) | 1;
            v213 = &a1[v212];
            if (2 * v211 + 2 < v15)
            {
              v214 = v213 + 1;
              v215 = *(unsigned __int16 *)(*(_QWORD *)v213 + 22);
              if (v215 - 1295 <= 4)
              {
                v216 = *(unsigned __int16 *)(*(_QWORD *)v214 + 22);
                if (v216 - 1295 <= 4)
                {
                  if (v216 >= v215)
                    goto LABEL_320;
LABEL_319:
                  ++v213;
                  v212 = 2 * v211 + 2;
                  goto LABEL_320;
                }
              }
              if (*a3)
              {
                v217 = 0;
                v218 = *(_DWORD *)(*(_QWORD *)v213 + 28);
                v348 = v16;
                do
                {
                  if (*((_DWORD *)&v348 + v217) == v218)
                  {
                    v219 = (char *)&v348 + 4 * v217;
                    goto LABEL_313;
                  }
                  ++v217;
                }
                while (v217 != 4);
                v219 = (char *)&v349;
LABEL_313:
                v220 = 0;
                v221 = (v219 - (char *)&v348) >> 2;
                v222 = *(_DWORD *)(*(_QWORD *)v214 + 28);
                v348 = v16;
                while (*((_DWORD *)&v348 + v220) != v222)
                {
                  if (++v220 == 4)
                  {
                    v223 = (char *)&v349;
                    goto LABEL_318;
                  }
                }
                v223 = (char *)&v348 + 4 * v220;
LABEL_318:
                if (v221 < (v223 - (char *)&v348) >> 2)
                  goto LABEL_319;
              }
            }
LABEL_320:
            v224 = &a1[v211];
            v225 = *(unsigned __int16 *)(*(_QWORD *)v213 + 22);
            if (v225 - 1295 > 4 || (v226 = *(unsigned __int16 *)(*(_QWORD *)v224 + 22), v226 - 1295 > 4))
            {
              if (*a3)
              {
                v227 = 0;
                v228 = *(_DWORD *)(*(_QWORD *)v213 + 28);
                v348 = v16;
                do
                {
                  if (*((_DWORD *)&v348 + v227) == v228)
                  {
                    v229 = (char *)&v348 + 4 * v227;
                    goto LABEL_330;
                  }
                  ++v227;
                }
                while (v227 != 4);
                v229 = (char *)&v349;
LABEL_330:
                v230 = 0;
                v231 = (v229 - (char *)&v348) >> 2;
                v232 = *(_DWORD *)(*(_QWORD *)v224 + 28);
                v348 = v16;
                do
                {
                  if (*((_DWORD *)&v348 + v230) == v232)
                  {
                    v233 = (char *)&v348 + 4 * v230;
                    goto LABEL_335;
                  }
                  ++v230;
                }
                while (v230 != 4);
                v233 = (char *)&v349;
LABEL_335:
                if (v231 < (v233 - (char *)&v348) >> 2)
                  goto LABEL_378;
              }
            }
            else if (v226 < v225)
            {
              goto LABEL_378;
            }
            v347 = *v224;
            *(_QWORD *)v224 = 0;
            *((_QWORD *)v224 + 1) = 0;
            while (1)
            {
              v234 = (uint64_t)v213;
              std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100]((uint64_t)v224, v213);
              if (v209 < v212)
                break;
              v235 = 2 * v212;
              v212 = (2 * v212) | 1;
              v213 = &a1[v212];
              v236 = v235 + 2;
              if (v236 >= v15)
                goto LABEL_356;
              v237 = v213 + 1;
              v238 = *(unsigned __int16 *)(*(_QWORD *)v213 + 22);
              if (v238 - 1295 > 4 || (v239 = *(unsigned __int16 *)(*(_QWORD *)v237 + 22), v239 - 1295 > 4))
              {
                if (!*a3)
                  goto LABEL_356;
                v240 = 0;
                v241 = *(_DWORD *)(*(_QWORD *)v213 + 28);
                v348 = xmmword_18D745C50;
                do
                {
                  if (*((_DWORD *)&v348 + v240) == v241)
                  {
                    v242 = (char *)&v348 + 4 * v240;
                    goto LABEL_349;
                  }
                  ++v240;
                }
                while (v240 != 4);
                v242 = (char *)&v349;
LABEL_349:
                v243 = 0;
                v244 = (v242 - (char *)&v348) >> 2;
                v245 = *(_DWORD *)(*(_QWORD *)v237 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v243) != v245)
                {
                  if (++v243 == 4)
                  {
                    v246 = (char *)&v349;
                    goto LABEL_354;
                  }
                }
                v246 = (char *)&v348 + 4 * v243;
LABEL_354:
                if (v244 >= (v246 - (char *)&v348) >> 2)
                  goto LABEL_356;
LABEL_355:
                ++v213;
                v212 = v236;
                goto LABEL_356;
              }
              if (v239 < v238)
                goto LABEL_355;
LABEL_356:
              v247 = *(unsigned __int16 *)(*(_QWORD *)v213 + 22);
              if (v247 - 1295 > 4 || (v248 = *(unsigned __int16 *)(v347 + 22), v248 - 1295 > 4))
              {
                v224 = (__int128 *)v234;
                if (*a3)
                {
                  v249 = 0;
                  v250 = *(_DWORD *)(*(_QWORD *)v213 + 28);
                  v348 = xmmword_18D745C50;
                  do
                  {
                    if (*((_DWORD *)&v348 + v249) == v250)
                    {
                      v251 = (char *)&v348 + 4 * v249;
                      goto LABEL_366;
                    }
                    ++v249;
                  }
                  while (v249 != 4);
                  v251 = (char *)&v349;
LABEL_366:
                  v252 = 0;
                  v253 = (v251 - (char *)&v348) >> 2;
                  v254 = *(_DWORD *)(v347 + 28);
                  v348 = xmmword_18D745C50;
                  while (*((_DWORD *)&v348 + v252) != v254)
                  {
                    if (++v252 == 4)
                    {
                      v255 = (char *)&v349;
                      goto LABEL_371;
                    }
                  }
                  v255 = (char *)&v348 + 4 * v252;
LABEL_371:
                  v224 = (__int128 *)v234;
                  if (v253 < (v255 - (char *)&v348) >> 2)
                    break;
                }
              }
              else
              {
                v224 = (__int128 *)v234;
                if (v248 < v247)
                  break;
              }
            }
            std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v234, &v347);
            v256 = (std::__shared_weak_count *)*((_QWORD *)&v347 + 1);
            if (*((_QWORD *)&v347 + 1))
            {
              v257 = (unint64_t *)(*((_QWORD *)&v347 + 1) + 8);
              do
                v258 = __ldaxr(v257);
              while (__stlxr(v258 - 1, v257));
              if (!v258)
              {
                ((void (*)(std::__shared_weak_count *))v256->__on_zero_shared)(v256);
                std::__shared_weak_count::__release_weak(v256);
              }
            }
            v16 = xmmword_18D745C50;
LABEL_378:
            v210 = v211 - 1;
            if (!v211)
            {
              v259 = (unint64_t)v14 >> 4;
              while (1)
              {
                v260 = 0;
                v346 = *a1;
                *(_QWORD *)a1 = 0;
                *((_QWORD *)a1 + 1) = 0;
                v261 = (uint64_t)a1;
                do
                {
                  v262 = v261;
                  v261 += 16 * v260 + 16;
                  v263 = 2 * v260;
                  v260 = (2 * v260) | 1;
                  v264 = v263 + 2;
                  if (v264 >= v259)
                    goto LABEL_399;
                  v265 = v261 + 16;
                  v266 = *(unsigned __int16 *)(*(_QWORD *)v261 + 22);
                  if (v266 - 1295 > 4 || (v267 = *(unsigned __int16 *)(*(_QWORD *)v265 + 22), v267 - 1295 > 4))
                  {
                    if (*a3)
                    {
                      v268 = 0;
                      v269 = *(_DWORD *)(*(_QWORD *)v261 + 28);
                      v348 = xmmword_18D745C50;
                      while (*((_DWORD *)&v348 + v268) != v269)
                      {
                        if (++v268 == 4)
                        {
                          v270 = (char *)&v349;
                          goto LABEL_392;
                        }
                      }
                      v270 = (char *)&v348 + 4 * v268;
LABEL_392:
                      v271 = 0;
                      v272 = (v270 - (char *)&v348) >> 2;
                      v273 = *(_DWORD *)(*(_QWORD *)v265 + 28);
                      v348 = xmmword_18D745C50;
                      while (*((_DWORD *)&v348 + v271) != v273)
                      {
                        if (++v271 == 4)
                        {
                          v274 = (char *)&v349;
                          goto LABEL_397;
                        }
                      }
                      v274 = (char *)&v348 + 4 * v271;
LABEL_397:
                      if (v272 < (v274 - (char *)&v348) >> 2)
                      {
LABEL_398:
                        v261 += 16;
                        v260 = v264;
                      }
                    }
                  }
                  else if (v267 < v266)
                  {
                    goto LABEL_398;
                  }
LABEL_399:
                  std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v262, (__int128 *)v261);
                }
                while (v260 <= (uint64_t)((unint64_t)(v259 - 2) >> 1));
                v275 = a2 - 1;
                if (v261 == (_QWORD)--a2)
                {
                  std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v261, &v346);
                }
                else
                {
                  std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v261, v275);
                  std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100]((uint64_t)v275, &v346);
                  v277 = v261 - (_QWORD)a1 + 16;
                  v278 = (__n128)xmmword_18D745C50;
                  if (v277 >= 17)
                  {
                    v279 = (((unint64_t)v277 >> 4) - 2) >> 1;
                    v280 = &a1[v279];
                    v281 = *(unsigned __int16 *)(*(_QWORD *)v280 + 22);
                    if (v281 - 1295 > 4 || (v282 = *(unsigned __int16 *)(*(_QWORD *)v261 + 22), v282 - 1295 > 4))
                    {
                      if (*a3)
                      {
                        v287 = 0;
                        v288 = *(_DWORD *)(*(_QWORD *)v280 + 28);
                        v348 = xmmword_18D745C50;
                        while (*((_DWORD *)&v348 + v287) != v288)
                        {
                          if (++v287 == 4)
                          {
                            v289 = (char *)&v349;
                            goto LABEL_421;
                          }
                        }
                        v289 = (char *)&v348 + 4 * v287;
LABEL_421:
                        v290 = 0;
                        v291 = (v289 - (char *)&v348) >> 2;
                        v292 = *(_DWORD *)(*(_QWORD *)v261 + 28);
                        v348 = xmmword_18D745C50;
                        while (*((_DWORD *)&v348 + v290) != v292)
                        {
                          if (++v290 == 4)
                          {
                            v293 = (char *)&v349;
                            goto LABEL_426;
                          }
                        }
                        v293 = (char *)&v348 + 4 * v290;
LABEL_426:
                        if (v291 < (v293 - (char *)&v348) >> 2)
                        {
LABEL_427:
                          v347 = *(_OWORD *)v261;
                          *(_QWORD *)v261 = 0;
                          *(_QWORD *)(v261 + 8) = 0;
                          while (1)
                          {
                            v294 = (uint64_t)v280;
                            std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v261, v280);
                            if (!v279)
                              break;
                            v279 = (v279 - 1) >> 1;
                            v280 = &a1[v279];
                            v295 = *(unsigned __int16 *)(*(_QWORD *)v280 + 22);
                            if (v295 - 1295 > 4 || (v296 = *(unsigned __int16 *)(v347 + 22), v296 - 1295 > 4))
                            {
                              if (!*a3)
                                break;
                              v297 = 0;
                              v298 = *(_DWORD *)(*(_QWORD *)v280 + 28);
                              v348 = xmmword_18D745C50;
                              while (*((_DWORD *)&v348 + v297) != v298)
                              {
                                if (++v297 == 4)
                                {
                                  v299 = (char *)&v349;
                                  goto LABEL_439;
                                }
                              }
                              v299 = (char *)&v348 + 4 * v297;
LABEL_439:
                              v300 = 0;
                              v301 = (v299 - (char *)&v348) >> 2;
                              v302 = *(_DWORD *)(v347 + 28);
                              v348 = xmmword_18D745C50;
                              while (*((_DWORD *)&v348 + v300) != v302)
                              {
                                if (++v300 == 4)
                                {
                                  v303 = (char *)&v349;
                                  goto LABEL_444;
                                }
                              }
                              v303 = (char *)&v348 + 4 * v300;
LABEL_444:
                              v261 = v294;
                              if (v301 >= (v303 - (char *)&v348) >> 2)
                                break;
                            }
                            else
                            {
                              v261 = v294;
                              if (v296 >= v295)
                                break;
                            }
                          }
                          std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v294, &v347);
                          v304 = (std::__shared_weak_count *)*((_QWORD *)&v347 + 1);
                          if (*((_QWORD *)&v347 + 1))
                          {
                            v305 = (unint64_t *)(*((_QWORD *)&v347 + 1) + 8);
                            do
                              v306 = __ldaxr(v305);
                            while (__stlxr(v306 - 1, v305));
                            if (!v306)
                            {
                              ((void (*)(std::__shared_weak_count *))v304->__on_zero_shared)(v304);
                              std::__shared_weak_count::__release_weak(v304);
                            }
                          }
                        }
                      }
                    }
                    else if (v282 < v281)
                    {
                      goto LABEL_427;
                    }
                  }
                }
                v283 = (std::__shared_weak_count *)*((_QWORD *)&v346 + 1);
                if (*((_QWORD *)&v346 + 1))
                {
                  v284 = (unint64_t *)(*((_QWORD *)&v346 + 1) + 8);
                  do
                    v285 = __ldaxr(v284);
                  while (__stlxr(v285 - 1, v284));
                  if (!v285)
                  {
                    ((void (*)(std::__shared_weak_count *, __n128))v283->__on_zero_shared)(v283, v278);
                    std::__shared_weak_count::__release_weak(v283);
                  }
                }
                if (v259-- <= 2)
                  return;
              }
            }
          }
        }
        v17 = (unint64_t)v15 >> 1;
        v18 = &a1[(unint64_t)v15 >> 1];
        v19 = *a3;
        if ((unint64_t)v14 < 0x801)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(v18, a1, v344, v19, a5, a6, a7, a8, v340);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, v18, v344, v19, a5, a6, a7, a8, v340);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>((_QWORD *)a1 + 2, (_QWORD *)v18 - 2, (_QWORD *)a2 - 4, *a3, v20, v21, v22, v23, v341);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>((_QWORD *)a1 + 4, &a1[v17 + 1], v342, *a3, v24, v25, v26, v27, (uint64_t)v342);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>((_QWORD *)v18 - 2, v18, &a1[v17 + 1], *a3, v28, v29, v30, v31, v343);
          v32 = *a1;
          *a1 = *v18;
          *v18 = v32;
        }
        --a4;
        v12 = a2;
        if ((v8 & 1) != 0)
          goto LABEL_26;
        v33 = *((_QWORD *)a1 - 2);
        v34 = *(unsigned __int16 *)(v33 + 22);
        if (v34 - 1295 <= 4)
        {
          v35 = *(unsigned __int16 *)(*(_QWORD *)a1 + 22);
          if (v35 - 1295 <= 4)
          {
            if (v35 < v34)
              goto LABEL_26;
LABEL_127:
            v347 = *a1;
            *(_QWORD *)a1 = 0;
            *((_QWORD *)a1 + 1) = 0;
            v119 = *(unsigned __int16 *)(v347 + 22);
            v120 = v119 - 1295;
            if (v119 - 1295 > 4 || (v121 = *(unsigned __int16 *)(*(_QWORD *)v344 + 22), v121 - 1295 > 4))
            {
              v122 = *a3;
              if (!*a3)
                goto LABEL_161;
              v123 = 0;
              v124 = *(_DWORD *)(v347 + 28);
              v348 = xmmword_18D745C50;
              while (*((_DWORD *)&v348 + v123) != v124)
              {
                if (++v123 == 4)
                {
                  v125 = (char *)&v349;
                  goto LABEL_137;
                }
              }
              v125 = (char *)&v348 + 4 * v123;
LABEL_137:
              v126 = 0;
              v127 = (v125 - (char *)&v348) >> 2;
              v128 = *(_DWORD *)(*(_QWORD *)v344 + 28);
              v348 = xmmword_18D745C50;
              while (*((_DWORD *)&v348 + v126) != v128)
              {
                if (++v126 == 4)
                {
                  v129 = (char *)&v349;
                  goto LABEL_142;
                }
              }
              v129 = (char *)&v348 + 4 * v126;
LABEL_142:
              if (v127 >= (v129 - (char *)&v348) >> 2)
              {
LABEL_161:
                v13 = a1;
                while (1)
                {
                  if (++v13 >= a2)
                    goto LABEL_180;
                  if (v120 > 4 || (v138 = *(unsigned __int16 *)(*(_QWORD *)v13 + 22), v138 - 1295 > 4))
                  {
                    if (v122)
                    {
                      v139 = 0;
                      v140 = *(_DWORD *)(v347 + 28);
                      v348 = xmmword_18D745C50;
                      while (*((_DWORD *)&v348 + v139) != v140)
                      {
                        if (++v139 == 4)
                        {
                          v141 = (char *)&v349;
                          goto LABEL_173;
                        }
                      }
                      v141 = (char *)&v348 + 4 * v139;
LABEL_173:
                      v142 = 0;
                      v143 = (v141 - (char *)&v348) >> 2;
                      v144 = *(_DWORD *)(*(_QWORD *)v13 + 28);
                      v348 = xmmword_18D745C50;
                      while (*((_DWORD *)&v348 + v142) != v144)
                      {
                        if (++v142 == 4)
                        {
                          v145 = (char *)&v349;
                          goto LABEL_178;
                        }
                      }
                      v145 = (char *)&v348 + 4 * v142;
LABEL_178:
                      if (v143 < (v145 - (char *)&v348) >> 2)
                        goto LABEL_179;
                    }
                  }
                  else if (v138 < v119)
                  {
                    goto LABEL_180;
                  }
                }
              }
            }
            else
            {
              v122 = *a3;
              if (v121 >= v119)
                goto LABEL_161;
            }
            v13 = a1;
            while (1)
            {
              while (1)
              {
                ++v13;
                if (v120 > 4)
                  break;
                v130 = *(unsigned __int16 *)(*(_QWORD *)v13 + 22);
                if (v130 - 1295 > 4)
                  break;
                if (v130 < v119)
                  goto LABEL_180;
              }
              if (v122)
              {
                v131 = 0;
                v132 = *(_DWORD *)(v347 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v131) != v132)
                {
                  if (++v131 == 4)
                  {
                    v133 = (char *)&v349;
                    goto LABEL_154;
                  }
                }
                v133 = (char *)&v348 + 4 * v131;
LABEL_154:
                v134 = 0;
                v135 = (v133 - (char *)&v348) >> 2;
                v136 = *(_DWORD *)(*(_QWORD *)v13 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v134) != v136)
                {
                  if (++v134 == 4)
                  {
                    v137 = (char *)&v349;
                    goto LABEL_159;
                  }
                }
                v137 = (char *)&v348 + 4 * v134;
LABEL_159:
                if (v135 < (v137 - (char *)&v348) >> 2)
                  break;
              }
            }
LABEL_179:
            v122 = 1;
LABEL_180:
            v146 = a2;
            if (v13 < a2)
            {
              v146 = a2;
              do
              {
                while (1)
                {
                  --v146;
                  if (v120 > 4)
                    break;
                  v147 = *(unsigned __int16 *)(*(_QWORD *)v146 + 22);
                  if (v147 - 1295 > 4)
                    break;
                  if (v147 >= v119)
                    goto LABEL_198;
                }
                if (!v122)
                  break;
                v148 = 0;
                v149 = *(_DWORD *)(v347 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v148) != v149)
                {
                  if (++v148 == 4)
                  {
                    v150 = (char *)&v349;
                    goto LABEL_192;
                  }
                }
                v150 = (char *)&v348 + 4 * v148;
LABEL_192:
                v151 = 0;
                v152 = (v150 - (char *)&v348) >> 2;
                v153 = *(_DWORD *)(*(_QWORD *)v146 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v151) != v153)
                {
                  if (++v151 == 4)
                  {
                    v154 = (char *)&v349;
                    goto LABEL_197;
                  }
                }
                v154 = (char *)&v348 + 4 * v151;
LABEL_197:
                ;
              }
              while (v152 < (v154 - (char *)&v348) >> 2);
            }
LABEL_198:
            if (v13 < v146)
            {
              v155 = *(_QWORD *)v13;
              do
              {
                *(_QWORD *)v13 = *(_QWORD *)v146;
                *(_QWORD *)v146 = v155;
                v156 = *((_QWORD *)v13 + 1);
                *((_QWORD *)v13 + 1) = *((_QWORD *)v146 + 1);
                *((_QWORD *)v146 + 1) = v156;
                v157 = *a3;
                v158 = *(unsigned __int16 *)(v347 + 22);
                v159 = v158 - 1295;
                do
                {
                  while (1)
                  {
                    ++v13;
                    if (v159 <= 4)
                    {
                      v155 = *(_QWORD *)v13;
                      v160 = *(unsigned __int16 *)(*(_QWORD *)v13 + 22);
                      if (v160 - 1295 <= 4)
                        break;
                    }
                    if (v157)
                    {
                      v161 = 0;
                      v162 = *(_DWORD *)(v347 + 28);
                      v348 = xmmword_18D745C50;
                      while (*((_DWORD *)&v348 + v161) != v162)
                      {
                        if (++v161 == 4)
                        {
                          v163 = (char *)&v349;
                          goto LABEL_211;
                        }
                      }
                      v163 = (char *)&v348 + 4 * v161;
LABEL_211:
                      v164 = 0;
                      v165 = (v163 - (char *)&v348) >> 2;
                      v155 = *(_QWORD *)v13;
                      v166 = *(_DWORD *)(*(_QWORD *)v13 + 28);
                      v348 = xmmword_18D745C50;
                      while (*((_DWORD *)&v348 + v164) != v166)
                      {
                        if (++v164 == 4)
                        {
                          v167 = (char *)&v349;
                          goto LABEL_216;
                        }
                      }
                      v167 = (char *)&v348 + 4 * v164;
LABEL_216:
                      if (v165 < (v167 - (char *)&v348) >> 2)
                        goto LABEL_230;
                    }
                  }
                }
                while (v160 >= v158);
                do
                {
LABEL_230:
                  while (1)
                  {
                    --v146;
                    if (v159 > 4)
                      break;
                    v175 = *(unsigned __int16 *)(*(_QWORD *)v146 + 22);
                    if (v175 - 1295 > 4)
                      break;
                    if (v175 >= v158)
                      goto LABEL_233;
                  }
                  if (!v157)
                    break;
                  v168 = 0;
                  v169 = *(_DWORD *)(v347 + 28);
                  v348 = xmmword_18D745C50;
                  while (*((_DWORD *)&v348 + v168) != v169)
                  {
                    if (++v168 == 4)
                    {
                      v170 = (char *)&v349;
                      goto LABEL_224;
                    }
                  }
                  v170 = (char *)&v348 + 4 * v168;
LABEL_224:
                  v171 = 0;
                  v172 = (v170 - (char *)&v348) >> 2;
                  v173 = *(_DWORD *)(*(_QWORD *)v146 + 28);
                  v348 = xmmword_18D745C50;
                  while (*((_DWORD *)&v348 + v171) != v173)
                  {
                    if (++v171 == 4)
                    {
                      v174 = (char *)&v349;
                      goto LABEL_229;
                    }
                  }
                  v174 = (char *)&v348 + 4 * v171;
LABEL_229:
                  ;
                }
                while (v172 < (v174 - (char *)&v348) >> 2);
LABEL_233:
                ;
              }
              while (v13 < v146);
            }
            if (v13 - 1 != a1)
              std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100]((uint64_t)a1, v13 - 1);
            std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100]((uint64_t)(v13 - 1), &v347);
            v176 = (std::__shared_weak_count *)*((_QWORD *)&v347 + 1);
            if (*((_QWORD *)&v347 + 1))
            {
              v177 = (unint64_t *)(*((_QWORD *)&v347 + 1) + 8);
              do
                v178 = __ldaxr(v177);
              while (__stlxr(v178 - 1, v177));
              if (!v178)
              {
                ((void (*)(std::__shared_weak_count *))v176->__on_zero_shared)(v176);
                std::__shared_weak_count::__release_weak(v176);
              }
            }
            v8 = 0;
            continue;
          }
        }
        if (!*a3)
          goto LABEL_127;
        v36 = 0;
        v37 = *(_DWORD *)(v33 + 28);
        v348 = xmmword_18D745C50;
        while (*((_DWORD *)&v348 + v36) != v37)
        {
          if (++v36 == 4)
          {
            v38 = (char *)&v349;
            goto LABEL_20;
          }
        }
        v38 = (char *)&v348 + 4 * v36;
LABEL_20:
        v39 = 0;
        v40 = (v38 - (char *)&v348) >> 2;
        v41 = *(_DWORD *)(*(_QWORD *)a1 + 28);
        v348 = xmmword_18D745C50;
        while (*((_DWORD *)&v348 + v39) != v41)
        {
          if (++v39 == 4)
          {
            v42 = (char *)&v349;
            goto LABEL_25;
          }
        }
        v42 = (char *)&v348 + 4 * v39;
LABEL_25:
        if (v40 >= (v42 - (char *)&v348) >> 2)
          goto LABEL_127;
LABEL_26:
        v347 = *a1;
        *(_QWORD *)a1 = 0;
        *((_QWORD *)a1 + 1) = 0;
        v43 = *a3;
        v44 = a1;
        do
        {
          while (1)
          {
            v45 = v44;
            v47 = *((_QWORD *)v44++ + 2);
            v46 = v47;
            v48 = *(unsigned __int16 *)(v47 + 22);
            if (v48 - 1295 > 4)
              break;
            v49 = *(unsigned __int16 *)(v347 + 22);
            if (v49 - 1295 > 4)
              break;
            if (v49 >= v48)
              goto LABEL_43;
          }
          if (!v43)
            break;
          v50 = 0;
          v51 = *(_DWORD *)(v46 + 28);
          v348 = xmmword_18D745C50;
          while (*((_DWORD *)&v348 + v50) != v51)
          {
            if (++v50 == 4)
            {
              v52 = (char *)&v349;
              goto LABEL_37;
            }
          }
          v52 = (char *)&v348 + 4 * v50;
LABEL_37:
          v53 = 0;
          v54 = (v52 - (char *)&v348) >> 2;
          v55 = *(_DWORD *)(v347 + 28);
          v348 = xmmword_18D745C50;
          while (*((_DWORD *)&v348 + v53) != v55)
          {
            if (++v53 == 4)
            {
              v56 = (char *)&v349;
              goto LABEL_42;
            }
          }
          v56 = (char *)&v348 + 4 * v53;
LABEL_42:
          ;
        }
        while (v54 < (v56 - (char *)&v348) >> 2);
LABEL_43:
        if (v45 == a1)
        {
          v12 = a2;
          while (v44 < v12)
          {
            v109 = *((_QWORD *)v12-- - 2);
            v108 = v109;
            v110 = *(unsigned __int16 *)(v109 + 22);
            if (v110 - 1295 > 4 || (v111 = *(unsigned __int16 *)(v347 + 22), v111 - 1295 > 4))
            {
              if (v43)
              {
                v112 = 0;
                v113 = *(_DWORD *)(v108 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v112) != v113)
                {
                  if (++v112 == 4)
                  {
                    v114 = (char *)&v349;
                    goto LABEL_120;
                  }
                }
                v114 = (char *)&v348 + 4 * v112;
LABEL_120:
                v115 = 0;
                v116 = (v114 - (char *)&v348) >> 2;
                v117 = *(_DWORD *)(v347 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v115) != v117)
                {
                  if (++v115 == 4)
                  {
                    v118 = (char *)&v349;
                    goto LABEL_125;
                  }
                }
                v118 = (char *)&v348 + 4 * v115;
LABEL_125:
                if (v116 < (v118 - (char *)&v348) >> 2)
                  break;
              }
            }
            else if (v111 < v110)
            {
              break;
            }
          }
        }
        else
        {
          while (1)
          {
            while (1)
            {
              v58 = *((_QWORD *)v12-- - 2);
              v57 = v58;
              v59 = *(unsigned __int16 *)(v58 + 22);
              if (v59 - 1295 > 4)
                break;
              v60 = *(unsigned __int16 *)(v347 + 22);
              if (v60 - 1295 > 4)
                break;
              if (v60 < v59)
                goto LABEL_60;
            }
            if (v43)
            {
              v61 = 0;
              v62 = *(_DWORD *)(v57 + 28);
              v348 = xmmword_18D745C50;
              while (*((_DWORD *)&v348 + v61) != v62)
              {
                if (++v61 == 4)
                {
                  v63 = (char *)&v349;
                  goto LABEL_54;
                }
              }
              v63 = (char *)&v348 + 4 * v61;
LABEL_54:
              v64 = 0;
              v65 = (v63 - (char *)&v348) >> 2;
              v66 = *(_DWORD *)(v347 + 28);
              v348 = xmmword_18D745C50;
              while (*((_DWORD *)&v348 + v64) != v66)
              {
                if (++v64 == 4)
                {
                  v67 = (char *)&v349;
                  goto LABEL_59;
                }
              }
              v67 = (char *)&v348 + 4 * v64;
LABEL_59:
              if (v65 < (v67 - (char *)&v348) >> 2)
                break;
            }
          }
        }
LABEL_60:
        if (v44 < v12)
        {
          v68 = v44;
          v69 = v12;
          do
          {
            *(_QWORD *)v68 = *(_QWORD *)v69;
            *(_QWORD *)v69 = v46;
            v70 = *((_QWORD *)v68 + 1);
            *((_QWORD *)v68 + 1) = *((_QWORD *)v69 + 1);
            *((_QWORD *)v69 + 1) = v70;
            v71 = *a3;
            while (1)
            {
              while (1)
              {
                v45 = v68;
                v72 = *((_QWORD *)v68++ + 2);
                v46 = v72;
                v73 = *(unsigned __int16 *)(v72 + 22);
                if (v73 - 1295 > 4)
                  break;
                v74 = *(unsigned __int16 *)(v347 + 22);
                if (v74 - 1295 > 4)
                  break;
                if (v74 >= v73)
                  goto LABEL_92;
              }
              if (!v71)
                break;
              v75 = 0;
              v76 = *(_DWORD *)(v46 + 28);
              v348 = xmmword_18D745C50;
              while (*((_DWORD *)&v348 + v75) != v76)
              {
                if (++v75 == 4)
                {
                  v77 = (char *)&v349;
                  goto LABEL_73;
                }
              }
              v77 = (char *)&v348 + 4 * v75;
LABEL_73:
              v78 = 0;
              v79 = (v77 - (char *)&v348) >> 2;
              v80 = *(_DWORD *)(v347 + 28);
              v348 = xmmword_18D745C50;
              while (*((_DWORD *)&v348 + v78) != v80)
              {
                if (++v78 == 4)
                {
                  v81 = (char *)&v349;
                  goto LABEL_78;
                }
              }
              v81 = (char *)&v348 + 4 * v78;
LABEL_78:
              if (v79 >= (v81 - (char *)&v348) >> 2)
                goto LABEL_92;
            }
            while (1)
            {
LABEL_92:
              while (1)
              {
                v90 = *((_QWORD *)v69-- - 2);
                v89 = v90;
                v91 = *(unsigned __int16 *)(v90 + 22);
                if (v91 - 1295 > 4)
                  break;
                v92 = *(unsigned __int16 *)(v347 + 22);
                if (v92 - 1295 > 4)
                  break;
                if (v92 < v91)
                  goto LABEL_95;
              }
              if (v71)
              {
                v82 = 0;
                v83 = *(_DWORD *)(v89 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v82) != v83)
                {
                  if (++v82 == 4)
                  {
                    v84 = (char *)&v349;
                    goto LABEL_86;
                  }
                }
                v84 = (char *)&v348 + 4 * v82;
LABEL_86:
                v85 = 0;
                v86 = (v84 - (char *)&v348) >> 2;
                v87 = *(_DWORD *)(v347 + 28);
                v348 = xmmword_18D745C50;
                while (*((_DWORD *)&v348 + v85) != v87)
                {
                  if (++v85 == 4)
                  {
                    v88 = (char *)&v349;
                    goto LABEL_91;
                  }
                }
                v88 = (char *)&v348 + 4 * v85;
LABEL_91:
                if (v86 < (v88 - (char *)&v348) >> 2)
                  break;
              }
            }
LABEL_95:
            ;
          }
          while (v68 < v69);
        }
        if (v45 != a1)
          std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100]((uint64_t)a1, v45);
        std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100]((uint64_t)v45, &v347);
        v98 = (std::__shared_weak_count *)*((_QWORD *)&v347 + 1);
        if (*((_QWORD *)&v347 + 1))
        {
          v99 = (unint64_t *)(*((_QWORD *)&v347 + 1) + 8);
          do
            v100 = __ldaxr(v99);
          while (__stlxr(v100 - 1, v99));
          if (!v100)
          {
            ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
            std::__shared_weak_count::__release_weak(v98);
          }
        }
        v101 = v44 >= v12;
        v12 = a2;
        if (!v101)
        {
LABEL_107:
          std::__introsort<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,false>(a1, v45, a3, a4, v8 & 1);
          v8 = 0;
          v13 = v45 + 1;
          continue;
        }
        v102 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, v45, a3, v93, v94, v95, v96, v97);
        v13 = v45 + 1;
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(v45 + 1, a2, a3, v103, v104, v105, v106, v107))
        {
          if (v102)
            continue;
          goto LABEL_107;
        }
        a2 = v45;
        if (!v102)
          goto LABEL_2;
        return;
    }
  }
}

uint64_t std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::~unordered_set[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void std::unordered_set<std::shared_ptr<CEM::EmojiToken>,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_2 const,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_3 const,std::allocator<std::shared_ptr<CEM::EmojiToken>>>::insert[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  CEM::EmojiToken *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  CEM::EmojiToken *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  float v35;
  float v36;
  _BOOL4 v37;
  unint64_t v38;
  unint64_t v39;
  int8x8_t prime;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  uint8x8_t v46;
  unint64_t v47;
  uint8x8_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  _QWORD v56[2];
  char v57;

  v5 = *(CEM::EmojiToken **)a2;
  v6 = *(std::__shared_weak_count **)(a2 + 8);
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v9 = CEM::EmojiToken::baseIndex(v5);
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  else
  {
    v9 = CEM::EmojiToken::baseIndex(v5);
  }
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v2 = v9;
      if (v12 <= v9)
        v2 = v9 % v12;
    }
    else
    {
      v2 = ((_DWORD)v12 - 1) & v9;
    }
    v15 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
    if (v15)
    {
      v16 = (_QWORD *)*v15;
      if (*v15)
      {
        do
        {
          v17 = v16[1];
          if (v17 == v11)
          {
            v18 = v16[2];
            v19 = (std::__shared_weak_count *)v16[3];
            if (v19)
            {
              v20 = (unint64_t *)&v19->__shared_owners_;
              do
                v21 = __ldxr(v20);
              while (__stxr(v21 + 1, v20));
            }
            v22 = *(CEM::EmojiToken **)a2;
            v23 = *(std::__shared_weak_count **)(a2 + 8);
            if (v23)
            {
              v24 = (unint64_t *)&v23->__shared_owners_;
              do
                v25 = __ldxr(v24);
              while (__stxr(v25 + 1, v24));
              v26 = *(unsigned __int16 *)(v18 + 22) == *((unsigned __int16 *)v22 + 11);
              do
                v27 = __ldaxr(v24);
              while (__stlxr(v27 - 1, v24));
              if (!v27)
              {
                ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
                std::__shared_weak_count::__release_weak(v23);
              }
            }
            else
            {
              v26 = *(unsigned __int16 *)(v18 + 22) == *((unsigned __int16 *)v22 + 11);
            }
            if (v19)
            {
              v28 = (unint64_t *)&v19->__shared_owners_;
              do
                v29 = __ldaxr(v28);
              while (__stlxr(v29 - 1, v28));
              if (!v29)
              {
                ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
                std::__shared_weak_count::__release_weak(v19);
              }
            }
            if (v26)
              return;
          }
          else
          {
            if (v14 > 1)
            {
              if (v17 >= v12)
                v17 %= v12;
            }
            else
            {
              v17 &= v12 - 1;
            }
            if (v17 != v2)
              break;
          }
          v16 = (_QWORD *)*v16;
        }
        while (v16);
      }
    }
  }
  v30 = (_QWORD *)(a1 + 16);
  v31 = operator new(0x20uLL);
  v56[0] = v31;
  v56[1] = a1 + 16;
  *v31 = 0;
  v31[1] = v11;
  v32 = *(_QWORD *)(a2 + 8);
  v31[2] = *(_QWORD *)a2;
  v31[3] = v32;
  if (v32)
  {
    v33 = (unint64_t *)(v32 + 8);
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
  }
  v57 = 1;
  v35 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v36 = *(float *)(a1 + 32);
  if (!v12 || (float)(v36 * (float)v12) < v35)
  {
    v37 = (v12 & (v12 - 1)) == 0;
    if (v12 < 3)
      v37 = 0;
    v38 = (2 * v12) | !v37;
    v39 = vcvtps_u32_f32(v35 / v36);
    if (v38 <= v39)
      prime = (int8x8_t)v39;
    else
      prime = (int8x8_t)v38;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v12 = *(_QWORD *)(a1 + 8);
    if (*(_QWORD *)&prime > v12)
      goto LABEL_57;
    if (*(_QWORD *)&prime < v12)
    {
      v47 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v12 < 3 || (v48 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v48.i16[0] = vaddlv_u8(v48), v48.u32[0] > 1uLL))
      {
        v47 = std::__next_prime(v47);
      }
      else
      {
        v49 = 1 << -(char)__clz(v47 - 1);
        if (v47 >= 2)
          v47 = v49;
      }
      if (*(_QWORD *)&prime <= v47)
        prime = (int8x8_t)v47;
      if (*(_QWORD *)&prime >= v12)
      {
        v12 = *(_QWORD *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_57:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v41 = operator new(8 * *(_QWORD *)&prime);
          v42 = *(void **)a1;
          *(_QWORD *)a1 = v41;
          if (v42)
            operator delete(v42);
          v43 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v43++) = 0;
          while (*(_QWORD *)&prime != v43);
          v44 = (_QWORD *)*v30;
          if (*v30)
          {
            v45 = v44[1];
            v46 = (uint8x8_t)vcnt_s8(prime);
            v46.i16[0] = vaddlv_u8(v46);
            if (v46.u32[0] > 1uLL)
            {
              if (v45 >= *(_QWORD *)&prime)
                v45 %= *(_QWORD *)&prime;
            }
            else
            {
              v45 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v45) = v30;
            v50 = (_QWORD *)*v44;
            if (*v44)
            {
              do
              {
                v51 = v50[1];
                if (v46.u32[0] > 1uLL)
                {
                  if (v51 >= *(_QWORD *)&prime)
                    v51 %= *(_QWORD *)&prime;
                }
                else
                {
                  v51 &= *(_QWORD *)&prime - 1;
                }
                if (v51 != v45)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v51))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v51) = v44;
                    goto LABEL_82;
                  }
                  *v44 = *v50;
                  *v50 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v51);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v51) = v50;
                  v50 = v44;
                }
                v51 = v45;
LABEL_82:
                v44 = v50;
                v50 = (_QWORD *)*v50;
                v45 = v51;
              }
              while (v50);
            }
          }
          v12 = (unint64_t)prime;
          goto LABEL_86;
        }
        v55 = *(void **)a1;
        *(_QWORD *)a1 = 0;
        if (v55)
          operator delete(v55);
        v12 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
LABEL_86:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v12 <= v11)
        v2 = v11 % v12;
      else
        v2 = v11;
    }
    else
    {
      v2 = ((_DWORD)v12 - 1) & v11;
    }
  }
  v52 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
  v53 = v56[0];
  if (v52)
  {
    *(_QWORD *)v56[0] = *v52;
LABEL_99:
    *v52 = v53;
    goto LABEL_100;
  }
  *(_QWORD *)v56[0] = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v53;
  *(_QWORD *)(*(_QWORD *)a1 + 8 * v2) = v30;
  if (*(_QWORD *)v53)
  {
    v54 = *(_QWORD *)(*(_QWORD *)v53 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v54 >= v12)
        v54 %= v12;
    }
    else
    {
      v54 &= v12 - 1;
    }
    v52 = (_QWORD *)(*(_QWORD *)a1 + 8 * v54);
    goto LABEL_99;
  }
LABEL_100:
  v56[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::shared_ptr<CEM::EmojiToken>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<CEM::EmojiToken>,void *>>>>::reset[abi:ne180100]((uint64_t)v56);
}

void sub_18D740838(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::shared_ptr<CEM::EmojiToken>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<CEM::EmojiToken>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::shared_ptr<CEM::EmojiToken>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<CEM::EmojiToken>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

_QWORD *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(_QWORD *result, _QWORD *a2, _QWORD *a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  int v15;
  char *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v21;
  unint64_t v22;
  int v23;
  char *v24;
  int v25;
  unsigned int v26;
  uint64_t v28;
  int v29;
  char *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  char *v36;
  int v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  int v51;
  char *v52;
  uint64_t v53;
  int v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  int v62;
  char *v63;
  uint64_t v64;
  __int128 v65;

  v9 = *a2;
  v10 = *(unsigned __int16 *)(*a2 + 22);
  v11 = v10 - 1295;
  if (v10 - 1295 > 4 || (v12 = *(unsigned __int16 *)(*result + 22), v12 - 1295 > 4))
  {
    if (!a4)
    {
      v17 = *a3;
      v18 = *(unsigned __int16 *)(*a3 + 22);
      if (v18 - 1295 > 4 || v11 > 4 || v10 >= v18)
        return result;
      goto LABEL_54;
    }
    v14 = 0;
    v15 = *(_DWORD *)(v9 + 28);
    v65 = xmmword_18D745C50;
    v16 = (char *)&a9;
    while (*((_DWORD *)&v65 + v14) != v15)
    {
      if (++v14 == 4)
        goto LABEL_19;
    }
    v16 = (char *)&v65 + 4 * v14;
LABEL_19:
    v21 = 0;
    v22 = (v16 - (char *)&v65) >> 2;
    v23 = *(_DWORD *)(*result + 28);
    v65 = xmmword_18D745C50;
    v24 = (char *)&a9;
    while (*((_DWORD *)&v65 + v21) != v23)
    {
      if (++v21 == 4)
        goto LABEL_24;
    }
    v24 = (char *)&v65 + 4 * v21;
LABEL_24:
    v13 = v22 >= (v24 - (char *)&v65) >> 2;
  }
  else
  {
    v13 = v12 >= v10;
  }
  v25 = !v13;
  v17 = *a3;
  v26 = *(unsigned __int16 *)(*a3 + 22);
  if (v26 - 1295 <= 4 && v11 < 5)
  {
    v31 = v10 >= v26;
LABEL_47:
    v37 = !v31;
    if ((v25 & 1) != 0)
    {
      v32 = *result;
      if (v37)
      {
        *result = v17;
        *a3 = v32;
        v38 = a3 + 1;
        ++result;
LABEL_88:
        v39 = v38;
        goto LABEL_89;
      }
      goto LABEL_58;
    }
    if (!v37)
      return result;
LABEL_54:
    *a2 = v17;
    *a3 = v9;
    v39 = a2 + 1;
    v40 = a2[1];
    a2[1] = a3[1];
    a3[1] = v40;
    v41 = *a2;
    v42 = *(unsigned __int16 *)(*a2 + 22);
    if (v42 - 1295 > 4 || (v43 = *result, v44 = *(unsigned __int16 *)(*result + 22), v44 - 1295 > 4))
    {
      if (!a4)
        return result;
      v50 = 0;
      v51 = *(_DWORD *)(v41 + 28);
      v65 = xmmword_18D745C50;
      v52 = (char *)&a9;
      while (*((_DWORD *)&v65 + v50) != v51)
      {
        if (++v50 == 4)
          goto LABEL_73;
      }
      v52 = (char *)&v65 + 4 * v50;
LABEL_73:
      v56 = 0;
      v57 = (v52 - (char *)&v65) >> 2;
      v43 = *result;
      v58 = *(_DWORD *)(*result + 28);
      v65 = xmmword_18D745C50;
      v59 = (char *)&a9;
      while (*((_DWORD *)&v65 + v56) != v58)
      {
        if (++v56 == 4)
          goto LABEL_78;
      }
      v59 = (char *)&v65 + 4 * v56;
LABEL_78:
      if (v57 >= (v59 - (char *)&v65) >> 2)
        return result;
    }
    else if (v44 >= v42)
    {
      return result;
    }
    *result++ = v41;
    *a2 = v43;
LABEL_89:
    v64 = *result;
    *result = *v39;
    *v39 = v64;
    return result;
  }
  if (a4)
  {
    v28 = 0;
    v29 = *(_DWORD *)(v17 + 28);
    v65 = xmmword_18D745C50;
    v30 = (char *)&a9;
    while (*((_DWORD *)&v65 + v28) != v29)
    {
      if (++v28 == 4)
        goto LABEL_41;
    }
    v30 = (char *)&v65 + 4 * v28;
LABEL_41:
    v33 = 0;
    v34 = (v30 - (char *)&v65) >> 2;
    v35 = *(_DWORD *)(v9 + 28);
    v65 = xmmword_18D745C50;
    v36 = (char *)&a9;
    while (*((_DWORD *)&v65 + v33) != v35)
    {
      if (++v33 == 4)
        goto LABEL_46;
    }
    v36 = (char *)&v65 + 4 * v33;
LABEL_46:
    v31 = v34 >= (v36 - (char *)&v65) >> 2;
    goto LABEL_47;
  }
  if (!v25)
    return result;
  v32 = *result;
LABEL_58:
  *result = v9;
  *a2 = v32;
  v45 = result[1];
  result[1] = a2[1];
  a2[1] = v45;
  v46 = *a3;
  v47 = *(unsigned __int16 *)(*a3 + 22);
  if (v47 - 1295 <= 4)
  {
    v48 = *a2;
    v49 = *(unsigned __int16 *)(*a2 + 22);
    if (v49 - 1295 <= 4)
    {
      if (v49 >= v47)
        return result;
LABEL_87:
      *a2 = v46;
      *a3 = v48;
      v38 = a3 + 1;
      result = a2 + 1;
      goto LABEL_88;
    }
  }
  if (a4)
  {
    v53 = 0;
    v54 = *(_DWORD *)(v46 + 28);
    v65 = xmmword_18D745C50;
    v55 = (char *)&a9;
    while (*((_DWORD *)&v65 + v53) != v54)
    {
      if (++v53 == 4)
        goto LABEL_81;
    }
    v55 = (char *)&v65 + 4 * v53;
LABEL_81:
    v60 = 0;
    v61 = (v55 - (char *)&v65) >> 2;
    v48 = *a2;
    v62 = *(_DWORD *)(*a2 + 28);
    v65 = xmmword_18D745C50;
    v63 = (char *)&a9;
    while (*((_DWORD *)&v65 + v60) != v62)
    {
      if (++v60 == 4)
        goto LABEL_86;
    }
    v63 = (char *)&v65 + 4 * v60;
LABEL_86:
    if (v61 < (v63 - (char *)&v65) >> 2)
      goto LABEL_87;
  }
  return result;
}

_QWORD *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *result;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  int v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  int v47;
  char *v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, a2, a3, *a5, (uint64_t)a5, a6, a7, a8, v50);
  v14 = *a4;
  v15 = *(unsigned __int16 *)(*a4 + 22);
  if (v15 - 1295 > 4 || (v16 = *a3, v17 = *(unsigned __int16 *)(*a3 + 22), v17 - 1295 > 4))
  {
    if (!*a5)
      return result;
    v18 = 0;
    v19 = *(_DWORD *)(v14 + 28);
    v50 = xmmword_18D745C50;
    v20 = (char *)&v51;
    while (*((_DWORD *)&v50 + v18) != v19)
    {
      if (++v18 == 4)
        goto LABEL_11;
    }
    v20 = (char *)&v50 + 4 * v18;
LABEL_11:
    v21 = 0;
    v22 = (v20 - (char *)&v50) >> 2;
    v16 = *a3;
    v23 = *(_DWORD *)(*a3 + 28);
    v50 = xmmword_18D745C50;
    v24 = (char *)&v51;
    while (*((_DWORD *)&v50 + v21) != v23)
    {
      if (++v21 == 4)
        goto LABEL_16;
    }
    v24 = (char *)&v50 + 4 * v21;
LABEL_16:
    if (v22 >= (v24 - (char *)&v50) >> 2)
      return result;
  }
  else if (v17 >= v15)
  {
    return result;
  }
  *a3 = v14;
  *a4 = v16;
  v25 = a3[1];
  a3[1] = a4[1];
  a4[1] = v25;
  v26 = *a3;
  v27 = *(unsigned __int16 *)(*a3 + 22);
  if (v27 - 1295 > 4 || (v28 = *a2, v29 = *(unsigned __int16 *)(*a2 + 22), v29 - 1295 > 4))
  {
    if (!*a5)
      return result;
    v30 = 0;
    v31 = *(_DWORD *)(v26 + 28);
    v50 = xmmword_18D745C50;
    v32 = (char *)&v51;
    while (*((_DWORD *)&v50 + v30) != v31)
    {
      if (++v30 == 4)
        goto LABEL_27;
    }
    v32 = (char *)&v50 + 4 * v30;
LABEL_27:
    v33 = 0;
    v34 = (v32 - (char *)&v50) >> 2;
    v28 = *a2;
    v35 = *(_DWORD *)(*a2 + 28);
    v50 = xmmword_18D745C50;
    v36 = (char *)&v51;
    while (*((_DWORD *)&v50 + v33) != v35)
    {
      if (++v33 == 4)
        goto LABEL_32;
    }
    v36 = (char *)&v50 + 4 * v33;
LABEL_32:
    if (v34 >= (v36 - (char *)&v50) >> 2)
      return result;
  }
  else if (v29 >= v27)
  {
    return result;
  }
  *a2 = v26;
  *a3 = v28;
  v37 = a2[1];
  a2[1] = a3[1];
  a3[1] = v37;
  v38 = *a2;
  v39 = *(unsigned __int16 *)(*a2 + 22);
  if (v39 - 1295 <= 4)
  {
    v40 = *a1;
    v41 = *(unsigned __int16 *)(*a1 + 22);
    if (v41 - 1295 <= 4)
    {
      if (v41 >= v39)
        return result;
LABEL_49:
      *a1 = v38;
      *a2 = v40;
      v49 = a1[1];
      a1[1] = a2[1];
      a2[1] = v49;
      return result;
    }
  }
  if (*a5)
  {
    v42 = 0;
    v43 = *(_DWORD *)(v38 + 28);
    v50 = xmmword_18D745C50;
    v44 = (char *)&v51;
    while (*((_DWORD *)&v50 + v42) != v43)
    {
      if (++v42 == 4)
        goto LABEL_43;
    }
    v44 = (char *)&v50 + 4 * v42;
LABEL_43:
    v45 = 0;
    v46 = (v44 - (char *)&v50) >> 2;
    v40 = *a1;
    v47 = *(_DWORD *)(*a1 + 28);
    v50 = xmmword_18D745C50;
    v48 = (char *)&v51;
    while (*((_DWORD *)&v50 + v45) != v47)
    {
      if (++v45 == 4)
        goto LABEL_48;
    }
    v48 = (char *)&v50 + 4 * v45;
LABEL_48:
    if (v46 < (v48 - (char *)&v50) >> 2)
      goto LABEL_49;
  }
  return result;
}

_QWORD *std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,0>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, char *a6, uint64_t a7, uint64_t a8)
{
  _QWORD *result;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  int v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  int v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  char *v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, a2, a3, a4, a6, (uint64_t)a6, a7, a8);
  v15 = *a5;
  v16 = *(unsigned __int16 *)(*a5 + 22);
  if (v16 - 1295 > 4 || (v17 = *a4, v18 = *(unsigned __int16 *)(*a4 + 22), v18 - 1295 > 4))
  {
    if (!*a6)
      return result;
    v19 = 0;
    v20 = *(_DWORD *)(v15 + 28);
    v63 = xmmword_18D745C50;
    v21 = (char *)&v64;
    while (*((_DWORD *)&v63 + v19) != v20)
    {
      if (++v19 == 4)
        goto LABEL_11;
    }
    v21 = (char *)&v63 + 4 * v19;
LABEL_11:
    v22 = 0;
    v23 = (v21 - (char *)&v63) >> 2;
    v17 = *a4;
    v24 = *(_DWORD *)(*a4 + 28);
    v63 = xmmword_18D745C50;
    v25 = (char *)&v64;
    while (*((_DWORD *)&v63 + v22) != v24)
    {
      if (++v22 == 4)
        goto LABEL_16;
    }
    v25 = (char *)&v63 + 4 * v22;
LABEL_16:
    if (v23 >= (v25 - (char *)&v63) >> 2)
      return result;
  }
  else if (v18 >= v16)
  {
    return result;
  }
  *a4 = v15;
  *a5 = v17;
  v26 = a4[1];
  a4[1] = a5[1];
  a5[1] = v26;
  v27 = *a4;
  v28 = *(unsigned __int16 *)(*a4 + 22);
  if (v28 - 1295 > 4 || (v29 = *a3, v30 = *(unsigned __int16 *)(*a3 + 22), v30 - 1295 > 4))
  {
    if (!*a6)
      return result;
    v31 = 0;
    v32 = *(_DWORD *)(v27 + 28);
    v63 = xmmword_18D745C50;
    v33 = (char *)&v64;
    while (*((_DWORD *)&v63 + v31) != v32)
    {
      if (++v31 == 4)
        goto LABEL_27;
    }
    v33 = (char *)&v63 + 4 * v31;
LABEL_27:
    v34 = 0;
    v35 = (v33 - (char *)&v63) >> 2;
    v29 = *a3;
    v36 = *(_DWORD *)(*a3 + 28);
    v63 = xmmword_18D745C50;
    v37 = (char *)&v64;
    while (*((_DWORD *)&v63 + v34) != v36)
    {
      if (++v34 == 4)
        goto LABEL_32;
    }
    v37 = (char *)&v63 + 4 * v34;
LABEL_32:
    if (v35 >= (v37 - (char *)&v63) >> 2)
      return result;
  }
  else if (v30 >= v28)
  {
    return result;
  }
  *a3 = v27;
  *a4 = v29;
  v38 = a3[1];
  a3[1] = a4[1];
  a4[1] = v38;
  v39 = *a3;
  v40 = *(unsigned __int16 *)(*a3 + 22);
  if (v40 - 1295 > 4 || (v41 = *a2, v42 = *(unsigned __int16 *)(*a2 + 22), v42 - 1295 > 4))
  {
    if (!*a6)
      return result;
    v43 = 0;
    v44 = *(_DWORD *)(v39 + 28);
    v63 = xmmword_18D745C50;
    v45 = (char *)&v64;
    while (*((_DWORD *)&v63 + v43) != v44)
    {
      if (++v43 == 4)
        goto LABEL_43;
    }
    v45 = (char *)&v63 + 4 * v43;
LABEL_43:
    v46 = 0;
    v47 = (v45 - (char *)&v63) >> 2;
    v41 = *a2;
    v48 = *(_DWORD *)(*a2 + 28);
    v63 = xmmword_18D745C50;
    v49 = (char *)&v64;
    while (*((_DWORD *)&v63 + v46) != v48)
    {
      if (++v46 == 4)
        goto LABEL_48;
    }
    v49 = (char *)&v63 + 4 * v46;
LABEL_48:
    if (v47 >= (v49 - (char *)&v63) >> 2)
      return result;
  }
  else if (v42 >= v40)
  {
    return result;
  }
  *a2 = v39;
  *a3 = v41;
  v50 = a2[1];
  a2[1] = a3[1];
  a3[1] = v50;
  v51 = *a2;
  v52 = *(unsigned __int16 *)(*a2 + 22);
  if (v52 - 1295 <= 4)
  {
    v53 = *a1;
    v54 = *(unsigned __int16 *)(*a1 + 22);
    if (v54 - 1295 <= 4)
    {
      if (v54 >= v52)
        return result;
LABEL_65:
      *a1 = v51;
      *a2 = v53;
      v62 = a1[1];
      a1[1] = a2[1];
      a2[1] = v62;
      return result;
    }
  }
  if (*a6)
  {
    v55 = 0;
    v56 = *(_DWORD *)(v51 + 28);
    v63 = xmmword_18D745C50;
    v57 = (char *)&v64;
    while (*((_DWORD *)&v63 + v55) != v56)
    {
      if (++v55 == 4)
        goto LABEL_59;
    }
    v57 = (char *)&v63 + 4 * v55;
LABEL_59:
    v58 = 0;
    v59 = (v57 - (char *)&v63) >> 2;
    v53 = *a1;
    v60 = *(_DWORD *)(*a1 + 28);
    v63 = xmmword_18D745C50;
    v61 = (char *)&v64;
    while (*((_DWORD *)&v63 + v58) != v60)
    {
      if (++v58 == 4)
        goto LABEL_64;
    }
    v61 = (char *)&v63 + 4 * v58;
LABEL_64:
    if (v59 < (v61 - (char *)&v63) >> 2)
      goto LABEL_65;
  }
  return result;
}

uint64_t std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(__int128 *a1, __int128 *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  _BOOL8 result;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  __int128 *v17;
  __int128 *v18;
  int v19;
  __int128 v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  char *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  int v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v11 = a2 - a1;
  result = 1;
  switch(v11)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v13 = *((_QWORD *)a2 - 2);
      v14 = *(unsigned __int16 *)(v13 + 22);
      if (v14 - 1295 <= 4)
      {
        v15 = *(_QWORD *)a1;
        v16 = *(unsigned __int16 *)(*(_QWORD *)a1 + 22);
        if (v16 - 1295 <= 4)
        {
          if (v16 >= v14)
            return result;
LABEL_67:
          *(_QWORD *)a1 = v13;
          *((_QWORD *)a2 - 2) = v15;
          v51 = *((_QWORD *)a1 + 1);
          *((_QWORD *)a1 + 1) = *((_QWORD *)a2 - 1);
          *((_QWORD *)a2 - 1) = v51;
          return 1;
        }
      }
      if (*a3)
      {
        v44 = 0;
        v45 = *(_DWORD *)(v13 + 28);
        v54 = xmmword_18D745C50;
        v46 = (char *)&v55;
        while (*((_DWORD *)&v54 + v44) != v45)
        {
          if (++v44 == 4)
            goto LABEL_61;
        }
        v46 = (char *)&v54 + 4 * v44;
LABEL_61:
        v47 = 0;
        v48 = (v46 - (char *)&v54) >> 2;
        v15 = *(_QWORD *)a1;
        v49 = *(_DWORD *)(*(_QWORD *)a1 + 28);
        v54 = xmmword_18D745C50;
        v50 = (char *)&v55;
        while (*((_DWORD *)&v54 + v47) != v49)
        {
          if (++v47 == 4)
            goto LABEL_66;
        }
        v50 = (char *)&v54 + 4 * v47;
LABEL_66:
        if (v48 >= (v50 - (char *)&v54) >> 2)
          return 1;
        goto LABEL_67;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (_QWORD *)a1 + 2, (_QWORD *)a2 - 2, *a3, a5, a6, a7, a8, v52);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (_QWORD *)a1 + 2, (_QWORD *)a1 + 4, (_QWORD *)a2 - 2, a3, a6, a7, a8);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*,0>(a1, (_QWORD *)a1 + 2, (_QWORD *)a1 + 4, (_QWORD *)a1 + 6, (_QWORD *)a2 - 2, a3, a7, a8);
      return 1;
    default:
      v17 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,sortEmojiTokens(std::vector<std::shared_ptr<CEM::EmojiToken>> &,BOOL)::$_0 &,std::shared_ptr<CEM::EmojiToken>*>(a1, (_QWORD *)a1 + 2, (_QWORD *)a1 + 4, *a3, a5, a6, a7, a8, v52);
      v18 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v19 = 0;
      v20 = xmmword_18D745C50;
      while (2)
      {
        v21 = *(unsigned __int16 *)(*(_QWORD *)v18 + 22);
        if (v21 - 1295 > 4 || (v22 = *(unsigned __int16 *)(*(_QWORD *)v17 + 22), v22 - 1295 > 4))
        {
          if (!*a3)
            goto LABEL_50;
          v23 = 0;
          v24 = *(_DWORD *)(*(_QWORD *)v18 + 28);
          v54 = v20;
          while (*((_DWORD *)&v54 + v23) != v24)
          {
            if (++v23 == 4)
            {
              v25 = (char *)&v55;
              goto LABEL_18;
            }
          }
          v25 = (char *)&v54 + 4 * v23;
LABEL_18:
          v26 = 0;
          v27 = (v25 - (char *)&v54) >> 2;
          v28 = *(_DWORD *)(*(_QWORD *)v17 + 28);
          v54 = v20;
          while (*((_DWORD *)&v54 + v26) != v28)
          {
            if (++v26 == 4)
            {
              v29 = (char *)&v55;
              goto LABEL_23;
            }
          }
          v29 = (char *)&v54 + 4 * v26;
LABEL_23:
          if (v27 >= (v29 - (char *)&v54) >> 2)
            goto LABEL_50;
        }
        else if (v22 >= v21)
        {
          goto LABEL_50;
        }
        v53 = *v18;
        *(_QWORD *)v18 = 0;
        *((_QWORD *)v18 + 1) = 0;
        v30 = (uint64_t)v18;
        while (1)
        {
          v31 = v30;
          v30 = (uint64_t)v17;
          std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v31, v17);
          if (v17 == a1)
            break;
          --v17;
          v32 = *(unsigned __int16 *)(v53 + 22);
          if (v32 - 1295 > 4 || (v33 = *(unsigned __int16 *)(*(_QWORD *)v17 + 22), v33 - 1295 > 4))
          {
            if (!*a3)
              goto LABEL_44;
            v34 = 0;
            v35 = *(_DWORD *)(v53 + 28);
            v54 = xmmword_18D745C50;
            while (*((_DWORD *)&v54 + v34) != v35)
            {
              if (++v34 == 4)
              {
                v36 = (char *)&v55;
                goto LABEL_36;
              }
            }
            v36 = (char *)&v54 + 4 * v34;
LABEL_36:
            v37 = 0;
            v38 = (v36 - (char *)&v54) >> 2;
            v39 = *(_DWORD *)(*(_QWORD *)v17 + 28);
            v54 = xmmword_18D745C50;
            while (*((_DWORD *)&v54 + v37) != v39)
            {
              if (++v37 == 4)
              {
                v40 = (char *)&v55;
                goto LABEL_41;
              }
            }
            v40 = (char *)&v54 + 4 * v37;
LABEL_41:
            if (v38 >= (v40 - (char *)&v54) >> 2)
              goto LABEL_44;
          }
          else if (v33 >= v32)
          {
            goto LABEL_44;
          }
        }
        v30 = (uint64_t)a1;
LABEL_44:
        std::shared_ptr<CEM::EmojiToken>::operator=[abi:ne180100](v30, &v53);
        v41 = (std::__shared_weak_count *)*((_QWORD *)&v53 + 1);
        if (*((_QWORD *)&v53 + 1))
        {
          v42 = (unint64_t *)(*((_QWORD *)&v53 + 1) + 8);
          do
            v43 = __ldaxr(v42);
          while (__stlxr(v43 - 1, v42));
          if (!v43)
          {
            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
            std::__shared_weak_count::__release_weak(v41);
          }
        }
        ++v19;
        v20 = xmmword_18D745C50;
        if (v19 == 8)
          return v18 + 1 == a2;
LABEL_50:
        v17 = v18++;
        if (v18 == a2)
          return 1;
        continue;
      }
  }
}

BOOL CEM::EmojiLocaleData::emojiIndexIsSupported(uint64_t a1, int a2, unsigned int a3)
{
  CEM::EmojiData *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _WORD *v12;
  _OWORD *v13;
  unint64_t v14;
  unsigned __int16 *v15;
  unint64_t v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  unsigned int v19;
  _BOOL8 v20;

  if ((CEM::EmojiData::isValidIndex(*(CEM::EmojiData **)(a1 + 96), a3) & 1) == 0)
  {
    v6 = *(CEM::EmojiData **)(a1 + 104);
    if (!v6 || !CEM::EmojiData::isValidIndex(v6, a3))
      return 0;
  }
  if (a2 != 1)
    return 1;
  v7 = *(unsigned __int8 *)(a1 + 71);
  v8 = (char)v7;
  if ((v7 & 0x80u) != 0)
    v7 = *(_QWORD *)(a1 + 56);
  if (v7 == 2)
  {
    v11 = *(_QWORD *)(a1 + 48);
    v10 = a1 + 48;
    v9 = v11;
    v12 = (_WORD *)(v8 >= 0 ? v10 : v9);
    if (*v12 == 24938)
      return 1;
  }
  v13 = operator new(0x1AuLL);
  *v13 = xmmword_18D74663A;
  *(_OWORD *)((char *)v13 + 10) = *(__int128 *)((char *)&xmmword_18D74663A + 10);
  v14 = 13;
  v15 = (unsigned __int16 *)v13;
  do
  {
    v16 = v14 >> 1;
    v17 = &v15[v14 >> 1];
    v19 = *v17;
    v18 = v17 + 1;
    v14 += ~(v14 >> 1);
    if (v19 < a3)
      v15 = v18;
    else
      v14 = v16;
  }
  while (v14);
  v20 = v15 == (unsigned __int16 *)((char *)v13 + 26) || *v15 > a3;
  operator delete(v13);
  return v20;
}

void std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

__n128 std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E2632218;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E2632218;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::operator()(uint64_t a1, CFIndex *a2)
{
  CFIndex v2;
  UniChar CharacterAtIndex;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 16) == v2)
    return 1;
  CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 8), v2);
  return isWhitespace(CharacterAtIndex);
}

uint64_t std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK3CEM15EmojiLocaleData39enumerateSearchResultsInStringWithBlockEPK10__CFString7CFRangem18CEMEmojiSearchTypebU13block_pointerFvRKNSt3__16vectorINS6_10shared_ptrINS_10EmojiTokenEEENS6_9allocatorISA_EEEES4_PbEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0,std::allocator<CEM::EmojiLocaleData::enumerateSearchResultsInStringWithBlock(__CFString const*,CFRange,unsigned long,CEMEmojiSearchType,BOOL,void({block_pointer})(std::vector<std::shared_ptr<CEM::EmojiToken>> const&,CFRange,BOOL *))::$_0>,BOOL ()(long)>::target_type()
{
}

void CEM::EmojiLocaleData::exactMatchEmojiTokensForSingleWord(uint64_t a1, uint64_t a2, const __CFString *a3, const __CFString *a4, int a5, uint64_t *a6, int a7)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned __int16 *v17;
  int v18;
  std::string::size_type size;
  unsigned __int8 v20;
  std::string *p_p;
  __int128 v23;
  int v24;
  std::string::size_type v25;
  int v26;
  std::string::size_type v27;
  std::string *v28;
  std::string *v29;
  std::string *v30;
  uint64_t v31;
  std::string *v32;
  __int128 v33;
  unsigned __int16 *v34;
  void **v35;
  unint64_t v36;
  void **v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  _QWORD *v49;
  char *v50;
  __int128 v51;
  int64x2_t v52;
  std::string *v53;
  std::string *v54;
  std::string::size_type v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void **v62;
  unint64_t v63;
  void *v64;
  __int128 v65;
  const __CFString *v66;
  void *v67;
  std::string v68;
  void *v69[2];
  unsigned __int8 v70;
  void *v71[2];
  __int128 v72;
  void *v73[2];
  uint64_t v74;
  std::string v75;
  std::string __p;
  int v77;
  std::string v78;
  std::string *v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  CFLocaleGetValue(*(CFLocaleRef *)(a2 + 32), (CFLocaleKey)*MEMORY[0x1E0C9B088]);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  v14 = *a6;
  if (!v14)
    goto LABEL_88;
  v77 = a5;
  CEM::getUTF8StringFromCFString(&__p, a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v75, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v75 = __p;
  std::string::basic_string[abi:ne180100]<0>(v71, "’");
  std::string::basic_string[abi:ne180100]<0>(&v67, "'");
  CEM::replace((uint64_t)&v78, &v75, (uint64_t)v71, (uint64_t)&v67);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = v78;
  if (v68.__r_.__value_.__s.__data_[15] < 0)
    operator delete(v67);
  if (SBYTE7(v72) < 0)
    operator delete(v71[0]);
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v75.__r_.__value_.__l.__data_);
  v15 = *(unsigned __int8 *)(v14 + 119);
  v16 = (char)v15;
  if ((v15 & 0x80u) != 0)
    v15 = *(_QWORD *)(v14 + 104);
  v66 = a3;
  if (v15 == 2)
  {
    if (v16 >= 0)
      v17 = (unsigned __int16 *)(v14 + 96);
    else
      v17 = *(unsigned __int16 **)(v14 + 96);
    v18 = *v17;
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if (v18 == 28261 && a5 == 1)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = __p.__r_.__value_.__l.__size_;
      if (size == 2)
      {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        v23 = 0uLL;
        if (LOWORD(p_p->__r_.__value_.__l.__data_) == 24947 || LOWORD(p_p->__r_.__value_.__l.__data_) == 25971)
          goto LABEL_60;
      }
    }
  }
  else
  {
    v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  v24 = (char)v20;
  if ((v20 & 0x80u) == 0)
    v25 = v20;
  else
    v25 = __p.__r_.__value_.__l.__size_;
  v23 = 0uLL;
  if (v25 != 1)
  {
    v26 = a5;
    if (!a5)
    {
      v26 = 2;
      v77 = 2;
    }
    v73[0] = 0;
    v73[1] = 0;
    v74 = 0;
    if (a7)
    {
      v27 = __p.__r_.__value_.__r.__words[0];
      v28 = (std::string *)operator new(0x20uLL);
      if (v24 >= 0)
        v29 = &__p;
      else
        v29 = (std::string *)v27;
      v28->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E26322C8;
      v28->__r_.__value_.__l.__size_ = v14;
      v28->__r_.__value_.__r.__words[2] = (std::string::size_type)&v77;
      v28[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v73;
      v79 = v28;
      trie::MarisaTrie<unsigned int,char>::enumerateCompletions(v14 + 16, (uint64_t)v29, v25, (uint64_t)&v78, 0xFFFFFFFFLL);
      v30 = v79;
      if (v79 == &v78)
      {
        v31 = 4;
        v30 = &v78;
      }
      else
      {
        if (!v79)
        {
LABEL_58:
          v23 = *(_OWORD *)v73;
LABEL_59:
          v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          goto LABEL_60;
        }
        v31 = 5;
      }
      (*(void (**)(void))(v30->__r_.__value_.__r.__words[0] + 8 * v31))();
      goto LABEL_58;
    }
    *(_OWORD *)v71 = 0uLL;
    v72 = 0uLL;
    if ((v20 & 0x80u) == 0)
      v32 = &__p;
    else
      v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
    internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(v14 + 32), (uint64_t)v32, v25, (uint64_t)v71, &v78);
    if (SHIBYTE(v72) < 0)
      operator delete(v71[1]);
    if (v78.__r_.__value_.__r.__words[0] == 0xFFFFFFFF)
    {
LABEL_52:
      if (SHIBYTE(v79) < 0)
        operator delete((void *)v78.__r_.__value_.__l.__size_);
      v23 = 0uLL;
      if (v73[0])
      {
        v73[1] = v73[0];
        operator delete(v73[0]);
        v23 = 0uLL;
      }
      goto LABEL_59;
    }
    if (a4)
    {
      internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(v14 + 32), (uint64_t)"_", 1uLL, (uint64_t)&v78, v71);
      if (v71[0] != (void *)0xFFFFFFFFLL)
      {
        CEM::getUTF8StringFromCFString(v69, a4);
        if ((v70 & 0x80u) == 0)
          v62 = v69;
        else
          v62 = (void **)v69[0];
        if ((v70 & 0x80u) == 0)
          v63 = v70;
        else
          v63 = (unint64_t)v69[1];
        internal::marisa::Trie::advance((internal::marisa::grimoire::vector::BitVector **)(v14 + 32), (uint64_t)v62, v63, (uint64_t)v71, &v67);
        v71[0] = v67;
        std::string::operator=((std::string *)&v71[1], &v68);
        if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v68.__r_.__value_.__l.__data_);
        v64 = v71[0];
        if (v71[0] != (void *)0xFFFFFFFFLL)
        {
          v78.__r_.__value_.__l.__data_ = (std::string::pointer)v71[0];
          std::string::operator=((std::string *)&v78.__r_.__value_.__r.__words[1], (const std::string *)&v71[1]);
        }
        if ((char)v70 < 0)
          operator delete(v69[0]);
        if (v64 == (void *)0xFFFFFFFFLL)
        {
          if (SHIBYTE(v72) < 0)
            operator delete(v71[1]);
          goto LABEL_52;
        }
      }
      if (SHIBYTE(v72) < 0)
        operator delete(v71[1]);
    }
    LODWORD(v71[0]) = 0;
    if (CEM::EmojiSearchTrie::getPayload(v14, (uint64_t)&v78, v26, v71))
      CEM::EmojiSearchTrie::payloadToIndexes((uint64_t *)v14, v71[0], (uint64_t)v73);
    if (SHIBYTE(v79) < 0)
      operator delete((void *)v78.__r_.__value_.__l.__size_);
    goto LABEL_58;
  }
LABEL_60:
  if ((v20 & 0x80) != 0)
  {
    v65 = v23;
    operator delete(__p.__r_.__value_.__l.__data_);
    v23 = v65;
  }
  v33 = v23;
  if ((_QWORD)v23 != *((_QWORD *)&v23 + 1))
  {
    v34 = (unsigned __int16 *)v23;
    do
    {
      CEM::EmojiLocaleData::createEmojiToken(v71, a2, a5, *v34);
      if (v71[0])
      {
        v35 = *(void ***)(a1 + 8);
        v36 = *(_QWORD *)(a1 + 16);
        if ((unint64_t)v35 >= v36)
        {
          v41 = ((uint64_t)v35 - *(_QWORD *)a1) >> 4;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v43 = v36 - *(_QWORD *)a1;
          if (v43 >> 3 > v42)
            v42 = v43 >> 3;
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
            v44 = 0xFFFFFFFFFFFFFFFLL;
          else
            v44 = v42;
          v80 = a1 + 16;
          v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<CEM::EmojiToken>>>(v44);
          v47 = &v45[16 * v41];
          *(_OWORD *)v47 = *(_OWORD *)v71;
          v71[0] = 0;
          v71[1] = 0;
          v49 = *(_QWORD **)a1;
          v48 = *(_QWORD **)(a1 + 8);
          if (v48 == *(_QWORD **)a1)
          {
            v52 = vdupq_n_s64((unint64_t)v48);
            v50 = &v45[16 * v41];
          }
          else
          {
            v50 = &v45[16 * v41];
            do
            {
              v51 = *((_OWORD *)v48 - 1);
              v48 -= 2;
              *((_OWORD *)v50 - 1) = v51;
              v50 -= 16;
              *v48 = 0;
              v48[1] = 0;
            }
            while (v48 != v49);
            v52 = *(int64x2_t *)a1;
          }
          v37 = (void **)(v47 + 16);
          *(_QWORD *)a1 = v50;
          *(_QWORD *)(a1 + 8) = v47 + 16;
          *(int64x2_t *)&v78.__r_.__value_.__r.__words[1] = v52;
          v53 = *(std::string **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = &v45[16 * v46];
          v79 = v53;
          v78.__r_.__value_.__r.__words[0] = v52.i64[0];
          std::__split_buffer<std::shared_ptr<CEM::EmojiToken>>::~__split_buffer((uint64_t)&v78);
        }
        else
        {
          *v35 = v71[0];
          v35[1] = v71[1];
          v71[0] = 0;
          v71[1] = 0;
          v37 = v35 + 2;
        }
        *(_QWORD *)(a1 + 8) = v37;
      }
      else
      {
        v38 = (std::__shared_weak_count *)v71[1];
        if (v71[1])
        {
          v39 = (unint64_t *)((char *)v71[1] + 8);
          do
            v40 = __ldaxr(v39);
          while (__stlxr(v40 - 1, v39));
          if (!v40)
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }
      }
      ++v34;
    }
    while (v34 != *((unsigned __int16 **)&v33 + 1));
  }
  a3 = v66;
  if ((_QWORD)v33)
    operator delete((void *)v33);
LABEL_88:
  CEM::getUTF8StringFromCFString(&v78, a3);
  if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v54 = &v78;
  else
    v54 = (std::string *)v78.__r_.__value_.__r.__words[0];
  if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v55 = HIBYTE(v78.__r_.__value_.__r.__words[2]);
  else
    v55 = v78.__r_.__value_.__l.__size_;
  CEM::AdaptationController::sortEmojiTokensIfEnabled(a2 + 112, (uint64_t)v54, v55, a1);
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v78.__r_.__value_.__l.__data_);
  if ((a5 - 7) <= 0xFFFFFFFC)
    sortEmojiTokens((__int128 **)a1, *(_BYTE *)(a2 + 784), v56, v57, v58, v59, v60, v61);
}

void sub_18D742034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, int a14, __int16 a15, char a16, char a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,void *a29,int a30,__int16 a31,char a32,char a33,int a34,__int16 a35,char a36,char a37,void *a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,uint64_t a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  uint64_t v54;

  if (a27 < 0)
    operator delete(__p);
  if (a37 < 0)
    operator delete(a29);
  if (*(char *)(v54 - 113) < 0)
    operator delete(*(void **)(v54 - 136));
  if (a38)
  {
    a39 = (uint64_t)a38;
    operator delete(a38);
  }
  if (a54 < 0)
    operator delete(a49);
  std::vector<std::shared_ptr<CEM::EmojiToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a28);
  _Unwind_Resume(a1);
}

_QWORD *CEM::getUTF8StringFromCFString(_QWORD *this, CFStringRef theString)
{
  _QWORD *v2;
  char *CStringPtr;
  CFIndex Length;
  CFIndex v6;
  char *v7;

  v2 = this;
  if (theString)
  {
    CStringPtr = (char *)CFStringGetCStringPtr(theString, 0x8000100u);
    if (!CStringPtr)
    {
      Length = CFStringGetLength(theString);
      v6 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      v7 = (char *)operator new[]();
      CFStringGetCString(theString, v7, v6, 0x8000100u);
      std::string::basic_string[abi:ne180100]<0>(v2, v7);
      JUMPOUT(0x18D7921C8);
    }
    return std::string::basic_string[abi:ne180100]<0>(v2, CStringPtr);
  }
  else
  {
    *this = 0;
    this[1] = 0;
    this[2] = 0;
  }
  return this;
}

void sub_18D74228C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x18D7921C8](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

_QWORD *std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char *>,std::__wrap_iter<char *>>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

std::vector<std::string> **std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](std::vector<std::string> **a1, __int128 *a2)
{
  std::vector<std::string> *v4;
  std::vector<std::string>::pointer end;
  std::allocator<std::string> *p_end_cap;
  __int128 v7;
  std::string *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  std::string *v13;
  __int128 v14;
  std::__split_buffer<std::string> __v;

  v4 = *a1;
  end = (*a1)->__end_;
  p_end_cap = (std::allocator<std::string> *)&(*a1)->__end_cap_;
  if ((unint64_t)end >= *(_QWORD *)p_end_cap)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v4->__begin_) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * ((uint64_t)(*(_QWORD *)p_end_cap - (unint64_t)v4->__begin_) >> 3) > v10)
      v10 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)p_end_cap - (unint64_t)v4->__begin_) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)p_end_cap - (unint64_t)v4->__begin_) >> 3) >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v10;
    __v.__end_cap_.__value_ = p_end_cap;
    if (v11)
      v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v11);
    else
      v12 = 0;
    v13 = (std::string *)(v11 + 24 * v9);
    __v.__first_ = (std::__split_buffer<std::string>::pointer)v11;
    __v.__begin_ = v13;
    __v.__end_cap_.__value_ = (std::string *)(v11 + 24 * v12);
    v14 = *a2;
    v13->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    __v.__end_ = v13 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(v4, &__v);
    v8 = v4->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else
  {
    v7 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v7;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v8 = end + 1;
  }
  v4->__end_ = v8;
  return a1;
}

BOOL CEM::deviceIsChinese(CEM *this)
{
  if (CEM::getDeviceRegionCode(void)::onceToken != -1)
    dispatch_once(&CEM::getDeviceRegionCode(void)::onceToken, &__block_literal_global_37);
  return !CEM::getDeviceRegionCode(void)::__regionCode
      || CFStringCompare((CFStringRef)CEM::getDeviceRegionCode(void)::__regionCode, CFSTR("CH"), 0) == kCFCompareEqualTo;
}

BOOL CEM::shouldShowTaiwanFlagEmoji(CEM *this)
{
  _BOOL8 v1;
  const __CFLocale *v2;
  const __CFLocale *v3;
  const __CFString *Value;

  if (CEM::shouldShowTaiwanFlagEmoji(void)::onceToken != -1)
    dispatch_once(&CEM::shouldShowTaiwanFlagEmoji(void)::onceToken, &__block_literal_global_186);
  if (CEM::shouldShowTaiwanFlagEmoji(void)::_deviceIsChinese)
    return 0;
  v2 = CFLocaleCopyCurrent();
  if (!v2)
    return 1;
  v3 = v2;
  Value = (const __CFString *)CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
  if (Value)
    v1 = CFStringCompare(Value, CFSTR("CN"), 0) != kCFCompareEqualTo;
  else
    v1 = 1;
  CFRelease(v3);
  return v1;
}

void sub_18D7425E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL ___ZN3CEM25shouldShowTaiwanFlagEmojiEv_block_invoke(CEM *a1)
{
  _BOOL8 result;

  result = CEM::deviceIsChinese(a1);
  CEM::shouldShowTaiwanFlagEmoji(void)::_deviceIsChinese = result;
  return result;
}

const __CFString *CEM::copyPreferredLocaleIdentifierFromFrameworkBundleWithLocale(CEM *this, __CFBundle *a2, const __CFLocale *a3)
{
  const __CFString *ValueAtIndex;
  CFLocaleRef OverrideLocaleForLocale;
  CFLocaleRef v7;
  const __CFLocale *v8;
  const __CFAllocator *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  const __CFLocale *v14;
  const __CFString *v15;
  const __CFString *Value;
  const __CFString *v17;
  void *values[2];

  ValueAtIndex = 0;
  if (!this || !a2)
    return ValueAtIndex;
  OverrideLocaleForLocale = CEM::createOverrideLocaleForLocale(a2, a2);
  v7 = OverrideLocaleForLocale;
  values[0] = 0;
  values[1] = OverrideLocaleForLocale;
  if (OverrideLocaleForLocale)
    v8 = OverrideLocaleForLocale;
  else
    v8 = a2;
  values[0] = (void *)MEMORY[0x18D791E5C](v8);
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 1, MEMORY[0x1E0C9B378]);
  v11 = CFBundleCopyBundleLocalizations(this);
  v12 = CFBundleCopyLocalizationsForPreferences(v11, v10);
  v13 = v12;
  if (v12 && !CFArrayGetCount(v12))
  {
    ValueAtIndex = 0;
  }
  else
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, 0);
    v14 = CFLocaleCreate(v9, ValueAtIndex);
    v15 = (const __CFString *)*MEMORY[0x1E0C9B088];
    Value = (const __CFString *)CFLocaleGetValue(v8, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
    v17 = (const __CFString *)CFLocaleGetValue(v14, v15);
    if (CFStringCompare(Value, v17, 0))
      ValueAtIndex = 0;
    else
      CFRetain(ValueAtIndex);
    if (v14)
      CFRelease(v14);
    if (!v13)
      goto LABEL_17;
  }
  CFRelease(v13);
LABEL_17:
  if (v11)
    CFRelease(v11);
  if (v10)
    CFRelease(v10);
  if (v7)
    CFRelease(v7);
  return ValueAtIndex;
}

void sub_18D7427B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  const void *v5;
  va_list va1;
  const void *v7;
  va_list va2;
  uint64_t v9;
  va_list va3;

  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v5 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v7 = va_arg(va3, const void *);
  v9 = va_arg(va3, _QWORD);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)va);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)va1);
  nlp::CFScopedPtr<__CFArray const*>::reset((const void **)va2);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va3, 0);
  _Unwind_Resume(a1);
}

CFLocaleRef CEM::createOverrideLocaleForLocale(CEM *this, const __CFLocale *a2)
{
  const __CFString *v2;
  const __CFString *v4;

  v2 = (const __CFString *)MEMORY[0x18D791E5C](this, a2);
  if (CFStringCompare(v2, CFSTR("ars"), 0))
  {
    if (CFStringCompare(v2, CFSTR("nn"), 0))
    {
      if (CFStringCompare(v2, CFSTR("yue-Hant"), 0))
      {
        if (CFStringCompare(v2, CFSTR("en_CA"), 0) && CFStringCompare(v2, CFSTR("en_JP"), 0))
          return 0;
        v4 = CFSTR("en_US");
      }
      else
      {
        v4 = CFSTR("zh_HK");
      }
    }
    else
    {
      v4 = CFSTR("nb_NO");
    }
  }
  else
  {
    v4 = CFSTR("ar");
  }
  return CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
}

void nlp::CFScopedPtr<__CFArray const*>::reset(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  *a1 = 0;
}

CFLocaleRef CEM::createNormalizedLocale(CEM *this, const __CFLocale *a2)
{
  const __CFAllocator *v2;
  const __CFString *v3;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  const __CFString *LocaleIdentifierFromComponents;
  CFLocaleRef v6;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = (const __CFString *)MEMORY[0x18D791E5C](this, a2);
  ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v2, v3);
  LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(v2, ComponentsFromLocaleIdentifier);
  v6 = CFLocaleCreate(v2, LocaleIdentifierFromComponents);
  if (LocaleIdentifierFromComponents)
    CFRelease(LocaleIdentifierFromComponents);
  if (ComponentsFromLocaleIdentifier)
    CFRelease(ComponentsFromLocaleIdentifier);
  return v6;
}

void sub_18D7429C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFDictionary const*>::reset(&a10, 0);
  _Unwind_Resume(a1);
}

CFBundleRef CEM::SearchEngineResources::createSearchEngineBundleForLocale(CEM::SearchEngineResources *this, const __CFLocale *a2)
{
  __CFError *NormalizedLocale;
  const __CFLocale *v3;
  const __CFLocale *v4;
  CEM::SearchEngineResources *OverrideLocaleForLocale;
  const __CFLocale *v6;
  CFBundleRef SearchEngineBundleForLocale;
  const __CFString *Value;
  const __CFString *v9;
  const __CFString *v10;
  const __CFURL *v11;
  CFStringRef v12;
  uint64_t v13;
  uint64_t v15;
  const __CFURL *propertyValueTypeRefPtr;
  CFErrorRef error[2];
  CEM::SearchEngineResources *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!this)
    return 0;
  NormalizedLocale = CEM::createNormalizedLocale(this, a2);
  error[1] = NormalizedLocale;
  OverrideLocaleForLocale = CEM::createOverrideLocaleForLocale(NormalizedLocale, v3);
  v18 = OverrideLocaleForLocale;
  if (!OverrideLocaleForLocale)
    goto LABEL_33;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v20 = MEMORY[0x18D791E5C](NormalizedLocale);
    v21 = 2112;
    v22 = MEMORY[0x18D791E5C](OverrideLocaleForLocale);
    _os_log_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Attempting to discover search engine resources by using override locale '%@' for locale '%@'", buf, 0x16u);
  }
  SearchEngineBundleForLocale = (CFBundleRef)CEM::SearchEngineResources::createSearchEngineBundleForLocale(OverrideLocaleForLocale, v6);
  CFRelease(OverrideLocaleForLocale);
  if (!SearchEngineBundleForLocale)
  {
LABEL_33:
    if (!NormalizedLocale
      || (Value = (const __CFString *)CFLocaleGetValue(NormalizedLocale, (CFLocaleKey)*MEMORY[0x1E0C9B088]),
          v9 = (const __CFString *)CFLocaleGetValue(NormalizedLocale, (CFLocaleKey)*MEMORY[0x1E0C9B060]),
          !Value)
      || (v10 = v9, CFStringCompare(Value, CFSTR("en"), 0))
      || v10 && CFStringCompare(v10, CFSTR("US"), 0))
    {
      v18 = 0;
    }
    else
    {
      v11 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("term_index"), CFSTR("plist"), CFSTR("SearchModel-en"), 0, v4);
      v18 = v11;
      if (v11)
      {
LABEL_11:
        propertyValueTypeRefPtr = 0;
        error[0] = 0;
        CFURLCopyResourcePropertyForKey(v11, (CFStringRef)*MEMORY[0x1E0C9B5A8], &propertyValueTypeRefPtr, error);
        if (error[0])
        {
          v12 = CFErrorCopyDescription(error[0]);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v20 = (uint64_t)v12;
            _os_log_error_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not determine parent directory for term index asset URL: '%@'", buf, 0xCu);
          }
          CFRelease(error[0]);
          if (v12)
            CFRelease(v12);
        }
        SearchEngineBundleForLocale = CFBundleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], propertyValueTypeRefPtr);
        CFRelease(propertyValueTypeRefPtr);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v13 = MEMORY[0x18D791E5C](NormalizedLocale);
          *(_DWORD *)buf = 138412290;
          v20 = v13;
          _os_log_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Search engine is supported by locale '%@'", buf, 0xCu);
        }
        CFRelease(v11);
        goto LABEL_19;
      }
    }
    v11 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("term_index"), CFSTR("plist"), 0, (__CFString *)NormalizedLocale, v4);
    v18 = v11;
    if (!v11)
    {
      v15 = MEMORY[0x18D791E5C](NormalizedLocale);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_error_impl(&dword_18D71E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not find emoji search engine resources for locale '%@'", buf, 0xCu);
      }
      SearchEngineBundleForLocale = 0;
      if (NormalizedLocale)
        goto LABEL_20;
      return SearchEngineBundleForLocale;
    }
    goto LABEL_11;
  }
LABEL_19:
  if (NormalizedLocale)
LABEL_20:
    CFRelease(NormalizedLocale);
  return SearchEngineBundleForLocale;
}

void sub_18D742D40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

os_log_t __cem_logging_get_default_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.CoreEmoji", "StandardLogger");
  cem_logging_get_default_log_log = (uint64_t)result;
  return result;
}

os_log_t __cem_logging_get_adaptation_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.CoreEmoji", "AdaptationLogger");
  cem_logging_get_adaptation_log_log = (uint64_t)result;
  return result;
}

_QWORD *_CFInit_EmojiTokenWrapper(_QWORD *result)
{
  result[2] = &off_1E2632B30;
  result[3] = 0;
  result[4] = 0;
  result[5] = 0;
  return result;
}

void EmojiTokenWrapper::~EmojiTokenWrapper(const void **this)
{
  char *v1;

  *this = &off_1E2632B30;
  v1 = (char *)(this + 1);
  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(this + 3, 0);
  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v1;

  *this = &off_1E2632B30;
  v1 = (char *)(this + 1);
  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(this + 3, 0);
  std::shared_ptr<CEM::EmojiToken>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  JUMPOUT(0x18D7921ECLL);
}

uint64_t CEM::EmojiToken::EmojiToken(uint64_t a1, int a2, uint64_t a3, CEM::EmojiData *this, uint64_t a5)
{
  unsigned __int16 v5;
  const void **v6;
  CFStringRef String;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  char v13;
  __int16 v14;
  int v15;
  std::logic_error *exception;

  v5 = a3;
  *(_QWORD *)a1 = a5;
  *(_QWORD *)(a1 + 8) = 0;
  v6 = (const void **)(a1 + 8);
  *(_WORD *)(a1 + 22) = a3;
  *(_QWORD *)(a1 + 40) = this;
  if ((a3 & 0x100000000) == 0 || (CEM::EmojiData::isValidIndex(this, (unsigned __int16)a3) & 1) == 0)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "not an emoji");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E2631BE0, MEMORY[0x1E0DE4360]);
  }
  String = CEM::EmojiData::createString(*(CEM::EmojiData **)(a1 + 40), v5);
  nlp::CFScopedPtr<__CFString const*>::reset(v6, String);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(unsigned __int16 *)(v9 + 44);
  if (v10 >= v5)
  {
    LOBYTE(v12) = 0;
    *(_DWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 20) = 0;
    *(_WORD *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 28) = 0;
  }
  else
  {
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10))
      v11 = *(unsigned __int8 *)(**(_QWORD **)(v9 + 16) + 16 * (~v10 + v5) + 12) >> 4;
    else
      v11 = 0;
    *(_DWORD *)(a1 + 16) = v11;
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10))
      v13 = *(_BYTE *)(**(_QWORD **)(v9 + 16) + 16 * (~v10 + v5) + 13);
    else
      v13 = 0;
    *(_BYTE *)(a1 + 20) = v13;
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10))
      v14 = *(_WORD *)(**(_QWORD **)(v9 + 16) + 16 * (~v10 + v5) + 16);
    else
      v14 = 0;
    *(_WORD *)(a1 + 24) = v14;
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10))
      v15 = *(_BYTE *)(**(_QWORD **)(v9 + 16) + 16 * (~v10 + v5) + 12) & 0xF;
    else
      v15 = 0;
    *(_DWORD *)(a1 + 28) = v15;
    if (*(unsigned __int16 *)(v9 + 42) >= (unsigned __int16)(v5 - v10))
      v12 = (*(unsigned __int16 *)(**(_QWORD **)(v9 + 16) + 16 * (~v10 + v5) + 10) >> 2) & 1;
    else
      LOBYTE(v12) = 0;
  }
  *(_BYTE *)(a1 + 32) = v12;
  return a1;
}

void sub_18D7430B0(_Unwind_Exception *a1)
{
  void *v1;
  const void **v2;

  __cxa_free_exception(v1);
  nlp::CFScopedPtr<__CFString const*>::reset(v2, 0);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiToken::EmojiToken(uint64_t a1, unsigned int a2, CEM::EmojiData *this, uint64_t a4)
{
  const void **v6;
  CFStringRef String;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  char v12;
  __int16 v13;
  int v14;
  std::logic_error *exception;

  *(_QWORD *)a1 = a4;
  *(_QWORD *)(a1 + 8) = 0;
  v6 = (const void **)(a1 + 8);
  *(_WORD *)(a1 + 22) = a2;
  *(_QWORD *)(a1 + 40) = this;
  if (!CEM::EmojiData::isValidIndex(this, a2))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "not an emoji");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E2631BE0, MEMORY[0x1E0DE4360]);
  }
  String = CEM::EmojiData::createString(*(CEM::EmojiData **)(a1 + 40), a2);
  nlp::CFScopedPtr<__CFString const*>::reset(v6, String);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(unsigned __int16 *)(v8 + 44);
  if (a2 <= v9)
  {
    LOBYTE(v11) = 0;
    *(_DWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 20) = 0;
    *(_WORD *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 28) = 0;
  }
  else
  {
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9))
      v10 = *(unsigned __int8 *)(**(_QWORD **)(v8 + 16) + 16 * (~v9 + a2) + 12) >> 4;
    else
      v10 = 0;
    *(_DWORD *)(a1 + 16) = v10;
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9))
      v12 = *(_BYTE *)(**(_QWORD **)(v8 + 16) + 16 * (~v9 + a2) + 13);
    else
      v12 = 0;
    *(_BYTE *)(a1 + 20) = v12;
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9))
      v13 = *(_WORD *)(**(_QWORD **)(v8 + 16) + 16 * (~v9 + a2) + 16);
    else
      v13 = 0;
    *(_WORD *)(a1 + 24) = v13;
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9))
      v14 = *(_BYTE *)(**(_QWORD **)(v8 + 16) + 16 * (~v9 + a2) + 12) & 0xF;
    else
      v14 = 0;
    *(_DWORD *)(a1 + 28) = v14;
    if (*(unsigned __int16 *)(v8 + 42) >= (unsigned __int16)(a2 - v9))
      v11 = (*(unsigned __int16 *)(**(_QWORD **)(v8 + 16) + 16 * (~v9 + a2) + 10) >> 2) & 1;
    else
      LOBYTE(v11) = 0;
  }
  *(_BYTE *)(a1 + 32) = v11;
  return a1;
}

void sub_18D7432B4(_Unwind_Exception *a1)
{
  void *v1;
  const void **v2;

  __cxa_free_exception(v1);
  nlp::CFScopedPtr<__CFString const*>::reset(v2, 0);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiToken::baseIndex(CEM::EmojiToken *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (!*((_DWORD *)this + 4) && !*((_BYTE *)this + 20))
    return *((unsigned __int16 *)this + 11);
  v1 = *((_QWORD *)this + 5);
  v2 = *((unsigned __int16 *)this + 11);
  v3 = *(unsigned __int16 *)(v1 + 44);
  if (v2 > v3
    && *(unsigned __int16 *)(v1 + 42) >= (unsigned __int16)(v2 - v3))
  {
    return *(unsigned __int16 *)(**(_QWORD **)(v1 + 16) + 16 * (~v3 + v2) + 14);
  }
  else
  {
    return 0;
  }
}

uint64_t CEM::EmojiToken::createWrapper(uint64_t *a1, const void *a2)
{
  unsigned __int8 v4;
  uint64_t Instance;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;

  CFAllocatorGetDefault();
  {
    unk_1ECF162C0 = 0u;
    unk_1ECF162B0 = 0u;
    _CFGetTypeID_EmojiTokenWrapper(void)::typeID = _CFRuntimeRegisterClass();
  }
  Instance = _CFRuntimeCreateInstance();
  v6 = Instance;
  v8 = *a1;
  v7 = a1[1];
  if (v7)
  {
    v9 = (unint64_t *)(v7 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = *(std::__shared_weak_count **)(Instance + 32);
  *(_QWORD *)(Instance + 24) = v8;
  *(_QWORD *)(Instance + 32) = v7;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (a2)
    nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::acquire((const void **)(v6 + 40), a2);
  return v6;
}

void sub_18D74344C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFArray *CEM::EmojiToken::createWrappers(uint64_t **a1, const void *a2)
{
  __CFArray *Mutable;
  uint64_t *v5;
  uint64_t *v6;
  const void *Wrapper;

  if (a1[1] == *a1)
    return 0;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v5 = *a1;
  v6 = a1[1];
  while (v5 != v6)
  {
    Wrapper = (const void *)CEM::EmojiToken::createWrapper(v5, a2);
    CFArrayAppendValue(Mutable, Wrapper);
    CFRelease(Wrapper);
    v5 += 2;
  }
  return Mutable;
}

__CFString *CEM::EmojiToken::copyNameWithCount(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t Copy;
  unsigned int v6;
  CEM::EmojiToken *v7;
  CEM::EmojiData *v8;
  std::mutex *v9;
  CEM::LocalizedStringTable **v10;
  uint64_t *v11;
  const __CFLocale *v12;
  CEM::LocalizedStringTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  __CFString *v22;
  CEM::LocalizedStringTable *v23;
  CEM::LocalizedStringTable *v24;
  uint64_t BaseTokenCopy;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  const __CFLocale *v29;
  uint64_t v30;
  const void *v31;
  __CFString *v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *Description;
  char v38;
  CFStringRef v39;
  const __CFString *v40;
  const __CFString *v41;
  CFStringRef v42;
  CFStringRef v43;
  CFStringRef v44;
  const __CFString *v45;
  uint64_t v46;
  const __CFURL *v47;
  CEM *PathComponent;
  uint64_t v49;
  void *v50;
  CEM::EmojiToken *v51;
  CEM::EmojiToken *CopyRemovingModifiers;
  uint64_t v55;
  const __CFAllocator *alloc;
  int v57;
  CEM::EmojiToken *v58[2];
  CFStringRef v59;
  CFStringRef v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;

  Copy = CEM::EmojiToken::createCopy((CEM::EmojiData **)a1);
  v6 = *(unsigned __int8 *)(Copy + 20);
  v57 = *(_DWORD *)(Copy + 16);
  v55 = (v57 - 1);
  v58[0] = (CEM::EmojiToken *)Copy;
  alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (1)
  {
    v7 = v58[0];
    if (!v58[0])
      break;
    if (!a2)
    {
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *((unsigned __int16 *)v58[0] + 11);
      v20 = *(unsigned __int16 *)(v18 + 44);
      if (v19 > v20
        && *(unsigned __int16 *)(v18 + 42) >= (unsigned __int16)(v19 - v20)
        && (v21 = CFStringCreateWithCString(alloc, (const char *)(**(_QWORD **)(v18 + 16)+ *(unsigned int *)(**(_QWORD **)(v18 + 16) + 16 * (~v20 + v19) + 22)), 0x8000100u)) != 0)
      {
        v22 = (__CFString *)CFStringCreateCopy(0, v21);
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_75;
    }
    v8 = *(CEM::EmojiData **)a1;
    if (a2 != 1 || !v8)
    {
      if (a2 != 2 || !v8)
      {
        v22 = 0;
        if ((a2 - 3) > 1 || !v8)
          goto LABEL_75;
        v9 = (std::mutex *)((char *)v8 + 792);
        std::mutex::lock((std::mutex *)((char *)v8 + 792));
        v28 = (uint64_t *)((char *)v8 + 88);
        v27 = *((_QWORD *)v8 + 11);
        if (!v27)
        {
          v30 = operator new();
          v31 = (const void *)*((_QWORD *)v8 + 4);
          *(_QWORD *)v30 = 0;
          if (v31)
          {
            CFRetain(v31);
            nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)v30, v31);
            v32 = *(__CFString **)v30;
          }
          else
          {
            v32 = 0;
          }
          v47 = CEM::copyResourceURLFromFrameworkBundle((CEM *)CFSTR("TextToSpeech"), CFSTR("stringsdict"), 0, v32, v29);
          v63 = (uint64_t)v47;
          PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, v47);
          v62 = PathComponent;
          *(_QWORD *)(v30 + 8) = objc_msgSend(objc_alloc((Class)CEM::getNSBundleClass[0](PathComponent)), "initWithURL:", PathComponent);
          if (PathComponent)
            CFRelease(PathComponent);
          if (v47)
            CFRelease(v47);
          v26 = std::unique_ptr<CEM::TextToSpeechStrings>::reset[abi:ne180100](v28, v30);
          v27 = *v28;
        }
        v49 = *((_QWORD *)v7 + 1);
        if (a2 == 3)
          goto LABEL_86;
        if (a2 == 4)
        {
          v49 = objc_msgSend((id)CEM::getNSStringClass((CEM *)v26), "stringWithFormat:", CFSTR("%@_emoji"), v49);
LABEL_86:
          if (v49)
          {
            v50 = (void *)MEMORY[0x18D79242C]();
            v51 = (CEM::EmojiToken *)objc_msgSend(*(id *)(v27 + 8), "localizedStringForKey:value:table:", v49, 0, CFSTR("TextToSpeech"));
            CopyRemovingModifiers = (CEM::EmojiToken *)-[CEM::EmojiToken isEqualToString:](v51, "isEqualToString:", v49);
            if ((_DWORD)CopyRemovingModifiers)
            {
              CopyRemovingModifiers = CEM::EmojiToken::createCopyRemovingModifiers((CEM::EmojiData **)v7);
              v49 = *((_QWORD *)CopyRemovingModifiers + 1);
              if (a2 != 3)
              {
                CopyRemovingModifiers = (CEM::EmojiToken *)objc_msgSend((id)CEM::getNSStringClass(CopyRemovingModifiers), "stringWithFormat:", CFSTR("%@_emoji"), v49);
                v49 = (uint64_t)CopyRemovingModifiers;
              }
              if (v49)
              {
                CopyRemovingModifiers = (CEM::EmojiToken *)objc_msgSend(*(id *)(v27 + 8), "localizedStringForKey:value:table:", v49, 0, CFSTR("TextToSpeech"));
                v51 = CopyRemovingModifiers;
              }
            }
            v22 = (__CFString *)objc_msgSend(objc_alloc((Class)CEM::getNSStringClass(CopyRemovingModifiers)), "initWithFormat:locale:", v51, *(_QWORD *)v27, a3);
            if (-[__CFString isEqualToString:](v22, "isEqualToString:", v49))
            {

              v22 = 0;
            }
            objc_autoreleasePoolPop(v50);
            goto LABEL_74;
          }
        }
        v22 = 0;
        goto LABEL_74;
      }
      v9 = (std::mutex *)((char *)v8 + 792);
      std::mutex::lock((std::mutex *)((char *)v8 + 792));
      v23 = (CEM::LocalizedStringTable *)*((_QWORD *)v8 + 9);
      if (!v23)
      {
        v24 = (CEM::LocalizedStringTable *)operator new();
        CEM::LocalizedStringTable::LocalizedStringTable(v24, CFSTR("AppleName"), *((const __CFLocale **)v8 + 4));
        std::unique_ptr<CEM::LocalizedStringTable>::reset[abi:ne180100]((uint64_t *)v8 + 9, (uint64_t)v24);
        v23 = (CEM::LocalizedStringTable *)*((_QWORD *)v8 + 9);
      }
      v22 = (__CFString *)CEM::LocalizedStringTable::copyValueForKey(v23, *((const __CFString **)v7 + 1));
      if (v22)
        goto LABEL_74;
      BaseTokenCopy = CEM::EmojiToken::createBaseTokenCopy(v7);
      v63 = BaseTokenCopy;
      if (BaseTokenCopy)
        v22 = (__CFString *)CEM::LocalizedStringTable::copyValueForKey(v23, *(const __CFString **)(BaseTokenCopy + 8));
      else
        v22 = 0;
      goto LABEL_73;
    }
    v9 = (std::mutex *)((char *)v8 + 792);
    std::mutex::lock((std::mutex *)((char *)v8 + 792));
    v10 = (CEM::LocalizedStringTable **)*((_QWORD *)v8 + 10);
    if (!v10)
    {
      v11 = (uint64_t *)operator new();
      v12 = (const __CFLocale *)*((_QWORD *)v8 + 4);
      v13 = (CEM::LocalizedStringTable *)operator new();
      CEM::LocalizedStringTable::LocalizedStringTable(v13, CFSTR("Voiceover"), v12);
      *v11 = (uint64_t)v13;
      std::unique_ptr<CEM::VoiceoverStrings>::reset[abi:ne180100]((uint64_t **)v8 + 10, v11);
      v10 = (CEM::LocalizedStringTable **)*((_QWORD *)v8 + 10);
    }
    v14 = *((_QWORD *)v7 + 5);
    v15 = *((unsigned __int16 *)v7 + 11);
    v16 = *(unsigned __int16 *)(v14 + 44);
    if (v15 > v16
      && *(unsigned __int16 *)(v14 + 42) >= (unsigned __int16)(v15 - v16))
    {
      v17 = (*(unsigned __int16 *)(**(_QWORD **)(v14 + 16) + 16 * (~v16 + v15) + 10) >> 3) & 1;
    }
    else
    {
      v17 = 0;
    }
    if (v57)
      v33 = v17;
    else
      v33 = 1;
    if (v33)
      v34 = 0;
    else
      v34 = v57;
    v35 = CEM::EmojiToken::createBaseTokenCopy(v7);
    v63 = v35;
    if (!v35)
    {
      v36 = CEM::EmojiToken::createCopy((CEM::EmojiData **)v7);
      std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&v63, v36);
      v35 = v63;
    }
    Description = CEM::VoiceoverStrings::createDescription(v10, *(CFStringRef *)(v35 + 8), v34, v6);
    v61 = 0;
    v62 = (void *)Description;
    if (v34 == 7)
    {
LABEL_38:
      v22 = (__CFString *)Description;
      goto LABEL_73;
    }
    if (v6)
      v38 = 0;
    else
      v38 = v33;
    if ((v38 & 1) != 0)
    {
      v22 = (__CFString *)CEM::VoiceoverStrings::createDescription(v10, *((CFStringRef *)v7 + 1), 0, 0);
      if (!v22)
        goto LABEL_38;
      goto LABEL_71;
    }
    v39 = 0;
    v59 = 0;
    v60 = 0;
    v58[1] = 0;
    if ((v33 & 1) == 0)
    {
      if (v55 > 6)
        v40 = 0;
      else
        v40 = *(&off_1E2632DB0 + v55);
      v39 = CEM::VoiceoverStrings::createDescription(v10, v40, 0, 0);
      v60 = v39;
    }
    if (v6)
    {
      if (v6 > 4)
        v41 = 0;
      else
        v41 = (const __CFString *)*((_QWORD *)&off_1E2632DE8 + (v6 - 1));
      v42 = CEM::VoiceoverStrings::createDescription(v10, v41, 0, 0);
      v59 = v42;
      if (Description)
      {
LABEL_59:
        if (v39)
        {
          v43 = v39;
          if (v42)
          {
            v43 = v39;
            if (v6 != 4)
            {
              v44 = CFStringCreateWithFormat(0, 0, Description, v39, v42);
              v45 = Description;
              Description = v44;
              goto LABEL_66;
            }
          }
LABEL_67:
          v22 = (__CFString *)CFStringCreateWithFormat(0, 0, Description, v43);
          if (!v42)
            goto LABEL_69;
        }
        else
        {
          if (!v42)
          {
            v22 = 0;
LABEL_72:
            CFRelease(Description);
            goto LABEL_73;
          }
          v43 = v42;
          if (v6 != 4)
            goto LABEL_67;
          v45 = 0;
          v62 = 0;
LABEL_66:
          v22 = (__CFString *)Description;
          Description = v45;
        }
LABEL_68:
        CFRelease(v42);
        goto LABEL_69;
      }
    }
    else
    {
      v42 = 0;
      if (Description)
        goto LABEL_59;
    }
    v22 = 0;
    if (v42)
      goto LABEL_68;
LABEL_69:
    if (v39)
      CFRelease(v39);
LABEL_71:
    if (Description)
      goto LABEL_72;
LABEL_73:
    std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&v63, 0);
LABEL_74:
    std::mutex::unlock(v9);
LABEL_75:
    v46 = CEM::EmojiToken::createBaseTokenCopy(v58[0]);
    std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)v58, v46);
    if (v22)
      goto LABEL_98;
  }
  v22 = 0;
LABEL_98:
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)v58, 0);
  return v22;
}

void sub_18D743B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  std::mutex *v8;
  const void **v9;
  uint64_t v10;
  va_list va;

  va_start(va, a8);
  nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v10 - 88));
  nlp::CFScopedPtr<__CFLocale const*>::reset(v9, 0);
  MEMORY[0x18D7921EC](v9, 0xE0C402B90B96ALL);
  std::mutex::unlock(v8);
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiToken::createCopy(CEM::EmojiData **this)
{
  uint64_t v2;

  v2 = operator new();
  CEM::EmojiToken::EmojiToken(v2, *((unsigned __int16 *)this + 11), this[5], (uint64_t)*this);
  return v2;
}

void sub_18D743D2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x18D7921EC](v1, 0x1060C4030A14F29);
  _Unwind_Resume(a1);
}

uint64_t CEM::EmojiToken::createBaseTokenCopy(CEM::EmojiToken *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;

  if (CEM::EmojiToken::baseIndex(this) == *((unsigned __int16 *)this + 11))
    return 0;
  v3 = operator new();
  v2 = v3;
  v4 = *((_QWORD *)this + 5);
  v5 = *((unsigned __int16 *)this + 11);
  v6 = *(unsigned __int16 *)(v4 + 44);
  if (v5 > v6
    && *(unsigned __int16 *)(v4 + 42) >= (unsigned __int16)(v5 - v6))
  {
    v7 = *(unsigned __int16 *)(**(_QWORD **)(v4 + 16) + 16 * (~v6 + v5) + 14);
  }
  else
  {
    v7 = 0;
  }
  CEM::EmojiToken::EmojiToken(v3, v7, (CEM::EmojiData *)v4, *(_QWORD *)this);
  return v2;
}

void sub_18D743DF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x18D7921EC](v1, 0x1060C4030A14F29);
  _Unwind_Resume(a1);
}

CEM::EmojiToken *CEM::EmojiToken::createCopyRemovingModifiers(CEM::EmojiData **this)
{
  uint64_t BaseTokenCopy;
  uint64_t v2;
  CEM::EmojiToken *v3;
  uint64_t v4;
  CEM::EmojiToken *v6;
  uint64_t v7;

  if (!*((_DWORD *)this + 4) && !*((_BYTE *)this + 20))
    return (CEM::EmojiToken *)CEM::EmojiToken::createCopy(this);
  BaseTokenCopy = CEM::EmojiToken::createBaseTokenCopy((CEM::EmojiToken *)this);
  v6 = 0;
  v7 = BaseTokenCopy;
  if (BaseTokenCopy)
  {
    v2 = BaseTokenCopy;
    do
    {
      v7 = 0;
      std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)&v6, v2);
      v3 = v6;
      v4 = CEM::EmojiToken::createBaseTokenCopy(v6);
      std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&v7, v4);
      v2 = v7;
    }
    while (v7);
  }
  else
  {
    v3 = 0;
  }
  v6 = 0;
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100]((uint64_t *)&v6, 0);
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&v7, 0);
  return v3;
}

void sub_18D743EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&a9, 0);
  std::unique_ptr<CEM::EmojiToken>::reset[abi:ne180100](&a10, 0);
  _Unwind_Resume(a1);
}

uint64_t CEM::Statement::Statement(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, size_t a5, uint64_t *a6)
{
  size_t v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  std::string::size_type v13;
  std::string::size_type v14;
  uint64_t v15;
  void *v16;
  char *v17;
  char *v18;
  std::string::size_type v19;
  std::string *v20;
  std::string::size_type size;
  std::string::size_type v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  std::string v29;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = a4;
  *(_QWORD *)(a1 + 24) = a5;
  memset(&v29, 0, sizeof(v29));
  if (a3)
  {
    std::string::append(&v29, "-", 1uLL);
    std::string::append(&v29, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    v9 = *(const void **)(a1 + 16);
    v8 = *(_QWORD *)(a1 + 24);
  }
  else
  {
    v8 = a5;
    v9 = a4;
  }
  if (v8 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v10 = operator new(v11 + 1);
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = v12 | 0x8000000000000000;
    *(_QWORD *)(a1 + 32) = v10;
  }
  else
  {
    *(_BYTE *)(a1 + 55) = v8;
    v10 = (void *)(a1 + 32);
    if (!v8)
      goto LABEL_12;
  }
  memmove(v10, v9, v8);
LABEL_12:
  v13 = 0;
  *((_BYTE *)v10 + v8) = 0;
  v14 = *(unsigned __int8 *)(a1 + 55);
  if ((v14 & 0x80u) == 0)
    v15 = a1 + 32;
  else
    v15 = *(_QWORD *)(a1 + 32);
  if ((v14 & 0x80u) != 0)
    v14 = *(_QWORD *)(a1 + 40);
LABEL_17:
  v16 = (void *)(v15 + v13);
  v17 = (char *)(v15 + v14);
  while (v17 - (_BYTE *)v16 >= 2)
  {
    v18 = (char *)memchr(v16, 123, v17 - (_BYTE *)v16 - 1);
    if (!v18)
      break;
    if (*(_WORD *)v18 == 32123)
    {
      if (v18 != v17)
      {
        v19 = (std::string::size_type)&v18[-v15];
        if (v19 != -1)
        {
          if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v20 = &v29;
          else
            v20 = (std::string *)v29.__r_.__value_.__r.__words[0];
          if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(v29.__r_.__value_.__r.__words[2]);
          else
            size = v29.__r_.__value_.__l.__size_;
          std::string::replace((std::string *)(a1 + 32), v19, 2uLL, (const std::string::value_type *)v20, size);
          v22 = HIBYTE(v29.__r_.__value_.__r.__words[2]);
          if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v22 = v29.__r_.__value_.__l.__size_;
          v13 = v22 + v19;
          v14 = *(unsigned __int8 *)(a1 + 55);
          if ((v14 & 0x80u) == 0)
            v15 = a1 + 32;
          else
            v15 = *(_QWORD *)(a1 + 32);
          if ((v14 & 0x80u) != 0)
            v14 = *(_QWORD *)(a1 + 40);
          if (v14 >= v13)
            goto LABEL_17;
        }
      }
      break;
    }
    v16 = v18 + 1;
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v23 = *a6;
  v24 = a6[1];
  v29.__r_.__value_.__r.__words[0] = a1 + 56;
  v29.__r_.__value_.__s.__data_[8] = 0;
  v25 = v24 - v23;
  if (v24 != v23)
  {
    if (v25 < 0)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v26 = (char *)operator new(v24 - v23);
    v27 = 0;
    *(_QWORD *)(a1 + 56) = v26;
    *(_QWORD *)(a1 + 64) = v26;
    *(_QWORD *)(a1 + 72) = &v26[32 * (v25 >> 5)];
    do
    {
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v26[v27], v23 + v27);
      v27 += 32;
    }
    while (v23 + v27 != v24);
    *(_QWORD *)(a1 + 64) = &v26[v27];
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 104) = 101;
  return a1;
}

void sub_18D744144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  void **v16;

  if (*(char *)(v15 + 55) < 0)
    operator delete(*v16);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

sqlite3 *CEM::Statement::prepare(CEM::Statement *this)
{
  sqlite3 *result;
  const char *v3;
  NSObject *v4;
  _QWORD *v5;
  const char *v6;
  int v7;
  _QWORD *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = (sqlite3 *)*((_QWORD *)this + 12);
  if (result)
  {
    v3 = (const char *)*((_QWORD *)this + 11);
    if (!v3)
    {
      v3 = (char *)this + 32;
      if (*((char *)this + 55) < 0)
        v3 = *(const char **)v3;
    }
    result = (sqlite3 *)sqlite3_prepare_v2(result, v3, -1, (sqlite3_stmt **)this + 10, (const char **)this + 11);
    if ((_DWORD)result)
    {
      if (cem_logging_get_adaptation_log_onceToken != -1)
        dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
      v4 = cem_logging_get_adaptation_log_log;
      if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
      {
        v5 = (_QWORD *)((char *)this + 32);
        if (*((char *)this + 55) < 0)
          v5 = (_QWORD *)*v5;
        v6 = sqlite3_errmsg(*((sqlite3 **)this + 12));
        v7 = 136315394;
        v8 = v5;
        v9 = 2082;
        v10 = v6;
        _os_log_error_impl(&dword_18D71E000, v4, OS_LOG_TYPE_ERROR, "Could not prepare SQL statement: '%s'. Error: '%{public}s'", (uint8_t *)&v7, 0x16u);
      }
      return (sqlite3 *)sqlite3_finalize(*((sqlite3_stmt **)this + 10));
    }
  }
  return result;
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x1E0DE5040] + 16;
  __cxa_throw(exception, MEMORY[0x1E0DE4E88], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  result = sqlite3_bind_null(*(sqlite3_stmt **)(*(_QWORD *)*a1 + 80), *(_DWORD *)(*a1 + 16));
  **(_DWORD **)(v1 + 8) = result;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1, int *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)*a1 + 80), *(_DWORD *)(*a1 + 16) + 1, *a2);
  **(_DWORD **)(v2 + 8) = result;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1, double *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = sqlite3_bind_double(*(sqlite3_stmt **)(*(_QWORD *)*a1 + 80), *(_DWORD *)(*a1 + 16), *a2);
  **(_DWORD **)(v2 + 8) = result;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  int v4;
  const char *v5;
  int v6;
  uint64_t result;

  v2 = *a1;
  v3 = *(sqlite3_stmt **)(*(_QWORD *)*a1 + 80);
  v4 = *(char *)(a2 + 23);
  if (v4 >= 0)
    v5 = (const char *)a2;
  else
    v5 = *(const char **)a2;
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(a2 + 23);
  else
    v6 = *(_DWORD *)(a2 + 8);
  result = sqlite3_bind_text(v3, *(_DWORD *)(v2 + 16) + 1, v5, v6, 0);
  **(_DWORD **)(v2 + 8) = result;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<CEM::Statement::bindParameters(void)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,std::monostate,unsigned int,double,std::string,std::vector<unsigned char,std::char_traits<char><unsigned char>>> const&>(uint64_t *a1, unsigned __int8 **a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(_QWORD *)*a1 + 80), *(_DWORD *)(*a1 + 16), (const void *)**a2, *((_DWORD *)a2 + 2) - *a2, 0);
  **(_DWORD **)(v2 + 8) = result;
  return result;
}

void std::__shared_ptr_emplace<CEM::AdaptationDatabase>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E26329D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CEM::AdaptationDatabase>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E26329D8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x18D7921ECLL);
}

void std::__shared_ptr_emplace<CEM::AdaptationDatabase>::__on_zero_shared(uint64_t a1)
{
  sqlite3 *v2;

  v2 = *(sqlite3 **)(a1 + 48);
  if (v2)
    sqlite3_close(v2);
  std::mutex::~mutex((std::mutex *)(a1 + 56));
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x1E0DE4F80] + 16;
  __cxa_throw(exception, MEMORY[0x1E0DE4E28], MEMORY[0x1E0DE43F0]);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>> const*,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    v6 = 0;
    do
    {
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>,(std::__variant_detail::_Trait)1>::__copy_constructor(a3 + v6, a1 + v6);
      v6 += 32;
    }
    while (a1 + v6 != a2);
    a3 += v6;
  }
  return a3;
}

_QWORD *std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::find<std::string>(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;
  char v6;
  _QWORD *v7;

  v2 = (_QWORD *)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
    return v2;
  v5 = (_QWORD *)(a1 + 8);
  do
  {
    v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6 >= 0)
      v5 = v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

void std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::~__func()
{
  JUMPOUT(0x18D7921ECLL);
}

_QWORD *std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2632320;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E2632320;
  a2[1] = v2;
  return result;
}

void std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::operator()(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  void *__p[2];
  char v14;
  int v15;

  std::string::basic_string[abi:ne180100]<0>(__p, "id");
  v4 = std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::find<std::string>(a2, __p);
  if (v14 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "string");
  v5 = std::__tree<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>>>>::find<std::string>(a2, __p);
  if (v14 < 0)
    operator delete(__p[0]);
  if ((_QWORD *)(a2 + 8) == v4)
  {
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v9 = cem_logging_get_adaptation_log_log;
    if (!os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
      return;
    LOWORD(__p[0]) = 0;
LABEL_27:
    _os_log_error_impl(&dword_18D71E000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)__p, 2u);
    return;
  }
  if ((_QWORD *)(a2 + 8) == v5)
  {
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v9 = cem_logging_get_adaptation_log_log;
    if (!os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
      return;
    LOWORD(__p[0]) = 0;
    goto LABEL_27;
  }
  if (*((_DWORD *)v4 + 20) != 1)
  {
    if (cem_logging_get_adaptation_log_onceToken != -1)
      dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
    v9 = cem_logging_get_adaptation_log_log;
    if (!os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
      return;
    LOWORD(__p[0]) = 0;
    v10 = "Could not extract uint32_t from std::variant<T> column value map. enumerateStringAndStringId(...);";
    goto LABEL_27;
  }
  if (*((_DWORD *)v5 + 20) == 3)
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (*((char *)v5 + 79) < 0)
    {
      v7 = (void *)v5[7];
      v8 = (void *)v5[8];
    }
    else
    {
      v7 = v5 + 7;
      v8 = (void *)*((unsigned __int8 *)v5 + 79);
    }
    v11 = *((_DWORD *)v4 + 14);
    __p[0] = v7;
    __p[1] = v8;
    v15 = v11;
    v12 = *(_QWORD *)(v6 + 24);
    if (!v12)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **, int *))(*(_QWORD *)v12 + 48))(v12, __p, &v15);
    return;
  }
  if (cem_logging_get_adaptation_log_onceToken != -1)
    dispatch_once(&cem_logging_get_adaptation_log_onceToken, &__block_literal_global_3);
  v9 = cem_logging_get_adaptation_log_log;
  if (os_log_type_enabled((os_log_t)cem_logging_get_adaptation_log_log, OS_LOG_TYPE_ERROR))
  {
    LOWORD(__p[0]) = 0;
    v10 = "Could not extract std::string from std::variant<T> column value map. enumerateStringAndStringId(...);";
    goto LABEL_27;
  }
}

uint64_t std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZNK3CEM28AdaptationDatabaseController26enumerateStringAndStringIdENSt3__18functionIFvNS1_17basic_string_viewIcNS1_11char_traitsIcEEEEjEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0,std::allocator<CEM::AdaptationDatabaseController::enumerateStringAndStringId(std::function<void ()(std::string_view,unsigned int)>)::$_0>,void ()(std::map<std::string,std::variant<std::monostate,unsigned int,double,std::string,std::vector<unsigned char>>> const&)>::target_type()
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringTableForLocalization()
{
  return MEMORY[0x1E0C98068]();
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x1E0C98088](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
  MEMORY[0x1E0C982A0](theSet, theRange.location, theRange.length);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1E0C982C8](alloc);
}

CFCharacterSetRef CFCharacterSetCreateWithBitmapRepresentation(CFAllocatorRef alloc, CFDataRef theData)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982D8](alloc, theData);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1E0C98328](theSet, *(_QWORD *)&theChar);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1E0C987B8](allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987C8](allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F88](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
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

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C991D0](theString, locale);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C991F0](theString, range.location, range.length, replacement);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1E0C99238](tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1E0C99248](string, range, transform, reverse);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99390](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1E0C994D0](url, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4218](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1E0DE4490](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1E0DE46A8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x1E0DE4A00](a1, a2);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E2631C40();
}

void operator delete(void *__p)
{
  off_1E2631C48(__p);
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  off_1E2631C50(__p, a2);
}

uint64_t operator delete()
{
  return off_1E2631C58();
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E2631C60(__sz, a2);
}

uint64_t operator new[]()
{
  return off_1E2631C68();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E2631C70(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E2631C78(__sz, a2);
}

uint64_t operator new()
{
  return off_1E2631C80();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

