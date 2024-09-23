@implementation NSData(CPLSyncAnchorDescription)

- (id)cplSyncAnchorSimpleDescription
{
  _QWORD *v1;
  id v2;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15533;
  v13 = __Block_byref_object_dispose__15534;
  v14 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __66__NSData_CPLSyncAnchorDescription__cplSyncAnchorSimpleDescription__block_invoke;
  v6 = &unk_1E60D64C8;
  v7 = a1;
  v8 = &v9;
  v1 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&anchorLock);
  v5((uint64_t)v1);
  os_unfair_lock_unlock((os_unfair_lock_t)&anchorLock);

  v2 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v2;
}

- (id)cplSyncAnchorDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "cplSyncAnchorSimpleDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ [%@]>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cplQueryCursorSimpleDescription
{
  _QWORD *v1;
  id v2;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15533;
  v13 = __Block_byref_object_dispose__15534;
  v14 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __67__NSData_CPLSyncAnchorDescription__cplQueryCursorSimpleDescription__block_invoke;
  v6 = &unk_1E60D64C8;
  v7 = a1;
  v8 = &v9;
  v1 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&anchorLock);
  v5((uint64_t)v1);
  os_unfair_lock_unlock((os_unfair_lock_t)&anchorLock);

  v2 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v2;
}

- (id)cplQueryCursorDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "cplQueryCursorSimpleDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ [%@]>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
