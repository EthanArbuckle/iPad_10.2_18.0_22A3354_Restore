@implementation SGInhumans

+ (BOOL)isInhumanName:(id)a3
{
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[8];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD block[6];

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__SGInhumans_isInhumanName___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a2;
    block[5] = a1;
    if (isInhumanName__onceToken != -1)
      dispatch_once(&isInhumanName__onceToken, block);
    objc_msgSend((id)isInhumanName__cacheLock, "lock");
    if ((objc_msgSend((id)isInhumanName__yesCache, "containsObject:", v5) & 1) != 0)
    {
      LOBYTE(v7) = 1;
LABEL_9:
      v8 = (uint64_t)v5;
LABEL_24:
      objc_msgSend((id)isInhumanName__cacheLock, "unlock");
      v5 = (id)v8;
      goto LABEL_25;
    }
    if ((objc_msgSend((id)isInhumanName__noCache, "containsObject:", v5) & 1) != 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_9;
    }
    _PASNormalizeUnicodeString();
    v8 = objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __28__SGInhumans_isInhumanName___block_invoke_2;
    v18[3] = &unk_1E7DAA978;
    v18[4] = &v19;
    +[SGTokenizer enumerateTokensInString:block:](SGTokenizer, "enumerateTokensInString:block:", v8, v18);
    if (*((_BYTE *)v20 + 24))
    {
      v7 = 1;
      if (v5)
      {
LABEL_12:
        v9 = &isInhumanName__yesCache;
        if (!v7)
          v9 = &isInhumanName__noCache;
        v10 = (id)*v9;
        if (objc_msgSend(v5, "_pas_retainsConmingledBackingStore"))
        {
          v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v5);

          v5 = (id)v11;
        }
        objc_msgSend(v10, "addObject:", v5);
        if ((unint64_t)objc_msgSend(v10, "count") >= 0x19)
          objc_msgSend(v10, "removeObjectAtIndex:", 0);

LABEL_23:
        _Block_object_dispose(&v19, 8);
        goto LABEL_24;
      }
    }
    else
    {
      patterns_7942();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "regex2ForKey:", CFSTR("InhumanName/F"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "existsInString:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v14 != 0;

      if (v5)
        goto LABEL_12;
    }
    sgLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_fault_impl(&dword_1C3607000, v15, OS_LOG_TYPE_FAULT, "Got nil name", v17, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
    goto LABEL_23;
  }
  LOBYTE(v7) = 0;
LABEL_25:

  return v7;
}

