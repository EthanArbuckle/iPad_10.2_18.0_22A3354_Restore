@implementation EMMailDropParser

+ (id)allowedMailDropDownloadDomains
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("allowedDownloadDomains"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "count"))
  {

    v3 = &unk_1E711F6B8;
  }
  return v3;
}

+ (id)parseExpiration:(double)a3
{
  void *v3;

  if (a3 >= 9999999.0)
  {
    if (a3 > 1.0e10)
      a3 = a3 / 1000.0;
  }
  else
  {
    a3 = a3 * 1000.0;
  }
  if (a3 == 0.0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)parseHeaderValue:(id)a3 forField:(id)a4
{
  void *v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v26;
  void *v27;
  id v28;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v26 = a4;
  +[EMMailDropMetadata mailDropMetadata](EMMailDropMetadata, "mailDropMetadata");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D1E580]))
  {
    objc_msgSend(v30, "setMimeType:", CFSTR("application/zip"));
    v6 = objc_msgSend(v30, "flags") | 2;
LABEL_5:
    objc_msgSend(v30, "setFlags:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D1E5C8]))
  {
    v6 = objc_msgSend(v30, "flags") | 4;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(";"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v27, "count") < 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_37;
    goto LABEL_38;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v27;
  v7 = 0;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v8)
    goto LABEL_34;
  v9 = *(_QWORD *)v33;
  do
  {
    v10 = 0;
    v11 = v4;
    do
    {
      if (*(_QWORD *)v33 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
      objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("="));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "hasPrefix:", CFSTR("https://")))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
        v4 = v7;
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("filename")))
      {
        objc_msgSend(v13, "lastObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ef_sanitizedFileName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setFileName:", v17);
        goto LABEL_18;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("mimeType")))
      {
        objc_msgSend(v13, "lastObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setMimeType:", v18);

LABEL_18:
LABEL_19:

        goto LABEL_20;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("filesize")))
      {
        objc_msgSend(v13, "lastObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setFileSize:", objc_msgSend(v4, "integerValue"));
        goto LABEL_19;
      }
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("expiration-date")))
      {
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("x-mac-auto-archive")))
        {
          objc_msgSend(v13, "lastObject");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setAutoArchive:", objc_msgSend(v4, "BOOLValue"));
          goto LABEL_19;
        }
LABEL_20:
        v4 = v11;
        goto LABEL_21;
      }
      objc_msgSend(v13, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      if (v21 == 0.0)
      {
        v22 = 0;
        v4 = v11;
      }
      else
      {
        objc_msgSend(a1, "parseExpiration:", v21);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v4;
      }
      objc_msgSend(v30, "setExpiration:", v22);
      v11 = v4;
      if (v21 != 0.0)
        goto LABEL_19;
LABEL_21:

      ++v10;
      v11 = v4;
    }
    while (v8 != v10);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    v8 = v23;
  }
  while (v23);
LABEL_34:

  if (!v7)
    goto LABEL_38;
LABEL_37:
  objc_msgSend(a1, "parseURL:intoMetadata:", v7, v30);
LABEL_38:
  v24 = v30;

  return v24;
}

+ (void)parseURL:(id)a3 intoMetadata:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "_domainIsAllowed:", v11))
  {
    objc_msgSend(v11, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("https://www.icloud.com/attachment/"));

    if (v8)
      objc_msgSend(a1, "_parseWrappedURL:intoMetadata:", v11, v6);
    else
      objc_msgSend(a1, "_parseDirectURL:intoMetadata:", v11, v6);
    objc_msgSend(v6, "fileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Images.zip"));

    if (v10)
      objc_msgSend(v6, "setFlags:", objc_msgSend(v6, "flags") | 2);
  }
  else
  {
    objc_msgSend(v6, "setIsInvalid:", 1);
  }

}

+ (BOOL)urlIsValid:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[EMMailDropMetadata mailDropMetadata](EMMailDropMetadata, "mailDropMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailDropParser parseURL:intoMetadata:](EMMailDropParser, "parseURL:intoMetadata:", v3, v4);
  v5 = objc_msgSend(v4, "isInvalid") ^ 1;

  return v5;
}

+ (id)_parseURLQuery:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("="));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          if (objc_msgSend(v9, "count") == 2)
          {
            objc_msgSend(v9, "lastObject");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringByRemovingPercentEncoding");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "firstObject");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setValue:forKey:", v11, v12);

          }
          else
          {
            objc_msgSend(v9, "firstObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setValue:forKey:", 0, v11);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)_domainIsAllowed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD block[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v5, "isEqualToString:", CFSTR("https"));

  if ((_DWORD)v6)
  {
    objc_msgSend(v4, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__EMMailDropParser__domainIsAllowed___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_domainIsAllowed__onceToken != -1)
      dispatch_once(&_domainIsAllowed__onceToken, block);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = (id)_allowedDownloadDomains;
    v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(v7, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v6;
}

void __37__EMMailDropParser__domainIsAllowed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "allowedMailDropDownloadDomains");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_allowedDownloadDomains;
  _allowedDownloadDomains = v1;

}

+ (void)_parseWrappedURL:(id)a3 intoMetadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend(v6, "setWrappedUrl:", v19);
  objc_msgSend(a1, "_parseURLQuery:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count")
    && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("u")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = (void *)objc_msgSend(v8, "mutableCopy"),
        v8,
        v9))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("f"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("${f}"), v12, 0, 0, objc_msgSend(v9, "length"));
      objc_msgSend(v10, "ef_sanitizedFileName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFileName:", v13);

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("uk"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "length");
    if (v14)
      v16 = v14;
    else
      v16 = &stru_1E70F6E90;
    objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("${uk}"), v16, 0, 0, v15);

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sz"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFileSize:", objc_msgSend(v18, "integerValue"));

    if (v17)
      objc_msgSend(a1, "_parseDirectURL:intoMetadata:", v17, v6);
  }
  else
  {
    v17 = 0;
  }

}

+ (void)_parseDirectURL:(id)a3 intoMetadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "_domainIsAllowed:", v16))
  {
    objc_msgSend(v6, "setDirectUrl:", v16);
    objc_msgSend(v16, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_sanitizedFileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFileName:", v8);

    objc_msgSend(a1, "_parseURLQuery:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("e"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      if (v12 == 0.0)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(a1, "parseExpiration:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "setExpiration:", v13);
      if (v12 != 0.0)

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("r"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uppercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUUID:", v15);

    }
  }
  else
  {
    objc_msgSend(v6, "setIsInvalid:", 1);
  }

}

@end
