@implementation SGDSpotlightReceiver

- (void)deleteAllUserActivities:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteAllUserActivities:](self->_duReceiver, "deleteAllUserActivities:", v5);
    objc_autoreleasePoolPop(v6);
  }
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting all user activities from %{public}@", buf, 0xCu);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSpotlightReceiver.m"), 518, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

  }
  v10 = *MEMORY[0x1E0D80F68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSpotlightReceiver deleteSearchableItemsWithDomainIdentifiers:bundleID:](self, "deleteSearchableItemsWithDomainIdentifiers:bundleID:", v8, v5);

}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  SGCoalescingDropBox *deleteInteractionBundleIdDropbox;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteAllInteractionsWithBundleID:protectionClass:](self->_duReceiver, "deleteAllInteractionsWithBundleID:protectionClass:", v7, v8);
    objc_autoreleasePoolPop(v9);
  }
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting all interactions from %{public}@", buf, 0xCu);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSpotlightReceiver.m"), 493, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

  }
  deleteInteractionBundleIdDropbox = self->_deleteInteractionBundleIdDropbox;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__SGDSpotlightReceiver_deleteAllInteractionsWithBundleID_protectionClass___block_invoke;
  v15[3] = &unk_1E7DB1EC8;
  v16 = 0;
  v17 = v7;
  v12 = v7;
  -[SGCoalescingDropBox updateBox:](deleteInteractionBundleIdDropbox, "updateBox:", v15);
  v18 = *MEMORY[0x1E0D80F58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSpotlightReceiver deleteSearchableItemsWithDomainIdentifiers:bundleID:](self, "deleteSearchableItemsWithDomainIdentifiers:bundleID:", v13, v12);

}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteSearchableItemsWithDomainIdentifiers:bundleID:](self->_duReceiver, "deleteSearchableItemsWithDomainIdentifiers:bundleID:", v6, v7);
    objc_autoreleasePoolPop(v8);
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D19D88]) & 1) == 0 && objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815A0]), "initWithDomainsFromArray:", v6);
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v18 = objc_msgSend(v6, "count");
      v19 = 2048;
      v20 = objc_msgSend(v9, "count");
      v21 = 2114;
      v22 = v7;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting %tu domain identifiers (%tu after removing overlaps) for %{public}@: %@", buf, 0x2Au);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80FC0]), "initWithBundleIdentifier:domainSelection:", v7, v9);
    objc_msgSend(MEMORY[0x1E0D80F88], "defaultReceiver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v13 = objc_msgSend(v12, "deleteContentWithRequest:error:", v11, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
    {
      sgLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = (uint64_t)v14;
        _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: deleteSearchableItemsWithDomainIdentifiers: error sending deletion to ProactiveHarvesting: %@", buf, 0xCu);
      }

    }
  }

}

void __74__SGDSpotlightReceiver_deleteAllInteractionsWithBundleID_protectionClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v4;
  id v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "addObject:", v4);
  v6 = objc_msgSend(v5, "count");

  if (v6 >> 3 >= 0x271)
    *a3 = 1;
}

uint64_t __65__SGDSpotlightReceiver_addInteractions_bundleID_protectionClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver addInteractions:bundleID:protectionClass:](self->_duReceiver, "addInteractions:bundleID:protectionClass:", v8, v9, v10);
    objc_autoreleasePoolPop(v11);
  }
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_77_26997);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v21 = v13;
    v22 = 2114;
    v23 = v9;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: received %tu interactions from %{public}@: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D80F88], "defaultReceiver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v16 = objc_msgSend(v15, "donateInteractions:bundleIdentifier:error:", v8, v9, &v19);
  v17 = v19;

  if ((v16 & 1) == 0)
  {
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v17;
      _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: addInteractions: error donating to ProactiveHarvesting: %@", buf, 0xCu);
    }

  }
}

