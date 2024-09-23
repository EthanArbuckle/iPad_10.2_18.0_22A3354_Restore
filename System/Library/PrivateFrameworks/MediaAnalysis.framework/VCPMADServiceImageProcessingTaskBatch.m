@implementation VCPMADServiceImageProcessingTaskBatch

- (VCPMADServiceImageProcessingTaskBatch)initWithCloudIdentifierRequests:(id)a3 photoLibrary:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6 cancelBlock:(id)a7 andCompletionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  VCPMADServiceImageProcessingTaskBatch *v21;
  VCPMADServiceImageProcessingTaskBatch *v22;
  NSString *signpostPayload;
  id v25;
  objc_super v26;
  _QWORD v27[4];
  id v28;

  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __147__VCPMADServiceImageProcessingTaskBatch_initWithCloudIdentifierRequests_photoLibrary_clientBundleID_clientTeamID_cancelBlock_andCompletionHandler___block_invoke;
  v27[3] = &unk_1E6B15F88;
  v20 = v19;
  v28 = v20;
  v26.receiver = self;
  v26.super_class = (Class)VCPMADServiceImageProcessingTaskBatch;
  v21 = -[VCPMABaseTask initWithCompletionHandler:](&v26, sel_initWithCompletionHandler_, v27);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_requests, a3);
    objc_storeStrong((id *)&v22->_photolibrary, a4);
    objc_storeStrong((id *)&v22->_clientBundleID, a5);
    objc_storeStrong((id *)&v22->_clientTeamID, a6);
    signpostPayload = v22->_signpostPayload;
    v22->_signpostPayload = (NSString *)&stru_1E6B1C190;

    -[VCPMABaseTask setCancelBlock:](v22, "setCancelBlock:", v18, v25);
  }

  return v22;
}

uint64_t __147__VCPMADServiceImageProcessingTaskBatch_initWithCloudIdentifierRequests_photoLibrary_clientBundleID_clientTeamID_cancelBlock_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)taskWithCloudIdentifierRequests:(id)a3 photoLibrary:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6 cancelBlock:(id)a7 andCompletionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCloudIdentifierRequests:photoLibrary:clientBundleID:clientTeamID:cancelBlock:andCompletionHandler:", v13, v14, v15, v16, v17, v18);

  return v19;
}

- (BOOL)cachesResources
{
  return 1;
}

- (id)assetWithIdentifier:(id)a3 isCloudIdentifier:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1BCCA1B2C]();
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPMADServiceImageProcessing] Fetching Photos asset with identifier %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CD1578], "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", self->_photolibrary);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncludeHiddenAssets:", 1);
  objc_msgSend(v10, "setIncludeTrashedAssets:", 1);
  objc_msgSend(v10, "setIncludeGuestAssets:", 1);
  v11 = *MEMORY[0x1E0CD1A00];
  v28[0] = *MEMORY[0x1E0CD1948];
  v28[1] = v11;
  v12 = *MEMORY[0x1E0CD1A90];
  v28[2] = *MEMORY[0x1E0CD1A58];
  v28[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFetchPropertySets:", v13);

  v14 = (void *)MEMORY[0x1E0CD1398];
  if (v6)
  {
    v27 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchAssetsWithCloudIdentifiers:options:", v15, v10);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchAssetsWithLocalIdentifiers:options:", v15, v10);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;

  if (objc_msgSend(v17, "count"))
  {
    if ((unint64_t)objc_msgSend(v17, "count") >= 2
      && (int)MediaAnalysisLogLevel() >= 4
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPMADServiceImageProcessing] Fetch returned multiple assets for identifier (%@)", buf, 0xCu);
    }
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPMADServiceImageProcessing] Specified identifier not found (%@)"), v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *a5;
    *a5 = v21;

    a5 = 0;
  }

  objc_autoreleasePoolPop(v9);
  return a5;
}

