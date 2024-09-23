@implementation PHPhotoLibraryFeatureAvailabilityTask

- (PHPhotoLibraryFeatureAvailabilityTask)initWithFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5
{
  id v9;
  id v10;
  PHPhotoLibraryFeatureAvailabilityTask *v11;
  uint64_t v12;
  PHMediaProcessingAlgorithmVersionProvider *versionProvider;
  void *v14;
  uint64_t v15;
  NSString *taskID;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  PHPhotoLibraryFeatureAvailabilityTask *v20;
  objc_super v22;

  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PHPhotoLibraryFeatureAvailabilityTask;
  v11 = -[PHPhotoLibraryFeatureAvailabilityTask init](&v22, sel_init);
  if (v11)
  {
    +[PHMediaProcessingAlgorithmVersionProvider providerWithCurrentVersions](PHMediaProcessingAlgorithmVersionProvider, "providerWithCurrentVersions");
    v12 = objc_claimAutoreleasedReturnValue();
    versionProvider = v11->_versionProvider;
    v11->_versionProvider = (PHMediaProcessingAlgorithmVersionProvider *)v12;

    -[PHMediaProcessingAlgorithmVersionProvider setSceneAnalysisVersion:](v11->_versionProvider, "setSceneAnalysisVersion:", 1);
    -[PHMediaProcessingAlgorithmVersionProvider setFaceAnalysisVersion:](v11->_versionProvider, "setFaceAnalysisVersion:", 1);
    -[PHMediaProcessingAlgorithmVersionProvider setMediaAnalysisVersion:](v11->_versionProvider, "setMediaAnalysisVersion:", 66);
    -[PHMediaProcessingAlgorithmVersionProvider setMediaAnalysisImageVersion:](v11->_versionProvider, "setMediaAnalysisImageVersion:", 66);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    taskID = v11->_taskID;
    v11->_taskID = (NSString *)v15;

    v11->_feature = a3;
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
    v11->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.photolibrary.availability", v17);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v11->_availabilityConfig, a5);
    v20 = v11;
  }

  return v11;
}

- (void)executeWithCompletionHandler:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD, id);
  id v5;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = (void (**)(id, _QWORD, id))a3;
  objc_msgSend(v3, "ph_errorWithCode:localizedDescription:", -1, CFSTR("Base class execute not supported."));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v5);

}