- (SGDSpotlightReceiver)initWithManager:(id)a3
{
  id v6;
  SGDSpotlightReceiver *v7;
  SGDSpotlightReceiver *v8;
  SGCoalescingDropBox *v9;
  uint64_t v10;
  SGDSpotlightReceiver *v11;
  uint64_t v12;
  SGCoalescingDropBox *deleteInteractionBundleIdDropbox;
  SGCoalescingDropBox *v14;
  SGDSpotlightReceiver *v15;
  uint64_t v16;
  SGCoalescingDropBox *deleteInteractionIdDropbox;
  SGCoalescingDropBox *v18;
  SGDSpotlightReceiver *v19;
  uint64_t v20;
  SGCoalescingDropBox *deleteInteractionGroupIdDropbox;
  uint64_t v22;
  SpotlightReceiver *duReceiver;
  void *v25;
  _QWORD v26[4];
  id v27;
  SGDSpotlightReceiver *v28;
  _QWORD v29[4];
  id v30;
  SGDSpotlightReceiver *v31;
  _QWORD v32[4];
  id v33;
  SGDSpotlightReceiver *v34;
  objc_super v35;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSpotlightReceiver.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager"));

  }
  v35.receiver = self;
  v35.super_class = (Class)SGDSpotlightReceiver;
  v7 = -[SGDSpotlightReceiver init](&v35, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_manager, a3);
    v9 = [SGCoalescingDropBox alloc];
    v10 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __40__SGDSpotlightReceiver_initWithManager___block_invoke_2;
    v32[3] = &unk_1E7DB1CB8;
    v33 = 0;
    v11 = v8;
    v34 = v11;
    v12 = -[SGCoalescingDropBox initWithName:boxMaker:handler:qos:](v9, "initWithName:boxMaker:handler:qos:", "SGDSpotlightReceiver.deleteInteractionBundleIdDropbox", &__block_literal_global_27072, v32, 17);
    deleteInteractionBundleIdDropbox = v11->_deleteInteractionBundleIdDropbox;
    v11->_deleteInteractionBundleIdDropbox = (SGCoalescingDropBox *)v12;

    v14 = [SGCoalescingDropBox alloc];
    v29[0] = v10;
    v29[1] = 3221225472;
    v29[2] = __40__SGDSpotlightReceiver_initWithManager___block_invoke_3;
    v29[3] = &unk_1E7DB1D20;
    v30 = 0;
    v15 = v11;
    v31 = v15;
    v16 = -[SGCoalescingDropBox initWithName:boxMaker:handler:qos:](v14, "initWithName:boxMaker:handler:qos:", "SGDSpotlightReceiver.deleteInteractionIdDropbox", &__block_literal_global_21_27074, v29, 17);
    deleteInteractionIdDropbox = v15->_deleteInteractionIdDropbox;
    v15->_deleteInteractionIdDropbox = (SGCoalescingDropBox *)v16;

    v18 = [SGCoalescingDropBox alloc];
    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = __40__SGDSpotlightReceiver_initWithManager___block_invoke_3_28;
    v26[3] = &unk_1E7DB1D20;
    v27 = 0;
    v19 = v15;
    v28 = v19;
    v20 = -[SGCoalescingDropBox initWithName:boxMaker:handler:qos:](v18, "initWithName:boxMaker:handler:qos:", "SGDSpotlightReceiver.deleteInteractionGroupIdDropbox", &__block_literal_global_27_27076, v26, 17);
    deleteInteractionGroupIdDropbox = v19->_deleteInteractionGroupIdDropbox;
    v19->_deleteInteractionGroupIdDropbox = (SGCoalescingDropBox *)v20;

    v22 = objc_opt_new();
    duReceiver = v19->_duReceiver;
    v19->_duReceiver = (SpotlightReceiver *)v22;

    -[SGDSpotlightReceiver _accessSummarizationPipelineForBundleId:block:](v19, "_accessSummarizationPipelineForBundleId:block:", 0, &__block_literal_global_33_27078);
  }

  return v8;
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _BYTE *v36;
  unint64_t v37;
  char v38;
  uint8_t v39[4];
  id v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v5 = a4;
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v28, "count");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: Received %tu items from %@.", buf, 0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver addOrUpdateSearchableItems:bundleID:](self->_duReceiver, "addOrUpdateSearchableItems:bundleID:", v28, v5);
    objc_autoreleasePoolPop(v7);
  }
  v26 = *MEMORY[0x1E0D19A38];
  if (objc_msgSend(v5, "isEqualToString:"))
  {
    notify_post("com.apple.proactive.SocialHighlightsRefreshed");
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: invalidated highlight cache and notified of refresh", buf, 2u);
    }

  }
  v38 = 0;
  v27 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  if (objc_msgSend(v28, "count"))
  {
    v10 = 0;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = (void *)MEMORY[0x1C3BD4F6C]();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v42 = __Block_byref_object_copy__27048;
      *(_QWORD *)&v43 = __Block_byref_object_dispose__27049;
      *((_QWORD *)&v43 + 1) = 0;
      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __60__SGDSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke;
      v32[3] = &unk_1E7DB1DA8;
      v36 = buf;
      v37 = v10;
      v13 = v28;
      v33 = v13;
      v14 = v5;
      v34 = v14;
      v35 = v9;
      v15 = (void *)MEMORY[0x1C3BD5158](v32);
      v30[0] = v11;
      v30[1] = 3221225472;
      v30[2] = __60__SGDSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke_43;
      v30[3] = &unk_1E7DB1DD0;
      v16 = v15;
      v31 = v16;
      -[SGDSpotlightReceiver _accessSummarizationPipelineForBundleId:block:](self, "_accessSummarizationPipelineForBundleId:block:", v14, v30);
      if ((objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", v14) & 1) != 0)
      {
        if (objc_msgSend(MEMORY[0x1E0D80F90], "searchableItemIsStoredEncryptedWithGetterBlock:bundleIdentifier:", v16, v14))
        {
          v16[2](v16);
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject uniqueIdentifier](v17, "uniqueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v18);

        }
        else
        {
          if (!objc_msgSend(MEMORY[0x1E0D80F90], "searchableItemIsEligibleForHarvestingWithGetterBlock:bundleIdentifier:eligibleExceptForAge:", v16, v14, &v38)&& (!v38|| !objc_msgSend(v14, "isEqualToString:", v26)|| !-[SGDSuggestManager isSearchableItemPartOfReimportWithGetterBlock:bundleIdentifier:](self->_manager, "isSearchableItemPartOfReimportWithGetterBlock:bundleIdentifier:", v16, v14)))
          {
            goto LABEL_19;
          }
          v16[2](v16);
          v17 = objc_claimAutoreleasedReturnValue();
          -[SGDSpotlightReceiver _addSearchableItem:bundleID:](self, "_addSearchableItem:bundleID:", v17, v14);
        }
      }
      else
      {
        sgLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 138543362;
          v40 = v5;
          _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "ignoring item since the bundle %{public}@ is disallowed by user's settings", v39, 0xCu);
        }
      }

LABEL_19:
      _Block_object_dispose(buf, 8);

      objc_autoreleasePoolPop(v12);
      ++v10;
    }
    while (v10 < objc_msgSend(v13, "count"));
  }
  sgLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v9, "count");
    v21 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2114;
    v42 = (uint64_t (*)(uint64_t, uint64_t))v5;
    LOWORD(v43) = 2112;
    *(_QWORD *)((char *)&v43 + 2) = v9;
    _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "Decoded %tu of %tu items received from %{public}@: %@", buf, 0x2Au);
  }

  if (objc_msgSend(v27, "count"))
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v42 = (uint64_t (*)(uint64_t, uint64_t))v27;
      _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEFAULT, "Will delete %tu encrypted items from %{public}@: %@", buf, 0x20u);
    }

    -[SGDSpotlightReceiver deleteSearchableItemsWithIdentifiers:bundleID:](self, "deleteSearchableItemsWithIdentifiers:bundleID:", v27, v5);
    sgLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "Deleted %tu encrypted items", buf, 0xCu);
    }

  }
}

