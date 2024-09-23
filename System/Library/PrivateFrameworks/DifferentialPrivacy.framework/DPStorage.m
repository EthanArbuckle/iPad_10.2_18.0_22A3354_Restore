@implementation DPStorage

uint64_t __31___DPStorage_removeBadObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

void __29___DPStorage_errorStringFor___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E9687300;
  v2[1] = &unk_1E9687318;
  v3[0] = CFSTR("Not an error");
  v3[1] = CFSTR("Unknown error");
  v2[2] = &unk_1E9687330;
  v2[3] = &unk_1E9687348;
  v3[2] = CFSTR("Invalid parameter");
  v3[3] = CFSTR("Empty Array");
  v2[4] = &unk_1E9687360;
  v2[5] = &unk_1E9687378;
  v3[4] = CFSTR("Empty Array after removing bad objects");
  v3[5] = CFSTR("Permission denied");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)errorStringFor__errorsDict;
  errorStringFor__errorsDict = v0;

}

void __47___DPStorage_handleEmptyArrayError_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "errorStringFor:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E0CB35C8];
  +[_DPStrings errorDomain](_DPStrings, "errorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v8);

}

void __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "errorStringFor:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  +[_DPStrings errorDomain](_DPStrings, "errorDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id *v7;
  id *v8;
  NSObject *v9;
  _QWORD v10[4];
  uint64_t v11;
  id v12;
  _QWORD v13[2];
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "createFetchRequestFor:entityName:predicate:fetchLimit:fetchOffset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludesSubentities:", 0);
  objc_msgSend(v2, "setIncludesPropertyValues:", 0);
  objc_msgSend(v2, "setResultType:", 4);
  v3 = *(void **)(a1 + 40);
  v17 = 0;
  v4 = objc_msgSend(v3, "countForFetchRequest:error:", v2, &v17);
  v5 = v17;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_66;
    block[3] = &unk_1E95D9750;
    v16 = *(id *)(a1 + 72);
    v15 = v5;
    dispatch_async(v6, block);

    objc_msgSend(*(id *)(a1 + 40), "reset");
    v7 = &v16;
    v8 = &v15;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "reset");
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_2_67;
    v10[3] = &unk_1E95D9778;
    v13[0] = *(id *)(a1 + 72);
    v13[1] = v4;
    v11 = 0;
    v12 = *(id *)(a1 + 64);
    dispatch_async(v9, v10);

    v7 = (id *)v13;
    v8 = (id *)&v11;
  }

}

uint64_t __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_2_67(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D8256B78]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "errorStringFor:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  +[_DPStrings errorDomain](_DPStrings, "errorDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  uint8_t v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "createFetchRequestFor:entityName:predicate:fetchLimit:fetchOffset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludesSubentities:", 0);
  objc_msgSend(v2, "setPropertiesToFetch:", &unk_1E9748CF0);
  objc_msgSend(v2, "setPropertiesToGroupBy:", &unk_1E9748D08);
  objc_msgSend(v2, "setResultType:", 2);
  v3 = *(void **)(a1 + 40);
  v27 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v27;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_73;
    block[3] = &unk_1E95D9750;
    v26 = *(id *)(a1 + 72);
    v25 = v4;
    dispatch_async(v5, block);

    objc_msgSend(*(id *)(a1 + 40), "reset");
    v6 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v14;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("key"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v7, "addObject:", v12);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 40), "reset");
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_2_75;
    v15[3] = &unk_1E95D97C8;
    v19 = *(id *)(a1 + 72);
    v16 = v7;
    v17 = 0;
    v18 = *(id *)(a1 + 64);
    v6 = v7;
    dispatch_async(v13, v15);

  }
}

uint64_t __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

