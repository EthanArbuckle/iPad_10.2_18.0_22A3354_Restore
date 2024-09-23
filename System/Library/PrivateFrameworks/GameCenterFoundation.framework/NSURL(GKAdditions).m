@implementation NSURL(GKAdditions)

- (uint64_t)gkFileSystemRepresentation
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"));
}

- (uint64_t)_gkIsValidServerURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (_gkIsValidServerURL_onceToken != -1)
    dispatch_once(&_gkIsValidServerURL_onceToken, &__block_literal_global_97);
  v2 = (void *)_gkIsValidServerURL_sValidSchemes;
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (uint64_t)_gkIsSecure
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("https"));

  return v2;
}

- (id)_gkURLByAddingQueryParameters:()GKAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_20;
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_19:

LABEL_20:
    v18 = a1;
    goto LABEL_21;
  }
  v20 = v5;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(a1, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = v4;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    if (v7)
      v11 = CFSTR("&");
    else
      v11 = CFSTR("?");
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
        {
          objc_msgSend(v6, "appendFormat:", CFSTR("%@%@=%@"), v11, v14, v15);
          v11 = CFSTR("&");
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    v5 = v20;
    v4 = v21;
    goto LABEL_19;
  }
  v18 = (id)v17;

  v4 = v21;
LABEL_21:

  return v18;
}

- (id)_gkURLByReplacingSchemeWithScheme:()GKAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v5, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
