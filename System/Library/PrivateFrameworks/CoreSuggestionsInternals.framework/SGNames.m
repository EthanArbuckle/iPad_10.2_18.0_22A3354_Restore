@implementation SGNames

+ ($D369DFA4738CCB2DC34F10FA2F14702B)namePayload:(id)a3
{
  id v4;
  id v5;
  void *v6;
  $D369DFA4738CCB2DC34F10FA2F14702B v7;

  v4 = a3;
  if (objc_msgSend(a1, "isProbablyShortCJKName:", v4))
  {
    v5 = v4;
  }
  else
  {
    +[SGWords normalizeWord:](SGWords, "normalizeWord:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = ($D369DFA4738CCB2DC34F10FA2F14702B)nameData(v5);

  return v7;
}

+ (BOOL)isCommonNameWord:(id)a3
{
  return objc_msgSend(a1, "namePayload:", a3) & 1;
}

+ (BOOL)isSalientName:(id)a3
{
  return (objc_msgSend(a1, "namePayload:", a3) >> 2) & 1;
}

+ (BOOL)isFamilyName:(id)a3
{
  return (~objc_msgSend(a1, "namePayload:", a3) & 0xC) == 0;
}

+ (BOOL)isSalientNameByChars:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") < 2)
  {
    v12 = 0;
  }
  else
  {
    v5 = 0;
    v6 = -1;
    v7 = 1;
    do
    {
      v8 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v4, "substringWithRange:", 0, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v8);
      if (objc_msgSend(a1, "isFamilyName:", v9))
      {
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v4, "substringWithRange:", v7, objc_msgSend(v4, "length") + v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v10);
        if (objc_msgSend(a1, "isSalientName:", v11))
          v5 = 1;

      }
      v12 = v5 & 1;
      if (v7 > 1)
        break;
      ++v7;
      --v6;
    }
    while ((v5 & 1) == 0);
  }

  return v12;
}

+ (unsigned)attributesForNameWord:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a1, "namePayload:", a3);
  return (v3 >> 2) & 2 | v3 & 5;
}

+ (BOOL)isLowercaseStringCommonNameWord:(id)a3
{
  void *v3;
  char v4;

  +[SGWords normalizeLowercaseWord:](SGWords, "normalizeLowercaseWord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = nameData(v3);

  return v4 & 1;
}

+ (BOOL)isProbablyShortCJKName:(id)a3
{
  id v3;
  BOOL v4;
  __CFString *v5;
  void *v6;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  UniChar v15;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  CFIndex v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CFStringRef theString;
  const UniChar *v32;
  const char *v33;
  uint64_t v34;
  CFIndex v35;
  int64_t v36;
  int64_t v37;
  CFRange v38;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") <= 5)
  {
    if (isProbablyShortCJKName__onceToken != -1)
      dispatch_once(&isProbablyShortCJKName__onceToken, &__block_literal_global_39);
    v5 = (__CFString *)v3;
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_32;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    Length = CFStringGetLength(v5);
    theString = v5;
    v34 = 0;
    v35 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v32 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    v36 = 0;
    v37 = 0;
    v33 = CStringPtr;
    if (Length >= 1)
    {
      v10 = 0;
      v11 = 0;
      v4 = 1;
      v12 = 64;
      do
      {
        if ((unint64_t)v11 >= 4)
          v13 = 4;
        else
          v13 = v11;
        v14 = v35;
        if (v35 <= v11)
        {
          v15 = 0;
        }
        else if (v32)
        {
          v15 = v32[v11 + v34];
        }
        else if (v33)
        {
          v15 = v33[v34 + v11];
        }
        else
        {
          v16 = v36;
          if (v37 <= v11 || v36 > v11)
          {
            v18 = v13 + v10;
            v19 = v12 - v13;
            v20 = v11 - v13;
            v21 = v20 + 64;
            if (v20 + 64 >= v35)
              v21 = v35;
            v36 = v20;
            v37 = v21;
            if (v35 >= v19)
              v14 = v19;
            v38.length = v14 + v18;
            v38.location = v20 + v34;
            CFStringGetCharacters(theString, v38, (UniChar *)&v23);
            v16 = v36;
          }
          v15 = *((_WORD *)&v23 + v11 - v16);
        }
        if (objc_msgSend((id)isProbablyShortCJKName__commonCJKCharsets, "characterIsMember:", v15, v23, v24, v25, v26, v27, v28, v29, v30))break;
        v4 = ++v11 < Length;
        --v10;
        ++v12;
      }
      while (Length != v11);
    }
    else
    {
LABEL_32:
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isCommonVietnameseSurname:(id)a3
{
  __CFString *v3;
  id v4;
  __CFString *MutableCopy;
  __CFString *v6;
  char v7;

  v3 = (__CFString *)a3;
  if (isCommonVietnameseSurname___pasOnceToken13 != -1)
    dispatch_once(&isCommonVietnameseSurname___pasOnceToken13, &__block_literal_global_40);
  v4 = (id)isCommonVietnameseSurname___pasExprOnceResult;
  if (-[__CFString length](v3, "length") && (MutableCopy = CFStringCreateMutableCopy(0, 0, v3)) != 0)
  {
    v6 = MutableCopy;
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormKC);
    CFStringCapitalize(v6, 0);
    v7 = objc_msgSend(v4, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isDifficultName:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  v5 = SGGuessNamingTradition(v3);
  objc_autoreleasePoolPop(v4);
  v7 = v5 == 5 || (v5 & 0xFFFFFFFD) == 4;

  return v7;
}

+ (BOOL)isCapitalized:(id)a3
{
  id v3;
  const __CFCharacterSet *Predefined;
  __CFString *v5;
  void *v6;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  int64_t v11;
  int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  UniChar v17;
  int IsCharacterMember;
  int64_t v19;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  CFIndex v24;
  BOOL v25;
  _OWORD v27[8];
  CFStringRef theString;
  const UniChar *v29;
  const char *v30;
  uint64_t v31;
  CFIndex v32;
  int64_t v33;
  int64_t v34;
  CFRange v35;

  v3 = a3;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  v5 = (__CFString *)v3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    memset(v27, 0, sizeof(v27));
    Length = CFStringGetLength(v5);
    theString = v5;
    v31 = 0;
    v32 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v29 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    v33 = 0;
    v34 = 0;
    v30 = CStringPtr;
    if (Length >= 1)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 64;
      while (1)
      {
        if ((unint64_t)v11 >= 4)
          v15 = 4;
        else
          v15 = v11;
        v16 = v32;
        if (v32 <= v11)
        {
          v17 = 0;
        }
        else if (v29)
        {
          v17 = v29[v11 + v31];
        }
        else if (v30)
        {
          v17 = v30[v31 + v11];
        }
        else
        {
          v19 = v33;
          if (v34 <= v11 || v33 > v11)
          {
            v21 = v15 + v10;
            v22 = v14 - v15;
            v23 = v11 - v15;
            v24 = v23 + 64;
            if (v23 + 64 >= v32)
              v24 = v32;
            v33 = v23;
            v34 = v24;
            if (v32 >= v22)
              v16 = v22;
            v35.length = v16 + v21;
            v35.location = v23 + v31;
            CFStringGetCharacters(theString, v35, (UniChar *)v27);
            v19 = v33;
          }
          v17 = *((_WORD *)v27 + v11 - v19);
        }
        IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v17);
        if ((v13 & 1) != 0)
        {
          if (!IsCharacterMember)
            ++v12;
        }
        else if (!IsCharacterMember)
        {
          v25 = 0;
          goto LABEL_34;
        }
        ++v11;
        --v10;
        ++v14;
        v13 = 1;
        if (Length == v11)
          goto LABEL_33;
      }
    }
  }
  v12 = 0;
LABEL_33:
  v25 = 1;
LABEL_34:

  if (v12 <= 0)
    v25 = 0;

  return v25;
}

+ (id)stripHonorifics:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "stripAndReturnHonorifics:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)stripAndReturnHonorifics:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  __CFString *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  __CFString *v30;
  _QWORD block[6];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__SGNames_stripAndReturnHonorifics___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a2;
    block[5] = a1;
    if (stripAndReturnHonorifics__onceToken != -1)
      dispatch_once(&stripAndReturnHonorifics__onceToken, block);
    os_unfair_lock_lock((os_unfair_lock_t)&stripAndReturnHonorifics__cacheLock);
    objc_msgSend((id)stripAndReturnHonorifics__cache, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)&stripAndReturnHonorifics__cacheLock);
    if (!v7)
    {
      v8 = (void *)MEMORY[0x1C3BD4F6C]();
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__14499;
      v29 = __Block_byref_object_dispose__14500;
      v30 = &stru_1E7DB83A8;
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__14499;
      v23 = __Block_byref_object_dispose__14500;
      v24 = &stru_1E7DB83A8;
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__14499;
      v17 = __Block_byref_object_dispose__14500;
      v9 = v5;
      v18 = v9;
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __36__SGNames_stripAndReturnHonorifics___block_invoke_49;
      v12[3] = &unk_1E7DAD1D0;
      v12[4] = &v13;
      v12[5] = &v25;
      findEndOfHonorificPrefixCandidate(v9, v12);
      _PASMemoryHeavyOperation();
      v10 = v14[5];
      v32[0] = v26[5];
      v32[1] = v10;
      v32[2] = v20[5];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3, v6, 3221225472, __36__SGNames_stripAndReturnHonorifics___block_invoke_2, &unk_1E7DAD220, &v13, &v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)&stripAndReturnHonorifics__cacheLock);
      if ((unint64_t)objc_msgSend((id)stripAndReturnHonorifics__cache, "count") >= 0xA)
        objc_msgSend((id)stripAndReturnHonorifics__cache, "removeAllObjects");
      objc_msgSend((id)stripAndReturnHonorifics__cache, "setObject:forKeyedSubscript:", v7, v9);
      os_unfair_lock_unlock((os_unfair_lock_t)&stripAndReturnHonorifics__cacheLock);
      _Block_object_dispose(&v13, 8);

      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v25, 8);

      objc_autoreleasePoolPop(v8);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)universalCleanName:(id)a3
{
  CFMutableStringRef MutableCopy;
  CFIndex Length;
  CFIndex v5;
  CFIndex v6;
  CFRange v8;
  CFRange v9;

  MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormC);
  CFStringTrimWhitespace(MutableCopy);
  Length = CFStringGetLength(MutableCopy);
  if (Length >= 2)
  {
    v5 = Length;
    if (CFStringGetCharacterAtIndex(MutableCopy, 0) == 34)
    {
      v6 = v5 - 1;
      if (CFStringGetCharacterAtIndex(MutableCopy, v6) == 34)
      {
        v8.location = v6;
        v8.length = 1;
        CFStringDelete(MutableCopy, v8);
        v9.location = 0;
        v9.length = 1;
        CFStringDelete(MutableCopy, v9);
        CFStringTrimWhitespace(MutableCopy);
      }
    }
  }
  return MutableCopy;
}

