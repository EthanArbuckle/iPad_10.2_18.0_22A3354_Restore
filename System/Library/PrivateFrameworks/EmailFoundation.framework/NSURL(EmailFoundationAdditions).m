@implementation NSURL(EmailFoundationAdditions)

- (id)ef_hostNilForEmpty
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

+ (id)ef_urlWithString:()EmailFoundationAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
  }

  return v4;
}

- (id)ef_caseNormalizedURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setScheme:", v3);

  objc_msgSend(v1, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHost:", v5);

  objc_msgSend(v1, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ef_hasScheme:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", v4);

  return v6;
}

- (uint64_t)ef_hasHost:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", v4);

  return v6;
}

- (BOOL)ef_isHTTPOrHTTPSURL
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("http")))
      v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("https")) == 0;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)ef_isEligibleForRichLink
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "ef_isHTTPOrHTTPSURL") & 1) != 0)
    return 1;
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "length") == 0;

  return v2;
}

- (id)ef_urlByAddingSchemeIfNeeded
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length") && !objc_msgSend(a1, "ef_isHTTPOrHTTPSURL"))
  {
    objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 32, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchesInString:options:range:", v2, 1, 0, objc_msgSend(v2, "length"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v9, "URL", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v9, "URL");
            v3 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }

    v3 = a1;
LABEL_14:

  }
  else
  {
    v3 = a1;
  }

  return v3;
}

- (id)ef_highLevelDomain
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ef_urlByAddingSchemeIfNeeded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_lp_highLevelDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ef_urlByReplacingSchemeWithScheme:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v4);
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ef_urlByAddingPrefixToScheme:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v7);

  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ef_urlByRemovingPrefixFromScheme:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v7);

  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ef_URLByAppendingTimestampedPathComponent:()EmailFoundationAdditions withExtension:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3578], "ef_isoDateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@"), v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "URLByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathExtension:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)ef_defaultAllowedCharacterSet
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ef_accountAllowedCharacterSet
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ef_messageAllowedCharacterSet
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ef_gmailAuthAllowedCharacterSet
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)ef_yahooAuthAllowedCharacterSet
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