- (void)_accessSummarizationPipelineForBundleId:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0
    || (_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl())
  {
    v7 = (void *)MEMORY[0x1E0D81590];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__SGDSpotlightReceiver__accessSummarizationPipelineForBundleId_block___block_invoke;
    v8[3] = &unk_1E7DB7578;
    v10 = v6;
    v9 = v5;
    objc_msgSend(v7, "runBlockWhenDeviceIsClassCUnlocked:", v8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)_addSearchableItem:(id)a3 bundleID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D80F88];
  v7 = a4;
  objc_msgSend(v6, "defaultReceiver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v8, "donateSearchableItems:bundleIdentifier:error:", v9, v7, &v13);

  v11 = v13;
  if ((v10 & 1) == 0)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: _addSearchableItem: error donating to ProactiveHarvesting: %@", buf, 0xCu);
    }

  }
}

- (void)addUserAction:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver addUserAction:withItem:](self->_duReceiver, "addUserAction:withItem:", v6, v7);
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(MEMORY[0x1E0D80F88], "defaultReceiver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v9, "donateUserAction:searchableItem:error:", v6, v7, &v13);
  v11 = v13;

  if ((v10 & 1) == 0)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: addUserAction: error donating to ProactiveHarvesting: %@", buf, 0xCu);
    }

  }
}

