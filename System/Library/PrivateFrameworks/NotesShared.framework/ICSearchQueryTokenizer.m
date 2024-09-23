@implementation ICSearchQueryTokenizer

+ (id)expandedTokensForSearchString:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredLocalizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "canonicalLocaleIdentifierFromString:", v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_queryTokensForSearchString:language:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sortMutableSearchQueryTokensInPlace:", v12);
  objc_msgSend(a1, "_insertConnectorAndDividerSegmentsIntoMutableTokenArray:searchString:", v12, v6);
  objc_msgSend(a1, "_combineConnectorAndTokensAndRemoveDividersInPlaceForMutableTokenArray:searchString:", v12, v6);
  objc_msgSend(a1, "_expandedTokensForSearchQuerySegmentArray:searchString:language:", v12, v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)tokensFromString:(id)a3 language:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_queryTokensForSearchString:language:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sortMutableSearchQueryTokensInPlace:", v7);
  objc_msgSend(a1, "_insertConnectorAndDividerSegmentsIntoMutableTokenArray:searchString:", v7, v6);
  objc_msgSend(a1, "_combineConnectorAndTokensAndRemoveDividersInPlaceForMutableTokenArray:searchString:", v7, v6);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "segmentString", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

+ (id)_queryTokensForSearchString:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  ICSearchQuerySegment *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, char);
  void *v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
    goto LABEL_10;
  v9 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredLocalizations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "canonicalLocaleIdentifierFromString:", v12);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_10:
    objc_msgSend(a1, "tokenizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(a1, "tokenizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v14);
      objc_msgSend(a1, "tokenizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLanguage:", v7);

      objc_msgSend(a1, "tokenizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setString:", v6);

      objc_msgSend(a1, "tokenizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "length");
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __63__ICSearchQueryTokenizer__queryTokensForSearchString_language___block_invoke;
      v24 = &unk_1E76CCC58;
      v25 = v6;
      v26 = v8;
      objc_msgSend(v17, "enumerateTokensInRange:usingBlock:", 0, v18, &v21);

      objc_sync_exit(v14);
    }
  }
  if (!objc_msgSend(v8, "count", v21, v22, v23, v24))
  {
    v19 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:]([ICSearchQuerySegment alloc], "initWithSegmentString:range:type:isExpandable:", v6, 0, objc_msgSend(v6, "length"), 0, 0);
    objc_msgSend(v8, "addObject:", v19);

  }
  return v8;
}

void __63__ICSearchQueryTokenizer__queryTokensForSearchString_language___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _BOOL8 v7;
  ICSearchQuerySegment *v8;
  void *v9;
  ICSearchQuerySegment *v10;

  v7 = (a4 & 7) == 0;
  v8 = [ICSearchQuerySegment alloc];
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v8, "initWithSegmentString:range:type:isExpandable:", v9, a2, a3, 0, v7);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

+ (void)_sortMutableSearchQueryTokensInPlace:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_42);
}

uint64_t __63__ICSearchQueryTokenizer__sortMutableSearchQueryTokensInPlace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "segmentRange");
  v6 = objc_msgSend(v4, "segmentRange");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

