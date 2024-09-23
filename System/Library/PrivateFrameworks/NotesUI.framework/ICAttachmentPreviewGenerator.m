@implementation ICAttachmentPreviewGenerator

+ (ICAttachmentPreviewGenerator)sharedGenerator
{
  if (sharedGenerator_once != -1)
    dispatch_once(&sharedGenerator_once, &__block_literal_global_45);
  return (ICAttachmentPreviewGenerator *)(id)sharedGenerator;
}

void __47__ICAttachmentPreviewGenerator_sharedGenerator__block_invoke()
{
  ICAttachmentPreviewGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(ICAttachmentPreviewGenerator);
  v1 = (void *)sharedGenerator;
  sharedGenerator = (uint64_t)v0;

}

- (ICAttachmentPreviewGenerator)init
{
  ICAttachmentPreviewGenerator *v2;
  ICAttachmentPreviewGeneratorOperationQueue *v3;
  ICAttachmentPreviewGeneratorOperationQueue *generatorQueue;
  ICAttachmentPreviewGeneratorOperationQueue *v5;
  ICAttachmentPreviewGeneratorOperationQueue *asyncGeneratorQueue;
  ICAttachmentPreviewGeneratorOperationQueue *v7;
  ICAttachmentPreviewGeneratorOperationQueue *costlyGeneratorQueue;
  ICAttachmentPreviewGeneratorOperationQueue *v9;
  ICAttachmentPreviewGeneratorOperationQueue *postProcessingQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *previewQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *previewProgressQueue;
  Class v17;
  Class v18;
  uint64_t v19;
  NSMapTable *lastOperationForAttachmentID;
  uint64_t v21;
  NSMutableSet *attachmentIDsPending;
  uint64_t v23;
  NSMutableDictionary *attachmentIDsProgress;
  NSMutableOrderedSet *v25;
  NSMutableOrderedSet *postProcessingIDsPending;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  const __CFString *v30;
  NSObject *v31;
  const __CFString *v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  ICAttachmentPreviewGenerator *v38;
  Class v39;
  objc_super v40;
  uint8_t buf[4];
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)ICAttachmentPreviewGenerator;
  v2 = -[ICAttachmentPreviewGenerator init](&v40, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICAttachmentPreviewGeneratorOperationQueue);
    generatorQueue = v2->_generatorQueue;
    v2->_generatorQueue = v3;

    -[ICAttachmentPreviewGeneratorOperationQueue setName:](v2->_generatorQueue, "setName:", CFSTR("Generator Queue"));
    -[ICAttachmentPreviewGeneratorOperationQueue setMaxConcurrentOperationCount:](v2->_generatorQueue, "setMaxConcurrentOperationCount:", 1);
    v5 = objc_alloc_init(ICAttachmentPreviewGeneratorOperationQueue);
    asyncGeneratorQueue = v2->_asyncGeneratorQueue;
    v2->_asyncGeneratorQueue = v5;

    -[ICAttachmentPreviewGeneratorOperationQueue setName:](v2->_asyncGeneratorQueue, "setName:", CFSTR("Async Generator Queue"));
    -[ICAttachmentPreviewGeneratorOperationQueue setMaxConcurrentOperationCount:](v2->_asyncGeneratorQueue, "setMaxConcurrentOperationCount:", 2);
    v7 = objc_alloc_init(ICAttachmentPreviewGeneratorOperationQueue);
    costlyGeneratorQueue = v2->_costlyGeneratorQueue;
    v2->_costlyGeneratorQueue = v7;

    -[ICAttachmentPreviewGeneratorOperationQueue setName:](v2->_costlyGeneratorQueue, "setName:", CFSTR("Costly Generator Queue"));
    -[ICAttachmentPreviewGeneratorOperationQueue setMaxConcurrentOperationCount:](v2->_costlyGeneratorQueue, "setMaxConcurrentOperationCount:", 1);
    v9 = objc_alloc_init(ICAttachmentPreviewGeneratorOperationQueue);
    postProcessingQueue = v2->_postProcessingQueue;
    v2->_postProcessingQueue = v9;

    -[ICAttachmentPreviewGeneratorOperationQueue setName:](v2->_postProcessingQueue, "setName:", CFSTR("Attachment Post-Processing Queue"));
    -[ICAttachmentPreviewGeneratorOperationQueue setMaxConcurrentOperationCount:](v2->_postProcessingQueue, "setMaxConcurrentOperationCount:", 1);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.notes.preview-generator", v11);
    previewQueue = v2->_previewQueue;
    v2->_previewQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.notes.preview-generator-progress", v14);
    previewProgressQueue = v2->_previewProgressQueue;
    v2->_previewProgressQueue = (OS_dispatch_queue *)v15;

    v17 = NSClassFromString(CFSTR("ICProgressIndicatorTracker"));
    if (v17)
    {
      v18 = v17;
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __36__ICAttachmentPreviewGenerator_init__block_invoke;
      v37 = &unk_1E5C20B78;
      v38 = v2;
      v39 = v18;
      dispatch_async(MEMORY[0x1E0C80D38], &v34);

    }
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable", v34, v35, v36, v37);
    v19 = objc_claimAutoreleasedReturnValue();
    lastOperationForAttachmentID = v2->_lastOperationForAttachmentID;
    v2->_lastOperationForAttachmentID = (NSMapTable *)v19;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    attachmentIDsPending = v2->_attachmentIDsPending;
    v2->_attachmentIDsPending = (NSMutableSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    attachmentIDsProgress = v2->_attachmentIDsProgress;
    v2->_attachmentIDsProgress = (NSMutableDictionary *)v23;

    v25 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    postProcessingIDsPending = v2->_postProcessingIDsPending;
    v2->_postProcessingIDsPending = v25;

    -[ICAttachmentPreviewGenerator enableAutomaticPreviewGeneration](v2, "enableAutomaticPreviewGeneration");
    v27 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      if (objc_msgSend((id)objc_opt_class(), "docCamOCRGenerationEnabled"))
        v28 = CFSTR("enabled");
      else
        v28 = CFSTR("disabled");
      *(_DWORD *)buf = 138412290;
      v42 = v28;
      _os_log_impl(&dword_1AC7A1000, v27, OS_LOG_TYPE_INFO, "DocCam OCR Generation is %@", buf, 0xCu);
    }

    v29 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      if (objc_msgSend((id)objc_opt_class(), "imageOCRGenerationEnabled"))
        v30 = CFSTR("enabled");
      else
        v30 = CFSTR("disabled");
      *(_DWORD *)buf = 138412290;
      v42 = v30;
      _os_log_impl(&dword_1AC7A1000, v29, OS_LOG_TYPE_INFO, "Image OCR Generation is %@", buf, 0xCu);
    }

    v31 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      if (objc_msgSend((id)objc_opt_class(), "imageClassificationEnabled"))
        v32 = CFSTR("enabled");
      else
        v32 = CFSTR("disabled");
      *(_DWORD *)buf = 138412290;
      v42 = v32;
      _os_log_impl(&dword_1AC7A1000, v31, OS_LOG_TYPE_INFO, "Image Classification is %@", buf, 0xCu);
    }

  }
  return v2;
}

