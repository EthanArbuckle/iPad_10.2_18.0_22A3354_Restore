@implementation MADTextEmbeddingResource

- (MADTextEmbeddingResource)init
{
  MADTextEmbeddingResource *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingResource;
  v2 = -[MADTextEmbeddingResource init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MADTextEmbeddingResource", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

+ (id)sharedResource:(unint64_t)a3
{
  __objc2_class *v3;
  int v4;
  id result;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1uLL:
      v3 = MADTextEmbeddingMD1Resource;
      goto LABEL_11;
    case 2uLL:
      v3 = MADTextEmbeddingMD2Resource;
      goto LABEL_11;
    case 3uLL:
      v3 = MADTextEmbeddingMD3Resource;
      goto LABEL_11;
    case 4uLL:
      v3 = MADTextEmbeddingMD4Resource;
      goto LABEL_11;
    case 5uLL:
      v3 = MADTextEmbeddingMD5Resource;
LABEL_11:
      -[__objc2_class sharedResource](v3, "sharedResource");
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = a3;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported text encoder version (%d) requested", (uint8_t *)v6, 8u);
      }
      result = 0;
      break;
  }
  return result;
}

- (int64_t)activeCost
{
  if (DeviceHasANE())
    return 10;
  else
    return 100;
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE())
    return 5;
  else
    return 100;
}

- (unint64_t)version
{
  return 0;
}

+ (int64_t)revision
{
  return 0;
}

- (CSUTextEncoder)textEncoder
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MADTextEmbeddingResource_textEncoder__block_invoke;
  v5[3] = &unk_1E6B15418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CSUTextEncoder *)v3;
}

void __39__MADTextEmbeddingResource_textEncoder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0D18910], "createForRevision:error:", objc_msgSend((id)objc_opt_class(), "revision"), &v15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v15;
    if (v3)
    {
      VCPSignPostLog();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_generate(v5);

      VCPSignPostLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CSUTextEncoder_init", ", buf, 2u);
      }

      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18908]), "initWithConfiguration:", v3);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 16);
      *(_QWORD *)(v10 + 16) = v9;

      VCPSignPostLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v6, "CSUTextEncoder_init", ", buf, 2u);
      }

      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
        && (int)MediaAnalysisLogLevel() >= 3
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create text encoder", buf, 2u);
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create text encoder configuration (%@)", buf, 0xCu);

    }
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (VUWGallery)entityGallery
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MADTextEmbeddingResource_entityGallery__block_invoke;
  v5[3] = &unk_1E6B15418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (VUWGallery *)v3;
}

void __41__MADTextEmbeddingResource_entityGallery__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
LABEL_14:
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = v2;
    v3 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v20;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vcp_visionCacheStorageDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("VUIndex.sqlite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    VCPSignPostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);

    VCPSignPostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VUWGallery_initWithPath", ", buf, 2u);
    }

    v24 = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC73D8]), "initWithPath:error:", v5, &v24);
    v11 = v24;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v10;

    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_END, v7, "VUWGallery_initWithPath", ", buf, 2u);
    }

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@ (%@)", buf, 0x16u);

    }
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoLibraryURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v22;
    v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@: no VUIndex URL for library %@", buf, 0x16u);

  }
LABEL_15:

}

- (MADTextEmbeddingThreshold)calibration
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MADTextEmbeddingResource_calibration__block_invoke;
  v5[3] = &unk_1E6B15418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MADTextEmbeddingThreshold *)v3;
}

void __39__MADTextEmbeddingResource_calibration__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = objc_msgSend(*(id *)(a1 + 32), "version");
      v12[0] = 67109120;
      v12[1] = v2;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Creating calibration model (MD%d)", (uint8_t *)v12, 8u);
    }
    VCPSignPostLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    VCPSignPostLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v12[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADTextEmbeddingThreshold_create", ", (uint8_t *)v12, 2u);
    }

    +[MADTextEmbeddingThreshold createForEmbeddingVersion:](MADTextEmbeddingThreshold, "createForEmbeddingVersion:", objc_msgSend(*(id *)(a1 + 32), "version"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

    VCPSignPostLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v12[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_END, v4, "MADTextEmbeddingThreshold_create", ", (uint8_t *)v12, 2u);
    }

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create embedding calibration", (uint8_t *)v12, 2u);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (unint64_t)calibrationVersion
{
  return 0;
}

- (int64_t)tokenEmbeddingType
{
  return 2;
}

- (void)purge
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MADTextEmbeddingResource_purge__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __33__MADTextEmbeddingResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibration, 0);
  objc_storeStrong((id *)&self->_entityGallery, 0);
  objc_storeStrong((id *)&self->_textEncoder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