+ (void)_insertConnectorAndDividerSegmentsIntoMutableTokenArray:(id)a3 searchString:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  ICSearchQuerySegment *v17;
  void *v18;
  ICSearchQuerySegment *v19;
  _UNKNOWN **v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  ICSearchQuerySegment *v33;
  void *v34;
  unint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  ICSearchQuerySegment *v47;
  void *v48;
  ICSearchQuerySegment *v49;
  uint64_t v50;
  BOOL v51;
  unint64_t v52;
  ICSearchQuerySegment *v53;
  void *v54;
  ICSearchQuerySegment *v55;
  uint64_t v56;
  id v57;
  id v58;

  v58 = a3;
  v6 = a4;
  if (objc_msgSend(v58, "count") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "segmentRange");

    v9 = 0;
    if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "nonConnectorCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v10, 4, 0, v8);
      v13 = v12;

      v14 = v8 - (v11 + v13);
      v15 = v11 == 0x7FFFFFFFFFFFFFFFLL;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v16 = 0;
      else
        v16 = v11 + v13;
      if (!v15)
        v8 = v14;
      if (v8)
      {
        v17 = [ICSearchQuerySegment alloc];
        objc_msgSend(v6, "substringWithRange:", v16, v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 1;
        v19 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v17, "initWithSegmentString:range:type:isExpandable:", v18, v16, v8, 1, 0);

        objc_msgSend(v58, "insertObject:atIndex:", v19, 0);
      }
      else
      {
        v9 = 0;
      }
    }
    if (v9 < objc_msgSend(v58, "count"))
    {
      v20 = &off_1E76C5000;
      do
      {
        objc_msgSend(v58, "objectAtIndexedSubscript:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "segmentRange") == 0x7FFFFFFFFFFFFFFFLL)
        {

          v22 = v58;
        }
        else
        {
          objc_msgSend(v58, "objectAtIndexedSubscript:", v9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "type");

          v22 = v58;
          if (!v24)
          {
            objc_msgSend(v58, "objectAtIndexedSubscript:", v9);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "segmentRange");
            v28 = v26 + v27;

            if (v9 >= objc_msgSend(v58, "count") - 1)
            {
              if (v28 < objc_msgSend(v6, "length"))
              {
                v30 = objc_msgSend(v6, "length");
                goto LABEL_25;
              }
LABEL_28:
              v31 = 0;
            }
            else
            {
              objc_msgSend(v58, "objectAtIndexedSubscript:", v9 + 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "segmentRange");

LABEL_25:
              v31 = 0;
              if (v30 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v32 = v30 - v28;
                if (v30 >= v28)
                {
                  if (v30 > objc_msgSend(v6, "length"))
                    goto LABEL_28;
                  if (v30 == v28)
                  {
                    v33 = (ICSearchQuerySegment *)objc_msgSend(objc_alloc((Class)v20[503]), "initWithSegmentString:range:type:isExpandable:", &stru_1E76DB108, v28, v30 - v28, 2, 0);
                    objc_msgSend(v58, "insertObject:atIndex:", v33, v9 + 1);
                    v31 = 1;
                    goto LABEL_48;
                  }
                  v57 = a1;
                  objc_msgSend(a1, "nonConnectorCharacterSet");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v34, 0, v28, v30 - v28);

                  if (v35 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v36 = objc_alloc((Class)v20[503]);
                    objc_msgSend(v6, "substringWithRange:", v28, v30 - v28);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = (ICSearchQuerySegment *)objc_msgSend(v36, "initWithSegmentString:range:type:isExpandable:", v37, v28, v32, 1, 0);

                    objc_msgSend(v58, "insertObject:atIndex:", v33, v9 + 1);
                    v31 = 1;
                    a1 = v57;
                    goto LABEL_48;
                  }
                  if (v35 == v28)
                  {
                    v31 = 0;
                  }
                  else
                  {
                    v38 = objc_alloc((Class)v20[503]);
                    objc_msgSend(v6, "substringWithRange:", v28, v35 - v28);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = (void *)objc_msgSend(v38, "initWithSegmentString:range:type:isExpandable:", v39, v28, v35 - v28, 1, 0);

                    objc_msgSend(v58, "insertObject:atIndex:", v40, v9 + 1);
                    v31 = 1;
                  }
                  objc_msgSend(v57, "nonConnectorCharacterSet");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v41, 4, v28, v30 - v28);
                  v44 = v43;

                  v45 = v42 + v44;
                  if (v45 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v46 = v30 - v45;
                    if (v46)
                    {
                      v47 = [ICSearchQuerySegment alloc];
                      objc_msgSend(v6, "substringWithRange:", v45, v46);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v47, "initWithSegmentString:range:type:isExpandable:", v48, v45, v46, 1, 0);

                      v50 = 1;
                      if (v35 != v28)
                        v50 = 2;
                      objc_msgSend(v58, "insertObject:atIndex:", v49, v50 + v9);
                      ++v31;

                    }
                  }
                  a1 = v57;
                  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v20 = &off_1E76C5000;
                  }
                  else
                  {
                    v20 = &off_1E76C5000;
                    if (v45 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v51 = v45 > v35;
                      v52 = v45 - v35;
                      if (v51)
                      {
                        v53 = [ICSearchQuerySegment alloc];
                        objc_msgSend(v6, "substringWithRange:", v35, v52);
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        v55 = v53;
                        v20 = &off_1E76C5000;
                        v33 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v55, "initWithSegmentString:range:type:isExpandable:", v54, v35, v52, 2, 0);

                        v56 = 1;
                        if (v35 != v28)
                          v56 = 2;
                        objc_msgSend(v58, "insertObject:atIndex:", v33, v56 + v9);
                        ++v31;
LABEL_48:

                      }
                    }
                  }
                }
              }
            }
            v9 += v31 + 1;
            v22 = v58;
            continue;
          }
        }
        ++v9;
      }
      while (v9 < objc_msgSend(v22, "count"));
    }
  }

}

