@implementation HKPreprocessingHandlerForUnderwaterDepth

void __HKPreprocessingHandlerForUnderwaterDepth_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB6A78];
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForSamplesWithStartDate:endDate:options:", v9, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsWithMetadataKey:", *MEMORY[0x1E0CB55A0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3528];
    v23[0] = v12;
    v23[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0CB6AF8]);
    v18 = *(_QWORD *)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __HKPreprocessingHandlerForUnderwaterDepth_block_invoke_2;
    v20[3] = &unk_1E9C410B8;
    v21 = v5;
    v22 = v6;
    v19 = (void *)objc_msgSend(v17, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v18, v16, 0, 0, v20);
    objc_msgSend(*(id *)(a1 + 40), "executeQuery:", v19);

  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v5);
  }

}

void __HKPreprocessingHandlerForUnderwaterDepth_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __HKPreprocessingHandlerForUnderwaterDepth_block_invoke_3;
  v8[3] = &unk_1E9C441B0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_map:", v8);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __HKPreprocessingHandlerForUnderwaterDepth_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  v19 = __Block_byref_object_dispose__16;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __HKPreprocessingHandlerForUnderwaterDepth_block_invoke_259;
  v12 = &unk_1E9C44188;
  v5 = v3;
  v13 = v5;
  v14 = &v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v9);
  objc_msgSend(v5, "setMetadata:", v16[5], v9, v10, v11, v12);
  v6 = v13;
  v7 = v5;

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __HKPreprocessingHandlerForUnderwaterDepth_block_invoke_259(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hk_isAfterDate:", v8))
  {

  }
  else
  {
    objc_msgSend(v6, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hk_isBeforeDate:", v10);

    if ((v11 & 1) == 0)
    {
      v15 = *MEMORY[0x1E0CB55A0];
      v16[0] = &unk_1E9CECAB8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      *a4 = 1;
    }
  }

}

@end
