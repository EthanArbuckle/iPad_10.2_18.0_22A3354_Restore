@implementation VCPPhotosQuickFaceIdentificationManager

- (VCPPhotosQuickFaceIdentificationManager)init
{

  return 0;
}

- (VCPPhotosQuickFaceIdentificationManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  VCPPhotosQuickFaceIdentificationManager *v6;
  VCPPhotosQuickFaceIdentificationManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *management;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPPhotosQuickFaceIdentificationManager;
  v6 = -[VCPPhotosQuickFaceIdentificationManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = dispatch_queue_create("com.apple.mediaanalysis.quickfaceid.management", 0);
    management = v7->_management;
    v7->_management = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (int)loadPersonsModelAndInitializeFaceAnalyzerWrapper
{
  NSObject *management;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  management = self->_management;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__VCPPhotosQuickFaceIdentificationManager_loadPersonsModelAndInitializeFaceAnalyzerWrapper__block_invoke;
  v5[3] = &unk_1E6B16E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(management, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

_QWORD *__91__VCPPhotosQuickFaceIdentificationManager_loadPersonsModelAndInitializeFaceAnalyzerWrapper__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[1] && !result[6])
  {
    result = (_QWORD *)objc_msgSend(result, "_loadPersonsModelAndInitializeFaceAnalyzer");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result;
  }
  return result;
}

- (int)faceProcessingVersionFromVNFaceprintRequestRevision:(unint64_t)a3
{
  if (a3 == 3737841665)
    return 11;
  else
    return -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion");
}

- (int)_loadPersonsModelAndInitializeFaceAnalyzer
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  GDVUVisualUnderstandingService *v11;
  id v12;
  GDVUVisualUnderstandingService *vuService;
  GDVUVisualUnderstandingService *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  VNPersonsModel *v23;
  VNPersonsModel *personsModel;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  objc_class *v34;
  uint64_t v35;
  VCPFaceAnalyzer *v36;
  VCPFaceAnalyzer **p_faceAnalyzer;
  VCPFaceAnalyzer *faceAnalyzer;
  int v39;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE buf[24];
  void *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:](VCPPhotosFaceProcessingContext, "contextWithPhotoLibrary:", self->_photoLibrary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery")
    && _os_feature_enabled_impl())
  {
    -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v5 = (void *)getGDVUVisualUnderstandingServiceClass(void)::softClass;
    v46 = getGDVUVisualUnderstandingServiceClass(void)::softClass;
    if (!getGDVUVisualUnderstandingServiceClass(void)::softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke_0;
      v48 = &unk_1E6B15540;
      v49 = &v43;
      ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke_0((uint64_t)buf);
      v5 = (void *)v44[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v43, 8);
    v7 = [v6 alloc];
    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v8 = (void *)getGDVUEntityRecognitionClientClass(void)::softClass;
    v46 = getGDVUEntityRecognitionClientClass(void)::softClass;
    if (!getGDVUEntityRecognitionClientClass(void)::softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_1;
      v48 = &unk_1E6B15540;
      v49 = &v43;
      ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_1((uint64_t)buf);
      v8 = (void *)v44[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v43, 8);
    objc_msgSend(v9, "photos");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v11 = (GDVUVisualUnderstandingService *)objc_msgSend(v7, "initWithClient:version:url:error:", v10, 1, v4, &v42);
    v12 = v42;
    vuService = self->_vuService;
    self->_vuService = v11;

    v14 = self->_vuService;
    if (!v14)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create MADGDVisualUnderstandingService instance - %@", buf, 0xCu);
      }

      goto LABEL_48;
    }
    -[GDVUVisualUnderstandingService gallery](v14, "gallery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "faceprintRevision");

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Gallery uses faceprint with revision %ld", buf, 0xCu);
    }
    if (v16 == 3737841669)
      v17 = 15;
    else
      v17 = 11;
    objc_msgSend(v3, "setProcessingVersion:", v17);
LABEL_31:

    v36 = -[VCPFaceAnalyzer initWithContext:]([VCPFaceAnalyzer alloc], "initWithContext:", v3);
    faceAnalyzer = self->_faceAnalyzer;
    p_faceAnalyzer = &self->_faceAnalyzer;
    *p_faceAnalyzer = v36;

    if (*p_faceAnalyzer)
    {
      v39 = 0;
      goto LABEL_49;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID: failed to initialize face analyzer", buf, 2u);
    }
LABEL_48:
    v39 = -18;
    goto LABEL_49;
  }
  v18 = mach_absolute_time();
  VCPSignPostLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  VCPSignPostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPPersonVIPLoadModel", ", buf, 2u);
  }

  -[PHPhotoLibrary vcp_vipModelFilepathForVIPType:](self->_photoLibrary, "vcp_vipModelFilepathForVIPType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v41 = 0;
    +[VCPFaceIDModel loadVIPModelAtPath:withVIPType:error:](VCPFaceIDModel, "loadVIPModelAtPath:withVIPType:error:", v4, 0, &v41);
    v23 = (VNPersonsModel *)objc_claimAutoreleasedReturnValue();
    v12 = v41;
    personsModel = self->_personsModel;
    self->_personsModel = v23;

    if (!self->_personsModel)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: cannot load Persons Model: %@", buf, 0xCu);
      }

      goto LABEL_48;
    }
    VCPSignPostLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_END, v20, "VCPPersonVIPLoadModel", ", buf, 2u);
    }

    if (v18)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    -[VNPersonsModel configuration](self->_personsModel, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "faceprintRequestRevision");

    objc_msgSend(v3, "setProcessingVersion:", -[VCPPhotosQuickFaceIdentificationManager faceProcessingVersionFromVNFaceprintRequestRevision:](self, "faceProcessingVersionFromVNFaceprintRequestRevision:", v28));
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[VNPersonsModel configuration](self->_personsModel, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "faceprintRequestRevision");
      v31 = objc_msgSend(v3, "processingVersion");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID Model: model with VNCreateFaceprintRequest revision %lu (FaceProcessing Version%d)", buf, 0x12u);

    }
    +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:](VCPFaceProcessingVersionManager, "sharedManagerForPhotoLibrary:", self->_photoLibrary);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "currentProcessingVersion");

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v34 = (objc_class *)objc_opt_class();
      v35 = VCPMAGetRevisionForVisionModel(v34, v33);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v33;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID Model: system is using VNCreateFaceprintRequest revision %lu (FaceProcessing Version%d)", buf, 0x12u);
    }
    goto LABEL_31;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Model: persistent storageDirectoryURL is nil", buf, 2u);
  }
  v39 = -50;
LABEL_49:

  return v39;
}

- (int)_loadPetsModel
{
  uint64_t v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  VNEntityIdentificationModel **p_petsModel;
  VNEntityIdentificationModel *petsModel;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = mach_absolute_time();
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPPetVIPLoadModel", ", buf, 2u);
  }

  -[PHPhotoLibrary vcp_vipModelFilepathForVIPType:](self->_photoLibrary, "vcp_vipModelFilepathForVIPType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v16 = 0;
    +[VCPFaceIDModel loadVIPModelAtPath:withVIPType:error:](VCPFaceIDModel, "loadVIPModelAtPath:withVIPType:error:", v8, 1, &v16);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v16;
    petsModel = self->_petsModel;
    p_petsModel = &self->_petsModel;
    *p_petsModel = (VNEntityIdentificationModel *)v9;

    if (*p_petsModel)
    {
      VCPSignPostLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_END, v5, "VCPPetVIPLoadModel", ", buf, 2u);
      }

      if (v3)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
        LODWORD(v3) = 0;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet Model: cannot load Model: %@", buf, 0xCu);
      }
      LODWORD(v3) = -18;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Pet Model: persistent storageDirectoryURL is nil; skip loading Model",
        buf,
        2u);
    }
    LODWORD(v3) = -50;
  }

  return v3;
}

- (int)_classifyFaces:(id)a3 forAsset:(id)a4 detectedPersons:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *management;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  const char *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  id v45;
  id *v47;
  id v48;
  void *v49;
  id obj;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD block[5];
  id v61;
  id v62;
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v48 = a4;
  v49 = v7;
  if (!objc_msgSend(v7, "count"))
    goto LABEL_31;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v48, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("[%@][QuickFaceID Classify]"), v9);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v49, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:](self->_photoLibrary, "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:", 0, &unk_1E6B76560);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v49;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  v47 = a5;
  if (!v10)
    goto LABEL_23;
  v52 = *(_QWORD *)v79;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v79 != v52)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1BCCA1B2C]();
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@[%@]"), v55, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "imageprintWrapper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[VCPFaceIDModel faceObservationFromFaceprintData:](VCPFaceIDModel, "faceObservationFromFaceprintData:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      v73 = &v72;
      v74 = 0x3032000000;
      v75 = __Block_byref_object_copy__27;
      v76 = __Block_byref_object_dispose__27;
      v77 = 0;
      v66 = 0;
      v67 = &v66;
      v68 = 0x3032000000;
      v69 = __Block_byref_object_copy__27;
      v70 = __Block_byref_object_dispose__27;
      v71 = 0;
      management = self->_management;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__VCPPhotosQuickFaceIdentificationManager__classifyFaces_forAsset_detectedPersons___block_invoke;
      block[3] = &unk_1E6B19330;
      block[4] = self;
      v21 = v19;
      v61 = v21;
      v64 = &v72;
      v22 = v16;
      v62 = v22;
      v63 = v53;
      v65 = &v66;
      dispatch_sync(management, block);
      if (v67[5])
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v23 = v67[5];
          *(_DWORD *)buf = 138412546;
          v84 = v55;
          v85 = 2112;
          v86 = v23;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Matching person %@", buf, 0x16u);
        }
        objc_msgSend(v12, "setPersonLocalIdentifier:", v67[5]);
        objc_msgSend(v51, "addObject:", v67[5]);
      }
      else if (v73[5])
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "centerX");
          v25 = v24;
          objc_msgSend(v12, "centerY");
          v26 = v73[5];
          *(_DWORD *)buf = 138413058;
          v84 = v55;
          v85 = 2048;
          v86 = v25;
          v87 = 2048;
          v88 = v27;
          v89 = 2112;
          v90 = v26;
          v28 = MEMORY[0x1E0C81028];
          v29 = OS_LOG_TYPE_ERROR;
          v30 = "%@ No matching person at location (%.3f, %.3f) - %@";
          v31 = 42;
