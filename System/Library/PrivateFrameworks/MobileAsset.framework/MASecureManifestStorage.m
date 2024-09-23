@implementation MASecureManifestStorage

- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5
{
  return -[MASecureManifestStorage _storeManifest:infoPlist:stage:error:](self, "_storeManifest:infoPlist:stage:error:", a3, a4, 0, a5);
}

- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5
{
  return -[MASecureManifestStorage _storeManifest:infoPlist:stage:error:](self, "_storeManifest:infoPlist:stage:error:", a3, a4, 1, a5);
}

- (BOOL)_storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  _QWORD v18[5];
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[MASecureManifestStorage _serviceConnectionWithError:](self, "_serviceConnectionWithError:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__4;
    v24 = __Block_byref_object_dispose__4;
    v25 = 0;
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke;
    v19[3] = &unk_1E5D5DFA0;
    v19[4] = self;
    v19[5] = &v20;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke_2;
    v18[3] = &unk_1E5D5DFC8;
    v18[4] = &v20;
    objc_msgSend(v15, "storeManifest:infoPlist:stage:completion:", v10, v11, v7, v18);

    if (a6)
      *a6 = objc_retainAutorelease((id)v21[5]);
    objc_msgSend(v13, "invalidate");
    v16 = v21[5] == 0;
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:underlyingError:", 1, a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)commitStagedManifestsForSelectors:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  MASecureManifestStorage *v19;
  id v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v19 = self;
  -[MASecureManifestStorage _serviceConnectionWithError:](self, "_serviceConnectionWithError:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = v21;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "assetType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "assetSpecifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v14);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v7);
    }

    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__4;
    v29 = __Block_byref_object_dispose__4;
    v30 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke;
    v24[3] = &unk_1E5D5DFA0;
    v24[4] = v19;
    v24[5] = &v25;
    objc_msgSend(v22, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke_2;
    v23[3] = &unk_1E5D5DFC8;
    v23[4] = &v25;
    objc_msgSend(v16, "commitStagedManifestsForSelectors:completion:", v5, v23);

    if (a4)
      *a4 = objc_retainAutorelease((id)v26[5]);
    objc_msgSend(v22, "invalidate");
    v17 = v26[5] == 0;
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:underlyingError:", 1, a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  -[MASecureManifestStorage _serviceConnectionWithError:](self, "_serviceConnectionWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__4;
    v22 = __Block_byref_object_dispose__4;
    v23 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke;
    v17[3] = &unk_1E5D5DFA0;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke_2;
    v16[3] = &unk_1E5D5DFC8;
    v16[4] = &v18;
    objc_msgSend(v13, "invalidateManifestForAssetType:specifier:completion:", v8, v9, v16);

    if (a5)
      *a5 = objc_retainAutorelease((id)v19[5]);
    objc_msgSend(v11, "invalidate");
    v14 = v19[5] == 0;
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:underlyingError:", 1, a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)manifestPathForAssetType:(id)a3 specifier:(id)a4
{
  return -[MASecureManifestStorage _manifestPathForAssetType:specifier:stage:](self, "_manifestPathForAssetType:specifier:stage:", a3, a4, 0);
}

- (id)stagedManifestPathForAssetType:(id)a3 specifier:(id)a4
{
  return -[MASecureManifestStorage _manifestPathForAssetType:specifier:stage:](self, "_manifestPathForAssetType:specifier:stage:", a3, a4, 1);
}

- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  getRepositoryPath(CFSTR("/private/var/MobileAsset/AssetsV2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("manifests"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("staged"));
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
  }
  normalizedAssetType((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  normalizedAssetType((uint64_t)v8, v21, v22, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "stringByAppendingPathComponent:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("SecureMobileAssetCryptex1Ticket.img4"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)_serviceConnectionWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.MobileAsset.ManifestStorageService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED9DFE0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);
  objc_msgSend(v5, "resume");
  if (v5)
  {
    v11 = v5;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MASecureManifestStorage _serviceConnectionWithError:]", CFSTR("Failed to connect to service"), v7, v8, v9, v10, v13);
    if (a3)
    {
      -[MASecureManifestStorage _errorWithCode:underlyingError:](self, "_errorWithCode:underlyingError:", 1, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ManifestStorageServiceErrorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
