@implementation ICCoreDataDataSource

- (ICCoreDataIndexer)indexer
{
  return self->_indexer;
}

void __92__ICCoreDataDataSource_needsReindexWithCollectionDifference_controller_identifiersToReload___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "parentModificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "lastReindexParentModificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 > 0.0)
  {
    objc_msgSend(v9, "parentModificationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setLastReindexParentModificationDate:", v8);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __92__ICCoreDataDataSource_needsReindexWithCollectionDifference_controller_identifiersToReload___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v21 = a2;
  objc_msgSend(v21, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v21, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ic_isModernFolderType");

    if (!v8)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __92__ICCoreDataDataSource_needsReindexWithCollectionDifference_controller_identifiersToReload___block_invoke_2;
    v22[3] = &unk_1E5C1F0C0;
    v23 = *(id *)(a1 + 32);
    v10 = v21;
    v11 = *(_QWORD *)(a1 + 40);
    v24 = v10;
    v25 = v11;
    v26 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v9, "performBlockAndWait:", v22);

    v6 = v23;
  }

LABEL_5:
  v12 = objc_msgSend(v21, "index");
  if (v12 != objc_msgSend(v21, "associatedIndex"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "collectionViewDiffableDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "snapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "object");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", v16);

  v18 = v21;
  if (v17)
  {
    v19 = *(void **)(a1 + 48);
    objc_msgSend(v21, "object");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

LABEL_9:
    v18 = v21;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

}

- (NSDate)lastReindexParentModificationDate
{
  return self->_lastReindexParentModificationDate;
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_37(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
          objc_msgSend(WeakRetained, "collectionViewDiffableDataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "indexPathForItemIdentifier:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(WeakRetained, "collectionView");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v10, 0, 0);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v5);
    }

    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AC7A1000, v12, OS_LOG_TYPE_INFO, "Snaphot(s) fully applied", v18, 2u);
    }

    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("ICDataSourceDataUpdateDidRenderNotification"), WeakRetained);

    v15 = *(id *)(a1 + 40);
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 64);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)v18 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v16, OS_SIGNPOST_INTERVAL_END, v17, "com.apple.notes.datasource.applySnapshots", ", v18, 2u);
    }

  }
}

void __78__ICCoreDataDataSource_reloadDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "indexer");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)reloadDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  -[ICCoreDataDataSource indexer](self, "indexer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__ICCoreDataDataSource_reloadDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke;
  v13[3] = &unk_1E5C1F048;
  v13[4] = self;
  v14 = v8;
  v16 = a3;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "reloadData:", v13);

}