LABEL_21:
          _os_log_impl(&dword_1B6C4A000, v28, v29, v30, buf, v31);
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "centerX");
        v33 = v32;
        objc_msgSend(v12, "centerY");
        *(_DWORD *)buf = 138412802;
        v84 = v55;
        v85 = 2048;
        v86 = v33;
        v87 = 2048;
        v88 = v34;
        v28 = MEMORY[0x1E0C81028];
        v29 = OS_LOG_TYPE_DEBUG;
        v30 = "%@ No matching person at location (%.3f, %.3f)";
        v31 = 32;
        goto LABEL_21;
      }

      _Block_object_dispose(&v66, 8);
      _Block_object_dispose(&v72, 8);

      objc_autoreleasePoolPop(v13);
      ++v11;
    }
    while (v10 != v11);
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    v10 = v35;
  }
  while (v35);
LABEL_23:

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithLocalIdentifiers:options:", v51, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v39 = v37;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v82, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v57 != v41)
          objc_enumerationMutation(v39);
        v43 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v43, "localIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v43, v44);

      }
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v82, 16);
    }
    while (v40);
  }

  v45 = objc_retainAutorelease(v38);
  *v47 = v45;

LABEL_31:
  return 0;
}

void __83__VCPPhotosQuickFaceIdentificationManager__classifyFaces_forAsset_detectedPersons___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  double v26;
  void *v27;
  double v28;
  float v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  os_log_type_t v33;
  uint32_t v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  void *v38;
  double v39;
  float v40;
  id v41;
  id obj;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1[4] + 24), "mad_useVUGallery")
    || !_os_feature_enabled_impl())
  {
    v8 = a1[5];
    v9 = *(_QWORD *)(a1[4] + 8);
    v10 = *(_QWORD *)(a1[8] + 8);
    v41 = *(id *)(v10 + 40);
    +[VCPFaceIDModel classifyFaceObservation:withModel:error:](VCPFaceIDModel, "classifyFaceObservation:withModel:error:", v8, v9, &v41);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v10 + 40), v41);
    v12 = *(_QWORD *)(a1[9] + 8);
    v5 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
    goto LABEL_8;
  }
  v2 = a1[5];
  v3 = *(void **)(a1[4] + 48);
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "recognizeIn:context:error:", v2, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    objc_msgSend(v5, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "confidence");
      if (v15 > VCPPersonFaceVIPMatchingThreshold())
      {
        objc_msgSend(v14, "entityIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x1E0CD16C8];
        v51[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fetchPersonsWithMdIDs:options:", v19, a1[7]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v21, "localIdentifier");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1[9] + 8);
          v24 = *(void **)(v23 + 40);
          *(_QWORD *)(v23 + 40) = v22;

          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            v25 = a1[6];
            objc_msgSend(v21, "localIdentifier");
            v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            objc_msgSend(v14, "entityIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringValue");
            v28 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            objc_msgSend(v14, "confidence");
            *(_DWORD *)buf = 138413058;
            v44 = v25;
            v45 = 2112;
            v46 = v26;
            v47 = 2112;
            v48 = v28;
            v49 = 2048;
            v50 = v29;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@[VU] Identified as %@ %@ with confidence %f", buf, 0x2Au);

          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v37 = a1[6];
          objc_msgSend(v14, "entityIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringValue");
          v39 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          objc_msgSend(v14, "confidence");
          *(_DWORD *)buf = 138412802;
          v44 = v37;
          v45 = 2112;
          v46 = v39;
          v47 = 2048;
          v48 = v40;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@[VU] Identified as %@ with confidence %f, but invalid person", buf, 0x20u);

        }
        goto LABEL_26;
      }
      if ((int)MediaAnalysisLogLevel() < 6 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_26:

        goto LABEL_8;
      }
      v35 = a1[6];
      objc_msgSend(v14, "confidence");
      *(_DWORD *)buf = 138412546;
      v44 = v35;
      v45 = 2048;
      v46 = v36;
      v31 = MEMORY[0x1E0C81028];
      v32 = "%@[VU] Failed to pass classify confidence %f";
      v33 = OS_LOG_TYPE_INFO;
      v34 = 22;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 5 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      v30 = a1[6];
      *(_DWORD *)buf = 138412290;
      v44 = v30;
      v31 = MEMORY[0x1E0C81028];
      v32 = "%@[VU] No valid identification to face";
      v33 = OS_LOG_TYPE_DEFAULT;
      v34 = 12;
    }
    _os_log_impl(&dword_1B6C4A000, v31, v33, v32, buf, v34);
    goto LABEL_26;
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[6];
    v7 = *(double *)(*(_QWORD *)(a1[8] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v44 = v6;
    v45 = 2112;
    v46 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@[VU] Failed to classify face - %@", buf, 0x16u);
  }
LABEL_8:

}

- (int)processAsset:(id)a3 onDemandDetection:(BOOL)a4 detectedFaces:(id *)a5 detectedPersons:(id *)a6
{
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *management;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  VCPFaceAnalyzer *faceAnalyzer;
  int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  id *v39;
  os_signpost_id_t spid;
  id v41;
  _QWORD v42[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  _QWORD v48[3];

  v8 = a4;
  v48[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@] QuickFaceID Analysis"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery")
    || !_os_feature_enabled_impl())
  {
    management = self->_management;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __104__VCPPhotosQuickFaceIdentificationManager_processAsset_onDemandDetection_detectedFaces_detectedPersons___block_invoke_206;
    v42[3] = &unk_1E6B15468;
    v42[4] = self;
    dispatch_sync(management, v42);
    if (!self->_personsModel || !self->_faceAnalyzer)
    {
      if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_DWORD *)buf = 138412290;
      v45 = v13;
      v15 = MEMORY[0x1E0C81028];
      goto LABEL_25;
    }
LABEL_10:
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v10, "deferredProcessingNeeded");
      *(_DWORD *)buf = 138412546;
      v45 = v13;
      v46 = 1024;
      LODWORD(v47) = v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Analyzing asset (deferType: %d)", buf, 0x12u);
    }
    v39 = a5;
    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v18);

    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPPersonVIPAssetProcessing", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v13;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Detecting faces", buf, 0xCu);
      }
      faceAnalyzer = self->_faceAnalyzer;
      v41 = 0;
      v23 = -[VCPFaceAnalyzer quickAnalyzeAsset:results:](faceAnalyzer, "quickAnalyzeAsset:results:", v10, &v41);
      v24 = v41;
      v25 = v24;
      if (v23)
        goto LABEL_42;
      -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", CFSTR("FaceResults"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("FacesToPersist"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v27);

    }
    else
    {
      -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = *MEMORY[0x1E0CD1B58];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFetchPropertySets:", v29);

      objc_msgSend(v28, "setIncludeNonvisibleFaces:", 1);
      objc_msgSend(v28, "setIncludeTorsoOnlyDetectionData:", 1);
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v10, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i < objc_msgSend(v30, "count"); ++i)
      {
        objc_msgSend(v30, "objectAtIndexedSubscript:", i);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[VCPPhotosFace faceFromPHFace:copyOption:](VCPPhotosFace, "faceFromPHFace:copyOption:", v32, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v33);

      }
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v34 = objc_msgSend(v21, "count");
        *(_DWORD *)buf = 138412546;
        v45 = v13;
        v46 = 2048;
        v47 = v34;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ %lu detected faces", buf, 0x16u);
      }
      v23 = -[VCPFaceAnalyzer updateMissingFaceprintForFaces:withAsset:](self->_faceAnalyzer, "updateMissingFaceprintForFaces:withAsset:", v21, v10);

      if (v23)
        goto LABEL_43;
    }
    v23 = -[VCPPhotosQuickFaceIdentificationManager _classifyFaces:forAsset:detectedPersons:](self, "_classifyFaces:forAsset:detectedPersons:", v21, v10, a6);
    if (v23)
    {
LABEL_43:

      goto LABEL_44;
    }
    v35 = objc_retainAutorelease(v21);
    *v39 = v35;
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v36 = objc_msgSend(v35, "count");
      *(_DWORD *)buf = 138412546;
      v45 = v13;
      v46 = 2048;
      v47 = v36;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ processed %lu faces", buf, 0x16u);
    }
    VCPSignPostLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v25 = v37;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_END, spid, "VCPPersonVIPAssetProcessing", ", buf, 2u);
    }
    v23 = 0;
