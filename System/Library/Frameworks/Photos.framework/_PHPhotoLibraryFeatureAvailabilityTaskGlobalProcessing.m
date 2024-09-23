@implementation _PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing

- (void)executeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  PHPhotoLibraryFeatureAvailability *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  PHPhotoLibraryFeatureAvailability *v13;
  NSObject *v14;
  NSObject *v15;
  PHPhotoLibraryFeatureAvailability *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  PHPhotoLibraryFeatureAvailability *v21;
  _QWORD v22[4];
  PHPhotoLibraryFeatureAvailability *v23;
  id v24;
  _QWORD *v25;
  uint8_t *v26;
  id v27;
  NSObject *v28;
  os_signpost_id_t v29;
  _QWORD v30[4];
  PHPhotoLibraryFeatureAvailability *v31;
  NSObject *v32;
  _QWORD *v33;
  uint8_t *v34;
  id v35;
  _QWORD block[4];
  PHPhotoLibraryFeatureAvailability *v37;
  NSObject *v38;
  _QWORD *v39;
  uint8_t *v40;
  id v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[3];
  char v49;
  id location[2];

  v4 = a3;
  PLPhotosSearchGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "GlobalProcessingFeatureAvailability", ", buf, 2u);
  }

  v9 = objc_alloc_init(PHPhotoLibraryFeatureAvailability);
  v10 = dispatch_group_create();
  objc_initWeak(location, self);
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 1;
  *(_QWORD *)buf = 0;
  v43 = buf;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__20604;
  v46 = __Block_byref_object_dispose__20605;
  v47 = 0;
  dispatch_group_enter(v10);
  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E35DA918;
  objc_copyWeak(&v41, location);
  v13 = v9;
  v37 = v13;
  v39 = v48;
  v40 = buf;
  v14 = v10;
  v38 = v14;
  dispatch_async(v11, block);

  dispatch_group_enter(v14);
  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke_2;
  v30[3] = &unk_1E35DA918;
  objc_copyWeak(&v35, location);
  v16 = v13;
  v31 = v16;
  v33 = v48;
  v34 = buf;
  v17 = v14;
  v32 = v17;
  dispatch_async(v15, v30);

  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3254779904;
  v22[2] = __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E35D5200;
  objc_copyWeak(&v27, location);
  v23 = v16;
  v24 = v4;
  v25 = v48;
  v26 = buf;
  v28 = v8;
  v29 = v6;
  v19 = v8;
  v20 = v4;
  v21 = v16;
  dispatch_group_notify(v17, v18, v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v41);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v48, 8);
  objc_destroyWeak(location);

}

- (BOOL)addAnalysisStateToAvailabilityStatus:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[16];

  v6 = a3;
  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  PLPhotosSearchGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  v10 = v8;
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GlobalProcessingAddAnalysisStateToAvailability", ", buf, 2u);
  }

  v18.receiver = self;
  v18.super_class = (Class)_PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing;
  v13 = -[PHPhotoLibraryFeatureAvailabilityTask addAnalysisStateToAvailabilityStatus:error:](&v18, sel_addAnalysisStateToAvailabilityStatus_error_, v6, a4);
  if (v13)
  {
    -[_PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing _addHighlightProcessingToAvailabilityStatus:](self, "_addHighlightProcessingToAvailabilityStatus:", v6);
    v14 = v11;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
LABEL_11:
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v15, OS_SIGNPOST_INTERVAL_END, v9, "GlobalProcessingAddAnalysisStateToAvailability", ", buf, 2u);
      }
    }
  }
  else
  {
    v16 = v11;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v16;
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        goto LABEL_11;
      }
    }
  }

  return v13;
}

- (void)_addHighlightProcessingToAvailabilityStatus:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t spid;
  id v25;
  uint8_t buf[8];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  PLPhotosSearchGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  v7 = v5;
  v8 = v7;
  spid = v6;
  v9 = v6 - 1;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "GlobalProcessingHighlighsProcessing", ", buf, 2u);
  }

  -[PHPhotoLibraryFeatureAvailabilityTask photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setShouldPrefetchCount:", 1);
  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    -[PHPhotoLibraryFeatureAvailabilityTask photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setShouldPrefetchCount:", 1);
    v16 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("enrichmentState"), 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %K"), CFSTR("enrichmentVersion"), CFSTR("highlightVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInternalPredicate:", v20);

    +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFractionOfHighlightsEnriched:", (double)(unint64_t)objc_msgSend(v21, "count") / (double)v13);

  }
  else
  {
    objc_msgSend(v25, "setFractionOfHighlightsEnriched:", 1.0);
  }
  v22 = v8;
  v23 = v22;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v23, OS_SIGNPOST_INTERVAL_END, spid, "GlobalProcessingHighlighsProcessing", ", buf, 2u);
  }

}

- (void)_updateFeatureAvailabilityForAvailabilityStatus:(id)a3
{
  NSObject *v4;
  unsigned int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  unsigned int v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = objc_msgSend(v18, "photosKnowledgeGraphIsReady");
  objc_msgSend(v18, "fractionOfStillAssetsWithEmbeddingsInIndex");
  v7 = v6;
  -[PHPhotoLibraryFeatureAvailabilityTask availabilityConfig](self, "availabilityConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
  v10 = v9;

  objc_msgSend(v18, "fractionOfHighlightsEnriched");
  v12 = v11;
  -[PHPhotoLibraryFeatureAvailabilityTask availabilityConfig](self, "availabilityConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fractionOfHighlightsEnrichedThreshold");
  v15 = v14;

  if (v7 >= v10)
    v16 = v5;
  else
    v16 = 0;
  if (v12 >= v15)
    v17 = v16;
  else
    v17 = 0;
  objc_msgSend(v18, "setFeatureAvailability:", v17);

}

@end
