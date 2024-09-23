@implementation ICAttachmentMapModel(PreviewGeneration)

- (uint64_t)requiresNetworkToGeneratePreview
{
  return 1;
}

- (uint64_t)needToGeneratePreviews
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "metadataExists") & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(a1, "isGeneratingPreviews") ^ 1;

  v6 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    v19 = 1024;
    v20 = v5;
    _os_log_debug_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d", (uint8_t *)&v13, 0x26u);

  }
  return v5;
}

- (uint64_t)generateAsynchronousPreviews
{
  return 1;
}

- (BOOL)generatePreviewsInOperation:()PreviewGeneration
{
  id v4;
  _BOOL8 v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  id location;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  if ((objc_msgSend(a1, "isGeneratingPreviews") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "setGeneratingPreviews:", 1);
    v6 = dispatch_semaphore_create(0);
    objc_initWeak(&location, a1);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 1;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__23;
    v26 = __Block_byref_object_dispose__23;
    v27 = 0;
    objc_msgSend(a1, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
    v20[3] = &unk_1E5C1F7C0;
    objc_copyWeak(&v21, &location);
    v20[4] = &v22;
    objc_msgSend(v8, "performBlockAndWait:", v20);

    v10 = (void *)MEMORY[0x1AF445E78]();
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v23[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setNonAppInitiated:", 1);
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v12 = (void *)getLPMetadataProviderClass_softClass;
    v37 = getLPMetadataProviderClass_softClass;
    if (!getLPMetadataProviderClass_softClass)
    {
      v33[0] = v9;
      v33[1] = 3221225472;
      v33[2] = __getLPMetadataProviderClass_block_invoke;
      v33[3] = &unk_1E5C1DE18;
      v33[4] = &v34;
      __getLPMetadataProviderClass_block_invoke((uint64_t)v33);
      v12 = (void *)v35[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v34, 8);
    v14 = objc_alloc_init(v13);
    v15 = objc_loadWeakRetained(&location);
    v17 = v14;
    v18 = v11;
    v19 = v6;
    performBlockOnMainThread();

    objc_autoreleasePoolPop(v10);
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(a1, "setGeneratingPreviews:", 0);
    v5 = *((_BYTE *)v29 + 24) != 0;
    objc_destroyWeak(&v21);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
    objc_destroyWeak(&location);

  }
  return v5;
}

@end
