@implementation CKDistributedTimestampMutableAttributedVector

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

  objc_msgSend_CKDeepCopyWithLeafNodeCopyBlock_(a3, a2, (uint64_t)&unk_1E1F65EF8, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  objc_msgSend___setBackingStateNoCopy_(self, v9, (uint64_t)v11, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKDistributedTimestampMutableAttributedVector *v3;
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

- (id)attributeToSparseVector
{
  CKDistributedTimestampMutableAttributedVector *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_mutableAttributeToSparseVector(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v10;
}

- (void)_swapContentsWithVector:(id)a3
{
  id v4;
  CKDistributedTimestampMutableAttributedVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  id obj;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  obj = v4;
  objc_sync_enter(obj);
  objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mutableAttributeToSparseVector(obj, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v5, v14, (uint64_t)v13, v15);

  objc_msgSend__setBackingState_(obj, v16, (uint64_t)v9, v17);
  objc_sync_exit(obj);

  objc_sync_exit(v5);
}

- (void)intersectVector:(id)a3
{
  id v4;
  CKDistributedTimestampMutableAttributedVector *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v4;
  objc_sync_enter(v6);
  objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A7F6518;
  v17[3] = &unk_1E1F65F20;
  obj = v6;
  v18 = obj;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v11, (uint64_t)v17, v12);

  objc_sync_exit(obj);
  objc_msgSend__maintainInvariants(v5, v13, v14, v15);
  objc_sync_exit(v5);

}

- (void)minusVector:(id)a3
{
  id v4;
  CKDistributedTimestampMutableAttributedVector *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v4;
  objc_sync_enter(v6);
  objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A7F6644;
  v17[3] = &unk_1E1F65F20;
  obj = v6;
  v18 = obj;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v11, (uint64_t)v17, v12);

  objc_sync_exit(obj);
  objc_msgSend__maintainInvariants(v5, v13, v14, v15);
  objc_sync_exit(v5);

}

- (void)minusVector:(id)a3 forAttribute:(unsigned __int16)a4
{
  uint64_t v4;
  CKDistributedTimestampMutableAttributedVector *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v4 = a4;
  v22 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend_mutableAttributeToSparseVector(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v11, v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v14, (uint64_t)v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusVector_(v16, v17, (uint64_t)v22, v18);

  objc_msgSend__maintainInvariants(v6, v19, v20, v21);
  objc_sync_exit(v6);

}

- (void)intersectAttributedVector:(id)a3
{
  id v4;
  CKDistributedTimestampMutableAttributedVector *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v4;
  objc_sync_enter(v6);
  objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A7F6864;
  v17[3] = &unk_1E1F65F20;
  obj = v6;
  v18 = obj;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v11, (uint64_t)v17, v12);

  objc_sync_exit(obj);
  objc_msgSend__maintainInvariants(v5, v13, v14, v15);
  objc_sync_exit(v5);

}

- (void)addClockValuesInIndexSet:(id)a3 withAttribute:(unsigned __int16)a4 forSiteIdentifier:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  CKDistributedTimestampMutableAttributedVector *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  objc_msgSend_mutableAttributeToSparseVector(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_18A7F6B7C;
  v42[3] = &unk_1E1F65F48;
  v41 = v8;
  v43 = v41;
  v15 = v9;
  v44 = v15;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v16, (uint64_t)v42, v17);

  objc_msgSend_mutableAttributeToSparseVector(v10, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v22, v6, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v25, (uint64_t)v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    v29 = objc_opt_new();
    objc_msgSend_mutableAttributeToSparseVector(v10, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v34, v6, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v33, v37, v29, (uint64_t)v36);

    v27 = (void *)v29;
  }
  objc_msgSend_addClockValuesInIndexSet_forSiteIdentifier_(v27, v28, (uint64_t)v41, (uint64_t)v15);
  objc_msgSend__maintainInvariants(v10, v38, v39, v40);

  objc_sync_exit(v10);
}