+ (void)_combineConnectorAndTokensAndRemoveDividersInPlaceForMutableTokenArray:(id)a3 searchString:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  ICSearchQuerySegment *v20;
  void *v21;
  ICSearchQuerySegment *v22;
  id v23;

  v23 = a3;
  v5 = a4;
  if (objc_msgSend(v23, "count") && objc_msgSend(v23, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "type");

      if (v8 == 2)
      {
        objc_msgSend(v23, "removeObjectAtIndex:", v6);
        v9 = v23;
      }
      else
      {
        v10 = v6;
        v9 = v23;
        while (1)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "type");

          if (v12 == 2)
            break;
          v13 = ++v10 >= objc_msgSend(v23, "count");
          v9 = v23;
          if (v13)
            goto LABEL_14;
        }
        v9 = v23;
LABEL_14:
        if (v10 - 1 > v6)
        {
          objc_msgSend(v23, "objectAtIndexedSubscript:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "segmentRange");

          objc_msgSend(v23, "objectAtIndexedSubscript:", v10 - 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "segmentRange");
          v19 = v18 - v15 + v17;

          v20 = [ICSearchQuerySegment alloc];
          objc_msgSend(v5, "substringWithRange:", v15, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v20, "initWithSegmentString:range:type:isExpandable:", v21, v15, v19, 0, 0);

          objc_msgSend(v23, "removeObjectsInRange:", v6, v10 - v6);
          objc_msgSend(v23, "insertObject:atIndex:", v22, v6);

          v9 = v23;
        }
        ++v6;
      }
    }
    while (v6 < objc_msgSend(v9, "count"));
  }

}

+ (id)_expandedTokensForSearchQuerySegmentArray:(id)a3 searchString:(id)a4 language:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v36 = a4;
  v8 = a5;
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredLocalizations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "canonicalLocaleIdentifierFromString:", v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = +[ICRankingQueriesDefinition maxCountOfVariantsForCountOfTokens:](ICRankingQueriesDefinition, "maxCountOfVariantsForCountOfTokens:", objc_msgSend(v7, "count"));
  v37 = 0u;
  v38 = 0u;
  if (v14 <= 1)
    v15 = 1;
  else
    v15 = v14;
  v39 = 0uLL;
  v40 = 0uLL;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    v20 = 0x1E0C99000uLL;
    do
    {
      v21 = 0;
      v34 = v18;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v21);
        if (objc_msgSend(v22, "isExpandable"))
        {
          if (v8)
          {
            v23 = objc_msgSend(v22, "segmentRange");
            objc_msgSend(a1, "spellCheckerGuessesForSearchString:inRange:language:", v36, v23, v24, v8);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v22, "segmentString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v27;
            objc_msgSend(*(id *)(v20 + 3360), "arrayWithObjects:count:", &v42, 1);
            v28 = v16;
            v29 = v20;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(v30, "mutableCopy");

            v20 = v29;
            v16 = v28;
            v8 = 0;
            v18 = v34;

          }
          if (objc_msgSend(v25, "count") > v15)
            objc_msgSend(v25, "removeObjectsInRange:", v15, objc_msgSend(v25, "count") - v15);
          v26 = objc_msgSend(v25, "copy");
        }
        else
        {
          objc_msgSend(v22, "segmentString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v25;
          objc_msgSend(*(id *)(v20 + 3360), "arrayWithObjects:count:", &v41, 1);
          v26 = objc_claimAutoreleasedReturnValue();
        }
        v31 = (void *)v26;
        objc_msgSend(v13, "addObject:", v26);

        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v18);
  }

  v32 = (void *)objc_msgSend(v13, "copy");
  return v32;
}