- (void)applySnapshotAnimated:(BOOL)a3 dataRenderedBlock:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  void (**v53)(_QWORD);
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  id *v65;
  _BOOL4 v66;
  void (**v67)(void);
  id obj;
  uint64_t v69;
  void *v70;
  void *v71;
  _QWORD block[4];
  NSObject *v73;
  void (**v74)(void);
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t);
  void *v78;
  ICCoreDataDataSource *v79;
  _QWORD v80[4];
  void (**v81)(_QWORD);
  _QWORD v82[4];
  id v83;
  NSObject *v84;
  id v85;
  ICCoreDataDataSource *v86;
  BOOL v87;
  _QWORD v88[5];
  _QWORD v89[5];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD aBlock[4];
  id v99;
  NSObject *v100;
  id v101;
  id v102[2];
  id location;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t buf[4];
  uint64_t v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v66 = a3;
  v113 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICCoreDataDataSource applySnapshotAnimated:dataRenderedBlock:]", 1, 0, CFSTR("Unexpected call from background thread"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  -[ICDataSource collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v105 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i);
        -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "itemIdentifierForIndexPath:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "ic_addNonNilObject:", v14);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
    }
    while (v9);
  }

  v15 = os_log_create("com.apple.notes", "PointsOfInterest");
  v16 = (char *)os_signpost_id_generate(v15);
  v17 = v15;
  v18 = v17;
  if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v16, "com.apple.notes.datasource.applySnapshots", ", buf, 2u);
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke;
  aBlock[3] = &unk_1E5C1F110;
  objc_copyWeak(v102, &location);
  v61 = v6;
  v99 = v61;
  v59 = v5;
  v101 = v59;
  v63 = v18;
  v100 = v63;
  v102[1] = v16;
  v67 = (void (**)(void))_Block_copy(aBlock);
  -[ICDataSource sectionTypes](self, "sectionTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v59, v61, v63, v102);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    -[ICDataSource sectionTypes](self, "sectionTypes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
    if (v22)
    {
      obj = v21;
      v69 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v95 != v69)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
          v25 = objc_msgSend(v24, "unsignedIntegerValue");
          -[ICCoreDataDataSource indexer](self, "indexer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCoreDataDataSource applySnapshotLegacyManagedObjectContext](self, "applySnapshotLegacyManagedObjectContext");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCoreDataDataSource applySnapshotModernManagedObjectContext](self, "applySnapshotModernManagedObjectContext");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "sectionSnapshotsForSectionType:legacyManagedObjectContext:modernManagedObjectContext:", v25, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "addEntriesFromDictionary:", v29);
          -[ICCoreDataDataSource indexer](self, "indexer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "sectionIdentifiersForSectionType:", v25);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v71, "addObjectsFromArray:", v31);
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v32 = v31;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v91;
            do
            {
              for (k = 0; k != v33; ++k)
              {
                if (*(_QWORD *)v91 != v34)
                  objc_enumerationMutation(v32);
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * k));
              }
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
            }
            while (v33);
          }

        }
        v21 = obj;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
      }
      while (v22);
    }

    v36 = dispatch_group_create();
    -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "snapshot");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_group_enter(v36);
    objc_msgSend(v38, "ic_updateWithSectionIdentifiers:", v71);
    v39 = os_log_create("com.apple.notes", "UI");
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
    if (v66)
    {
      if (v40)
      {
        v41 = objc_msgSend(v38, "numberOfSections");
        *(_DWORD *)buf = 134217984;
        v109 = v41;
        _os_log_impl(&dword_1AC7A1000, v39, OS_LOG_TYPE_INFO, "Applying top-level snapshot animated with %ld sections", buf, 0xCu);
      }

      -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_33;
      v89[3] = &unk_1E5C1D540;
      v43 = v89;
      v89[4] = v36;
      objc_msgSend(v42, "applySnapshot:animatingDifferences:completion:", v38, 1, v89);
    }
    else
    {
      if (v40)
      {
        v50 = objc_msgSend(v38, "numberOfSections");
        *(_DWORD *)buf = 134217984;
        v109 = v50;
        _os_log_impl(&dword_1AC7A1000, v39, OS_LOG_TYPE_INFO, "Applying top-level snapshot using reloadData with %ld sections", buf, 0xCu);
      }

      -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_34;
      v88[3] = &unk_1E5C1D540;
      v43 = v88;
      v88[4] = v36;
      objc_msgSend(v42, "applySnapshotUsingReloadData:completion:", v38, v88);
    }

    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2_35;
    v82[3] = &unk_1E5C1F160;
    v51 = v71;
    v83 = v51;
    v52 = v36;
    v84 = v52;
    v48 = v70;
    v85 = v48;
    v86 = self;
    v87 = v66;
    v53 = (void (**)(_QWORD))_Block_copy(v82);
    v54 = os_log_create("com.apple.notes", "UI");
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);
    if (v66)
    {
      if (v55)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC7A1000, v54, OS_LOG_TYPE_INFO, "Applying section snapshots", buf, 2u);
      }

      v53[2](v53);
    }
    else
    {
      if (v55)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC7A1000, v54, OS_LOG_TYPE_INFO, "Applying section snapshots using _performBatchApplyUsingReloadData", buf, 2u);
      }

      -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_38;
      v80[3] = &unk_1E5C1DB38;
      v81 = v53;
      objc_msgSend(v56, "_performBatchApplyUsingReloadData:", v80);

    }
    v75 = MEMORY[0x1E0C809B0];
    v76 = 3221225472;
    v77 = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_39;
    v78 = &unk_1E5C1D540;
    v79 = self;
    performBlockOnMainThread();
    -[ICCoreDataDataSource applySnapshotCompletionQueue](self, "applySnapshotCompletionQueue");
    v57 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2_40;
    block[3] = &unk_1E5C1D718;
    v73 = v52;
    v74 = v67;
    v58 = v52;
    dispatch_async(v57, block);

  }
  else
  {
    -[ICDataSource collectionView](self, "collectionView", v59, v61, v63, v102);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      v67[2]();
      goto LABEL_46;
    }
    -[ICCoreDataDataSource indexer](self, "indexer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCoreDataDataSource applySnapshotLegacyManagedObjectContext](self, "applySnapshotLegacyManagedObjectContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCoreDataDataSource applySnapshotModernManagedObjectContext](self, "applySnapshotModernManagedObjectContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (id)objc_msgSend(v45, "newSnapshotFromIndexWithLegacyManagedObjectContext:modernManagedObjectContext:", v46, v47);

    -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "applySnapshot:animatingDifferences:completion:", v48, v66, v67);

    performBlockOnMainThread();
  }

