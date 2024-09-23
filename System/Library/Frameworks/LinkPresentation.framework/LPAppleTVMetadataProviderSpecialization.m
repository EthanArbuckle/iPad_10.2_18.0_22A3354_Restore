@implementation LPAppleTVMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 32;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  LPAppleTVMetadata *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "URL");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = +[LPPresentationSpecializations isAppleTVURL:](LPPresentationSpecializations, "isAppleTVURL:", v10);

  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:](LPPresentationSpecializations, "isiTunesStoreOrAdjacentURL:", v12);

  objc_msgSend(v8, "postRedirectURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[LPPresentationSpecializations isAppleTVURL:](LPPresentationSpecializations, "isAppleTVURL:", v13);

  v15 = v11 | v10 & v14;
  if (v15)
  {
    v16 = (void *)objc_msgSend(v7, "copy");
    v17 = objc_alloc_init(LPAppleTVMetadata);
    objc_msgSend(v7, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleTVMetadata setTitle:](v17, "setTitle:", v18);

    objc_msgSend(v7, "appleSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleTVMetadata setSubtitle:](v17, "setSubtitle:", v19);

    objc_msgSend(v7, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleTVMetadata setArtwork:](v17, "setArtwork:", v20);

    objc_msgSend(v16, "setSpecialization:", v17);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __120__LPAppleTVMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke;
    v23[3] = &unk_1E44A7E78;
    v24 = v16;
    v25 = v9;
    v21 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], v23);

  }
  return v15;
}

uint64_t __120__LPAppleTVMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
