@implementation ECSubjectParser

+ (BOOL)subjectHasReplyPrefix:(id)a3
{
  return objc_msgSend(a1, "prefixLengthForSubject:includingPrefix:", a3, 0) != 0;
}

+ (BOOL)subjectHasForwardPrefix:(id)a3
{
  return objc_msgSend(a1, "prefixLengthForSubject:includingPrefix:", a3, 1) != 0;
}

+ (id)subjectWithoutPrefixIncludingListMarkersForSubject:(id)a3 prefix:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "ec_regularExpressionForList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "prefixLengthForSubject:includingPrefix:", v6, 2);
  if (v8)
  {
    objc_msgSend(v6, "substringToIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v6, "length");
  if (v10 <= v8)
  {
    v17 = &stru_1E7123500;
  }
  else
  {
    if (objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v6, 0, v8, v10 - v8) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v6, "substringFromIndex:", v11 + v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(a1, "prefixLengthForSubject:includingPrefix:", v13, 2);
        if (v14)
        {
          objc_msgSend(v13, "substringToIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v9, "stringByAppendingString:", v15);
            v16 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v16;
          }
          else
          {
            objc_msgSend(v13, "substringToIndex:", v14);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v13, "substringFromIndex:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "substringWithRange:", v8, v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingString:", v18);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v17)
            goto LABEL_15;
        }
        else
        {

        }
      }
    }
    objc_msgSend(v6, "substringFromIndex:", v8);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v17;
}

+ (unint64_t)prefixLengthForSubject:(id)a3
{
  return objc_msgSend(a1, "prefixLengthForSubject:includingPrefix:", a3, 2);
}

+ (unint64_t)prefixLengthForSubject:(id)a3 includingPrefix:(int64_t)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") < 2
    || (v7 = objc_msgSend(a1, "_lastPrefixDelimiterLocationForSubject:", v6), v7 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(a1, "_fastPrefixLengthForSubject:includingPrefix:", v6, a4);
    if (v8 < v7 + 1)
      v8 = objc_msgSend(a1, "_prefixLengthForSubject:forPrefix:", v6, a4);
  }

  return v8;
}

+ (unint64_t)_lastPrefixDelimiterLocationForSubject:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "ec_prefixDelimiterCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:", v4, 4);

  return v5;
}

+ (unint64_t)_prefixLengthForSubject:(id)a3 forPrefix:(int64_t)a4
{
  id v7;
  id *v8;
  uint64_t *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  SEL v18;
  id v19;

  v7 = a3;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __53__ECSubjectParser__prefixLengthForSubject_forPrefix___block_invoke;
  v17 = &__block_descriptor_48_e5_v8__0l;
  v18 = a2;
  v19 = a1;
  if (_prefixLengthForSubject_forPrefix__predicate != -1)
    dispatch_once(&_prefixLengthForSubject_forPrefix__predicate, &v14);
  v8 = (id *)&_prefixLengthForSubject_forPrefix__replyRegex;
  v9 = &_prefixLengthForSubject_forPrefix__forwardRegex;
  if (a4 != 1)
    v9 = &_prefixLengthForSubject_forPrefix__prefixRegex;
  if (a4)
    v8 = (id *)v9;
  v10 = *v8;
  if (objc_msgSend(v10, "rangeOfFirstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length", v14, v15, v16, v17, v18, v19)) == 0x7FFFFFFFFFFFFFFFLL)v12 = 0;
  else
    v12 = v11;

  return v12;
}

void __53__ECSubjectParser__prefixLengthForSubject_forPrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  +[ECEmailCoreFramework bundle](ECEmailCoreFramework, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("SubjectPrefixes"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v3, &v20);
  v5 = v20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load prefix file with error %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("ECSubjectParser.m"), 188, v6);

  }
  v7 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Reply"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  copyRegexForPrefixStrings(v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_prefixLengthForSubject_forPrefix__replyRegex;
  _prefixLengthForSubject_forPrefix__replyRegex = v10;

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Forward"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  copyRegexForPrefixStrings(v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_prefixLengthForSubject_forPrefix__forwardRegex;
  _prefixLengthForSubject_forPrefix__forwardRegex = v15;

  objc_msgSend(v9, "unionSet:", v14);
  copyRegexForPrefixStrings(v9);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)_prefixLengthForSubject_forPrefix__prefixRegex;
  _prefixLengthForSubject_forPrefix__prefixRegex = v17;

}

