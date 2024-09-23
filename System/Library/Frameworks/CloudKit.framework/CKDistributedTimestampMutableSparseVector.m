@implementation CKDistributedTimestampMutableSparseVector

- (void)_setBackingState:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  objc_msgSend_CKDeepCopyWithLeafNodeCopyBlock_(a3, a2, (uint64_t)&unk_1E1F58AB8, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  objc_msgSend___setBackingStateNoCopy_(self, v9, (uint64_t)v11, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKDistributedTimestampMutableSparseVector *v3;
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

- (void)minusVector:(id)a3
{
  id v4;
  CKDistributedTimestampMutableSparseVector *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v4;
  objc_sync_enter(v6);
  if (objc_msgSend_timestampCount(v5, v7, v8, v9) && objc_msgSend_timestampCount(v6, v10, v11, v12))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_18A7F321C;
    v13[3] = &unk_1E1F65DC8;
    v13[4] = v5;
    v14 = v6;
    sub_18A7F3034(v5, v14, v13);

  }
  objc_sync_exit(v6);

  objc_sync_exit(v5);
}

- (void)intersectVector:(id)a3
{
  id v4;
  CKDistributedTimestampMutableSparseVector *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v4;
  objc_sync_enter(v6);
  if (objc_msgSend_timestampCount(v5, v7, v8, v9) && objc_msgSend_timestampCount(v6, v10, v11, v12))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18A7F3464;
    v17[3] = &unk_1E1F65DC8;
    v17[4] = v5;
    v18 = v6;
    sub_18A7F3034(v5, v18, v17);

  }
  else
  {
    objc_msgSend_clockValues(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeAllObjects(v13, v14, v15, v16);

  }
  objc_sync_exit(v6);

  objc_sync_exit(v5);
}

- (void)unionVector:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18A7F3634;
  v6[3] = &unk_1E1F65DC8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  sub_18A7F3034(self, v5, v6);

}

- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4
{
  id v6;
  CKDistributedTimestampMutableSparseVector *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;

  v33 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (objc_msgSend_count(v33, v8, v9, v10))
  {
    objc_msgSend_clockValues(v7, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v6, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_clockValues(v7, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v6, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v27 = objc_opt_new();

      objc_msgSend_clockValues(v7, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v31, v32, v27, (uint64_t)v6);

      v17 = (void *)v27;
    }
    objc_msgSend_addIndexes_(v17, v25, (uint64_t)v33, v26);

  }
  objc_sync_exit(v7);

}

- (void)removeClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4
{
  id v6;
  CKDistributedTimestampMutableSparseVector *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (objc_msgSend_count(v28, v8, v9, v10))
  {
    objc_msgSend_clockValues(v7, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v6, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_removeIndexes_(v17, v18, (uint64_t)v28, v19);
    if (!objc_msgSend_count(v17, v20, v21, v22))
    {
      objc_msgSend_clockValues(v7, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v26, v27, 0, (uint64_t)v6);

    }
  }
  objc_sync_exit(v7);

}

@end
