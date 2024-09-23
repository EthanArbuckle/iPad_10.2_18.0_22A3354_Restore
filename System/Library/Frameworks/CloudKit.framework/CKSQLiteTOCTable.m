@implementation CKSQLiteTOCTable

+ (id)dbTableName
{
  return CFSTR("TOC");
}

+ (id)dbProperties
{
  _QWORD v3[7];
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("logicalTableName");
  v3[1] = CKSQLiteTOCTableEntryDbTablePropertyName;
  v4[0] = &unk_1E1FC43E8;
  v4[1] = &unk_1E1FC4400;
  v3[2] = CKSQLiteTOCTableEntryGroupIDPropertyName;
  v3[3] = CKSQLiteTOCTableEntrySchemaPropertyName;
  v4[2] = &unk_1E1FC4418;
  v4[3] = &unk_1E1FC43E8;
  v3[4] = CKSQLiteTOCTableEntryDbVersionPropertyName;
  v3[5] = CKSQLiteTOCTableEntryCreatingClassName;
  v4[4] = &unk_1E1FC4430;
  v4[5] = &unk_1E1FC43E8;
  v3[6] = CKSQLiteTOCTableEntryPropertyDataName;
  v4[6] = &unk_1E1FC4448;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v4, (uint64_t)v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)_tocEntriesWithGroupID:(id)a3 error:(id *)a4 label:(id *)a5 properties:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t *v25;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v33 = CFSTR("ID");
  v34[0] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v34, (uint64_t)&v33, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_18A6D241C;
  v31 = sub_18A6D242C;
  v32 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_18A6D2434;
  v22[3] = &unk_1E1F605F8;
  v22[4] = self;
  v14 = v13;
  v23 = v14;
  v26 = a5;
  v15 = v11;
  v24 = v15;
  v25 = &v27;
  objc_msgSend_performInTransaction_(self, v16, (uint64_t)v22, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a4 && v18)
    *a4 = objc_retainAutorelease(v18);
  v20 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v20;
}

- (id)tocEntriesWithGroupID:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("logicalTableName");
  v13[1] = CKSQLiteTOCTableEntryDbTablePropertyName;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend_arrayWithObjects_count_(v6, v8, (uint64_t)v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__tocEntriesWithGroupID_error_label_properties_(self, v10, (uint64_t)v7, (uint64_t)a4, off_1E1F60618, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)validationTocEntriesWithGroupID:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend__tocEntriesWithGroupID_error_label_properties_(self, a2, (uint64_t)a3, (uint64_t)a4, off_1E1F60630, 0);
}

- (id)tocEntryWithGroupID:(id)a3 logicalTableName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v28[0] = CFSTR("ID");
  v28[1] = CFSTR("NAME");
  v29[0] = v8;
  v29[1] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v29, (uint64_t)v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_18A6D241C;
  v26 = sub_18A6D242C;
  v27 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18A6D2804;
  v19[3] = &unk_1E1F60688;
  v19[4] = self;
  v12 = v11;
  v20 = v12;
  v21 = &v22;
  objc_msgSend_performInTransaction_(self, v13, (uint64_t)v19, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5 && v15)
    *a5 = objc_retainAutorelease(v15);
  v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (BOOL)tableExists:(id)a3 error:(id *)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, MEMORY[0x1E0C9AA60], off_1E1F606A8, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

@end