+ (unint64_t)_fastPrefixLengthForSubject:(id)a3 includingPrefix:(int64_t)a4
{
  __CFString *v5;
  unint64_t v6;
  int64_t v7;
  const char *CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UniChar v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  UniChar v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  UniChar v32;
  uint64_t v33;
  BOOL v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  UniChar v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  uint64_t v52;
  uint64_t v53;
  UniChar v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  CFRange v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  UniChar v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v79;
  __CFString *v80;
  unint64_t v81;
  unint64_t v82;
  UniChar buffer[8];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CFStringRef theString[2];
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  CFRange v95;
  CFRange v96;
  CFRange v97;
  CFRange v98;
  CFRange v99;

  v5 = (__CFString *)a3;
  v6 = -[__CFString length](v5, "length");
  v82 = v6 - 2;
  if (v6 >= 2)
  {
    v92 = 0u;
    v90 = 0u;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    *(_OWORD *)buffer = 0u;
    theString[0] = v5;
    v94 = 0;
    v93 = v6;
    v80 = v5;
    theString[1] = (CFStringRef)CFStringGetCharactersPtr(v5);
    if (theString[1])
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    *((_QWORD *)&v93 + 1) = 0;
    v94 = 0;
    *(_QWORD *)&v92 = CStringPtr;
    if (v82)
    {
      v9 = 0;
      v10 = 0;
      v79 = a4 & 0xFFFFFFFFFFFFFFFDLL;
      v81 = a4 - 1;
      while (1)
      {
        if (v10 < -2)
          goto LABEL_84;
        v11 = v10 + 2;
        v12 = v93;
        if ((uint64_t)v93 <= v10 + 2)
          goto LABEL_84;
        if (theString[1])
        {
          v13 = *((_WORD *)&theString[1]->isa + *((_QWORD *)&v92 + 1) + v11);
        }
        else if ((_QWORD)v92)
        {
          v13 = *(char *)(v92 + *((_QWORD *)&v92 + 1) + v11);
        }
        else
        {
          if (v94 <= v11 || v9 > v11)
          {
            v14 = v10 - 2;
            if ((unint64_t)v10 < 2)
              v14 = 0;
            if (v14 + 64 < (uint64_t)v93)
              v12 = v14 + 64;
            *((_QWORD *)&v93 + 1) = v14;
            v94 = v12;
            v95.location = *((_QWORD *)&v92 + 1) + v14;
            v95.length = v12 - v14;
            CFStringGetCharacters(theString[0], v95, buffer);
            v9 = *((_QWORD *)&v93 + 1);
          }
          v13 = buffer[v11 - v9];
        }
        if (v13 == 58)
        {
          if (v79)
            goto LABEL_135;
          v15 = 0;
          v16 = 0;
          v17 = -v10;
          v18 = v10 + 64;
          v19 = v10;
          do
          {
            if (v19 >= 4)
              v20 = 4;
            else
              v20 = v19;
            v21 = v10 + v16;
            if (v10 + v16 < 0 || (v22 = v93, (uint64_t)v93 <= v21))
            {
              v23 = 0;
            }
            else if (theString[1])
            {
              v23 = *((_WORD *)&theString[1]->isa + v10 + v16 + *((_QWORD *)&v92 + 1));
            }
            else if ((_QWORD)v92)
            {
              v23 = *(char *)(v92 + *((_QWORD *)&v92 + 1) + v10 + v16);
            }
            else
            {
              if (v94 <= v21 || v9 > v21)
              {
                v24 = v20 + v17;
                v25 = v18 - v20;
                v26 = -v20;
                v27 = 64 - v20;
                v28 = v16 + v10 - v20;
                v29 = v10 + v16 + v27;
                if (v29 >= (uint64_t)v93)
                  v29 = v93;
                *((_QWORD *)&v93 + 1) = v28;
                v94 = v29;
                if ((uint64_t)v93 >= v25)
                  v22 = v25;
                v96.length = v22 + v24;
                v96.location = v10 + v16 + v26 + *((_QWORD *)&v92 + 1);
                CFStringGetCharacters(theString[0], v96, buffer);
                v9 = *((_QWORD *)&v93 + 1);
              }
              v23 = buffer[v10 - v9 + v16];
            }
            if (((_fastPrefixLengthForSubject_includingPrefix__rePrefix[v16] ^ v23) & 0xFFDF) != 0)
              break;
            v15 = v16 != 0;
            ++v19;
            --v17;
            ++v18;
            ++v16;
          }
          while (v16 != 2);
          if (!v15)
          {
LABEL_135:
            if (v81 > 1)
              goto LABEL_137;
            v63 = 0;
            v64 = 0;
            v65 = -v10;
            v66 = v10 + 64;
            v67 = v10;
            do
            {
              if (v67 >= 4)
                v68 = 4;
              else
                v68 = v67;
              v69 = v10 + v64;
              if (v10 + v64 < 0 || (v70 = v93, (uint64_t)v93 <= v69))
              {
                v71 = 0;
              }
              else if (theString[1])
              {
                v71 = *((_WORD *)&theString[1]->isa + v10 + v64 + *((_QWORD *)&v92 + 1));
              }
              else if ((_QWORD)v92)
              {
                v71 = *(char *)(v92 + *((_QWORD *)&v92 + 1) + v10 + v64);
              }
              else
              {
                if (v94 <= v69 || v9 > v69)
                {
                  v72 = v68 + v65;
                  v73 = v66 - v68;
                  v74 = -v68;
                  v75 = 64 - v68;
                  v76 = v64 + v10 - v68;
                  v77 = v10 + v64 + v75;
                  if (v77 >= (uint64_t)v93)
                    v77 = v93;
                  *((_QWORD *)&v93 + 1) = v76;
                  v94 = v77;
                  if ((uint64_t)v93 >= v73)
                    v70 = v73;
                  v99.length = v70 + v72;
                  v99.location = v10 + v64 + v74 + *((_QWORD *)&v92 + 1);
                  CFStringGetCharacters(theString[0], v99, buffer);
                  v9 = *((_QWORD *)&v93 + 1);
                }
                v71 = buffer[v10 - v9 + v64];
              }
              if (((_fastPrefixLengthForSubject_includingPrefix__fwPrefix[v64] ^ v71) & 0xFFDF) != 0)
                break;
              v63 = v64 != 0;
              ++v67;
              --v65;
              ++v66;
              ++v64;
            }
            while (v64 != 2);
            if (!v63)
              goto LABEL_137;
          }
          v49 = 3;
        }
        else
        {
LABEL_84:
          if (v81 > 1)
            goto LABEL_137;
          if (v10 < -3)
            goto LABEL_137;
          v30 = v10 + 3;
          v31 = v93;
          if ((uint64_t)v93 <= v10 + 3)
            goto LABEL_137;
          if (theString[1])
          {
            v32 = *((_WORD *)&theString[1]->isa + *((_QWORD *)&v92 + 1) + v30);
          }
          else if ((_QWORD)v92)
          {
            v32 = *(char *)(v92 + *((_QWORD *)&v92 + 1) + v30);
          }
          else
          {
            if (v94 <= v30 || v9 > v30)
            {
              v33 = v10 - 1;
              if (!v10)
                v33 = 0;
              if (v33 + 64 < (uint64_t)v93)
                v31 = v33 + 64;
              *((_QWORD *)&v93 + 1) = v33;
              v94 = v31;
              v97.location = *((_QWORD *)&v92 + 1) + v33;
              v97.length = v31 - v33;
              CFStringGetCharacters(theString[0], v97, buffer);
              v9 = *((_QWORD *)&v93 + 1);
            }
            v32 = buffer[v30 - v9];
          }
          if (v32 != 58)
            goto LABEL_137;
          v34 = 0;
          v35 = 0;
          v36 = -v10;
          v37 = v10 + 64;
          v38 = v10;
          do
          {
            if (v38 >= 4)
              v39 = 4;
            else
              v39 = v38;
            v40 = v10 + v35;
            if ((uint64_t)(v10 + v35) < 0 || (v41 = v93, (uint64_t)v93 <= v40))
            {
              v42 = 0;
            }
            else if (theString[1])
            {
              v42 = *((_WORD *)&theString[1]->isa + v10 + v35 + *((_QWORD *)&v92 + 1));
            }
            else if ((_QWORD)v92)
            {
              v42 = *(char *)(v92 + *((_QWORD *)&v92 + 1) + v10 + v35);
            }
            else
            {
              if (v94 <= v40 || v9 > v40)
              {
                v43 = v39 + v36;
                v44 = v37 - v39;
                v45 = -v39;
                v46 = 64 - v39;
                v47 = v35 + v10 - v39;
                v48 = v10 + v35 + v46;
                if (v48 >= (uint64_t)v93)
                  v48 = v93;
                *((_QWORD *)&v93 + 1) = v47;
                v94 = v48;
                if ((uint64_t)v93 >= v44)
                  v41 = v44;
                v98.length = v41 + v43;
                v98.location = v10 + v35 + v45 + *((_QWORD *)&v92 + 1);
                CFStringGetCharacters(theString[0], v98, buffer);
                v9 = *((_QWORD *)&v93 + 1);
              }
              v42 = buffer[v10 - v9 + v35];
            }
            if ((((unsigned __int16)_fastPrefixLengthForSubject_includingPrefix__fwdPrefix[v35] ^ v42) & 0xFFDF) != 0)
              break;
            v34 = v35 > 1;
            ++v38;
            --v36;
            ++v37;
            ++v35;
          }
          while (v35 != 3);
          if (!v34)
          {
LABEL_137:
            v7 = v10;
            goto LABEL_139;
          }
          v49 = 4;
        }
        v7 = v49 + v10;
        if (v49 + v10 >= 0)
        {
          v50 = v93;
          if ((uint64_t)v93 > v7)
          {
            v51 = -v7;
            v52 = v49 + v10 + 64;
            do
            {
              if ((unint64_t)v7 >= 4)
                v53 = 4;
              else
                v53 = v7;
              if (theString[1])
              {
                v54 = *((_WORD *)&theString[1]->isa + v7 + *((_QWORD *)&v92 + 1));
              }
              else if ((_QWORD)v92)
              {
                v54 = *(char *)(v92 + *((_QWORD *)&v92 + 1) + v7);
              }
              else
              {
                if (v94 <= v7 || v9 > v7)
                {
                  v56 = -v53;
                  v57 = v53 + v51;
                  v58 = v52 - v53;
                  v59 = v7 + v56;
                  v60 = v59 + 64;
                  if (v59 + 64 >= v50)
                    v60 = v50;
                  *((_QWORD *)&v93 + 1) = v59;
                  v94 = v60;
                  v61.location = v59 + *((_QWORD *)&v92 + 1);
                  if (v50 >= v58)
                    v62 = v58;
                  else
                    v62 = v50;
                  v61.length = v62 + v57;
                  CFStringGetCharacters(theString[0], v61, buffer);
                  v9 = *((_QWORD *)&v93 + 1);
                }
                v54 = buffer[v7 - v9];
              }
              if (v54 != 32)
                break;
              ++v7;
              v50 = v93;
              --v51;
              ++v52;
            }
            while ((uint64_t)v93 > v7);
          }
        }
        v10 = v7;
        if (v7 >= v82)
          goto LABEL_139;
      }
    }
    v7 = 0;
LABEL_139:
    v5 = v80;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)subjectWithoutPrefixForSubject:(id)a3
{
  objc_msgSend(a1, "subjectWithoutPrefixForSubject:prefix:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)subjectWithoutPrefixForSubject:(id)a3 prefix:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  v7 = objc_msgSend(a1, "prefixLengthForSubject:", v6);
  if (a4)
  {
    objc_msgSend(v6, "substringToIndex:", v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "substringFromIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