void __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_2_75(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D8256B78]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "errorStringFor:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  +[_DPStrings errorDomain](_DPStrings, "errorDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id obj;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  id v48;
  _BYTE v49[160];
  uint64_t v50;

  v1 = a1;
  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "createFetchRequestFor:entityName:predicate:fetchLimit:fetchOffset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 104))
  {
    v2 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v2, "setResultType:", 1);
    if (*(_QWORD *)(v1 + 80) <= 0x32uLL)
      v3 = 50;
    else
      v3 = *(_QWORD *)(v1 + 80);
    objc_msgSend(v2, "setFetchLimit:", v3);
    v4 = *(void **)(v1 + 40);
    v48 = 0;
    v28 = v2;
    objc_msgSend(v4, "executeFetchRequest:error:", v2, &v48);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = v48;
    if (v5)
    {
      objc_msgSend(*(id *)(v1 + 32), "queue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_77;
      block[3] = &unk_1E95D9750;
      v7 = *(id *)(a1 + 72);
      v46 = v5;
      v47 = v7;
      v8 = v5;
      dispatch_async(v6, block);

      objc_msgSend(*(id *)(a1 + 40), "reset");
      goto LABEL_23;
    }
    objc_msgSend((id)objc_opt_class(), "shuffleOrderOfRecords:count:", obj, *(_QWORD *)(a1 + 80));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 80);
    if (v10 >= objc_msgSend(v9, "count"))
      v11 = objc_msgSend(v9, "count");
    else
      v11 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v9, "subarrayWithRange:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(self IN %@)"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPredicate:", v13);

    v1 = a1;
  }
  v14 = *(void **)(v1 + 40);
  v44 = 0;
  objc_msgSend(v14, "executeFetchRequest:error:", v29, &v44);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = v44;
  if (v28)
  {
    objc_msgSend(*(id *)(v1 + 32), "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_81;
    v41[3] = &unk_1E95D9750;
    v43 = *(id *)(a1 + 72);
    v28 = v28;
    v42 = v28;
    dispatch_async(v15, v41);

    objc_msgSend(*(id *)(a1 + 40), "reset");
    v8 = v43;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = obj;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1D8256B78]();
          objc_msgSend(*(id *)(a1 + 32), "converterFromEntity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "entity");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "createRecordFromManagedObject:", v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v16, "addObject:", v26);

          objc_autoreleasePoolPop(v21);
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)(a1 + 40), "reset");
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v27 = objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_2_82;
    v32[3] = &unk_1E95D97C8;
    v36 = *(id *)(a1 + 72);
    v33 = v16;
    v34 = 0;
    v35 = *(id *)(a1 + 64);
    v8 = v16;
    dispatch_async(v27, v32);

  }
LABEL_23:

}

uint64_t __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

uint64_t __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

void __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_2_82(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D8256B78]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __50___DPStorage_saveRecords_andFlush_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id obj;
  _QWORD block[4];
  id v29;
  BOOL v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v36;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v2, "setObject:forKey:", v12, v10);

        }
        objc_msgSend(v2, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v5);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v2, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v2, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "copy");

        objc_msgSend(*(id *)(a1 + 32), "converterFromClass");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "insertRecords:inManagedObjectContext:", v21, *(_QWORD *)(a1 + 40));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v21, "count");
        v16 += v25 - objc_msgSend(v24, "count");

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 40), "save:", 0);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50___DPStorage_saveRecords_andFlush_withCompletion___block_invoke_2;
    block[3] = &unk_1E95D9840;
    v29 = *(id *)(a1 + 48);
    v30 = v16 == 0;
    dispatch_async(v26, block);

  }
}

