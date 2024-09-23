@implementation NSURLComponents(ParsecExtras)

+ (id)parsec_componentsWithURL:()ParsecExtras resolvingAgainstBaseURL:
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  fixQueryComponentEncoding(v0);
  objc_claimAutoreleasedReturnValue();

  return v0;
}

- (id)parsec_normalizedURLStringWithOptions:()ParsecExtras
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v4 & 1) != 0)
      objc_msgSend(v5, "addObject:", CFSTR("www."));
    if ((v4 & 2) != 0)
      objc_msgSend(v6, "addObjectsFromArray:", &unk_1E3959578);
    objc_msgSend(a1, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v7, "length"));
    v9 = objc_msgSend(a1, "rangeOfHost");
    if (v10)
    {
      v30 = v7;
      objc_msgSend(v7, "substringWithRange:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            v17 = objc_msgSend(v11, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), 9);
            if (v17 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v11, "substringFromIndex:", v17 + v18);
              v19 = objc_claimAutoreleasedReturnValue();

              v11 = (void *)v19;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v14);
      }

      objc_msgSend(v8, "appendString:", v11);
      v7 = v30;
    }
    v20 = objc_msgSend(a1, "rangeOfPath");
    if ((v4 & 4) != 0 || !v21)
      goto LABEL_28;
    objc_msgSend(v7, "substringWithRange:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((v4 & 8) != 0)
    {
      v23 = v22;
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "containsString:", CFSTR(".")))
      {

LABEL_24:
        objc_msgSend(v23, "stringByDeletingLastPathComponent");
        v26 = objc_claimAutoreleasedReturnValue();

        v23 = (id)v26;
        goto LABEL_25;
      }
      v25 = objc_msgSend(v23, "parsec_hasCaseInsensitiveSuffix:", CFSTR("html"));

      if (v25)
        goto LABEL_24;
    }
LABEL_25:
    v27 = objc_msgSend(v23, "rangeOfString:options:", CFSTR("/"), 13);
    if (v27 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v23, "substringToIndex:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      v23 = (id)v28;
    }
    objc_msgSend(v8, "appendString:", v23);

LABEL_28:
    goto LABEL_29;
  }
  objc_msgSend(a1, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v8;
}

- (uint64_t)parsec_normalizedURLStringForTLDFeatures
{
  return objc_msgSend(a1, "parsec_normalizedURLStringWithOptions:", 7);
}

- (uint64_t)parsec_normalizedURLStringForLDAModel
{
  return objc_msgSend(a1, "parsec_normalizedURLStringWithOptions:", 11);
}

- (uint64_t)parsec_normalizedURLStringForDeepLinkIngest
{
  return objc_msgSend(a1, "parsec_normalizedURLStringWithOptions:", 3);
}

- (uint64_t)parsec_normalizedURLStringForDeepLinkWhitelist
{
  return objc_msgSend(a1, "parsec_normalizedURLStringWithOptions:", 15);
}

- (uint64_t)embeddedAMPURLRange
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:options:", CFSTR("^/?amp/(\\w/)?"), 1024);

  return v2;
}

- (id)parsec_componentsForEmbeddedAMPURLFromRange:()ParsecExtras
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_3;
  v6 = objc_msgSend(a1, "rangeOfPath");
  objc_msgSend(a1, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = v6 + a4;

  if (v9 == v10)
  {
LABEL_3:
    v11 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "scheme");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = CFSTR("http");
    objc_msgSend(a1, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringFromIndex:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@://%@"), v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)parsec_componentsAfterRemovingSubdomains
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parsec_readableURLStringAfterRemovingSubdomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v4);
  else
    v5 = a1;
  v6 = v5;

  return v6;
}

+ (id)parsec_componentsWithString:()ParsecExtras
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  fixQueryComponentEncoding(v0);
  objc_claimAutoreleasedReturnValue();

  return v0;
}

@end