- (void)purgeSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver purgeSearchableItemsWithIdentifiers:bundleID:](self->_duReceiver, "purgeSearchableItemsWithIdentifiers:bundleID:", v6, v7);
LABEL_5:
    objc_autoreleasePoolPop(v8);
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteSearchableItemsWithIdentifiers:bundleID:](self->_duReceiver, "deleteSearchableItemsWithIdentifiers:bundleID:", v6, v7);
    goto LABEL_5;
  }
LABEL_6:
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D19D88]) & 1) == 0 && objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v18 = objc_msgSend(v6, "count");
      v19 = 2048;
      v20 = objc_msgSend(v9, "count");
      v21 = 2114;
      v22 = v7;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: purging %tu unique identifiers (%tu after de-duplication) for %{public}@: %@", buf, 0x2Au);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80FC0]), "initWithBundleIdentifier:purgedUniqueIdentifiers:", v7, v9);
    objc_msgSend(MEMORY[0x1E0D80F88], "defaultReceiver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v13 = objc_msgSend(v12, "deleteContentWithRequest:error:", v11, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
    {
      sgLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = (uint64_t)v14;
        _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: purgeSearchableItemsWithIdentifiers: error sending purge to ProactiveHarvesting: %@", buf, 0xCu);
      }

    }
  }

}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteSearchableItemsWithIdentifiers:bundleID:](self->_duReceiver, "deleteSearchableItemsWithIdentifiers:bundleID:", v6, v7);
    objc_autoreleasePoolPop(v8);
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D19D88]) & 1) == 0 && objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v21 = objc_msgSend(v6, "count");
      v22 = 2048;
      v23 = objc_msgSend(v9, "count");
      v24 = 2114;
      v25 = v7;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting %tu unique identifiers (%tu after de-duplication) for %{public}@: %@", buf, 0x2Au);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80FC0]), "initWithBundleIdentifier:uniqueIdentifiers:", v7, v9);
    objc_msgSend(MEMORY[0x1E0D80F88], "defaultReceiver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v13 = objc_msgSend(v12, "deleteContentWithRequest:error:", v11, &v19);
    v14 = v19;

    if ((v13 & 1) == 0)
    {
      sgLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = (uint64_t)v14;
        _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: deleteSearchableItemsWithIdentifiers: error sending deletion to ProactiveHarvesting: %@", buf, 0xCu);
      }

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__SGDSpotlightReceiver_deleteSearchableItemsWithIdentifiers_bundleID___block_invoke;
    v16[3] = &unk_1E7DB1DF8;
    v17 = v6;
    v18 = v7;
    -[SGDSpotlightReceiver _accessSummarizationPipelineForBundleId:block:](self, "_accessSummarizationPipelineForBundleId:block:", v18, v16);

  }
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteAllSearchableItemsWithBundleID:](self->_duReceiver, "deleteAllSearchableItemsWithBundleID:", v4);
    objc_autoreleasePoolPop(v5);
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D19D88]) & 1) == 0)
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v4;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting entire bundle identifier %{public}@", buf, 0xCu);
    }

    if (objc_msgSend((id)*MEMORY[0x1E0D80FC8], "isEqual:", v4))
    {
      +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteSpotlightReferencesWithBundleIdentifier:completion:", v4, 0);

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80FC0]), "initWithBundleIdentifier:", v4);
    objc_msgSend(MEMORY[0x1E0D80F88], "defaultReceiver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v10 = objc_msgSend(v9, "deleteContentWithRequest:error:", v8, &v13);
    v11 = v13;

    if ((v10 & 1) == 0)
    {
      sgLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v4;
        v16 = 2112;
        v17 = v11;
        _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGDSpotlightReceiver: deleteAllSearchableItemsWithBundleID:%{public}@ error sending deletion to ProactiveHarvesting: %@", buf, 0x16u);
      }

    }
  }

}

