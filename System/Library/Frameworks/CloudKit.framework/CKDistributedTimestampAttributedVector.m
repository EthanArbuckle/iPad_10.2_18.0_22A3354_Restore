@implementation CKDistributedTimestampAttributedVector

+ (id)pDistributedTimestampsFromAttributedVector:(id)a3
{
  return (id)objc_msgSend_pDistributedTimestampsWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(CKMergeableDeltaVectors, a2, 0, (uint64_t)a3, 0, 0);
}

+ (id)attributedVectorFromPDistributedTimestamps:(id)a3 error:(id *)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_deltaMetadataVectorsFromPDistributedTimestamps_error_(CKMergeableDeltaVectors, a2, (uint64_t)a3, (uint64_t)a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    objc_msgSend_contents(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_backingVector(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)pVersionVectorFromAttributedVector:(id)a3 siteIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_sync_enter(v8);
  v9 = (void *)objc_opt_new();
  objc_msgSend_clockValuesForSiteIdentifier_(v8, v10, (uint64_t)v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_18A75B59C;
  v27[3] = &unk_1E1F62308;
  v14 = v9;
  v28 = v14;
  objc_msgSend_enumerateRangesUsingBlock_(v12, v15, (uint64_t)v27, v16);
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = sub_18A75B5D0;
  v24[3] = &unk_1E1F63F88;
  v26 = a1;
  v17 = v14;
  v25 = v17;
  objc_msgSend_enumerateClockValuesForSiteIdentifier_usingBlock_(v8, v18, (uint64_t)v7, (uint64_t)v24);
  if (objc_msgSend_clockValuesCount(v17, v19, v20, v21))
    v22 = v17;
  else
    v22 = 0;

  objc_sync_exit(v8);
  return v22;
}

+ (int)pClockTypeAndAtomStateFromClockType:(unsigned __int8)a3 atomState:(unsigned __int8)a4
{
  int v4;
  int v5;

  v4 = a4 + 5;
  if (a4 < 4u)
  {
    v5 = a4 + 1;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  if (a3 != 1)
    v5 = 0;
  if (a3 == 2)
    return v4;
  else
    return v5;
}

+ (unsigned)clockTypeFromPClockTypeAndAtomState:(int)a3
{
  if ((a3 - 1) >= 8)
    return -1;
  else
    return 0x202020201010101uLL >> (8 * (a3 - 1));
}

+ (unsigned)atomStateFromPClockTypeAndAtomState:(int)a3
{
  if ((a3 - 1) >= 8)
    return -1;
  else
    return 0x302010003020100uLL >> (8 * (a3 - 1));
}

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

- (CKDistributedTimestampAttributedVector)init
{
  CKDistributedTimestampAttributedVector *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDistributedTimestampAttributedVector;
  v2 = -[CKDistributedTimestampAttributedVector init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend__setBackingState_(v2, v4, (uint64_t)v3, v5);

  }
  return v2;
}

- (CKDistributedTimestampAttributedVector)initWithCoder:(id)a3
{
  id v4;
  CKDistributedTimestampAttributedVector *v5;
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
  v21.super_class = (Class)CKDistributedTimestampAttributedVector;
  v5 = -[CKDistributedTimestampAttributedVector init](&v21, sel_init);
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
    NSStringFromSelector(sel_attributeToSparseVector);
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
  CKDistributedTimestampAttributedVector *v5;
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
  objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_attributeToSparseVector);
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
  objc_storeStrong((id *)&self->_mutableAttributeToSparseVector, a3);
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)mutableCopy
{
  return (id)((uint64_t (*)(CKDistributedTimestampAttributedVector *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_mutableCopyWithZone_, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CKDistributedTimestampAttributedVector *v3;
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
  objc_msgSend_mutableAttributeToSparseVector(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  objc_sync_exit(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKDistributedTimestampAttributedVector *v4;
  CKDistributedTimestampAttributedVector *v5;
  CKDistributedTimestampAttributedVector *v6;
  CKDistributedTimestampAttributedVector *v7;
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

  v4 = (CKDistributedTimestampAttributedVector *)a3;
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
      objc_msgSend_mutableAttributeToSparseVector(v6, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mutableAttributeToSparseVector(v7, v12, v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v18)
      {
        isEqual = 1;
      }
      else
      {
        objc_msgSend_mutableAttributeToSparseVector(v6, v15, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mutableAttributeToSparseVector(v7, v20, v21, v22);
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
  CKDistributedTimestampAttributedVector *v2;
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
  objc_msgSend_mutableAttributeToSparseVector(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A7F4148;
  v11[3] = &unk_1E1F63EA0;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v11, v8);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v2);

  return v9;
}

- (id)allSiteIdentifiers
{
  CKDistributedTimestampAttributedVector *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_opt_new();
  objc_msgSend_mutableAttributeToSparseVector(v2, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A7F42C4;
  v12[3] = &unk_1E1F65DF0;
  v8 = v3;
  v13 = v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v9, (uint64_t)v12, v10);

  objc_sync_exit(v2);
  return v8;
}

- (id)allModifiers
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_allSiteIdentifiers(self, v4, v5, v6);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v7);
        objc_msgSend_modifier(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v14), v9, v10, v11, (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v16, (uint64_t)v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v12);
  }

  return v3;
}

- (unint64_t)timestampCount
{
  CKDistributedTimestampAttributedVector *v2;
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
  objc_msgSend_mutableAttributeToSparseVector(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A7F4570;
  v11[3] = &unk_1E1F63EA0;
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
  CKDistributedTimestampAttributedVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A7F46EC;
  v15[3] = &unk_1E1F66128;
  v17 = &v18;
  v10 = v4;
  v16 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)v15, v12);

  v13 = v19[3];
  _Block_object_dispose(&v18, 8);
  objc_sync_exit(v5);

  return v13;
}

- (unsigned)attributeForTimestamp:(id)a3
{
  id v4;
  CKDistributedTimestampAttributedVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v14)
  {
    obj = v9;
    v15 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend_mutableAttributeToSparseVector(v5, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_siteIdentifierObject(v4, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clockValuesForSiteIdentifier_(v21, v26, (uint64_t)v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend_clockValue(v4, v29, v30, v31);
        v35 = objc_msgSend_containsIndex_(v28, v33, v32, v34);

        if (v35)
        {
          LOWORD(v14) = objc_msgSend_unsignedShortValue(v17, v36, v37, v38);

          goto LABEL_11;
        }

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v41, (uint64_t)v45, 16);
      if (v14)
        continue;
      break;
    }
LABEL_11:
    v9 = obj;
  }

  objc_sync_exit(v5);
  return v14;
}

- (id)clockValuesForSiteIdentifier:(id)a3
{
  id v4;
  CKDistributedTimestampAttributedVector *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_new();
  objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18A7F4AA4;
  v18[3] = &unk_1E1F65E18;
  v11 = v6;
  v19 = v11;
  v12 = v4;
  v20 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)v18, v14);

  v15 = v20;
  v16 = v11;

  objc_sync_exit(v5);
  return v16;
}

- (void)enumerateClockValuesForSiteIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, _QWORD, unsigned __int8 *);
  CKDistributedTimestampAttributedVector *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t Index;
  unint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  const char *v31;
  void *v33;
  unsigned __int8 v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  __n128 (*v45)(__n128 *, __n128 *);
  uint64_t (*v46)();
  void *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, _QWORD, unsigned __int8 *))a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend_clockValuesForSiteIdentifier_(v8, v9, (uint64_t)v6, v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v33, v11, v12, v13))
  {
    Index = objc_msgSend_lastIndex(v33, v14, v15, v16);
    v21 = 0;
    do
    {
      if (v21 > Index)
        break;
      v52 = 0;
      v53 = &v52;
      v54 = 0x2020000000;
      v55 = 1;
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v51 = 0;
      v42 = 0;
      v43 = &v42;
      v44 = 0x4012000000;
      v45 = sub_18A7F4DF0;
      v46 = nullsub_27;
      v47 = &unk_18A89B0A7;
      objc_msgSend_mutableAttributeToSparseVector(v8, v17, v18, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = sub_18A7F4E00;
      v35[3] = &unk_1E1F65E68;
      v23 = v6;
      v40 = v21;
      v41 = Index + 1 - v21;
      v36 = v23;
      v37 = &v52;
      v38 = &v42;
      v39 = &v48;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v22, v24, (uint64_t)v35, v25);

      if (*((_BYTE *)v53 + 24))
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)v8, CFSTR("CKDistributedTimestampVector.mm"), 600, CFSTR("Range unexpectedly not found"));

      }
      v34 = 0;
      v7[2](v7, v43[6], v43[7], *((unsigned __int16 *)v49 + 12), &v34);
      v29 = v34;
      if (!v34)
        v21 = v43[7] + v43[6];

      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(&v48, 8);
      _Block_object_dispose(&v52, 8);
    }
    while (!v29);
  }

  objc_sync_exit(v8);
}

