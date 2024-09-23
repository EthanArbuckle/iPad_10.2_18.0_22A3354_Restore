@implementation PHAssetCreationRequestBridge

- (id)executeCreationRequestWithBatchJobDictionaries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  const char *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id obj;
  _QWORD v34[4];
  id v35;
  uint8_t *v36;
  uint64_t *v37;
  uint8_t v38[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;
  _QWORD v52[4];

  v52[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    *(_QWORD *)v38 = 0;
    v39 = v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__14626;
    v42 = __Block_byref_object_dispose__14627;
    v43 = 0;
    +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D08]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PLPhotoKitIngestGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: Beginning burst image creation requests with camera avalanche UUID: %{public}@", buf, 0xCu);
    }

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __79__PHAssetCreationRequestBridge_executeCreationRequestWithBatchJobDictionaries___block_invoke;
    v34[3] = &unk_1E35DF160;
    v9 = v4;
    v35 = v9;
    v36 = v38;
    v37 = &v44;
    v10 = (id *)(v39 + 40);
    obj = (id)*((_QWORD *)v39 + 5);
    v11 = objc_msgSend(v5, "performChangesAndWait:error:", v34, &obj);
    objc_storeStrong(v10, obj);
    if (*((_BYTE *)v45 + 24))
      v12 = v11;
    else
      v12 = 0;
    v13 = (void *)MEMORY[0x1E0D732B8];
    if (v12 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "successWithResult:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", *((_QWORD *)v39 + 5));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v15, "isSuccess"))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v22 = v9;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v48, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v30 != v24)
              objc_enumerationMutation(v22);
            -[PHAssetCreationRequestBridge _deleteImageJobFilesWithJobDictionary:](self, "_deleteImageJobFilesWithJobDictionary:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), (_QWORD)v29);
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v48, 16);
        }
        while (v23);
      }

      PLPhotoKitIngestGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_DWORD *)buf = 138543362;
      v50 = v7;
      v27 = "PhotoKit Ingest Bridge: Successfully completed burst job with camera avalanche UUID: %{public}@";
    }
    else
    {
      PLPhotoKitIngestGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        v19 = v15;
        _Block_object_dispose(v38, 8);

        _Block_object_dispose(&v44, 8);
        v21 = v19;
        goto LABEL_27;
      }
      *(_DWORD *)buf = 138543362;
      v50 = v7;
      v27 = "PhotoKit Ingest Bridge: Failed to complete burst job with camera avalanche UUID: %{public}@";
    }
    _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
    goto LABEL_26;
  }
  PLPhotoKitIngestGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: No incoming jobs present.", v38, 2u);
  }

  v17 = (void *)MEMORY[0x1E0D732B8];
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v51 = *MEMORY[0x1E0CB2938];
  v52[0] = CFSTR("The batch of job dictionaries for a burst job must contain job dictionaries");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41005, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "failureWithError:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
  return v21;
}

- (id)executeCreationRequestWithJobDict:(id)a3 previewImageSurface:(__IOSurface *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v43;
  int v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint8_t buf[4];
  const __CFString *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D74D38];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74CD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      PLPhotoKitIngestGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v59 = v38;
        _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: Asset UUID(s) for job %{public}@ nil.", buf, 0xCu);

      }
      v39 = (void *)MEMORY[0x1E0D732B8];
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0D74498];
      v66 = *MEMORY[0x1E0CB2938];
      v67[0] = CFSTR("The asset UUID(s) for job dictionaries cannot be nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 41005, v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "failureWithError:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
  }
  v10 = *MEMORY[0x1E0D74DB8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D74E20]))
  {

LABEL_7:
    v55 = 0;
    v14 = -[PHAssetCreationRequestBridge _executeCreationRequestWithVideoJobDict:error:](self, "_executeCreationRequestWithVideoJobDict:error:", v6, &v55);
    v15 = v55;
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E18]);

  if (v13)
    goto LABEL_7;
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0D74E00]);

  if (v36)
  {
    v54 = 0;
    v14 = -[PHAssetCreationRequestBridge _executeCreationRequestWithImageJobDict:error:](self, "_executeCreationRequestWithImageJobDict:error:", v6, &v54);
    v15 = v54;
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0D74DC8]);

  if ((v44 & 1) != 0)
  {
    if (!-[PHAssetCreationRequestBridge _finalizeBurstImage:](self, "_finalizeBurstImage:", v6))
    {
LABEL_16:
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0D74498];
      v64 = *MEMORY[0x1E0CB2938];
      v65 = CFSTR("Failure during creation of the asset.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 41005, v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
LABEL_37:
    v17 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D74E28]);

  if (!v46)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not start processing the asset with job dictionary: %@"), v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0D732B8];
    v49 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0D74498];
    v56 = *MEMORY[0x1E0CB2938];
    v57 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, 41005, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "failureWithError:", v52);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  if (PLIsCamera())
  {
    PLGatekeeperXPCGetLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v47, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: Skipping Camera preview image job due to duplicate job from nebulad", buf, 2u);
    }

    goto LABEL_37;
  }
  v53 = 0;
  v14 = -[PHAssetCreationRequestBridge _handleVideoPreviewImageOnlyJob:previewImageSurface:error:](self, "_handleVideoPreviewImageOnlyJob:previewImageSurface:error:", v6, a4, &v53);
  v15 = v53;