+ (BOOL)_isInhumanEmailAddressPatternMatch:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  __CFString *v10;
  void *v11;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v15;
  int64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex v22;
  UniChar v23;
  unsigned int v24;
  int64_t v25;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  CFIndex v30;
  uint64_t v31;
  int v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  const char *v48;
  id v49;
  _QWORD v50[5];
  _QWORD block[6];
  UniChar buffer[8];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CFStringRef theString;
  const UniChar *v61;
  const char *v62;
  uint64_t v63;
  CFIndex v64;
  int64_t v65;
  int64_t v66;
  CFRange v67;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGInhumans.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

  }
  patterns_7942();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regex2ForKey:", CFSTR("InhumanEmailExceptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existsInString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = 0;
    goto LABEL_62;
  }
  v10 = (__CFString *)v5;
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v48 = a2;
    v49 = a1;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
    v53 = 0u;
    v54 = 0u;
    *(_OWORD *)buffer = 0u;
    Length = CFStringGetLength(v10);
    theString = v10;
    v63 = 0;
    v64 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v10);
    CStringPtr = 0;
    v61 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v10, 0x600u);
    v65 = 0;
    v66 = 0;
    v62 = CStringPtr;
    if (Length >= 1)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 64;
      v20 = MEMORY[0x1E0C80978];
      do
      {
        if ((unint64_t)v16 >= 4)
          v21 = 4;
        else
          v21 = v16;
        v22 = v64;
        if (v64 <= v16)
        {
          v17 = 0;
          v24 = 0;
          v23 = 0;
        }
        else
        {
          if (v61)
          {
            v23 = v61[v16 + v63];
          }
          else if (v62)
          {
            v23 = v62[v63 + v16];
          }
          else
          {
            v25 = v65;
            if (v66 <= v16 || v65 > v16)
            {
              v27 = v21 + v15;
              v28 = v19 - v21;
              v29 = v16 - v21;
              v30 = v29 + 64;
              if (v29 + 64 >= v64)
                v30 = v64;
              v65 = v29;
              v66 = v30;
              if (v64 >= v28)
                v22 = v28;
              v67.length = v22 + v27;
              v31 = v20;
              v67.location = v29 + v63;
              CFStringGetCharacters(theString, v67, buffer);
              v20 = v31;
              v25 = v65;
            }
            v23 = buffer[v16 - v25];
          }
          v24 = v23;
          if (v23 <= 0x3Eu && ((1 << v23) & 0x5000080000000000) != 0)
          {
LABEL_55:
            v9 = 1;
            goto LABEL_61;
          }
          if (v23 - 48 > 9)
          {
            if (v23 > 0x7Fu)
            {
              v34 = v20;
              v33 = __maskrune(v23, 0x10000uLL);
              v20 = v34;
              v17 = 0;
              goto LABEL_40;
            }
            v17 = 0;
          }
          else
          {
            if (v17 > 5)
              goto LABEL_55;
            ++v17;
          }
        }
        v33 = *(_DWORD *)(v20 + 4 * v24 + 60) & 0x10000;
LABEL_40:
        if (v23 == 45 || v33)
        {
          if (v18 > 30)
            goto LABEL_55;
          ++v18;
        }
        else
        {
          v18 = 0;
        }
        ++v16;
        --v15;
        ++v19;
      }
      while (Length != v16);
    }
    a2 = v48;
    a1 = v49;
  }

  v35 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SGInhumans__isInhumanEmailAddressPatternMatch___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (_isInhumanEmailAddressPatternMatch__onceToken != -1)
    dispatch_once(&_isInhumanEmailAddressPatternMatch__onceToken, block);
  emailAddressDomain(v10);
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)_isInhumanEmailAddressPatternMatch__inhumanEmailDomains, "containsObject:", v36) & 1) != 0)
    goto LABEL_54;
  v37 = -[__CFString rangeOfString:options:](v10, "rangeOfString:options:", CFSTR("@"), 2);
  if (!v38)
    goto LABEL_56;
  v39 = v37;
  v40 = (void *)MEMORY[0x1C3BD4F6C]();
  -[__CFString substringToIndex:](v10, "substringToIndex:", v39);
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v41, "stringByAppendingString:", CFSTR("."));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v41) = -[__CFString containsString:](v36, "containsString:", v42);
  objc_autoreleasePoolPop(v40);
  if ((v41 & 1) != 0)
  {
LABEL_54:
    v9 = 1;
  }
  else
  {
LABEL_56:
    *(_QWORD *)buffer = 0;
    *(_QWORD *)&buffer[4] = buffer;
    *(_QWORD *)&v53 = 0x2020000000;
    BYTE8(v53) = 0;
    v50[0] = v35;
    v50[1] = 3221225472;
    v50[2] = __49__SGInhumans__isInhumanEmailAddressPatternMatch___block_invoke_2;
    v50[3] = &unk_1E7DAA9A0;
    v50[4] = buffer;
    enumerateTokensInEmailAddress(v10, v50);
    if (*(_BYTE *)(*(_QWORD *)&buffer[4] + 24))
    {
      v9 = 1;
    }
    else
    {
      patterns_7942();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "regex2ForKey:", CFSTR("InhumanEmailPatterns/F"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "existsInString:", v10);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v45 != 0;

    }
    _Block_object_dispose(buffer, 8);
  }
  v10 = v36;