LABEL_42:

    goto LABEL_43;
  }
  v14 = self->_management;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__VCPPhotosQuickFaceIdentificationManager_processAsset_onDemandDetection_detectedFaces_detectedPersons___block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(v14, block);
  if (self->_vuService && self->_faceAnalyzer)
    goto LABEL_10;
  if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    goto LABEL_26;
  *(_DWORD *)buf = 138412290;
  v45 = v13;
  v15 = MEMORY[0x1E0C81028];
LABEL_25:
  _os_log_impl(&dword_1B6C4A000, v15, OS_LOG_TYPE_DEFAULT, "%@ Persons Model is not ready; skip processing", buf, 0xCu);
LABEL_26:
  v23 = 0;
LABEL_44:

  return v23;
}

_QWORD *__104__VCPPhotosQuickFaceIdentificationManager_processAsset_onDemandDetection_detectedFaces_detectedPersons___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[6])
    return (_QWORD *)objc_msgSend(result, "_loadPersonsModelAndInitializeFaceAnalyzer");
  return result;
}

_QWORD *__104__VCPPhotosQuickFaceIdentificationManager_processAsset_onDemandDetection_detectedFaces_detectedPersons___block_invoke_206(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[1])
    return (_QWORD *)objc_msgSend(result, "_loadPersonsModelAndInitializeFaceAnalyzer");
  return result;
}

- (int)classifyVIPPets
{
  NSObject *management;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  double v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  PHPhotoLibrary *photoLibrary;
  BOOL v47;
  id v48;
  uint64_t v49;
  int v50;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  VCPPhotosQuickFaceIdentificationManager *v58;
  id type;
  void *v60;
  id v61;
  _QWORD aBlock[4];
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  VCPPhotosQuickFaceIdentificationManager *v72;
  _BYTE *v73;
  _BYTE *v74;
  id obj;
  _QWORD block[5];
  uint8_t v77[128];
  uint8_t v78[4];
  void *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  _BYTE v84[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _BYTE buf[24];
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _QWORD v92[6];

  v92[3] = *MEMORY[0x1E0C80C00];
  management = self->_management;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(management, block);
  if (self->_petsModel)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setIncludedDetectionTypes:", &unk_1E6B76578);
    v4 = *MEMORY[0x1E0CD1B68];
    v92[0] = *MEMORY[0x1E0CD1B70];
    v92[1] = v4;
    v92[2] = *MEMORY[0x1E0CD1B58];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = self;
    objc_msgSend(v57, "setFetchPropertySets:", v5);

    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v57);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(v6, "count"); ++i)
    {
      v8 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "nameSource"))
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "localIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "nameSource");
          objc_msgSend(v9, "personLocalIdentifier");
          v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2112;
          v89 = v12;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: pet (PHFace) %@ already has a nameSource %ld for petPerson %@; skip",
            buf,
            0x20u);

        }
      }
      else if (objc_msgSend(v9, "isInVIPModel"))
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "localIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "personLocalIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: pet (PHFace) %@ is used to train this VIP model with petPerson %@; skip",
            buf,
            0x16u);

        }
      }
      else
      {
        objc_msgSend(v9, "faceClusteringProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "faceprint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "faceprintData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v89 = __Block_byref_object_copy__27;
        v90 = __Block_byref_object_dispose__27;
        v91 = 0;
        v18 = objc_alloc(MEMORY[0x1E0CEDDA0]);
        v19 = *(_QWORD *)&buf[8];
        obj = *(id *)(*(_QWORD *)&buf[8] + 40);
        v20 = (void *)objc_msgSend(v18, "initWithState:error:", v17, &obj);
        objc_storeStrong((id *)(v19 + 40), obj);
        if (v20 && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          v22 = objc_alloc(MEMORY[0x1E0CEDD98]);
          LODWORD(v23) = 1065336439;
          v24 = (void *)objc_msgSend(v22, "initWithAnimalprint:confidence:", v20, v23);
          *(_QWORD *)v84 = 0;
          *(_QWORD *)&v84[8] = v84;
          *(_QWORD *)&v84[16] = 0x3032000000;
          v85 = __Block_byref_object_copy__27;
          v86 = __Block_byref_object_dispose__27;
          v87 = 0;
          v25 = v58->_management;
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke_217;
          v70[3] = &unk_1E6B19358;
          v73 = v84;
          v54 = v24;
          v71 = v54;
          v72 = v58;
          v74 = buf;
          dispatch_sync(v25, v70);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v9, "localIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v78 = 138412546;
              v79 = v26;
              v80 = 2112;
              v81 = v27;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet: Failed to classify %@ - %@; skip",
                v78,
                0x16u);

            }
          }
          else if (*(_QWORD *)(*(_QWORD *)&v84[8] + 40))
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v9, "localIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = *(_QWORD *)(*(_QWORD *)&v84[8] + 40);
              *(_DWORD *)v78 = 138412546;
              v79 = v28;
              v80 = 2112;
              v81 = v29;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: classified %@ to petPerson %@", v78, 0x16u);

            }
            v30 = *(_QWORD *)(*(_QWORD *)&v84[8] + 40);
            objc_msgSend(v9, "localIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setObject:forKeyedSubscript:", v30, v31);

            objc_msgSend(v55, "addObject:", *(_QWORD *)(*(_QWORD *)&v84[8] + 40));
            objc_msgSend(v52, "addObject:", v9);
          }
          else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v9, "localIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "centerX");
            v34 = v33;
            objc_msgSend(v9, "centerY");
            *(_DWORD *)v78 = 138412802;
            v79 = v32;
            v80 = 2048;
            v81 = v34;
            v82 = 2048;
            v83 = v35;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: did not match %@ (at %.3f, %.3f)", v78, 0x20u);

          }
          _Block_object_dispose(v84, 8);

        }
        else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v84 = 138412546;
          *(_QWORD *)&v84[4] = v9;
          *(_WORD *)&v84[12] = 2112;
          *(_QWORD *)&v84[14] = v21;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet: Could not create animalprint for pet (PHFace) %@ - %@", v84, 0x16u);
        }

        _Block_object_dispose(buf, 8);
      }

      objc_autoreleasePoolPop(v8);
    }
    -[PHPhotoLibrary librarySpecificFetchOptions](v58->_photoLibrary, "librarySpecificFetchOptions");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setIncludedDetectionTypes:", &unk_1E6B76590);
    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithLocalIdentifiers:options:", v55, v60);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v37 = v56;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v67 != v39)
            objc_enumerationMutation(v37);
          v41 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          objc_msgSend(v41, "localIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v41, v42);

        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
      }
      while (v38);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke_220;
    aBlock[3] = &unk_1E6B17B88;
    v43 = v52;
    v63 = v43;
    type = v53;
    v64 = type;
    v44 = v36;
    v65 = v44;
    v45 = _Block_copy(aBlock);
    photoLibrary = v58->_photoLibrary;
    v61 = 0;
    v47 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v45, &v61);
    v48 = v61;
    if (v47)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v49 = objc_msgSend(v43, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v49;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: classified and persisted %lu Pet PHFace", buf, 0xCu);
      }
      v50 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v48;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Pet: failed to persist pet classification results: %@", buf, 0xCu);
      }
      v50 = objc_msgSend(v48, "code");
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model is not ready; skip classifying",
        buf,
        2u);
    }
    return 0;
  }
  return v50;
}

_QWORD *__58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[2])
    return (_QWORD *)objc_msgSend(result, "_loadPetsModel");
  return result;
}

void __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke_217(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[5] + 16);
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  +[VCPFaceIDModel classifyAnimalObservation:withModel:error:](VCPFaceIDModel, "classifyAnimalObservation:withModel:error:", v2, v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke_220(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v19;
    *(_QWORD *)&v4 = 138412290;
    v16 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "localIdentifier", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v2, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            goto LABEL_10;
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", v12);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v10);

LABEL_10:
            v22 = v7;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addFaces:", v13);

            objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v7);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setNameSource:", 6);

            goto LABEL_11;
          }
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v24 = v10;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet: no petPerson %@; skipping",
              buf,
              0xCu);
          }
        }
LABEL_11:

        ++v6;
      }
      while (v3 != v6);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      v3 = v15;
    }
    while (v15);
  }

}

