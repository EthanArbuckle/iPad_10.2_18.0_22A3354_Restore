@implementation VCPParallaxAnalyzer

- (VCPParallaxAnalyzer)initWithOptions:(id)a3 andExistingResults:(id)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CGRect *v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  CGRect *v27;
  uint64_t v28;
  void *v29;
  NSString *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  uint64_t v36;
  NSDictionary *options;
  VCPParallaxAnalyzer *v38;
  id v40;
  void *v41;
  id v42;
  VCPParallaxAnalyzer *v43;
  _QWORD v44[4];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  NSRect v58;
  CGRect v59;
  NSRect v60;
  CGRect v61;

  v57 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v42 = a4;
  v54.receiver = self;
  v54.super_class = (Class)VCPParallaxAnalyzer;
  v43 = -[VCPParallaxAnalyzer init](&v54, sel_init);
  if (v43)
  {
    v41 = (void *)objc_msgSend(v40, "mutableCopy");
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("PetsResults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("PetsResults"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v51;
        v12 = (CGRect *)MEMORY[0x1E0C9D648];
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v51 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v13), "objectForKeyedSubscript:", CFSTR("attributes"), v40);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("petsBounds"));
            v15 = (NSString *)objc_claimAutoreleasedReturnValue();
            v58 = NSRectFromString(v15);
            x = v58.origin.x;
            y = v58.origin.y;
            width = v58.size.width;
            height = v58.size.height;

            v59.origin.x = x;
            v59.origin.y = y;
            v59.size.width = width;
            v59.size.height = height;
            if (!CGRectEqualToRect(v59, *v12))
            {
              *(CGFloat *)v49 = x;
              *(CGFloat *)&v49[1] = y;
              *(CGFloat *)&v49[2] = width;
              *(CGFloat *)&v49[3] = height;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v49, "{CGRect={CGPoint=dd}{CGSize=dd}}");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v20);

            }
            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v10);
      }

      if (objc_msgSend(v8, "count"))
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v8, CFSTR("PetsRegions"));

    }
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("PetsFaceResults"), v40);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("PetsFaceResults"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v46;
        v27 = (CGRect *)MEMORY[0x1E0C9D648];
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v46 != v26)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v28), "objectForKeyedSubscript:", CFSTR("attributes"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("petsBounds"));
            v30 = (NSString *)objc_claimAutoreleasedReturnValue();
            v60 = NSRectFromString(v30);
            v31 = v60.origin.x;
            v32 = v60.origin.y;
            v33 = v60.size.width;
            v34 = v60.size.height;

            v61.origin.x = v31;
            v61.origin.y = v32;
            v61.size.width = v33;
            v61.size.height = v34;
            if (!CGRectEqualToRect(v61, *v27))
            {
              *(CGFloat *)v44 = v31;
              *(CGFloat *)&v44[1] = v32;
              *(CGFloat *)&v44[2] = v33;
              *(CGFloat *)&v44[3] = v34;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v44, "{CGRect={CGPoint=dd}{CGSize=dd}}");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v35);

            }
            ++v28;
          }
          while (v25 != v28);
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v25);
      }

      if (objc_msgSend(v23, "count"))
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v23, CFSTR("PetsFaceRegions"));

    }
    if (objc_msgSend(v41, "count"))
    {
      v36 = objc_msgSend(v41, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v36 = objc_claimAutoreleasedReturnValue();
    }
    options = v43->_options;
    v43->_options = (NSDictionary *)v36;

    v38 = v43;
  }

  return v43;
}

- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5
{
  id v8;
  unsigned int (**v9)(_QWORD);
  unsigned int (**v10)(_QWORD);
  int v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (unsigned int (**)(_QWORD))a4;
  v10 = v9;
  if (!v9 || (((uint64_t (*)(id))v9[2])(v9) & 1) == 0)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__53;
    v38 = __Block_byref_object_dispose__53;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__53;
    v32 = __Block_byref_object_dispose__53;
    v33 = 0;
    v12 = dispatch_semaphore_create(0);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __51__VCPParallaxAnalyzer_analyzeAsset_cancel_results___block_invoke;
    v24 = &unk_1E6B1AEB0;
    v26 = &v28;
    v27 = &v34;
    v13 = v12;
    v25 = v13;
    v14 = _Block_copy(&v21);
    v15 = objc_alloc(MEMORY[0x1E0CD1810]);
    v16 = (void *)objc_msgSend(v15, "initWithPhotoAsset:", v8, v21, v22, v23, v24);
    objc_msgSend(getPISegmentationClass(), "computeSegmentationScoresForAsset:options:completion:", v16, self->_options, v14);
    while (1)
    {
      v17 = dispatch_time(0, 100000000);
      if (!dispatch_semaphore_wait(v13, v17))
        break;
      if (v10 && v10[2](v10))
      {
        objc_msgSend(getPISegmentationClass(), "cancelSegmentationForAsset:", v16);
        v11 = -128;
        goto LABEL_19;
      }
    }
    if (v29[5])
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v29[5], "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v18;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error running computeSegmentationScoresForAsset: %@", buf, 0xCu);

      }
    }
    else
    {
      if (objc_msgSend((id)v35[5], "count"))
      {
        v40 = v35[5];
        v41 = CFSTR("ParallaxResults");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
LABEL_19:

        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(&v34, 8);

        goto LABEL_20;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No parallax results returned", buf, 2u);
      }
    }
    v11 = -18;
    goto LABEL_19;
  }
  v11 = -128;
LABEL_20:

  return v11;
}

