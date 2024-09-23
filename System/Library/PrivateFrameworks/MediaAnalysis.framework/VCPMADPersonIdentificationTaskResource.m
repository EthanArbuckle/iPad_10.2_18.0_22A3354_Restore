@implementation VCPMADPersonIdentificationTaskResource

- (VCPMADPersonIdentificationTaskResource)init
{
  VCPMADPersonIdentificationTaskResource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPMADPersonIdentificationTaskResource;
  v2 = -[VCPMADVisionResource init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("VCPMADPersonIdentificationTaskResource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedResource
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_42);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

VCPMADPersonIdentificationTaskResource *__56__VCPMADPersonIdentificationTaskResource_sharedResource__block_invoke()
{
  return objc_alloc_init(VCPMADPersonIdentificationTaskResource);
}

- (void)_loadResources
{
  void *v3;
  PHPhotoLibrary *v4;
  PHPhotoLibrary *photoLibrary;
  _BOOL4 v6;
  VCPPhotosFaceProcessingContext *faceProcessingContext;
  uint64_t v8;
  VCPPhotosFaceProcessingContext *v9;
  VCPPhotosFaceProcessingContext *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  GDVUVisualUnderstandingService *v18;
  NSObject *v19;
  GDVUVisualUnderstandingService *vuService;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  int v29;
  VNPersonsModel *v30;
  id v31;
  VNPersonsModel *personIdentityModel;
  VNPersonsModel *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 buf;
  void *v45;
  void *v46;
  uint64_t *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  +[VCPDefaultPhotoLibraryManager sharedManager](VCPDefaultPhotoLibraryManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPhotoLibrary");
  v4 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v4;

  v6 = -[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery");
  faceProcessingContext = self->_faceProcessingContext;
  if (v6)
  {
    if (faceProcessingContext)
    {
      v8 = 56;
      goto LABEL_6;
    }
  }
  else if (faceProcessingContext)
  {
    v8 = 40;
LABEL_6:
    if (*(Class *)((char *)&self->super.super.super.isa + v8))
      return;
  }
  +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:](VCPPhotosFaceProcessingContext, "contextWithPhotoLibrary:", self->_photoLibrary);
  v9 = (VCPPhotosFaceProcessingContext *)objc_claimAutoreleasedReturnValue();
  v10 = self->_faceProcessingContext;
  self->_faceProcessingContext = v9;

  if (-[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery"))
  {
    -[PHPhotoLibrary vcp_visionCacheStorageDirectoryURL](self->_photoLibrary, "vcp_visionCacheStorageDirectoryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v12 = (void *)getGDVUVisualUnderstandingServiceClass(void)::softClass;
    v43 = getGDVUVisualUnderstandingServiceClass(void)::softClass;
    if (!getGDVUVisualUnderstandingServiceClass(void)::softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v45 = ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke;
      v46 = &unk_1E6B15540;
      v47 = &v40;
      ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke((uint64_t)&buf);
      v12 = (void *)v41[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v40, 8);
    v14 = [v13 alloc];
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v15 = (void *)getGDVUEntityRecognitionClientClass(void)::softClass;
    v43 = getGDVUEntityRecognitionClientClass(void)::softClass;
    if (!getGDVUEntityRecognitionClientClass(void)::softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v45 = ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_0;
      v46 = &unk_1E6B15540;
      v47 = &v40;
      ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_0((uint64_t)&buf);
      v15 = (void *)v41[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v40, 8);
    objc_msgSend(v16, "photos");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v18 = (GDVUVisualUnderstandingService *)objc_msgSend(v14, "initWithClient:version:url:error:", v17, 1, v11, &v39);
    v19 = v39;
    vuService = self->_vuService;
    self->_vuService = v18;

    if (!self->_vuService
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create MADGDVisualUnderstandingService instance - %@", (uint8_t *)&buf, 0xCu);
    }
    -[GDVUVisualUnderstandingService gallery](self->_vuService, "gallery");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "faceprintRevision");

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Gallery uses faceprint with revision %ld", (uint8_t *)&buf, 0xCu);
    }
    if (v22 == 3737841669)
      v23 = 15;
    else
      v23 = 11;
    -[VCPPhotosFaceProcessingContext setProcessingVersion:](self->_faceProcessingContext, "setProcessingVersion:", v23);
  }
  else
  {
    VCPSignPostLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_signpost_id_generate(v24);

    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PersonIdentityModel_init", ", (uint8_t *)&buf, 2u);
    }

    -[PHPhotoLibrary vcp_vipModelFilepathForVIPType:](self->_photoLibrary, "vcp_vipModelFilepathForVIPType:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "fileExistsAtPath:", v11);

    if (v29)
    {
      v38 = 0;
      +[VCPFaceIDModel loadVIPModelAtPath:withVIPType:error:](VCPFaceIDModel, "loadVIPModelAtPath:withVIPType:error:", v11, 0, &v38);
      v30 = (VNPersonsModel *)objc_claimAutoreleasedReturnValue();
      v31 = v38;
      personIdentityModel = self->_personIdentityModel;
      self->_personIdentityModel = v30;

      v33 = self->_personIdentityModel;
      if (v33)
      {
        -[VNPersonsModel configuration](v33, "configuration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "faceprintRequestRevision");

        if (v35 == 3737841669)
          v36 = 15;
        else
          v36 = 11;
        -[VCPPhotosFaceProcessingContext setProcessingVersion:](self->_faceProcessingContext, "setProcessingVersion:", v36);
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot load Person Identity Model - %@", (uint8_t *)&buf, 0xCu);
      }

    }
    else if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Person Identity Model not exist - %@", (uint8_t *)&buf, 0xCu);
    }
    VCPSignPostLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v19 = v37;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_END, v25, "PersonIdentityModel_init", ", (uint8_t *)&buf, 2u);
    }
  }

}

- (id)personIdentityModel
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__VCPMADPersonIdentificationTaskResource_personIdentityModel__block_invoke;
  v5[3] = &unk_1E6B16E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__VCPMADPersonIdentificationTaskResource_personIdentityModel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadResources");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (id)vuService
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VCPMADPersonIdentificationTaskResource_vuService__block_invoke;
  v5[3] = &unk_1E6B16E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__VCPMADPersonIdentificationTaskResource_vuService__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadResources");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (id)faceProcessingContext
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__VCPMADPersonIdentificationTaskResource_faceProcessingContext__block_invoke;
  v5[3] = &unk_1E6B16E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __63__VCPMADPersonIdentificationTaskResource_faceProcessingContext__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadResources");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (id)photoLibrary
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__VCPMADPersonIdentificationTaskResource_photoLibrary__block_invoke;
  v5[3] = &unk_1E6B16E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__VCPMADPersonIdentificationTaskResource_photoLibrary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadResources");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)purge
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCPMADPersonIdentificationTaskResource_purge__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(queue, block);
}

id __47__VCPMADPersonIdentificationTaskResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = 0;

  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)VCPMADPersonIdentificationTaskResource;
  return objc_msgSendSuper2(&v11, sel_purge);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_personIdentityModel, 0);
  objc_storeStrong((id *)&self->_faceProcessingContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
