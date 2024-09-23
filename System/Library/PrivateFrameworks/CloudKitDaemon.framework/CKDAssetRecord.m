@implementation CKDAssetRecord

- (CKDAssetRecord)initWithRecordType:(id)a3 recordID:(id)a4
{
  id v7;
  id v8;
  CKDAssetRecord *v9;
  CKDAssetRecord *v10;
  uint64_t v11;
  NSMutableDictionary *itemsByRecordKey;
  uint64_t v13;
  NSMutableDictionary *rereferencedItemsByRecordKey;
  uint64_t v15;
  NSMutableDictionary *sectionItemsByRecordKey;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDAssetRecord;
  v9 = -[CKDAssetRecord init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordType, a3);
    objc_storeStrong((id *)&v10->_recordID, a4);
    v11 = objc_opt_new();
    itemsByRecordKey = v10->_itemsByRecordKey;
    v10->_itemsByRecordKey = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    rereferencedItemsByRecordKey = v10->_rereferencedItemsByRecordKey;
    v10->_rereferencedItemsByRecordKey = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    sectionItemsByRecordKey = v10->_sectionItemsByRecordKey;
    v10->_sectionItemsByRecordKey = (NSMutableDictionary *)v15;

  }
  return v10;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  unsigned int v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("recordType=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v15, (uint64_t)CFSTR("recordID=%@"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

  v18 = (void *)MEMORY[0x1E0CB3940];
  v21 = objc_msgSend_sizeUpperBound(self, v19, v20);
  objc_msgSend_stringWithFormat_(v18, v22, (uint64_t)CFSTR("sizeUpperBound=%lu"), v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23);

  if (objc_msgSend_isPackageSectionRecord(self, v25, v26))
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend_isPackageSectionRecord(self, v27, v28))
      objc_msgSend_stringWithFormat_(v29, v30, (uint64_t)CFSTR("isPackageSectionRecord=%@"), CFSTR("YES"));
    else
      objc_msgSend_stringWithFormat_(v29, v30, (uint64_t)CFSTR("isPackageSectionRecord=%@"), CFSTR("NO"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v32, (uint64_t)v31);

  }
  objc_msgSend_componentsJoinedByString_(v3, v27, (uint64_t)CFSTR(", "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetRecord *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (void)addMMCSItem:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSNumber *sizeUpperBoundNumber;
  NSMutableDictionary *itemsByRecordKey;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  NSMutableDictionary *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  v22 = a3;
  objc_msgSend_package(v22, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend_isTemporary(v22, v6, v7) & 1) == 0)
    __assert_rtn("-[CKDAssetRecord addMMCSItem:]", "CKDAssetRecord.m", 53, "nil == item.package || item.isTemporary");

  sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  self->_sizeUpperBoundNumber = 0;

  itemsByRecordKey = self->_itemsByRecordKey;
  objc_msgSend_recordKey(v22, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(itemsByRecordKey, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v15 = (void *)objc_opt_new();
    v17 = self->_itemsByRecordKey;
    objc_msgSend_recordKey(v22, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v17, v21, (uint64_t)v15, v20);

  }
  objc_msgSend_addObject_(v15, v16, (uint64_t)v22);

}

- (void)addRereferencedMMCSPackageItem:(id)a3
{
  NSNumber *sizeUpperBoundNumber;
  NSMutableDictionary *rereferencedItemsByRecordKey;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  NSMutableDictionary *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  self->_sizeUpperBoundNumber = 0;

  rereferencedItemsByRecordKey = self->_rereferencedItemsByRecordKey;
  objc_msgSend_recordKey(v17, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(rereferencedItemsByRecordKey, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = (void *)objc_opt_new();
    v12 = self->_rereferencedItemsByRecordKey;
    objc_msgSend_recordKey(v17, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v12, v16, (uint64_t)v10, v15);

  }
  objc_msgSend_addObject_(v10, v11, (uint64_t)v17);

}

- (void)addMMCSSectionItem:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  NSNumber *sizeUpperBoundNumber;
  NSMutableDictionary *sectionItemsByRecordKey;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSMutableDictionary *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a3;
  objc_msgSend_package(v20, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    __assert_rtn("-[CKDAssetRecord addMMCSSectionItem:]", "CKDAssetRecord.m", 76, "nil != item.package");

  sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  self->_sizeUpperBoundNumber = 0;

  sectionItemsByRecordKey = self->_sectionItemsByRecordKey;
  objc_msgSend_recordKey(v20, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(sectionItemsByRecordKey, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = (void *)objc_opt_new();
    v15 = self->_sectionItemsByRecordKey;
    objc_msgSend_recordKey(v20, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v15, v19, (uint64_t)v13, v18);

  }
  objc_msgSend_addObject_(v13, v14, (uint64_t)v20);

}

- (unsigned)sizeUpperBound
{
  uint64_t v2;
  NSNumber *sizeUpperBoundNumber;
  uint64_t v5;
  NSMutableDictionary *itemsByRecordKey;
  NSMutableDictionary *sectionItemsByRecordKey;
  const char *v8;
  const char *v9;
  NSNumber *v10;
  NSNumber *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  if (!sizeUpperBoundNumber)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v5 = MEMORY[0x1E0C809B0];
    itemsByRecordKey = self->_itemsByRecordKey;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1BEA0E9B4;
    v14[3] = &unk_1E782E900;
    v14[4] = &v15;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(itemsByRecordKey, a2, (uint64_t)v14);
    sectionItemsByRecordKey = self->_sectionItemsByRecordKey;
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = sub_1BEA0E9F4;
    v13[3] = &unk_1E782E900;
    v13[4] = &v15;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(sectionItemsByRecordKey, v8, (uint64_t)v13);
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v9, *((unsigned int *)v16 + 6));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v11 = self->_sizeUpperBoundNumber;
    self->_sizeUpperBoundNumber = v10;

    _Block_object_dispose(&v15, 8);
    sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  }
  return objc_msgSend_unsignedLongLongValue(sizeUpperBoundNumber, a2, v2);
}

- (unsigned)rerefSizeUpperBound
{
  uint64_t v2;
  NSNumber *rerefSizeUpperBoundNumber;
  NSMutableDictionary *rereferencedItemsByRecordKey;
  const char *v6;
  NSNumber *v7;
  NSNumber *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  rerefSizeUpperBoundNumber = self->_rerefSizeUpperBoundNumber;
  if (!rerefSizeUpperBoundNumber)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    rereferencedItemsByRecordKey = self->_rereferencedItemsByRecordKey;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1BEA0EB04;
    v10[3] = &unk_1E782E900;
    v10[4] = &v11;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(rereferencedItemsByRecordKey, a2, (uint64_t)v10);
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, *((unsigned int *)v12 + 6));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_rerefSizeUpperBoundNumber;
    self->_rerefSizeUpperBoundNumber = v7;

    _Block_object_dispose(&v11, 8);
    rerefSizeUpperBoundNumber = self->_rerefSizeUpperBoundNumber;
  }
  return objc_msgSend_unsignedLongLongValue(rerefSizeUpperBoundNumber, a2, v2);
}

