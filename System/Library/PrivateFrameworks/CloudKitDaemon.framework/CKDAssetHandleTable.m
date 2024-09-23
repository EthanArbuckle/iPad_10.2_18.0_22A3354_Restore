@implementation CKDAssetHandleTable

+ (id)dbProperties
{
  return &unk_1E78AFAF0;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)assetHandleExistsInDatabase:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("ITEMID");
  v11[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend_countOfEntriesMatching_label_error_predicate_(self, v8, (uint64_t)v7, off_1E7835070, 0, &unk_1E7835088) != 0;
  return (char)self;
}

- (id)assetHandleWithUUID:(id)a3
{
  id v4;
  CKDAssetHandle *v5;
  const char *v6;
  const char *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(CKDAssetHandle);
  objc_msgSend_setUUID_(v5, v6, (uint64_t)v4);

  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v7, 0, v5, &unk_1E78AF2A0, off_1E78350A8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    v5 = 0;
  }

  return v5;
}

- (id)assetHandleWithItemID:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, v7, (uint64_t)v6, 0, off_1E78350C0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)saveOrInsert:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_itemID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend_updateUsingObject_(self, v8, (uint64_t)v4);
  else
    objc_msgSend_insertObject_(self, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)saveStatus:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_updateProperties_usingObject_label_, &unk_1E78AF2B8);
}

- (id)saveChunkCount:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_updateProperties_usingObject_label_, &unk_1E78AF2D0);
}

- (id)saveLastUsedTime:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_updateProperties_usingObject_label_, &unk_1E78AF2E8);
}

- (id)oldestLastUsedTime
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_minimumValueOfProperty_label_error_, CFSTR("lastUsedTime"));
}

- (id)saveStatusAndChunkCount:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_updateProperties_usingObject_label_, &unk_1E78AF300);
}

- (id)selectProperties:(id)a3 inAssetHandlesWithStatus:(int64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v19 = CFSTR("STATUS");
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEB6EFE8;
  v17[3] = &unk_1E782E6A8;
  v18 = v8;
  v13 = v8;
  objc_msgSend_entriesWithValues_label_error_setupBlock_(self, v14, (uint64_t)v12, off_1E7835150, a5, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)interruptedAssetWithSignature:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  CKDAssetHandleTable *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1BE9BB0C8;
  v21 = sub_1BE9BAE18;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEB6F160;
  v13[3] = &unk_1E7835340;
  v7 = v6;
  v14 = v7;
  v15 = self;
  v16 = &v17;
  objc_msgSend_performInTransaction_(self, v8, (uint64_t)v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

@end