void __36__ICAttachmentPreviewGenerator_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithDelegate:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentPreviewGenerator;
  -[ICAttachmentPreviewGenerator dealloc](&v4, sel_dealloc);
}

- (void)progressIndicatorTrackerStartAnimation
{
  id v2;

  -[ICAttachmentPreviewGenerator costlyGeneratorQueue](self, "costlyGeneratorQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 1);

}

- (void)progressIndicatorTrackerStopAnimation
{
  id v2;

  -[ICAttachmentPreviewGenerator costlyGeneratorQueue](self, "costlyGeneratorQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 0);

}

- (BOOL)isPreviewGenerationSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasContextOptions:", 32);

  return v3;
}

- (BOOL)previewOperationsIdle
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  -[ICAttachmentPreviewGenerator attachmentIDsPending](self, "attachmentIDsPending");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[ICAttachmentPreviewGenerator generatorQueue](self, "generatorQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 | objc_msgSend(v5, "operationCount");

  -[ICAttachmentPreviewGenerator costlyGeneratorQueue](self, "costlyGeneratorQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "operationCount");

  -[ICAttachmentPreviewGenerator asyncGeneratorQueue](self, "asyncGeneratorQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "operationCount");

  return !v6 && (v8 | v10) == 0;
}

- (void)generatePreviewsIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  if (-[ICAttachmentPreviewGenerator isPreviewGenerationSupported](self, "isPreviewGenerationSupported"))
  {
    -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ICAttachmentPreviewGenerator_generatePreviewsIfNeeded__block_invoke;
    block[3] = &unk_1E5C1D540;
    block[4] = self;
    dispatch_async(v3, block);

    -[ICAttachmentPreviewGenerator generatePendingPreviews](self, "generatePendingPreviews");
  }
}

void __56__ICAttachmentPreviewGenerator_generatePreviewsIfNeeded__block_invoke(uint64_t a1)
{
  id v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "previewGenerationState") <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreviewGenerationState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "attachmentIDsPending");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeAllObjects");

  }
}

+ (BOOL)docCamOCRGenerationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICDocCamOCRDisabledDefaultsKey")) ^ 1;

  return v3;
}

+ (BOOL)universalSearchProcessingLibraryEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)imageOCRGenerationEnabled
{
  int v2;
  void *v3;

  if ((objc_msgSend(a1, "universalSearchProcessingLibraryEnabled") & 1) != 0)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ICImageOCRDisabledDefaultsKey")) ^ 1;

  }
  return v2;
}

+ (BOOL)imageClassificationEnabled
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if ((objc_msgSend(a1, "universalSearchProcessingLibraryEnabled") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ICImageClassificationDisabledDefaultsKey"));

  if ((v4 & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("ICImageClassificationTemporarilyDisabledUntilDateDefaultsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:", v8);

      if (v10 == -1)
      {
        v5 = 1;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("ICImageClassificationTemporarilyDisabledUntilDateDefaultsKey"));

    }
    v5 = 0;
LABEL_10:

    return v5 ^ 1;
  }
  v5 = 1;
  return v5 ^ 1;
}

+ (void)setImageClassificationTemporarilyDisabled:(BOOL)a3
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10800.0);
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("ICImageClassificationTemporarilyDisabledUntilDateDefaultsKey"));

    v5 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1AC7A1000, v5, OS_LOG_TYPE_INFO, "image classification temporarily disabled until %@", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("ICImageClassificationTemporarilyDisabledUntilDateDefaultsKey"));

    v3 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1AC7A1000, v3, OS_LOG_TYPE_INFO, "image classification no longer temporarily disabled", (uint8_t *)&v7, 2u);
    }
  }

}

+ (void)purgeImageClassificationsInContext:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__ICAttachmentPreviewGenerator_purgeImageClassificationsInContext___block_invoke;
  v5[3] = &unk_1E5C1D540;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __67__ICAttachmentPreviewGenerator_purgeImageClassificationsInContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639F0], "predicateForPasswordProtected:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(imageClassificationSummary != nil)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v8[0] = v2;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D639F0], "attachmentsMatchingPredicate:context:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_52);

}