LABEL_61:

LABEL_62:
  return v9;
}

+ (BOOL)isInhumanNamedEmailAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "emailAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "isInhumanEmailAddress:", v6) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(a1, "isInhumanName:", v8);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isInhumanPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  int v15;
  char v16;
  void *v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "handles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v5, "handleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]);

      if (v9)
      {
        objc_msgSend(v5, "handles");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(a1, "isInhumanEmailAddress:", v11);
      }
      else
      {
        objc_msgSend(v5, "handleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C967C0]);

        if (!v15)
          goto LABEL_10;
        objc_msgSend(v5, "handles");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(a1, "isInhumanPhoneNumber:", v11);
      }
      v16 = v12;

      if ((v16 & 1) != 0)
      {
        v13 = 1;
        goto LABEL_11;
      }
LABEL_10:
      objc_msgSend(v5, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(a1, "isInhumanName:", v17);

      goto LABEL_11;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)isInhumanPhoneNumber:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  _PASKeepOnlyCharacterSet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = (unint64_t)objc_msgSend(v4, "length") < 7;
  return (char)v3;
}

+ (BOOL)hasTooManyLongNumbers:(id)a3
{
  __CFString *v3;
  void *v4;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  UniChar v16;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  CFIndex v21;
  _OWORD v23[8];
  CFStringRef theString;
  const UniChar *v25;
  const char *v26;
  uint64_t v27;
  CFIndex v28;
  int64_t v29;
  int64_t v30;
  CFRange v31;

  v3 = (__CFString *)a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    memset(v23, 0, sizeof(v23));
    Length = CFStringGetLength(v3);
    theString = v3;
    v27 = 0;
    v28 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    CStringPtr = 0;
    v25 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    v29 = 0;
    v30 = 0;
    v26 = CStringPtr;
    if (Length >= 1)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 64;
      do
      {
        if ((unint64_t)v10 >= 4)
          v14 = 4;
        else
          v14 = v10;
        v15 = v28;
        if (v28 <= v10)
          goto LABEL_28;
        if (v25)
        {
          v16 = v25[v10 + v27];
        }
        else if (v26)
        {
          v16 = v26[v27 + v10];
        }
        else
        {
          if (v30 <= v10 || v9 > v10)
          {
            v18 = v14 + v8;
            v19 = v13 - v14;
            v20 = v10 - v14;
            v21 = v20 + 64;
            if (v20 + 64 >= v28)
              v21 = v28;
            v29 = v20;
            v30 = v21;
            if (v28 >= v19)
              v15 = v19;
            v31.length = v15 + v18;
            v31.location = v20 + v27;
            CFStringGetCharacters(theString, v31, (UniChar *)v23);
            v9 = v29;
          }
          v16 = *((_WORD *)v23 + v10 - v9);
        }
        if ((unsigned __int16)(v16 - 48) > 9u)
        {
LABEL_28:
          v11 = 0;
        }
        else if (++v11 == 4)
        {
          if (v12 > 8)
          {
            LOBYTE(v4) = 1;
            goto LABEL_31;
          }
          ++v12;
          v11 = 4;
        }
        ++v10;
        --v8;
        ++v13;
      }
      while (Length != v10);
    }
    LOBYTE(v4) = 0;
  }
LABEL_31:

  return (char)v4;
}

