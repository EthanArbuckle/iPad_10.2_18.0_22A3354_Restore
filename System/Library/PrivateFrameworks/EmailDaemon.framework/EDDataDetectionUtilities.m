@implementation EDDataDetectionUtilities

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EDDataDetectionUtilities_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_28 != -1)
    dispatch_once(&log_onceToken_28, block);
  return (id)log_log_28;
}

void __31__EDDataDetectionUtilities_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_28;
  log_log_28 = (uint64_t)v1;

}

+ (void)_lexiconEnumerateEntries:(_LXLexicon *)a3 forString:(id)a4 completionHandler:(id)a5
{
  id v5;
  id v6;

  v6 = a5;
  v5 = v6;
  LXLexiconEnumerateEntriesForString();

}

uint64_t __81__EDDataDetectionUtilities__lexiconEnumerateEntries_forString_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = LXEntryCopyString();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a3);
}

+ (BOOL)_isRealWord:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  _QWORD aBlock[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  void *v24;
  uint8_t buf[24];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__EDDataDetectionUtilities__isRealWord_locale___block_invoke;
  aBlock[3] = &unk_1E949C230;
  v8 = v6;
  v18 = v8;
  v19 = &v20;
  v9 = _Block_copy(aBlock);
  v10 = v7;
  v26 = *MEMORY[0x1E0D437B8];
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v24 = 0;
  v11 = (const void *)LXLexiconCreate();
  if (v11)
  {

    objc_msgSend(a1, "_lexiconEnumerateEntries:forString:completionHandler:", v11, v8, v9);
    CFRelease(v11);
  }
  else
  {
    v12 = v24;
    +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDDataDetectionUtilities _isRealWord:locale:].cold.1((uint64_t)v10, v14, buf, v13);
    }

  }
  v15 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v15;
}

uint64_t __47__EDDataDetectionUtilities__isRealWord_locale___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2);
  if (!result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

+ (BOOL)isRealWord:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  int v7;
  char v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  BOOL v15;
  int v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = -[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("en"));
  v8 = v7;
  if (v7)
    v9 = v6;
  else
    v9 = CFSTR("en");
  v10 = v9;
  if (objc_msgSend(a1, "_isRealWord:locale:", v4, v10))
  {
    +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      v12 = "This current paragraph does not contain a valid code since %@ is a real English word";
      v13 = v11;
      v14 = 12;
LABEL_7:
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    }
  }
  else
  {
    if ((v8 & 1) != 0 || !objc_msgSend(a1, "_isRealWord:locale:", v4, v6))
    {
      v15 = 0;
      goto LABEL_14;
    }
    +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v6;
      v12 = "This current paragraph does not contain a valid code since %@ is a real word in this language: %@";
      v13 = v11;
      v14 = 22;
      goto LABEL_7;
    }
  }

  v15 = 1;
LABEL_14:

  return v15;
}

+ (id)detectOneTimeCodeWithDataDetectors:(id)a3
{
  char *v3;
  NSObject *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v35;
  void *v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v36 = v5;
  v6 = objc_msgSend(v5, "length");
  if (v6 >= 0x1F4)
    v7 = 500;
  else
    v7 = v6;
  if (v7)
  {
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CE78]), "initWithScannerType:passiveIntent:", 0, 1);
    objc_msgSend(MEMORY[0x1E0D1CE70], "scanString:range:configuration:", v5, 0, v7);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v39;
      v11 = *MEMORY[0x1E0D1CA38];
      v3 = "Skipping one-time code with length %ld";
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v13, "type");
          v4 = objc_claimAutoreleasedReturnValue();
          v14 = -[NSObject isEqualToString:](v4, "isEqualToString:", v11);

          if (v14)
          {
            objc_msgSend(v13, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (unint64_t)objc_msgSend(v15, "length") < 0xA;

            if (v16)
            {
              objc_msgSend(v13, "value");
              v4 = objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v37, "addObject:", v4);
            }
            else
            {
              +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
              v4 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "value");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "length");
                *(_DWORD *)buf = 134217984;
                v43 = v18;
                _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Skipping one-time code with length %ld", buf, 0xCu);

              }
            }

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v9);
    }

    if (!-[NSObject count](v37, "count"))
    {
      +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v33, OS_LOG_TYPE_DEFAULT, "No one-time codes detected using data detectors", buf, 2u);
      }
      v29 = 0;
      goto LABEL_38;
    }
    -[NSObject ef_filter:](v37, "ef_filter:", &__block_literal_global_16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v20 = objc_msgSend(v19, "count");
      if (v20 < -[NSObject count](v37, "count"))
      {
        +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = -[NSObject count](v37, "count");
          v23 = objc_msgSend(v19, "count");
          *(_DWORD *)buf = 134218240;
          v43 = v22;
          v44 = 2048;
          v45 = v23;
          _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "Found %lu potential codes, filtered down to %lu codes.", buf, 0x16u);
        }

        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v19);
        v37 = v24;
      }
    }
    v25 = -[NSObject count](v37, "count");
    if (v25 < 2
      || (-[NSObject firstObject](v37, "firstObject"),
          v3 = (char *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v3, "length"),
          -[NSObject objectAtIndexedSubscript:](v37, "objectAtIndexedSubscript:", 1),
          v4 = objc_claimAutoreleasedReturnValue(),
          v26 >= -[NSObject length](v4, "length")))
    {
      -[NSObject firstObject](v37, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 < 2)
      {
LABEL_32:
        +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = -[NSObject count](v37, "count");
          objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v43 = v31;
          v44 = 2112;
          v45 = (uint64_t)v32;
          _os_log_impl(&dword_1D2F2C000, v30, OS_LOG_TYPE_DEFAULT, "We found %lu potential One-Time Code(s) in this email, the One-Time Code to use is : %@", buf, 0x16u);

        }
        v33 = v27;

        v29 = v33;
LABEL_38:

        v28 = v37;
        goto LABEL_39;
      }
    }
    else
    {
      -[NSObject objectAtIndexedSubscript:](v37, "objectAtIndexedSubscript:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_32;
  }
  +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "No valid string sent to data detectors", buf, 2u);
  }
  v29 = 0;