void __67__ICAttachmentPreviewGenerator_purgeImageClassificationsInContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  v2 = (void *)MEMORY[0x1AF445E78]();
  objc_msgSend(v3, "setImageClassificationSummary:", 0);
  objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Purged image classification"));
  objc_autoreleasePoolPop(v2);

}

+ (void)purgeOCRInContext:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__ICAttachmentPreviewGenerator_purgeOCRInContext___block_invoke;
  v5[3] = &unk_1E5C1D540;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __50__ICAttachmentPreviewGenerator_purgeOCRInContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639F0], "predicateForPasswordProtected:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(ocrSummary != nil)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v8[0] = v2;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D639F0], "attachmentsMatchingPredicate:context:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_57);

}

void __50__ICAttachmentPreviewGenerator_purgeOCRInContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  v2 = (void *)MEMORY[0x1AF445E78]();
  objc_msgSend(v3, "setOcrSummary:", 0);
  objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Purged OCR"));
  objc_autoreleasePoolPop(v2);

}

- (void)fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
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
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(media != nil)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D639F0], "predicateForPasswordProtected:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D639F0], "notDeletedPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(imageClassificationSummary == nil)"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(imageClassificationSummaryVersion < %d)"), (__int16)*MEMORY[0x1E0D635D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v26[0] = v20;
  v26[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3528];
  v25[0] = v7;
  v25[1] = v9;
  v25[2] = v13;
  v25[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __114__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext_completion___block_invoke;
  v21[3] = &unk_1E5C20C00;
  v22 = v16;
  v23 = v5;
  v24 = v6;
  v17 = v6;
  v18 = v5;
  v19 = v16;
  objc_msgSend(v18, "performBlock:", v21);

}

void __114__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext_completion___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D639F0], "ic_objectIDsMatchingPredicate:context:", a1[4], a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
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
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(media != nil)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D639F0], "predicateForPasswordProtected:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D639F0], "notDeletedPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(ocrSummary == nil)"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(ocrSummaryVersion < %d)"), (__int16)*MEMORY[0x1E0D635D8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v26[0] = v20;
  v26[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3528];
  v25[0] = v7;
  v25[1] = v13;
  v25[2] = v8;
  v25[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext_completion___block_invoke;
  v21[3] = &unk_1E5C20C00;
  v22 = v16;
  v23 = v5;
  v24 = v6;
  v17 = v6;
  v18 = v5;
  v19 = v16;
  objc_msgSend(v18, "performBlock:", v21);

}

void __98__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext_completion___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D639F0], "ic_objectIDsMatchingPredicate:context:", a1[4], a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)fetchMissingOrOutdatedMetaDataAttachmentIDsInContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedMetaDataAttachmentIDsInContext_completion___block_invoke;
  v10[3] = &unk_1E5C20C50;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ICAttachmentPreviewGenerator fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext:completion:](self, "fetchMissingOrOutdatedOCRSummaryAttachmentIDsInContext:completion:", v9, v10);

}

void __96__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedMetaDataAttachmentIDsInContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedMetaDataAttachmentIDsInContext_completion___block_invoke_2;
  v7[3] = &unk_1E5C20C28;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "fetchMissingOrOutdatedImageClassificationSummaryAttachmentIDsInContext:completion:", v5, v7);

}

void __96__ICAttachmentPreviewGenerator_fetchMissingOrOutdatedMetaDataAttachmentIDsInContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "setWithArray:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v5);

  objc_msgSend(v7, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ICAttachmentPreviewGenerator *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke;
  v6[3] = &unk_1E5C20CA0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[ICAttachmentPreviewGenerator fetchMissingOrOutdatedMetaDataAttachmentIDsInContext:completion:](self, "fetchMissingOrOutdatedMetaDataAttachmentIDsInContext:completion:", v5, v6);

}

void __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke_2;
  v8[3] = &unk_1E5C1D7C0;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v4, "performBlock:", v8);

}

void __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke_3;
  v5[3] = &unk_1E5C20C78;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __93__ICAttachmentPreviewGenerator_generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1AF445E78]();
  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", v5, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend((id)objc_opt_class(), "imageOCRGenerationEnabled") & 1) != 0
     || objc_msgSend((id)objc_opt_class(), "imageClassificationEnabled"))
    && objc_msgSend(v4, "attachmentType") == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "postProcessIfNeededForAttachment:", v4);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)generatePreviewIfNeededForAttachment:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  ICAttachmentPreviewGenerator *v12;
  id v13;

  v4 = a3;
  if (-[ICAttachmentPreviewGenerator isPreviewGenerationSupported](self, "isPreviewGenerationSupported"))
  {
    objc_msgSend(v4, "ic_permanentObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __69__ICAttachmentPreviewGenerator_generatePreviewIfNeededForAttachment___block_invoke;
    v11 = &unk_1E5C1D9A8;
    v12 = self;
    v13 = v5;
    v7 = v5;
    dispatch_async(v6, &v8);

    -[ICAttachmentPreviewGenerator generatePendingPreviews](self, "generatePendingPreviews", v8, v9, v10, v11, v12);
    -[ICAttachmentPreviewGenerator postProcessIfNeededForAttachment:](self, "postProcessIfNeededForAttachment:", v4);

  }
}

void __69__ICAttachmentPreviewGenerator_generatePreviewIfNeededForAttachment___block_invoke(uint64_t a1)
{
  id v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "previewGenerationState") <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreviewGenerationState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "attachmentIDsPending");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  }
}

