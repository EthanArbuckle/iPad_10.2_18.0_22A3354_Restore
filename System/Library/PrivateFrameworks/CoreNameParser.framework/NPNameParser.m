@implementation NPNameParser

- (NPNameParser)init
{
  NPNameParser *v2;
  NPNameParser *v3;
  uint64_t v4;
  NPNameComponentsData *nameComponentsData;
  NPHMMClassifier *v6;
  NPNameComponentsData *v7;
  NPHMMClassifier *v8;
  _OWORD v10[3];
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NPNameParser;
  v2 = -[NPNameParser init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_confidenceThreshold = 1.0;
    v4 = objc_opt_new();
    nameComponentsData = v3->_nameComponentsData;
    v3->_nameComponentsData = (NPNameComponentsData *)v4;

    v6 = [NPHMMClassifier alloc];
    v7 = v3->_nameComponentsData;
    v10[0] = xmmword_1DA475578;
    v10[1] = unk_1DA475588;
    v10[2] = xmmword_1DA475598;
    v11 = 0x3FF0000000000000;
    v8 = -[NPHMMClassifier initWithHMMProbabilities:nameComponentsDate:](v6, "initWithHMMProbabilities:nameComponentsDate:", v10, v7);
    -[NPNameParser setClassifier:](v3, "setClassifier:", v8);

    pthread_mutex_lock(&_NPNameParserLock);
    ++_NPNameParserInstanceCount;
    pthread_mutex_unlock(&_NPNameParserLock);
  }
  return v3;
}

- (void)dealloc
{
  BOOL v3;
  objc_super v4;

  pthread_mutex_lock(&_NPNameParserLock);
  if (--_NPNameParserInstanceCount)
    v3 = 1;
  else
    v3 = _NPNameParserJapaneseSurnameTrie == 0;
  if (!v3)
  {
    CFBurstTrieRelease();
    _NPNameParserJapaneseSurnameTrie = 0;
  }
  pthread_mutex_unlock(&_NPNameParserLock);
  v4.receiver = self;
  v4.super_class = (Class)NPNameParser;
  -[NPNameParser dealloc](&v4, sel_dealloc);
}