LABEL_46:
  objc_destroyWeak(v65);
  objc_destroyWeak(&location);

}

- (NSManagedObjectContext)applySnapshotModernManagedObjectContext
{
  return self->_applySnapshotModernManagedObjectContext;
}

- (NSManagedObjectContext)applySnapshotLegacyManagedObjectContext
{
  return self->_applySnapshotLegacyManagedObjectContext;
}

- (OS_dispatch_queue)applySnapshotCompletionQueue
{
  return self->_applySnapshotCompletionQueue;
}

- (void)indexer:(id)a3 didChangeContentWithDifference:(id)a4 controller:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v7 = a4;
  v8 = a5;
  if (!-[ICCoreDataDataSource suspendsUpdates](self, "suspendsUpdates")
    && !-[ICDataSource isTogglingLock](self, "isTogglingLock"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICCoreDataDataSource needsReindexWithCollectionDifference:controller:identifiersToReload:](self, "needsReindexWithCollectionDifference:controller:identifiersToReload:", v7, v8, v9))
    {
      -[ICCoreDataDataSource reindexDelayer](self, "reindexDelayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestFire");

    }
    else if (objc_msgSend(v9, "count"))
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__ICCoreDataDataSource_indexer_didChangeContentWithDifference_controller___block_invoke;
      block[3] = &unk_1E5C1F098;
      objc_copyWeak(&v13, &location);
      v12 = v9;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
}

- (BOOL)suspendsUpdates
{
  return self->_suspendsUpdates;
}

- (BOOL)needsReindexWithCollectionDifference:(id)a3 controller:(id)a4 identifiersToReload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  ICCoreDataDataSource *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(v8, "insertions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__ICCoreDataDataSource_needsReindexWithCollectionDifference_controller_identifiersToReload___block_invoke;
  v17[3] = &unk_1E5C1F0E8;
  v14 = v9;
  v18 = v14;
  v19 = self;
  v21 = &v22;
  v15 = v10;
  v20 = v15;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
  LOBYTE(v10) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)v10;
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_34(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __78__ICCoreDataDataSource_reloadDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySnapshotAnimated:dataRenderedBlock:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2_35(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id obj;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v33 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          switch(objc_msgSend(*(id *)(a1 + 56), "autoExpandMode"))
          {
            case 0:
              +[ICExpansionState sharedExpansionState](ICExpansionState, "sharedExpansionState");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 56), "indexer");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "expansionStateContext");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "expandedObjectIDsInContext:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            case 1:
              v12 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(*(id *)(a1 + 56), "collectionViewDiffableDataSource");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "snapshot");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "sectionIdentifiers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setWithArray:", v14);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            case 2:
              objc_msgSend(v7, "items");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = (void *)objc_msgSend(v15, "mutableCopy");

              objc_msgSend(*(id *)(a1 + 56), "collectionViewDiffableDataSource");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "snapshot");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "sectionIdentifiers");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "removeObjectsInArray:", v18);

              goto LABEL_13;
            case 3:
              objc_msgSend(v7, "items");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = (void *)objc_msgSend(v16, "mutableCopy");
LABEL_13:

              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

              if (v11)
              {
                v30[0] = MEMORY[0x1E0C809B0];
                v30[1] = 3221225472;
                v30[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_3;
                v30[3] = &unk_1E5C1F138;
                v19 = v7;
                v31 = v19;
                objc_msgSend(v11, "objectsPassingTest:", v30);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "allObjects");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "expandItems:", v21);

              }
              break;
            default:
              break;
          }
          v22 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v7, "items");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");
            *(_DWORD *)buf = 134217984;
            v37 = v24;
            _os_log_impl(&dword_1AC7A1000, v22, OS_LOG_TYPE_INFO, "Applying section snapshot with %ld items", buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 56), "collectionViewDiffableDataSource");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(unsigned __int8 *)(a1 + 64);
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_37;
          v28[3] = &unk_1E5C1D540;
          v29 = *(id *)(a1 + 40);
          objc_msgSend(v25, "applySnapshot:toSection:animatingDifferences:completion:", v7, v6, v26, v28);

        }
        else
        {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v3);
  }

}

- (unint64_t)autoExpandMode
{
  return self->_autoExpandMode;
}