- (void)computeSearchDonationProgressForTaskID:(unint64_t)a3 libraryClient:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  uint8_t buf[16];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  PLPhotosSearchGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ComputeSearchDonationProgress", ", buf, 2u);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3254779904;
    v19[2] = __112__PHPhotoLibraryFeatureAvailabilityTask_computeSearchDonationProgressForTaskID_libraryClient_completionHandler___block_invoke;
    v19[3] = &unk_1E35D5158;
    v19[4] = self;
    v20 = v9;
    v21 = v13;
    v22 = v11;
    objc_msgSend(v8, "searchDonationProgressForTaskIDs:completionHandler:", v15, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", -1, CFSTR("Library client is nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v16);
    v17 = v13;
    v18 = v17;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v18, OS_SIGNPOST_INTERVAL_END, v11, "ComputeSearchDonationProgress", ", buf, 2u);
    }

  }
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
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v30;
  id v31;
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
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AddAnalysisStateToAvailability", ", buf, 2u);
  }

  -[PHPhotoLibraryFeatureAvailabilityTask photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photoAnalysisClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v31 = 0;
    v15 = -[PHPhotoLibraryFeatureAvailabilityTask _recordFaceAndSceneAnalysisToAvailability:error:](self, "_recordFaceAndSceneAnalysisToAvailability:error:", v6, &v31);
    v16 = v31;
    v17 = v16;
    if (!v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      v26 = v11;
      v21 = v26;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v21, OS_SIGNPOST_INTERVAL_END, v9, "AddAnalysisStateToAvailability", ", buf, 2u);
      }
      v22 = 0;
      v19 = v17;
      goto LABEL_34;
    }
    v30 = v16;
    v18 = -[PHPhotoLibraryFeatureAvailabilityTask _recordCaptionAndEmbeddingAnalysisToAvailability:error:](self, "_recordCaptionAndEmbeddingAnalysisToAvailability:error:", v6, &v30);
    v19 = v30;

    if (!v18)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v19);
      v27 = v11;
      v21 = v27;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v21, OS_SIGNPOST_INTERVAL_END, v9, "AddAnalysisStateToAvailability", ", buf, 2u);
      }
      v22 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v14, "requestGraphStatus:", a4);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v20 != 0;
    if (v20)
    {
      objc_msgSend(v6, "setPhotosKnowledgeGraphIsReady:", -[NSObject availability](v20, "availability") == 2);
      v23 = v11;
      if (v12 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_33;
      v24 = v23;
      if (!os_signpost_enabled(v23))
        goto LABEL_33;
      *(_WORD *)buf = 0;
    }
    else
    {
      v28 = v11;
      if (v12 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_33;
      v24 = v28;
      if (!os_signpost_enabled(v28))
        goto LABEL_33;
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v24, OS_SIGNPOST_INTERVAL_END, v9, "AddAnalysisStateToAvailability", ", buf, 2u);
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", -1, CFSTR("Could not get PhotoAnalysis client."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v11;
  v19 = v25;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v19, OS_SIGNPOST_INTERVAL_END, v9, "AddAnalysisStateToAvailability", ", buf, 2u);
  }
  v22 = 0;
LABEL_35:

  return v22;
}

- (BOOL)addGraphAvailabilityToAvailabilityStatus:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t *v19;
  NSObject *v20;
  NSObject *v21;
  __int16 v23;
  uint8_t v24[2];
  uint8_t v25[16];
  uint8_t buf[16];

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  PLPhotosSearchGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v9 = v7;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PhotosKnowledgeGraphAvailability", ", buf, 2u);
  }

  -[PHPhotoLibrary photoAnalysisClient](self->_photoLibrary, "photoAnalysisClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "requestGraphStatus:", a4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v14 != 0;
    if (v14)
    {
      objc_msgSend(v6, "setPhotosKnowledgeGraphIsReady:", -[NSObject availability](v14, "availability") == 2);
      v17 = v10;
      if (v11 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_21;
      v18 = v17;
      if (!os_signpost_enabled(v17))
        goto LABEL_21;
      v23 = 0;
      v19 = (uint8_t *)&v23;
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", -1, CFSTR("Could not get graph status."));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v10;
      if (v11 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_21;
      v18 = v21;
      if (!os_signpost_enabled(v21))
        goto LABEL_21;
      *(_WORD *)v24 = 0;
      v19 = v24;
    }
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v18, OS_SIGNPOST_INTERVAL_END, v8, "PhotosKnowledgeGraphAvailability", ", v19, 2u);
LABEL_21:

    goto LABEL_22;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", -1, CFSTR("Could not get PhotoAnalysis client."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v10;
  v15 = v20;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PhotosKnowledgeGraphAvailability", ", v25, 2u);
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (BOOL)addIndexingStateToAvailabilityStatus:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  PHPhotoLibrary *photoLibrary;
  double v12;
  unint64_t v13;
  id v14;
  BOOL v15;
  PHPhotoLibrary *v16;
  PHMediaProcessingAlgorithmVersionProvider *versionProvider;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  id v26;
  uint8_t buf[16];

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  PLPhotosSearchGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddIndexingStateToAvailability", ", buf, 2u);
  }

  photoLibrary = self->_photoLibrary;
  v26 = 0;
  LODWORD(v12) = 0;
  v13 = -[PHPhotoLibrary countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:](photoLibrary, "countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:", 17, 1, &v26, v12);
  v14 = v26;
  if (v14)
  {
    if (a4)
    {
LABEL_6:
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a4 = v14;
      goto LABEL_17;
    }
LABEL_9:
    v15 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v6, "setNumberOfCuratedAssets:", v13);
  v16 = self->_photoLibrary;
  versionProvider = self->_versionProvider;
  v25 = 0;
  LODWORD(v18) = 0;
  v19 = -[PHPhotoLibrary countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:](v16, "countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", 17, 1, versionProvider, &v25, v18);
  v14 = v25;
  if (v14)
  {
    if (a4)
      goto LABEL_6;
    goto LABEL_9;
  }
  if (v13)
    v20 = (double)v19 / (double)v13;
  else
    v20 = 0.0;
  v21 = fmin(v20, 1.0);
  objc_msgSend(v6, "setFractionOfStillAssetsWithEmbeddingsInIndex:", v21);
  objc_msgSend(v6, "setFractionOfStillAssetsWithCaptions:", v21);
  v22 = v10;
  v23 = v22;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v23, OS_SIGNPOST_INTERVAL_END, v8, "AddIndexingStateToAvailability", ", buf, 2u);
  }

  v14 = 0;
  v15 = 1;