+ (BOOL)isInhumanBody:(id)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  const char *CStringPtr;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = (__CFString *)a3;
  if ((objc_msgSend(a1, "hasTooManyLongNumbers:", v5) & 1) != 0
    || (patterns_7942(),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "stringSetMatcherForKey:", CFSTR("InhumanBodyLiterals")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "existsInString:", v5),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    if (CStringPtr)
    {
      v12 = CStringPtr;
      patterns_7942();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "regex2ForKey:", CFSTR("InhumanBodyRegexp/F"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "existsInUtf8:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15 != 0;

    }
    else if (-[__CFString length](v5, "length"))
    {
      v16 = 0;
      v17 = 0;
      do
      {
        v18 = -[__CFString length](v5, "length");
        if ((unint64_t)(v18 + v16) >= 0x800)
          v19 = 2048;
        else
          v19 = v18 + v16;
        v20 = malloc_type_calloc(3 * v19 + 1, 1uLL, 0x100004077774924uLL);
        -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v20, 3 * v19, 0, 4, 0, v17, v19, 0);
        if (v20[3 * v19])
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGInhumans.m"), 249, CFSTR("NUL-terminator overwritten. This should be impossible."));

        }
        patterns_7942();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "regex2ForKey:", CFSTR("InhumanBodyRegexp/F"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "existsInUtf8:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v23 != 0;
        free(v20);
        if (v23)
          break;
        v17 += 2048;
        v9 = 0;
        v16 -= 2048;
      }
      while (v17 < -[__CFString length](v5, "length"));
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)areHumanHeaders:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[6];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SGInhumans_areHumanHeaders___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (areHumanHeaders___pasOnceToken5 != -1)
    dispatch_once(&areHumanHeaders___pasOnceToken5, block);
  v6 = (id)areHumanHeaders___pasExprOnceResult;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  v9 = v8;
  if (v8)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1C3BD4F6C](v8);
        objc_msgSend(v12, "key", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lowercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "containsObject:", v15);

        objc_autoreleasePoolPop(v13);
        if ((v16 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v9;
}

void __30__SGInhumans_areHumanHeaders___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  patterns_7942();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawValueForKey:", CFSTR("HumanMailingListHeaders"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGInhumans.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("a"));

  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);

  v6 = (void *)areHumanHeaders___pasExprOnceResult;
  areHumanHeaders___pasExprOnceResult = v5;

  objc_autoreleasePoolPop(v2);
}

void __49__SGInhumans__isInhumanEmailAddressPatternMatch___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  patterns_7942();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawValueForKey:", CFSTR("InhumanEmailDomains"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGInhumans.m"), 136, CFSTR("failed to look up raw value for rawValueKeyInhumanEmailDomains"));

  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
  v4 = (void *)_isInhumanEmailAddressPatternMatch__inhumanEmailDomains;
  _isInhumanEmailAddressPatternMatch__inhumanEmailDomains = v3;

  patterns_7942();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rawValueForKey:", CFSTR("InhumanEmailTokens"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGInhumans.m"), 139, CFSTR("failed to look up raw value for rawValueKeyInhumanEmailTokens"));

  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  v8 = (void *)_isInhumanEmailAddressPatternMatch__inhumanEmailTokens;
  _isInhumanEmailAddressPatternMatch__inhumanEmailTokens = v7;

}

uint64_t __49__SGInhumans__isInhumanEmailAddressPatternMatch___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3;

  v3 = objc_msgSend((id)_isInhumanEmailAddressPatternMatch__inhumanEmailTokens, "containsObject:", a2);
  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return v3 ^ 1u;
}

void __28__SGInhumans_isInhumanName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  patterns_7942();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawValueForKey:", CFSTR("InhumanNameComponents"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGInhumans.m"), 61, CFSTR("failed to get raw value for InhumanNameComponents"));

  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
  v4 = (void *)isInhumanName__inhumanNameTokens;
  isInhumanName__inhumanNameTokens = v3;

  v5 = objc_opt_new();
  v6 = (void *)isInhumanName__cacheLock;
  isInhumanName__cacheLock = v5;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 25);
  v8 = (void *)isInhumanName__yesCache;
  isInhumanName__yesCache = v7;

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 25);
  v10 = (void *)isInhumanName__noCache;
  isInhumanName__noCache = v9;

}

uint64_t __28__SGInhumans_isInhumanName___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend((id)isInhumanName__inhumanNameTokens, "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end
