@implementation CKDistributedTimestampClockVector

- (void)_setBackingState:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3);
  objc_msgSend___setBackingStateNoCopy_(self, v5, (uint64_t)v7, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v4 = (void *)objc_opt_new();
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  return v4;
}

- (void)intersectVector:(id)a3
{
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
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v17 = a3;
  objc_msgSend_backingVector(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v17, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_vectorExpansionState(self, v12, v13, v14);
  objc_msgSend_clockVector_intersectVector_withExpansionState_(v7, v16, (uint64_t)v11, v15);

}

- (void)minusVector:(id)a3
{
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
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v17 = a3;
  objc_msgSend_backingVector(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v17, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_vectorExpansionState(self, v12, v13, v14);
  objc_msgSend_clockVector_minusVector_withExpansionState_(v7, v16, (uint64_t)v11, v15);

}

- (void)unionVector:(id)a3
{
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
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;

  v39 = a3;
  objc_msgSend_backingVector(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_backingVector(v39, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  objc_msgSend_backingVector(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v39, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v15, v20, (uint64_t)v19, v21);

  objc_msgSend_backingVector(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v39, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addAllClockValuesFromVector_(v25, v30, (uint64_t)v29, v31);

  objc_sync_exit(v11);
  objc_msgSend_backingVector(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_maintainInvariants(v35, v36, v37, v38);

  objc_sync_exit(v7);
}

- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_addClockValuesInIndexSet_withClockType_forSiteIdentifier_, a3, 1);
}

- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 forSiteIdentifier:(id)a5
{
  uint64_t v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v6 = a4;
  v30 = a3;
  v8 = a5;
  objc_msgSend_backingVector(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  objc_msgSend_backingVector(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_checkInvariantsAgainstClockValues_withSiteIdentifier_ofType_(v16, v17, (uint64_t)v30, (uint64_t)v8, v6);

  objc_msgSend_backingVector(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addClockValuesInIndexSet_withAttribute_forSiteIdentifier_(v21, v22, (uint64_t)v30, ((_DWORD)v6 << 8), v8);

  objc_msgSend_backingVector(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_maintainInvariants(v26, v27, v28, v29);

  objc_sync_exit(v12);
}

@end