- (void)applicationWillEnterForeground:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICCoreDataDataSource;
  -[ICDataSource applicationWillEnterForeground:](&v4, sel_applicationWillEnterForeground_, a3);
  if (!-[ICCoreDataDataSource ignoreEnterForeground](self, "ignoreEnterForeground"))
    -[ICDataSource reloadDataAnimated:](self, "reloadDataAnimated:", 1);
  -[ICCoreDataDataSource setIgnoreEnterForeground:](self, "setIgnoreEnterForeground:", 0);
}

- (void)setIgnoreEnterForeground:(BOOL)a3
{
  self->_ignoreEnterForeground = a3;
}

- (BOOL)ignoreEnterForeground
{
  return self->_ignoreEnterForeground;
}

- (void)setApplySnapshotModernManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_applySnapshotModernManagedObjectContext, a3);
}

- (ICCoreDataDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5
{
  id v9;
  ICCoreDataDataSource *v10;
  ICCoreDataDataSource *v11;
  uint64_t v12;
  NSManagedObjectContext *applySnapshotLegacyManagedObjectContext;
  uint64_t v14;
  NSManagedObjectContext *applySnapshotModernManagedObjectContext;
  uint64_t v16;
  ICSelectorDelayer *reindexDelayer;
  uint64_t v18;
  NSDate *lastReindexParentModificationDate;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *expansionStateCompletionQueue;
  dispatch_queue_t v24;
  OS_dispatch_queue *applySnapshotCompletionQueue;
  void *v26;
  objc_super v28;

  v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)ICCoreDataDataSource;
  v10 = -[ICDataSource initWithCollectionView:cellProvider:](&v28, sel_initWithCollectionView_cellProvider_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_indexer, a5);
    -[ICCoreDataIndexer setDelegate:](v11->_indexer, "setDelegate:", v11);
    objc_msgSend(v9, "legacyManagedObjectContext");
    v12 = objc_claimAutoreleasedReturnValue();
    applySnapshotLegacyManagedObjectContext = v11->_applySnapshotLegacyManagedObjectContext;
    v11->_applySnapshotLegacyManagedObjectContext = (NSManagedObjectContext *)v12;

    objc_msgSend(v9, "modernManagedObjectContext");
    v14 = objc_claimAutoreleasedReturnValue();
    applySnapshotModernManagedObjectContext = v11->_applySnapshotModernManagedObjectContext;
    v11->_applySnapshotModernManagedObjectContext = (NSManagedObjectContext *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v11, sel_reindexAndApplySnapshot, 1, 0, 0.1);
    reindexDelayer = v11->_reindexDelayer;
    v11->_reindexDelayer = (ICSelectorDelayer *)v16;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v18 = objc_claimAutoreleasedReturnValue();
    lastReindexParentModificationDate = v11->_lastReindexParentModificationDate;
    v11->_lastReindexParentModificationDate = (NSDate *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = dispatch_queue_create("com.apple.notes.expansion-state-completion-queue", v21);
    expansionStateCompletionQueue = v11->_expansionStateCompletionQueue;
    v11->_expansionStateCompletionQueue = (OS_dispatch_queue *)v22;

    v24 = dispatch_queue_create("com.apple.notes.apply-snapshot-completion-queue", v21);
    applySnapshotCompletionQueue = v11->_applySnapshotCompletionQueue;
    v11->_applySnapshotCompletionQueue = (OS_dispatch_queue *)v24;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v11, sel_managedObjectContextUpdaterDidMerge_, *MEMORY[0x1E0D640C0], 0);

  }
  return v11;
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5[2];

  objc_copyWeak(v5, a1 + 7);
  v2 = a1[4];
  v4 = a1[6];
  v3 = a1[5];
  v5[1] = a1[8];
  performBlockOnMainThreadAndWait();

  objc_destroyWeak(v5);
}