- (void)personIdentificationForSyndicationPhotoLibrary:(id)a3 withCancelOrExtendTimeoutBlock:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *management;
  os_log_type_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  GDVUVisualUnderstandingService *vuService;
  void *v33;
  VNPersonsModel *personsModel;
  float v35;
  void *v36;
  float v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  float v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  int v63;
  id v64;
  NSObject *v65;
  const char *v66;
  os_log_type_t v67;
  uint32_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  id v83;
  uint64_t (**v84)(void);
  id v85;
  _QWORD aBlock[4];
  id v87;
  id v88;
  id v89;
  _QWORD v90[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  void *v100;
  _QWORD v101[6];

  v101[3] = *MEMORY[0x1E0C80C00];
  v83 = a3;
  v84 = (uint64_t (**)(void))a4;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v83, "vcp_description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[PersonIdentification][%@]"), v6);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v83, "vcp_isSyndicationLibrary") & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v81;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Unsupported library", buf, 0xCu);
    }
    goto LABEL_111;
  }
  if (v84 && (v84[2]() & 1) != 0)
    goto LABEL_111;
  -[PHPhotoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:](self->_photoLibrary, "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:", 0, &unk_1E6B765A8);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "librarySpecificFetchOptions");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setIncludeOnlyFacesWithFaceprints:", 1);
  objc_msgSend(v79, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  v7 = *MEMORY[0x1E0CD1B68];
  v101[0] = *MEMORY[0x1E0CD1B70];
  v101[1] = v7;
  v101[2] = *MEMORY[0x1E0CD1B58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFetchPropertySets:", v8);

  objc_msgSend(MEMORY[0x1E0CD16F0], "mediaProcessingFacesSortDescriptorsForGeneratingPersonModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setInternalSortDescriptors:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("nameSource == %ld"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v79);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v82, "count"))
  {
    if ((int)MediaAnalysisLogLevel() < 6)
      goto LABEL_110;
    v14 = OS_LOG_TYPE_INFO;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_110;
    *(_DWORD *)buf = 138412290;
    v93 = v81;
    v15 = MEMORY[0x1E0C81028];
    v16 = "%@ No face needs to identify";
LABEL_103:
    _os_log_impl(&dword_1B6C4A000, v15, v14, v16, buf, 0xCu);
    goto LABEL_110;
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v93 = v81;
    v94 = 2048;
    v95 = objc_msgSend(v82, "count");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Identifying %lu faces", buf, 0x16u);
  }
  if (v84 && (v84[2]() & 1) != 0)
    goto LABEL_110;
  v11 = -[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery");
  v12 = MEMORY[0x1E0C809B0];
  if (v11 && _os_feature_enabled_impl())
  {
    management = self->_management;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke;
    block[3] = &unk_1E6B15468;
    block[4] = self;
    dispatch_sync(management, block);
    if (!self->_vuService)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
        goto LABEL_110;
      v14 = OS_LOG_TYPE_DEFAULT;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_110;
      *(_DWORD *)buf = 138412290;
      v93 = v81;
      v15 = MEMORY[0x1E0C81028];
      v16 = "%@[VU] Persons Model is not ready; skip processing";
      goto LABEL_103;
    }
    goto LABEL_23;
  }
  v17 = self->_management;
  v90[0] = v12;
  v90[1] = 3221225472;
  v90[2] = __121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke_231;
  v90[3] = &unk_1E6B15468;
  v90[4] = self;
  dispatch_sync(v17, v90);
  if (!self->_personsModel)
  {
    if ((int)MediaAnalysisLogLevel() < 5)
      goto LABEL_110;
    v14 = OS_LOG_TYPE_DEFAULT;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 138412290;
    v93 = v81;
    v15 = MEMORY[0x1E0C81028];
    v16 = "%@ VIP Persons Model is not ready";
    goto LABEL_103;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = MEMORY[0x1E0C81028];
  v20 = 0;
  while (v18 < objc_msgSend(v82, "count"))
  {
    v21 = v20;
    v22 = v19;
    v23 = (void *)MEMORY[0x1BCCA1B2C]();
    if (!v84 || (v84[2]() & 1) == 0)
    {
      objc_msgSend(v82, "objectAtIndexedSubscript:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v25, "localIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@[%@]"), v81, v27);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "faceClusteringProperties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "faceprint");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v93 = v78;
          _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEFAULT, "%@ Failed to obtain faceprint; skipping", buf, 0xCu);
        }
        v24 = 14;
        goto LABEL_81;
      }
      objc_msgSend(v29, "faceprintData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[VCPFaceIDModel faceObservationFromFaceprintData:](VCPFaceIDModel, "faceObservationFromFaceprintData:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v93 = v78;
          _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEFAULT, "%@ Failed to obtain face observation; skipping",
            buf,
            0xCu);
        }
        v24 = 14;
        goto LABEL_80;
      }
      if (-[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery")
        && _os_feature_enabled_impl())
      {
        vuService = self->_vuService;
        v89 = 0;
        -[GDVUVisualUnderstandingService recognizeIn:context:error:](vuService, "recognizeIn:context:error:", v31, 0, &v89);
        v77 = (id)objc_claimAutoreleasedReturnValue();
        v73 = v89;
        if (v73)
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v93 = v78;
            v94 = 2112;
            v95 = (uint64_t)v73;
            _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEFAULT, "%@[VU] Failed to classify face - %@", buf, 0x16u);
          }

          v24 = 14;
          v33 = v73;
LABEL_79:

LABEL_80:
LABEL_81:

          v19 = v22;
          v20 = v21;
          goto LABEL_82;
        }
        objc_msgSend(v77, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v43)
        {
          objc_msgSend(v43, "confidence");
          if (v45 <= VCPPersonFaceVIPMatchingThreshold())
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v55 = (void *)MEMORY[0x1E0CB37E8];
              v71 = v44;
              objc_msgSend(v44, "confidence");
              objc_msgSend(v55, "numberWithFloat:");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v93 = v78;
              v94 = 2112;
              v95 = (uint64_t)v56;
              _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEBUG, "%@[VU] Face not identified, confidence:%@", buf, 0x16u);

              goto LABEL_89;
            }
          }
          else
          {
            v71 = v44;
            objc_msgSend(v44, "entityIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "stringValue");
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            v47 = (void *)MEMORY[0x1E0CD16C8];
            v100 = v70;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "fetchPersonsWithMdIDs:options:", v48, v76);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "firstObject");
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (v50)
            {
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v50, "localIdentifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "entityIdentifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "stringValue");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "confidence");
                *(_DWORD *)buf = 138413058;
                v93 = v78;
                v94 = 2112;
                v95 = (uint64_t)v69;
                v96 = 2112;
                v97 = *(double *)&v52;
                v98 = 2048;
                v99 = v53;
                _os_log_impl(&dword_1B6C4A000, v22, OS_LOG_TYPE_DEBUG, "%@[VU] Identified as %@ (%@) with confidence:%.2f", buf, 0x2Au);

              }
              objc_msgSend(v50, "localIdentifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "setObject:forKeyedSubscript:", v54, v25);

            }
            else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v71, "entityIdentifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "stringValue");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "confidence");
              *(_DWORD *)buf = 138412802;
              v93 = v78;
              v94 = 2112;
              v95 = (uint64_t)v58;
              v96 = 2048;
              v97 = v59;
              _os_log_impl(&dword_1B6C4A000, v22, OS_LOG_TYPE_DEBUG, "%@[VU] Identified as %@ with confidence:%.2f, but invalid person", buf, 0x20u);

            }
LABEL_89:
            v44 = v71;
          }

          v24 = 0;
LABEL_47:
          v33 = v77;
          goto LABEL_79;
        }
        if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v19, (os_log_type_t)v21))
        {
          *(_DWORD *)buf = 138412290;
          v93 = v78;
          _os_log_impl(&dword_1B6C4A000, v19, (os_log_type_t)v21, "%@[VU] No valid identification", buf, 0xCu);
        }
LABEL_46:
        v24 = 14;
        goto LABEL_47;
      }
      personsModel = self->_personsModel;
      v88 = 0;
      -[VNPersonsModel predictPersonFromFaceObservation:limit:canceller:error:](personsModel, "predictPersonFromFaceObservation:limit:canceller:error:", v31, 1, 0, &v88);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v88;
      if (v77)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v93 = v78;
          v94 = 2112;
          v95 = (uint64_t)v77;
          _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEFAULT, "%@ Face identification process failed - %@; skipping",
            buf,
            0x16u);
        }

        goto LABEL_46;
      }
      objc_msgSend(v33, "firstObject");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "confidence");
      if (v35 > VCPPersonFaceVIPMatchingThreshold())
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v74, "predictedPersonUniqueIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "confidence");
          *(_DWORD *)buf = 138412802;
          v93 = v78;
          v94 = 2112;
          v95 = (uint64_t)v36;
          v96 = 2048;
          v97 = v37;
          _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEBUG, "%@ Face identified as %@ confidence:%.2f", buf, 0x20u);

        }
        objc_msgSend(v33, "firstObject");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject predictedPersonUniqueIdentifier](v19, "predictedPersonUniqueIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v38, v25);

        goto LABEL_77;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v39 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v40 = (uint64_t)v72;
          if (v74)
          {
            v41 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v74, "confidence");
            objc_msgSend(v41, "numberWithFloat:");
            v40 = objc_claimAutoreleasedReturnValue();
            v42 = (const __CFString *)v40;
          }
          else
          {
            v42 = CFSTR("NaN");
          }
          v72 = (void *)v40;
          *(_DWORD *)buf = 138412546;
          v93 = v78;
          v94 = 2112;
          v95 = (uint64_t)v42;
          _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEBUG, "%@ Face not identified, confidence:%@", buf, 0x16u);
          if (v74)

        }
LABEL_77:

      }
      v24 = 0;
      goto LABEL_79;
    }
    v24 = 1;