LABEL_39:

  return v29;
}

BOOL __63__EDDataDetectionUtilities_detectOneTimeCodeWithDataDetectors___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "length") == 8 || objc_msgSend(v2, "length") == 6;

  return v3;
}

+ (id)extractOneTimeCode:(id)a3 withSubject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v46;
  char v47;
  void *v48;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v57 = v5;
  v54 = v6;
  if (v5)
  {
    v7 = v5;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v6, v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
    +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[EDDataDetectionUtilities extractOneTimeCode:withSubject:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

    v7 = v54;
  }
  v8 = v7;
LABEL_8:
  v53 = v8;
  +[EDDataDetectionUtilities detectOneTimeCodeWithDataDetectors:](EDDataDetectionUtilities, "detectOneTimeCodeWithDataDetectors:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    +[EDOTCKeywords localizedExpressionStrings](EDOTCKeywords, "localizedExpressionStrings");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("-"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "formUnionWithCharacterSet:", v20);

      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v5);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      v21 = 0;
      v22 = 0;
      v47 = 0;
      v50 = 0;
      while ((objc_msgSend(v55, "isAtEnd") & 1) == 0)
      {
        v62 = v22;
        objc_msgSend(v55, "scanUpToCharactersFromSet:intoString:", v51, &v62);
        v56 = v62;

        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringByTrimmingCharactersInSet:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        if (-[NSObject length](v24, "length"))
        {
          if ((v47 & 1) != 0)
          {
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v25 = v48;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v59;
              while (2)
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v59 != v27)
                    objc_enumerationMutation(v25);
                  v29 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@"), v21, v24);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v30, "rangeOfString:options:", v29, 1025) != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v64 = v29;
                      _os_log_impl(&dword_1D2F2C000, v35, OS_LOG_TYPE_DEFAULT, "Mail detected a one-time code with keyword: %@", buf, 0xCu);
                    }

                    v5 = v57;
                    v50 = v50;

                    v19 = v50;
                    goto LABEL_45;
                  }

                  v5 = v57;
                }
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
                if (v26)
                  continue;
                break;
              }
            }

          }
          if ((unint64_t)(-[NSObject length](v24, "length") - 4) > 5
            || (objc_msgSend(a1, "isRealWord:", v24) & 1) != 0)
          {
            v31 = v21;
            v21 = v24;
          }
          else
          {
            -[NSObject stringByTrimmingCharactersInSet:](v24, "stringByTrimmingCharactersInSet:", v46);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v32, "isEqualToString:", &stru_1E94A4508);

            v31 = v50;
            v50 = v24;
          }
          v33 = v24;

          ++v52;
        }

        v34 = v56;
        v22 = v56;
        if (v52 == 10)
          goto LABEL_38;
      }
      v34 = v22;
LABEL_38:
      v56 = v34;
      if ((objc_msgSend(v55, "isAtEnd") & 1) == 0)
      {
        +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v64 = 10;
          _os_log_impl(&dword_1D2F2C000, v44, OS_LOG_TYPE_DEFAULT, "Mail stopped scanning the message after line %lu", buf, 0xCu);
        }

      }
      +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_DEFAULT, "No one-time code detected using our heuristics", buf, 2u);
      }
      v19 = 0;
LABEL_45:

    }
    else
    {
      +[EDDataDetectionUtilities log](EDDataDetectionUtilities, "log");
      v36 = objc_claimAutoreleasedReturnValue();
      v51 = v36;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        +[EDDataDetectionUtilities extractOneTimeCode:withSubject:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);
      v19 = 0;
      v50 = 0;
    }

    v18 = 0;
  }

  return v19;
}

+ (void)_isRealWord:(uint8_t *)buf locale:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ LXLexiconRef: %{public}@", buf, 0x16u);

}

+ (void)extractOneTimeCode:(uint64_t)a3 withSubject:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "We could not load the OTC keywords json file. See Previous logs for more info.", a5, a6, a7, a8, 0);
}

+ (void)extractOneTimeCode:(uint64_t)a3 withSubject:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "We are unable to read plain text from the email", a5, a6, a7, a8, 0);
}

@end