- (id)firstRelevantItemIdentifier
{
  void *v2;
  void *v3;

  -[ICCoreDataDataSource indexer](self, "indexer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstRelevantItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAutoExpandMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (self->_autoExpandMode != a3)
  {
    self->_autoExpandMode = a3;
    -[ICCoreDataDataSource indexer](self, "indexer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCoreDataDataSource applySnapshotLegacyManagedObjectContext](self, "applySnapshotLegacyManagedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCoreDataDataSource applySnapshotModernManagedObjectContext](self, "applySnapshotModernManagedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "newSnapshotFromIndexWithLegacyManagedObjectContext:modernManagedObjectContext:", v6, v7);
    objc_msgSend(v8, "itemIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!a3)
    {
      +[ICExpansionState sharedExpansionState](ICExpansionState, "sharedExpansionState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCoreDataDataSource indexer](self, "indexer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "expansionStateContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "expandedObjectIDsInContext:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObjectsInArray:", v14);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "snapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sectionIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17;
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "snapshotForSection:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v25, "items");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setWithArray:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          switch(a3)
          {
            case 0uLL:
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "intersectSet:", v29);

              objc_msgSend(v28, "allObjects");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "collapseItems:", v30);
              goto LABEL_15;
            case 1uLL:
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "minusSet:", v31);
              goto LABEL_13;
            case 2uLL:
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "intersectSet:", v31);
LABEL_13:

              goto LABEL_14;
            case 3uLL:
LABEL_14:
              objc_msgSend(v28, "allObjects");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "expandItems:", v30);
LABEL_15:

              break;
            default:
              break;
          }
          -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "applySnapshot:toSection:animatingDifferences:", v25, v23, 1);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v20);
    }

  }
}

void __78__ICCoreDataDataSource_reloadDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v3 = *(id *)(a1 + 40);
  performBlockOnMainThread();
  v2 = *(id *)(a1 + 48);
  performBlockOnMainThreadAndWait();

}

void __74__ICCoreDataDataSource_indexer_didChangeContentWithDifference_controller___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)MEMORY[0x1E0C99E60];
    v14 = WeakRetained;
    objc_msgSend(WeakRetained, "collectionViewDiffableDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intersectSet:", v9);

    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v3 = v14;
    if (v10)
    {
      objc_msgSend(v14, "collectionViewDiffableDataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "snapshot");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reloadItemsWithIdentifiers:", v13);

      v3 = v14;
    }
  }

}

- (void)reindexDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id location;

  v8 = a4;
  v9 = a5;
  if (-[ICCoreDataDataSource suspendsUpdates](self, "suspendsUpdates"))
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICCoreDataDataSource reindexDataAnimated:dataIndexedBlock:dataRenderedBlock:].cold.1(v10);

  }
  else
  {
    objc_initWeak(&location, self);
    -[ICCoreDataDataSource indexer](self, "indexer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__ICCoreDataDataSource_reindexDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke;
    v12[3] = &unk_1E5C1F070;
    v13 = v8;
    objc_copyWeak(&v15, &location);
    v16 = a3;
    v14 = v9;
    objc_msgSend(v11, "indexObjectsWithCompletion:", v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __79__ICCoreDataDataSource_reindexDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  char v6;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __79__ICCoreDataDataSource_reindexDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke_2;
  v2[3] = &unk_1E5C1F070;
  v3 = *(id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v6 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  dispatch_sync(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v5);
}

void __79__ICCoreDataDataSource_reindexDataAnimated_dataIndexedBlock_dataRenderedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "indexer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "applySnapshotAnimated:dataRenderedBlock:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICCoreDataDataSource indexer](self, "indexer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextRelevantItemIdentifierAfter:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)expandItemsWithIdentifiers:(id)a3 completion:(id)a4
{
  -[ICCoreDataDataSource setExpanded:itemIdentifiers:completion:](self, "setExpanded:itemIdentifiers:completion:", 1, a3, a4);
}

- (void)collapseItemsWithIdentifiers:(id)a3 completion:(id)a4
{
  -[ICCoreDataDataSource setExpanded:itemIdentifiers:completion:](self, "setExpanded:itemIdentifiers:completion:", 0, a3, a4);
}

- (void)performBlockSuspendingUpdates:(id)a3 andApplySnapshotAnimated:(BOOL)a4
{
  void (**v5)(_QWORD);
  void *v6;

  v5 = (void (**)(_QWORD))a3;
  -[ICCoreDataDataSource setSuspendsUpdates:](self, "setSuspendsUpdates:", 1);
  v5[2](v5);

  -[ICCoreDataDataSource reindexDelayer](self, "reindexDelayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelPreviousFireRequests");

  performBlockOnMainThread();
}

uint64_t __79__ICCoreDataDataSource_performBlockSuspendingUpdates_andApplySnapshotAnimated___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__ICCoreDataDataSource_performBlockSuspendingUpdates_andApplySnapshotAnimated___block_invoke_2;
  v3[3] = &unk_1E5C1D540;
  v3[4] = v1;
  return objc_msgSend(v1, "applySnapshotAnimated:dataRenderedBlock:", 1, v3);
}

uint64_t __79__ICCoreDataDataSource_performBlockSuspendingUpdates_andApplySnapshotAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSuspendsUpdates:", 0);
}

- (void)managedObjectContextUpdaterDidMerge:(id)a3
{
  -[ICDataSource reloadDataAnimated:](self, "reloadDataAnimated:", 1);
}

- (void)noteLockManagerDidToggleLock:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICCoreDataDataSource;
  -[ICDataSource noteLockManagerDidToggleLock:](&v4, sel_noteLockManagerDidToggleLock_, a3);
  -[ICCoreDataDataSource reindexAndApplySnapshot](self, "reindexAndApplySnapshot");
}