- (NSArray)allMMCSItems
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend_allKeys(self->_itemsByRecordKey, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v4, v5, (uint64_t)&unk_1E782E940);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA0EBEC;
  v10[3] = &unk_1E782E968;
  v10[4] = self;
  objc_msgSend_CKFlatMap_(v6, v7, (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (id)allRereferenceMMCSPackageItems
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend_allKeys(self->_rereferencedItemsByRecordKey, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v4, v5, (uint64_t)&unk_1E782E988);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA0ECA4;
  v10[3] = &unk_1E782E968;
  v10[4] = self;
  objc_msgSend_CKFlatMap_(v6, v7, (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)allMMCSSectionItems
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend_allKeys(self->_sectionItemsByRecordKey, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v4, v5, (uint64_t)&unk_1E782E9A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA0ED5C;
  v10[3] = &unk_1E782E968;
  v10[4] = self;
  objc_msgSend_CKFlatMap_(v6, v7, (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (id)allRecordKeys
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v3 = (void *)objc_opt_new();
  objc_msgSend_allKeys(self->_itemsByRecordKey, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend_addObjectsFromArray_(v3, v6, (uint64_t)v8);
  objc_msgSend_allKeys(self->_sectionItemsByRecordKey, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend_addObjectsFromArray_(v3, v10, (uint64_t)v9);
  objc_msgSend_allKeys(self->_rereferencedItemsByRecordKey, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend_addObjectsFromArray_(v3, v13, (uint64_t)v12);
  objc_msgSend_allObjects(v3, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_mutableCopy(v15, v16, v17);

  v20 = (id)objc_msgSend_sortedArrayUsingComparator_(v18, v19, (uint64_t)&unk_1E782E9C8);
  return v18;
}

- (id)allMMCSAndSectionItems
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend_allRecordKeys(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEA0EEC8;
  v8[3] = &unk_1E782E968;
  v8[4] = self;
  objc_msgSend_CKFlatMap_(v4, v5, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allRegularAndSectionAndRereferenceItemsWithRecordKey:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_objectForKeyedSubscript_(self->_itemsByRecordKey, v6, (uint64_t)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend_addObjectsFromArray_(v5, v7, (uint64_t)v8);
  objc_msgSend_objectForKeyedSubscript_(self->_sectionItemsByRecordKey, v7, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend_addObjectsFromArray_(v5, v10, (uint64_t)v9);
  objc_msgSend_objectForKeyedSubscript_(self->_rereferencedItemsByRecordKey, v10, (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend_addObjectsFromArray_(v5, v12, (uint64_t)v11);

  return v5;
}

- (id)allRegularAndSectionAndRereferenceItems
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend_allRecordKeys(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEA0F0A4;
  v8[3] = &unk_1E782E968;
  v8[4] = self;
  objc_msgSend_CKFlatMap_(v4, v5, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)firstMMCSItemError
{
  NSMutableDictionary *itemsByRecordKey;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1BE9BAEF8;
  v10 = sub_1BE9BAD30;
  v11 = 0;
  itemsByRecordKey = self->_itemsByRecordKey;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEA0F26C;
  v5[3] = &unk_1E782E900;
  v5[4] = &v6;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(itemsByRecordKey, a2, (uint64_t)v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)firstMMCSSectionItemError
{
  NSMutableDictionary *sectionItemsByRecordKey;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1BE9BAEF8;
  v10 = sub_1BE9BAD30;
  v11 = 0;
  sectionItemsByRecordKey = self->_sectionItemsByRecordKey;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEA0F410;
  v5[3] = &unk_1E782E900;
  v5[4] = &v6;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(sectionItemsByRecordKey, a2, (uint64_t)v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isPackageSectionRecord
{
  uint64_t v2;

  return objc_msgSend_count(self->_sectionItemsByRecordKey, a2, v2) != 0;
}

- (BOOL)isAssetRecord
{
  uint64_t v2;

  return objc_msgSend_count(self->_itemsByRecordKey, a2, v2) != 0;
}

- (BOOL)isEmpty
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_count(self->_sectionItemsByRecordKey, a2, v2);
  v7 = objc_msgSend_count(self->_itemsByRecordKey, v5, v6) + v4;
  return v7 + objc_msgSend_count(self->_rereferencedItemsByRecordKey, v8, v9) == 0;
}

- (BOOL)isEmptyOfRereferencesAssets
{
  uint64_t v2;

  return objc_msgSend_count(self->_rereferencedItemsByRecordKey, a2, v2) == 0;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSMutableDictionary)itemsByRecordKey
{
  return self->_itemsByRecordKey;
}

- (void)setItemsByRecordKey:(id)a3
{
  objc_storeStrong((id *)&self->_itemsByRecordKey, a3);
}

- (NSMutableDictionary)sectionItemsByRecordKey
{
  return self->_sectionItemsByRecordKey;
}

- (void)setSectionItemsByRecordKey:(id)a3
{
  objc_storeStrong((id *)&self->_sectionItemsByRecordKey, a3);
}

- (NSMutableDictionary)rereferencedItemsByRecordKey
{
  return self->_rereferencedItemsByRecordKey;
}

- (void)setRereferencedItemsByRecordKey:(id)a3
{
  objc_storeStrong((id *)&self->_rereferencedItemsByRecordKey, a3);
}

- (NSNumber)sizeUpperBoundNumber
{
  return self->_sizeUpperBoundNumber;
}

- (void)setSizeUpperBoundNumber:(id)a3
{
  objc_storeStrong((id *)&self->_sizeUpperBoundNumber, a3);
}

- (NSNumber)rerefSizeUpperBoundNumber
{
  return self->_rerefSizeUpperBoundNumber;
}

- (void)setRerefSizeUpperBoundNumber:(id)a3
{
  objc_storeStrong((id *)&self->_rerefSizeUpperBoundNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rerefSizeUpperBoundNumber, 0);
  objc_storeStrong((id *)&self->_sizeUpperBoundNumber, 0);
  objc_storeStrong((id *)&self->_rereferencedItemsByRecordKey, 0);
  objc_storeStrong((id *)&self->_sectionItemsByRecordKey, 0);
  objc_storeStrong((id *)&self->_itemsByRecordKey, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end
