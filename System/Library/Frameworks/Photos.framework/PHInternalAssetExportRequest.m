@implementation PHInternalAssetExportRequest

- (id)_initWithAsset:(id)a3 variants:(id)a4 resourceRetrievalRequest:(id)a5 retrievalRequestProgressParent:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PHInternalAssetExportRequest *v15;
  PHInternalAssetExportRequest *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *resourceRetrievingQueue;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if (objc_msgSend(v12, "count"))
  {
    if (v13)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variants.count"));

    if (v13)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourceRetrievalRequest"));

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)PHInternalAssetExportRequest;
  v15 = -[PHAssetExportRequest initWithAsset:variants:](&v24, sel_initWithAsset_variants_, v11, v12);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_resourceRetrievalRequest, a5);
    objc_storeStrong((id *)&v16->_resourceRetrievalRequestProgressParent, a6);
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("PHInternalAssetExportRequest.ResourceRetrievingQueue", v17);
    resourceRetrievingQueue = v16->_resourceRetrievingQueue;
    v16->_resourceRetrievingQueue = (OS_dispatch_queue *)v18;

  }
  return v16;
}

- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  PHResourceLocalAvailabilityRequest *resourceRetrievalRequest;
  int64_t v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  int v26;
  __CFString *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  __CFString *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  if (objc_msgSend(v12, "variant") != 1)
  {
    -[PHAssetExportRequest variants](self, "variants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "variant"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(options.variant == PHAssetExportRequestVariantCurrent) || self.variants[@(options.variant)]"));

    }
  }
  v17 = ((unint64_t)a4 | (unint64_t)a5) != 0;
  if (!((unint64_t)a4 | (unint64_t)a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetAvailability || isProcessingRequired"));

  }
  v18 = (id)((unint64_t)a4 | (unint64_t)a6);
  -[PHAssetExportRequest asset](self, "asset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((unint64_t)a4 | (unint64_t)a6)
  {
    resourceRetrievalRequest = self->_resourceRetrievalRequest;
    v33 = 0;
    v22 = _AssetAvailabilityForAssetWithOptions(v19, v12, resourceRetrievalRequest, (uint64_t)&v33);
    v18 = v33;
    v23 = off_1E35D6450[v22];
    *a4 = v22;
    if (!a5)
    {
LABEL_10:
      v24 = CFSTR("[Did not check]");
      goto LABEL_15;
    }
  }
  else
  {
    v23 = CFSTR("[Did not check]");
    if (!a5)
      goto LABEL_10;
  }
  -[PHAssetExportRequest assetMetadata](self, "assetMetadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = PHAssetExportRequestProcessingRequiredForAssetWithOptions(v20, v12, v25);

  v27 = CFSTR("NO");
  if (v26)
    v27 = CFSTR("YES");
  v24 = v27;
  *a5 = v26;
LABEL_15:
  PLPhotoKitGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v35 = v23;
    v36 = 2114;
    v37 = v24;
    v38 = 2112;
    v39 = v20;
    v40 = 2112;
    v41 = v12;
    _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Asset resources availability: %{public}@ Processing is required: %{public}@ for export of asset: %@, options: %@", buf, 0x2Au);
  }

  if (a6)
  {
    if (v17)
    {
      v29 = 0;
    }
    else
    {
      _ResourceInfoToFileURLs(v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30 = objc_retainAutorelease(v29);
    *a6 = v30;

  }
}

- (void)exportWithOptions:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSObject *resourceRetrievingQueue;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  if (objc_msgSend(v7, "variant") != 1)
  {
    -[PHAssetExportRequest variants](self, "variants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "variant"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(options.variant == PHAssetExportRequestVariantCurrent) || self.variants[@(options.variant)]"));

    }
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInternalAssetExportRequest.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PHAssetExportRequest asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoKitGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "mediaType");
    if ((unint64_t)(v16 - 1) > 2)
      v17 = CFSTR("unknown");
    else
      v17 = off_1E35DA708[v16 - 1];
    v18 = v17;
    +[PHAsset descriptionForMediaSubtypes:](PHAsset, "descriptionForMediaSubtypes:", objc_msgSend(v13, "mediaSubtypes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniformTypeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v32 = v13;
    v33 = 2114;
    v34 = v15;
    v35 = 2114;
    v36 = v18;
    v37 = 2114;
    v38 = v19;
    v39 = 2114;
    v40 = v20;
    v41 = 2114;
    v42 = v7;
    _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Will export asset: %@ (%{public}@, %{public}@/%{public}@, %{public}@), options: %{public}@", buf, 0x3Eu);

  }
  resourceRetrievingQueue = self->_resourceRetrievingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PHInternalAssetExportRequest_exportWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E35DF520;
  block[4] = self;
  v28 = v13;
  v29 = v7;
  v30 = v8;
  v22 = v8;
  v23 = v7;
  v24 = v13;
  dispatch_async(resourceRetrievingQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceRetrievingQueue, 0);
  objc_storeStrong((id *)&self->_resourceRetrievalRequestProgressParent, 0);
  objc_storeStrong((id *)&self->_resourceRetrievalRequest, 0);
}

void __68__PHInternalAssetExportRequest_exportWithOptions_completionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "setState:", 1);
  objc_msgSend(a1[4], "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _AssetAvailabilityForAssetWithOptions(a1[5], a1[6], *((void **)a1[4] + 17), 0);
  v5 = a1[5];
  v4 = a1[6];
  objc_msgSend(a1[4], "assetMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PHAssetExportRequestProcessingRequiredForAssetWithOptions(v5, v4, v6);

  v8 = 50;
  if (!v3)
    v8 = 98;
  if (v7)
    v9 = v8;
  else
    v9 = 0;
  objc_msgSend(v2, "setTotalUnitCount:", 100);
  objc_msgSend(v2, "addChild:withPendingUnitCount:", *((_QWORD *)a1[4] + 18), 100 - v9);
  _PHResourceLocalAvailabilityRequestOptionsFromPHAssetExportRequestOptions(a1[6]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoKitGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[5], "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = off_1E35D6450[v3];
    *(_DWORD *)buf = 138543618;
    v30 = v12;
    v31 = 2114;
    v32 = v13;
    _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Resources availability for asset %{public}@: %{public}@", buf, 0x16u);

  }
  if (v3 == 2)
  {
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Waiting for deferred processing of resources of asset %{public}@...", buf, 0xCu);

    }
    v16 = 4;
  }
  else if (v3 == 1)
  {
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v15;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Downloading required for resources of asset %{public}@...", buf, 0xCu);

    }
    v16 = 3;
  }
  else
  {
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Required resources of asset %{public}@ are locally available.", buf, 0xCu);

    }
    v16 = 2;
  }

  objc_msgSend(a1[4], "setState:", v16);
  v19 = a1[4];
  v20 = a1[5];
  v21 = (void *)v19[17];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__PHInternalAssetExportRequest_exportWithOptions_completionHandler___block_invoke_57;
  v23[3] = &unk_1E35D69E0;
  v23[4] = v19;
  v24 = v20;
  v25 = a1[6];
  v26 = v2;
  v28 = v9;
  v27 = a1[7];
  v22 = v2;
  objc_msgSend(v21, "retrieveRequiredResourcesWithOptions:completionHandler:", v10, v23);

}