+ (id)cleanName:(id)a3
{
  id v3;
  unsigned int v4;
  __CFString *v5;
  unsigned int v6;
  int v7;
  void *v8;
  __CFString *v9;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  UniChar v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFIndex v28;
  int v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  const __CFCharacterSet *v54;
  __CFString *v55;
  void *v56;
  CFIndex v57;
  const char *v58;
  void *v59;
  uint64_t v60;
  int64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  CFIndex v65;
  UniChar v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  int64_t v71;
  CFIndex v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v81;
  __CFString *theString;
  _QWORD v83[5];
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 buffer;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  CFStringRef v102;
  const UniChar *v103;
  const char *v104;
  uint64_t v105;
  CFIndex v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  CFRange v110;
  CFRange v111;

  v109 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    v5 = (__CFString *)v3;
    goto LABEL_69;
  }
  v4 = objc_msgSend(v3, "characterAtIndex:", 0);
  if (v4 > 0x7F)
  {
    if (!__maskrune(v4, 0x4000uLL))
      goto LABEL_7;
  }
  else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v4 + 60) & 0x4000) == 0)
  {
LABEL_7:
    v6 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
    if (v6 > 0x7F)
    {
      if (__maskrune(v6, 0x4000uLL))
        goto LABEL_9;
    }
    else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v6 + 60) & 0x4000) != 0)
    {
      goto LABEL_9;
    }
    v7 = objc_msgSend(v3, "hasSuffix:", CFSTR(" via LinkedIn")) ^ 1;
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:
  if (cleanName__onceToken == -1)
  {
    if (!v7)
      goto LABEL_49;
    goto LABEL_12;
  }
  dispatch_once(&cleanName__onceToken, &__block_literal_global_58);
  if (v7)
  {
LABEL_12:
    v81 = v3;
    theString = (__CFString *)v3;
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = theString;
    if (!v8)
      goto LABEL_67;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    buffer = 0u;
    v95 = 0u;
    Length = CFStringGetLength(theString);
    v102 = theString;
    v105 = 0;
    v106 = Length;
    CharactersPtr = CFStringGetCharactersPtr(theString);
    CStringPtr = 0;
    v103 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    v107 = 0;
    v108 = 0;
    v104 = CStringPtr;
    if (Length <= 0)
    {
LABEL_67:

      v3 = v81;
      goto LABEL_68;
    }
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 1;
    v17 = 64;
    v18 = MEMORY[0x1E0C80978];
    while (1)
    {
      v19 = (unint64_t)v15 >= 4 ? 4 : v15;
      v20 = v106;
      if (v106 <= v15)
        break;
      if (v103)
      {
        v21 = v103[v15 + v105];
      }
      else if (v104)
      {
        v21 = v104[v105 + v15];
      }
      else
      {
        v23 = v107;
        if (v108 <= v15 || v107 > v15)
        {
          v25 = v19 + v13;
          v26 = v17 - v19;
          v27 = v15 - v19;
          v28 = v27 + 64;
          if (v27 + 64 >= v106)
            v28 = v106;
          v107 = v27;
          v108 = v28;
          if (v106 >= v26)
            v20 = v26;
          v110.length = v20 + v25;
          v110.location = v27 + v105;
          CFStringGetCharacters(v102, v110, (UniChar *)&buffer);
          v23 = v107;
        }
        v21 = *((_WORD *)&buffer + v15 - v23);
      }
      v22 = v21;
      if (v21 <= 0x7Fu)
        goto LABEL_37;
      if (__maskrune(v21, 0x4000uLL))
      {
LABEL_41:
        if ((v14 & 1) != 0)
          v16 = 0;
        v14 = 1;
        goto LABEL_47;
      }
      if (!__maskrune(v21, 0x500uLL))
      {
LABEL_45:
        v14 = 0;
        if (CFCharacterSetIsCharacterMember((CFCharacterSetRef)cleanName__suspiciousChars, v21))
          v16 = 0;
        goto LABEL_47;
      }
LABEL_39:
      v14 = 0;
LABEL_47:
      ++v15;
      --v13;
      ++v17;
      if (Length == v15)
      {

        v3 = v81;
        v9 = theString;
        if ((v16 & 1) == 0)
          goto LABEL_49;
LABEL_68:
        v5 = v9;
LABEL_69:
        v59 = v5;
        goto LABEL_102;
      }
    }
    v22 = 0;
    v21 = 0;
LABEL_37:
    v29 = *(_DWORD *)(v18 + 4 * v22 + 60);
    if ((v29 & 0x4000) != 0)
      goto LABEL_41;
    if ((v29 & 0x500) == 0)
      goto LABEL_45;
    goto LABEL_39;
  }
