@implementation FCAVAsset

- (FCAVAsset)init
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
    v8 = "-[FCAVAsset init]";
    v9 = 2080;
    v10 = "FCAVAsset.m";
    v11 = 1024;
    v12 = 52;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAVAsset init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)initWithIdentifier:(void *)a3 remoteURL:(void *)a4 assetCache:(void *)a5 assetKeyCache:(void *)a6 assetKeyManager:(void *)a7 assetResourceLoader:(void *)a8 overrideMIMEType:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  objc_super v35;

  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  if (a1)
  {
    v35.receiver = a1;
    v35.super_class = (Class)FCAVAsset;
    a1 = (id *)objc_msgSendSuper2(&v35, sel_init);
    if (a1)
    {
      v22 = objc_msgSend(v15, "copy");
      v23 = a1[2];
      a1[2] = (id)v22;

      objc_storeWeak(a1 + 5, v17);
      objc_storeWeak(a1 + 6, v18);
      objc_storeWeak(a1 + 8, v19);
      objc_storeWeak(a1 + 7, v20);
      v24 = (void *)MEMORY[0x1E0C99D80];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __120__FCAVAsset_initWithIdentifier_remoteURL_assetCache_assetKeyCache_assetKeyManager_assetResourceLoader_overrideMIMEType___block_invoke;
      v33[3] = &unk_1E463AA78;
      v34 = v21;
      objc_msgSend(v24, "fc_dictionary:", v33);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = a1[3];
      a1[3] = (id)v25;

      v27 = objc_alloc_init(MEMORY[0x1E0D60B18]);
      v28 = a1[4];
      a1[4] = v27;

      v29 = objc_msgSend(v16, "copy");
      v30 = a1[9];
      a1[9] = (id)v29;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObserver:selector:name:object:", a1, sel__resetUnderlyingAsset, *MEMORY[0x1E0C89738], 0);

    }
  }

  return a1;
}

void __120__FCAVAsset_initWithIdentifier_remoteURL_assetCache_assetKeyCache_assetKeyManager_assetResourceLoader_overrideMIMEType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *MEMORY[0x1E0C8AD80];
  v4 = a2;
  objc_msgSend(v4, "fc_safelySetObjectAllowingNil:forKey:", v2, v3);
  objc_msgSend(v4, "fc_safelySetObjectAllowingNil:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8ADA8]);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCAVAsset identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCAVAsset identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (AVURLAsset)asset
{
  NFUnfairLock *assetLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__79;
  v12 = __Block_byref_object_dispose__79;
  v13 = 0;
  if (self)
    assetLock = self->_assetLock;
  else
    assetLock = 0;
  v4 = assetLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __18__FCAVAsset_asset__block_invoke;
  v7[3] = &unk_1E463DF90;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (AVURLAsset *)v5;
}

void __18__FCAVAsset_asset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (!v3)
    goto LABEL_4;
  if (objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("duration"), 0) != 3)
    goto LABEL_17;
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v5 = 0;
    WeakRetained = 0;
  }
  else
  {
LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    v5 = *(void **)(a1 + 32);
  }
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "interestTokenForAssetIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)(v8 + 40));
    v10 = *(void **)(a1 + 32);
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedFileURLForAssetIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C8B3C0];
  v14 = *(_QWORD **)(a1 + 32);
  if (v12)
  {
    if (v14)
      v14 = (_QWORD *)v14[3];
    v15 = v14;
    objc_msgSend(v13, "URLAssetWithURL:options:", v12, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 8);
    *(_QWORD *)(v17 + 8) = v16;

    v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v19, "registerAVURLAssetForAutomaticKeyManagement:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    if (v14)
    {
      v20 = (void *)v14[9];
      v14 = (_QWORD *)v14[3];
    }
    else
    {
      v20 = 0;
    }
    v21 = v14;
    v22 = v20;
    objc_msgSend(v13, "URLAssetWithURL:options:", v22, v21);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 8);
    *(_QWORD *)(v24 + 8) = v23;

    v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v26, "registerAVURLAssetForAutomaticKeyManagement:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v19, "registerAVURLAssetForAutomaticResourceManagement:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }

  v27 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v27)
    objc_setAssociatedObject(v27, (const void *)FCAVURLAssetInterestTokenKey, v7, (void *)0x301);

LABEL_17:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__FCAVAsset_contentArchive__block_invoke;
  v5[3] = &unk_1E463AA30;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

void __27__FCAVAsset_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 40));
    v6 = *(void **)(a1 + 32);
  }
  else
  {
    v6 = 0;
    WeakRetained = 0;
  }
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentArchiveForAssetIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelyAddObject:", v8);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)(v9 + 40));
    v11 = *(void **)(a1 + 32);
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  objc_msgSend(v11, "identifier", (_QWORD)v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentKeyIdentifiersForAssetIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17);
        v19 = *(_QWORD *)(a1 + 32);
        if (v19)
          v20 = objc_loadWeakRetained((id *)(v19 + 48));
        else
          v20 = 0;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "assetKeyForURI:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "contentArchive");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObject:", v23);

        ++v17;
      }
      while (v15 != v17);
      v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v15 = v24;
    }
    while (v24);
  }

}

- (FCContentManifest)contentManifest
{
  FCContentManifest *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  FCContentManifest *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = [FCContentManifest alloc];
  -[FCAVAsset identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_assetCache);
  else
    WeakRetained = 0;
  -[FCAVAsset identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentKeyIdentifiersForAssetIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCContentManifest initWithAVAssetIDs:avAssetKeyIDs:](v3, "initWithAVAssetIDs:avAssetKeyIDs:", v5, v8);

  return v9;
}

- (uint64_t)isHLS
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = *(id *)(a1 + 72);
    objc_msgSend(v2, "pathExtension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("m3u")) & 1) != 0)
    {
      v1 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 72), "pathExtension");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v4, "isEqualToString:", CFSTR("m3u8"));

    }
  }
  return v1;
}

- (void)_resetUnderlyingAsset
{
  NFUnfairLock *assetLock;
  _QWORD v3[5];

  if (self)
    assetLock = self->_assetLock;
  else
    assetLock = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__FCAVAsset__resetUnderlyingAsset__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[NFUnfairLock performWithLockSync:](assetLock, "performWithLockSync:", v3);
}

void __34__FCAVAsset__resetUnderlyingAsset__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_destroyWeak((id *)&self->_assetKeyManager);
  objc_destroyWeak((id *)&self->_assetResourceLoader);
  objc_destroyWeak((id *)&self->_assetKeyCache);
  objc_destroyWeak((id *)&self->_assetCache);
  objc_storeStrong((id *)&self->_assetLock, 0);
  objc_storeStrong((id *)&self->_assetOptions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
