@implementation CKDIdentityCache

+ (CKDIdentityCache)cacheWithDeviceContext:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend_deviceScopedDatabase(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableGroupInDatabase_withName_error_(a1, v5, (uint64_t)v4, CFSTR("IdentityCache"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDIdentityCache *)v6;
}

- (id)createTables:(id *)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  CKDIdentityCacheTable *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicIdentitiesExpirationTimeout(v3, v4, v5);
  v7 = v6;

  v8 = [CKDIdentityCacheTable alloc];
  v10 = (void *)objc_msgSend_initWithLogicalTableName_entryCountLimit_dataSizeLimit_expirationTime_expireDelay_(v8, v9, (uint64_t)CFSTR("cache"), 0, 0, v7, 60.0);
  v14[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)cache
{
  return (id)objc_msgSend_tableWithName_(self, a2, (uint64_t)CFSTR("cache"));
}

- (id)cachedIdentityForLookupInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_cache(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedIdentityForLookupInfo_container_(v10, v11, (uint64_t)v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)removeCachedValueForLookupInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend_cache(self, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteUserIdentityForLookupInfo_container_(v11, v10, (uint64_t)v7, v6);

}

- (void)cacheUserIdentity:(id)a3 forLookupInfo:(id)a4 container:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  id v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_cache(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  if (v20)
  {
    objc_msgSend_insertUserIdentity_forLookupInfo_container_(v12, v13, (uint64_t)v20, v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && objc_msgSend_CKIsUniqueConstraintError_(MEMORY[0x1E0CB35C8], v15, (uint64_t)v16))
    {
      objc_msgSend_deleteUserIdentityForLookupInfo_container_(v14, v17, (uint64_t)v8, v9);
      v19 = (id)objc_msgSend_insertUserIdentity_forLookupInfo_container_(v14, v18, (uint64_t)v20, v8, v9);
    }

  }
  else
  {
    objc_msgSend_deleteUserIdentityForLookupInfo_container_(v12, v13, (uint64_t)v8, v9);
  }

}

@end