- (void)generatePreviewIfNeededForAttachmentWithObjectID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (-[ICAttachmentPreviewGenerator isPreviewGenerationSupported](self, "isPreviewGenerationSupported"))
  {
    if (objc_msgSend(v5, "isTemporaryID"))
    {
      v6 = (void *)MEMORY[0x1E0D641A0];
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!attachmentObjectID.isTemporaryID", "-[ICAttachmentPreviewGenerator generatePreviewIfNeededForAttachmentWithObjectID:]", 1, 0, CFSTR("Can't send a temporary ID to %@"), v7);

    }
    -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__ICAttachmentPreviewGenerator_generatePreviewIfNeededForAttachmentWithObjectID___block_invoke;
    block[3] = &unk_1E5C1D9A8;
    block[4] = self;
    v10 = v5;
    dispatch_async(v8, block);

    -[ICAttachmentPreviewGenerator generatePendingPreviews](self, "generatePendingPreviews");
  }

}

void __81__ICAttachmentPreviewGenerator_generatePreviewIfNeededForAttachmentWithObjectID___block_invoke(uint64_t a1)
{
  id v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "previewGenerationState") <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreviewGenerationState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "attachmentIDsPending");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  }
}

- (void)attachmentNeedsPostProcessingNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:context:", v5, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    -[ICAttachmentPreviewGenerator postProcessIfNeededForAttachment:](self, "postProcessIfNeededForAttachment:", v9);
    v8 = v9;
  }

}

- (void)postProcessIfNeededForAttachment:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "docCamOCRGenerationEnabled") & 1) != 0
    || (objc_msgSend((id)objc_opt_class(), "imageOCRGenerationEnabled") & 1) != 0
    || objc_msgSend((id)objc_opt_class(), "imageClassificationEnabled"))
  {
    objc_msgSend(v4, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "needToPostProcessAttachment");

    if (v6)
    {
      -[ICAttachmentPreviewGenerator postProcessingQueue](self, "postProcessingQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelOperationsForAttachment:", v4);

      objc_msgSend(v4, "identifier");
      -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __65__ICAttachmentPreviewGenerator_postProcessIfNeededForAttachment___block_invoke;
      v9[3] = &unk_1E5C1D9A8;
      v9[4] = self;
      v10 = v4;
      dispatch_async(v8, v9);

    }
  }

}

uint64_t __65__ICAttachmentPreviewGenerator_postProcessIfNeededForAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "postProcessingIDsPending");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "beginPostProcessingAfterDelayIfNecessaryWithForceDelay:", 1);
}

- (void)beginPostProcessingAfterDelayIfNecessaryWithForceDelay:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  if ((objc_msgSend((id)objc_opt_class(), "docCamOCRGenerationEnabled") & 1) != 0
    || (objc_msgSend((id)objc_opt_class(), "imageOCRGenerationEnabled") & 1) != 0
    || objc_msgSend((id)objc_opt_class(), "imageClassificationEnabled"))
  {
    -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87__ICAttachmentPreviewGenerator_beginPostProcessingAfterDelayIfNecessaryWithForceDelay___block_invoke;
    v6[3] = &unk_1E5C20CC8;
    v6[4] = self;
    v7 = a3;
    dispatch_async(v5, v6);

  }
}

void __87__ICAttachmentPreviewGenerator_beginPostProcessingAfterDelayIfNecessaryWithForceDelay___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "postProcessingIDsPending");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    if (*(_BYTE *)(a1 + 40) || !objc_msgSend(*(id *)(a1 + 32), "previewOperationsIdle"))
    {
      v4 = *(void **)(a1 + 32);
      v5 = objc_msgSend(v4, "postProcessingRequestIndex") + 1;
      objc_msgSend(v4, "setPostProcessingRequestIndex:", v5);
      v6 = dispatch_time(0, 2000000000);
      objc_msgSend(*(id *)(a1 + 32), "previewQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __87__ICAttachmentPreviewGenerator_beginPostProcessingAfterDelayIfNecessaryWithForceDelay___block_invoke_2;
      v8[3] = &unk_1E5C1E560;
      v8[4] = *(_QWORD *)(a1 + 32);
      v8[5] = v5;
      dispatch_after(v6, v7, v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "postProcessPendingPreviews");
    }
  }
}

void __87__ICAttachmentPreviewGenerator_beginPostProcessingAfterDelayIfNecessaryWithForceDelay___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(*(id *)(a1 + 32), "postProcessingRequestIndex") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "postProcessingIDsPending");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (v3)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "previewOperationsIdle"))
        objc_msgSend(*(id *)(a1 + 32), "postProcessPendingPreviews");
    }
  }
}

- (void)postProcessPendingPreviews
{
  NSObject *v3;
  _QWORD block[5];

  if ((objc_msgSend((id)objc_opt_class(), "docCamOCRGenerationEnabled") & 1) != 0
    || (objc_msgSend((id)objc_opt_class(), "imageOCRGenerationEnabled") & 1) != 0
    || objc_msgSend((id)objc_opt_class(), "imageClassificationEnabled"))
  {
    -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke;
    block[3] = &unk_1E5C1D540;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

void __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  if (objc_msgSend(*(id *)(a1 + 32), "previewOperationsIdle"))
  {
    objc_msgSend(*(id *)(a1 + 32), "postProcessingIDsPending");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "postProcessingIDsPending");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObject:", v7);

      objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "workerManagedObjectContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke_2;
      v8[3] = &unk_1E5C1D7C0;
      v9 = v7;
      v10 = v5;
      v11 = *(_QWORD *)(a1 + 32);
      v6 = v5;
      objc_msgSend(v6, "performBlockAndWait:", v8);

    }
  }
}