LABEL_8:
  v16 = v15;
  v17 = v16;
  if (v14)
  {
LABEL_9:
    PLPhotoKitIngestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("captureLogID"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (const __CFString *)v19;
      else
        v21 = CFSTR("(unkown capture ID)");
      objc_msgSend(v6, "objectForKeyedSubscript:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v21;
      v60 = 2114;
      v61 = v22;
      v62 = 2114;
      v63 = v23;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: %{public}@ Successfully completed %{public}@ with UUID: %{public}@", buf, 0x20u);

    }
    v24 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "successWithResult:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_27:
    v34 = (void *)v26;

    goto LABEL_28;
  }
  if (!v16)
    goto LABEL_16;
LABEL_17:
  PLPhotoKitIngestGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("captureLogID"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    v33 = CFSTR("(unkown capture ID)");
    *(_DWORD *)buf = 138543874;
    if (v31)
      v33 = (const __CFString *)v31;
    v59 = v33;
    v60 = 2112;
    v61 = v6;
    v62 = 2112;
    v63 = v17;
    _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: %{public}@  Failed to create asset with job dictionary %@ \nError: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v17);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v34;
}

- (BOOL)_executeCreationRequestWithImageJobDict:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id obj;
  _QWORD v22[4];
  id v23;
  _BYTE *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t v30[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLPhotoKitIngestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("captureLogID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: %{public}@ Beginning image job dictionary request creation for asset with UUID: %{public}@", buf, 0x16u);

  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v39 = __Block_byref_object_copy__14626;
  v40 = __Block_byref_object_dispose__14627;
  v41 = 0;
  +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__PHAssetCreationRequestBridge__executeCreationRequestWithImageJobDict_error___block_invoke;
  v22[3] = &unk_1E35DF160;
  v11 = v6;
  v23 = v11;
  v24 = buf;
  v25 = &v26;
  v12 = *(_QWORD *)&buf[8];
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  v13 = objc_msgSend(v10, "performChangesAndWait:error:", v22, &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13 && *((_BYTE *)v27 + 24))
  {
    -[PHAssetCreationRequestBridge _deleteImageJobFilesWithJobDictionary:](self, "_deleteImageJobFilesWithJobDictionary:", v11);
    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v15 = 1;
  }
  else
  {
    PLPhotoKitIngestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("captureLogID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *((unsigned __int8 *)v27 + 24);
      *(_DWORD *)v30 = 138544130;
      v31 = v17;
      v32 = 2114;
      v33 = v18;
      v34 = 1024;
      v35 = v13;
      v36 = 1024;
      v37 = v19;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: %{public}@ Failed to perform performChangesAndWait block on image creation request for asset %{public}@ with success performing changes: %d and success creating request: %d", v30, 0x22u);

    }
    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
    if (a4)
    {
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a4 = v14;
    }
    else
    {
      v15 = 0;
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (BOOL)_executeCreationRequestWithVideoJobDict:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  id obj;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t v36[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLPhotoKitIngestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("captureLogID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: %{public}@ Beginning video job dictionary request creation for asset with UUID: %{public}@", buf, 0x16u);

  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__14626;
  v46 = __Block_byref_object_dispose__14627;
  v47 = 0;
  +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78__PHAssetCreationRequestBridge__executeCreationRequestWithVideoJobDict_error___block_invoke;
  v28[3] = &unk_1E35DF160;
  v11 = v6;
  v29 = v11;
  v30 = buf;
  v31 = &v32;
  v12 = *(_QWORD *)&buf[8];
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  v13 = objc_msgSend(v10, "performChangesAndWait:error:", v28, &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13 && *((_BYTE *)v33 + 24))
  {
    v14 = *MEMORY[0x1E0D74F40];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D74F40]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v15, v11);

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E80]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v16, v11);

    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D74CF8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAssetCreationRequestBridge buildAdjustmentsPlistPathForPhotoKitIngestJob:withSourcePath:](PHAssetCreationRequestBridge, "buildAdjustmentsPlistPathForPhotoKitIngestJob:withSourcePath:", v11, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v19, v11);

    }
    v20 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v21 = 1;
  }
  else
  {
    PLPhotoKitIngestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("captureLogID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *((unsigned __int8 *)v33 + 24);
      *(_DWORD *)v36 = 138544130;
      v37 = v23;
      v38 = 2112;
      v39 = v24;
      v40 = 1024;
      v41 = v13;
      v42 = 1024;
      v43 = v25;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: %{public}@ Failed to perform performChangesAndWait block on video creation request for asset %@ with success performing changes: %d and success creating request: %d", v36, 0x22u);

    }
    v20 = *(id *)(*(_QWORD *)&buf[8] + 40);
    if (a4)
    {
      v20 = objc_retainAutorelease(v20);
      v21 = 0;
      *a4 = v20;
    }
    else
    {
      v21 = 0;
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v32, 8);

  return v21;
}

