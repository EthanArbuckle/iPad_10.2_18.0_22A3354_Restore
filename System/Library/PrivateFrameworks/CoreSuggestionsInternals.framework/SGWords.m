@implementation SGWords

+ (id)normalizeWord:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  UniChar v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  CFIndex v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  UniChar buffer[8];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CFStringRef theString;
  const UniChar *v43;
  const char *v44;
  uint64_t v45;
  CFIndex v46;
  int64_t v47;
  int64_t v48;
  CFRange v49;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGWords.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("word"));

    v5 = 0;
  }
  if ((isLowercaseAscii(v5) & 1) != 0)
  {
LABEL_4:
    v7 = v6;
LABEL_50:
    v27 = v7;
    v28 = v7;
    goto LABEL_51;
  }
  if ((unint64_t)objc_msgSend(v6, "length") <= 4)
  {
    v8 = v6;
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      *(_OWORD *)buffer = 0u;
      v35 = 0u;
      Length = CFStringGetLength(v8);
      theString = v8;
      v45 = 0;
      v46 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      CStringPtr = 0;
      v43 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
      v47 = 0;
      v48 = 0;
      v44 = CStringPtr;
      if (Length >= 1)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 64;
        do
        {
          if ((unint64_t)v15 >= 4)
            v17 = 4;
          else
            v17 = v15;
          v18 = v46;
          if (v46 <= v15)
          {
            v19 = 0;
            v20 = 0;
          }
          else
          {
            if (v43)
            {
              v19 = v43[v15 + v45];
            }
            else if (v44)
            {
              v19 = v44[v45 + v15];
            }
            else
            {
              if (v48 <= v15 || v14 > v15)
              {
                v22 = v17 + v13;
                v23 = v16 - v17;
                v24 = v15 - v17;
                v25 = v24 + 64;
                if (v24 + 64 >= v46)
                  v25 = v46;
                v47 = v24;
                v48 = v25;
                if (v46 >= v23)
                  v18 = v23;
                v49.length = v18 + v22;
                v49.location = v24 + v45;
                CFStringGetCharacters(theString, v49, buffer);
                v14 = v47;
              }
              v19 = buffer[v15 - v14];
            }
            if (v19 <= 0x318Fu)
            {
              if (v19 - 12272 < 0x50 || v19 - 12544 < 0x30)
              {
LABEL_56:

                goto LABEL_4;
              }
            }
            else if (v19 - 12688 < 0x70 || v19 - 19904 < 0x40)
            {
              goto LABEL_56;
            }
            if ((v19 & 0xFF80) == 0x2E80)
              goto LABEL_56;
            v20 = v19;
          }
          if ((v20 - 12032) < 0xE0
            || (v20 - 12352) < 0x60
            || (v20 - 12448) < 0x60
            || (v20 - 12592) < 0x60
            || (v19 & 0xFE00 | 0x100) == 0x3300
            || (v20 - 13312) >> 6 < 0x67
            || (v20 - 19968) >> 9 < 0x29)
          {
            goto LABEL_56;
          }
          ++v15;
          --v13;
          ++v16;
        }
        while (Length != v15);
      }
    }

  }
  v26 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v6, "lowercaseString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v26);

  if (isLowercaseAscii(v27))
  {
    v7 = v27;
    goto LABEL_50;
  }
  if (canTurnIntoAscii(v27))
  {
    fastPathLatinToAsciiTransformation(v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      _PASSimpleICUTransform();
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v28 = v32;

  }
  else
  {
    v28 = &stru_1E7DB83A8;
  }
LABEL_51:

  return v28;
}

+ (id)normalizeLowercaseWord:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ((isLowercaseAscii(v5) & 1) != 0)
    {
LABEL_3:
      v7 = v6;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGWords.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("word"));

    if (isLowercaseAscii(0))
      goto LABEL_3;
  }
  if (canTurnIntoAscii(v6))
  {
    fastPathLatinToAsciiTransformation(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      _PASSimpleICUTransform();
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v11;

  }
  else
  {
    v7 = &stru_1E7DB83A8;
  }
LABEL_11:

  return v7;
}

@end
