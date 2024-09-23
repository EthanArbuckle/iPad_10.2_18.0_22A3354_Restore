@implementation NSMutableDictionary(Merge)

- (void)cmi_mergeEntriesFromDictionary:()Merge
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (a1 != v4)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v22;
        v9 = 0x1E0C99000uLL;
        v10 = 0x1E0C99000uLL;
        v20 = v5;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v22 != v8)
              objc_enumerationMutation(v5);
            v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v5, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
              goto LABEL_14;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = v7;
                v16 = v8;
                v17 = v9;
                v18 = v10;
                v19 = objc_msgSend(v14, "mutableCopy");

                objc_msgSend(a1, "setObject:forKeyedSubscript:", v19, v12);
                v14 = (void *)v19;
                v10 = v18;
                v9 = v17;
                v8 = v16;
                v7 = v15;
                v5 = v20;
              }
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v14, "cmi_mergeEntriesFromDictionary:", v13);
            else
LABEL_14:
              objc_msgSend(a1, "setObject:forKeyedSubscript:", v13, v12);

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v7);
      }
    }
  }

}

- (uint64_t)cmi_nonDestructiveMergeEntriesFromDictionary:()Merge
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v24 = v5;
      v9 = *(_QWORD *)v27;
      v10 = 0x1E0C99000uLL;
      v11 = 0x1E0C99000uLL;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_19;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v25 = v14;
              v16 = v8;
              v17 = v9;
              v18 = v6;
              v19 = v11;
              v20 = v10;
              v21 = objc_msgSend(v15, "mutableCopy");

              objc_msgSend(a1, "setObject:forKeyedSubscript:", v21, v13);
              v15 = (void *)v21;
              v10 = v20;
              v11 = v19;
              v6 = v18;
              v9 = v17;
              v8 = v16;
              v14 = v25;
            }
            if (objc_msgSend(v15, "cmi_nonDestructiveMergeEntriesFromDictionary:", v14))
            {
LABEL_19:
              fig_log_get_emitter();
              FigDebugAssert3();

              v22 = 4294954514;
              goto LABEL_20;
            }
          }
          else
          {
            objc_msgSend(a1, "setObject:forKeyedSubscript:", v14, v13);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v8)
          continue;
        break;
      }
      v22 = 0;
LABEL_20:
      v5 = v24;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