- (void)enumerateAllClockValuesUsingBlock:(id)a3
{
  id v4;
  CKDistributedTimestampAttributedVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  const char *v17;
  id obj;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_allSiteIdentifiers(v5, v6, v7, v8);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    v12 = MEMORY[0x1E0C809B0];
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = sub_18A7F5194;
      v19[3] = &unk_1E1F65E90;
      v15 = v4;
      v19[4] = v14;
      v20 = v15;
      v21 = &v22;
      objc_msgSend_enumerateClockValuesForSiteIdentifier_usingBlock_(v5, v16, v14, (uint64_t)v19);
      LOBYTE(v14) = *((_BYTE *)v23 + 24) == 0;

      _Block_object_dispose(&v22, 8);
      if ((v14 & 1) == 0)
        break;
      if (v10 == ++v13)
      {
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v26, (uint64_t)v30, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_sync_exit(v5);
}

- (CKDistributedTimestampAttributedVector)vectorWithoutAttributes
{
  CKDistributedTimestampAttributedVector *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_opt_new();
  objc_msgSend_mutableAttributeToSparseVector(v2, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A7F5304;
  v16[3] = &unk_1E1F65DF0;
  v8 = v3;
  v17 = v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v9, (uint64_t)v16, v10);

  v14 = (void *)objc_msgSend_copy(v8, v11, v12, v13);
  objc_sync_exit(v2);

  return (CKDistributedTimestampAttributedVector *)v14;
}

- (id)vectorFilteredBySiteIdentifiers:(id)a3
{
  id v4;
  CKDistributedTimestampAttributedVector *v5;
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
  objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = sub_18A7F5458;
  v23 = &unk_1E1F65E18;
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
  CKDistributedTimestampAttributedVector *v5;
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
  objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = sub_18A7F566C;
  v23 = &unk_1E1F65E18;
  v11 = v4;
  v24 = v11;
  v12 = v6;
  v25 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  v18 = (void *)objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return v18;
}

- (id)vectorFilteredByAttribute:(unsigned __int16)a3
{
  uint64_t v3;
  CKDistributedTimestampAttributedVector *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend_mutableAttributeToSparseVector(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v10, v3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_mutableCopy(v15, v16, v17, v18);
  objc_msgSend_mutableAttributeToSparseVector(v5, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v24, v3, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v23, v27, (uint64_t)v19, (uint64_t)v26);

  v31 = (void *)objc_msgSend_copy(v5, v28, v29, v30);
  objc_sync_exit(v4);

  return v31;
}

- (CKDistributedTimestampAttributedVector)vectorWithAttributeReplacementBlock:(id)a3
{
  id v4;
  CKDistributedTimestampAttributedVector *v5;
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
  objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = sub_18A7F59F8;
  v23 = &unk_1E1F65EB8;
  v11 = v4;
  v25 = v11;
  v12 = v6;
  v24 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  v18 = (void *)objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return (CKDistributedTimestampAttributedVector *)v18;
}

- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3
{
  return sub_18A7F5B7C(self, a3, &unk_1E1F599B8);
}

- (id)descriptionWithStringSiteIdentifiers
{
  return (id)((uint64_t (*)(CKDistributedTimestampAttributedVector *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_descriptionWithStringSiteIdentifiers_, 1);
}

- (id)description
{
  return (id)((uint64_t (*)(CKDistributedTimestampAttributedVector *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_descriptionWithStringSiteIdentifiers_, 0);
}

- (NSDictionary)mutableAttributeToSparseVector
{
  return self->_mutableAttributeToSparseVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAttributeToSparseVector, 0);
}

- (id)clockVector_vectorFilteredByClockType:(unsigned __int8)a3
{
  CKDistributedTimestampAttributedVector *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  unsigned __int8 v23;

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend_mutableAttributeToSparseVector(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = sub_18A7FACD4;
  v21 = &unk_1E1F66060;
  v23 = a3;
  v10 = v5;
  v22 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)&v18, v12);

  v16 = (void *)objc_msgSend_copy(v10, v13, v14, v15, v18, v19, v20, v21);
  objc_sync_exit(v4);

  return v16;
}

- (id)clockVector_vectorFilteredByAtomState:(unsigned __int8)a3
{
  CKDistributedTimestampAttributedVector *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  unsigned __int8 v23;

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend_mutableAttributeToSparseVector(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = sub_18A7FAEAC;
  v21 = &unk_1E1F66060;
  v23 = a3;
  v10 = v5;
  v22 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)&v18, v12);

  v16 = (void *)objc_msgSend_copy(v10, v13, v14, v15, v18, v19, v20, v21);
  objc_sync_exit(v4);

  return v16;
}

- (id)clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers:(id)a3 withExpansionState:(unsigned __int8)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, uint64_t, uint64_t);
  void *v38;
  id v39;
  id v40;
  unsigned __int8 v41;
  _QWORD v42[4];
  id v43;

  v6 = a3;
  v10 = (void *)objc_msgSend_mutableCopy(self, v7, v8, v9);
  objc_msgSend_clockVector_vectorFilteredByClockType_(v10, v11, 2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSiteIdentifiers(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromSet_(v17, v18, (uint64_t)v6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v22 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_18A7FB140;
  v42[3] = &unk_1E1F66088;
  v23 = v21;
  v43 = v23;
  objc_msgSend_enumerateObjectsUsingBlock_(v20, v24, (uint64_t)v42, v25);
  v35 = v22;
  v36 = 3221225472;
  v37 = sub_18A7FB230;
  v38 = &unk_1E1F660B0;
  v26 = v23;
  v39 = v26;
  v27 = v10;
  v40 = v27;
  v41 = a4;
  objc_msgSend_enumerateAllClockValuesUsingBlock_(v13, v28, (uint64_t)&v35, v29);
  v33 = (void *)objc_msgSend_copy(v27, v30, v31, v32, v35, v36, v37, v38);

  return v33;
}

- (unint64_t)clockVector_timestampCountForAtomState:(unsigned __int8)a3
{
  CKDistributedTimestampAttributedVector *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD v13[5];
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = self;
  objc_sync_enter(v4);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend_mutableAttributeToSparseVector(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A7FB5FC;
  v13[3] = &unk_1E1F660D8;
  v14 = a3;
  v13[4] = &v15;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v9, (uint64_t)v13, v10);

  v11 = v16[3];
  _Block_object_dispose(&v15, 8);
  objc_sync_exit(v4);

  return v11;
}

- (BOOL)clockVector_includesTimestamp:(id)a3
{
  id v4;
  CKDistributedTimestampAttributedVector *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  char v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_clockVector_vectorFilteredByClockType_(v5, v6, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_siteIdentifierObject(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockValuesForSiteIdentifier_(v8, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_clockValue(v4, v16, v17, v18);
  v22 = objc_msgSend_containsIndex_(v15, v20, v19, v21);

  if ((v22 & 1) != 0)
  {
    v26 = 1;
  }
  else
  {
    objc_msgSend_siteIdentifierObject(v4, v23, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifier(v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clockVector__winningLWWTimestampForModifier_winningAttribute_(v5, v32, (uint64_t)v31, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend_siteIdentifierObject(v4, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_clockValue(v4, v42, v43, v44);
      objc_msgSend_siteIdentifierObject(v33, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend_clockValue(v33, v54, v55, v56);
      v58 = CKDistributedTimestampLWWCompare(v41, v45, v53, v57);

      v26 = (unint64_t)(v58 + 1) < 2;
    }
    else
    {
      v26 = 0;
    }

  }
  objc_sync_exit(v5);

  return v26;
}

- (unsigned)clockVector_clockTypeForModifier:(id)a3
{
  id v4;
  CKDistributedTimestampAttributedVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A7FB9C4;
  v14[3] = &unk_1E1F66128;
  v10 = v4;
  v15 = v10;
  v16 = &v17;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)v14, v12);

  LOBYTE(v4) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  objc_sync_exit(v5);

  return v4;
}

- (id)clockVector_clockTypesForAllModifiers
{
  CKDistributedTimestampAttributedVector *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_opt_new();
  objc_msgSend_mutableAttributeToSparseVector(v2, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A7FBC50;
  v12[3] = &unk_1E1F65DF0;
  v8 = v3;
  v13 = v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v9, (uint64_t)v12, v10);

  objc_sync_exit(v2);
  return v8;
}

- (id)clockVector__winningLWWTimestampForModifier:(id)a3 winningAttribute:(unsigned __int16 *)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  CKDistributedTimestamp *v16;
  const char *v17;
  void *v18;
  _QWORD v20[11];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[3];
  char v36;
  _QWORD v37[3];
  char v38;

  v7 = a3;
  objc_msgSend_clockVector_vectorFilteredByClockType_(self, v8, 2, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByModifier_(v10, v11, (uint64_t)v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_18A7F6EE8;
  v33 = sub_18A7F6EF8;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18A7FC108;
  v20[3] = &unk_1E1F66150;
  v20[9] = &v21;
  v20[10] = a2;
  v20[4] = self;
  v20[5] = v37;
  v20[6] = v35;
  v20[7] = &v29;
  v20[8] = &v25;
  objc_msgSend_enumerateAllClockValuesUsingBlock_(v13, v14, (uint64_t)v20, v15);
  if (v30[5])
  {
    if (a4)
      *a4 = *((_WORD *)v22 + 12);
    v16 = [CKDistributedTimestamp alloc];
    v18 = (void *)objc_msgSend_initWithSiteIdentifierObject_clockValue_(v16, v17, v30[5], v26[3]);
  }
  else
  {
    v18 = 0;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  return v18;
}

- (int64_t)clockVector_compareToVector:(id)a3 withExpansionState:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  CKDistributedTimestampAttributedVector *v7;
  id v8;
  const char *v9;
  int hasTimestampsNotInVector_withExpansionState;
  const char *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = v6;
  objc_sync_enter(v8);
  hasTimestampsNotInVector_withExpansionState = objc_msgSend_clockVector_hasTimestampsNotInVector_withExpansionState_(v7, v9, (uint64_t)v8, v4);
  v12 = objc_msgSend_clockVector_hasTimestampsNotInVector_withExpansionState_(v8, v11, (uint64_t)v7, v4);
  v13 = 2;
  if (!(v12 | hasTimestampsNotInVector_withExpansionState))
    v13 = 0;
  if ((v12 ^ 1 | hasTimestampsNotInVector_withExpansionState) == 1)
    v14 = v13;
  else
    v14 = -1;
  if (((hasTimestampsNotInVector_withExpansionState ^ 1 | v12) & 1) != 0)
    v15 = v14;
  else
    v15 = 1;
  objc_sync_exit(v8);

  objc_sync_exit(v7);
  return v15;
}

- (BOOL)clockVector_hasTimestampsNotInVector:(id)a3 withExpansionState:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v6 = a3;
  v10 = (void *)objc_msgSend_mutableCopy(self, v7, v8, v9);
  objc_msgSend_clockVector_minusVector_withExpansionState_(v10, v11, (uint64_t)v6, v4);
  LOBYTE(v4) = objc_msgSend_timestampCount(v10, v12, v13, v14) != 0;

  return v4;
}

@end
