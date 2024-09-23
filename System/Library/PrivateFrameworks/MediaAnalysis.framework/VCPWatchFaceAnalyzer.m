@implementation VCPWatchFaceAnalyzer

- (VCPWatchFaceAnalyzer)initWithOptions:(id)a3
{
  id v5;
  VCPWatchFaceAnalyzer *v6;
  VCPWatchFaceAnalyzer *v7;
  VCPWatchFaceAnalyzer *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPWatchFaceAnalyzer;
  v6 = -[VCPWatchFaceAnalyzer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v8 = v7;
  }

  return v7;
}

- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5
{
  id v8;
  unsigned int (**v9)(_QWORD);
  unsigned int (**v10)(_QWORD);
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSDictionary *options;
  NSObject *v21;
  id v22;
  id v23;
  NSDictionary *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  dispatch_time_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  NSObject *v44;
  __int128 *p_buf;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  id v53;
  id v54;
  _QWORD v55[2];
  _QWORD v56[2];
  void *v57;
  const __CFString *v58;
  void *v59;
  __int128 buf;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  __int128 v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (unsigned int (**)(_QWORD))a4;
  v10 = v9;
  if (!v9 || (((uint64_t (*)(id))v9[2])(v9) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "fileExistsAtPath:", CFSTR("/tmp/com.apple.mediaanalysisd/")) & 1) != 0)
    {
      v40 = 0;
    }
    else
    {
      v54 = 0;
      v12 = objc_msgSend(v41, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/tmp/com.apple.mediaanalysisd/"), 1, 0, &v54);
      v40 = v54;
      if ((v12 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v40, "description");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v32;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create resource file cache directory (%@)", (uint8_t *)&buf, 0xCu);

        }
        v11 = -18;
        goto LABEL_39;
      }
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@wf-%@"), CFSTR("/tmp/com.apple.mediaanalysisd/"), v15);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v39, 1);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v42, 1, 0, &v53);
    v17 = v53;

    if (v17)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create directory for watchface export: %@", (uint8_t *)&buf, 0xCu);
      }
      v11 = -36;
      goto LABEL_38;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__52;
    v63 = __Block_byref_object_dispose__52;
    v64 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__52;
    v51 = __Block_byref_object_dispose__52;
    v52 = 0;
    v18 = dispatch_semaphore_create(0);
    v19 = v8;
    options = self->_options;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __52__VCPWatchFaceAnalyzer_analyzeAsset_cancel_results___block_invoke;
    v43[3] = &unk_1E6B1AE70;
    p_buf = &buf;
    v46 = &v47;
    v21 = v18;
    v44 = v21;
    v38 = v19;
    v22 = v19;
    v23 = v42;
    v24 = options;
    v25 = v43;
    *(_QWORD *)&v65 = 0;
    *((_QWORD *)&v65 + 1) = &v65;
    v66 = 0x2020000000;
    v26 = getPFLGeneratePhotosFaceWithOptionsSymbolLoc(void)::ptr;
    v67 = getPFLGeneratePhotosFaceWithOptionsSymbolLoc(void)::ptr;
    if (!getPFLGeneratePhotosFaceWithOptionsSymbolLoc(void)::ptr)
    {
      v27 = (void *)PhotosFaceLayoutLibrary();
      v26 = dlsym(v27, "PFLGeneratePhotosFaceWithOptions");
      *(_QWORD *)(*((_QWORD *)&v65 + 1) + 24) = v26;
      getPFLGeneratePhotosFaceWithOptionsSymbolLoc(void)::ptr = v26;
    }
    _Block_object_dispose(&v65, 8);
    if (!v26)
      goto LABEL_41;
    v8 = v38;
    ((void (*)(id, id, NSDictionary *, _QWORD *))v26)(v22, v23, v24, v25);

    while (1)
    {
      v28 = dispatch_time(0, 100000000);
      if (!dispatch_semaphore_wait(v21, v28))
        break;
      if (v10 && v10[2](v10))
      {
        v29 = v22;
        *(_QWORD *)&v65 = 0;
        *((_QWORD *)&v65 + 1) = &v65;
        v66 = 0x2020000000;
        v30 = getPFLCancelGeneratingPhotosFaceForAssetSymbolLoc(void)::ptr;
        v67 = getPFLCancelGeneratingPhotosFaceForAssetSymbolLoc(void)::ptr;
        if (!getPFLCancelGeneratingPhotosFaceForAssetSymbolLoc(void)::ptr)
        {
          v31 = (void *)PhotosFaceLayoutLibrary();
          v30 = dlsym(v31, "PFLCancelGeneratingPhotosFaceForAsset");
          *(_QWORD *)(*((_QWORD *)&v65 + 1) + 24) = v30;
          getPFLCancelGeneratingPhotosFaceForAssetSymbolLoc(void)::ptr = v30;
        }
        _Block_object_dispose(&v65, 8);
        v8 = v38;
        if (v30)
        {
          ((void (*)(id))v30)(v29);

          v11 = -128;
          goto LABEL_37;
        }
LABEL_41:
        dlerror();
        abort_report_np();
        __break(1u);
      }
    }
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "description");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v65) = 138412290;
        *(_QWORD *)((char *)&v65 + 4) = v33;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error running exportWatchFaceForAsset: %@", (uint8_t *)&v65, 0xCu);

      }
    }
    else
    {
      v34 = v48[5];
      if (v34)
      {
        v58 = CFSTR("WatchFaceResults");
        v55[0] = CFSTR("watchFacePath");
        v55[1] = CFSTR("watchFaceData");
        v56[0] = v39;
        v56[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v35;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
LABEL_37:

        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&buf, 8);

LABEL_38:
LABEL_39:

        goto LABEL_40;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v65) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Nil Photo Data for asset", (uint8_t *)&v65, 2u);
      }
    }
    v11 = -18;
    goto LABEL_37;
  }
  v11 = -128;
LABEL_40:

  return v11;
}

void __52__VCPWatchFaceAnalyzer_analyzeAsset_cancel_results___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
