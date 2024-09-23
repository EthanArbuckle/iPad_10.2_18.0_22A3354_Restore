@implementation LPAppStoreStoryMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 512;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  LPAppStoreStoryMetadata *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[LPPresentationSpecializations isAppStoreStoryURL:](LPPresentationSpecializations, "isAppStoreStoryURL:", v9);

  if (v10)
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    v12 = objc_alloc_init(LPAppStoreStoryMetadata);
    objc_msgSend(v11, "setSpecialization:", v12);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __126__LPAppStoreStoryMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke;
    v15[3] = &unk_1E44A7E78;
    v16 = v11;
    v17 = v8;
    v13 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
  return v10;
}

uint64_t __126__LPAppStoreStoryMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