LABEL_49:
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__14499;
  v88 = __Block_byref_object_dispose__14500;
  v89 = 0;
  v30 = v3;
  removeParens(v3);
  v89 = (id)objc_claimAutoreleasedReturnValue();
  _PASCollapseWhitespaceAndStrip();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v85[5];
  v85[5] = v31;

  _PASStripQuotationMarks();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v85[5];
  v85[5] = v33;

  if (objc_msgSend((id)v85[5], "hasSuffix:", CFSTR(" via LinkedIn")))
  {
    v35 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend((id)v85[5], "substringToIndex:", objc_msgSend((id)v85[5], "length") - 13);
    v36 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v35);
    v37 = (void *)v85[5];
    v85[5] = v36;

  }
  v38 = (id)v85[5];
  v39 = v38;
  if (v38 && (v40 = objc_msgSend(v38, "rangeOfString:options:", CFSTR("@"), 2), v41))
  {
    v42 = (void *)MEMORY[0x1C3BD4F6C](v40);
    objc_msgSend(v39, "componentsSeparatedByString:", CFSTR(" "));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v42);
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v43, "count"));
    v93 = 0u;
    v91 = 0u;
    v92 = 0u;
    v90 = 0u;
    v45 = v43;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v90, &buffer, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v91 != v47)
            objc_enumerationMutation(v45);
          v49 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v49, "rangeOfString:options:", CFSTR("@"), 2);
          if (!v50)
            objc_msgSend(v44, "addObject:", v49);
        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v90, &buffer, 16);
      }
      while (v46);
    }

    v51 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v44, "_pas_componentsJoinedByString:", CFSTR(" "));
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v51);

  }
  else
  {
    v52 = v39;
  }

  v53 = (void *)v85[5];
  v85[5] = (uint64_t)v52;

  v54 = (const __CFCharacterSet *)_PASGetQuotationMarkCharacterSet();
  v55 = (__CFString *)(id)v85[5];
  objc_opt_self();
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v56)
    goto LABEL_100;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  buffer = 0u;
  v95 = 0u;
  v57 = CFStringGetLength(v55);
  v102 = v55;
  v105 = 0;
  v106 = v57;
  v103 = CFStringGetCharactersPtr(v55);
  v58 = v103 ? 0 : CFStringGetCStringPtr(v55, 0x600u);
  v107 = 0;
  v108 = 0;
  v104 = v58;
  if (v57 <= 0)
  {
LABEL_100:

    goto LABEL_101;
  }
  v60 = 0;
  v61 = 0;
  v62 = 0;
  v63 = 64;
  do
  {
    if ((unint64_t)v61 >= 4)
      v64 = 4;
    else
      v64 = v61;
    v65 = v106;
    if (v106 <= v61)
    {
      v66 = 0;
LABEL_95:
      if (!CFCharacterSetIsCharacterMember(v54, v66))
        goto LABEL_97;
      goto LABEL_96;
    }
    if (v103)
    {
      v66 = v103[v61 + v105];
    }
    else if (v104)
    {
      v66 = v104[v105 + v61];
    }
    else
    {
      v67 = v107;
      if (v108 <= v61 || v107 > v61)
      {
        v69 = v64 + v60;
        v70 = v63 - v64;
        v71 = v61 - v64;
        v72 = v71 + 64;
        if (v71 + 64 >= v106)
          v72 = v106;
        v107 = v71;
        v108 = v72;
        if (v106 >= v70)
          v65 = v70;
        v111.length = v65 + v69;
        v111.location = v71 + v105;
        CFStringGetCharacters(v102, v111, (UniChar *)&buffer);
        v67 = v107;
      }
      v66 = *((_WORD *)&buffer + v61 - v67);
    }
    if (v66 != 34)
      goto LABEL_95;
LABEL_96:
    ++v62;
LABEL_97:
    ++v61;
    --v60;
    ++v63;
  }
  while (v57 != v61);

  if (v62 >= 2)
  {
    v73 = (void *)MEMORY[0x1C3BD4F6C]();
    patterns_14444();
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "regex2ForKey:", CFSTR("QuotedNickname"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v85[5];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __21__SGNames_cleanName___block_invoke_2;
    v83[3] = &unk_1E7DAF888;
    v83[4] = &v84;
    objc_msgSend(v75, "enumerateMatchesInString:ngroups:block:", v76, 2, v83);

    objc_autoreleasePoolPop(v73);
  }
LABEL_101:
  v77 = (void *)MEMORY[0x1C3BD4F6C]();
  v78 = (void *)v85[5];
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "stringByTrimmingCharactersInSet:", v79);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v77);
  _Block_object_dispose(&v84, 8);

  v3 = v30;
LABEL_102:

  return v59;
}

+ (id)handleLastNameFirstOrder:(id)a3
{
  id v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v13;
  int64_t v14;
  int v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  UniChar v20;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  CFIndex v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  _QWORD v33[4];
  __CFString *v34;
  UniChar *v35;
  _QWORD block[6];
  UniChar buffer[8];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CFStringRef theString;
  const UniChar *v46;
  const char *v47;
  uint64_t v48;
  CFIndex v49;
  int64_t v50;
  int64_t v51;
  CFRange v52;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v6)
  {
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_29;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    *(_OWORD *)buffer = 0u;
    v38 = 0u;
    Length = CFStringGetLength(v7);
    theString = v7;
    v48 = 0;
    v49 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v7);
    CStringPtr = 0;
    v46 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    v50 = 0;
    v51 = 0;
    v47 = CStringPtr;
    if (Length >= 1)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 64;
      do
      {
        if ((unint64_t)v16 >= 4)
          v18 = 4;
        else
          v18 = v16;
        v19 = v49;
        if (v49 > v16)
        {
          if (v46)
          {
            v20 = v46[v16 + v48];
          }
          else if (v47)
          {
            v20 = v47[v48 + v16];
          }
          else
          {
            if (v51 <= v16 || v14 > v16)
            {
              v22 = v18 + v13;
              v23 = v17 - v18;
              v24 = v16 - v18;
              v25 = v24 + 64;
              if (v24 + 64 >= v49)
                v25 = v49;
              v50 = v24;
              v51 = v25;
              if (v49 >= v23)
                v19 = v23;
              v52.length = v19 + v22;
              v52.location = v24 + v48;
              CFStringGetCharacters(theString, v52, buffer);
              v14 = v50;
            }
            v20 = buffer[v16 - v14];
          }
          if (v20 == 44)
            ++v15;
        }
        ++v16;
        --v13;
        ++v17;
      }
      while (Length != v16);
    }
    else
    {
LABEL_29:
      v15 = 0;
    }

    *(_QWORD *)buffer = 0;
    *(_QWORD *)&buffer[4] = buffer;
    *(_QWORD *)&v38 = 0x3032000000;
    *((_QWORD *)&v38 + 1) = __Block_byref_object_copy__14499;
    *(_QWORD *)&v39 = __Block_byref_object_dispose__14500;
    v26 = v7;
    *((_QWORD *)&v39 + 1) = v26;
    if (v15 == 1)
    {
      v27 = (void *)MEMORY[0x1C3BD4F6C]();
      v28 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__SGNames_handleLastNameFirstOrder___block_invoke;
      block[3] = &__block_descriptor_48_e5_v8__0l;
      block[4] = a2;
      block[5] = a1;
      if (handleLastNameFirstOrder___pasOnceToken24 != -1)
        dispatch_once(&handleLastNameFirstOrder___pasOnceToken24, block);
      v29 = (id)handleLastNameFirstOrder___pasExprOnceResult;
      objc_msgSend(v29, "result");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = -[__CFString length](v26, "length");
      v33[0] = v28;
      v33[1] = 3221225472;
      v33[2] = __36__SGNames_handleLastNameFirstOrder___block_invoke_3;
      v33[3] = &unk_1E7DAD288;
      v34 = v26;
      v35 = buffer;
      objc_msgSend(v30, "enumerateMatchesInString:options:range:usingBlock:", v34, 0, 0, v31, v33);

      objc_autoreleasePoolPop(v27);
      v26 = *(__CFString **)(*(_QWORD *)&buffer[4] + 40);
    }
    v8 = v26;
    _Block_object_dispose(buffer, 8);

  }
  return v8;
}

