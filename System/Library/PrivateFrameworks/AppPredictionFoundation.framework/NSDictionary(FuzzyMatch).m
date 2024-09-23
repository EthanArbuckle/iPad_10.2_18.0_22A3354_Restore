@implementation NSDictionary(FuzzyMatch)

- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (a1 == v5)
    {
      v16 = 1;
    }
    else
    {
      v6 = objc_msgSend(a1, "count");
      if (v6 == objc_msgSend(v5, "count"))
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v7 = a1;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v19;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v19 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              objc_msgSend(v7, "objectForKey:", v12, (_QWORD)v18);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectForKey:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "atx_isFuzzyMatch:", v14);

              if (!v15)
              {
                v16 = 0;
                goto LABEL_17;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            if (v9)
              continue;
            break;
          }
        }
        v16 = 1;
LABEL_17:

      }
      else
      {
        v16 = 0;
      }
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