- (id)supportedContentTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_duReceiver && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SpotlightReceiver supportedContentTypes](self->_duReceiver, "supportedContentTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  SGWeakLinkStringConstant();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  SGWeakLinkStringConstant();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  SGWeakLinkStringConstant();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  SGWeakLinkStringConstant();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  SGWeakLinkStringConstant();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  v18 = CFSTR("com.apple.safari.history");
  v19 = CFSTR("UNNotificationContentTypeDefault");
  v20 = CFSTR("UNNotificationContentTypeMessagingDirect");
  v21 = CFSTR("UNNotificationContentTypeMessagingGroup");
  v22 = CFSTR("UNNotificationContentTypeVoicemail");
  v23 = CFSTR("NotificationGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v10, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  SGCoalescingDropBox *deleteInteractionIdDropbox;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteInteractionsWithIdentifiers:bundleID:protectionClass:](self->_duReceiver, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:", v9, v10, v11);
    objc_autoreleasePoolPop(v12);
  }
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    v25 = 2048;
    v26 = objc_msgSend(v9, "count");
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting interactions from %{public}@ matching %tu identifiers: %@", buf, 0x20u);
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSpotlightReceiver.m"), 438, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

  }
  if (objc_msgSend(v9, "count"))
  {
    deleteInteractionIdDropbox = self->_deleteInteractionIdDropbox;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__SGDSpotlightReceiver_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke;
    v19[3] = &unk_1E7DB1E60;
    v20 = 0;
    v15 = v10;
    v21 = v15;
    v16 = v9;
    v22 = v16;
    -[SGCoalescingDropBox updateBox:](deleteInteractionIdDropbox, "updateBox:", v19);
    objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_82_26996);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDSpotlightReceiver deleteSearchableItemsWithIdentifiers:bundleID:](self, "deleteSearchableItemsWithIdentifiers:bundleID:", v17, v15);

  }
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  SGCoalescingDropBox *deleteInteractionGroupIdDropbox;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:](self->_duReceiver, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:", v9, v10, v11);
    objc_autoreleasePoolPop(v12);
  }
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    v25 = 2048;
    v26 = objc_msgSend(v9, "count");
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting interactions from %{public}@ matching %tu group identifiers: %@", buf, 0x20u);
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSpotlightReceiver.m"), 466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

  }
  if (objc_msgSend(v9, "count"))
  {
    deleteInteractionGroupIdDropbox = self->_deleteInteractionGroupIdDropbox;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88__SGDSpotlightReceiver_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke;
    v19[3] = &unk_1E7DB1E60;
    v20 = 0;
    v15 = v10;
    v21 = v15;
    v16 = v9;
    v22 = v16;
    -[SGCoalescingDropBox updateBox:](deleteInteractionGroupIdDropbox, "updateBox:", v19);
    objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_84_26991);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDSpotlightReceiver deleteSearchableItemsWithDomainIdentifiers:bundleID:](self, "deleteSearchableItemsWithDomainIdentifiers:bundleID:", v17, v15);

  }
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SpotlightReceiver deleteUserActivitiesWithPersistentIdentifiers:bundleID:](self->_duReceiver, "deleteUserActivitiesWithPersistentIdentifiers:bundleID:", v7, v8);
    objc_autoreleasePoolPop(v9);
  }
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = v8;
    v16 = 2048;
    v17 = objc_msgSend(v7, "count");
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver: deleting interactions from %{public}@ matching %tu persistent identifiers: %@", buf, 0x20u);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSpotlightReceiver.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

    if (v7)
      goto LABEL_7;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSpotlightReceiver.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentIdentifiers"));

    goto LABEL_7;
  }
  if (!v7)
    goto LABEL_9;
