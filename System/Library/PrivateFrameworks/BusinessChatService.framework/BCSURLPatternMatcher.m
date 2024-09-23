@implementation BCSURLPatternMatcher

- (BOOL)isValidDomainForURL:(id)a3 domainBundleIDPatterns:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    goto LABEL_5;
  objc_msgSend(v7, "bundleIdPatterns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v5, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

  }
  else
  {
LABEL_5:
    v15 = 0;
  }

  return v15;
}

- (id)matchPattern:(id)a3 withURL:(id)a4 forBundleID:(id)a5 expirationDate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __CFString *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  _BOOL4 v29;
  id v30;
  void *v31;
  uint64_t v32;
  char v33;
  id v34;
  id v35;
  char v36;
  BCSURLPatternMatchResult *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  BCSURLPatternMatchResult *v52;
  void *v53;
  BCSDateHelper *v54;
  id v56;
  id v57;
  id *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id obj;
  id obja;
  __CFString *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  id v81;
  id v82;
  uint8_t v83[128];
  uint8_t buf[24];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12 && v13)
  {
    objc_msgSend(v12, "path");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "query");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v16 && !objc_msgSend(v17, "length"))
    {
      ABSLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[BCSURLPatternMatcher matchPattern:withURL:forBundleID:expirationDate:error:]";
        _os_log_impl(&dword_20ACAD000, v38, OS_LOG_TYPE_DEFAULT, "%s No match since no path or query pattern provided", buf, 0xCu);
      }
      v37 = 0;
      goto LABEL_70;
    }
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v13, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "percentEncodedPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "percentEncodedQuery");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v18;
    v67 = v20;
    if (-[NSObject length](v16, "length"))
    {
      v58 = a7;
      v21 = objc_retainAutorelease(v16);
      v22 = &stru_24C39D888;
      if (*(_BYTE *)-[NSObject UTF8String](v21, "UTF8String") != 47)
      {
        v37 = 0;
        v38 = &stru_24C39D888;
        goto LABEL_65;
      }
      v65 = v19;
      v60 = v14;
      v23 = objc_retainAutorelease(v20);
      if (*(_BYTE *)objc_msgSend(v23, "UTF8String") == 47)
        v24 = CFSTR("/");
      else
        v24 = &stru_24C39D888;
      v73 = (__CFString *)v24;
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v21);
      objc_msgSend(v26, "setCharactersToBeSkipped:", v25);
      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v23);
      objc_msgSend(obj, "setCharactersToBeSkipped:", v25);
      v82 = 0;
      v68 = v26;
      LODWORD(v26) = objc_msgSend(v26, "scanUpToCharactersFromSet:intoString:", v25, &v82);
      v27 = v82;
      v63 = v16;
      if ((_DWORD)v26)
      {
        v74 = 0;
        v75 = 0;
        v28 = 0;
        while (1)
        {
          *(_QWORD *)buf = 0;
          v81 = 0;
          v29 = -[BCSURLPatternMatcher isAnyMatchFoundForPathPattern:countOfPathComponents:error:](self, "isAnyMatchFoundForPathPattern:countOfPathComponents:error:", v27, buf, &v81);
          v30 = v81;
          v31 = v30;
          if (v30)
            break;
          if (v29)
          {
            -[BCSURLPatternMatcher extractedPathForAnyMatchUsingScanner:delimiter:extractedPath:countOfPathComponentsToMatch:](self, "extractedPathForAnyMatchUsingScanner:delimiter:extractedPath:countOfPathComponentsToMatch:", obj, v25, v73, *(_QWORD *)buf);
            v32 = objc_claimAutoreleasedReturnValue();

            if (!v32)
              goto LABEL_31;
            v28 = 0;
            ++v75;
          }
          else
          {
            -[BCSURLPatternMatcher extractedPathForExactMatchUsingScanner:delimiter:extractedPath:patternPathComponent:](self, "extractedPathForExactMatchUsingScanner:delimiter:extractedPath:patternPathComponent:", obj, v25, v73, v27);
            v32 = objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
LABEL_31:
              v35 = v13;
              v73 = 0;
              goto LABEL_32;
            }
            ++v74;
            ++v28;
          }
          v73 = (__CFString *)v32;
          v82 = v27;
          v33 = objc_msgSend(v68, "scanUpToCharactersFromSet:intoString:", v25, &v82);
          v34 = v82;

          v27 = v34;
          if ((v33 & 1) == 0)
          {
            v35 = v13;
            v36 = 0;
            v27 = v34;
            goto LABEL_33;
          }
        }
        v35 = v13;
        if (v58)
          *v58 = objc_retainAutorelease(v30);
LABEL_32:

        v36 = 1;
      }
      else
      {
        v35 = v13;
        v28 = 0;
        v74 = 0;
        v75 = 0;
        v36 = 0;
      }