LABEL_17:

  return v15;
}

- (BOOL)_recordFaceAndSceneAnalysisToAvailability:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v20;
  double v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  id v29;
  uint8_t buf[8];
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLPhotosSearchGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v9 = v7;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecordFaceAndSceneAnalysisToAvailability", ", buf, 2u);
  }

  v33 = &unk_1E3655A20;
  v34[0] = &unk_1E3657318;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  -[PHPhotoLibraryFeatureAvailabilityTask _fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:error:](self, "_fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:error:", v12, &v29);
  v14 = v13;
  v15 = v29;
  if (v15)
  {
    v16 = v15;
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    v17 = v10;
    v18 = v17;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RecordFaceAndSceneAnalysisToAvailability", ", buf, 2u);
    }

    v19 = 0;
  }
  else
  {
    v31 = &unk_1E3655A50;
    v32 = &unk_1E3657330;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v20 = objc_claimAutoreleasedReturnValue();

    v28 = 0;
    -[PHPhotoLibraryFeatureAvailabilityTask _fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:error:](self, "_fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:error:", v20, &v28);
    v22 = v21;
    v23 = v28;
    if (v23)
    {
      v16 = v23;
      if (a4)
        *a4 = objc_retainAutorelease(v23);
      v24 = v10;
      v25 = v24;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v25, OS_SIGNPOST_INTERVAL_END, v8, "RecordFaceAndSceneAnalysisToAvailability", ", buf, 2u);
      }

      v19 = 0;
    }
    else
    {
      objc_msgSend(v6, "setFractionOfAssetsWithFaceAnalysis:", v14);
      objc_msgSend(v6, "setFractionOfAssetsWithSceneAnalysis:", v22);
      v26 = v10;
      v16 = v26;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v16, OS_SIGNPOST_INTERVAL_END, v8, "RecordFaceAndSceneAnalysisToAvailability", ", buf, 2u);
      }
      v19 = 1;
    }
    v12 = (void *)v20;
  }

  return v19;
}

- (BOOL)_recordCaptionAndEmbeddingAnalysisToAvailability:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v20;
  double v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  id v29;
  uint8_t buf[8];
  _QWORD v31[2];
  _QWORD v32[2];
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLPhotosSearchGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v9 = v7;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecordCaptionAndEmbeddingAnalysisToAvailability", ", buf, 2u);
  }

  v33 = &unk_1E3655A68;
  v34[0] = &unk_1E3657348;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  -[PHPhotoLibraryFeatureAvailabilityTask _fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:error:](self, "_fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:error:", v12, &v29);
  v14 = v13;
  v15 = v29;
  if (v15)
  {
    v16 = v15;
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    v17 = v10;
    v18 = v17;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RecordCaptionAndEmbeddingAnalysisToAvailability", ", buf, 2u);
    }

    v19 = 0;
  }
  else
  {
    v31[0] = &unk_1E3655A80;
    v31[1] = &unk_1E3655A68;
    v32[0] = &unk_1E3657360;
    v32[1] = &unk_1E3657378;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v20 = objc_claimAutoreleasedReturnValue();

    v28 = 0;
    -[PHPhotoLibraryFeatureAvailabilityTask _fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:error:](self, "_fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:error:", v20, &v28);
    v22 = v21;
    v23 = v28;
    if (v23)
    {
      v16 = v23;
      if (a4)
        *a4 = objc_retainAutorelease(v23);
      v24 = v10;
      v25 = v24;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v25, OS_SIGNPOST_INTERVAL_END, v8, "RecordCaptionAndEmbeddingAnalysisToAvailability", ", buf, 2u);
      }

      v19 = 0;
    }
    else
    {
      objc_msgSend(v6, "setFractionOfCuratedAssetsWithCaptions:", v14);
      objc_msgSend(v6, "setFractionOfCuratedAssetsWithEmbeddings:", v14);
      objc_msgSend(v6, "setFractionOfAssetsWithCaptions:", v22);
      objc_msgSend(v6, "setFractionOfAssetsWithEmbeddings:", v22);
      v26 = v10;
      v16 = v26;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v16, OS_SIGNPOST_INTERVAL_END, v8, "RecordCaptionAndEmbeddingAnalysisToAvailability", ", buf, 2u);
      }
      v19 = 1;
    }
    v12 = (void *)v20;
  }

  return v19;
}

