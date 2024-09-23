@implementation NSString(SLTwitterStringAdditions)

- (uint64_t)SLTwitterCharacterCountWithShortenedURLLength:()SLTwitterStringAdditions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  id v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 32, &v30);
  v23 = v30;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v24 = v4;
  objc_msgSend(v4, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (!v7)
  {
    v9 = 0;
    v25 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = 0;
  v25 = 0;
  v10 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      if (objc_msgSend(v12, "resultType") == 32)
      {
        objc_msgSend(v12, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "scheme");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "compare:options:", CFSTR("https"), 1))
        {
          if (!objc_msgSend(v14, "compare:options:", CFSTR("http"), 1))
          {
            ++v25;
            goto LABEL_11;
          }
        }
        else
        {
          ++v9;
LABEL_11:
          v15 = objc_msgSend(v12, "range");
          objc_msgSend(v5, "replaceCharactersInRange:withString:", v15, v16, &stru_1E7592238);
        }

        continue;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  }
  while (v8);
LABEL_17:
  if (a3)
    v17 = a3;
  else
    v17 = 20;

  objc_msgSend(v5, "precomposedStringWithCanonicalMapping");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  return v9 + v9 * v17 + v25 * v17 + v19;
}

- (BOOL)isTwitterDuplicatePostError
{
  return objc_msgSend(a1, "compare:", CFSTR("Status is a duplicate.")) == 0;
}

@end