LABEL_7:
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_88_26980);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSpotlightReceiver deleteSearchableItemsWithIdentifiers:bundleID:](self, "deleteSearchableItemsWithIdentifiers:bundleID:", v11, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duReceiver, 0);
  objc_storeStrong((id *)&self->_deleteInteractionGroupIdDropbox, 0);
  objc_storeStrong((id *)&self->_deleteInteractionIdDropbox, 0);
  objc_storeStrong((id *)&self->_deleteInteractionBundleIdDropbox, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

uint64_t __79__SGDSpotlightReceiver_deleteUserActivitiesWithPersistentIdentifiers_bundleID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D80FB8], "uniqueIdForPersistentIdentifier:", a2);
}

void __88__SGDSpotlightReceiver_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
  }

  objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  if ((unint64_t)objc_msgSend(v7, "count") >> 3 >= 0x271)
    *a3 = 1;

}

uint64_t __88__SGDSpotlightReceiver_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D80FA0], "domainIdForInteractionGroupId:", a2);
}

void __83__SGDSpotlightReceiver_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
  }

  objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  if ((unint64_t)objc_msgSend(v7, "count") >> 3 >= 0x271)
    *a3 = 1;

}

uint64_t __83__SGDSpotlightReceiver_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D80FA0], "uniqueIdForInteractionIdentifier:", a2);
}

uint64_t __70__SGDSpotlightReceiver_deleteSearchableItemsWithIdentifiers_bundleID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleDeletionOfItemsWithIdentifiers:bundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __70__SGDSpotlightReceiver__accessSummarizationPipelineForBundleId_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getPSUSummarizationPipelineClass_softClass;
  v11 = getPSUSummarizationPipelineClass_softClass;
  if (!getPSUSummarizationPipelineClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPSUSummarizationPipelineClass_block_invoke;
    v7[3] = &unk_1E7DB7220;
    v7[4] = &v8;
    __getPSUSummarizationPipelineClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedPipelineWithContactStore:incomingBundleId:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);

}