LABEL_82:
    objc_autoreleasePoolPop(v23);
    if (v24 && v24 != 14)
      goto LABEL_109;
    ++v18;
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v60 = objc_msgSend(v75, "count");
    v61 = objc_msgSend(v82, "count");
    *(_DWORD *)buf = 138412802;
    v93 = v81;
    v94 = 2048;
    v95 = v60;
    v96 = 2048;
    v97 = *(double *)&v61;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Identified %lu out of %lu faces", buf, 0x20u);
  }
  if (objc_msgSend(v75, "count"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke_235;
    aBlock[3] = &unk_1E6B15468;
    v87 = v75;
    v62 = _Block_copy(aBlock);
    v85 = 0;
    v63 = objc_msgSend(v83, "performChangesAndWait:error:", v62, &v85);
    v64 = v85;
    if (v63)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v93 = v81;
        v65 = MEMORY[0x1E0C81028];
        v66 = "%@ Successfully persisted identification results";
        v67 = OS_LOG_TYPE_INFO;
        v68 = 12;
        goto LABEL_107;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v93 = v81;
      v94 = 2112;
      v95 = (uint64_t)v64;
      v65 = MEMORY[0x1E0C81028];
      v66 = "%@ Failed to persist identification results - %@";
      v67 = OS_LOG_TYPE_ERROR;
      v68 = 22;
LABEL_107:
      _os_log_impl(&dword_1B6C4A000, v65, v67, v66, buf, v68);
    }

  }
LABEL_109:

LABEL_110:
LABEL_111:

}

_QWORD *__121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[6])
    return (_QWORD *)objc_msgSend(result, "_loadPersonsModelAndInitializeFaceAnalyzer");
  return result;
}

_QWORD *__121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke_231(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[1])
    return (_QWORD *)objc_msgSend(result, "_loadPersonsModelAndInitializeFaceAnalyzer");
  return result;
}

void __121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke_235(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v12 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CD16A0];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuidFromLocalIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "associateFaceWithPersonUUID:", v9);
        objc_msgSend(v6, "setNameSource:", 6);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v2);
  }

}

- (BOOL)_persistPersonsModel:(id)a3 evaluationMode:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a3;
  -[PHPhotoLibrary vcp_vipModelFilepathForVIPType:](self->_photoLibrary, "vcp_vipModelFilepathForVIPType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[VCPFaceIDModel persistModel:toPath:error:](VCPFaceIDModel, "persistModel:toPath:error:", v7, v8, a5);

  return (char)a5;
}

- (BOOL)_persistPetsModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PHPhotoLibrary vcp_vipModelFilepathForVIPType:](self->_photoLibrary, "vcp_vipModelFilepathForVIPType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[VCPFaceIDModel persistPetsModel:toPath:error:](VCPFaceIDModel, "persistPetsModel:toPath:error:", v6, v7, a4);

  return (char)a4;
}

- (id)_fetchPersonsToFeedVIPModel:(BOOL)a3 allowUnverifiedPerson:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v4 = a4;
  v17[2] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType = %@ OR verifiedType = %@"), &unk_1E6B742A0, &unk_1E6B742B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType = %@"), &unk_1E6B74300);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v10);

  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v13);

  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_fetchPetsToFeedVIPModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchLimit:", 100);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  objc_msgSend(v2, "setIncludedDetectionTypes:", &unk_1E6B765C0);
  objc_msgSend(v2, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v2, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(v2, "setIncludeTorsoOnlyPerson:", 0);
  objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithOptions:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fetchEntityForModelType:(unint64_t)a3 evaluationMode:(BOOL)a4 allowUnverifiedPerson:(BOOL)a5
{
  void *v6;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    -[VCPPhotosQuickFaceIdentificationManager _fetchPetsToFeedVIPModel](self, "_fetchPetsToFeedVIPModel", 1, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 134217984;
      v9 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Model: unknown VIP type (%lu); no entity fetched",
        (uint8_t *)&v8,
        0xCu);
    }
    v6 = 0;
  }
  else
  {
    -[VCPPhotosQuickFaceIdentificationManager _fetchPersonsToFeedVIPModel:allowUnverifiedPerson:](self, "_fetchPersonsToFeedVIPModel:allowUnverifiedPerson:", a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (int)_generatePetsModelWithExtendTimeoutBlock:(id)a3 cancel:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  BOOL v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  PHPhotoLibrary *photoLibrary;
  id v64;
  BOOL v65;
  id v66;
  BOOL v67;
  PHPhotoLibrary *v68;
  void *v69;
  id v70;
  void *v72;
  void *v73;
  void *v74;
  id type;
  VCPPhotosFaceProcessingContext *v76;
  id v77;
  VCPPhotosQuickFaceIdentificationManager *v78;
  void (**v79)(void);
  uint64_t v80;
  uint64_t v81;
  unsigned int (**v82)(void);
  void *v83;
  void *context;
  void *contexta;
  void *contextb;
  void *v87;
  id obj;
  id obja;
  id objb;
  os_signpost_id_t spid;
  id spida;
  void *spidb;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  _QWORD v113[4];
  id v114;
  id v115;
  void *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  id v122;
  id v123;
  uint64_t v124;
  _BYTE v125[128];
  uint64_t v126;
  _BYTE v127[128];
  uint8_t v128[128];
  uint8_t buf[4];
  id v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  void *v134;
  _BYTE v135[128];
  _QWORD v136[4];

  v136[1] = *MEMORY[0x1E0C80C00];
  v79 = (void (**)(void))a3;
  v82 = (unsigned int (**)(void))a4;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pets Model: Begin Pets model generation", buf, 2u);
  }
  context = (void *)mach_absolute_time();
  v78 = self;
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPPetVIPGenerateModel", ", buf, 2u);
  }

  -[VCPPhotosQuickFaceIdentificationManager fetchEntityForModelType:evaluationMode:allowUnverifiedPerson:](self, "fetchEntityForModelType:evaluationMode:allowUnverifiedPerson:", 1, 0, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = *MEMORY[0x1E0CD1B58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setFetchPropertySets:", v9);

  objc_msgSend(v87, "setIncludeOnlyFacesWithFaceprints:", 1);
  objc_msgSend(v87, "setFetchLimit:", 512);
  objc_msgSend(MEMORY[0x1E0CD16F0], "mediaProcessingFacesSortDescriptorsForGeneratingPersonModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setInternalSortDescriptors:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("nameSource != %ld"), 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setPredicate:", v11);

  objc_msgSend(v87, "setIncludedDetectionTypes:", &unk_1E6B765D8);
  v76 = -[VCPPhotosFaceProcessingContext initWithPhotoLibrary:]([VCPPhotosFaceProcessingContext alloc], "initWithPhotoLibrary:", self->_photoLibrary);
  v12 = objc_alloc_init(MEMORY[0x1E0CEDE20]);
  v123 = v12;
  v13 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v123, objc_opt_class(), -[VCPPhotosFaceProcessingContext processingVersion](v76, "processingVersion"));
  v77 = v123;

  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Failed to initialize VNAnimalObservation", buf, 2u);
    }
  }
  else
  {
    v122 = 0;
    v14 = objc_msgSend(MEMORY[0x1E0CEDEC8], "newConfigurationForEntityPrintsGeneratedByRequest:error:", v77, &v122);
    v15 = v122;
    v16 = v15;
    v73 = (void *)v14;
    if (!v14 || v15)
    {
      v72 = v15;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v130 = v16;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Failed to create VNEntityIdentificationModelConfiguration - %@", buf, 0xCu);
      }
      v13 = -18;
    }
    else
    {
      v121 = 0;
      objc_msgSend(MEMORY[0x1E0CEDF88], "modelWithConfiguration:error:", v14, &v121);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v121;
      v19 = v18;
      v83 = (void *)v17;
      if (!v17 || v18)
      {
        v72 = v18;
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v130 = v19;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create VNMutableEntityIdentificationModel - %@", buf, 0xCu);
        }
        v13 = -18;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        obj = v74;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v135, 16);
        if (v21)
        {
          v13 = 0;
          v22 = *(_QWORD *)v118;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v118 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x1BCCA1B2C]();
              if (v82 && v82[2]())
              {
                if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  v26 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B6C4A000, v26, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model: Model generation cancelled; quitting\n",
                      buf,
                      2u);
                  }
                }
                v27 = 0;
                v13 = -128;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForPerson:options:", v24, v87);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v24, "localIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v28, "count");
                  *(_DWORD *)buf = 138412802;
                  v130 = v29;
                  v131 = 2048;
                  v132 = v30;
                  v133 = 2112;
                  v134 = v28;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pets Model: petPerson: %@, petFaceFetchResult(%lu): %@", buf, 0x20u);

                }
                v113[0] = MEMORY[0x1E0C809B0];
                v113[1] = 3221225472;
                v113[2] = __91__VCPPhotosQuickFaceIdentificationManager__generatePetsModelWithExtendTimeoutBlock_cancel___block_invoke;
                v113[3] = &unk_1E6B19380;
                v114 = v20;
                v115 = v83;
                v116 = v24;
                +[VCPPhotosPersistenceDelegate enumerateFetchResult:withBatchSize:handler:](VCPPhotosPersistenceDelegate, "enumerateFetchResult:withBatchSize:handler:", v28, 128, v113);
                if (v79)
                  v79[2]();

                v27 = 1;
              }
              objc_autoreleasePoolPop(v25);
              if (!v27)
              {

                v72 = 0;
                goto LABEL_98;
              }
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v135, 16);
            if (v21)
              continue;
            break;
          }
        }

        VCPSignPostLog();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_END, spid, "VCPPetVIPGenerateModel", ", buf, 2u);
        }

        if (context)
        {
          mach_absolute_time();
          VCPPerformance_LogMeasurement();
        }
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pets Model: Finished model generation", buf, 2u);
        }
        v112 = 0;
        v33 = -[VCPPhotosQuickFaceIdentificationManager _persistPetsModel:error:](v78, "_persistPetsModel:error:", v83, &v112);
        v34 = v112;
        v72 = v34;
        if (v33)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = 0u;
          v111 = 0u;
          v108 = 0u;
          v109 = 0u;
          type = obj;
          v36 = objc_msgSend(type, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
          if (v36)
          {
            v80 = *(_QWORD *)v109;
            do
            {
              v37 = 0;
              v81 = v36;
              do
              {
                if (*(_QWORD *)v109 != v80)
                  objc_enumerationMutation(type);
                v38 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v37);
                contexta = (void *)MEMORY[0x1BCCA1B2C]();
                objc_msgSend(v38, "localIdentifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v107 = 0;
                objc_msgSend(v83, "trainingObservationsForEntityWithUniqueIdentifier:canceller:error:", v39, 0, &v107);
                obja = (id)objc_claimAutoreleasedReturnValue();
                spida = v107;

                if (spida)
                {
                  if ((int)MediaAnalysisLogLevel() >= 4
                    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v38, "localIdentifier");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v130 = v40;
                    v131 = 2112;
                    v132 = (uint64_t)spida;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model: Could not get animalObservations for pet %@ - %@", buf, 0x16u);

                  }
                }
                else
                {
                  v105 = 0u;
                  v106 = 0u;
                  v103 = 0u;
                  v104 = 0u;
                  v41 = obja;
                  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v103, v127, 16);
                  if (v42)
                  {
                    v43 = *(_QWORD *)v104;
                    do
                    {
                      for (j = 0; j != v42; ++j)
                      {
                        if (*(_QWORD *)v104 != v43)
                          objc_enumerationMutation(v41);
                        objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * j), "uuid");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v45, "UUIDString");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v20, "objectForKeyedSubscript:", v46);
                        v47 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v47)
                          objc_msgSend(v35, "addObject:", v47);

                      }
                      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v103, v127, 16);
                    }
                    while (v42);
                  }

                }
                objc_autoreleasePoolPop(contexta);
                ++v37;
              }
              while (v37 != v81);
              v36 = objc_msgSend(type, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
            }
            while (v36);
          }

          -[PHPhotoLibrary librarySpecificFetchOptions](v78->_photoLibrary, "librarySpecificFetchOptions");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = *MEMORY[0x1E0CD1B70];
          v126 = *MEMORY[0x1E0CD1B70];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setFetchPropertySets:", v50);

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isInVIPModel == YES"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setPredicate:", v51);

          objc_msgSend(v48, "setIncludedDetectionTypes:", &unk_1E6B765F0);
          objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", v48);
          contextb = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(contextb, "count"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v53 = contextb;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v99, v125, 16);
          if (v54)
          {
            v55 = *(_QWORD *)v100;
            do
            {
              for (k = 0; k != v54; ++k)
              {
                if (*(_QWORD *)v100 != v55)
                  objc_enumerationMutation(v53);
                objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * k), "localIdentifier");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "addObject:", v57);

              }
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v99, v125, 16);
            }
            while (v54);
          }

          objb = (id)objc_msgSend(v52, "mutableCopy");
          objc_msgSend(objb, "minusSet:", v35);
          spidb = (void *)objc_msgSend(v35, "mutableCopy");
          objc_msgSend(spidb, "minusSet:", v52);
          objc_msgSend(objb, "allObjects");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(spidb, "allObjects");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "arrayByAddingObjectsFromArray:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v60, "count"))
          {
            -[PHPhotoLibrary librarySpecificFetchOptions](v78->_photoLibrary, "librarySpecificFetchOptions");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v124 = v49;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setFetchPropertySets:", v62);

            objc_msgSend(v61, "setIncludedDetectionTypes:", &unk_1E6B76608);
            photoLibrary = v78->_photoLibrary;
            v95[0] = MEMORY[0x1E0C809B0];
            v95[1] = 3221225472;
            v95[2] = __91__VCPPhotosQuickFaceIdentificationManager__generatePetsModelWithExtendTimeoutBlock_cancel___block_invoke_266;
            v95[3] = &unk_1E6B17B88;
            v96 = v60;
            v64 = v61;
            v97 = v64;
            v98 = spidb;
            v94 = 0;
            v65 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v95, &v94);
            v66 = v94;
            if (v66)
              v67 = 0;
            else
              v67 = v65;
            if (!v67
              && (int)MediaAnalysisLogLevel() >= 3
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v130 = v66;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Could not persist isInVIPModel on trained pets - %@", buf, 0xCu);
            }

          }
          v68 = v78->_photoLibrary;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHPhotoLibrary vcp_setAnalysisPreferencesValue:forKey:](v68, "vcp_setAnalysisPreferencesValue:forKey:", v69, CFSTR("PetIDModelLastGenerationKey"));

          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID Pets Model: Finished model generation and persistence", buf, 2u);
          }

          v13 = 0;
        }
        else
        {
          v70 = v34;
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v130 = v70;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Failed to persist pet model %@", buf, 0xCu);
          }
          v13 = -18;
        }