void __68__PHInternalAssetExportRequest_exportWithOptions_completionHandler___block_invoke_57(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  if (objc_msgSend(v10, "count"))
  {
    _ResourceInfoToFileURLs(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "handleResultWithFileURLs:cancelled:withError:forAsset:withOptions:progress:processingUnitCount:completionHandler:", v9, a3, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

+ (id)knownCompatibleVariantTypeIdentifierForTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16[0] = *MEMORY[0x1E0CEC698];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11) & 1) != 0)
        {
          objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  char v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  id v47;
  void *v48;
  NSObject *v49;
  char v50;
  void *v51;
  id *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  id v60;
  id *v62;
  void *v63;
  int v64;
  id v65;
  char v66;
  void *v67;
  void *v68;
  id *v69;
  os_signpost_id_t spid;
  unint64_t v71;
  NSObject *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v6 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = a5;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHInternalAssetExportRequest.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    a5 = v62;
  }
  objc_msgSend((id)objc_opt_class(), "assetExportLog");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  v71 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    objc_msgSend(v9, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v79 = v14;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SharingVariantsLatency", "localIdentifier==%{public}@", buf, 0xCu);

  }
  spid = v11;
  v72 = v13;

  v77 = 0;
  +[PHResourceLocalAvailabilityRequest resourceInfoForSharingAsset:asUnmodifiedOriginal:error:](PHResourceLocalAvailabilityRequest, "resourceInfoForSharingAsset:asUnmodifiedOriginal:error:", v9, v6, &v77);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v77;
  PLPhotoKitGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v19;
      v80 = 2112;
      v81 = v15;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Determining variants for asset %{public}@ with resource info: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHResourceLocalAvailabilityRequestPhotoUTIKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v23 = v16;
      goto LABEL_29;
    }
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, &unk_1E3654EF8);
    objc_msgSend((id)objc_opt_class(), "knownCompatibleVariantTypeIdentifierForTypeIdentifier:", v18);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (id)v21;
      v23 = v16;
    }
    else
    {
      v24 = a5;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHResourceLocalAvailabilityRequestPhotoURLKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25
        || (objc_msgSend(MEMORY[0x1E0D47C50], "imageSourceForFileURL:", v25),
            (v28 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        PLPhotoKitGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v15;
          _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Coudn't find a valid image source to pre-flight, from resource info: %@", buf, 0xCu);
        }

        v23 = v16;
        goto LABEL_28;
      }
      v29 = v28;
      objc_msgSend(v28, "markLivePhotoPairingIdentifierAsCheckedWithValue:", *MEMORY[0x1E0D47DB8]);
      v75 = v16;
      v76 = 0;
      v68 = v29;
      v66 = _PreflightMediaConversion(v29, &v76, &v75);
      v22 = v76;
      v23 = v75;

      if ((v66 & 1) == 0)
      {
        PLPhotoKitGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v79 = v9;
          v80 = 2112;
          v81 = v23;
          _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Failed to find compatible UTI for asset: %@, error: %@", buf, 0x16u);
        }

        v20 = 0;
      }

      a5 = v24;
      if (!v22)
      {
LABEL_29:
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHResourceLocalAvailabilityRequestVideoUTIKey"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          v27 = v71;
          goto LABEL_62;
        }
        if (objc_msgSend(v9, "canPlayLoopingVideo"))
          v33 = objc_msgSend(v9, "isMediaSubtype:", 8) & v6 ^ 1;
        else
          LOBYTE(v33) = 0;
        v34 = objc_msgSend(v9, "playbackStyle");
        if ((v33 & 1) == 0 && v34 != 4)
        {
LABEL_58:
          v27 = v71;
          v50 = v33 ^ 1;
          if (v23)
            v50 = 1;
          if ((v50 & 1) == 0)
          {
            objc_msgSend((id)*MEMORY[0x1E0CEC4F8], "identifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v51, &unk_1E3654F28);

            goto LABEL_63;
          }
LABEL_62:
          if (v23)
          {
LABEL_71:

            v16 = v23;
            goto LABEL_72;
          }
LABEL_63:
          v52 = a5;
          v53 = objc_msgSend(v20, "count");
          PLPhotoKitGetLog();
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v54;
          if (v53)
          {
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v9, "uuid");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v79 = v20;
              v80 = 2112;
              v81 = v56;
              _os_log_impl(&dword_1991EC000, v55, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Found variants: %{public}@ for asset %@", buf, 0x16u);

            }
            v23 = 0;
          }
          else
          {
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "uuid");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v79 = v57;
              _os_log_impl(&dword_1991EC000, v55, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Found no variants for asset %@", buf, 0xCu);

            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("No variants found for asset: %@"), v9);
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          a5 = v52;
          goto LABEL_71;
        }
        v69 = a5;
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, &unk_1E3654EF8);
        if (objc_msgSend(v9, "playbackStyle") == 4)
        {
          v35 = (void *)*MEMORY[0x1E0CEC5B0];
          objc_msgSend((id)*MEMORY[0x1E0CEC5B0], "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v32, "isEqualToString:", v36);

          if (v37)
          {
            objc_msgSend(v9, "fetchPropertySetsIfNeeded");
            objc_msgSend(v9, "photosInfoPanelExtendedProperties");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "codec");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0D71650], "HEVCfourCharCode");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v39;
            LODWORD(v39) = objc_msgSend(v39, "isEqualToString:", v40);

            if (!(_DWORD)v39)
            {
              a5 = v69;
LABEL_57:

              goto LABEL_58;
            }
            objc_msgSend(v35, "identifier");
            v41 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v41, &unk_1E3654F10);
            goto LABEL_50;
          }
          objc_msgSend((id)*MEMORY[0x1E0CEC558], "identifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v32, "isEqualToString:", v42);

          if ((v43 & 1) != 0)
          {
            a5 = v69;
            goto LABEL_58;
          }
        }
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PHResourceLocalAvailabilityRequestVideoURLKey"));
        v44 = objc_claimAutoreleasedReturnValue();
        v67 = (void *)v44;
        if (v44)
        {
          objc_msgSend(MEMORY[0x1E0D47C50], "videoSourceForFileURL:", v44);
          v45 = objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            v41 = v45;
            -[NSObject markLivePhotoPairingIdentifierAsCheckedWithValue:](v45, "markLivePhotoPairingIdentifierAsCheckedWithValue:", *MEMORY[0x1E0D47DB8]);
            v73 = v23;
            v74 = 0;
            v64 = _PreflightMediaConversion(v41, &v74, &v73);
            v46 = v74;
            v47 = v73;

            if (v64)
            {
              v48 = v46;
              if (v46)
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v46, &unk_1E3654F10);
              a5 = v69;
            }
            else
            {
              v65 = v46;
              PLPhotoKitGetLog();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v79 = v9;
                v80 = 2112;
                v81 = v47;
                _os_log_impl(&dword_1991EC000, v49, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Failed to find compatible UTI for asset: %@, error: %@", buf, 0x16u);
              }

              v20 = 0;
              a5 = v69;
              v48 = v65;
            }

            goto LABEL_56;
          }
        }
        PLPhotoKitGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v15;
          _os_log_impl(&dword_1991EC000, v41, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Coudn't find a valid video source to pre-flight, from resource info: %@", buf, 0xCu);
        }
