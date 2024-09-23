@implementation CKDistributedTimestampSparseVector

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 1);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedTimestampSparseVector)init
{
  CKDistributedTimestampSparseVector *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDistributedTimestampSparseVector;
  v2 = -[CKDistributedTimestampSparseVector init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend__setBackingState_(v2, v4, (uint64_t)v3, v5);

  }
  return v2;
}

- (CKDistributedTimestampSparseVector)initWithCoder:(id)a3
{
  id v4;
  CKDistributedTimestampSparseVector *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDistributedTimestampSparseVector;
  v5 = -[CKDistributedTimestampSparseVector init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v12, v7, v13, v8, v9, v10, v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_clockValues);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__setBackingState_(v5, v18, (uint64_t)v17, v19);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  CKDistributedTimestampSparseVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;

  v12 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_clockValues(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clockValues);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v12, v11, (uint64_t)v9, (uint64_t)v10);

  objc_sync_exit(v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_setBackingState:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_CKDeepCopy(a3, a2, (uint64_t)a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___setBackingStateNoCopy_(self, v5, (uint64_t)v7, v6);

}

- (void)__setBackingStateNoCopy:(id)a3
{
  objc_storeStrong((id *)&self->_clockValues, a3);
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)mutableCopy
{
  return (id)((uint64_t (*)(CKDistributedTimestampSparseVector *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_mutableCopyWithZone_, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CKDistributedTimestampSparseVector *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v3 = self;
  objc_sync_enter(v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend_clockValues(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  objc_sync_exit(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKDistributedTimestampSparseVector *v4;
  CKDistributedTimestampSparseVector *v5;
  CKDistributedTimestampSparseVector *v6;
  CKDistributedTimestampSparseVector *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char isEqual;

  v4 = (CKDistributedTimestampSparseVector *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self;
      objc_sync_enter(v6);
      v7 = v5;
      objc_sync_enter(v7);
      objc_msgSend_clockValues(v6, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clockValues(v7, v12, v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v18)
      {
        isEqual = 1;
      }
      else
      {
        objc_msgSend_clockValues(v6, v15, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clockValues(v7, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

      }
      objc_sync_exit(v7);

      objc_sync_exit(v6);
    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  CKDistributedTimestampSparseVector *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = self;
  objc_sync_enter(v2);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend_clockValues(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A7F255C;
  v11[3] = &unk_1E1F65D58;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v11, v8);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v2);

  return v9;
}

- (id)allSiteIdentifiers
{
  CKDistributedTimestampSparseVector *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_clockValues(v2, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v12, (uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v14;
}

- (unint64_t)timestampCount
{
  CKDistributedTimestampSparseVector *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = self;
  objc_sync_enter(v2);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend_clockValues(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A7F2784;
  v11[3] = &unk_1E1F65D58;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v11, v8);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v2);

  return v9;
}

- (unint64_t)timestampCountForSiteIdentifier:(id)a3
{
  id v4;
  CKDistributedTimestampSparseVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_clockValues(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v12, v13, v14, v15);

  objc_sync_exit(v5);
  return v16;
}

- (id)clockValuesForSiteIdentifier:(id)a3
{
  id v4;
  CKDistributedTimestampSparseVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_clockValues(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend_copy(v12, v13, v14, v15);
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_opt_new();
  v19 = v18;

  objc_sync_exit(v5);
  return v19;
}

- (id)vectorFilteredBySiteIdentifiers:(id)a3
{
  id v4;
  CKDistributedTimestampSparseVector *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_new();
  objc_msgSend_clockValues(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = sub_18A7F2AC4;
  v23 = &unk_1E1F65D80;
  v11 = v4;
  v24 = v11;
  v12 = v6;
  v25 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  v18 = (void *)objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return v18;
}

- (id)vectorFilteredByModifier:(id)a3
{
  id v4;
  CKDistributedTimestampSparseVector *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_new();
  objc_msgSend_clockValues(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = sub_18A7F2CCC;
  v23 = &unk_1E1F65D80;
  v11 = v4;
  v24 = v11;
  v12 = v6;
  v25 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  v18 = (void *)objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return v18;
}

- (NSDictionary)clockValues
{
  return self->_clockValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockValues, 0);
}

@end
