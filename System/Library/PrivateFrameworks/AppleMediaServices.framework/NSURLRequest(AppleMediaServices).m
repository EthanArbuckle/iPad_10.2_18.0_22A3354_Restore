@implementation NSURLRequest(AppleMediaServices)

- (uint64_t)ams_requestIsBagLoad
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ams_isBagLoadURL");

  return v2;
}

- (id)ams_cookies
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "valueForHTTPHeaderField:", CFSTR("Cookie"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(";"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "rangeOfString:", CFSTR("="));
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = v9;
          v11 = v9 + 1;
          v12 = objc_msgSend(v8, "length");
          if (v10)
            v13 = v11 >= v12;
          else
            v13 = 1;
          if (!v13)
          {
            objc_msgSend(v8, "substringToIndex:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "substringFromIndex:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v14);

          }
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v3);
  }
  v16 = (void *)objc_msgSend(v19, "copy");

  return v16;
}

@end