+ (double)nameSimilarity:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  __CFString *v9;
  void *v10;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  UniChar v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFIndex v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  BOOL v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  double v64;
  void *v65;
  int v66;
  double v67;
  double v68;
  int v70;
  _BOOL4 v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  UniChar buffer[8];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  CFStringRef theString;
  const UniChar *v85;
  const char *v86;
  uint64_t v87;
  CFIndex v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[3];
  _QWORD v92[5];
  CFRange v93;

  v92[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1C3BD4F6C]();
  v8 = 0.0;
  if (!objc_msgSend(v5, "length") || !objc_msgSend(v6, "length"))
    goto LABEL_80;
  v9 = (__CFString *)v5;
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_28;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  *(_OWORD *)buffer = 0u;
  v77 = 0u;
  Length = CFStringGetLength(v9);
  theString = v9;
  v87 = 0;
  v88 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  v85 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  v89 = 0;
  v90 = 0;
  v86 = CStringPtr;
  if (Length < 1)
  {
LABEL_28:

LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString rangeOfCharacterFromSet:](v9, "rangeOfCharacterFromSet:", v26);
    v28 = v27;
    objc_msgSend(v6, "rangeOfCharacterFromSet:", v26);
    v8 = 0.0;
    if (v28 | v29)
    {
      v30 = v29;
      v8 = 10.0;
      if ((-[__CFString isEqualToString:](v9, "isEqualToString:", v6) & 1) == 0)
      {
        if (v28 && v30)
          goto LABEL_34;
        SGNamesOnlyNameChars(v9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        SGNamesOnlyNameChars(v6);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "isEqualToString:", v32);

        v8 = 8.0;
        if ((v33 & 1) == 0)
        {
LABEL_34:
          tokenizeName(v9);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          tokenizeName(v6);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 0.0;
          if (objc_msgSend(v34, "count") && objc_msgSend(v35, "count"))
          {
            if ((unint64_t)objc_msgSend(v34, "count") >= 4)
            {
              objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v92[0] = v36;
              objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v92[1] = v37;
              objc_msgSend(v34, "objectAtIndexedSubscript:", objc_msgSend(v34, "count") - 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v92[2] = v38;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
              v39 = objc_claimAutoreleasedReturnValue();

              v34 = (void *)v39;
            }
            if ((unint64_t)objc_msgSend(v35, "count") >= 4)
            {
              objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v91[0] = v40;
              objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v91[1] = v41;
              objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v35, "count") - 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v91[2] = v42;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
              v43 = objc_claimAutoreleasedReturnValue();

              v35 = (void *)v43;
            }
            v44 = objc_msgSend(v35, "count");
            v45 = objc_msgSend(v34, "count");
            v46 = v44 >= v45;
            if (v44 >= v45)
              v47 = v34;
            else
              v47 = v35;
            if (!v46)
              v35 = v34;
            if (objc_msgSend(v47, "count") == 2 && objc_msgSend(v35, "count") == 3)
            {
              objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v48, "length"))
              {
                objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                if ((unint64_t)objc_msgSend(v49, "length") < 3)
                {
                  v52 = 0;
                }
                else
                {
                  objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v74, "characterAtIndex:", 0);
                  objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = v50 == objc_msgSend(v51, "characterAtIndex:", 0);

                }
              }
              else
              {
                v52 = 0;
              }

            }
            else
            {
              v52 = 0;
            }
            objc_msgSend(v47, "objectAtIndexedSubscript:", objc_msgSend(v47, "count") - 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v35, "count") - 1);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v52;
            if (v52 || objc_msgSend(v53, "isEqualToString:", v73))
            {
              v75 = v53;
              v56 = objc_msgSend(v54, "characterAtIndex:", 0);
              v57 = v56 == objc_msgSend(v55, "characterAtIndex:", 0);
              v53 = v75;
              if (v57
                || (+[SGNicknames nicknamesForName:](SGNicknames, "nicknamesForName:", v54),
                    v58 = (void *)objc_claimAutoreleasedReturnValue(),
                    v59 = objc_msgSend(v58, "containsObject:", v55),
                    v58,
                    v53 = v75,
                    v59))
              {
                if (objc_msgSend(v47, "count") != 3 || objc_msgSend(v35, "count") != 3)
                  goto LABEL_67;
                objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = objc_msgSend(v60, "characterAtIndex:", 0);
                objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend(v61, "characterAtIndex:", 0);
                v63 = v71;
                if (v70 == v62)
                  v63 = 1;
                v72 = v63;

                v53 = v75;
                if (v72 == 1)
                {
LABEL_67:
                  v64 = 0.0;
                  if (objc_msgSend(v35, "containsObject:", v54))
                    v64 = limitedTermProb(v54) + 0.0;
                  if ((objc_msgSend(v54, "isEqualToString:", v53) & 1) == 0
                    && objc_msgSend(v35, "containsObject:", v53))
                  {
                    v64 = v64 + limitedTermProb(v53);
                  }
                  +[SGNicknames nicknamesForName:](SGNicknames, "nicknamesForName:", v54);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v66 = objc_msgSend(v65, "containsObject:", v55);

                  if (v66)
                  {
                    v67 = limitedTermProb(v54);
                    v68 = limitedTermProb(v55);
                    if (v67 < v68)
                      v68 = v67;
                    v64 = v64 + v68 + 0.602059991;
                  }
                  v8 = -v64;
                  v53 = v75;
                }
              }
            }

          }
          else
          {
            v47 = v34;
          }

        }
      }
    }

    goto LABEL_80;
  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 64;
  while (1)
  {
    v18 = (unint64_t)v16 >= 4 ? 4 : v16;
    v19 = v88;
    if (v88 > v16)
    {
      if (v85)
      {
        v20 = v85[v16 + v87];
      }
      else if (v86)
      {
        v20 = v86[v87 + v16];
      }
      else
      {
        if (v90 <= v16 || v15 > v16)
        {
          v22 = v18 + v14;
          v23 = v17 - v18;
          v24 = v16 - v18;
          v25 = v24 + 64;
          if (v24 + 64 >= v88)
            v25 = v88;
          v89 = v24;
          v90 = v25;
          if (v88 >= v23)
            v19 = v23;
          v93.length = v19 + v22;
          v93.location = v24 + v87;
          CFStringGetCharacters(theString, v93, buffer);
          v15 = v89;
        }
        v20 = buffer[v16 - v15];
      }
      if (v20 > 0x7Fu)
        break;
    }
    ++v16;
    --v14;
    ++v17;
    if (Length == v16)
      goto LABEL_28;
  }

  v8 = 10.0;
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", v6) & 1) == 0)
    goto LABEL_29;
LABEL_80:
  objc_autoreleasePoolPop(v7);

  return v8;
}