id __60__SGDSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __CFString *v25;
  NSObject *v26;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CA6B48], "sg_clonableItemAtIndex:inCodedArray:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (objc_msgSend((id)*MEMORY[0x1E0D80FD0], "isEqual:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "attributeSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v7, "emailHeaders", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v31;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v12);
          if (!objc_msgSend(CFSTR("message-id"), "caseInsensitiveCompare:", v13))
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
            if (v10)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        objc_msgSend(v7, "emailHeaders");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_pas_componentsJoinedByString:", CFSTR(", "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        sgLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "uniqueIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "domainIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v35 = v18;
          v36 = 2114;
          v37 = v19;
          v38 = 2114;
          v39 = v20;
          v40 = 2114;
          v41 = v16;
          _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver got email bid:%{public}@ uid:%{public}@ did:%{public}@ mid:%{public}@", buf, 0x2Au);

        }
        if (v16)
          goto LABEL_18;
      }
      else
      {
LABEL_11:

      }
      sgLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "uniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "domainIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v22;
        v36 = 2114;
        v37 = v23;
        v38 = 2114;
        v39 = v24;
        _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "SGDSpotlightReceiver got item from mail bid:%{public}@ uid:%{public}@ did:%{public}@ without message-id, continuing anyway", buf, 0x20u);

      }
      v16 = 0;
LABEL_18:

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "uniqueIdentifier");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      sgLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        v28 = *(_QWORD *)(a1 + 40);
        v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543619;
        v35 = v28;
        v36 = 2117;
        v37 = v29;
        _os_log_fault_impl(&dword_1C3607000, v26, OS_LOG_TYPE_FAULT, "Received item %{public}@ %{sensitive}@ with nil uniqueIdentifier", buf, 0x16u);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
      v25 = CFSTR("nil (this is a bug!!!!)");
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);

    objc_autoreleasePoolPop(v3);
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  return v2;
}

void __60__SGDSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processSearchableItem:", v5);

}

void __40__SGDSpotlightReceiver_initWithManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id obj;
  _QWORD v14[4];
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = dispatch_group_create();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        dispatch_group_enter(v4);
        sgLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v10;
          _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "Deleting all Interactions from %@.", buf, 0xCu);
        }

        v12 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
        v14[0] = v8;
        v14[1] = 3221225472;
        v14[2] = __40__SGDSpotlightReceiver_initWithManager___block_invoke_15;
        v14[3] = &unk_1E7DB1C90;
        v15 = v4;
        objc_msgSend(v12, "deleteInteractionsWithBundleId:completion:", v10, v14);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void __40__SGDSpotlightReceiver_initWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = dispatch_group_create();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        dispatch_group_enter(v3);
        sgLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");
          *(_DWORD *)buf = 134218242;
          v25 = v13;
          v26 = 2112;
          v27 = v9;
          _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "Deleting %tu Interactions from %@.", buf, 0x16u);

        }
        v14 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __40__SGDSpotlightReceiver_initWithManager___block_invoke_23;
        v18[3] = &unk_1E7DB1C90;
        v19 = v3;
        objc_msgSend(v14, "deleteInteractionsWithBundleId:identifiers:completion:", v9, v16, v18);

        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v6);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

void __40__SGDSpotlightReceiver_initWithManager___block_invoke_3_28(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = dispatch_group_create();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        dispatch_group_enter(v3);
        sgLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");
          *(_DWORD *)buf = 134218242;
          v25 = v13;
          v26 = 2112;
          v27 = v9;
          _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "Deleting %tu group indentifiers for Interactions from %@.", buf, 0x16u);

        }
        v14 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __40__SGDSpotlightReceiver_initWithManager___block_invoke_29;
        v18[3] = &unk_1E7DB1C90;
        v19 = v3;
        objc_msgSend(v14, "deleteInteractionsWithBundleId:groupIdentifiers:completion:", v9, v16, v18);

        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v6);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

id __40__SGDSpotlightReceiver_initWithManager___block_invoke_2_26()
{
  return (id)objc_opt_new();
}

void __40__SGDSpotlightReceiver_initWithManager___block_invoke_29(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id __40__SGDSpotlightReceiver_initWithManager___block_invoke_2_19()
{
  return (id)objc_opt_new();
}

void __40__SGDSpotlightReceiver_initWithManager___block_invoke_23(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id __40__SGDSpotlightReceiver_initWithManager___block_invoke()
{
  return (id)objc_opt_new();
}

void __40__SGDSpotlightReceiver_initWithManager___block_invoke_15(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
