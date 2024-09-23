@implementation NSString(SLWeiboStringAdditions)

- (uint64_t)SLWeiboCharacterCountWithShortenedURLLength:()SLWeiboStringAdditions
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  id v28;
  void *v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 32, &v38);
  v28 = v38;
  v29 = v4;
  v32 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "matchesInString:options:range:", v32, 0, 0, objc_msgSend(v32, "length"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v6)
  {
    v33 = 0;
    v31 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  v33 = 0;
  v31 = 0;
  v8 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v35 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      if (objc_msgSend(v10, "resultType") == 32)
      {
        objc_msgSend(v10, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "range");
        if (objc_msgSend(a1, "rangeOfString:options:range:", v12, 1, v13, v14) == v13)
        {
          if (objc_msgSend(v12, "compare:options:", CFSTR("https"), 1))
          {
            if (!objc_msgSend(v12, "compare:options:", CFSTR("http"), 1))
            {
              ++v31;
              goto LABEL_12;
            }
          }
          else
          {
            ++v33;
LABEL_12:
            v15 = objc_msgSend(v10, "range");
            objc_msgSend(v32, "replaceCharactersInRange:withString:", v15, v16, &stru_1E7592238);
          }
        }

        continue;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  }
  while (v7);
LABEL_18:

  v17 = v32;
  if (objc_msgSend(v17, "length"))
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = MEMORY[0x1E0C80978];
    while (1)
    {
      v23 = objc_msgSend(v17, "characterAtIndex:", v18);
      if (v23 > 0x7F)
        break;
      if ((*(_DWORD *)(v22 + 4 * v23 + 60) & 0x20000) != 0)
        goto LABEL_24;
      ++v21;
LABEL_26:
      if (objc_msgSend(v17, "length") <= (unint64_t)++v18)
        goto LABEL_29;
    }
    if (!__maskrune(v23, 0x20000uLL))
    {
      ++v19;
      goto LABEL_26;
    }
LABEL_24:
    ++v20;
    goto LABEL_26;
  }
  v21 = 0;
  v20 = 0;
  v19 = 0;
LABEL_29:
  if (v21 | v19)
    v24 = (int)(v19 + vcvtps_s32_f32((float)(v20 + v21) * 0.5));
  else
    v24 = 0;
  if (a3)
    v25 = a3;
  else
    v25 = 20;

  return v33 + v33 * v25 + v31 * v25 + v24;
}

- (BOOL)isWeiboDuplicatePostError
{
  uint64_t v1;

  objc_msgSend(a1, "rangeOfString:", CFSTR("repeat content!"));
  return v1 != 0;
}

@end