+ (double)unnormalizedNameSimilarity:(id)a3 and:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a4;
  SGNormalizeName((uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeName((uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGNames nameSimilarity:and:](SGNames, "nameSimilarity:and:", v6, v7);
  v9 = v8;

  return v9;
}

+ (BOOL)namesApproximatelyMatch:(id)a3 and:(id)a4
{
  return objc_msgSend(a1, "namesApproximatelyMatch:and:threshold:", a3, a4, 4.0);
}

+ (BOOL)namesApproximatelyMatch:(id)a3 and:(id)a4 threshold:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;

  v7 = a4;
  SGNormalizeName((uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeName((uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGNames nameSimilarity:and:](SGNames, "nameSimilarity:and:", v8, v9);
  v11 = v10 >= a5;

  return v11;
}

+ (BOOL)unnormalizedNamesApproximatelyMatch:(id)a3 and:(id)a4
{
  return +[SGNames unnormalizedNamesApproximatelyMatch:and:threshold:](SGNames, "unnormalizedNamesApproximatelyMatch:and:threshold:", a3, a4, 4.0);
}

+ (BOOL)unnormalizedNamesApproximatelyMatch:(id)a3 and:(id)a4 threshold:(double)a5
{
  double v6;

  +[SGNames unnormalizedNameSimilarity:and:](SGNames, "unnormalizedNameSimilarity:and:", a3, a4);
  return v6 > a5;
}

+ (id)nameFromEmail:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex v23;
  int v24;
  int v25;
  BOOL v26;
  int v27;
  void *v28;
  __int16 v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v40;
  CFIndex v41;
  const UniChar *v42;
  const char *v43;
  CFIndex v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  UniChar v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  CFIndex v65;
  void *v66;
  void *v67;
  __CFString *v68;
  CFIndex v69;
  void *v70;
  void *v71;
  __int16 v72;
  UniChar buffer[8];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __CFString *v81;
  const UniChar *v82;
  const char *v83;
  uint64_t v84;
  CFIndex v85;
  uint64_t v86;
  int64_t v87;
  CFRange v88;
  CFRange v89;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_opt_new();
    v5 = (__CFString *)v3;
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      *(_OWORD *)buffer = 0u;
      v74 = 0u;
      Length = CFStringGetLength(v5);
      v81 = v5;
      v84 = 0;
      v85 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v5);
      CStringPtr = 0;
      v82 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
      v70 = v4;
      v83 = CStringPtr;
      v86 = 0;
      v87 = 0;
      if (Length >= 1)
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 64;
        while (1)
        {
          if ((unint64_t)v12 >= 4)
            v16 = 4;
          else
            v16 = v12;
          v17 = v85;
          if (v85 <= v12)
          {
            v18 = 0;
          }
          else
          {
            if (v82)
            {
              v18 = v82[v12 + v84];
            }
            else if (v83)
            {
              v18 = v83[v84 + v12];
            }
            else
            {
              if (v87 <= v12 || v11 > v12)
              {
                v20 = v16 + v10;
                v21 = v15 - v16;
                v22 = v12 - v16;
                v23 = v22 + 64;
                if (v22 + 64 >= v85)
                  v23 = v85;
                v86 = v22;
                v87 = v23;
                if (v85 >= v21)
                  v17 = v21;
                v88.length = v17 + v20;
                v88.location = v22 + v84;
                CFStringGetCharacters(v81, v88, buffer);
                v11 = v86;
              }
              v18 = buffer[v12 - v11];
            }
            if ((unsigned __int16)v18 == 64)
              goto LABEL_39;
          }
          v24 = (unsigned __int16)v18;
          v25 = ((unsigned __int16)(v18 - 45) < 0x33u) & (0x4000000000003uLL >> (v18
                                                                                                - 45)) & ((unsigned __int16)v13 == 0);
          if ((((unsigned __int16)(v18 - 45) < 0x33u) & (0x4000000000003uLL >> (v18
                                                                                                - 45)) & ((unsigned __int16)v13 == 0)) == 0)
            v18 = v13;
          v26 = v24 == (unsigned __int16)v13;
          if (v24 == (unsigned __int16)v13)
            v27 = 1;
          else
            v27 = v25;
          if (!v26)
            v13 = v18;
          v14 += v27;
          ++v12;
          --v10;
          ++v15;
          if (Length == v12)
            goto LABEL_39;
        }
      }
      v14 = 0;
      LOWORD(v13) = 0;
LABEL_39:
      v4 = v70;
    }
    else
    {
      v14 = 0;
      LOWORD(v13) = 0;
    }

    if ((v14 - 1) >= 3)
      v29 = 0;
    else
      v29 = v13;

    v72 = v29;
    v30 = v5;
    v31 = (void *)MEMORY[0x1C3BD4F6C]();
    -[__CFString componentsSeparatedByString:](v30, "componentsSeparatedByString:", CFSTR("@"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v31);
    if (objc_msgSend(v32, "count") == 2)
    {
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }

    if (v29)
    {
      v34 = (void *)MEMORY[0x1C3BD4F6C]();
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v72, 1);
      objc_msgSend(v33, "componentsSeparatedByString:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v36);

      objc_autoreleasePoolPop(v34);
      goto LABEL_53;
    }
    if (v33)
    {
      v37 = v33;
      if ((unint64_t)-[__CFString length](v37, "length") < 2
        || -[__CFString characterAtIndex:](v37, "characterAtIndex:", 0) - 91 < 0xFFFFFFE6)
      {

        goto LABEL_52;
      }
      v40 = (void *)objc_opt_new();
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      *(_OWORD *)buffer = 0u;
      v74 = 0u;
      v41 = CFStringGetLength(v37);
      v81 = v37;
      v84 = 0;
      v85 = v41;
      v42 = CFStringGetCharactersPtr(v37);
      v43 = 0;
      v82 = v42;
      if (!v42)
        v43 = CFStringGetCStringPtr(v37, 0x600u);
      v44 = 0;
      v83 = v43;
      v86 = 0;
      v87 = 0;
      if (v41 < 2)
      {
LABEL_91:
        v61 = (void *)MEMORY[0x1C3BD4F6C]();
        -[__CFString substringFromIndex:](v37, "substringFromIndex:", v44);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v62);

        objc_autoreleasePoolPop(v61);
        goto LABEL_92;
      }
      v67 = v40;
      v68 = v37;
      v45 = 0;
      v44 = 0;
      v66 = v33;
      v65 = v41;
      v69 = v41 - 1;
      v71 = v4;
      v46 = -1;
      v47 = 1;
      v48 = 65;
      while (1)
      {
        v49 = v45 + 1;
        if (v47 >= 4)
          v50 = 4;
        else
          v50 = v47;
        v51 = (void *)MEMORY[0x1C3BD4F6C]();
        v52 = v85;
        if (v85 <= v49)
        {
          v54 = 0;
          v53 = 0;
        }
        else
        {
          if (v82)
          {
            v53 = v82[v45 + 1 + v84];
          }
          else if (v83)
          {
            v53 = v83[v84 + 1 + v45];
          }
          else
          {
            if (v87 <= v49 || (v55 = v86, v86 > v49))
            {
              v56 = v45 - v50 + 65;
              if (v56 >= v85)
                v56 = v85;
              v86 = v45 - v50 + 1;
              v87 = v56;
              if (v85 >= v48 - v50)
                v52 = v48 - v50;
              v89.length = v52 + v50 + v46;
              v89.location = v45 - v50 + 1 + v84;
              CFStringGetCharacters(v81, v89, buffer);
              v55 = v86;
            }
            v53 = buffer[v45 + 1 - v55];
          }
          v54 = v53;
          if (v53 > 0x7Fu)
          {
            v57 = __maskrune(v53, 0x2000uLL);
            goto LABEL_82;
          }
        }
        v57 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v54 + 60) & 0x2000;
LABEL_82:
        if (v57)
          v58 = 1;
        else
          v58 = (unsigned __int16)(v53 - 65) > 0x19u;
        if (v58)
        {
          objc_autoreleasePoolPop(v51);
          if (v57)
          {
            v64 = 0;
            v4 = v71;
            v33 = v66;
            v40 = v67;
            v37 = v68;
            goto LABEL_98;
          }
        }
        else
        {
          v59 = (void *)MEMORY[0x1C3BD4F6C]();
          -[__CFString substringWithRange:](v68, "substringWithRange:", v44, v45 - v44 + 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObject:", v60);

          objc_autoreleasePoolPop(v59);
          objc_autoreleasePoolPop(v51);
          v44 = v45 + 1;
        }
        ++v47;
        ++v45;
        --v46;
        ++v48;
        if (v69 == v45)
        {
          v33 = v66;
          v4 = v71;
          v40 = v67;
          v37 = v68;
          if (v44 <= v65)
            goto LABEL_91;
LABEL_92:
          if ((unint64_t)objc_msgSend(v40, "count", v65) < 2)
          {
            v63 = 0;
          }
          else if ((unint64_t)objc_msgSend(v40, "count") >= 4)
          {
            v63 = 0;
          }
          else
          {
            v63 = v40;
          }
          v64 = v63;
LABEL_98:

          if (v64)
          {
            objc_msgSend(v4, "addObjectsFromArray:", v64);

            break;
          }
LABEL_52:
          objc_msgSend(v4, "addObject:", v37, v65);
          break;
        }
      }
    }
LABEL_53:
    if (objc_msgSend(v4, "count", v65))
    {
      v38 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v4, "_pas_componentsJoinedByString:", CFSTR(" "));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v38);
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)sketchesForName:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  UniChar v18;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  CFIndex v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  uint64_t v42;
  char v43;
  size_t v44;
  char *v45;
  char *v46;
  size_t v47;
  int v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  __CFString *v56;
  uint64_t v57;
  BOOL v58;
  __CFString *v59;
  __CFString *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  uint64_t v71;
  int v72;
  id v73;
  const __CFString *v74;
  __CFString *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _OWORD v84[8];
  __CFString *v85;
  const UniChar *v86;
  const char *v87;
  uint64_t v88;
  CFIndex v89;
  int64_t v90;
  int64_t v91;
  _BYTE v92[128];
  __CFString *v93;
  void *v94;
  void *v95;
  _BYTE v96[128];
  void *v97;
  _QWORD v98[3];
  CFRange v99;

  v98[1] = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  -[__CFString rangeOfString:options:](v3, "rangeOfString:options:", CFSTR("@"), 2);
  if (v4 || !-[__CFString length](v3, "length"))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_3;
  }
  v3 = v3;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_37;
  memset(v84, 0, sizeof(v84));
  Length = CFStringGetLength(v3);
  v85 = v3;
  v88 = 0;
  v89 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  v86 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  v90 = 0;
  v91 = 0;
  v87 = CStringPtr;
  if (Length <= 0)
  {
LABEL_37:

LABEL_38:
    v25 = (void *)MEMORY[0x1C3BD4F6C]();
    -[__CFString lowercaseString](v3, "lowercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_39;
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 64;
  do
  {
    if ((unint64_t)v13 >= 4)
      v16 = 4;
    else
      v16 = v13;
    v17 = v89;
    if (v89 <= v13)
    {
LABEL_40:

      if (v3)
      {
        SGNamesAsciify(v3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        _PASRemoveSomePunctuation();
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v28 = (void *)objc_opt_new();
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v29 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString componentsSeparatedByCharactersInSet:](v3, "componentsSeparatedByCharactersInSet:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v29);
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v81 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            if (objc_msgSend(v36, "length") && (objc_msgSend(v36, "hasSuffix:", CFSTR(":")) & 1) == 0)
              objc_msgSend(v28, "addObject:", v36);
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
        }
        while (v33);
      }

      if (!objc_msgSend(v28, "count"))
      {
        v5 = (void *)MEMORY[0x1E0C9AA60];
        v41 = &stru_1E7DB83A8;
        v50 = &stru_1E7DB83A8;
        v51 = &stru_1E7DB83A8;
LABEL_100:

        goto LABEL_3;
      }
      if (objc_msgSend(v28, "count") == 1)
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        letters(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v39, "mutableCopy");

        v41 = &stru_1E7DB83A8;
        v74 = &stru_1E7DB83A8;
        v75 = &stru_1E7DB83A8;
LABEL_89:
        v5 = (void *)objc_opt_new();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v66 = v40;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v77;
          do
          {
            for (j = 0; j != v68; ++j)
            {
              if (*(_QWORD *)v77 != v69)
                objc_enumerationMutation(v66);
              v71 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
              if (v71 && objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "length"))
                objc_msgSend(v5, "addObject:", v71);
            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
          }
          while (v68);
        }

        v50 = (__CFString *)v74;
        v51 = v75;
        goto LABEL_100;
      }
      v52 = MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v28, "_pas_componentsJoinedByString:", CFSTR(" "));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGIdentityName nameWithString:](SGIdentityName, "nameWithString:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "firstname");
      v55 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "middlename");
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "surname");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v55)
        v58 = v57 == 0;
      else
        v58 = 0;
      if (v58)
        v41 = 0;
      else
        v41 = (__CFString *)v55;
      if (v58)
        v59 = (__CFString *)v55;
      else
        v59 = (__CFString *)v57;
      v75 = v59;
      v60 = v56;
      -[__CFString rangeOfString:options:](v56, "rangeOfString:options:", CFSTR(" "), 2);
      v61 = (void *)v52;
      if (v62)
      {

        v60 = &stru_1E7DB83A8;
      }
      if (v41 && -[__CFString length](v41, "length"))
      {
        sketchWithInitialAndName(v41, v75);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v63;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v64, "mutableCopy");

        if (!v60 || (unint64_t)-[__CFString length](v60, "length") < 2)
          goto LABEL_88;
        sketchWithInitialAndName(v41, v60);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v65);
      }
      else
      {
        if (!v75 || !-[__CFString length](v75, "length"))
        {
          v40 = 0;
LABEL_88:
          v74 = v60;

          objc_autoreleasePoolPop(v61);
          goto LABEL_89;
        }
        v93 = v75;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v65, "mutableCopy");
      }

      goto LABEL_88;
    }
    if (v86)
    {
      v18 = v86[v13 + v88];
    }
    else if (v87)
    {
      v18 = v87[v88 + v13];
    }
    else
    {
      if (v91 <= v13 || v12 > v13)
      {
        v20 = v16 + v11;
        v21 = v15 - v16;
        v22 = v13 - v16;
        v23 = v22 + 64;
        if (v22 + 64 >= v89)
          v23 = v89;
        v90 = v22;
        v91 = v23;
        if (v89 >= v21)
          v17 = v21;
        v99.length = v17 + v20;
        v99.location = v22 + v88;
        CFStringGetCharacters(v85, v99, (UniChar *)v84);
        v12 = v90;
      }
      v18 = *((_WORD *)v84 + v13 - v12);
    }
    if (v18 - 65 > 0x39 || ((1 << (v18 - 65)) & 0x3FFFFFF03FFFFFFLL) == 0)
    {
      if (v18 != 32 || (v14 & 1) != 0)
        goto LABEL_40;
      v14 = 1;
    }
    ++v13;
    --v11;
    ++v15;
  }
  while (Length != v13);

  if ((v14 & 1) == 0)
    goto LABEL_38;
  v25 = (void *)MEMORY[0x1C3BD4F6C]();
  v42 = -[__CFString rangeOfString:options:](v3, "rangeOfString:options:", CFSTR(" "), 2);
  v43 = -[__CFString characterAtIndex:](v3, "characterAtIndex:", 0);
  v44 = -[__CFString length](v3, "length") - v42 + 3;
  v84[0] = 0uLL;
  if (v44 > 0x200)
  {
    v72 = malloc_type_posix_memalign((void **)v84, 8uLL, v44, 0x418FDE2EuLL);
    BYTE8(v84[0]) = 0;
    if (v72)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v73 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v73);
    }
    v45 = *(char **)&v84[0];
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    v45 = (char *)&v74 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v45, v44);
  }
  v3 = objc_retainAutorelease(v3);
  snprintf(v45, v44, "%c.%s", v43, (const char *)(-[__CFString UTF8String](v3, "UTF8String") + v42 + 1));
  if (v44)
  {
    v46 = v45;
    v47 = v44;
    do
    {
      v48 = *v46;
      if ((v48 - 65) <= 0x19)
        *v46 = v48 + 32;
      ++v46;
      --v47;
    }
    while (v47);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v45);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44 > 0x200)
    free(v45);
