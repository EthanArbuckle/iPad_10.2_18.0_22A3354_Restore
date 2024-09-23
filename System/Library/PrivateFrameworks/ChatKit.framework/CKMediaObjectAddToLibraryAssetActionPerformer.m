@implementation CKMediaObjectAddToLibraryAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "chatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "canPerformQuickAction"))
    v7 = objc_msgSend(v5, "isAnyItemSelected");
  else
    v7 = 0;

  return v7;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAnyItemSelected") & 1) != 0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "allItemsEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "mediaObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v4, "addObject:", v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

    if (_IMWillLog())
    {
      objc_msgSend(v4, "count");
      _IMAlwaysLog();
    }
    location = 0;
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__CKMediaObjectAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke;
    v16[3] = &unk_1E274B548;
    objc_copyWeak(&v17, &location);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __75__CKMediaObjectAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_3;
    v14[3] = &unk_1E275A350;
    objc_copyWeak(&v15, &location);
    +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:](CKUtilities, "quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:", v4, 0, 0, *MEMORY[0x1E0D388B8], v16, &__block_literal_global_254, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v11))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("CKMediaObjectAddToLibraryAssetActionPerformer: Failed to present save alert"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v12);

      }
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("CKMediaObjectAddToLibraryAssetActionPerformer: No items selected for add to library action"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v13);

  }
}

void __75__CKMediaObjectAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

void __75__CKMediaObjectAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", a2, v5);

}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  void *v5;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVE_TO_PHOTO_LIBRARY"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("square.and.arrow.down");
}

@end