void __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;

  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "needToPostProcessAttachment");

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "postProcessPreviewForAttachment:", v4);
    }
    else
    {
      objc_msgSend(v4, "identifier");

    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke_2_cold_1(v2, v7, v8);

  }
}

- (void)postProcessPreviewForAttachment:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  ICAttachmentPreviewGeneratorOCROperation *v7;
  char v8;
  ICAttachmentPreviewGeneratorOCROperation *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  ICAttachmentPreviewGeneratorImageClassificationOperation *v15;
  void *v16;
  ICAttachmentPreviewGeneratorImageClassificationOperation *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[ICAttachmentPreviewGenerator adjustUserTitleIfNecessaryForAttachment:](self, "adjustUserTitleIfNecessaryForAttachment:", v19);
  objc_msgSend(v19, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "needToPostProcessAttachment");

  v6 = v19;
  if (!v5)
    goto LABEL_13;
  objc_msgSend(v19, "attachmentModel");
  v7 = (ICAttachmentPreviewGeneratorOCROperation *)objc_claimAutoreleasedReturnValue();
  if (!-[ICAttachmentPreviewGeneratorOCROperation supportsOCR](v7, "supportsOCR"))
    goto LABEL_9;
  if (objc_msgSend((id)objc_opt_class(), "docCamOCRGenerationEnabled")
    && (objc_msgSend(v19, "isChildOfDocumentGallery") & 1) != 0)
  {

    goto LABEL_8;
  }
  if (!objc_msgSend((id)objc_opt_class(), "imageOCRGenerationEnabled"))
  {
LABEL_9:

    goto LABEL_10;
  }
  v8 = objc_msgSend(v19, "isImage");

  if ((v8 & 1) != 0)
  {
LABEL_8:
    v9 = [ICAttachmentPreviewGeneratorOCROperation alloc];
    objc_msgSend(v19, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICAttachmentPreviewGeneratorOperation initWithAttachmentManagedObjectID:](v9, "initWithAttachmentManagedObjectID:", v10);

    -[ICAttachmentPreviewGenerator postProcessingQueue](self, "postProcessingQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v7);

    goto LABEL_9;
  }
LABEL_10:
  v12 = objc_msgSend((id)objc_opt_class(), "imageClassificationEnabled");
  v6 = v19;
  if (v12)
  {
    objc_msgSend(v19, "attachmentModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "supportsImageClassification");

    v6 = v19;
    if (v14)
    {
      v15 = [ICAttachmentPreviewGeneratorImageClassificationOperation alloc];
      objc_msgSend(v19, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[ICAttachmentPreviewGeneratorOperation initWithAttachmentManagedObjectID:](v15, "initWithAttachmentManagedObjectID:", v16);

      -[ICAttachmentPreviewGenerator postProcessingQueue](self, "postProcessingQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addOperation:", v17);

      v6 = v19;
    }
  }
LABEL_13:

}

- (void)adjustUserTitleIfNecessaryForAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "parentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (objc_msgSend(v3, "isChildOfDocumentGallery"))
  {
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v4, "userTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v3, "parentAttachment");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attachmentModel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        ICDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v22 = &v21;
        v23 = 0x2020000000;
        v24 = 0;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __72__ICAttachmentPreviewGenerator_adjustUserTitleIfNecessaryForAttachment___block_invoke;
        v20[3] = &unk_1E5C20CF0;
        v20[4] = &v21;
        objc_msgSend(v11, "enumerateSubAttachmentsWithBlock:", v20);
        if (!*((_BYTE *)v22 + 24))
        {
          v12 = os_log_create("com.apple.notes", "PreviewGeneration");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v4, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAttachmentPreviewGenerator adjustUserTitleIfNecessaryForAttachment:].cold.1(v13, (uint64_t)v25, v12);
          }

          objc_msgSend(v4, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setUserTitle:", v14);

          objc_msgSend(v4, "note");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "regenerateTitle:snippet:", 1, 1);

          if (v16)
          {
            objc_msgSend(v4, "note");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "markShareDirtyIfNeededWithReason:", CFSTR("Regenerated title from attachment OCR"));

            objc_msgSend(v4, "note");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "updateChangeCountWithReason:", CFSTR("Regenerated title from attachment OCR"));

          }
          objc_msgSend(v4, "managedObjectContext");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "ic_save");

        }
        _Block_object_dispose(&v21, 8);

      }
    }
  }

}

void __72__ICAttachmentPreviewGenerator_adjustUserTitleIfNecessaryForAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;

  objc_msgSend(a2, "ocrSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (void)attachmentNeedsPreviewGenerationNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICAttachmentPreviewGenerator *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__ICAttachmentPreviewGenerator_attachmentNeedsPreviewGenerationNotification___block_invoke;
  v7[3] = &unk_1E5C1DA48;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBackgroundTask:", v7);

}

void __77__ICAttachmentPreviewGenerator_attachmentNeedsPreviewGenerationNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0D639F0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_existingObjectWithID:context:", v6, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "generatePreviewIfNeededForAttachment:", v8);
    v7 = v8;
  }

}

- (void)attachmentWillBeDeleted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewGenerator generatorQueue](self, "generatorQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelOperationsForAttachment:", v8);

  -[ICAttachmentPreviewGenerator asyncGeneratorQueue](self, "asyncGeneratorQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelOperationsForAttachment:", v8);

  -[ICAttachmentPreviewGenerator costlyGeneratorQueue](self, "costlyGeneratorQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelOperationsForAttachment:", v8);

  -[ICAttachmentPreviewGenerator postProcessingQueue](self, "postProcessingQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelOperationsForAttachment:", v8);

}