LABEL_33:

      v18 = v66;
      if ((v36 & 1) != 0)
      {
        v37 = 0;
        v22 = &stru_24C39D888;
        v13 = v35;
        v14 = v60;
        v16 = v63;
LABEL_67:
        v19 = v65;
        goto LABEL_68;
      }
      v69 = v28;
      v13 = v35;
      v14 = v60;
      v16 = v63;
      v19 = v65;
      v20 = v67;
    }
    else
    {
      v69 = 0;
      v74 = 0;
      v75 = 0;
      v73 = &stru_24C39D888;
    }
    if (-[NSObject length](v16, "length")
      && objc_msgSend(v18, "length")
      && !-[__CFString isEqualToString:](v73, "isEqualToString:", v20)
      || !v16
      && objc_msgSend(v18, "length")
      && objc_msgSend(v20, "length")
      && !objc_msgSend(v20, "isEqualToString:", CFSTR("/")))
    {
      v37 = 0;
      v22 = &stru_24C39D888;
LABEL_68:
      v38 = v73;
      goto LABEL_69;
    }
    v62 = v15;
    v64 = v16;
    v65 = v19;
    if (objc_msgSend(v18, "length"))
    {
      v59 = v12;
      -[BCSURLPatternMatcher dictionaryFromQueryString:orderedKeys:](self, "dictionaryFromQueryString:orderedKeys:", v18, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0;
      -[BCSURLPatternMatcher dictionaryFromQueryString:orderedKeys:](self, "dictionaryFromQueryString:orderedKeys:", v70, &v80);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v80;
      -[BCSURLPatternMatcher orderedKeysForPatternQuery:originalURLQuery:orderedOriginalURLQueryKeys:](self, "orderedKeysForPatternQuery:originalURLQuery:orderedOriginalURLQueryKeys:", v39, v40);
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      obja = (id)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
      if (v41)
      {
        v42 = v41;
        v61 = v14;
        v56 = v13;
        v43 = *(_QWORD *)v77;
        v44 = &stru_24C39D888;
        while (2)
        {
          v45 = 0;
          v22 = (__CFString *)v44;
          do
          {
            if (*(_QWORD *)v77 != v43)
              objc_enumerationMutation(obja);
            v46 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v45);
            objc_msgSend(v39, "objectForKeyedSubscript:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "valueForKey:", v46);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v48, "length"))
            {
LABEL_58:

              v49 = 0;
              goto LABEL_59;
            }
            if ((objc_msgSend(v47, "isEqualToString:", CFSTR("*")) & 1) != 0)
            {
              ++v75;
            }
            else
            {
              if (!objc_msgSend(v47, "isEqualToString:", v48))
                goto LABEL_58;
              ++v74;
            }
            -[BCSURLPatternMatcher extractedQueryByAddingKey:value:toExtractedQuery:](self, "extractedQueryByAddingKey:value:toExtractedQuery:", v46, v48, v22);
            v44 = (const __CFString *)objc_claimAutoreleasedReturnValue();

            ++v45;
            v22 = (__CFString *)v44;
          }
          while (v42 != v45);
          v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
          if (v42)
            continue;
          break;
        }
        v49 = 1;
        v22 = (__CFString *)v44;
LABEL_59:
        v13 = v56;
        v14 = v61;
        v16 = v64;
      }
      else
      {
        v49 = 1;
        v22 = &stru_24C39D888;
      }

      v12 = v59;
      if (!v49)
      {
        v37 = 0;
        v15 = v62;
        v18 = v66;
        goto LABEL_67;
      }
      v19 = v65;
    }
    else
    {
      v22 = &stru_24C39D888;
    }
    -[BCSURLPatternMatcher extractedURLForOriginalURL:originalURLPathComponents:extractedPath:extractedQuery:](self, "extractedURLForOriginalURL:originalURLPathComponents:extractedPath:extractedQuery:", v13, v19, v73, v22);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSURLNormalizer normalizedURLForURL:](BCSURLNormalizer, "normalizedURLForURL:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = [BCSURLPatternMatchResult alloc];
    objc_msgSend(v12, "description");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_alloc_init(BCSDateHelper);
    v37 = -[BCSURLPatternMatchResult initWithOriginalURL:extractedURL:totalConsecutivePrefixMatches:totalExactMatches:totalAnyMatches:bundleID:pattern:expirationDate:dateHelper:](v52, "initWithOriginalURL:extractedURL:totalConsecutivePrefixMatches:totalExactMatches:totalAnyMatches:bundleID:pattern:expirationDate:dateHelper:", v13, v51, v69, v74, v75, v14, v53, v62, v54);

    v19 = v65;
    v15 = v62;
    v38 = v73;

    v16 = v64;
LABEL_65:
    v18 = v66;
LABEL_69:

LABEL_70:
    goto LABEL_71;
  }
  ABSLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[BCSURLPatternMatcher matchPattern:withURL:forBundleID:expirationDate:error:]";
    _os_log_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_DEFAULT, "%s Aborting parsing due to nil argument", buf, 0xCu);
  }
  v37 = 0;
