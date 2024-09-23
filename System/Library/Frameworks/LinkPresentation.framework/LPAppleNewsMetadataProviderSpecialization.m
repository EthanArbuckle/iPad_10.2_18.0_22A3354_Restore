@implementation LPAppleNewsMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 64;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  LPAppleNewsMetadata *v14;
  id v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[LPPresentationSpecializations isAppleNewsURL:](LPPresentationSpecializations, "isAppleNewsURL:", v10))
  {

  }
  else
  {
    objc_msgSend(v8, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[LPPresentationSpecializations isStocksNewsURL:](LPPresentationSpecializations, "isStocksNewsURL:", v11);

    if (!v12)
    {
      v16 = 0;
      goto LABEL_6;
    }
  }
  v13 = (void *)objc_msgSend(v7, "copy");
  v14 = objc_alloc_init(LPAppleNewsMetadata);
  objc_msgSend(v13, "setSpecialization:", v14);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __122__LPAppleNewsMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke;
  v18[3] = &unk_1E44A7E78;
  v19 = v13;
  v20 = v9;
  v15 = v13;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

  v16 = 1;
LABEL_6:

  return v16;
}

uint64_t __122__LPAppleNewsMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