- (void)mediaDidLoad:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0D63BA8];
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:context:", v5, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[ICAttachmentPreviewGenerator generatePreviewIfNeededForAttachment:](self, "generatePreviewIfNeededForAttachment:", v8);

}

- (void)reachabilityChanged:(id)a3
{
  void *v4;
  BOOL *p_shouldGenerateAttachmentsWhenReachable;
  int v6;

  objc_msgSend(MEMORY[0x1E0D64250], "sharedReachabilityForInternetConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    p_shouldGenerateAttachmentsWhenReachable = &self->_shouldGenerateAttachmentsWhenReachable;
    while (1)
    {
      v6 = __ldaxr((unsigned __int8 *)p_shouldGenerateAttachmentsWhenReachable);
      if (v6 != 1)
        break;
      if (!__stlxr(0, (unsigned __int8 *)p_shouldGenerateAttachmentsWhenReachable))
      {
        -[ICAttachmentPreviewGenerator generatePreviewsIfNeeded](self, "generatePreviewsIfNeeded");
        return;
      }
    }
    __clrex();
  }
}

- (void)cancelGenerationOfPendingPreviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICAttachmentPreviewGenerator generatorQueue](self, "generatorQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  -[ICAttachmentPreviewGenerator asyncGeneratorQueue](self, "asyncGeneratorQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

  -[ICAttachmentPreviewGenerator costlyGeneratorQueue](self, "costlyGeneratorQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllOperations");

  -[ICAttachmentPreviewGenerator postProcessingQueue](self, "postProcessingQueue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllOperations");

}

- (void)didReceiveMemoryWarning
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "ICAttachmentPreviewGenerator received a memory warning. Canceling OCR operations", a5, a6, a7, a8, 0);
}

- (void)enableAutomaticPreviewGeneration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_attachmentDidLoad_, *MEMORY[0x1E0D63608], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_attachmentNeedsPreviewGenerationNotification_, *MEMORY[0x1E0D63640], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_attachmentWillBeDeleted_, *MEMORY[0x1E0D636D8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_mediaDidLoad_, *MEMORY[0x1E0D63768], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C978A0];
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_managedObjectContextDidSave_, v8, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_reachabilityChanged_, *MEMORY[0x1E0D64498], 0);

}

- (void)disableAutomaticPreviewGeneration
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)suspend
{
  NSObject *v3;
  _QWORD block[5];

  -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICAttachmentPreviewGenerator_suspend__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_async(v3, block);

}

void __39__ICAttachmentPreviewGenerator_suspend__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "generatorQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

  objc_msgSend(*(id *)(a1 + 32), "asyncGeneratorQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  objc_msgSend(*(id *)(a1 + 32), "costlyGeneratorQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  objc_msgSend(*(id *)(a1 + 32), "postProcessingQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspend");

}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ICAttachmentPreviewGenerator_resume__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __38__ICAttachmentPreviewGenerator_resume__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "generatorQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

  objc_msgSend(*(id *)(a1 + 32), "asyncGeneratorQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resume");

  objc_msgSend(*(id *)(a1 + 32), "costlyGeneratorQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

  objc_msgSend(*(id *)(a1 + 32), "postProcessingQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

  return objc_msgSend(*(id *)(a1 + 32), "beginPostProcessingAfterDelayIfNecessaryWithForceDelay:", 0);
}

- (void)operationComplete:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICAttachmentPreviewGenerator_operationComplete___block_invoke;
  v7[3] = &unk_1E5C1D9A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__ICAttachmentPreviewGenerator_operationComplete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "lastOperationForAttachmentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "attachmentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(id *)(a1 + 40);
  if (v9 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastOperationForAttachmentID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "attachmentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    v4 = *(id *)(a1 + 40);
  }
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v4, "type") != 2 && objc_msgSend(*(id *)(a1 + 40), "type") != 3;
  objc_msgSend(v7, "beginPostProcessingAfterDelayIfNecessaryWithForceDelay:", v8);

}

- (void)setProgress:(id)a3 forObjectID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICAttachmentPreviewGenerator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ICAttachmentPreviewGenerator previewProgressQueue](self, "previewProgressQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICAttachmentPreviewGenerator_setProgress_forObjectID___block_invoke;
  block[3] = &unk_1E5C1D7C0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __56__ICAttachmentPreviewGenerator_setProgress_forObjectID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attachmentIDsProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);
  else
    objc_msgSend(v3, "removeObjectForKey:", v4);

}

- (id)progressForObjectID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__40;
  v16 = __Block_byref_object_dispose__40;
  v17 = 0;
  -[ICAttachmentPreviewGenerator previewProgressQueue](self, "previewProgressQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ICAttachmentPreviewGenerator_progressForObjectID___block_invoke;
  block[3] = &unk_1E5C1E190;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__ICAttachmentPreviewGenerator_progressForObjectID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachmentIDsProgress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)generatePendingPreviews
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Skipping generation of pending previews because we're running inside of an extension (iPhone System Paper).", a5, a6, a7, a8, 0);
}

void __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  if (objc_msgSend(*(id *)(a1 + 32), "previewGenerationState"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "previewGenerationState") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "attachmentIDsPending");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v2, "copy");

    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setPreviewGenerationState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "attachmentIDsPending");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workerManagedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke_2;
    v9[3] = &unk_1E5C1D7C0;
    v10 = v3;
    v11 = v6;
    v12 = *(_QWORD *)(a1 + 32);
    v7 = v6;
    v8 = v3;
    objc_msgSend(v7, "performBlockAndWait:", v9);

  }
}