- (unint64_t)namingTraditionForName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  UniChar v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  int64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  CFIndex v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  int v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  char v43;
  char v45;
  __CFString *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  UniChar buffer[8];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CFStringRef theString;
  const UniChar *v64;
  const char *v65;
  uint64_t v66;
  CFIndex v67;
  int64_t v68;
  int64_t v69;
  _BYTE v70[128];
  uint64_t v71;
  CFRange v72;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    v30 = 5;
    goto LABEL_74;
  }
  v7 = v6;
  v8 = (__CFString *)v7;
  v46 = (__CFString *)v7;
  v47 = v6;
  if (!v7)
  {
    v45 = 0;
    v49 = 0;
    v50 = 0;
LABEL_42:
    v48 = 0;
    goto LABEL_43;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  *(_OWORD *)buffer = 0u;
  v56 = 0u;
  Length = CFStringGetLength(v7);
  theString = v8;
  v66 = 0;
  v67 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v8);
  CStringPtr = 0;
  v64 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
  v68 = 0;
  v69 = 0;
  v65 = CStringPtr;
  if (Length < 1)
  {

    v45 = 0;
    v49 = 0;
    v50 = 0;
    v8 = 0;
    goto LABEL_42;
  }
  v12 = 0;
  v13 = 0;
  v49 = 0;
  v50 = 0;
  v8 = 0;
  v48 = 0;
  v14 = 0;
  v15 = 64;
  do
  {
    if ((unint64_t)v13 >= 4)
      v16 = 4;
    else
      v16 = v13;
    v17 = v67;
    if (v67 <= v13)
    {
      v18 = 0;
    }
    else if (v64)
    {
      v18 = v64[v13 + v66];
    }
    else if (v65)
    {
      v18 = v65[v66 + v13];
    }
    else
    {
      v23 = v68;
      if (v69 <= v13 || v68 > v13)
      {
        v25 = -v16;
        v26 = v16 + v12;
        v27 = v15 - v16;
        v28 = v13 + v25;
        v29 = v28 + 64;
        if (v28 + 64 >= v67)
          v29 = v67;
        v68 = v28;
        v69 = v29;
        if (v67 >= v27)
          v17 = v27;
        v72.length = v17 + v26;
        v72.location = v28 + v66;
        CFStringGetCharacters(theString, v72, buffer);
        v23 = v68;
      }
      v18 = buffer[v13 - v23];
    }
    if (_NPChineseCharSet_onceToken != -1)
      dispatch_once(&_NPChineseCharSet_onceToken, &__block_literal_global_0);
    v19 = objc_msgSend((id)_NPChineseCharSet_result, "characterIsMember:", v18);
    if (_NPHangulCharSet_onceToken != -1)
      dispatch_once(&_NPHangulCharSet_onceToken, &__block_literal_global_88);
    v20 = objc_msgSend((id)_NPHangulCharSet_result, "characterIsMember:", v18);
    if (_NPJapaneseCharSet_onceToken != -1)
      dispatch_once(&_NPJapaneseCharSet_onceToken, &__block_literal_global_89);
    v21 = objc_msgSend((id)_NPJapaneseCharSet_result, "characterIsMember:", v18);
    if (_NPLatinCharSet_onceToken != -1)
      dispatch_once(&_NPLatinCharSet_onceToken, &__block_literal_global_90);
    v49 += v20;
    v50 += v19;
    v8 = (__CFString *)((char *)v8 + v21);
    v14 += objc_msgSend((id)_NPLatinCharSet_result, "characterIsMember:", v18);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48 += objc_msgSend(v22, "characterIsMember:", v18);

    ++v13;
    --v12;
    ++v15;
  }
  while (Length != v13);

  v6 = v47;
  if (v14)
  {
    if (!(__CFString *)((char *)v8 + v49 + v50))
    {
      v30 = 3;
      goto LABEL_74;
    }
    v45 = 1;
  }
  else
  {
    v45 = 0;
  }
LABEL_43:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = 0;
    v36 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v31);
        v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if ((objc_msgSend(v38, "hasPrefix:", CFSTR("zh")) & 1) != 0)
          v34 = 1;
        else
          v35 |= objc_msgSend(v38, "hasPrefix:", CFSTR("ja"));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
    }
    while (v33);
  }
  else
  {
    v34 = 0;
    v35 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "regionCode");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v40, "isEqualToString:", CFSTR("CN")) & 1) != 0
    || (objc_msgSend(v40, "isEqualToString:", CFSTR("HK")) & 1) != 0)
  {
    v6 = v47;
  }
  else
  {
    v6 = v47;
    if ((objc_msgSend(v40, "isEqualToString:", CFSTR("MO")) & 1) == 0
      && (objc_msgSend(v40, "isEqualToString:", CFSTR("TW")) & 1) == 0)
    {
      v35 |= objc_msgSend(v40, "isEqualToString:", CFSTR("JP"));
      if ((v34 & 1) == 0)
      {
        v41 = 1;
        goto LABEL_59;
      }
    }
  }
  v41 = v35;
  v35 = 0;
LABEL_59:
  v42 = -[__CFString length](v46, "length");
  v43 = v45;
  if (!(__CFString *)((char *)v8 + v50 + v49))
    v43 = 0;
  if ((v43 & 1) != 0)
  {
    v30 = 4;
  }
  else if ((__CFString *)((char *)v8 + v50) == (__CFString *)(v42 - v48))
  {
    if ((v8 != 0) | v41 & v35 & 1)
      v30 = 1;
    else
      v30 = ((v41 | v35) & 1) != 0 && v48 != 0;
  }
  else if (v50 + v49 == v42 - v48)
  {
    v30 = 2;
  }
  else
  {
    v30 = 5;
  }

LABEL_74:
  return v30;
}

