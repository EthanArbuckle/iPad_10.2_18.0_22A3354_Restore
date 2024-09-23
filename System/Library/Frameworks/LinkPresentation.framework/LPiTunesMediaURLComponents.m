@implementation LPiTunesMediaURLComponents

- (LPiTunesMediaURLComponents)initWithURL:(id)a3
{
  id v4;
  LPiTunesMediaURLComponents *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  void *v13;
  uint64_t v14;
  NSString *storefrontCountryCode;
  LPiTunesMediaURLComponents *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LPiTunesMediaURLComponents;
  v5 = -[LPiTunesMediaURLComponents init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v8, "count") < 3)
      goto LABEL_6;
    objc_msgSend(v6, "queryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPiTunesMediaURLComponents identifierFromQueryItems:pathComponent:](LPiTunesMediaURLComponents, "identifierFromQueryItems:pathComponent:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    if (!v5->_identifier)
      goto LABEL_6;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPiTunesMediaURLComponents storefrontCountryCodeFromPathComponent:](LPiTunesMediaURLComponents, "storefrontCountryCodeFromPathComponent:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    storefrontCountryCode = v5->_storefrontCountryCode;
    v5->_storefrontCountryCode = (NSString *)v14;

    if (v5->_storefrontCountryCode)
      v16 = v5;
    else
LABEL_6:
      v16 = 0;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)identifierFromQueryItems:(id)a3 pathComponent:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("a"));

        if (v12)
        {
          v21 = v6;

          goto LABEL_25;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v8)
        continue;
      break;
    }
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v24;
    while (2)
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("i"));

        if (v19)
        {
          objc_msgSend(v17, "value");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v14)
        continue;
      break;
    }
  }

  if (objc_msgSend(v6, "hasPrefix:", CFSTR("id")))
  {
    objc_msgSend(v6, "substringFromIndex:", 2);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "hasPrefix:", CFSTR("ra")))
    {
      v21 = 0;
      goto LABEL_25;
    }
    v20 = v6;
  }
  v21 = v20;
LABEL_25:

  return v21;
}

+ (id)storefrontCountryCodeFromPathComponent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (+[LPiTunesMediaStorefrontMappings isValidStorefrontCountryCode:](LPiTunesMediaStorefrontMappings, "isValidStorefrontCountryCode:", v3))
  {
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)storefrontCountryCode
{
  return self->_storefrontCountryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
