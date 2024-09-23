@implementation ML3MigrationUpdateAllBestArtworkTokens

void __ML3MigrationUpdateAllBestArtworkTokens_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

}

void __ML3MigrationUpdateAllBestArtworkTokens_block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "stringForColumnIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (int)objc_msgSend(v7, "intForColumnIndex:", 1);
  if (objc_msgSend(v7, "intForColumnIndex:", 2))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_25;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
    if ((_DWORD)v10 != 300 && (_DWORD)v10 != 200)
      goto LABEL_25;
LABEL_20:
    *a4 = 1;
    goto LABEL_25;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v11 = 1;
  else
    v11 = (_DWORD)v10 == 0;
  if (!v11)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v25, "intValue");
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v24, "intValue");
    v16 = v12;
    v17 = v13;
    v18 = v17;
    if (v14 == 7 || v14 == 2)
    {
      v21 = v10 == 500;
LABEL_18:

      if (v21)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v9);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10;
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          goto LABEL_20;
      }
      goto LABEL_25;
    }
    if (!v14)
    {
      if (v10 == 400)
      {
        if ((unint64_t)(v15 - 1) <= 1)
        {
          v28 = 0;
          v29 = &v28;
          v30 = 0x2020000000;
          v31 = 0;
          v32 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "executeQuery:withParameters:", CFSTR("SELECT purchase_history_id FROM item_store WHERE item_pid = ?"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = ___ML3MigrationIsArtworkFetchable_block_invoke_2;
          v26[3] = &unk_1E5B65200;
          v26[4] = &v28;
          objc_msgSend(v23, "enumerateRowsWithBlock:", v26);
          v21 = v29[3] > 0;

          goto LABEL_23;
        }
      }
      else if (v10 == 200 && v15 == 1)
      {
        v28 = 0;
        v29 = &v28;
        v30 = 0x2020000000;
        v31 = 0;
        v33[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "executeQuery:withParameters:", CFSTR("SELECT store_saga_id FROM item_store WHERE item_pid = ?"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = ___ML3MigrationIsArtworkFetchable_block_invoke;
        v27[3] = &unk_1E5B65200;
        v27[4] = &v28;
        objc_msgSend(v20, "enumerateRowsWithBlock:", v27);
        v21 = v29[3] > 0;

LABEL_23:
        _Block_object_dispose(&v28, 8);
        goto LABEL_18;
      }
    }

  }
LABEL_25:

}

@end