- (void)addAllClockValuesFromVector:(id)a3
{
  id v4;
  CKDistributedTimestampMutableAttributedVector *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  _QWORD v22[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  obj = v4;
  objc_sync_enter(obj);
  objc_msgSend_vectorWithoutAttributes(obj, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusVector_(v5, v10, (uint64_t)v9, v11);

  objc_msgSend_mutableAttributeToSparseVector(obj, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_18A7F6CB0;
  v22[3] = &unk_1E1F65DF0;
  v22[4] = v5;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v15, v16, (uint64_t)v22, v17);

  objc_sync_exit(obj);
  objc_msgSend__maintainInvariants(v5, v18, v19, v20);
  objc_sync_exit(v5);

}

- (void)_maintainInvariants
{
  CKDistributedTimestampMutableAttributedVector *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v2 = self;
  objc_sync_enter(v2);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_18A7F6EE8;
  v20 = sub_18A7F6EF8;
  v21 = 0;
  objc_msgSend_mutableAttributeToSparseVector(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A7F6F00;
  v15[3] = &unk_1E1F63EA0;
  v15[4] = &v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v15, v8);

  if (v17[5])
  {
    objc_msgSend_mutableAttributeToSparseVector(v2, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsForKeys_(v12, v13, v17[5], v14);

  }
  _Block_object_dispose(&v16, 8);

  objc_sync_exit(v2);
}

- (void)clockVector_intersectVector:(id)a3 withExpansionState:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  CKDistributedTimestampMutableAttributedVector *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id obj;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  obj = v6;
  objc_sync_enter(obj);
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v7, v8, (uint64_t)obj, v9);
  objc_msgSend_allSiteIdentifiers(obj, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v7, v14, (uint64_t)v13, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_mutableCopy(v15, v16, v17, v18);

  objc_msgSend_allSiteIdentifiers(v7, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(obj, v24, (uint64_t)v23, v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vectorWithoutAttributes(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_intersectVector_(v19, v30, (uint64_t)v29, v31);

  objc_msgSend__swapContentsWithVector_(v7, v32, (uint64_t)v19, v33);
  objc_sync_exit(obj);

  objc_msgSend_clockVector_maintainInvariants(v7, v34, v35, v36);
  objc_sync_exit(v7);

}

- (void)clockVector_minusVector:(id)a3 withExpansionState:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  CKDistributedTimestampMutableAttributedVector *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id obj;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  obj = v6;
  objc_sync_enter(obj);
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v7, v8, (uint64_t)obj, v9);
  objc_msgSend_allSiteIdentifiers(obj, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v7, v14, (uint64_t)v13, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_mutableCopy(v15, v16, v17, v18);

  objc_msgSend_allSiteIdentifiers(v7, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(obj, v24, (uint64_t)v23, v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vectorWithoutAttributes(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusVector_(v19, v30, (uint64_t)v29, v31);

  objc_msgSend__swapContentsWithVector_(v7, v32, (uint64_t)v19, v33);
  objc_sync_exit(obj);

  objc_msgSend_clockVector_maintainInvariants(v7, v34, v35, v36);
  objc_sync_exit(v7);

}

- (void)clockVector_maintainInvariants
{
  CKDistributedTimestampMutableAttributedVector *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  id obj;
  unsigned __int16 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_allModifiers(v2, v3, v4, v5);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v44;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x18D76DE4C]();
        v42 = 0;
        objc_msgSend_clockVector__winningLWWTimestampForModifier_winningAttribute_(v2, v12, v10, (uint64_t)&v42);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend_vectorFilteredByModifier_(v2, v13, v10, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend_timestampCount(v16, v17, v18, v19) >= 2)
          {
            objc_msgSend_vectorWithoutAttributes(v16, v20, v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_minusVector_(v2, v24, (uint64_t)v23, v25);

            v26 = (void *)MEMORY[0x1E0CB36B8];
            v30 = objc_msgSend_clockValue(v15, v27, v28, v29);
            objc_msgSend_indexSetWithIndex_(v26, v31, v30, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v42;
            objc_msgSend_siteIdentifierObject(v15, v35, v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addClockValuesInIndexSet_withAttribute_forSiteIdentifier_(v2, v39, (uint64_t)v33, v34, v38);

          }
        }

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v7);
  }

  objc_sync_exit(v2);
}

- (void)clockVector_checkInvariantsAgainstVector:(id)a3
{
  id v4;
  CKDistributedTimestampMutableAttributedVector *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  BOOL v42;
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  CKDistributedTimestampMutableAttributedVector *v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v4;
  objc_sync_enter(v6);
  obj = v6;
  v55 = v5;
  objc_msgSend_allModifiers(v5, v7, v8, v9);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allModifiers(v6, v10, v11, v12);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend_mutableCopy(v57, v13, v14, v15);
  objc_msgSend_intersectSet_(v56, v16, (uint64_t)v58, v17);
  objc_msgSend_clockVector_clockTypesForAllModifiers(v5, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_clockTypesForAllModifiers(v6, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v26 = v56;
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v60, (uint64_t)v64, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v61 != v31)
          objc_enumerationMutation(v26);
        v33 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v21, v28, v33, v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v25, v35, v33, v36);
        v37 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v37;
        if (v34)
          v42 = v37 == 0;
        else
          v42 = 1;
        if (!v42)
        {
          v43 = objc_msgSend_unsignedIntValue(v34, v38, v39, v40);
          if (v43 != objc_msgSend_unsignedIntValue(v41, v44, v45, v46))
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v47, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v51, (uint64_t)"-[CKDistributedTimestampMutableAttributedVector(ClockVectorSupport) clockVector_checkInvariantsAgainstVector:]", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v50, v54, (uint64_t)v53, (uint64_t)CFSTR("CKDistributedTimestampVector.mm"), 1919, CFSTR("It is not possible to mix and match regular and lwwPerModifier clock types for a given site identifier modifier (rdar://84695941)"));

          }
        }

      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v60, (uint64_t)v64, 16);
    }
    while (v30);
  }

  objc_sync_exit(obj);
  objc_sync_exit(v55);

}

- (void)clockVector_checkInvariantsAgainstClockValues:(id)a3 withSiteIdentifier:(id)a4 ofType:(unsigned __int8)a5
{
  int v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  v5 = a5;
  v22 = a4;
  objc_msgSend_modifier(v22, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_clockVector_clockTypeForModifier_(self, v11, (uint64_t)v10, v12);

  if (v13 != 255 && v13 != v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v18, (uint64_t)"-[CKDistributedTimestampMutableAttributedVector(ClockVectorSupport) clockVector_checkInvariantsAgainstClockValues:withSiteIdentifier:ofType:]", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v17, v21, (uint64_t)v20, (uint64_t)CFSTR("CKDistributedTimestampVector.mm"), 1935, CFSTR("It is not possible to mix and match regular and lwwPerModifier clock types for a given site identifier modifier (rdar://84695941)"));

  }
}

@end
