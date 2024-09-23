@implementation ML3MigrationRemoveLocationsForItemsMissingAssets

void __ML3MigrationRemoveLocationsForItemsMissingAssets_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
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
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  id v26;

  v26 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1AF43CC0C]();
  v7 = objc_msgSend(v26, "int64ForColumnIndex:", 0);
  objc_msgSend(v26, "stringForColumnIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringForColumnIndex:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "length")
      || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11) & 1) != 0
      || !objc_msgSend(v13, "length")
      || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13) & 1) != 0)
    {
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(*(id *)(a1 + 48), "contentsOfDirectoryAtPath:error:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        if (!v16)
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v19 = *(void **)(v18 + 40);
          *(_QWORD *)(v18 + 40) = v17;

          v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        }
        objc_msgSend(v16, "setObject:forKey:", v15, v14);
      }
    }
    v25 = objc_msgSend(v15, "containsObject:", v9);

    if ((v25 & 1) == 0)
    {
LABEL_12:
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!v20)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

        v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v7);
      objc_msgSend(v20, "addObject:", v24);

    }
  }

  objc_autoreleasePoolPop(v6);
}

@end
