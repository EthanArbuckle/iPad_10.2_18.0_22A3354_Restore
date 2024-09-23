@implementation NSHTTPURLResponse(GKCachingAdditions)

- (double)_maxAge
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v20;

  objc_msgSend(a1, "allHeaderFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("Cache-Control"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v2;
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = 10.0;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("="));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count") == 2)
        {
          objc_msgSend(v11, "objectAtIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("max-age"));

          if (v13)
          {
            objc_msgSend(v11, "objectAtIndex:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "doubleValue");
            v8 = v15;

          }
        }

        ++v7;
      }
      while (v6 != v7);
    }
    else
    {
      v8 = 10.0;
    }

    v2 = v20;
  }
  else
  {
    v8 = 10.0;
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = fmin(v8, 86400.0);
  objc_msgSend(v16, "minimumCacheTTL");
  if (v17 < v18)
    v17 = v18;

  return v17;
}

@end
