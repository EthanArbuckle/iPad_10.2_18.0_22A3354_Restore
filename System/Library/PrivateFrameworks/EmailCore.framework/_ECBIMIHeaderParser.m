@implementation _ECBIMIHeaderParser

+ (ECBIMIData)bimiDataForHeaders:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  ECBIMIData *v20;
  void *v22;
  id v23;
  id v24;

  v2 = a2;
  v3 = (void *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(";"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstHeaderForKey:", CFSTR("bimi-indicator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_stringByRemovingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "firstHeaderForKey:", CFSTR("bimi-location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ef_stringByTrimmingTrailingCharactersInSet:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length") && !objc_msgSend(v10, "length"))
  {
    v20 = 0;
    goto LABEL_18;
  }
  if (!v8
    || (v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0)) == 0)
  {
    v12 = 0;
    v13 = 0;
    if (!v10)
      goto LABEL_7;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "_indicatorDataHasValidSVGProfile:", v11))
  {
    v12 = 1;
    v13 = v11;
    if (!v10)
    {
LABEL_7:
      v14 = 0;
      v15 = 0;
LABEL_10:
      if (v14)
        v16 = 1;
      else
        v16 = v12;
      if (v16 == 1)
      {
        v22 = v4;
        objc_msgSend(v2, "firstHeaderForKey:", CFSTR("x-bimi-indicator-hash"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        objc_msgSend(v3, "_hashFromIndicatorHashHeader:algorithm:", v17, &v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v23;
        v20 = -[ECBIMIData initWithIndicator:location:evidenceLocation:indicatorHash:hashAlgorithm:]([ECBIMIData alloc], "initWithIndicator:location:evidenceLocation:indicatorHash:hashAlgorithm:", v13, v14, v15, v18, v19);

        v11 = v13;
        v4 = v22;
      }
      else
      {
        v20 = 0;
        v14 = 0;
        v11 = v13;
      }
      goto LABEL_17;
    }
LABEL_9:
    v24 = 0;
    objc_msgSend(v3, "_locationFromLocationHeader:evidenceLocation:", v10, &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    goto LABEL_10;
  }
  v20 = 0;
  v14 = 0;
  v15 = 0;
LABEL_17:

LABEL_18:
  return v20;
}

+ (BOOL)_indicatorDataHasValidSVGProfile:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = -[_ECSVGProfileExtractor initWithSVGData:]((id *)[_ECSVGProfileExtractor alloc], v3);
  -[_ECSVGProfileExtractor namespace](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", CFSTR("http://www.w3.org/2000/svg")))
  {
    -[_ECSVGProfileExtractor version](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "ef_caseInsensitiveIsEqualToString:", CFSTR("1.2")))
    {
      -[_ECSVGProfileExtractor baseProfile](v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ef_caseInsensitiveIsEqualToString:", CFSTR("tiny-ps"));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_locationFromLocationHeader:(id)a3 evidenceLocation:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v6);
  if (objc_msgSend(a1, "_versionIsValidWithScanner:", v7))
  {
    v12 = 0;
    objc_msgSend(a1, "_locationFromScanner:evidenceLocation:", v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = 0;
  v9 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v9);
LABEL_6:
  v10 = v8;

  return v10;
}

+ (BOOL)_versionIsValidWithScanner:(id)a3
{
  id v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  id v13;

  v3 = a3;
  v13 = 0;
  v4 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("="), &v13);
  v5 = v13;
  if (v4 && (objc_msgSend(v3, "scanString:intoString:", CFSTR("="), 0) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_stringByTrimmingTrailingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("v")) & 1) != 0)
    {
      v12 = 0;
      LODWORD(v8) = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR(";"), &v12);
      v9 = v12;
      if ((_DWORD)v8)
      {
        if ((objc_msgSend(v3, "scanString:intoString:", CFSTR(";"), 0) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "ef_stringByTrimmingTrailingCharactersInSet:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v8) = objc_msgSend(v10, "isEqualToString:", CFSTR("BIMI1"));
          v9 = v10;
        }
        else
        {
          LOBYTE(v8) = 0;
        }
      }

    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    v7 = v5;
  }

  return (char)v8;
}

+ (id)_locationFromScanner:(id)a3 evidenceLocation:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id v18;

  v6 = a3;
  v18 = 0;
  objc_msgSend(a1, "_scanToNextTagForScanner:url:", v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (objc_msgSend(v6, "isAtEnd"))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("l")))
    {
      v9 = v8;
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("a")))
      {
        v12 = v8;
        v9 = 0;
        if (!a4)
          goto LABEL_13;
        goto LABEL_12;
      }
      v9 = 0;
    }
    v12 = 0;
    if (!a4)
      goto LABEL_13;
LABEL_12:
    *a4 = objc_retainAutorelease(v12);
    goto LABEL_13;
  }
  v17 = 0;
  objc_msgSend(a1, "_scanToNextTagForScanner:url:", v6, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (objc_msgSend(v6, "isAtEnd")
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("l"))
     && (v9 = v8, v12 = v11, (objc_msgSend(v10, "isEqualToString:", CFSTR("a")) & 1) != 0)
     || objc_msgSend(v7, "isEqualToString:", CFSTR("a"))
     && (v9 = v11, v12 = v8, objc_msgSend(v10, "isEqualToString:", CFSTR("l")))))
  {
    v13 = v8;
    v14 = v11;
  }
  else
  {
    v9 = 0;
    v12 = 0;
  }

  if (a4)
    goto LABEL_12;