- (id)personNameComponentsFromString:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  -[NPNameParser normalizeFullname:](self, "normalizeFullname:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[NPNameParser namingTraditionForName:](self, "namingTraditionForName:", v4))
  {
    case 0uLL:
      -[NPNameParser parseChineseName:normalize:](self, "parseChineseName:normalize:", v4, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[NPNameParser parseJapaneseName:normalize:](self, "parseJapaneseName:normalize:", v4, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[NPNameParser parseKoreanName:normalize:](self, "parseKoreanName:normalize:", v4, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[NPNameParser parseFullnameWithDefaultHMMClassifier:normalize:score:](self, "parseFullnameWithDefaultHMMClassifier:normalize:score:", v4, 0, 0);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)parseLatinName:(id)a3 score:(double *)a4
{
  return -[NPNameParser parseFullnameWithDefaultHMMClassifier:normalize:score:](self, "parseFullnameWithDefaultHMMClassifier:normalize:score:", a3, 1, a4);
}

- (id)parseFullnameWithDefaultHMMClassifier:(id)a3
{
  return -[NPNameParser parseFullnameWithDefaultHMMClassifier:normalize:score:](self, "parseFullnameWithDefaultHMMClassifier:normalize:score:", a3, 1, 0);
}

- (id)parseFullnameWithDefaultHMMClassifier:(id)a3 normalize:(BOOL)a4 score:(double *)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  unint64_t v31;
  double v32;
  id v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  BOOL v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v67;
  NPNameParser *v68;
  double *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  void *v75;
  id v76;
  id obj;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;

  v6 = a4;
  v83 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v6)
  {
    -[NPNameParser normalizeFullname:](self, "normalizeFullname:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v9;
  }
  _NPTokenizeName(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v69 = a5;
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v71 = 0;
    v72 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NPNameParser isPrefix:](self, "isPrefix:", v12);

  if (v13)
  {
    objc_msgSend(v11, "firstObject");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectAtIndex:", 0);
  }
  else
  {
    v72 = 0;
  }
  objc_msgSend(v11, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NPNameParser isSuffix:](self, "isSuffix:", v14))
  {
    v15 = objc_msgSend(v11, "count");

    if (v15 >= 2)
    {
      objc_msgSend(v11, "lastObject");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeLastObject");
      goto LABEL_13;
    }
  }
  else
  {

  }
  v71 = 0;
LABEL_13:
  v68 = self;
  -[NPNameParser classifier](self, "classifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hiddenStatesFromObservationSequence:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self == %ld || self == %ld"), 0, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v11, "count");
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
  obj = v19;
  v70 = v8;
  if (v20)
  {
    v21 = v20;
    v67 = v11;
    v22 = 0;
    v23 = 0;
    v24 = *(_QWORD *)v79;
    v25 = -1.79769313e308;
    while (1)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v79 != v24)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        v28 = (void *)MEMORY[0x1DF09A480]();
        if (objc_msgSend(v27, "isFavorite"))
        {
          v29 = v27;

          v22 = v29;
        }
        objc_msgSend(v27, "oovIndices");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v31 < v18)
          goto LABEL_21;
        if (v31 == v18)
        {
          objc_msgSend(v27, "score");
          if (v34 > v25)
          {
            v31 = v18;
LABEL_21:
            objc_msgSend(v27, "score");
            v25 = v32;
            v33 = v27;

            v18 = v31;
            v23 = v33;
            goto LABEL_27;
          }
          objc_msgSend(v27, "score");
          if (v35 == v25)
          {
            objc_msgSend(v23, "sequence");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v23;
            objc_msgSend(v36, "filteredArrayUsingPredicate:", v73);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = objc_msgSend(v37, "count");

            objc_msgSend(v27, "sequence");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "filteredArrayUsingPredicate:", v73);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "count");

            v31 = v18;
            v41 = v40 > v74;
            v23 = v75;
            if (v41)
              goto LABEL_21;
          }
        }
LABEL_27:
        objc_autoreleasePoolPop(v28);
      }
      v19 = obj;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
      if (!v21)
      {

        if (v22)
        {
          objc_msgSend(v22, "score");
          v43 = v42;
          objc_msgSend(v23, "score");
          v8 = v70;
          v11 = v67;
          if (v43 > v44)
          {
            v22 = v22;
            goto LABEL_33;
          }
        }
        else
        {
          v8 = v70;
          v11 = v67;
        }
        goto LABEL_35;
      }
    }
  }
  v22 = 0;
  v23 = v19;
