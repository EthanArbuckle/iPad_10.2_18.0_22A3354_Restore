@implementation GEOAggregateProgress

void __32___GEOAggregateProgress__update__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char *v4;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;

  v54 = a2;
  if (!a3
    || (objc_msgSend(v54, "kind"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40),
        v8,
        v10 = v54,
        v8 == v9))
  {
    objc_msgSend(v54, "kind");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[4] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v10 = v54;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  objc_msgSend(v10, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB30F8]);

  v16 = v54;
  if (v15)
  {
    if (a3
      && (objc_msgSend(v54, "fileOperationKind"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)),
          v17,
          v19 = v54,
          (v18 & 1) == 0))
    {
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    }
    else
    {
      objc_msgSend(v54, "fileOperationKind");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1[6] + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      v19 = v54;
    }
    objc_msgSend(v19, "fileTotalCount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 && ((v24 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), v23, !a3) || v24))
    {
      v27 = (void *)MEMORY[0x1E0CB37E8];
      v4 = (char *)objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "longLongValue");
      objc_msgSend(v54, "fileTotalCount");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "numberWithLongLong:", &v4[objc_msgSend(v26, "longLongValue")]);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1[8] + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

    }
    else
    {
      v25 = *(_QWORD *)(a1[8] + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = 0;
    }

    objc_msgSend(v54, "fileCompletedCount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 && ((v32 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), v31, !a3) || v32))
    {
      v35 = (void *)MEMORY[0x1E0CB37E8];
      v36 = objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "longLongValue");
      objc_msgSend(v54, "fileCompletedCount");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "numberWithLongLong:", objc_msgSend(v34, "longLongValue") + v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(a1[9] + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = v37;

    }
    else
    {
      v33 = *(_QWORD *)(a1[9] + 8);
      v34 = *(void **)(v33 + 40);
      *(_QWORD *)(v33 + 40) = 0;
    }

    v40 = (void *)MEMORY[0x1E0CB37E8];
    v41 = objc_msgSend(*(id *)(*(_QWORD *)(a1[10] + 8) + 40), "longLongValue");
    objc_msgSend(v54, "byteTotalCount");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_msgSend(v54, "byteTotalCount");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v4, "longLongValue");
    }
    else
    {
      v43 = objc_msgSend(v54, "totalUnitCount");
    }
    objc_msgSend(v40, "numberWithLongLong:", v43 + v41);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = *(_QWORD *)(a1[10] + 8);
    v46 = *(void **)(v45 + 40);
    *(_QWORD *)(v45 + 40) = v44;

    if (v42)
    v47 = (void *)MEMORY[0x1E0CB37E8];
    v48 = objc_msgSend(*(id *)(*(_QWORD *)(a1[11] + 8) + 40), "longLongValue");
    objc_msgSend(v54, "byteCompletedCount");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v54, "byteCompletedCount");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v4, "longLongValue");
    }
    else
    {
      v50 = objc_msgSend(v54, "completedUnitCount");
    }
    objc_msgSend(v47, "numberWithLongLong:", v50 + v48);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = *(_QWORD *)(a1[11] + 8);
    v53 = *(void **)(v52 + 40);
    *(_QWORD *)(v52 + 40) = v51;

    if (v49)
    v16 = v54;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) ^ 1;

}

@end
