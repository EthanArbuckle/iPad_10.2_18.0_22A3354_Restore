@implementation NSURLResponse(AppleMediaServices)

- (id)ams_valueForHTTPHeaderField:()AppleMediaServices
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a1;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;

  objc_msgSend(v6, "valueForHTTPHeaderField:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)ams_statusCode
{
  id v1;
  id v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  v3 = objc_msgSend(v2, "statusCode");
  return v3;
}

- (id)ams_allHeaderFields
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  objc_msgSend(v2, "allHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)ams_expirationInterval
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v8;

  v8 = -1.0;
  if ((objc_msgSend(a1, "_getCacheControlMaxAge:", &v8) & 1) == 0)
  {
    objc_msgSend(a1, "ams_valueForHTTPHeaderField:", CFSTR("Expires"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -1.0;
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithNaturalLanguageString:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v4, "timeIntervalSinceNow");
        v3 = v6;

      }
    }
    v8 = v3;

  }
  return v8;
}

- (uint64_t)_getCacheControlMaxAge:()AppleMediaServices
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  _QWORD *v22;

  objc_msgSend(a1, "ams_valueForHTTPHeaderField:", CFSTR("Cache-Control"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v19 = 0;
    v11 = 0;
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  v22 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("="));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count") == 2)
      {
        objc_msgSend(v14, "objectAtIndex:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("max-age"));

        if (v16)
        {
          v9 = 1;
          objc_msgSend(v14, "objectAtIndex:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v11 = v18;

        }
      }

      ++v10;
    }
    while (v8 != v10);
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }

  v19 = v9 & 1;
  v4 = v21;
  a3 = v22;
  if (v22)
LABEL_13:
    *a3 = v11;
LABEL_14:

  return v19;
}

@end