LABEL_98:

      }
    }

  }
  return v13;
}

void __91__VCPPhotosQuickFaceIdentificationManager__generatePetsModelWithExtendTimeoutBlock_cancel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  char v25;
  id v26;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v26;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v2)
  {
    v30 = *(_QWORD *)v35;
    do
    {
      v31 = v2;
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v4, "faceClusteringProperties");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "faceprint");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "faceprintData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_alloc(MEMORY[0x1E0CEDDA0]);
        v33 = 0;
        v9 = (void *)objc_msgSend(v8, "initWithState:error:", v7, &v33);
        v10 = v33;
        v11 = v10;
        if (v9)
          v12 = v10 == 0;
        else
          v12 = 0;
        if (v12)
        {
          v13 = objc_alloc(MEMORY[0x1E0CEDD98]);
          LODWORD(v14) = 1065336439;
          v15 = (void *)objc_msgSend(v13, "initWithAnimalprint:confidence:", v9, v14);
          if (v15)
          {
            objc_msgSend(v28, "addObject:", v15);
            objc_msgSend(v4, "localIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(void **)(a1 + 32);
            objc_msgSend(v15, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "UUIDString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v19);

          }
          else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = (uint64_t)v4;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model: Could not add animalObservation to model for pet (PHFace): %@.", buf, 0xCu);
          }

        }
        else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v39 = (uint64_t)v4;
          v40 = 2112;
          v41 = v11;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model: Could not create animalprint for pet (PHFace): %@ - %@", buf, 0x16u);
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v2);
  }

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v20 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 134218242;
    v39 = v20;
    v40 = 2112;
    v41 = v28;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Pets Model: animalObservations(%lu): %@", buf, 0x16u);
  }
  if (objc_msgSend(v28, "count"))
  {
    v21 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "localIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v23 = objc_msgSend(v21, "addObservations:toEntityWithUniqueIdentifier:error:", v28, v22, &v32);
    v24 = v32;

    if (v24)
      v25 = 0;
    else
      v25 = v23;
    if ((v25 & 1) == 0
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = (uint64_t)v24;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Could not add animalprint to model - %@", buf, 0xCu);
    }

  }
}