LABEL_39:
  objc_autoreleasePoolPop(v25);
LABEL_3:

  return v5;
}

+ (id)surnameFromName:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    +[SGIdentityName nameWithString:](SGIdentityName, "nameWithString:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "surname");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)bestName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  unint64_t v30;
  id v31;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    v8 = CFSTR("@");
    do
    {
      v9 = 0;
      v33 = v6;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v9);
        if (objc_msgSend(v10, "rangeOfString:options:", v8, 2, v33) == 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v10, "length"))
        {
          v11 = v7;
          v12 = v8;
          v13 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedIntegerValue");

          if (v16 <= 3)
            v19 = kNameScoreByWordCount[v16];
          else
            v19 = 1;
          v7 = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 + v19 + 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v10);

          objc_autoreleasePoolPop(v13);
          v8 = v12;
          v6 = v33;
        }
        else
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E7E0C140, v10);
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v6);
  }

  v21 = v4;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = 0;
    v26 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v21);
        v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v21, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "unsignedIntegerValue");

        if (v30 > v24)
        {
          v31 = v28;

          v24 = v30;
          v25 = v31;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v23);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)sgNameFromString:(id)a3 origin:(id)a4 recordId:(id)a5 extractionInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "length"))
  {
    +[SGIdentityName nameWithString:](SGIdentityName, "nameWithString:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toSGNameWithOrigin:recordId:extractionInfo:", v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)possibleNameStringFromEmailAddress:(id)a3
{
  id v3;
  void *v4;
  size_t v5;
  id v6;
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const char *CStringPtr;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  UniChar v18;
  __darwin_ct_rune_t v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  CFIndex v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v30;
  id v31;
  int v32;
  id v33;
  __CFString *v34;
  size_t v35;
  id v36;
  char *v37;
  _OWORD buffer[8];
  __CFString *v39;
  const UniChar *CharactersPtr;
  const char *v41;
  uint64_t v42;
  CFIndex v43;
  int64_t v44;
  int64_t v45;
  uint64_t v46;
  CFRange v47;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SGInhumans isInhumanEmailAddress:](SGInhumans, "isInhumanEmailAddress:", v3))
  {
    v4 = 0;
    goto LABEL_52;
  }
  v5 = (2 * objc_msgSend(v3, "length")) | 1;
  buffer[0] = 0uLL;
  if (v5 > 0x200)
  {
    v32 = malloc_type_posix_memalign((void **)buffer, 8uLL, 2 * objc_msgSend(v3, "length"), 0x1000040BDFB0063uLL);
    BYTE8(buffer[0]) = 0;
    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v33);
    }
    v37 = *(char **)&buffer[0];
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    v37 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v37, v5);
  }
  if (possibleNameStringFromEmailAddress___pasOnceToken48 != -1)
    dispatch_once(&possibleNameStringFromEmailAddress___pasOnceToken48, &__block_literal_global_86_14454);
  v6 = (id)possibleNameStringFromEmailAddress___pasExprOnceResult;
  v7 = (__CFString *)v3;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    memset(buffer, 0, sizeof(buffer));
    v36 = v3;
    v35 = v5;
    Length = CFStringGetLength(v7);
    v39 = v7;
    v42 = 0;
    v43 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v7);
    v34 = v7;
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    v44 = 0;
    v45 = 0;
    v41 = CStringPtr;
    if (Length >= 1)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 1;
      v15 = 64;
      do
      {
        if ((unint64_t)v12 >= 4)
          v16 = 4;
        else
          v16 = v12;
        v17 = v43;
        if (v43 <= v12)
        {
          v19 = 0;
          v18 = 0;
        }
        else
        {
          if (CharactersPtr)
          {
            v18 = CharactersPtr[v12 + v42];
          }
          else if (v41)
          {
            v18 = v41[v42 + v12];
          }
          else
          {
            v20 = v44;
            if (v45 <= v12 || v44 > v12)
            {
              v22 = v16 + v11;
              v23 = v15 - v16;
              v24 = v12 - v16;
              v25 = v24 + 64;
              if (v24 + 64 >= v43)
                v25 = v43;
              v44 = v24;
              v45 = v25;
              if (v43 >= v23)
                v17 = v23;
              v47.length = v17 + v22;
              v47.location = v24 + v42;
              CFStringGetCharacters(v39, v47, (UniChar *)buffer);
              v20 = v44;
            }
            v18 = *((_WORD *)buffer + v12 - v20);
          }
          v19 = v18;
          if (v18 == 64)
          {
            if (v13)
            {
              if (*(_WORD *)&v37[2 * v13 - 2] == 32)
                v30 = v13 - 1;
              else
                v30 = v13;
            }
            else
            {
              v30 = 0;
            }
            v3 = v36;
            v5 = v35;
            v28 = v34;
            v31 = objc_alloc(MEMORY[0x1E0CB3940]);
            v4 = (void *)objc_msgSend(v31, "initWithCharacters:length:", v37, v30);
            goto LABEL_50;
          }
        }
        v26 = objc_msgSend(v6, "characterIsMember:", v18, v34);
        if ((_DWORD)v26)
        {
          if (v13 && *(_WORD *)&v37[2 * v13 - 2] != 32)
          {
            LOWORD(v19) = 32;
LABEL_42:
            *(_WORD *)&v37[2 * v13++] = v19;
            goto LABEL_43;
          }
          v26 = v14;
        }
        else
        {
          if ((unsigned __int16)(v18 - 48) >= 0xAu)
          {
            if ((v14 & 1) != 0)
              LOWORD(v19) = __toupper(v19);
            goto LABEL_42;
          }
          v26 = 0;
        }
LABEL_43:
        ++v12;
        --v11;
        ++v15;
        v14 = v26;
      }
      while (Length != v12);
    }
    v3 = v36;
    v5 = v35;
    v7 = v34;
  }

  sgLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buffer[0]) = 0;
    _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "Given a putative e-mail address with no @", (uint8_t *)buffer, 2u);
  }

  sgLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buffer[0]) = 138412290;
    *(_QWORD *)((char *)buffer + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEBUG, "Given a putative e-mail address with no @: %@", (uint8_t *)buffer, 0xCu);
  }
  v4 = 0;