LABEL_33:

  v23 = v22;
LABEL_35:
  v45 = objc_msgSend(v11, "count");
  objc_msgSend(v23, "oovIndices");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");

  if (v45 == 4 && v47 > 2 || v45 >= 5 && (float)((float)v45 * 0.5) <= (float)v47)
  {
    v64 = 0;
  }
  else
  {
    v76 = v22;
    v48 = (void *)objc_opt_new();
    v49 = (void *)objc_opt_new();
    v50 = (void *)objc_opt_new();
    objc_msgSend(v23, "observation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");

    if (v52)
    {
      for (j = 0; v52 != j; ++j)
      {
        v54 = v23;
        objc_msgSend(v23, "sequence");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndexedSubscript:", j);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "unsignedIntegerValue");

        v23 = v54;
        if (v57 == 2)
        {
          objc_msgSend(v54, "observation");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", j);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v49;
        }
        else
        {
          if (v57 != 1)
          {
            if (!v57)
            {
              v58 = (void *)MEMORY[0x1DF09A480]();
              objc_msgSend(v54, "observation");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectAtIndexedSubscript:", j);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "addObject:", v60);

              v23 = v54;
              objc_autoreleasePoolPop(v58);
            }
            continue;
          }
          objc_msgSend(v54, "observation");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", j);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v50;
        }
        objc_msgSend(v63, "addObject:", v62);

      }
    }
    -[NPNameParser personNameCompomentsFromPrefix:suffix:givenNames:middleNames:familyNames:](v68, "personNameCompomentsFromPrefix:suffix:givenNames:middleNames:familyNames:", v72, v71, v48, v50, v49);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v70;
    if (v69)
    {
      objc_msgSend(v23, "score");
      *(_QWORD *)v69 = v65;
    }

    v22 = v76;
    v19 = obj;
  }

  return v64;
}