LABEL_13:
  v15 = v9;

  return v15;
}

+ (id)_scanToNextTagForScanner:(id)a3 url:(id *)a4
{
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  objc_msgSend(a1, "_scanToNextTagForScanner:allowSemicolonSeparator:value:", a3, 1, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);

  return v5;
}

+ (id)_hashFromIndicatorHashHeader:(id)a3 algorithm:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v16;
  id v17;

  v16 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v16);
  v6 = 0;
  v7 = 0;
  while ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
  {
    v17 = 0;
    objc_msgSend(a1, "_scanToNextTagForScanner:allowSemicolonSeparator:value:", v5, 0, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("h")) & 1) != 0)
    {
      v10 = v6;
      v6 = v9;
      v11 = v7;
    }
    else
    {
      v10 = v7;
      v11 = v9;
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("a")))
        goto LABEL_7;
    }
    v12 = v9;

    v7 = v11;
LABEL_7:

  }
  if (v6 && v7)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v7);
    v13 = v6;
  }
  else
  {
    v13 = 0;
    if (a4)
      *a4 = 0;
  }

  return v13;
}

+ (id)_scanToNextTagForScanner:(id)a3 allowSemicolonSeparator:(BOOL)a4 value:(id *)a5
{
  _BOOL4 v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v21;
  id v22;

  v6 = a4;
  v7 = a3;
  v22 = 0;
  v8 = objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("="), &v22);
  v9 = v22;
  if (v8 && (objc_msgSend(v7, "scanString:intoString:", CFSTR("="), 0) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_stringByTrimmingTrailingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invertedSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v14 = objc_msgSend(v7, "scanCharactersFromSet:intoString:", v13, &v21);
    v15 = v21;

    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scanCharactersFromSet:intoString:", v16, 0);

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(";"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "scanCharactersFromSet:intoString:", v17, 0);
        objc_msgSend(v15, "ef_stringByTrimmingTrailingCharactersInSet:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v15 = (id)v18;
      }
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      v19 = v11;
    }
    else
    {
      v19 = 0;
      if (a5)
        *a5 = 0;
    }

  }
  else
  {
    v19 = 0;
    if (a5)
      *a5 = 0;
    v11 = v9;
  }

  return v19;
}

@end