LABEL_50:

  if (v5 >= 0x201)
    free(v37);
LABEL_52:

  return v4;
}

+ (id)nameStringFromEmailAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "possibleNameStringFromEmailAddress:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)MEMORY[0x1C3BD4F6C](v5);
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "length") != 1 && !objc_msgSend(a1, "isCommonNameWord:", v12))
        {

          v13 = 0;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }

  v13 = v5;
LABEL_12:

  return v13;
}

+ (id)cjkSpacerCharacters
{
  if (cjkSpacerCharacters__pasOnceToken53 != -1)
    dispatch_once(&cjkSpacerCharacters__pasOnceToken53, &__block_literal_global_89_14442);
  return (id)cjkSpacerCharacters__pasExprOnceResult;
}

+ (id)cjkSpacersToWhiteSpace:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  char *v8;
  __CFString *v9;
  void *v10;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v14;
  int64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  unsigned __int16 v20;
  int v21;
  __int16 v22;
  int64_t v23;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  CFIndex v28;
  __CFString *v29;
  uint64_t v30;
  id v32;
  int v33;
  id v34;
  uint64_t v35;
  __CFString *v36;
  size_t v37;
  id v38;
  _OWORD buffer[8];
  __CFString *v40;
  const UniChar *v41;
  const char *v42;
  uint64_t v43;
  CFIndex v44;
  int64_t v45;
  int64_t v46;
  uint64_t v47;
  CFRange v48;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SGNames cjkSpacerCharacters](SGNames, "cjkSpacerCharacters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  if (!v5)
  {
    v29 = &stru_1E7DB83A8;
    goto LABEL_41;
  }
  v6 = v5;
  v7 = (2 * v5) | 1;
  buffer[0] = 0uLL;
  if (v7 > 0x200)
  {
    v33 = malloc_type_posix_memalign((void **)buffer, 8uLL, 2 * v5, 0x1000040BDFB0063uLL);
    BYTE8(buffer[0]) = 0;
    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v34);
    }
    v8 = *(char **)&buffer[0];
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v8, v7);
  }
  v9 = (__CFString *)v3;
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_35;
  memset(buffer, 0, sizeof(buffer));
  Length = CFStringGetLength(v9);
  v40 = v9;
  v43 = 0;
  v44 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  v41 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  v45 = 0;
  v46 = 0;
  v42 = CStringPtr;
  if (Length <= 0)
  {
LABEL_35:

LABEL_38:
    v30 = -[__CFString copy](v9, "copy");
    goto LABEL_39;
  }
  v36 = v9;
  v35 = v6;
  v37 = v7;
  v38 = v3;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 64;
  do
  {
    if ((unint64_t)v15 >= 4)
      v18 = 4;
    else
      v18 = v15;
    v19 = v44;
    if (v44 <= v15)
    {
      v20 = 0;
    }
    else if (v41)
    {
      v20 = v41[v15 + v43];
    }
    else if (v42)
    {
      v20 = v42[v43 + v15];
    }
    else
    {
      v23 = v45;
      if (v46 <= v15 || v45 > v15)
      {
        v25 = v18 + v14;
        v26 = v17 - v18;
        v27 = v15 - v18;
        v28 = v27 + 64;
        if (v27 + 64 >= v44)
          v28 = v44;
        v45 = v27;
        v46 = v28;
        if (v44 >= v26)
          v19 = v26;
        v48.length = v19 + v25;
        v48.location = v27 + v43;
        CFStringGetCharacters(v40, v48, (UniChar *)buffer);
        v23 = v45;
      }
      v20 = *((_WORD *)buffer + v15 - v23);
    }
    v21 = objc_msgSend(v4, "characterIsMember:", v20, v35);
    if (v21)
      v22 = 32;
    else
      v22 = v20;
    if (v21)
      v16 = 1;
    *(_WORD *)&v8[2 * v15++] = v22;
    --v14;
    ++v17;
  }
  while (Length != v15);
  v9 = v36;

  v3 = v38;
  v7 = v37;
  if ((v16 & 1) == 0)
    goto LABEL_38;
  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
  v30 = objc_msgSend(v32, "initWithCharacters:length:", v8, v35);