void __91__VCPPhotosQuickFaceIdentificationManager__generatePetsModelWithExtendTimeoutBlock_cancel___block_invoke_266(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:", a1[4], a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)a1[6];
        objc_msgSend(v6, "localIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setIsInVIPModel:", objc_msgSend(v8, "containsObject:", v9));

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (int)_generatePersonsModelWithExtendTimeoutBlock:(id)a3 cancel:(id)a4 evaluationMode:(BOOL)a5 allowUnverifiedPerson:(BOOL)a6
{
  _BOOL8 v6;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  char v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  BOOL v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  PHPhotoLibrary *photoLibrary;
  id v70;
  id v71;
  PHPhotoLibrary *v72;
  void *v73;
  uint64_t v75;
  uint64_t v76;
  id v77;
  VCPPhotosQuickFaceIdentificationManager *v78;
  void *v79;
  os_signpost_id_t spid;
  void *v81;
  void (**v82)(void);
  unsigned int (**v83)(void);
  void *v84;
  _BOOL4 obj;
  id obja;
  uint64_t v87;
  uint64_t v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *context;
  id contexta;
  void *contextb;
  id v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  _BYTE *v119;
  uint64_t v120;
  _BYTE v121[128];
  uint64_t v122;
  _BYTE v123[128];
  uint8_t v124[128];
  uint8_t v125[4];
  uint64_t v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  _BYTE buf[24];
  void *v132;
  _QWORD v133[7];

  v6 = a6;
  obj = a5;
  v133[4] = *MEMORY[0x1E0C80C00];
  v82 = (void (**)(void))a3;
  v83 = (unsigned int (**)(void))a4;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID Model: Begin model generation", buf, 2u);
  }
  v76 = mach_absolute_time();
  v78 = self;
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPPersonVIPGenerateModel", ", buf, 2u);
  }

  -[VCPPhotosQuickFaceIdentificationManager _fetchPersonsToFeedVIPModel:allowUnverifiedPerson:](self, "_fetchPersonsToFeedVIPModel:allowUnverifiedPerson:", obj, v6);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CD1B68];
  v75 = *MEMORY[0x1E0CD1B70];
  v133[0] = *MEMORY[0x1E0CD1B70];
  v133[1] = v12;
  v13 = *MEMORY[0x1E0CD1B80];
  v133[2] = *MEMORY[0x1E0CD1B58];
  v133[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setFetchPropertySets:", v14);

  objc_msgSend(v81, "setIncludeOnlyFacesWithFaceprints:", 1);
  objc_msgSend(v81, "setIncludeNonvisibleFaces:", 1);
  objc_msgSend(v81, "setFetchLimit:", 5120);
  objc_msgSend(MEMORY[0x1E0CD16F0], "mediaProcessingFacesSortDescriptorsForGeneratingPersonModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setInternalSortDescriptors:", v15);

  v79 = (void *)objc_msgSend(v81, "copy");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("roll == 0.0"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setInternalPredicate:", v16);

  v89 = +[VCPFaceIDModel newMutablePersonsModel](VCPFaceIDModel, "newMutablePersonsModel");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = MEMORY[0x1E0C81028];
  v20 = 2;
  while (v18 < objc_msgSend(v84, "count"))
  {
    context = (void *)MEMORY[0x1BCCA1B2C]();
    if (v83 && v83[2]())
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: Model generation cancelled. Quitting", buf, 2u);
      }
      v21 = 0;
    }
    else
    {
      objc_msgSend(v84, "objectAtIndexedSubscript:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v19, (os_log_type_t)v20))
      {
        if (objc_msgSend(v22, "verifiedType") == 2)
          v23 = CFSTR("graph");
        else
          v23 = CFSTR("user");
        objc_msgSend(v22, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        v132 = v25;
        _os_log_impl(&dword_1B6C4A000, v19, (os_log_type_t)v20, "QuickFaceID: Building %@-confirmed person %@ (%@)", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForPerson:options:", v22, v81);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v19, (os_log_type_t)v20))
      {
        v27 = objc_msgSend(v26, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v27;
        _os_log_impl(&dword_1B6C4A000, v19, (os_log_type_t)v20, "FaceID Model: fetched %lu faces", buf, 0xCu);
      }
      if ((unint64_t)objc_msgSend(v26, "count") > 0x13)
      {
        v28 = v26;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesForPerson:options:", v22, v79);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v19, (os_log_type_t)v20))
        {
          v29 = objc_msgSend(v28, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v29;
          _os_log_impl(&dword_1B6C4A000, v19, (os_log_type_t)v20, "FaceID Model: fetched %lu faces without roll predicate", buf, 0xCu);
        }
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v132 = 0;
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __131__VCPPhotosQuickFaceIdentificationManager__generatePersonsModelWithExtendTimeoutBlock_cancel_evaluationMode_allowUnverifiedPerson___block_invoke;
      v115[3] = &unk_1E6B193A8;
      v116 = v89;
      v117 = v17;
      v119 = buf;
      v30 = v22;
      v118 = v30;
      +[VCPPhotosPersistenceDelegate enumerateFetchResult:withBatchSize:handler:](VCPPhotosPersistenceDelegate, "enumerateFetchResult:withBatchSize:handler:", v28, 128, v115);
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v19, (os_log_type_t)v20))
      {
        v31 = v20;
        v32 = v19;
        v33 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
        objc_msgSend(v30, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v125 = 134218498;
        v126 = v33;
        v127 = 2112;
        v128 = v34;
        v129 = 2112;
        v130 = v35;
        v19 = v32;
        v36 = v32;
        v20 = v31;
        _os_log_impl(&dword_1B6C4A000, v36, (os_log_type_t)v31, "QuickFaceID: Built using %lu faces for person %@ (%@)", v125, 0x20u);

      }
      if (v82)
        v82[2]();

      _Block_object_dispose(buf, 8);
      v21 = 1;
    }
    objc_autoreleasePoolPop(context);
    ++v18;
    if ((v21 & 1) == 0)
    {
      v37 = -128;
      goto LABEL_89;
    }
  }
  VCPSignPostLog();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v39, OS_SIGNPOST_INTERVAL_END, spid, "VCPPersonVIPGenerateModel", ", buf, 2u);
  }

  if (v76)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], (os_log_type_t)v20))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], (os_log_type_t)v20, "QuickFaceID Model: Finished model generation", buf, 2u);
  }
  v114 = 0;
  v40 = -[VCPPhotosQuickFaceIdentificationManager _persistPersonsModel:evaluationMode:error:](self, "_persistPersonsModel:evaluationMode:error:", v89, obj, &v114);
  v77 = v114;
  if (v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    obja = v84;
    v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
    if (v42)
    {
      v87 = *(_QWORD *)v111;
      do
      {
        v43 = 0;
        v88 = v42;
        do
        {
          if (*(_QWORD *)v111 != v87)
            objc_enumerationMutation(obja);
          v44 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v43);
          v90 = (void *)MEMORY[0x1BCCA1B2C]();
          objc_msgSend(v44, "localIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = 0;
          objc_msgSend(v89, "trainingFaceObservationsForPersonWithUniqueIdentifier:canceller:error:", v45, 0, &v109);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          contexta = v109;

          if (contexta)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v44, "localIdentifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v46;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = contexta;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: Could not get face observations for person %@ - %@", buf, 0x16u);

            }
          }
          else
          {
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v47 = v91;
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
            if (v48)
            {
              v49 = *(_QWORD *)v106;
              do
              {
                for (i = 0; i != v48; ++i)
                {
                  if (*(_QWORD *)v106 != v49)
                    objc_enumerationMutation(v47);
                  objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "uuid");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "UUIDString");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKeyedSubscript:", v52);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v53)
                    objc_msgSend(v41, "addObject:", v53);

                }
                v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
              }
              while (v48);
            }

          }
          objc_autoreleasePoolPop(v90);
          ++v43;
        }
        while (v43 != v88);
        v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
      }
      while (v42);
    }

    -[PHPhotoLibrary librarySpecificFetchOptions](v78->_photoLibrary, "librarySpecificFetchOptions");
    contextb = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(contextb, "setFetchPropertySets:", v54);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isInVIPModel == YES"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(contextb, "setPredicate:", v55);

    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithOptions:", contextb);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v92, "count"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v57 = v92;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v102;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v102 != v59)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * j), "localIdentifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v61);

        }
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
      }
      while (v58);
    }

    v62 = (void *)objc_msgSend(v56, "mutableCopy");
    objc_msgSend(v62, "minusSet:", v41);
    v63 = (void *)objc_msgSend(v41, "mutableCopy");
    objc_msgSend(v63, "minusSet:", v56);
    objc_msgSend(v62, "allObjects");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "allObjects");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "arrayByAddingObjectsFromArray:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v66, "count"))
    {
      -[PHPhotoLibrary librarySpecificFetchOptions](v78->_photoLibrary, "librarySpecificFetchOptions");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v75;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setFetchPropertySets:", v68);

      photoLibrary = v78->_photoLibrary;
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = __131__VCPPhotosQuickFaceIdentificationManager__generatePersonsModelWithExtendTimeoutBlock_cancel_evaluationMode_allowUnverifiedPerson___block_invoke_277;
      v97[3] = &unk_1E6B17B88;
      v98 = v66;
      v70 = v67;
      v99 = v70;
      v100 = v63;
      v96 = 0;
      -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v97, &v96);
      v71 = v96;
      if (v71 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v71;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Model: Could not persist isInVIPModel on trained faces - %@", buf, 0xCu);
      }

    }
    v72 = v78->_photoLibrary;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary vcp_setAnalysisPreferencesValue:forKey:](v72, "vcp_setAnalysisPreferencesValue:forKey:", v73, CFSTR("FaceIDModelLastGenerationKey"));

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID Model: Finished model generation and persistence", buf, 2u);
    }

    v37 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v77;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Model: Failed to persist model %@", buf, 0xCu);
    }
    v37 = -18;
  }

LABEL_89:
  return v37;
}

void __131__VCPPhotosQuickFaceIdentificationManager__generatePersonsModelWithExtendTimeoutBlock_cancel_evaluationMode_allowUnverifiedPerson___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v32;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  v34 = a1;
  if (v3)
  {
    v38 = *(_QWORD *)v43;
    do
    {
      v39 = v3;
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v43 != v38)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1BCCA1B2C]();
        if (objc_msgSend(v5, "trainingType") != 4 && objc_msgSend(v5, "trainingType") != 2)
        {
          objc_msgSend(v5, "faceClusteringProperties");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "faceprint");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "faceprintData");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = objc_alloc(MEMORY[0x1E0CEDEE8]);
          v41 = 0;
          v10 = (void *)objc_msgSend(v9, "initWithState:error:", v8, &v41);
          v36 = v41;
          if (v10)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0CEDEE0]);
            objc_msgSend(v11, "setFaceTorsoprint:", v10);
            objc_msgSend(v10, "faceprint");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setFaceprint:", v12);

            if (v11)
            {
              objc_msgSend(v11, "faceprint");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13 == 0;

              if (v14)
                goto LABEL_24;
              objc_msgSend(*(id *)(v34 + 32), "configuration");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "faceprintRequestRevision"))
              {
                objc_msgSend(v11, "faceprint");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "requestRevision");
                objc_msgSend(*(id *)(v34 + 32), "configuration");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v17) = v17 == objc_msgSend(v18, "faceprintRequestRevision");

                if ((v17 & 1) == 0)
                {
                  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v5, "localIdentifier");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "faceprint");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v20, "requestRevision");
                    objc_msgSend(*(id *)(v34 + 32), "configuration");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v22, "faceprintRequestRevision");
                    *(_DWORD *)buf = 138412802;
                    v47 = v19;
                    v48 = 2048;
                    v49 = v21;
                    v50 = 2048;
                    v51 = v23;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Model[%@]: Mismatched faceprint version %lu (expected %lu).", buf, 0x20u);

                  }
                  goto LABEL_24;
                }
              }
              else
              {

              }
              objc_msgSend(v33, "addObject:", v11);
              objc_msgSend(v5, "localIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = *(void **)(v34 + 40);
              objc_msgSend(v11, "uuid");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "UUIDString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v27);

              ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v34 + 56) + 8) + 24);
              goto LABEL_24;
            }
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v5;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: Could not add faceprint to model for face: %@.", buf, 0xCu);
            }
