@implementation NRTextFormattingUtilities

+ (id)prefixLinesWithString:(id)a3 withText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *context;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x1A1B01C40]();
  v27 = v5;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (unint64_t)objc_msgSend(v9, "length") >> 3;
  v28 = v9;
  if ((objc_msgSend(v9, "length") & 7) != 0)
    v11 = v10 + 1;
  else
    v11 = 1;
  objc_msgSend(&stru_1E4499C68, "stringByPaddingToLength:withString:startingAtIndex:", v11, CFSTR("\t"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    v17 = 1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1A1B01C40]();
        if (objc_msgSend(v19, "length"))
        {
          if ((v17 & 1) != 0)
            v21 = v28;
          else
            v21 = v12;
          objc_msgSend(v21, "stringByAppendingString:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByAppendingString:", CFSTR("\n"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "appendString:", v23);
          v17 = 0;
        }
        objc_autoreleasePoolPop(v20);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v7, "length") - 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("\n")) & 1) == 0)
      objc_msgSend(v7, "appendString:", CFSTR("\n"));

  }
  else
  {
    objc_msgSend(v7, "appendString:", CFSTR("\n"));
  }

  objc_autoreleasePoolPop(context);
  return v7;
}

+ (id)dateFormatter:(id)a3
{
  id v3;
  id v4;
  _QWORD *v5;
  id v6;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  if (qword_1ECE23940 != -1)
    dispatch_once(&qword_1ECE23940, &__block_literal_global_12);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __43__NRTextFormattingUtilities_dateFormatter___block_invoke_2;
  v10 = &unk_1E4495A48;
  v12 = &v13;
  v4 = v3;
  v11 = v4;
  v5 = v8;
  os_unfair_lock_lock_with_options();
  v9((uint64_t)v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_14);
  v6 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __43__NRTextFormattingUtilities_dateFormatter___block_invoke()
{
  id v0;
  void *v1;

  _MergedGlobals_14 = 0;
  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECE23938;
  qword_1ECE23938 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECE23938, "setDateFormat:", CFSTR("MM-dd-yyyy HH:mm:ss.SSS"));
}

void __43__NRTextFormattingUtilities_dateFormatter___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)qword_1ECE23938, "stringFromDate:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)nameCounter:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v6)
        objc_enumerationMutation(v3);
      v8 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v7);
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (v12 < 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ 1"), v8);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v12 + 1;
        objc_msgSend(v10, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v14);

        objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %ld"), v15, v13, (_QWORD)v19);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v8 = (id)v15;
      }

      v17 = objc_msgSend(v3, "containsObject:", v16);
      if (!v17)
        break;

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v16 = CFSTR("unknown");
  }

  return v16;
}

@end
