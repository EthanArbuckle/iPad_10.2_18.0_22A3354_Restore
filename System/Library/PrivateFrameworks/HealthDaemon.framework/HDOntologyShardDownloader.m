@implementation HDOntologyShardDownloader

- (HDOntologyShardDownloader)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDOntologyShardDownloader)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4;
  HDOntologyShardDownloader *v5;
  HDOntologyShardDownloader *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HDOntologyShardDownloaderObserver *ontologyShardDownloaderObservers;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDOntologyShardDownloader;
  v5 = -[HDOntologyShardDownloader init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(MEMORY[0x1E0CB6988]);
    NSStringFromProtocol((Protocol *)&unk_1EF1E8600);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogHealthOntology();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithName:loggingCategory:", v10, v11);
    ontologyShardDownloaderObservers = v6->_ontologyShardDownloaderObservers;
    v6->_ontologyShardDownloaderObservers = (HDOntologyShardDownloaderObserver *)v12;

  }
  return v6;
}

- (void)downloadRequiredShardFilesWithSession:(id)a3 completion:(id)a4
{
  -[HDOntologyShardDownloader _downloadRequiredShardFilesWithSession:requiredEntries:completion:]((uint64_t)self, a3, 0, a4);
}

- (void)_downloadRequiredShardFilesWithSession:(void *)a3 requiredEntries:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[3];
  _QWORD v41[4];

  v41[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (a1)
  {
    if (v8)
    {
      v38 = 0;
      v11 = (id *)&v38;
      -[HDOntologyShardDownloader _entriesToDownloadWithRequiredEntries:error:](a1, v8, (uint64_t)&v38);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
      v36 = v7;
      v37 = 0;
      v32 = (void *)MEMORY[0x1E0D29840];
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("desired_state"), &unk_1E6DFD5C8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v34;
      objc_msgSend(MEMORY[0x1E0D29880], "isNotNullPredicateWithProperty:", CFSTR("available_url"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v13;
      v14 = (void *)MEMORY[0x1E0D29840];
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("available_state"), &unk_1E6DFD5E0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v15;
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("available_state"), &unk_1E6DFD5F8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v16;
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanOrEqualToValue:", CFSTR("current_version"), &unk_1E6DFD610);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predicateMatchingAnyPredicates:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "predicateMatchingAllPredicates:", v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("current_version"), objc_opt_class(), 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v21;
      objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("desired_state_date"), objc_opt_class(), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(WeakRetained, "shardRegistry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "entriesWithPredicate:orderingTerms:error:", v33, v23, &v37);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[HDOntologyShardDownloader _entriesToDownloadWithRequiredEntries:error:](a1, v26, (uint64_t)&v37);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

      v11 = (id *)&v37;
      v10 = v35;
      v7 = v36;
    }
    v27 = *v11;
    if (v12)
    {
      v28 = v10;
      v29 = v7;
      v30 = v12;
      v31 = -[_HDOntologyDownloadTask initForDownloader:session:queue:]([_HDOntologyDownloadTask alloc], "initForDownloader:session:queue:", a1, v29, *(_QWORD *)(a1 + 8));

      objc_msgSend(v31, "downloadShardsForEntries:completion:", v30, v28);
    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v27);
    }

  }
}

- (void)downloadRequiredShardFilesWithSession:(id)a3 requiredEntries:(id)a4 completion:(id)a5
{
  -[HDOntologyShardDownloader _downloadRequiredShardFilesWithSession:requiredEntries:completion:]((uint64_t)self, a3, a4, a5);
}

- (id)_entriesToDownloadWithRequiredEntries:(uint64_t)a3 error:
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, void *);
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  BOOL (*v26)(uint64_t, void *);
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  objc_msgSend(WeakRetained, "shardRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stagedShardFileEntriesWithError:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v31 = 0;
    goto LABEL_21;
  }
  v34 = a1;
  v35 = a3;
  v37 = v5;
  v9 = v5;
  v36 = v8;
  v10 = v8;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v13)
    goto LABEL_16;
  v14 = v13;
  v15 = *(_QWORD *)v42;
  v16 = MEMORY[0x1E0C809B0];
  v17 = __94__HDOntologyShardDownloader__entriesToDownloadForRequiredEntries_existingStagedEntries_error___block_invoke;
  v18 = &unk_1E6CE9D08;
  do
  {
    v19 = 0;
    v38 = v14;
    do
    {
      if (*(_QWORD *)v42 != v15)
        objc_enumerationMutation(v12);
      v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v19);
      v40[0] = v16;
      v40[1] = 3221225472;
      v40[2] = v17;
      v40[3] = v18;
      v40[4] = v20;
      if (objc_msgSend(v10, "hk_containsObjectPassingTest:", v40))
      {
        if (objc_msgSend(v20, "availableState") == 2)
          goto LABEL_14;
        v21 = (id)objc_msgSend(v20, "copyWithAvailableState:", 2);
        v22 = v39;
      }
      else
      {
        v21 = v20;
        if (objc_msgSend(v21, "availableState") == 2)
        {
          v23 = v15;
          v24 = v10;
          v25 = v18;
          v26 = v17;
          v27 = v16;
          v28 = v12;
          v29 = v11;
          v30 = objc_msgSend(v21, "copyWithAvailableState:", 1);

          objc_msgSend(v39, "addObject:", v30);
          v21 = (id)v30;
          v11 = v29;
          v12 = v28;
          v16 = v27;
          v17 = v26;
          v18 = v25;
          v10 = v24;
          v15 = v23;
          v14 = v38;
        }
        v22 = v11;
      }
      objc_msgSend(v22, "addObject:", v21);

LABEL_14:
      ++v19;
    }
    while (v14 != v19);
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v14);
LABEL_16:

  if (-[HDOntologyShardDownloader _persistStagedEntries:error:](v34, v39, v35))
    v31 = v11;
  else
    v31 = 0;
  v32 = v11;
  v5 = v37;

  v8 = v36;
