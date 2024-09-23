@implementation NSString(SGEntityMatchingTransformer)

- (uint64_t)range
{
  objc_msgSend(a1, "length");
  return 0;
}

- (uint64_t)expandRange:()SGEntityMatchingTransformer by:
{
  uint64_t v5;

  v5 = (a3 - a5) & ~((a3 - a5) >> 63);
  objc_msgSend(a1, "length");
  return v5;
}

- (id)stringByReplacingMatches:()SGEntityMatchingTransformer inRange:withBlock:
{
  id v10;
  void (**v11)(id, void *);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  unint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v30 = a1;
    v31 = a4 + a5;
    v12 = (id)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = v10;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1C3BD4F6C]();
          if (objc_msgSend(v17, "valueRange") >= a4)
          {
            v19 = objc_msgSend(v17, "valueRange");
            v21 = v19 + v20;
            if (v19 + v20 > v31)
            {
              objc_autoreleasePoolPop(v18);
              goto LABEL_15;
            }
            v22 = (void *)MEMORY[0x1C3BD4F6C]();
            objc_msgSend(v30, "substringWithRange:", a4, objc_msgSend(v17, "valueRange") - a4);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_autoreleasePoolPop(v22);
            objc_msgSend(v12, "appendString:", v23);

            v24 = (void *)MEMORY[0x1C3BD4F6C]();
            v11[2](v11, v17);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_autoreleasePoolPop(v24);
            objc_msgSend(v12, "appendString:", v25);

            a4 = v21;
          }
          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_15:

    v26 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v30, "substringWithRange:", a4, v31 - a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v26);
    objc_msgSend(v12, "appendString:", v27);

    v10 = v29;
  }
  else
  {
    v12 = a1;
  }

  return v12;
}

@end