void __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
          v9 = (void *)MEMORY[0x1AF445E78]();
          objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", v8, *(_QWORD *)(a1 + 40));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(*(id *)(a1 + 48), "generatePendingPreviewForAttachment:", v10);
            if ((objc_msgSend(v10, "hasChanges") & 1) == 0)
              objc_msgSend(*(id *)(a1 + 40), "refreshObject:mergeChanges:", v10, 0);
          }
          else
          {
            v11 = os_log_create("com.apple.notes", "PreviewGeneration");
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v8;
              _os_log_debug_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEBUG, "unable to find attachment for generating preview: %@", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v5);
    }

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke_119;
    v13[3] = &unk_1E5C20D18;
    v12 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D639F0], "enumerateAttachmentsInContext:batchSize:visibleOnly:saveAfterBatch:usingBlock:", v12, 1, 1, 0, v13);
  }
}

uint64_t __55__ICAttachmentPreviewGenerator_generatePendingPreviews__block_invoke_119(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "generatePendingPreviewForAttachment:", a2);
}

- (void)generatePendingPreviewForAttachment:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  ICAttachmentPreviewGenerator *v13;

  v4 = a3;
  if (-[ICAttachmentPreviewGenerator isPreviewGenerationSupported](self, "isPreviewGenerationSupported"))
  {
    objc_msgSend(v4, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "tooLargeForPreviewGeneration");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v4, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentPreviewGenerator previewQueue](self, "previewQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke;
      block[3] = &unk_1E5C1D7C0;
      v11 = v7;
      v12 = v4;
      v13 = self;
      v9 = v7;
      dispatch_async(v8, block);

    }
  }

}

void __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke_2;
  v5[3] = &unk_1E5C1D7C0;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "performBlockAndWait:", v5);

}

uint64_t __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke_2(id *a1)
{
  id *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *p_super;
  ICAttachmentPreviewGeneratorOperation *v28;
  void *v29;
  void *v30;
  int v31;

  v2 = a1 + 4;
  if ((objc_msgSend(a1[4], "isDeleted") & 1) == 0 && (objc_msgSend(*v2, "markedForDeletion") & 1) == 0)
  {
    objc_msgSend(*v2, "attachmentModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "hasPreviews") & 1) == 0)
    {

      return objc_msgSend(a1[5], "ic_refreshObject:mergeChanges:", a1[4], 0);
    }
    objc_msgSend(*v2, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPasswordProtectedAndLocked");

    if (!v5)
    {
      objc_msgSend(*v2, "attachmentModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "requiresNetworkToGeneratePreview");

      if (v7
        && (objc_msgSend(MEMORY[0x1E0D64250], "sharedReachabilityForInternetConnection"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "currentReachabilityStatus"),
            v8,
            !v9))
      {
        objc_msgSend(a1[6], "setShouldGenerateAttachmentsWhenReachable:", 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "ic_isAppExtension") & 1) != 0)
        {
          objc_msgSend(*v2, "note");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "markedForDeletion");

          if ((v12 & 1) == 0)
            return objc_msgSend(a1[5], "ic_refreshObject:mergeChanges:", a1[4], 0);
        }
        else
        {

        }
        objc_msgSend(*v2, "attachmentModel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "needToGeneratePreviews");

        if (v14)
        {
          objc_msgSend(*v2, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v2, "attachmentModel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "generateAsynchronousPreviews");

          if (v17)
          {
            objc_msgSend(a1[6], "asyncGeneratorQueue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(a1[4], "attachmentModel");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "generatePreviewsDuringCloudActivity");

            v21 = a1[6];
            if ((v20 & 1) != 0)
              objc_msgSend(v21, "generatorQueue");
            else
              objc_msgSend(v21, "costlyGeneratorQueue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v22 = v18;
          objc_msgSend(v18, "suspend");
          objc_msgSend(a1[6], "lastOperationForAttachmentID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24
            && (objc_msgSend(v24, "dependencies"),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v26 = objc_msgSend(v25, "count"),
                v25,
                v26))
          {
            p_super = os_log_create("com.apple.notes", "PreviewGeneration");
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
              __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke_2_cold_1(v2, p_super);

          }
          else
          {
            v28 = -[ICAttachmentPreviewGeneratorOperation initWithAttachmentManagedObjectID:]([ICAttachmentPreviewGeneratorOperation alloc], "initWithAttachmentManagedObjectID:", v15);
            p_super = &v28->super.super;
            if (v24)
              -[ICAttachmentPreviewGeneratorOperation addDependency:](v28, "addDependency:", v24);
            objc_msgSend(v22, "addOperation:", p_super);
            objc_msgSend(a1[6], "lastOperationForAttachmentID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKey:", p_super, v15);

          }
          objc_msgSend(*v2, "attachmentModel");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "requiresPostProcessing");

          if (v31)
            objc_msgSend(a1[6], "postProcessIfNeededForAttachment:", a1[4]);
          objc_msgSend(v22, "resume");

        }
      }
    }
  }
  return objc_msgSend(a1[5], "ic_refreshObject:mergeChanges:", a1[4], 0);
}

- (void)cancelIfNeededForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  ICAttachmentPreviewGenerator *v25;
  void *v26;
  id obj;
  uint64_t v28;
  _QWORD block[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICAttachmentPreviewGenerator suspend](self, "suspend");
  v26 = v4;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewGenerator asyncGeneratorQueue](self, "asyncGeneratorQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v6;
  -[ICAttachmentPreviewGenerator costlyGeneratorQueue](self, "costlyGeneratorQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v7;
  -[ICAttachmentPreviewGenerator generatorQueue](self, "generatorQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v8;
  v25 = self;
  -[ICAttachmentPreviewGenerator postProcessingQueue](self, "postProcessingQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v11)
  {
    v12 = v11;
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v14, "operations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v32 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
              objc_msgSend(v20, "attachmentID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqual:", v5);

              if (v22)
                objc_msgSend(v20, "cancel");
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v17);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v12);
  }

  -[ICAttachmentPreviewGenerator previewQueue](v25, "previewQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ICAttachmentPreviewGenerator_cancelIfNeededForAttachment___block_invoke;
  block[3] = &unk_1E5C1D9A8;
  block[4] = v25;
  v30 = v5;
  v24 = v5;
  dispatch_sync(v23, block);

  -[ICAttachmentPreviewGenerator resume](v25, "resume");
}

void __60__ICAttachmentPreviewGenerator_cancelIfNeededForAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "attachmentIDsPending");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "postProcessingIDsPending");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (ICAttachmentPreviewGeneratorOperationQueue)asyncGeneratorQueue
{
  return self->_asyncGeneratorQueue;
}

- (void)setAsyncGeneratorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_asyncGeneratorQueue, a3);
}

- (ICAttachmentPreviewGeneratorOperationQueue)costlyGeneratorQueue
{
  return self->_costlyGeneratorQueue;
}

- (void)setCostlyGeneratorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_costlyGeneratorQueue, a3);
}

