@implementation CKSQLiteGenericTableGroup

+ (id)groupEntryInDatabase:(id)a3 withGroupName:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___CKSQLiteGenericTableGroup;
  objc_msgSendSuper2(&v17, sel_groupEntryInDatabase_withGroupName_error_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    NSStringFromClass((Class)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreatingClass_(v6, v8, (uint64_t)v7, v9);

    objc_msgSend_date(MEMORY[0x1E0C99D68], v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastUsed_(v6, v14, (uint64_t)v13, v15);

  }
  return v6;
}

+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKSQLiteGenericTableGroup;
  objc_msgSendSuper2(&v7, sel_tableGroupInDatabase_withName_options_error_, a3, a4, a5 | 0x50000, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createTables:(id *)a3
{
  uint64_t v3;
  id *v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend_tocTable(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_groupID(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend_validationTocEntriesWithGroupID_error_(v6, v12, (uint64_t)v11, (uint64_t)&v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v32;

  if (!v14)
  {
    v27 = v4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v13;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v28, (uint64_t)v33, 16);
    if (v17)
    {
      v20 = v17;
      v21 = *(_QWORD *)v29;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v15);
          objc_msgSend_genericTableForTOCEntry_(CKSQLiteGenericTable, v18, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v22), v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v7, v24, (uint64_t)v23, v25);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v28, (uint64_t)v33, 16);
      }
      while (v20);
    }

    v4 = v27;
  }
  if (v4 && v14)
    *v4 = objc_retainAutorelease(v14);

  return v7;
}

- (int64_t)validateTableMatchesTOCEntry:(id)a3
{
  return 1;
}

@end
