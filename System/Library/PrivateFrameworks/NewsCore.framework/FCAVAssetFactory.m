@implementation FCAVAssetFactory

- (id)initWithAssetCache:(void *)a3 assetKeyCache:(void *)a4 assetKeyManager:(void *)a5 assetResourceLoader:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  objc_super v20;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)FCAVAssetFactory;
    v14 = (id *)objc_msgSendSuper2(&v20, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      +[FCMapTable strongToWeakObjectsMapTable](FCMapTable, "strongToWeakObjectsMapTable");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = a1[5];
      a1[5] = (id)v15;

      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
      v18 = a1[6];
      a1[6] = (id)v17;

    }
  }

  return a1;
}

- (FCAVAssetFactory)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAVAssetFactory init]";
    v9 = 2080;
    v10 = "FCAVAssetFactory.m";
    v11 = 1024;
    v12 = 32;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAVAssetFactory init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)assetWithIdentifier:(id)a3 remoteURL:(id)a4 overrideMIMEType:(id)a5
{
  id v8;
  id v9;
  id v10;
  NFUnfairLock *assetsLock;
  NFUnfairLock *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__89;
  v27 = __Block_byref_object_dispose__89;
  v28 = 0;
  if (self)
    assetsLock = self->_assetsLock;
  else
    assetsLock = 0;
  v12 = assetsLock;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__FCAVAssetFactory_assetWithIdentifier_remoteURL_overrideMIMEType___block_invoke;
  v18[3] = &unk_1E464B278;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  v22 = &v23;
  v14 = v9;
  v20 = v14;
  v15 = v10;
  v21 = v15;
  -[NFUnfairLock performWithLockSync:](v12, "performWithLockSync:", v18);

  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __67__FCAVAssetFactory_assetWithIdentifier_remoteURL_overrideMIMEType___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  FCAVAsset *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id obj;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[5];
  v3 = a1[5];
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), obj);
  }
  else
  {
    v5 = [FCAVAsset alloc];
    v7 = (void *)a1[5];
    v6 = (void *)a1[6];
    v8 = (_QWORD *)a1[4];
    if (v8)
    {
      v9 = (void *)v8[1];
      v10 = (void *)v8[2];
      v11 = (void *)v8[3];
      v12 = (void *)v8[4];
    }
    else
    {
      v11 = 0;
      v9 = 0;
      v10 = 0;
      v12 = 0;
    }
    v13 = (void *)a1[7];
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v17 = v12;
    v18 = -[FCAVAsset initWithIdentifier:remoteURL:assetCache:assetKeyCache:assetKeyManager:assetResourceLoader:overrideMIMEType:]((id *)&v5->super.isa, v7, v6, v14, v15, v16, v17, v13);
    v19 = *(_QWORD *)(a1[8] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    v21 = a1[4];
    if (v21)
      v22 = *(void **)(v21 + 40);
    else
      v22 = 0;
    objc_msgSend(v22, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), a1[5]);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsLock, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetResourceLoader, 0);
  objc_storeStrong((id *)&self->_assetKeyManager, 0);
  objc_storeStrong((id *)&self->_assetKeyCache, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
}

@end