- (ICAttachmentPreviewGeneratorOperationQueue)generatorQueue
{
  return self->_generatorQueue;
}

- (void)setGeneratorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_generatorQueue, a3);
}

- (NSMapTable)lastOperationForAttachmentID
{
  return self->_lastOperationForAttachmentID;
}

- (void)setLastOperationForAttachmentID:(id)a3
{
  objc_storeStrong((id *)&self->_lastOperationForAttachmentID, a3);
}

- (NSMutableSet)attachmentIDsPending
{
  return self->_attachmentIDsPending;
}

- (void)setAttachmentIDsPending:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentIDsPending, a3);
}

- (NSMutableDictionary)attachmentIDsProgress
{
  return self->_attachmentIDsProgress;
}

- (void)setAttachmentIDsProgress:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentIDsProgress, a3);
}

- (ICProgressIndicatorTracking)progressTracker
{
  return self->_progressTracker;
}

- (void)setProgressTracker:(id)a3
{
  objc_storeStrong((id *)&self->_progressTracker, a3);
}

- (ICAttachmentPreviewGeneratorOperationQueue)postProcessingQueue
{
  return self->_postProcessingQueue;
}

- (void)setPostProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_postProcessingQueue, a3);
}

- (NSMutableOrderedSet)postProcessingIDsPending
{
  return self->_postProcessingIDsPending;
}

- (void)setPostProcessingIDsPending:(id)a3
{
  objc_storeStrong((id *)&self->_postProcessingIDsPending, a3);
}

- (unint64_t)postProcessingRequestIndex
{
  return self->_postProcessingRequestIndex;
}

- (void)setPostProcessingRequestIndex:(unint64_t)a3
{
  self->_postProcessingRequestIndex = a3;
}

- (unint64_t)previewGenerationState
{
  return self->_previewGenerationState;
}

- (void)setPreviewGenerationState:(unint64_t)a3
{
  self->_previewGenerationState = a3;
}

- (OS_dispatch_queue)previewQueue
{
  return self->_previewQueue;
}

- (void)setPreviewQueue:(id)a3
{
  objc_storeStrong((id *)&self->_previewQueue, a3);
}

- (OS_dispatch_queue)previewProgressQueue
{
  return self->_previewProgressQueue;
}

- (void)setPreviewProgressQueue:(id)a3
{
  objc_storeStrong((id *)&self->_previewProgressQueue, a3);
}

- (BOOL)shouldGenerateAttachmentsWhenReachable
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldGenerateAttachmentsWhenReachable);
  return v2 & 1;
}

- (void)setShouldGenerateAttachmentsWhenReachable:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_shouldGenerateAttachmentsWhenReachable);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewProgressQueue, 0);
  objc_storeStrong((id *)&self->_previewQueue, 0);
  objc_storeStrong((id *)&self->_postProcessingIDsPending, 0);
  objc_storeStrong((id *)&self->_postProcessingQueue, 0);
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_attachmentIDsProgress, 0);
  objc_storeStrong((id *)&self->_attachmentIDsPending, 0);
  objc_storeStrong((id *)&self->_lastOperationForAttachmentID, 0);
  objc_storeStrong((id *)&self->_generatorQueue, 0);
  objc_storeStrong((id *)&self->_costlyGeneratorQueue, 0);
  objc_storeStrong((id *)&self->_asyncGeneratorQueue, 0);
}

void __58__ICAttachmentPreviewGenerator_postProcessPendingPreviews__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, a3, "unable to find attachment for post processing: %@", (uint8_t *)&v4);
}

- (void)adjustUserTitleIfNecessaryForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a3, (uint64_t)a3, "Clearing OCR generated user title from gallery attachment %@", (uint8_t *)a2);

}

void __68__ICAttachmentPreviewGenerator_generatePendingPreviewForAttachment___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v4, "Existing preview generation operations existed, not adding more for %@", (uint8_t *)&v5);

}

@end