+ (id)spellCheckerGuessesForSearchString:(id)a3 inRange:(_NSRange)a4 language:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  unint64_t v21;
  char v22;
  double v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  unint64_t v36;
  char v38;
  id v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  _BOOL4 v43;
  void *v45;
  id obj;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  _QWORD v53[2];

  length = a4.length;
  location = a4.location;
  v53[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v47 = a5;
  v45 = v9;
  objc_msgSend(v9, "substringWithRange:", location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v10, 0);
  objc_msgSend(a1, "spellChecker");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  obj = v12;
  if (objc_msgSend(v12, "spellServer:findMisspelledWordInString:language:wordCount:countOnly:", 0, v10, v47, 0, 0) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v14 = (id *)getPRAppIdentifierKeySymbolLoc_ptr;
    v51 = getPRAppIdentifierKeySymbolLoc_ptr;
    if (!getPRAppIdentifierKeySymbolLoc_ptr)
    {
      v15 = (void *)ProofReaderLibrary();
      v14 = (id *)dlsym(v15, "PRAppIdentifierKey");
      v49[3] = (uint64_t)v14;
      getPRAppIdentifierKeySymbolLoc_ptr = (uint64_t)v14;
    }
    _Block_object_dispose(&v48, 8);
    if (!v14)
    {
      dlerror();
      abort_report_np();
LABEL_41:
      __break(1u);
    }
    v16 = *v14;
    v52 = v16;
    ICNotesAppBundleIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spellServer:suggestContextualGuessDictionariesForWordRange:inString:language:options:", 0, location, length, v45, v47, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v12);

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLForKey:", *MEMORY[0x1E0D64468]);

    if (objc_msgSend(v13, "count"))
    {
      v21 = 0;
      v22 = v20 ^ 1;
      v23 = 2.22507386e-308;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0;
          v49 = &v48;
          v50 = 0x2020000000;
          v27 = (_QWORD *)getPRGuessKeySymbolLoc_ptr;
          v51 = getPRGuessKeySymbolLoc_ptr;
          if (!getPRGuessKeySymbolLoc_ptr)
          {
            v28 = (void *)ProofReaderLibrary();
            v27 = dlsym(v28, "PRGuessKey");
            v49[3] = (uint64_t)v27;
            getPRGuessKeySymbolLoc_ptr = (uint64_t)v27;
          }
          _Block_object_dispose(&v48, 8);
          if (!v27)
            goto LABEL_38;
          objc_msgSend(v26, "objectForKeyedSubscript:", *v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectAtIndexedSubscript:", v21);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0;
          v49 = &v48;
          v50 = 0x2020000000;
          v31 = (_QWORD *)getPRScoreKeySymbolLoc_ptr;
          v51 = getPRScoreKeySymbolLoc_ptr;
          if (!getPRScoreKeySymbolLoc_ptr)
          {
            v32 = (void *)ProofReaderLibrary();
            v31 = dlsym(v32, "PRScoreKey");
            v49[3] = (uint64_t)v31;
            getPRScoreKeySymbolLoc_ptr = (uint64_t)v31;
          }
          _Block_object_dispose(&v48, 8);
          if (!v31)
          {
LABEL_38:
            __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
            goto LABEL_41;
          }
          objc_msgSend(v30, "objectForKeyedSubscript:", *v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v34;

          if (!v21)
            v23 = v35;
          v36 = objc_msgSend(v11, "count");
          if (v35 + 30.0 < v23 || v36 > 0xF)
            v38 = v22;
          else
            v38 = 0;
          if ((v38 & 1) != 0)
          {

            break;
          }
          if ((objc_msgSend(v29, "isEqualToString:", v10, v35 + 30.0) & 1) == 0)
            objc_msgSend(v11, "ic_addNonNilObject:", v29);

        }
        ++v21;
      }
      while (v21 < objc_msgSend(v13, "count"));
    }
  }
  v39 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    v40 = 1;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "length");
      v43 = v42 < objc_msgSend(v10, "length");

      if (v43)
        objc_msgSend(v39, "addIndex:", v40);
      ++v40;
    }
    while (v40 < objc_msgSend(v11, "count"));
  }
  objc_msgSend(v11, "removeObjectsAtIndexes:", v39);

  return v11;
}

