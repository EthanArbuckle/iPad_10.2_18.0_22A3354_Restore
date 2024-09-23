@implementation IMDDeletePartsHelper

+ (id)_makeDeletePartsDictFor:(id)a3 withIndexes:(id)a4 withIndexToRangeMap:(id)a5 deleteDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[4];
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1D153EB00;
  v27[3] = &unk_1E922CCF8;
  v29 = &v30;
  v15 = v13;
  v28 = v15;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v27);
  v22 = v14;
  v23 = 3221225472;
  v24 = sub_1D153EB7C;
  v25 = &unk_1E922CD20;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v26 = v16;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v22);
  v37[0] = CFSTR("messageGuid");
  v37[1] = CFSTR("indexes");
  v38[0] = v9;
  v38[1] = v15;
  v38[2] = v16;
  v37[2] = CFSTR("indexToRange");
  v37[3] = CFSTR("deleteSubject");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v31 + 24), v22, v23, v24, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v18;
  v35[0] = CFSTR("parts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v19;
  v36[1] = MEMORY[0x1E0C9AAA0];
  v35[1] = CFSTR("isPermanentDelete");
  v35[2] = CFSTR("recoverableDeleteDate");
  v36[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v30, 8);
  return v20;
}

+ (unint64_t)_unsignedIntegerFromString:(id)a3
{
  void *v3;
  unint64_t v4;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "scanUnsignedLongLong:", &v6);
  v4 = v6;

  return v4;
}

+ (BOOL)_convertDeletedPartsDict:(id)a3 toIndexSet:(id *)a4 toMap:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  id v21;
  BOOL v22;
  id *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "objectForKey:", CFSTR("indexes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("indexToRange"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  v13 = !v12;
  v36 = v13;
  if (v12)
  {
    v22 = 0;
  }
  else
  {
    if (a4)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v24 = a5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v15 = v9;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v30 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(v14, "addIndex:", objc_msgSend(a1, "_unsignedIntegerFromString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v24));
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v16);
      }

      a5 = v24;
      v19 = objc_retainAutorelease(v14);
      *a4 = v19;

    }
    if (a5)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_1D153F034;
      v25[3] = &unk_1E922CD48;
      v27 = &v33;
      v28 = a1;
      v21 = v20;
      v26 = v21;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v25);
      if (*((_BYTE *)v34 + 24))
        *a5 = objc_retainAutorelease(v21);

    }
    v22 = *((_BYTE *)v34 + 24) != 0;
  }
  _Block_object_dispose(&v33, 8);

  return v22;
}

@end
