@implementation CKXProxyCache

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_totalProxiesRetainedOutOfScope(self, a2, v2) >= 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v4 = (void *)*MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      v5 = v4;
      *(_DWORD *)buf = 134218496;
      v14 = objc_msgSend_totalProxiesRetainedOutOfScope(self, v6, v7);
      v15 = 2048;
      v16 = objc_msgSend_totalProxiesCreated(self, v8, v9);
      v17 = 2048;
      v18 = objc_msgSend_totalProxiesReclaimed(self, v10, v11);
      _os_log_debug_impl(&dword_1D4AFF000, v5, OS_LOG_TYPE_DEBUG, "%lu proxies retained out of expected scope (%lu created, %lu reclaimed). This may cause degraded performance if it happens too often.", buf, 0x20u);

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CKXProxyCache;
  -[CKXProxyCache dealloc](&v12, sel_dealloc);
}

- (CKXProxyCache)init
{
  const char *v2;
  uint64_t v3;
  CKXProxyCache *v4;
  uint64_t v5;
  NSMapTable *cachedProxies;
  uint64_t v7;
  NSMutableArray *scopedProxies;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKXProxyCache;
  v4 = -[CKXProxyCache init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    cachedProxies = v4->_cachedProxies;
    v4->_cachedProxies = (NSMapTable *)v5;

    v7 = objc_opt_new();
    scopedProxies = v4->_scopedProxies;
    v4->_scopedProxies = (NSMutableArray *)v7;

  }
  return v4;
}