+ (NLTokenizer)tokenizer
{
  if (tokenizer_s_onceTokenForTokenizer != -1)
    dispatch_once(&tokenizer_s_onceTokenForTokenizer, &__block_literal_global_53_0);
  return (NLTokenizer *)(id)tokenizer_s_tokenizer;
}

void __35__ICSearchQueryTokenizer_tokenizer__block_invoke()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getNLTokenizerClass_softClass;
  v8 = getNLTokenizerClass_softClass;
  if (!getNLTokenizerClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getNLTokenizerClass_block_invoke;
    v4[3] = &unk_1E76C77A8;
    v4[4] = &v5;
    __getNLTokenizerClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_msgSend([v1 alloc], "initWithUnit:", 0);
  v3 = (void *)tokenizer_s_tokenizer;
  tokenizer_s_tokenizer = v2;

}

+ (id)spellChecker
{
  if (spellChecker_s_onceTokenForSpellChecker != -1)
    dispatch_once(&spellChecker_s_onceTokenForSpellChecker, &__block_literal_global_54);
  return (id)spellChecker_s_spellChecker;
}

void __38__ICSearchQueryTokenizer_spellChecker__block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getAppleSpellClass_softClass;
  v8 = getAppleSpellClass_softClass;
  if (!getAppleSpellClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getAppleSpellClass_block_invoke;
    v4[3] = &unk_1E76C77A8;
    v4[4] = &v5;
    __getAppleSpellClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)spellChecker_s_spellChecker;
  spellChecker_s_spellChecker = (uint64_t)v2;

}

+ (id)connectorCharacterSet
{
  if (connectorCharacterSet_s_onceTokenForConnectorCharacterSet != -1)
    dispatch_once(&connectorCharacterSet_s_onceTokenForConnectorCharacterSet, &__block_literal_global_55);
  return (id)connectorCharacterSet_s_connectorCharacterSet;
}

void __47__ICSearchQueryTokenizer_connectorCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)connectorCharacterSet_s_connectorCharacterSet;
  connectorCharacterSet_s_connectorCharacterSet = v0;

}

+ (id)nonConnectorCharacterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ICSearchQueryTokenizer_nonConnectorCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nonConnectorCharacterSet_s_onceTokenForNonConnectorCharacterSet != -1)
    dispatch_once(&nonConnectorCharacterSet_s_onceTokenForNonConnectorCharacterSet, block);
  return (id)nonConnectorCharacterSet_s_nonConnectorCharacterSet;
}

void __50__ICSearchQueryTokenizer_nonConnectorCharacterSet__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "connectorCharacterSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)nonConnectorCharacterSet_s_nonConnectorCharacterSet;
  nonConnectorCharacterSet_s_nonConnectorCharacterSet = v1;

}

@end