LABEL_50:
        v47 = v23;
        a5 = v69;
LABEL_56:

        v23 = v47;
        goto LABEL_57;
      }
    }
    v24 = a5;
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, &unk_1E3654F10);
    v25 = v22;
LABEL_28:

    a5 = v24;
    goto LABEL_29;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v79 = v26;
    v80 = 2112;
    v81 = v16;
    _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Failed to find resource info for asset %{public}@, error: %@", buf, 0x16u);

  }
  v20 = 0;
  v27 = v11 - 1;
LABEL_72:

  if (a5 && v16)
    *a5 = objc_retainAutorelease(v16);
  v58 = v72;
  v59 = v58;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v59, OS_SIGNPOST_INTERVAL_END, spid, "SharingVariantsLatency", ", buf, 2u);
  }

  v60 = v20;
  return v60;
}

+ (id)exportRequestForAsset:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "exportRequestForAsset:variants:error:", a3, 0, a4);
}

+ (id)exportRequestForAsset:(id)a3 variants:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PHResourceLocalAvailabilityRequest *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
LABEL_3:
      v12 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHInternalAssetExportRequest.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v11)
      goto LABEL_3;
  }
  v20 = 0;
  objc_msgSend((id)objc_opt_class(), "variantsForAsset:asUnmodifiedOriginal:error:", v9, 0, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
LABEL_6:
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "becomeCurrentWithPendingUnitCount:", 100);
    v15 = -[PHResourceLocalAvailabilityRequest initWithAsset:requestType:]([PHResourceLocalAvailabilityRequest alloc], "initWithAsset:requestType:", v9, 1);
    objc_msgSend(v14, "resignCurrent");
    v16 = -[PHInternalAssetExportRequest _initWithAsset:variants:resourceRetrievalRequest:retrievalRequestProgressParent:]([PHInternalAssetExportRequest alloc], "_initWithAsset:variants:resourceRetrievalRequest:retrievalRequestProgressParent:", v9, v11, v15, v14);
    PLPhotoKitGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v16;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEBUG, "[PHInternalAssetExportRequest] Created export request: %@ for asset: %@", buf, 0x16u);
    }

  }
  else
  {
    PLPhotoKitGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Failed to create export request for asset: %@, error: %@", buf, 0x16u);
    }

    v16 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v16;
}

@end