- (id)proxyForClass:(Class)a3 withScope:(int64_t)a4
{
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *inited;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;

  objc_msgSend_cachedProxies(self, a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, (uint64_t)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_count(v9, v10, v11))
  {
    v23 = [a3 alloc];
    inited = (void *)objc_msgSend_initInternal(v23, v24, v25);
    v28 = objc_msgSend_totalProxiesCreated(self, v26, v27);
    objc_msgSend_setTotalProxiesCreated_(self, v29, v28 + 1);
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend_lastObject(v9, v12, v13);
  inited = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeLastObject(v9, v15, v16);
  if (a4)
  {
LABEL_3:
    objc_msgSend_setScope_(inited, v17, a4);
    objc_msgSend_scopedProxies(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v20, v21, (uint64_t)inited);

  }
LABEL_4:

  return inited;
}

- (void)_putBackProxyWithoutCheckingScope:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  id v30;

  v30 = a3;
  objc_msgSend_cachedProxies(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend_objectForKey_(v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_cachedProxies(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    v14 = objc_opt_class();
    objc_msgSend_setObject_forKey_(v12, v15, (uint64_t)v13, v14);

  }
  v16 = (void *)MEMORY[0x1D82649A4]();
  objc_msgSend_reset(v30, v17, v18);
  objc_autoreleasePoolPop(v16);
  objc_msgSend_cachedProxies(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  objc_msgSend_objectForKey_(v21, v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v24, v25, (uint64_t)v30);

  v28 = objc_msgSend_totalProxiesReclaimed(self, v26, v27);
  objc_msgSend_setTotalProxiesReclaimed_(self, v29, v28 + 1);

}

- (void)putBackAllProxiesWithScope:(int64_t)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t Index;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  uint8_t v26[16];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  int64_t v34;

  v5 = (void *)objc_opt_new();
  objc_msgSend_scopedProxies(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1D4BCC698;
  v32[3] = &unk_1E984B860;
  v34 = a3;
  v32[4] = self;
  v10 = v5;
  v33 = v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v11, (uint64_t)v32);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = sub_1D4BCC730;
  v27[3] = &unk_1E984B888;
  v27[4] = &v28;
  objc_msgSend_enumerateRangesUsingBlock_(v10, v12, (uint64_t)v27);
  v15 = v29[3];
  if (v15)
  {
    if (v15 == 1)
    {
      Index = objc_msgSend_lastIndex(v10, v13, v14);
      objc_msgSend_scopedProxies(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (Index + 1 == objc_msgSend_count(v19, v20, v21))
      {
        v22 = v29[3];

        if (v22 < 2)
          goto LABEL_11;
      }
      else
      {

      }
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_error_impl(&dword_1D4AFF000, v23, OS_LOG_TYPE_ERROR, "Proxies not put back in expected order. This may cause degraded performance if it happens too often.", v26, 2u);
    }
  }
LABEL_11:
  objc_msgSend_scopedProxies(self, v13, v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsAtIndexes_(v24, v25, (uint64_t)v10);

  _Block_object_dispose(&v28, 8);
}

- (id)debugDescription
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[5];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_cachedProxies(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  v12 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    objc_msgSend_appendFormat_(v3, v10, (uint64_t)CFSTR("Proxies by class:\n"));
    v13 = (void *)objc_opt_new();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend_cachedProxies(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyEnumerator(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v60, v64, 16);
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v61;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v61 != v24)
            objc_enumerationMutation(v19);
          objc_msgSend_addObject_(v13, v22, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v25++));
        }
        while (v23 != v25);
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v60, v64, 16);
      }
      while (v23);
    }

    objc_msgSend_sortedArrayUsingComparator_(v13, v26, (uint64_t)&unk_1E984B0C0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v12;
    v58[1] = 3221225472;
    v58[2] = sub_1D4BCCAC4;
    v58[3] = &unk_1E984B8D0;
    v58[4] = self;
    v59 = v3;
    objc_msgSend_enumerateObjectsUsingBlock_(v27, v28, (uint64_t)v58);

  }
  objc_msgSend_scopedProxies(self, v10, v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_count(v29, v30, v31);

  if (v32)
  {
    v35 = (void *)objc_opt_new();
    objc_msgSend_scopedProxies(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v12;
    v56[1] = 3221225472;
    v56[2] = sub_1D4BCCB50;
    v56[3] = &unk_1E984B8F8;
    v57 = v35;
    v39 = v35;
    objc_msgSend_enumerateObjectsUsingBlock_(v38, v40, (uint64_t)v56);

    objc_msgSend_appendFormat_(v3, v41, (uint64_t)CFSTR("Active proxies by scope:\n"));
    v54[0] = v12;
    v54[1] = 3221225472;
    v54[2] = sub_1D4BCCC28;
    v54[3] = &unk_1E984B920;
    v55 = v3;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v39, v42, (uint64_t)v54);

  }
  else if (!v9)
  {
    objc_msgSend_appendFormat_(v3, v33, (uint64_t)CFSTR("No proxies in cache\n"));
  }
  v43 = objc_msgSend_totalProxiesCreated(self, v33, v34);
  objc_msgSend_appendFormat_(v3, v44, (uint64_t)CFSTR("Total proxies created: %ld\n"), v43);
  v47 = objc_msgSend_totalProxiesReclaimed(self, v45, v46);
  objc_msgSend_appendFormat_(v3, v48, (uint64_t)CFSTR("Total proxies reclaimed: %ld\n"), v47);
  v51 = objc_msgSend_totalProxiesRetainedOutOfScope(self, v49, v50);
  objc_msgSend_appendFormat_(v3, v52, (uint64_t)CFSTR("Total proxies retained out of scope: %ld\n"), v51);
  return v3;
}

- (int64_t)totalProxiesCreated
{
  return self->_totalProxiesCreated;
}

- (void)setTotalProxiesCreated:(int64_t)a3
{
  self->_totalProxiesCreated = a3;
}

- (int64_t)totalProxiesReclaimed
{
  return self->_totalProxiesReclaimed;
}

- (void)setTotalProxiesReclaimed:(int64_t)a3
{
  self->_totalProxiesReclaimed = a3;
}

- (int64_t)totalProxiesRetainedOutOfScope
{
  return self->_totalProxiesRetainedOutOfScope;
}

- (void)setTotalProxiesRetainedOutOfScope:(int64_t)a3
{
  self->_totalProxiesRetainedOutOfScope = a3;
}

- (NSMapTable)cachedProxies
{
  return self->_cachedProxies;
}

- (void)setCachedProxies:(id)a3
{
  objc_storeStrong((id *)&self->_cachedProxies, a3);
}

- (NSMutableArray)scopedProxies
{
  return self->_scopedProxies;
}

- (void)setScopedProxies:(id)a3
{
  objc_storeStrong((id *)&self->_scopedProxies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedProxies, 0);
  objc_storeStrong((id *)&self->_cachedProxies, 0);
}

@end