- (void)reindexAndApplySnapshot
{
  -[ICDataSource reindexDataAnimated:](self, "reindexDataAnimated:", 1);
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_33(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

BOOL __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsItem:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "childrenOfParent:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_39(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICDataSourceDataDidUpdateNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_2_40(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__ICCoreDataDataSource_applySnapshotAnimated_dataRenderedBlock___block_invoke_3_41(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICDataSourceDataDidUpdateNotification"), *(_QWORD *)(a1 + 32));

}

- (void)setExpanded:(BOOL)a3 itemIdentifiers:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  id v27;
  NSObject *v28;
  id v29;
  id obj;
  uint64_t v31;
  ICCoreDataDataSource *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  _QWORD block[5];
  id v40;
  uint64_t v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v6 = a3;
  v55 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v29 = a5;
  v8 = dispatch_group_create();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v11;
  v35 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v35)
  {
    v31 = *(_QWORD *)v50;
    v32 = self;
    v33 = v8;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v50 != v31)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        dispatch_group_enter(v8);
        -[ICDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "snapshotForSection:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke;
        v47[3] = &unk_1E5C1F188;
        v16 = v15;
        v48 = v16;
        objc_msgSend(v34, "ic_objectsPassingTest:", v47);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICExpansionState sharedExpansionState](ICExpansionState, "sharedExpansionState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCoreDataDataSource indexer](self, "indexer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "expansionStateContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v21 = v17;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v44 != v24)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              if (v6)
                objc_msgSend(v18, "expandItemIdentifier:context:", v26, v20);
              else
                objc_msgSend(v18, "collapseItemIdentifier:context:", v26, v20);
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
          }
          while (v23);
        }

        if (v6)
          objc_msgSend(v16, "expandItems:", v21);
        else
          objc_msgSend(v16, "collapseItems:", v21);
        self = v32;
        v8 = v33;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_2;
        block[3] = &unk_1E5C1F1B0;
        block[4] = v32;
        v40 = v16;
        v41 = v13;
        v42 = v33;
        v27 = v16;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v35);
  }

  if (v29)
  {
    -[ICCoreDataDataSource expansionStateCompletionQueue](self, "expansionStateCompletionQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_4;
    v36[3] = &unk_1E5C1D718;
    v37 = v8;
    v38 = v29;
    dispatch_async(v28, v36);

  }
}

uint64_t __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewDiffableDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_3;
  v5[3] = &unk_1E5C1D540;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "applySnapshot:toSection:animatingDifferences:completion:", v3, v4, 1, v5);

}

void __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__ICCoreDataDataSource_setExpanded_itemIdentifiers_completion___block_invoke_4(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
}

- (void)setIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_indexer, a3);
}

- (void)setApplySnapshotLegacyManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_applySnapshotLegacyManagedObjectContext, a3);
}

- (ICSelectorDelayer)reindexDelayer
{
  return self->_reindexDelayer;
}

- (void)setLastReindexParentModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastReindexParentModificationDate, a3);
}

- (OS_dispatch_queue)expansionStateCompletionQueue
{
  return self->_expansionStateCompletionQueue;
}

- (void)setSuspendsUpdates:(BOOL)a3
{
  self->_suspendsUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applySnapshotCompletionQueue, 0);
  objc_storeStrong((id *)&self->_expansionStateCompletionQueue, 0);
  objc_storeStrong((id *)&self->_lastReindexParentModificationDate, 0);
  objc_storeStrong((id *)&self->_reindexDelayer, 0);
  objc_storeStrong((id *)&self->_applySnapshotModernManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_applySnapshotLegacyManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
}

- (void)reindexDataAnimated:(os_log_t)log dataIndexedBlock:dataRenderedBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "Suppressing automatic reindex due to performBlockSuspendingUpdates usage.", v1, 2u);
}

@end
