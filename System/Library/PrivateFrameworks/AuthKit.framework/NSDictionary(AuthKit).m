@implementation NSDictionary(AuthKit)

- (id)_ak_shortenServiceIdentifier:()AuthKit
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.gs."), CFSTR("(cag)."));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (__CFString)_ak_truncateTokenString:()AuthKit
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v3, "length") >= 0x11)
  {
    objc_msgSend(v3, "substringToIndex:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@...%@"), v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(******)");
    if (!v3)
      v7 = CFSTR("(null)");
    v6 = v7;
  }

  return v6;
}

- (id)_ak_truncateTokenDict:()AuthKit
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47__NSDictionary_AuthKit___ak_truncateTokenDict___block_invoke;
  v13 = &unk_1E2E5F058;
  v14 = a1;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

- (id)ak_redactedCopy
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__NSDictionary_AuthKit__ak_redactedCopy__block_invoke;
  v2[3] = &unk_1E2E5F080;
  v2[4] = a1;
  objc_msgSend(a1, "aaf_map:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ak_dictionaryWithKeysFromArray:()AuthKit
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

@end