LABEL_24:

          }
          else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v47 = v5;
            v48 = 2112;
            v49 = (uint64_t)v36;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: Could not create faceprint for face: %@. Error: %@", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v6);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v3);
  }

  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(*(id *)(v34 + 48), "localIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(v34 + 32);
    v40 = 0;
    v30 = +[VCPFaceIDModel addFaceObservations:forPersonIdentifier:toModel:error:](VCPFaceIDModel, "addFaceObservations:forPersonIdentifier:toModel:error:", v33, v28, v29, &v40);
    v31 = v40;

    if (!v30 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Model: Could not add faceprints to model. Error: %@", buf, 0xCu);
    }

  }
}

void __131__VCPPhotosQuickFaceIdentificationManager__generatePersonsModelWithExtendTimeoutBlock_cancel_evaluationMode_allowUnverifiedPerson___block_invoke_277(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:", a1[4], a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD1530], "changeRequestForFace:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)a1[6];
        objc_msgSend(v6, "localIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setIsInVIPModel:", objc_msgSend(v8, "containsObject:", v9));

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (BOOL)_modelLastGenerationDidExceedTimeIntervalForType:(unint64_t)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary vcp_analysisPreferences](self->_photoLibrary, "vcp_analysisPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("PetIDModelLastGenerationKey");
  if (!a3)
    v5 = CFSTR("FaceIDModelLastGenerationKey");
  v6 = v5;
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v7);
  v10 = v9;

  v11 = (double)0x15180uLL;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    VCPMAVIPTypeDescription(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("No");
    v15 = 138412802;
    v16 = v12;
    if (v10 > v11)
      v13 = CFSTR("Yes");
    v17 = 2048;
    v18 = v10;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "QuickFaceID %@ Model: Last job generation %.0fs ago, job is due = %@", (uint8_t *)&v15, 0x20u);

  }
  return v10 > v11;
}

- (BOOL)_faceProcessingPassGoalWithExtendTimeout:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  _BOOL4 v16;
  const char *v17;
  const char *v18;
  const char *v19;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  +[VCPAnalysisProgressQuery queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:", &v21, self->_photoLibrary, 3, a3);
  v3 = v21;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("total-allowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("processed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("failed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = 100 * (v9 + v7);
  v11 = 90 * v5;
  v12 = 100 * v9;
  v13 = 10 * v5;
  if (v5)
    v14 = v10 <= v11;
  else
    v14 = 1;
  v16 = !v14 && v12 <= v13;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v23 = v5;
    v24 = 2048;
    v25 = v7;
    v26 = 2048;
    v27 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID [FastMigration]: asset processing progress: total: %ld, processed: %ld, failed: %ld", buf, 0x20u);
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v17 = "No";
    if (v10 <= v11)
      v18 = "No";
    else
      v18 = "Yes";
    if (v12 > v13)
      v19 = "Yes";
    else
      v19 = "No";
    *(_DWORD *)buf = 136315650;
    v23 = (uint64_t)v18;
    v24 = 2080;
    v25 = (uint64_t)v19;
    if (v16)
      v17 = "Yes";
    v26 = 2080;
    v27 = (uint64_t)v17;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID [FastMigration]: asset processing rate: processed>90%%: %s, failure>10%%: %s, pass: %s", buf, 0x20u);
  }

  return v16;
}

+ (BOOL)_fastFaceMigrationEnabled
{
  return 0;
}

- (BOOL)_keepCurrentPersonsModelWithExtendTimeout:(id)a3
{
  id v4;
  NSObject *management;
  BOOL v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_fastFaceMigrationEnabled") & 1) != 0)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    management = self->_management;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__VCPPhotosQuickFaceIdentificationManager__keepCurrentPersonsModelWithExtendTimeout___block_invoke;
    block[3] = &unk_1E6B193D0;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(management, block);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __85__VCPPhotosQuickFaceIdentificationManager__keepCurrentPersonsModelWithExtendTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "vcp_vipModelFilepathForVIPType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = 0;
    +[VCPFaceIDModel loadVIPModelAtPath:withVIPType:error:](VCPFaceIDModel, "loadVIPModelAtPath:withVIPType:error:", v2, 0, &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "faceprintRequestRevision");

      LODWORD(v5) = objc_msgSend(*(id *)(a1 + 32), "faceProcessingVersionFromVNFaceprintRequestRevision:", v6);
      +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:](VCPFaceProcessingVersionManager, "sharedManagerForPhotoLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "currentProcessingVersion");

      if ((_DWORD)v5 != v8
        && (objc_msgSend(*(id *)(a1 + 32), "_faceProcessingPassGoalWithExtendTimeout:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID [FastMigration]: cannot load Persons Model: %@", buf, 0xCu);
    }

  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "QuickFaceID [FastMigration]: persistent storageDirectoryURL is nil", buf, 2u);
  }

}

- (BOOL)_needToGenerateModelWithType:(unint64_t)a3 ignoreLastGenerationTime:(BOOL)a4 withExtendTimeout:(id)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  BOOL v12;
  BOOL v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v5 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if ((-[PHPhotoLibrary isSystemPhotoLibrary](self->_photoLibrary, "isSystemPhotoLibrary") & 1) == 0)
    goto LABEL_10;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    VCPMAVIPTypeDescription(a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = "NO";
    if (v5)
      v11 = "YES";
    v15 = 138412546;
    v16 = v9;
    v17 = 2080;
    v18 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID %@ Model: ignoreLastGenerationTime: %s", (uint8_t *)&v15, 0x16u);

  }
  if (-[VCPPhotosQuickFaceIdentificationManager _modelLastGenerationDidExceedTimeIntervalForType:](self, "_modelLastGenerationDidExceedTimeIntervalForType:", a3)|| v5)
  {
    if (a3)
      v12 = 0;
    else
      v12 = -[VCPPhotosQuickFaceIdentificationManager _keepCurrentPersonsModelWithExtendTimeout:](self, "_keepCurrentPersonsModelWithExtendTimeout:", v8);
    v13 = !v12;
  }
  else
  {
LABEL_10:
    v13 = 0;
  }

  return v13;
}

- (int)generateVIPModelWithType:(unint64_t)a3 ignoreLastGenerationTime:(BOOL)a4 evaluationMode:(BOOL)a5 allowUnverifiedPerson:(BOOL)a6 modelGenerated:(BOOL *)a7 extendTimeout:(id)a8 andCancel:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  int v17;
  void *v18;
  int v19;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v15 = a8;
  v16 = a9;
  if (-[VCPPhotosQuickFaceIdentificationManager _needToGenerateModelWithType:ignoreLastGenerationTime:withExtendTimeout:](self, "_needToGenerateModelWithType:ignoreLastGenerationTime:withExtendTimeout:", a3, v12, v15))
  {
    if (a7)
      *a7 = 1;
    if (a3 == 1)
    {
      v17 = -[VCPPhotosQuickFaceIdentificationManager _generatePetsModelWithExtendTimeoutBlock:cancel:](self, "_generatePetsModelWithExtendTimeoutBlock:cancel:", v15, v16);
      goto LABEL_13;
    }
    if (!a3)
    {
      v17 = -[VCPPhotosQuickFaceIdentificationManager _generatePersonsModelWithExtendTimeoutBlock:cancel:evaluationMode:allowUnverifiedPerson:](self, "_generatePersonsModelWithExtendTimeoutBlock:cancel:evaluationMode:allowUnverifiedPerson:", v15, v16, v11, v10);
LABEL_13:
      v19 = v17;
      goto LABEL_18;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = 134217984;
      v22 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "QuickFaceID Model: unknown VIP type (%lu); no model generated",
        (uint8_t *)&v21,
        0xCu);
    }
    v19 = -50;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      VCPMAVIPTypeDescription(a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = (unint64_t)v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "QuickFaceID %@ Model: No need to generate model", (uint8_t *)&v21, 0xCu);

    }
    v19 = 0;
    if (a7)
      *a7 = 0;
  }
LABEL_18:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_management, 0);
  objc_storeStrong((id *)&self->_faceAnalyzer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_petsModel, 0);
  objc_storeStrong((id *)&self->_personsModel, 0);
}

@end