- (BOOL)run:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSString *signpostPayload;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  objc_class *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSString *v33;
  BOOL v34;
  os_signpost_id_t spid;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];
  int v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  void *v56;
  uint8_t v57[128];
  uint8_t buf[4];
  _BYTE v59[14];
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v59 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageProcessingTaskBatch_Run", "%@", buf, 0xCu);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[NSDictionary allKeys](self->_requests, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v8)
  {
    v43 = 0;
    v41 = *(_QWORD *)v52;
    v9 = MEMORY[0x1E0C81028];
    v37 = *MEMORY[0x1E0CB2F90];
    v38 = *MEMORY[0x1E0CB2D50];
    while (2)
    {
      v10 = 0;
      v42 = v8;
      do
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1BCCA1B2C]();
        v50 = 0;
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          v43 = (v43 + 1);
          *(_DWORD *)v59 = v43;
          *(_WORD *)&v59[4] = 2112;
          *(_QWORD *)&v59[6] = v11;
          _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_DEBUG, "[ImageProcessingTask%d] Build task for asset (%@)", buf, 0x12u);
        }
        -[VCPMADServiceImageProcessingTaskBatch assetWithIdentifier:isCloudIdentifier:error:](self, "assetWithIdentifier:isCloudIdentifier:error:", v11, 1, &v50);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          +[VCPMADServiceImageAsset assetWithPhotosAsset:clientBundleID:clientTeamID:](VCPMADServiceImageAsset, "assetWithPhotosAsset:clientBundleID:clientTeamID:", v13, self->_clientBundleID, self->_clientTeamID);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPMABaseTask cancelBlock](self, "cancelBlock");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __45__VCPMADServiceImageProcessingTaskBatch_run___block_invoke;
          v44[3] = &unk_1E6B178E8;
          v45 = v43;
          v44[4] = v11;
          +[VCPMADServiceImageProcessingTask taskWithRequests:forAsset:cancelBlock:andCompletionHandler:](VCPMADServiceImageProcessingTask, "taskWithRequests:forAsset:cancelBlock:andCompletionHandler:", v15, v14, v16, v44);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ImageProcessingTask%d] Identifier %@"), v43, v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setSignpostPayload:", v18);

          v19 = objc_msgSend(v17, "run");
          v20 = v19;
          if (v19)
          {
            if (v19 == -128)
            {
              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
              }
              if (a3)
              {
                v21 = (void *)MEMORY[0x1E0CB35C8];
                v55 = v38;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request was canceled"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = v22;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "errorWithDomain:code:userInfo:", v37, -128, v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = *a3;
                *a3 = v24;

              }
              v20 = 1;
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              {
                v29 = (objc_class *)objc_opt_class();
                NSStringFromClass(v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v59 = v30;
                *(_WORD *)&v59[8] = 1024;
                *(_DWORD *)&v59[10] = v20;
                _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_DEFAULT, "%@ returned unexpected status (%d)", buf, 0x12u);

              }
              v20 = 0;
            }
          }

        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v59 = v43;
            *(_WORD *)&v59[4] = 2112;
            *(_QWORD *)&v59[6] = v11;
            v60 = 2112;
            v61 = v50;
            _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_ERROR, "[ImageProcessingTask%d] Failed to fetch asset (%@) - %@", buf, 0x1Cu);
          }
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          -[NSDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v47 != v27)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "setError:", v50);
              }
              v26 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
            }
            while (v26);
          }
          v20 = 3;
        }

        objc_autoreleasePoolPop(v12);
        if (v20 != 3 && v20)
        {
          v34 = 0;
          goto LABEL_46;
        }
        ++v10;
      }
      while (v10 != v42);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      if (v8)
        continue;
      break;
    }
  }

  VCPSignPostLog();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v31))
  {
    v33 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v59 = v33;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageProcessingTaskBatch_Run", "%@", buf, 0xCu);
  }

  -[VCPMABaseTask completionHandler](self, "completionHandler");
  obj = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))obj + 2))(obj, 0, 0);
  v34 = 1;
LABEL_46:

  return v34;
}

void __45__VCPMADServiceImageProcessingTaskBatch_run___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_DWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 32);
      v12 = 67109634;
      v13 = v4;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v3;
      v6 = MEMORY[0x1E0C81028];
      v7 = "[ImageProcessingTask%d] Failed to process asset (%@) - %@";
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 28;
LABEL_8:
      _os_log_impl(&dword_1B6C4A000, v6, v8, v7, (uint8_t *)&v12, v9);
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_DWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 67109378;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[ImageProcessingTask%d] Finished processing asset (%@)";
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 18;
    goto LABEL_8;
  }

}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
  objc_storeStrong((id *)&self->_signpostPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_photolibrary, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