- (id)personNameCompomentsFromPrefix:(id)a3 suffix:(id)a4 givenNames:(id)a5 middleNames:(id)a6 familyNames:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setNamePrefix:", v15);

  objc_msgSend(v16, "setNameSuffix:", v14);
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("|"), CFSTR(" "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGivenName:", v18);

  }
  else
  {
    objc_msgSend(v16, "setGivenName:", 0);
  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("|"), CFSTR(" "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMiddleName:", v20);

  }
  else
  {
    objc_msgSend(v16, "setMiddleName:", 0);
  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("|"), CFSTR(" "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFamilyName:", v22);

  }
  else
  {
    objc_msgSend(v16, "setFamilyName:", 0);
  }

  return v16;
}

- (id)parseChineseName:(id)a3
{
  return -[NPNameParser parseChineseName:normalize:](self, "parseChineseName:normalize:", a3, 1);
}

- (id)parseChineseName:(id)a3 normalize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NPNameComponentsData *nameComponentsData;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NPNameComponentsData *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[NPNameParser normalizeFullname:](self, "normalizeFullname:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  _NPTokenizeName(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  if (objc_msgSend(v8, "count") == 2)
  {
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGivenName:", v10);

    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFamilyName:", v11);
    goto LABEL_21;
  }
  v12 = (void *)MEMORY[0x1E0CB38E8];
  -[NPNameComponentsData objectValueForEntry:](self->_nameComponentsData, "objectValueForEntry:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "regularExpressionWithPattern:options:error:", v13, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v6, "length"))
  {
    case 2:
      nameComponentsData = self->_nameComponentsData;
      objc_msgSend(v6, "substringToIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(nameComponentsData) = -[NPNameComponentsData collectionForEntry:contains:](nameComponentsData, "collectionForEntry:contains:", 2, v15);

      if (!(_DWORD)nameComponentsData)
        goto LABEL_8;
      objc_msgSend(v6, "substringToIndex:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFamilyName:", v16);

      objc_msgSend(v6, "substringFromIndex:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      v19 = v17;
      goto LABEL_17;
    case 3:
      objc_msgSend(v6, "substringToIndex:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByApplyingTransform:reverse:", CFSTR("Traditional-Simplified"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v21, 0, 0, objc_msgSend(v21, "length")))
      {
        objc_msgSend(v6, "substringToIndex:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFamilyName:", v22);

        v23 = v6;
        v24 = 2;
LABEL_15:
        objc_msgSend(v23, "substringFromIndex:", v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setGivenName:", v31);

        goto LABEL_20;
      }
      v28 = self->_nameComponentsData;
      objc_msgSend(v21, "substringToIndex:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = -[NPNameComponentsData collectionForEntry:contains:](v28, "collectionForEntry:contains:", 2, v29);

      if ((_DWORD)v28)
      {
        objc_msgSend(v6, "substringToIndex:", 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFamilyName:", v30);

        v23 = v6;
        v24 = 1;
        goto LABEL_15;
      }
      objc_msgSend(v9, "setGivenName:", v6);
LABEL_20:

LABEL_21:
      return v9;
    case 4:
      objc_msgSend(v6, "substringToIndex:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByApplyingTransform:reverse:", CFSTR("Traditional-Simplified"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v17, 0, 0, objc_msgSend(v17, "length")))
      {
        objc_msgSend(v6, "substringToIndex:", 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFamilyName:", v26);

        objc_msgSend(v6, "substringFromIndex:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setGivenName:", v27);

      }
      else
      {
        v18 = v9;
        v19 = v6;
LABEL_17:
        objc_msgSend(v18, "setGivenName:", v19);
      }

      goto LABEL_21;
    default:
LABEL_8:
      objc_msgSend(v9, "setGivenName:", v6);
      goto LABEL_21;
  }
}

- (id)parseJapaneseName:(id)a3
{
  return -[NPNameParser parseJapaneseName:normalize:](self, "parseJapaneseName:normalize:", a3, 1);
}

- (id)parseJapaneseName:(id)a3 normalize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  void *v29;
  NSRange v30;
  NSUInteger length;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  NSRange v45;
  void *v46;
  void *v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSRange v52;
  void *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  NSRange v63;
  NSRange v64;
  NSRange v65;
  NSRange v66;
  NSRange v67;
  NSRange v68;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[NPNameParser normalizeFullname:](self, "normalizeFullname:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  _NPTokenizeName(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  if (objc_msgSend(v8, "count") != 2)
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 3)
    {
      objc_msgSend(v9, "setFamilyName:", v6);
      goto LABEL_37;
    }
    if (!_NPNameParserJapaneseSurnameTrie)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathForResource:ofType:", CFSTR("ja_surname"), CFSTR("trie"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _NPNameParserJapaneseSurnameTrie = CFBurstTrieCreateFromFile();
    }
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3840]), "initWithDominantScript:languageMap:", CFSTR("Jpan"), &unk_1EA0BD838);
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    v16 = objc_msgSend(v6, "length");
    v17 = *MEMORY[0x1E0CB2CF8];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __44__NPNameParser_parseJapaneseName_normalize___block_invoke;
    v56[3] = &unk_1EA0BC6E8;
    v18 = v14;
    v57 = v18;
    v58 = &v59;
    objc_msgSend(v6, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v16, v17, 6, v15, v56);
    if (*((_BYTE *)v60 + 24) || !objc_msgSend(v18, "count"))
    {
      objc_msgSend(v9, "setFamilyName:", v6);
LABEL_36:

      _Block_object_dispose(&v59, 8);
      goto LABEL_37;
    }
    if (objc_msgSend(v18, "count") == 1)
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "rangeValue");
      objc_msgSend(v6, "substringWithRange:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFamilyName:", v22);
LABEL_34:

      goto LABEL_35;
    }
    v23 = objc_msgSend(v18, "count");
    if ((unint64_t)(v23 - 1) >= 5)
      v24 = 5;
    else
      v24 = v23 - 1;
    while (1)
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "rangeValue");
      v28 = v27;

      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v63.location = objc_msgSend(v29, "rangeValue");
      v66.location = v26;
      v66.length = v28;
      v30 = NSUnionRange(v63, v66);
      length = v30.length;

      if (CFBurstTrieContains())
        break;
      if ((uint64_t)v24-- <= 0)
        goto LABEL_26;
    }
    if (v30.location == 0x7FFFFFFFFFFFFFFFLL || v30.length != 1)
    {
      if (v30.location != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_31;
    }
    else if ((unint64_t)objc_msgSend(v18, "count") <= 2)
    {
      length = 1;
LABEL_31:
      objc_msgSend(v6, "substringWithRange:", v30.location, length);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFamilyName:", v47);

      if (v24 >= objc_msgSend(v18, "count") - 1)
        goto LABEL_36;
      objc_msgSend(v18, "objectAtIndexedSubscript:", v24 + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v19, "rangeValue");
      v50 = v49;
      objc_msgSend(v18, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v68.location = objc_msgSend(v22, "rangeValue");
      v68.length = v51;
      v65.location = v48;
      v65.length = v50;
      v52 = NSUnionRange(v65, v68);
      objc_msgSend(v6, "substringWithRange:", v52.location, v52.length);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setGivenName:", v46);
      goto LABEL_33;
    }
LABEL_26:
    if (objc_msgSend(v18, "count") != 2)
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v19, "rangeValue");
      v43 = v42;
      objc_msgSend(v18, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v67.location = objc_msgSend(v22, "rangeValue");
      v67.length = v44;
      v64.location = v41;
      v64.length = v43;
      v45 = NSUnionRange(v64, v67);
      objc_msgSend(v6, "substringWithRange:", v45.location, v45.length);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFamilyName:", v46);
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "rangeValue");
    v36 = v35;

    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "rangeValue");
    v55 = v39;
    v40 = v38;

    if (v36 == 3)
    {
      if (v34 + 3 != v40)
      {
        v36 = 3;
LABEL_43:
        objc_msgSend(v6, "substringWithRange:", v34, v36);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFamilyName:", v54);

        objc_msgSend(v6, "substringWithRange:", v40, v55);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setGivenName:", v19);
LABEL_35:

        goto LABEL_36;
      }
    }
    else if (v36 != 2 || v55 != 1 || v34 + 2 != v40)
    {
      goto LABEL_43;
    }
    if (CFBurstTrieContains())
    {
      --v40;
      ++v55;
      --v36;
    }
    goto LABEL_43;
  }
  objc_msgSend(v8, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGivenName:", v10);

  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFamilyName:", v11);

LABEL_37:
  return v9;
}