LABEL_21:

  return v31;
}

- (void)addOntologyShardDownloaderObserver:(id)a3 queue:(id)a4
{
  -[HDOntologyShardDownloaderObserver registerObserver:queue:](self->_ontologyShardDownloaderObservers, "registerObserver:queue:", a3, a4);
}

- (void)removeOntologyShardDownloaderObserver:(id)a3
{
  -[HDOntologyShardDownloaderObserver unregisterObserver:](self->_ontologyShardDownloaderObservers, "unregisterObserver:", a3);
}

BOOL __94__HDOntologyShardDownloader__entriesToDownloadForRequiredEntries_existingStagedEntries_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    objc_msgSend(v6, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v15 = 0;
      goto LABEL_23;
    }
    v2 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", v3))
    {
      v15 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v20 = v3;
    v21 = v10;
  }
  objc_msgSend(*(id *)(a1 + 32), "schemaType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schemaType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v12)
    goto LABEL_10;
  objc_msgSend(v6, "schemaType");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_16;
  v4 = (void *)v13;
  objc_msgSend(*(id *)(a1 + 32), "schemaType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schemaType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", v3))
  {
    v19 = v14;
LABEL_10:
    v16 = objc_msgSend(*(id *)(a1 + 32), "schemaVersion");
    if (v16 == objc_msgSend(v6, "schemaVersion"))
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "availableVersion");
      v15 = v17 == objc_msgSend(v6, "availableVersion");
      v14 = v19;
      if (v11 == v12)
        goto LABEL_20;
      goto LABEL_18;
    }
    if (v11 == v12)
    {
      v15 = 0;
      goto LABEL_20;
    }

LABEL_16:
    v15 = 0;
    goto LABEL_21;
  }
  v15 = 0;
LABEL_18:

LABEL_20:
LABEL_21:
  v3 = v20;
  v10 = v21;
  if (v7 != v8)
    goto LABEL_22;
LABEL_23:

  return v15;
}

- (uint64_t)_persistStagedEntries:(uint64_t)a3 error:
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v5 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(WeakRetained, "shardRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "insertEntries:error:", v5, a3);

    if (v8)
    {
      v9 = v5;
      v10 = *(void **)(a1 + 16);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __72__HDOntologyShardDownloader__notifyDownloadObserversAboutStagedEntries___block_invoke;
      v13[3] = &unk_1E6CFBF88;
      v11 = v9;
      v14 = v11;
      v15 = a1;
      objc_msgSend(v10, "notifyObservers:", v13);

      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __72__HDOntologyShardDownloader__notifyDownloadObserversAboutStagedEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "ontologyShardDownloader:didStageEntry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  return (HDOntologyUpdateCoordinator *)objc_loadWeakRetained((id *)&self->_updateCoordinator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
  objc_storeStrong((id *)&self->_ontologyShardDownloaderObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