LABEL_71:

  return v37;
}

- (id)extractedPathForAnyMatchUsingScanner:(id)a3 delimiter:(id)a4 extractedPath:(id)a5 countOfPathComponentsToMatch:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a6)
  {
    while (1)
    {
      v16 = 0;
      objc_msgSend(v9, "scanUpToCharactersFromSet:intoString:", v10, &v16);
      v13 = v16;
      if (!objc_msgSend(v13, "length"))
        break;
      objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v14;
      if (!--a6)
        goto LABEL_7;
    }

    v14 = 0;
  }
  else
  {
    v14 = v11;
  }
LABEL_7:

  return v14;
}

- (id)extractedPathForExactMatchUsingScanner:(id)a3 delimiter:(id)a4 extractedPath:(id)a5 patternPathComponent:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;

  v9 = a5;
  v10 = a6;
  v14 = 0;
  objc_msgSend(a3, "scanUpToCharactersFromSet:intoString:", a4, &v14);
  v11 = v14;
  if (objc_msgSend(v11, "length") && !objc_msgSend(v11, "caseInsensitiveCompare:", v10))
  {
    objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)extractedURLForOriginalURL:(id)a3 originalURLPathComponents:(id)a4 extractedPath:(id)a5 extractedQuery:(id)a6
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;

  v9 = a3;
  v10 = (__CFString *)a5;
  v11 = (__CFString *)a6;
  objc_msgSend(a4, "percentEncodedQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v9, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (!v15)
    {
      v23 = 0;
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v10, "length"))
      v19 = v10;
    else
      v19 = &stru_24C39D888;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@://%@%@"), v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      if (-[__CFString length](v11, "length"))
        v21 = v11;
      else
        v21 = &stru_24C39D888;
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v13, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v22;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

LABEL_15:
  return v23;
}

- (BOOL)isAnyMatchFoundForPathPattern:(id)a3 countOfPathComponents:(int64_t *)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  _WORD *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  _WORD *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  int64_t v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "length") < 3)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v7, "length");
    MEMORY[0x24BDAC7A8]();
    v9 = (_WORD *)((char *)v21 - v8);
    objc_msgSend(v7, "length");
    MEMORY[0x24BDAC7A8]();
    v11 = (char *)v21 - v10;
    objc_msgSend(v7, "getCharacters:range:", v9, 0, objc_msgSend(v7, "length"));
    if (*v9 != 91 || v9[objc_msgSend(v7, "length") - 1] != 93)
      goto LABEL_16;
    if ((unint64_t)(objc_msgSend(v7, "length") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = 0;
      v13 = v9 + 1;
      while (1)
      {
        v14 = (unsigned __int16)v13[v12];
        if ((v14 - 58) <= 0xFFFFFFF5)
          break;
        v15 = v12 + 1;
        *(_WORD *)&v11[2 * v12] = v14;
        v16 = objc_msgSend(v7, "length");
        v17 = v12 + 2;
        ++v12;
        if (v17 >= v16 - 1)
          goto LABEL_11;
      }
      if (a5)
      {
        +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 41, 0);
        v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
LABEL_16:
      v18 = 0;
      goto LABEL_17;
    }
    v15 = 0;
LABEL_11:
    *(_WORD *)&v11[2 * v15] = 0;
    v19 = strtol(v11, 0, 10);
    if (a4)
      *a4 = v19;
    v18 = 1;
  }
LABEL_17:

  return v18;
}

- (id)dictionaryFromQueryString:(id)a3 orderedKeys:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v21;
  id v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = a4;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    v10 = CFSTR("=");
    do
    {
      v11 = 0;
      v23 = v8;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "componentsSeparatedByString:", v10, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("#"));
          v15 = v10;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v18 = v6;
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v15;
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v13);

          v6 = v18;
          v8 = v23;

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  if (v21)
    *v21 = (id)objc_msgSend(v6, "copy");

  return v22;
}

- (id)extractedQueryByAddingKey:(id)a3 value:(id)a4 toExtractedQuery:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  if (!-[__CFString length](v9, "length"))
  {

    v9 = CFSTR("?");
  }
  if ((unint64_t)-[__CFString length](v9, "length") >= 2)
  {
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("&"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v10;
  }
  -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("%@=%@"), v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)orderedKeysForPatternQuery:(id)a3 originalURLQuery:(id)a4 orderedOriginalURLQueryKeys:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v13);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v7, "allKeys", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
          objc_msgSend(v10, "addObject:", v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  v25 = (void *)objc_msgSend(v10, "copy");
  return v25;
}

@end