uint64_t __50___DPStorage_saveRecords_andFlush_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __43___DPStorage_updateRecords_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  BOOL v38;
  NSObject *v39;
  id obj;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD block[4];
  id v47;
  BOOL v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v43 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v58;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v58 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v2, "setObject:forKey:", v12, v10);

        }
        objc_msgSend(v2, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v5);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v2, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  v14 = 0;
  if (v44)
  {
    v41 = *(_QWORD *)v54;
    v42 = v2;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(obj);
        v45 = v14;
        v16 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
        objc_msgSend(v2, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "copy");

        v19 = (void *)MEMORY[0x1E0C9AA60];
        v20 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v21 = (void *)objc_msgSend(v19, "mutableCopy");
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v22 = v18;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v50;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v50 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
              objc_msgSend(v27, "objectId");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
                v29 = v21;
              else
                v29 = v20;
              objc_msgSend(v29, "addObject:", v27);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
          }
          while (v24);
        }

        v30 = (id *)v43;
        objc_msgSend(*(id *)(v43 + 40), "converterFromClass");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v16);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "insertRecords:inManagedObjectContext:", v20, *(_QWORD *)(v43 + 48));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v20, "count");
        v35 = objc_msgSend(v33, "count");
        objc_msgSend(v32, "updateRecords:inManagedObjectContext:", v21, *(_QWORD *)(v43 + 48));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = objc_msgSend(v21, "count");
        v14 = v34 + v45 - v35 + v37 - objc_msgSend(v36, "count");

        v2 = v42;
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v44);
  }
  else
  {
    v30 = (id *)v43;
  }

  objc_msgSend(v30[6], "save:", 0);
  if (v30[7])
  {
    v38 = v14 == 0;
    objc_msgSend(v30[5], "queue");
    v39 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43___DPStorage_updateRecords_withCompletion___block_invoke_2;
    block[3] = &unk_1E95D9840;
    v47 = v30[7];
    v48 = v38;
    dispatch_async(v39, block);

  }
}

uint64_t __43___DPStorage_updateRecords_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __43___DPStorage_deleteRecords_withCompletion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  objc_msgSend(a1[4], "valueForKey:", CFSTR("objectId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithObjectIDs:", v3);
  objc_msgSend(v4, "setResultType:", 2);
  objc_msgSend(a1[5], "executeRequest:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = objc_msgSend(v3, "count");
  objc_msgSend(a1[5], "reset");
  if (a1[7])
  {
    v9 = v7 == v8;
    objc_msgSend(a1[6], "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43___DPStorage_deleteRecords_withCompletion___block_invoke_2;
    v11[3] = &unk_1E95D9840;
    v12 = a1[7];
    v13 = v9;
    dispatch_async(v10, v11);

  }
}

uint64_t __43___DPStorage_deleteRecords_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __51___DPStorage_deleteAllRecordsByKey_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  char v11;

  +[_DPRecordQueryPredicates predicateForKey:](_DPRecordQueryPredicates, "predicateForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "createFetchRequestFor:entityName:predicate:fetchLimit:fetchOffset:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v3);
  objc_msgSend(v4, "setResultType:", 0);
  objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 48), "reset");
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51___DPStorage_deleteAllRecordsByKey_withCompletion___block_invoke_2;
    v9[3] = &unk_1E95D9840;
    v10 = *(id *)(a1 + 64);
    v11 = v7;
    dispatch_async(v8, v9);

  }
}

uint64_t __51___DPStorage_deleteAllRecordsByKey_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __19___DPStorage_flush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "save:", 0);
}

void __54___DPStorage_scheduleStorageCullingWithName_database___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  v5 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(*(id *)(a1 + 32), "coredataStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deleteVersionMismatchRecords:entities:limit:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  +[_DPLog framework](_DPLog, "framework");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = v7;
    _os_log_impl(&dword_1D3FAA000, v8, OS_LOG_TYPE_INFO, "Deleted %ld records with report version mismatch", (uint8_t *)&v11, 0xCu);
  }

  v9 = objc_msgSend(v6, "deleteSubmittedRecords:entities:limit:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  +[_DPLog framework](_DPLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = v9;
    _os_log_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_INFO, "Deleted %ld submitted records", (uint8_t *)&v11, 0xCu);
  }

  objc_autoreleasePoolPop(v5);
}

void __51___DPStorage_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  v5 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(*(id *)(a1 + 32), "coredataStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deleteOldObjectsToLimitTotalNumber:entities:limit:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  +[_DPLog framework](_DPLog, "framework");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = v7;
    _os_log_impl(&dword_1D3FAA000, v8, OS_LOG_TYPE_INFO, "Deleted %ld records to enforce total size limit on the database", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*(double *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "deleteObjectsOlderThanDate:entities:limit:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  +[_DPLog framework](_DPLog, "framework");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = v10;
    _os_log_impl(&dword_1D3FAA000, v11, OS_LOG_TYPE_INFO, "Deleted %ld old records", (uint8_t *)&v12, 0xCu);
  }

  objc_autoreleasePoolPop(v5);
}

@end