void __44__NPNameParser_parseJapaneseName_normalize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  id v12;

  if (objc_msgSend(a2, "isEqualToString:", CFSTR("ja")))
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
}

- (id)parseKoreanName:(id)a3
{
  return -[NPNameParser parseKoreanName:normalize:](self, "parseKoreanName:normalize:", a3, 1);
}

- (id)parseKoreanName:(id)a3 normalize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  NPNameParser *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v4 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
  {
    -[NPNameParser normalizeFullname:](self, "normalizeFullname:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  _NPTokenizeName(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v41 = v10;
    v42 = v8;
    v43 = v6;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v52;
      v44 = *(_QWORD *)v52;
      v45 = self;
      do
      {
        v15 = 0;
        v46 = v13;
        do
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v15);
          v17 = (void *)MEMORY[0x1DF09A480]();
          if (-[NPNameComponentsData collectionForEntry:contains:](self->_nameComponentsData, "collectionForEntry:contains:", 4, v16))
          {
            objc_msgSend(v9, "setGivenName:", v16);
            objc_msgSend(v9, "setFamilyName:", v16);
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v18 = v11;
            v19 = v11;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v48;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v48 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                  if ((objc_msgSend(v16, "isEqualToString:", v24, v41, v42, v43) & 1) == 0)
                    objc_msgSend(v9, "setGivenName:", v24);
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              }
              while (v21);
            }

            v14 = v44;
            self = v45;
            v11 = v18;
            v13 = v46;
          }
          objc_autoreleasePoolPop(v17);
          ++v15;
        }
        while (v15 != v13);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v13);
    }

    objc_msgSend(v9, "familyName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    v8 = v42;
    v6 = v43;
    v10 = v41;
    if (!v26)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFamilyName:", v27);

      objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v11, "count") - 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setGivenName:", v28);

    }
  }
  if ((unint64_t)objc_msgSend(v6, "length", v41, v42, v43) < 2
    || (objc_msgSend(v9, "givenName"), v29 = (void *)objc_claimAutoreleasedReturnValue(), v29, v29))
  {
    v30 = 0;
  }
  else
  {
    objc_msgSend(v6, "substringToIndex:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NPNameComponentsData collectionForEntry:contains:](self->_nameComponentsData, "collectionForEntry:contains:", 4, v30))
    {
      objc_msgSend(v9, "setFamilyName:", v30);
      if (objc_msgSend(v6, "length") == 2)
      {
        objc_msgSend(v9, "setGivenName:", 0);
      }
      else
      {
        objc_msgSend(v6, "substringFromIndex:", 2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setGivenName:", v40);

      }
    }
  }
  if (objc_msgSend(v6, "length")
    && (objc_msgSend(v9, "givenName"), v31 = (void *)objc_claimAutoreleasedReturnValue(), v31, !v31))
  {
    objc_msgSend(v6, "substringToIndex:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NPNameComponentsData collectionForEntry:contains:](self->_nameComponentsData, "collectionForEntry:contains:", 4, v32))
    {
      objc_msgSend(v9, "setFamilyName:", v32);
      if (objc_msgSend(v6, "length") == 1)
      {
        objc_msgSend(v9, "setGivenName:", 0);
      }
      else
      {
        objc_msgSend(v6, "substringFromIndex:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setGivenName:", v39);

      }
    }
  }
  else
  {
    v32 = v30;
  }
  objc_msgSend(v9, "givenName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
    objc_msgSend(v9, "setGivenName:", v6);
  objc_msgSend(v9, "givenName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringByTrimmingCharactersInSet:", v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGivenName:", v35);

  objc_msgSend(v9, "familyName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringByTrimmingCharactersInSet:", v10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFamilyName:", v37);

  return v9;
}

- (id)normalizeFullname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _NPStripQuotationMarks(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NPRemoveEmojis(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _NPRemoveParenthesisBracketsAndInside(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _NPRemoveAppSignature(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _NPCollapseWhitespaceAndStrip(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isPrefix:(id)a3
{
  NPNameParser *v3;
  void *v4;

  v3 = self;
  -[NPNameParser normalizedAffix:](self, "normalizedAffix:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[NPNameComponentsData collectionForEntry:contains:](v3->_nameComponentsData, "collectionForEntry:contains:", 0, v4);

  return (char)v3;
}

- (BOOL)isSuffix:(id)a3
{
  NPNameParser *v3;
  void *v4;

  v3 = self;
  -[NPNameParser normalizedAffix:](self, "normalizedAffix:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[NPNameComponentsData collectionForEntry:contains:](v3->_nameComponentsData, "collectionForEntry:contains:", 1, v4);

  return (char)v3;
}

- (id)normalizedAffix:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_1EA0BC8D8);
}

- (_CFBurstTrie)sharedNameFrequencyTrieRef
{
  return -[NPHMMClassifier nameFrequencyTrieRef](self->_classifier, "nameFrequencyTrieRef");
}

- (unint64_t)frequencyOfLatinFamilyName:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[NPNameParser classifier](self, "classifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "frequencyForName:type:", v4, 2);

  return v6;
}

- (unint64_t)frequencyOfLatinGivenName:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[NPNameParser classifier](self, "classifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "frequencyForName:type:", v4, 0);

  return v6;
}

- (unint64_t)genderMajorityForGivenName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[NPNameParser normalizeFullname:](self, "normalizeFullname:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPNameParser classifier](self, "classifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "genderMajorityForGivenName:", v5);

  return v7;
}

- (NPHMMClassifier)classifier
{
  return (NPHMMClassifier *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClassifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_nameComponentsData, 0);
}

@end
