@implementation CDPInteractionStoreDataHarvester

void __78___CDPInteractionStoreDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)a1[4];
  v7 = (void *)v6[2];
  objc_msgSend(v6, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v8, v9, +[_CDPSimpleModel maxNumberOfEmailsSupported](_CDPSimpleModel, "maxNumberOfEmailsSupported"), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = a1[4];
  v12 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = v10;

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __78___CDPInteractionStoreDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke_2;
  v29[3] = &unk_1E26E6A60;
  v29[4] = a1[4];
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x193FEEAF4](v29);
  v14 = objc_msgSend(*(id *)(a1[4] + 32), "count");
  v15 = a1[7];
  if (v14 <= v15)
    LODWORD(v15) = objc_msgSend(*(id *)(a1[4] + 32), "count");
  if ((int)v15 >= 1)
  {
    v16 = v15;
    do
    {
      objc_msgSend(*(id *)(a1[4] + 32), "objectAtIndexedSubscript:", (v16 - 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sender");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v13)[2](v13, v18);

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v17, "recipients", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v26;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v19);
            v13[2](v13, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v23++));
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v21);
      }

      (*(void (**)(void))(a1[5] + 16))();
    }
    while (v16-- > 1);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __78___CDPInteractionStoreDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v9, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "mergeWithContact:", v9);
    }
    else
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(v9, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

    }
  }

}

@end
