@implementation PHAssetDeleteRequest

- (PHAssetDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  PHAssetDeleteRequest *v9;
  PHAssetDeleteOptions *v10;
  PHAssetDeleteOptions *deleteOptions;
  PHAssetDeleteOptions *v12;
  PHAssetDeleteOptions *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetDeleteRequest;
  v9 = -[PHTrashableObjectDeleteRequest initWithXPCDict:request:clientAuthorization:](&v15, sel_initWithXPCDict_request_clientAuthorization_, v8, a4, a5);
  if (v9)
  {
    v10 = -[PHAssetDeleteOptions initWithXPCDict:]([PHAssetDeleteOptions alloc], "initWithXPCDict:", v8);
    deleteOptions = v9->_deleteOptions;
    v9->_deleteOptions = v10;

    if (!v9->_deleteOptions)
    {
      v12 = objc_alloc_init(PHAssetDeleteOptions);
      v13 = v9->_deleteOptions;
      v9->_deleteOptions = v12;

    }
  }

  return v9;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PHAssetDeleteRequest;
  -[PHTrashableObjectDeleteRequest encodeToXPCDict:](&v6, sel_encodeToXPCDict_, v4);
  if (self->_deleteOptions)
  {
    -[PHAssetDeleteRequest deleteOptions](self, "deleteOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeToXPCDict:", v4);

  }
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  uint64_t v25;
  objc_super v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PHAssetDeleteRequest;
  v28 = 0;
  v7 = -[PHTrashableObjectDeleteRequest validateForDeleteManagedObject:error:](&v27, sel_validateForDeleteManagedObject_error_, v6, &v28);
  v8 = v28;
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v6, "isCloudSharedAsset")
      && !-[PHObjectDeleteRequest isClientEntitled](self, "isClientEntitled"))
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot modify iCloud Shared Streams"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v36[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v19);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_21:

      v12 = 0;
      v8 = (id)v20;
LABEL_22:

      if (!a4)
        goto LABEL_25;
      goto LABEL_23;
    }
    if (-[PHTrashableObjectDeleteRequest operation](self, "operation") != 1)
    {
      v12 = 1;
      goto LABEL_25;
    }
    v9 = v6;
    if (objc_msgSend(v9, "hasLibraryScope")
      && !objc_msgSend(v9, "canPerformEditOperation:", 8))
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to expunge shared library asset contributed by others"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v19;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v34;
      v24 = &v33;
    }
    else
    {
      -[PHObjectDeleteRequest clientBundleID](self, "clientBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.")))
      {

LABEL_14:
        -[PHAssetDeleteRequest deleteOptions](self, "deleteOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "expungeSource");

        if (v17)
        {
          v12 = 1;
          goto LABEL_22;
        }
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset expunge request without expungeSource being set. Set expungeSource on the PHAssetDeletionOptions passed into the expunge request"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v19;
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = &v30;
        v24 = &v29;
        goto LABEL_20;
      }
      -[PHObjectDeleteRequest clientBundleID](self, "clientBundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("com.appleinternal."));

      if ((v15 & 1) != 0)
        goto LABEL_14;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset expunge restricted to Apple apps only"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v19;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = &v32;
      v24 = &v31;
    }
LABEL_20:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v25);
    v20 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v25;
    goto LABEL_21;
  }
  v12 = 0;
  if (!a4)
    goto LABEL_25;
LABEL_23:
  if (!v12)
  {
    v8 = objc_retainAutorelease(v8);
    v12 = 0;
    *a4 = v8;
  }
LABEL_25:

  return v12;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  __CFString *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "additionalAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syndicationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "savedAssetType");
  objc_msgSend(v7, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "wellKnownPhotoLibraryIdentifier");

  if (v13 != 3)
  {
    v16 = -[PHTrashableObjectDeleteRequest operation](self, "operation");
    if (v16 == 2)
    {
      v25 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userUntrashAssets:", v20);
    }
    else if (v16 == 1)
    {
      -[PHAssetDeleteRequest deleteOptions](self, "deleteOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "expungeSource");

      if (v23 > 8)
        v24 = 0;
      else
        v24 = off_1E35D6B88[v23];
      v26 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userExpungeAssets:localOnlyDelete:expungeReasonFromClient:", v20, 0, v24);
    }
    else
    {
      if (v16)
        goto LABEL_18;
      -[PHObjectDeleteRequest clientBundleID](self, "clientBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("com.apple."));

      v27 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        v21 = 1;
      else
        v21 = 2;
      objc_msgSend(v7, "userTrashAssets:withTrashedReason:", v20, v21);
    }

LABEL_18:
    if (v13 != 1)
      goto LABEL_21;
    goto LABEL_19;
  }
  PLSyndicationGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v15;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_INFO, "Preventing PhotoKit delete of asset %{public}@ / %{public}@ in syndication library", buf, 0x16u);

  }
LABEL_19:
  if (v10)
    -[PHAssetDeleteRequest _updateSyndicationStateForSyndicationIdentifier:savedAssetType:sourceLibraryID:](self, "_updateSyndicationStateForSyndicationIdentifier:savedAssetType:sourceLibraryID:", v10, v11, v13);
LABEL_21:

}

- (void)_updateSyndicationStateForSyndicationIdentifier:(id)a3 savedAssetType:(signed __int16)a4 sourceLibraryID:(int64_t)a5
{
  int64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = -[PHTrashableObjectDeleteRequest operation](self, "operation");
  if (!v6)
  {
    v7 = &__block_literal_global_4515;
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    v7 = &__block_literal_global_58;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0D71880], "performTransactionOnSyndicationLibraryWithSyndicationIdentifier:block:", v8, v7);
  }

}

- (PHAssetDeleteOptions)deleteOptions
{
  return self->_deleteOptions;
}

- (void)setDeleteOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteOptions, 0);
}

uint64_t __103__PHAssetDeleteRequest__updateSyndicationStateForSyndicationIdentifier_savedAssetType_sourceLibraryID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rejectSyndicatedAsset");
}

uint64_t __103__PHAssetDeleteRequest__updateSyndicationStateForSyndicationIdentifier_savedAssetType_sourceLibraryID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "restoreSyndicatedAsset");
}

@end
