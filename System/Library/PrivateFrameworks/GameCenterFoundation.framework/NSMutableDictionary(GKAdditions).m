@implementation NSMutableDictionary(GKAdditions)

- (void)_gkAddEntriesFromFormEncodedString:()GKAdditions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v8, "length"))
          {
            v9 = objc_msgSend(v8, "rangeOfString:", CFSTR("="));
            if (v9 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v8, "_gkStringByUnescapingFromURLQuery");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = &stru_1E75BB5A8;
            }
            else
            {
              v13 = v9;
              v14 = v10;
              objc_msgSend(v8, "substringToIndex:", v9);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "_gkStringByUnescapingFromURLQuery");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v8, "substringFromIndex:", v13 + v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "_gkStringByUnescapingFromURLQuery");
              v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            if (v11)
              v17 = v12 == 0;
            else
              v17 = 1;
            if (!v17)
              objc_msgSend(a1, "setObject:forKey:", v12, v11);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v5);
    }

  }
}

- (void)_gkSetIfNonNilObject:()GKAdditions forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKeyedSubscript:");
  return a1;
}

@end