void __51__VCPParallaxAnalyzer_analyzeAsset_cancel_results___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (int)exportWallpaperForAsset:(id)a3 cancel:(id)a4 results:(id *)a5
{
  unsigned int (**v8)(_QWORD);
  unsigned int (**v9)(_QWORD);
  int v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  void *v26;
  void *v27;
  void *v28;
  id *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD aBlock[4];
  NSObject *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v8 = (unsigned int (**)(_QWORD))a4;
  v9 = v8;
  if (!v8 || (((uint64_t (*)(id))v8[2])(v8) & 1) == 0)
  {
    v30 = a5;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__53;
    v42 = __Block_byref_object_dispose__53;
    v43 = 0;
    v11 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__VCPParallaxAnalyzer_exportWallpaperForAsset_cancel_results___block_invoke;
    aBlock[3] = &unk_1E6B1AED8;
    v37 = &v38;
    v12 = v11;
    v36 = v12;
    v31 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "fileExistsAtPath:", CFSTR("/tmp/com.apple.mediaanalysisd/")) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      v34 = 0;
      v15 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/tmp/com.apple.mediaanalysisd/"), 1, 0, &v34);
      v14 = v34;
      if ((v15 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "description");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v26;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create resource file cache directory (%@)", buf, 0xCu);

        }
        v10 = -18;
LABEL_29:

        _Block_object_dispose(&v38, 8);
        goto LABEL_30;
      }
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@wp-%@"), CFSTR("/tmp/com.apple.mediaanalysisd/"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v19, 1);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v33);
    v22 = v33;

    if (v22)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)v39[5];
        *(_DWORD *)buf = 138412290;
        v48 = v23;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create directory for wallpaper export: %@", buf, 0xCu);
      }
      v10 = -36;
    }
    else
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1810]), "initWithPhotoAsset:", v32);
      objc_msgSend(getPISegmentationClass(), "exportWallpaperForAsset:toURL:options:completion:", v24, v20, self->_options, v31);
      while (1)
      {
        v25 = dispatch_time(0, 100000000);
        if (!dispatch_semaphore_wait(v12, v25))
          break;
        if (v9 && v9[2](v9))
        {
          objc_msgSend(getPISegmentationClass(), "cancelSegmentationForAsset:", v24);
          v10 = -128;
          goto LABEL_27;
        }
      }
      if (v39[5])
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)v39[5], "description");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v27;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error running exportWallpaperForAsset: %@", buf, 0xCu);

        }
        v10 = -18;
      }
      else
      {
        v45 = CFSTR("WallpaperExportResults");
        v44 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        *v30 = (id)objc_claimAutoreleasedReturnValue();

        v10 = 0;
      }
LABEL_27:

    }
    goto LABEL_29;
  }
  v10 = -128;
LABEL_30:

  return v10;
}

void __62__VCPParallaxAnalyzer_exportWallpaperForAsset_cancel_results___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (int)upgradeWallPaperAtURL:(id)a3 toURL:(id)a4 cancel:(id)a5 results:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  SEL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  _QWORD aBlock[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  id v42;
  id v43;
  const __CFString *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v42 = a4;
  v10 = a5;
  v11 = v10;
  if (a6)
  {
    if (v10 && ((*((uint64_t (**)(id))v10 + 2))(v10) & 1) != 0)
    {
      v12 = -128;
    }
    else
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__53;
      v40 = __Block_byref_object_dispose__53;
      v41 = 0;
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__53;
      v34 = __Block_byref_object_dispose__53;
      v35 = 0;
      v13 = dispatch_semaphore_create(0);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__VCPParallaxAnalyzer_upgradeWallPaperAtURL_toURL_cancel_results___block_invoke;
      aBlock[3] = &unk_1E6B1AF00;
      v27 = &v36;
      v28 = &v30;
      v14 = v13;
      v26 = v14;
      v29 = _Block_copy(aBlock);
      v15 = NSSelectorFromString(CFSTR("upgradeWallpaperAtURL:exportToURL:options:completion:"));
      getPISegmentationClass();
      objc_opt_class();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(getPISegmentationClass(), "methodSignatureForSelector:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        getPISegmentationClass();
        objc_msgSend(v17, "setTarget:", objc_opt_class());
        objc_msgSend(v17, "setSelector:", v15);
        objc_msgSend(v17, "setArgument:atIndex:", &v43, 2);
        objc_msgSend(v17, "setArgument:atIndex:", &v42, 3);
        objc_msgSend(v17, "setArgument:atIndex:", &self->_options, 4);
        objc_msgSend(v17, "setArgument:atIndex:", &v29, 5);
        objc_msgSend(v17, "invoke");
        dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        if (v31[5])
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)v31[5], "description");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v18;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error running upgradeWallpaperAtURL: %@", buf, 0xCu);

          }
          v12 = -18;
        }
        else
        {
          v19 = v37[5];
          v24 = 0;
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v24;
          if (v21 || !v20)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "description");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v47 = v22;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error running encoding PosterEditConfiguration: %@", buf, 0xCu);

            }
            v12 = -18;
          }
          else
          {
            v44 = CFSTR("WallpaperPosterConfigDataResults");
            v45 = v20;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v12 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PISegmentation SPI not available", buf, 2u);
        }
        v12 = -18;
      }

      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(&v36, 8);

    }
  }
  else
  {
    v12 = -18;
  }

  return v12;
}

void __66__VCPParallaxAnalyzer_upgradeWallPaperAtURL_toURL_cancel_results___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