LABEL_39:
  v29 = (__CFString *)v30;
  if (v7 >= 0x201)
    free(v8);
LABEL_41:

  return v29;
}

+ (BOOL)shouldInvertOrderOfFirst:(id)a3 last:(id)a4
{
  id v5;
  id v6;
  int v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  v7 = _PASIsAllUppercase();
  if (_PASIsAllUppercase() + v7 == 1)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v5, "lowercaseString");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v9);

    v11 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v6, "lowercaseString");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v11);

    v8 = +[SGNameInversionPredictor shouldInvertFirst:last:](SGNameInversionPredictor, "shouldInvertFirst:last:", v10, v12);
    v6 = (id)v12;
    v5 = (id)v10;
  }

  return v8;
}

void __30__SGNames_cjkSpacerCharacters__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)MEMORY[0x1E0CB3500];
  patterns_14444();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawValueForKey:", CFSTR("CJKSpacers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "characterSetWithCharactersInString:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)cjkSpacerCharacters__pasExprOnceResult;
  cjkSpacerCharacters__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

void __46__SGNames_possibleNameStringFromEmailAddress___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-_. "));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)possibleNameStringFromEmailAddress___pasExprOnceResult;
  possibleNameStringFromEmailAddress___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __36__SGNames_handleLastNameFirstOrder___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  v3 = objc_alloc(MEMORY[0x1E0D815E0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SGNames_handleLastNameFirstOrder___block_invoke_2;
  v6[3] = &__block_descriptor_48_e26___NSRegularExpression_8__0l;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "initWithBlock:", v6);
  v5 = (void *)handleLastNameFirstOrder___pasExprOnceResult;
  handleLastNameFirstOrder___pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v2);
}

void __36__SGNames_handleLastNameFirstOrder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v33;

  v33 = a2;
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v33, "rangeAtIndex:", 1);
  v8 = v7;
  v31 = objc_msgSend(v33, "rangeAtIndex:", 2);
  v10 = v9;
  v11 = objc_msgSend(v33, "rangeAtIndex:", 3);
  v13 = v12;
  v14 = objc_msgSend(v33, "rangeAtIndex:", 4);
  v16 = v15;
  if (v13)
  {
    v17 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v11, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v5, "addObject:", v18);

  }
  if (v16)
  {
    v19 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v14, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v5, "addObject:", v20);

  }
  if (v8)
  {
    v21 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v5, "addObject:", v22);

  }
  if (v10)
  {
    v23 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v31, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v23);
    objc_msgSend(v5, "addObject:", v26);

  }
  v27 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v5, "_pas_componentsJoinedByString:", CFSTR(" "));
  v28 = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v27);
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v30 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v28;

  *a4 = 1;
}

id __36__SGNames_handleLastNameFirstOrder___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  id v9;

  patterns_14444();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawValueForKey:", CFSTR("LastNameFirst"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGNames.m"), 914, CFSTR("Could not initialize pattern."));

  }
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v3, 0, &v9);
  v5 = v9;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGNames.m"), 917, CFSTR("Could not initialize regular expression: %@"), v5);

  }
  return v4;
}

uint64_t __21__SGNames_cleanName___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a2[3] != 0x7FFFFFFFFFFFFFFFLL && a2[6] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)MEMORY[0x1C3BD4F6C]();
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "substringWithRange:", a2[3], a2[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "substringWithRange:", a2[6], a2[7]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@ %@"), v6, v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_autoreleasePoolPop(v4);
  }
  return 0;
}

void __21__SGNames_cleanName___block_invoke()
{
  __CFCharacterSet *Mutable;
  const __CFCharacterSet *v1;

  Mutable = CFCharacterSetCreateMutable(0);
  CFCharacterSetAddCharactersInString(Mutable, CFSTR("()<>[]\"@"));
  v1 = (const __CFCharacterSet *)_PASGetQuotationMarkCharacterSet();
  CFCharacterSetUnion(Mutable, v1);
  cleanName__suspiciousChars = (uint64_t)CFCharacterSetCreateCopy(0, Mutable);
  CFRelease(Mutable);
}

void __36__SGNames_stripAndReturnHonorifics___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v3 = (void *)stripAndReturnHonorifics__cache;
  stripAndReturnHonorifics__cache = v2;

  patterns_14444();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawValueForKey:", CFSTR("LeadingHonorificPeriodRequired"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGNames.m"), 755, CFSTR("failed to get patterns for LeadingHonorificPeriodRequired"));

  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v13);
  v6 = (void *)stripAndReturnHonorifics__prefixesPeriodRequired;
  stripAndReturnHonorifics__prefixesPeriodRequired = v5;

  patterns_14444();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rawValueForKey:", CFSTR("LeadingHonorificPeriodOptional"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGNames.m"), 758, CFSTR("failed to get patterns for LeadingHonorificPeriodOptional"));

  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
  v10 = (void *)stripAndReturnHonorifics__prefixesPeriodOptional;
  stripAndReturnHonorifics__prefixesPeriodOptional = v9;

}

void __36__SGNames_stripAndReturnHonorifics___block_invoke_49(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "substringToIndex:", a2 - a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)stripAndReturnHonorifics__prefixesPeriodOptional, "containsObject:");
  if ((v8 & 1) != 0 || !a4)
  {
    if (!v8)
      goto LABEL_5;
    goto LABEL_4;
  }
  if ((objc_msgSend((id)stripAndReturnHonorifics__prefixesPeriodRequired, "containsObject:", v15) & 1) != 0)
  {
LABEL_4:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "substringToIndex:", a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "substringFromIndex:", a3);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
LABEL_5:

}

void __36__SGNames_stripAndReturnHonorifics___block_invoke_2(int8x16_t *a1)
{
  uint64_t v1;
  int8x16_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  _QWORD v11[4];
  id v12;

  v1 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v2 = vextq_s8(a1[2], a1[2], 8uLL);
  v3 = *(void **)(*(_QWORD *)(a1[2].i64[0] + 8) + 40);
  v9[1] = 3221225472;
  v9[2] = __36__SGNames_stripAndReturnHonorifics___block_invoke_3;
  v9[3] = &unk_1E7DAD1F8;
  v10 = v2;
  v4 = v9;
  v5 = enumerateTrailingHonorificMatchesInString_onceToken;
  v6 = v3;
  if (v5 != -1)
    dispatch_once(&enumerateTrailingHonorificMatchesInString_onceToken, &__block_literal_global_170);
  v7 = (void *)enumerateTrailingHonorificMatchesInString_trailingRe;
  v8 = objc_msgSend(v6, "length");
  v11[0] = v1;
  v11[1] = 3221225472;
  v11[2] = __enumerateTrailingHonorificMatchesInString_block_invoke_2;
  v11[3] = &unk_1E7DAD430;
  v12 = v4;
  objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, 0, v8, v11);

}

uint64_t __36__SGNames_stripAndReturnHonorifics___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "substringWithRange:", a2, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "substringToIndex:", a2);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "hasSuffix:", CFSTR(",")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "substringToIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length") - 1);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  return 0;
}

void __37__SGNames_isCommonVietnameseSurname___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  patterns_14444();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawValueForKey:", CFSTR("CommonVietnameseSurnameList"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = v3;
  else
    v5 = MEMORY[0x1E0C9AA60];
  v6 = objc_msgSend(v1, "initWithArray:", v5);
  v7 = (void *)isCommonVietnameseSurname___pasExprOnceResult;
  isCommonVietnameseSurname___pasExprOnceResult = v6;

  objc_autoreleasePoolPop(v0);
}

void __34__SGNames_isProbablyShortCJKName___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  chineseCharSet();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v0, "mutableCopy");

  japaneseCharSet();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v1);

  hangulCharSet();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v2);

  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)isProbablyShortCJKName__commonCJKCharsets;
  isProbablyShortCJKName__commonCJKCharsets = v3;

}

@end