- (BOOL)_handleVideoPreviewImageOnlyJob:(id)a3 previewImageSurface:(__IOSurface *)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  int v18;
  id obj;
  _QWORD v21[4];
  id v22;
  __int128 *p_buf;
  uint64_t *v24;
  __IOSurface *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t v30[4];
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  PLPhotoKitIngestGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "PhotoKit Ingest Bridge: Beginning timelapse video placeholder job dictionary request creation for asset with UUID: %@", (uint8_t *)&buf, 0xCu);

  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__14626;
  v39 = __Block_byref_object_dispose__14627;
  v40 = 0;
  +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__PHAssetCreationRequestBridge__handleVideoPreviewImageOnlyJob_previewImageSurface_error___block_invoke;
  v21[3] = &unk_1E35D9AF0;
  v11 = v7;
  v22 = v11;
  p_buf = &buf;
  v24 = &v26;
  v25 = a4;
  v12 = *((_QWORD *)&buf + 1);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v13 = objc_msgSend(v10, "performChangesAndWait:error:", v21, &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13 && *((_BYTE *)v27 + 24))
  {
    v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v15 = 1;
  }
  else
  {
    PLPhotoKitIngestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *((unsigned __int8 *)v27 + 24);
      *(_DWORD *)v30 = 138412802;
      v31 = v17;
      v32 = 1024;
      v33 = v13;
      v34 = 1024;
      v35 = v18;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: Failed to perform performChangesAndWait block on previewImage creation request for asset %@ with success performing changes: %d and success creating request: %d", v30, 0x18u);

    }
    v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    if (a5)
    {
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a5 = v14;
    }
    else
    {
      v15 = 0;
    }
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (BOOL)_finalizeBurstImage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PHAssetCreationRequestBridge__finalizeBurstImage___block_invoke;
  v9[3] = &unk_1E35DEE50;
  v5 = v3;
  v10 = v5;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v6, "performTransactionAndWait:", v9);
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)_deleteImageJobFilesWithJobDictionary:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = *MEMORY[0x1E0D74EC0];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D74EC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v5, v13);

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v6, v13);

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v7, v13);

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E80]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v8, v13);

  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D74CF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCreationRequestBridge buildAdjustmentsPlistPathForPhotoKitIngestJob:withSourcePath:](PHAssetCreationRequestBridge, "buildAdjustmentsPlistPathForPhotoKitIngestJob:withSourcePath:", v13, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v11, v13);

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E78]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationRequestBridge _deleteJobFileAtPath:withJobDict:](self, "_deleteJobFileAtPath:withJobDict:", v12, v13);

}