- (double)_fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  double v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;
  PHPhotoLibraryFeatureAvailabilityTask *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a3;
  -[PHPhotoLibraryFeatureAvailabilityTask photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__20604;
  v23 = __Block_byref_object_dispose__20605;
  v24 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__PHPhotoLibraryFeatureAvailabilityTask__fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs_error___block_invoke;
  v12[3] = &unk_1E35DA940;
  v8 = v7;
  v15 = &v19;
  v16 = &v25;
  v13 = v8;
  v14 = self;
  v17 = &v33;
  v18 = &v29;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (*((_BYTE *)v26 + 24))
  {
    v9 = 0.0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v20[5]);
  }
  else
  {
    v10 = v34[3];
    if (v10)
      v9 = (double)(unint64_t)v30[3] / (double)v10;
    else
      v9 = 1.0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v9;
}

- (NSString)taskID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PHFeatureAvailabilityConfig)availabilityConfig
{
  return self->_availabilityConfig;
}

- (PHMediaProcessingAlgorithmVersionProvider)versionProvider
{
  return self->_versionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionProvider, 0);
  objc_storeStrong((id *)&self->_availabilityConfig, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
}

void __101__PHPhotoLibraryFeatureAvailabilityTask__fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs_error___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  id v33;
  uint64_t v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = a3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v13 = (void *)a1[4];
        v14 = objc_msgSend(v6, "unsignedIntValue");
        v15 = objc_msgSend(v12, "unsignedIntValue");
        v16 = *(_QWORD *)(a1[6] + 8);
        v41 = *(id *)(v16 + 40);
        LODWORD(v17) = 0;
        v18 = objc_msgSend(v13, "countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:", v14, v15, &v41, v17);
        objc_storeStrong((id *)(v16 + 40), v41);
        if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
        {
          *a4 = 1;
          *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
          v19 = obj;

          goto LABEL_25;
        }
        v9 += v18;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v33 = obj;
  v20 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v34 = *(_QWORD *)v38;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(v33);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        v25 = (void *)a1[4];
        v26 = objc_msgSend(v6, "unsignedIntValue");
        v27 = objc_msgSend(v24, "unsignedIntValue");
        v28 = *(_QWORD *)(a1[5] + 56);
        v29 = *(_QWORD *)(a1[6] + 8);
        v36 = *(id *)(v29 + 40);
        LODWORD(v30) = 0;
        v31 = objc_msgSend(v25, "countOfProcessedAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", v26, v27, v28, &v36, v30);
        objc_storeStrong((id *)(v29 + 40), v36);
        if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
        {
          *a4 = 1;
          *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;

          goto LABEL_24;
        }
        v22 += v31;
      }
      v21 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v21)
        continue;
      break;
    }
  }
  else
  {
    v22 = 0;
  }

  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) += v9;
  *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) += v22;
LABEL_24:
  v19 = obj;
LABEL_25:

}

void __112__PHPhotoLibraryFeatureAvailabilityTask_computeSearchDonationProgressForTaskID_libraryClient_completionHandler___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char v22;

  v9 = a5;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3254779904;
  block[2] = __112__PHPhotoLibraryFeatureAvailabilityTask_computeSearchDonationProgressForTaskID_libraryClient_completionHandler___block_invoke_2;
  block[3] = &unk_1E35D51C8;
  v22 = a2;
  v16 = v9;
  v17 = v10;
  v18 = a3;
  v19 = a4;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v20 = v12;
  v21 = v13;
  v14 = v9;
  dispatch_async(v11, block);

}

void __112__PHPhotoLibraryFeatureAvailabilityTask_computeSearchDonationProgressForTaskID_libraryClient_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(id *)(a1 + 64);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ComputeSearchDonationProgress", ", v5, 2u);
  }

}

+ (id)availabilityStatusTaskForFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  _PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing *v11;
  uint64_t v12;
  _PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing *v13;

  v9 = a4;
  v10 = a5;
  if (a3 == 6)
  {
    v11 = [_PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing alloc];
    v12 = 6;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v11 = [_PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation alloc];
    v12 = 1;
LABEL_5:
    v13 = -[PHPhotoLibraryFeatureAvailabilityTask initWithFeature:photoLibrary:availabilityConfig:](v11, "initWithFeature:photoLibrary:availabilityConfig:", v12, v9, v10);
    goto LABEL_9;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", -1, CFSTR("Feature availability status for feature not yet supported."));
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

@end
