@implementation AKIDPUtility

+ (id)convertError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getASWebAuthenticationSessionErrorDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", v5))
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 1)
  {
LABEL_5:
    v7 = v3;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v7;

  return v8;
}

+ (id)idpURLFromRequest:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  __CFString **v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "HTTPBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithData:encoding:", v6, 4);

  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKIDPUtility parametersFromRequest:](AKIDPUtility, "parametersFromRequest:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[AKIDPUtility isMicrosoftRequestDictionary:](AKIDPUtility, "isMicrosoftRequestDictionary:", v10))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SAMLRequest"));
    v26 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByRemovingPercentEncoding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 1);
    objc_msgSend(v25, "compressedDataUsingAlgorithm:error:", 3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", charsToEscape);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invertedSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RelayState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v9, "containsString:", CFSTR("?"));
    v20 = &urlWithQueryParametersFormatString;
    if (!v19)
      v20 = &urlWithoutQueryParametersFormatString;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", *v20, v9, CFSTR("RelayState"), v17, CFSTR("SAMLRequest"), v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v21);

    v7 = v26;
  }
  else
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("?"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v12);
  }

  return v22;
}

+ (id)parametersFromResponseURL:(id)a3 request:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acsURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (a4 && v8 && v7)
    {
      v12[0] = *MEMORY[0x1E0D00080];
      objc_msgSend(v5, "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = *MEMORY[0x1E0D00088];
      v13[0] = v10;
      v13[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)parametersFromRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v22 = v3;
  objc_msgSend(v3, "HTTPBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:encoding:", v5, 4);

  v21 = v6;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("&"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("="));
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = v14;
          v17 = v15;
          objc_msgSend(v13, "substringToIndex:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "substringFromIndex:", v16 + v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v19, v18);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  return v23;
}

+ (id)microsoftLoginURLFromParameters:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SAMLRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByRemovingPercentEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("AssertionConsumerServiceURL=\"));
  objc_msgSend(v6, "substringWithRange:", v7 + v8, objc_msgSend(v6, "length") - (v7 + v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", 0, objc_msgSend(v9, "rangeOfString:", CFSTR("\")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v10);

  return v11;
}

+ (BOOL)dictionary:(id)a3 containsKeys:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

+ (BOOL)isMicrosoftRequestDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("RelayState");
  v7[1] = CFSTR("SAMLRequest");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = +[AKIDPUtility dictionary:containsKeys:](AKIDPUtility, "dictionary:containsKeys:", v4, v5);

  return (char)v3;
}

@end