- (void)_deleteJobFileAtPath:(id)a3 withJobDict:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v13 = 0;
    v9 = objc_msgSend(v7, "removeItemAtPath:error:", v5, &v13);
    v10 = v13;
    if ((v9 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      PLPhotoKitIngestGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v15 = v5;
        v16 = 2112;
        v17 = v12;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: Failed to remove file at path: %@, for UUID:%@ %@", buf, 0x20u);

      }
    }
  }
  else
  {
    v10 = 0;
  }

}

void __52__PHAssetCreationRequestBridge__finalizeBurstImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D60]);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CD0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CE0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    v5 = (void *)MEMORY[0x1E0D715B8];
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetsWithAvalancheUUID:inManagedObjectContext:", v22, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71880], "assetsWithUUIDs:options:inLibrary:", v3, 3, *(_QWORD *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v4, *(_QWORD *)(a1 + 40));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D715B8];
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = 1;
    v10 = (id)objc_msgSend(v7, "updatePropertiesForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:setFirstPick:allowDissolve:", v8, v9, v19, 0, 0, 1, v18);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D715B8]), "initWithUUID:photoLibrary:", v22, *(_QWORD *)(a1 + 40));
    objc_msgSend(v11, "stackAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generateLargeThumbnailFileIfNecessary");

    v13 = (void *)MEMORY[0x1E0D715B8];
    objc_msgSend(v11, "assets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "autoPicks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stackAsset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userFavorites");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateMembershipForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:allowDissolve:inLibrary:", v14, v15, v16, v17, 0, 1, *(_QWORD *)(a1 + 40));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __90__PHAssetCreationRequestBridge__handleVideoPreviewImageOnlyJob_previewImageSurface_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[PHAssetCreationRequest creationRequestForAssetFromVideoPreviewJobDict:withPreviewImageSurface:](PHAssetCreationRequest, "creationRequestForAssetFromVideoPreviewJobDict:withPreviewImageSurface:", a1[4], a1[7]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0D74498];
    v9 = *MEMORY[0x1E0CB2938];
    v10[0] = CFSTR("Timelapse preview job creation request returned nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 41005, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __78__PHAssetCreationRequestBridge__executeCreationRequestWithVideoJobDict_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[PHAssetCreationRequest creationRequestForAssetFromVideoJobDictionary:](PHAssetCreationRequest, "creationRequestForAssetFromVideoJobDictionary:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0D74498];
    v9 = *MEMORY[0x1E0CB2938];
    v10[0] = CFSTR("Video job creation request returned nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 41005, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __78__PHAssetCreationRequestBridge__executeCreationRequestWithImageJobDict_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[PHAssetCreationRequest creationRequestForAssetFromImageJobDictionary:holdingDirectoryPath:](PHAssetCreationRequest, "creationRequestForAssetFromImageJobDictionary:holdingDirectoryPath:", a1[4], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0D74498];
    v9 = *MEMORY[0x1E0CB2938];
    v10[0] = CFSTR("Image job creation request returned nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 41005, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __79__PHAssetCreationRequestBridge_executeCreationRequestWithBatchJobDictionaries___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v23;
    v21 = *MEMORY[0x1E0D74498];
    v20 = *MEMORY[0x1E0CB2938];
    *(_QWORD *)&v4 = 138543618;
    v19 = v4;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        +[PHAssetCreationRequest creationRequestForAssetFromImageJobDictionary:holdingDirectoryPath:](PHAssetCreationRequest, "creationRequestForAssetFromImageJobDictionary:holdingDirectoryPath:", v10, 0, v19);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        }
        else
        {
          v11 = (void *)MEMORY[0x1E0CB35C8];
          v30 = v20;
          v31 = CFSTR("Image job creation request returned nil");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "errorWithDomain:code:userInfo:", v21, 41005, v12);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v15 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v13;

          PLPhotoKitIngestGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("captureLogID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            *(_DWORD *)buf = v19;
            v27 = v17;
            v28 = 2112;
            v29 = v18;
            _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "PhotoKit Ingest Bridge: %{public}@ Burst creation request failed with error: %@", buf, 0x16u);

          }
        }
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v5);

  }
}

+ (id)buildAdjustmentsPlistPathForPhotoKitIngestJob:(id)a3 withSourcePath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR(".%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("file://"), &stru_1E35DFFF8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1E35DFFF8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_Adjustments.plist"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
